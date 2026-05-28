Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B732E7372
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982130; cv=none; b=o4UCMF7xiqdeA9VGMAlOlkI62COBd8leC/vg781j9H5D66n/NtJ6Hikqqi1NrjdqVnA0GPP7e2NBjOJUS79Hr1J8koR+oZw5yfCrgJEyiWBpOA1tPXNo8G9Dz0kPzMKey5JUpf014r4QYNX8jrw9YjhfXnxUHlJnWOa31JpDtnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982130; c=relaxed/simple;
	bh=itYpk8TQQBzAVnejejbOWw5vZQdElzT7wg3lhF7DYOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mjTORVkZBhyto3Ov/Iq35P43zvL/tdkn6sfSMimFkVO/AQd4qKr7+nFZTu3256IxmuNch4cjf49uavO2wxGjud9M53RITJ2Pq41c7mzigJ23RhBfYyymCrZ0AX5vAbXVHmHIrvOLT57nlRQyTb3DOgEq15RiK1IxQz3uaxCwbHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLv1Dv7a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLv1Dv7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2953C1F000E9;
	Thu, 28 May 2026 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779982130;
	bh=ooHyoQj9Mkmyfymwoy6z2iC9BRmTXubXlM4ajQiL9eI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GLv1Dv7aT+PId8H28h0HvhGeQz9mRnk1c2iukaxLgwDd1yJjJhVu4TOGzfvPit+zM
	 /XHNTju8GVNv3UkXIeGX2oY3pI/yYu4gi/YpHznPQSFQ+UdeX0+xEjnT9gEkAvuLDC
	 fi3Gzg78zQwT/gIICssGDbuNwee3zAJ9anrB4NQCFEPkb1UMNljcjdHGftgoICr8/J
	 g8XAlxHabT4TliUIPYsQgJl0xk4bVxflFGnB9Lx3eAinqQfZRKoRAwzwyp3E9xyZWm
	 ELI0LQBj8EY1oF+43LW6zVYKthCtn9RdUybY9Igh58Wq6qmEzUmc4XzsWiHPDhqeUw
	 NgNpshog9Q3gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] mfd: lm3533: Set DMA mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528135123.103745-5-clamor95@gmail.com>
References: <20260528135123.103745-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 15:28:49 +0000
Message-Id: <20260528152850.2953C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `lm3533_cells` array is allocated on the stack without being z=
ero-initialized, and an unconditional `count++` leads to uninitialized elem=
ents being passed to the MFD core, risking memory corruption or kernel pani=
cs.
- [Medium] An off-by-one error in the validation of the backlight `reg` pro=
perty allows it to overlap with the LED `reg` address space.
--

commit e3db8e2c46ac0e3ca30554a0b5ae2956e28c6227
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: lm3533: Set DMA mask

Missing coherent_dma_mask assigning triggers a warning in dmesg. This sets
coherent_dma_mask to zero because both the core and cells do not utilize
dma.

> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index 519f8c16a3f35..3cfdebf5fb52b 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c
> @@ -526,6 +526,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
>  				   LM3533_BOOST_FREQ_MAX);
>  	lm3533->boost_freq =3D lm3533->boost_freq / (500 * KILO) - 1;
> =20
> +	/* LM3533 and child devices do not use DMA */
> +	i2c->dev.coherent_dma_mask =3D 0;
> +	i2c->dev.dma_mask =3D &i2c->dev.coherent_dma_mask;
> +
>  	return lm3533_device_init(lm3533);

[Severity: High]
Does this call to lm3533_device_init() pass uninitialized elements to the m=
fd
core?  Looking at lm3533_device_init(), the lm3533_cells array is allocated
on the stack without zero-initialization.

If a child node is present in the device tree that does not match any of the
recognized compatible strings, the iteration loop skips the initialization
blocks but still unconditionally executes count++, leaving the array element
with stack garbage:

drivers/mfd/lm3533-core.c:lm3533_device_init() {
    struct mfd_cell lm3533_cells[LM3533_CELLS_MAX];
    u32 count =3D 0, reg;
    ...
    device_for_each_child_node_scoped(lm3533->dev, child) {
        if (!fwnode_device_is_available(child))
            continue;

        if (count >=3D LM3533_CELLS_MAX)
            break;

        if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
            ...
        }
        if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
            ...
        }
        if (fwnode_device_is_compatible(child, "ti,lm3533-leds")) {
            ...
        }

        count++;
    }
    ...
    ret =3D mfd_add_devices(dev, 0, lm3533_cells, count, NULL, 0, NULL);
}

When this array is passed to mfd_add_devices(), the mfd core will attempt to
dereference a garbage pointer for the device name.  Can this cause memory
corruption or a kernel panic?


[Severity: Medium]
Can an invalid backlight reg value overlap with the LED reg address space?
Looking at lm3533_device_init(), the validation allows reg =3D 2 to be acce=
pted
for a backlight:

drivers/mfd/lm3533-core.c:lm3533_device_init() {
        ...
        if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
            ret =3D fwnode_property_read_u32(child, "reg", &reg);
            if (ret || reg > LM3533_HVLED_ID_MAX) {
                dev_err(dev, "invalid backlight reg %d\n", reg);
                continue;
            }
        ...
}

LM3533_HVLED_ID_MAX is 2.  This incorrectly allows reg =3D 2 to be accepted=
 for
a backlight, assigning it an ID of 2, even though the backlight driver only
supports 2 control banks (IDs 0 and 1).

While the backlight child driver safely returns -EINVAL during probe when it
encounters ID 2, should this check be reg >=3D LM3533_HVLED_ID_MAX to reject
invalid device tree configurations early in the core driver?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528135123.1037=
45-1-clamor95@gmail.com?part=3D4
