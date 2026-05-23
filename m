Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D781F2C11E2
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526042; cv=none; b=oPRBeHBts+wC6gn8v7+OHp3oNqoE7rtcPvqutowxqRrj4/0FKIIuqWSwLUB1M6kKHIJwLoMFmxbrkzr/kSdUxEuYfSvWQQmva5M89cq8xcfMPYr4DrEiMM3U/m5pkj8tccf1cavMR8Kt7BGRFt1F95RAsWuEkbTy9c3SF1Tmjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526042; c=relaxed/simple;
	bh=D6ocNxoANwuQmDHB/k6WeiFMIlv7v6w0RJ6wfDY7gtM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AC71PkLE7XxTcICA+b4Lh70aMvaxxQwaufgpyUXT0eaGaNGL2qWBLqh5JZd6D8yCFZ4TFxq6vq/GXI7FIwxYVruycSO92vnXm2M4j7Wpx3PFA/9Nr5AM4ezQrwvrOuLJ9VMuD5VF7ZPTpuqq3EZhQyeR1fiEdbAGraB5gJngtm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzzH7osr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzzH7osr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8ED1F000E9;
	Sat, 23 May 2026 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779526041;
	bh=PQQDPpVbcbrXc6lSQcUyXa0t4BA4LI74sgMNE5LdFfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HzzH7osr70oFZhvAtpMzu7KSfx20A/nIpaEFgsad4KYD2fsLz/8yO8i1sMEwleSzU
	 /YV/hfwnfCU9KB9eYDTXRxiZpQ4hAVFfpKQkuWjW7P6HLAUHR2lmyzknJmxPzZUy81
	 Ep7toE1BWfr+nQfm7SpehJlRDVE/WkSY9V40EyqhwBVf81lzWpdEoXZSk8zNKrPRbx
	 5HeQHk4HKPyacGin8KTaED3ADgaA2JF5Bervq3upqZN2lDbGIgtoFXvOj/Uz05WJ5I
	 AX12qGs+trX16dHfGAEXoBH6yWVspa2j+wFKnBRtPcro/usUNumLPuLJ49Avec+869
	 AeA8yIMIStxFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: chipidea,usb2-tegra: Document
 nvidia,external-control property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260523083013.46372-3-clamor95@gmail.com>
References: <20260523083013.46372-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 08:47:20 +0000
Message-Id: <20260523084721.4C8ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding `nvidia,external-control` to prevent the host from access=
ing the controller is an architectural anti-pattern that duplicates the pur=
pose of the standard `status` property and misattributes resource ownership.
--

commit ba773e6bd558f2861c226bd39627e8f4363d1a0d
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: usb: chipidea,usb2-tegra: Document nvidia,external-control pro=
perty

This commit documents the nvidia,external-control property for USB controll=
ers.
It indicates that the controller is configured externally, typically for a
modem requiring precise control over the USB bus in HSIC mode.

> diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.ya=
ml b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
> index 78046f8a63ad5..d99a18900b5a8 100644
> --- a/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
> +++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml
[ ... ]
> @@ -40,6 +40,13 @@ properties:
>      type: boolean
>      deprecated: true
> =20
> +  nvidia,external-control:
> +    description:
> +      Indicates that the controller is configured externally and that th=
e host
> +      should not attempt to access it. This is usually used by a modem t=
hat
> +      requires precise bus configuration.
> +    type: boolean
> +

[Severity: Medium]
Does this new property duplicate the purpose of the standard status property
and misattribute resource ownership?

Device tree is intended to describe hardware, not software workarounds. If
the hardware block is exclusively controlled by an external entity like a
modem and should not be accessed by the host OS, standard semantics general=
ly
dictate using status =3D "disabled" or status =3D "reserved".

If the modem relies on the host to provide shared resources like clocks or
resets to bring the bus up before enumeration, could those resources be
modeled via a power-sequencer or assigned directly to the modem hardware
node?=20

Modeling the resources this way might avoid using the USB controller node a=
s a
silent resource enabler, which would help keep the hardware description
decoupled from software policy.

>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523083013.4637=
2-1-clamor95@gmail.com?part=3D2
