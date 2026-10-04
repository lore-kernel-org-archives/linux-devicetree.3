Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B041131E824
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095129; cv=none; b=uEu8awhR3xn9TgnE+q4cCzVwwh8KZQZHzJr9FGucfRLVVJoUXZaGPzoiZXtvt5UZiM1JE7rGJxcySf7B3YvdYhvzKwMdHJ5TZEF9HuUVktBpA9s7VoesJU26qPbj6e6n69s/2stpQeoTuP9EHcF6CTg91zgWTJthjY53QqAgi6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095129; c=relaxed/simple;
	bh=oTZEHENKfvYru0nCmyWlWT2WYaBSJ+iuYl3sWZyWfAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cWX2gtMEJS/IIf+/lYcOMDi+XL1vJAhntJY/KovOKamDtTjDDGCpJS/+u61xqWujNAQuHeucuzxIUooTtYJcOprwC5hvcfLaAsYXvxC9eqLgBICEi/1nEQt9b7MNz4uDau13nivdY4DNclL9OrHo3UDcFli+8dOIaxsSYdTgm1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IS6CUf7v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IS6CUf7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A93D1F000FF;
	Sun,  4 Oct 2026 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791095128;
	bh=0I4PQG5zX9Uc4QHIPQASkuUHyesNrJTDc6w0NyMpzN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IS6CUf7v7kdNlqT+P+/71sgWroHm2FQhVl8k2cyZH8Xq50MyXG74y5vLNa3mXL2wG
	 kpE2v36oAi0PXXQptg5a4Ql7NG5QvtscJSSkW1cplU3a2bPOyOFJZPOV0UAUfQIwEM
	 +v28AT2S1rBqARTCJcS+2lA9TWHqcUrp5RjfqGrLz4aMeKUIbsKlntzJTWXfag9RXs
	 AOPqpEofDSc0qeRE82CsQlDkzHp80E+7b3SKY/kOSwCG1ekuT3HfUaoslbQaWLKzrj
	 D8MBqHFubjQS0MNEnHXvAdE++FMXOHYrlm9GqQP4nMcixYuN9w61yJPG/QtzD68+Gw
	 YM3APqSxKNfog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/21] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261004-macaudio-v2-12-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-12-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 06:25:27 +0000
Message-Id: <20261004062528.0A93D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: apple: missing driver binding for ti,tas5770l codec
--

commit e9c4bfa294ab34a3256cffd555e149932dd05469
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j293: Add speaker/headset jack nodes

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/d=
ts/apple/t8103-j293.dts
> index 1d074b9e60183..42f1127151fa7 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
[ ... ]
> @@ -133,5 +133,116 @@ &displaydfr_dart {
>  	status =3D "okay";
>  };
> =20
> +/* Audio codecs */
> +&i2c1 {
> +	status =3D "okay";
> +
> +	speaker_left_rear: codec@31 {
> +		compatible =3D "ti,tas5770l";

[Severity: Medium]
Will this device node successfully bind to a driver?

This declares a compatible string that lacks driver support in the kernel,
and has no fallback. Looking at the codec driver's OF match table in
sound/soc/codecs/tas2770.c:

static const struct of_device_id tas2770_of_match[] =3D {
	{ .compatible =3D "ti,tas2770" },
	{},
};

The match table does not include ti,tas5770l, causing binding to fail. As a
result, the ASoC sound card apple,j293-macaudio will indefinitely defer
probing because no codec driver binds to the ti,tas5770l I2C devices,
leaving the machine without sound.

Could the codec driver be updated to match this compatible string, or
should a fallback compatible string be added here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-macaudio-v=
2-0-7b47ed6335a8@gmail.com?part=3D12
