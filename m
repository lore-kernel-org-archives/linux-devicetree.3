Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D341FFC48
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786669791; cv=none; b=EHEnHLSu+ZDYonMrN47sQTJmtPqACFZbzNLtWXJNtzuwUBfGfsQ+4yBocFWm2Lg+VX9cz2jZO+h2Khg1r4+bcnHiE5u566AbQD2EXBoOqDwV0Zkdud9Q0BAOEdP2xO6rKvVv33zOTs/ki48y43E4vOycivd5JStO4CXrxOAXRTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786669791; c=relaxed/simple;
	bh=iqlngVqr/MvECJI+kcuSDuxgV3LZEW8m8N64vIeGmHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LMzDlZCFRwYS22n49hpZbVqUZ2FOWG1+n7Dmu8DRVtfAp6Nlse5bbKqoJMfzxZcULNkSEjC4cxUJwDotVAKS3gMq1aPHi6RvL7aL2DTIEPTMhFACdhF6Cjf9FrSupMtFk8+zgRoriXewKb7lFd9r1iWSajA+JZFVyFbP2UJkPGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJhOD5HI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJhOD5HI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051261F000E9;
	Fri, 14 Aug 2026 01:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786669790;
	bh=MYcN+iQTdCA8MEfQjzJIX78KBdh9gRDiy2q8IieLfHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DJhOD5HIkwwr2EE6+Tbw1QmmUU/iBIxLx+YYWQqkcxdSqz9cyWr+sWBKKQZFk0JX3
	 /JnYEcGF5wFg/QjhVG2wmKr2bbgWZ4L0SKxdGerHdjkAoQ0cSK5pVrD8IMAwgOvktd
	 8tlaE8UXxwqBJgyjeK4ZqZeSuAImCOiBxMFSS+gfze481kJiy4GsXDsIHXsfqW0Xel
	 T1mbj44MvoNZMNEL5PVgVwiFP+P5e2Zw4BeMK+V6w6J9zvPnfTzcjAy+j/Iuciw9uU
	 67pHxyLX1tOPJJe0fCwisWYVRozy9Cgnax1wJHEHZIxAnSY9/bpAnfr0kxtl9aGx3c
	 Ng0UY1Q7vSA5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of: property: add i2c-parent to fw_devlink supplier
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai>
References: <20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 01:09:49 +0000
Message-Id: <20260814010950.051261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] fw_devlink incorrectly parses I2C slave addresses as phandles due =
to 0-cell supplier binding definition for `i2c-parent`.
--

--- Patch [1]: [PATCH] of: property: add i2c-parent to fw_devlink supplier =
bindings ---
commit 85f34a66eac871d9e36bccb6795b94b17ab065d4
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: property: add i2c-parent to fw_devlink supplier bindings

This commit teaches fw_devlink about i2c-parent so the core creates the
corresponding device links. This ensures consumers are unbound before the
parent adapter's device, removing the need for -EPROBE_DEFER.

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1409,6 +1409,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
>  DEFINE_SIMPLE_PROP(leds, "leds", NULL)
>  DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
>  DEFINE_SIMPLE_PROP(panel, "panel", NULL)
> +DEFINE_SIMPLE_PROP(i2c_parent, "i2c-parent", NULL)

[Severity: High]
Will this correctly handle device tree bindings where the i2c-parent
property includes a slave address argument?

For example, platforms using devices like the Toshiba TC9563 PCIe switch
might use a property such as: i2c-parent =3D <&qup_i2c 0x77>;

By passing NULL as the cells argument to DEFINE_SIMPLE_PROP(), the parser
assumes a 0-cell list. When fw_devlink iterates over the property, it finds
the first phandle correctly, but won't it erroneously interpret the slave
address argument (0x77 / 119) as a second, independent 0-cell phandle?

If another unrelated device tree node happens to match this phandle ID,
could this cause fw_devlink to link the consumer to the wrong device,
potentially leading to spurious probe deferrals or circular dependencies?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-b4-of-prop=
erty-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai?part=3D1
