Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3109286D4D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376868; cv=none; b=MKFgQLkOP9s6MJNa+0SBX+qHug7Kf+LTgTii5Lts/Sj4fKTXo5l9X5eO9zNBSjdsbRg+pFNXjsrATvPcXo7G4/NIFEno5l0ZkNJxidH3qo9uK4Si8gZXKr6H5woKBE1oZqinHH/amE0whvAxBDM098JVJQDqNpt35Rvl8ZmbEt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376868; c=relaxed/simple;
	bh=OmsXcAkKOvYXas1kR4J24UYv0QJ/y/GJAAKgPXb5hwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SIfQ66aFeQl+yiH8NbE+aZuBVA1jCvDpPmbcrwmAVDThpvuAVpEsh70oTm6K4NydY2XoUXGHwVMjXpSNFohCSu+kIt86mF8rcP5YL28UyqZJ0A4t5/Hjbf86vMTq55d6nH9cq3+1OLXQpE7ce34r/vF9S3okED0OTia3aVwAUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nL+n45wi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nL+n45wi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B6E1F000FF;
	Mon, 14 Sep 2026 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789376866;
	bh=6mSqZk8j4PmcrbuDvZ4mTCSDfKR5btI3gNHgLFSKmU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nL+n45wixSaHCLUVPjtbmhNeXnLQbPs4sMi5Ree/eL13z6zTnsFQ4g3U26t+W56sj
	 +Yr+n6wUa5ivNj5NL6d43XILsYfDL4GAcSVyIKFHTPIHfeTLkNxNTABw7nPuHwwfff
	 KcGdZ9+smMaDRi4rupUJ7YFlqwx9wULZTs30Nrmoze1FGRo3aZMKoUzPzSByXM1fgz
	 IpAbi2b+COOp9e3Nsy4wSxzSoLl6sD27eeR6YkOMWU/tV02y1Gha0UwgxpfY0/9y6t
	 sZ439JCiRy/5bdFpSKW5MZ0gO0LFjwx1ah/H7gdCW4SghO+ejdSv5qcrzM0CtRBqQE
	 qYCbg+PwK18Xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Barzilai" <amit.barzilai22@gmail.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914085931.66857-2-amit.barzilai22@gmail.com>
References: <20260914085931.66857-1-amit.barzilai22@gmail.com>
 <20260914085931.66857-2-amit.barzilai22@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:07:45 +0000
Message-Id: <20260914090746.52B6E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding schema omits default values for `solomon,width` and `so=
lomon,height`.
--

commit d69921d470fb48f9128b8539591beb3d33f26088
Author: Amit Barzilai <amit.barzilai22@gmail.com>

dt-bindings: display: Add Solomon SSD1351 OLED controller

This commit adds a device tree binding for the Solomon SSD1351 RGB OLED
display controller. It builds upon the shared solomon,ssd-common.yaml
properties.

> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
> new file mode 100644
> index 0000000000000..80850c2ab5b3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
[ ... ]
> +allOf:
> +  - $ref: solomon,ssd-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - solomon,ssd1351

[Severity: Low]
Does this properties block need to define solomon,width and solomon,height
with default constraints?

The SSD1351 controller is 128x128 according to the commit message. Since th=
is
binding includes solomon,ssd-common.yaml, validation of a device tree node
for solomon,ssd1351 without explicit width and height properties will not
populate or document the default values in the schema output.

Adding these properties here with a default constraint of 128 would match t=
he
hardware specs and maintain subsystem consistency.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914085931.6685=
7-1-amit.barzilai22@gmail.com?part=3D1
