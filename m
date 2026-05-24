Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A882F7EE7
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652968; cv=none; b=FPH9NUZYLxoj3BxVufpEZ1xIwtvARBWcfxiACVBhQ8OE7dSxDYugFED5tpDw/vrAGY0XXO2AK725Jh/gg+ZxoQKOzhabOdmLS3bMUFOVdzssGO39yubsz+MOkNzy1zo9PQd1bky5vehYEEslkSZVRi1JlbTKRUx0OHxYdyIN6GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652968; c=relaxed/simple;
	bh=GYnZXgKpm4yP6ioE0RZRxF8CgtjOTTVZEguklDR7qDM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mz31g5GgBVaPghxibsu0BP/werr0pnmcdKgmfypfTck5RSjIPxj0OuRYggWlQ2hL3MhmhP3ASBiczWVXw4qxF3mUTpkhU0C9G1w8gi5tjexUtoH/Jt+V4vGb26So9XXTsbLJ3zxHxRugtHjA+YH0yXkK+Jrmm0EwnLFo6wkQ6hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TF/SPIhz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TF/SPIhz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F1B1F000E9;
	Sun, 24 May 2026 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779652966;
	bh=447Rw/9/lxLRhVu6t6HTnyKbcG1yqNAU4RBO1Xs+YEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TF/SPIhzGx289NsBCjUfCIPSGXZBpKm7jpxqQ/4W5ongyWhGpSh5R/1VkVakT1JNO
	 BkIG9FCNRDHM0LF7h24zFbIplhoZvcHkO/xmZl3PXuXygZ2HxUcPGwIDhuNjuZzx73
	 X+JrsAMYnqWggW9Wb2+mPYe439KadpBHX3pUKLXY5VFRjZKISLKBL6Cy18yBZYQ/zG
	 3DqKLi5ET9/TLGBnoQR1IZkB3FTcAL/inJqB4PUP9s5Z1EUeSiIjIYQ/uDwu55fPvK
	 OLsbTa3mEpbUuhJNoh2m2ANNO6/O+iOjbUqCkcJHRWgivIzglUdAP1Eb5x2STyk4HJ
	 a1qp9knsIu39Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260524195318.112398-1-manishbaing2789@gmail.com>
References: <20260524195318.112398-1-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 20:02:45 +0000
Message-Id: <20260524200246.33F1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML schema conversion incorrectly modifies the list of requ=
ired properties compared to the original text binding by omitting `ac97-gpi=
os` and adding `clocks` and `clock-names` without justification.
--

commit 78a24354563be69b55ed4c3cb505afc48e0f2156
Author: Manish Baing <manishbaing2789@gmail.com>

ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
   =20
Convert the Atmel AC97 controller binding from text format to YAML schema.

> diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac=
97c.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.=
yaml
> new file mode 100644
> index 0000000000000..5f4ebe81bf907
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names

[Severity: Medium]
Are clocks and clock-names strictly required now, and is the omission of
ac97-gpios intentional?

The original text binding listed ac97-gpios under the required properties
section, but did not document clocks or clock-names as required. Altering
binding constraints during a text-to-YAML conversion without explaining the
changes in the commit message can cause dtbs_check to fail for existing
device trees or weaken validation.

Could the commit message be updated to explain these constraint changes, or
should the required list be adjusted to match the original text binding?

> diff --git a/Documentation/devicetree/bindings/sound/atmel_ac97c.txt b/Do=
cumentation/devicetree/bindings/sound/atmel_ac97c.txt
> deleted file mode 100644
> index b151bd902ce3d..0000000000000
> --- a/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -* Atmel AC97 controller
> -
> -Required properties:
> -  - compatible: "atmel,at91sam9263-ac97c"
> -  - reg: Address and length of the register set for the device
> -  - interrupts: Should contain AC97 interrupt
> -  - ac97-gpios: Please refer to soc-ac97link.txt, only ac97-reset is used

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524195318.1123=
98-1-manishbaing2789@gmail.com?part=3D1
