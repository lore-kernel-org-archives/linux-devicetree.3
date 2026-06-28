Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F253285CBC
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782666914; cv=none; b=lUqMdmb6fs+VnrdlYEveKdiUv8K61VW2pfXzrFgi2MUypZnW+mk7ncabmpwGjvG60n1PR5BRcj5z6TlrQu30gRzLvy5Peht6zM8BF7UNw/P8qugCZ9jk/ybIpNDl5qSbwtFgsNZtM+EoL+da3xpumKB06U3LBmw2Y6lq02d4GD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782666914; c=relaxed/simple;
	bh=FftHzX3H0UlPJiDm12C8XDevWKILfdbOzut1acLUMcU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lwGNBDosQiKzl7UEGdh28CGJkyG0h6M0Bc1Bz3Q/9HcQRs8AFc3NIUbv51JOP2ORzBeBGBk7G4Tjg3yism8Wf7aU6YR5GJ4zbToe1N+xa29ljwAlki1CphnD6pqgU3XJzNJMn4aSaYBVvCLtnLaHUi9fgOWeiv1bzApwhAX2Rno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpOIITdY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpOIITdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9929A1F000E9;
	Sun, 28 Jun 2026 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782666912;
	bh=jbTcFVwnwa9YXNRRwKK4Ss5TJkGwUvhc8sGSVW9x6/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mpOIITdY8T5dVAHLFzwuGhZ/q9vc54UtghVZ681iIX/liGcvh/0QjpJ1Uf5kDE7r0
	 iWDpQS2AoV2jwupV2fAdaoNRQMtD+k+L81XAGzyvpyHcR9fZHQYSD7vDKD+eGEwsZQ
	 Ao2nzYSuXuPlX/TSGLSby1dSM5Nx6ECUv4UZdAAyFqHY78TlwWEcRFHkOYr7Ut1HH5
	 jmgyihVRSdFxckqQXbR6NNbCXhv+BvYJ+XXphAZJFwzbyKVKtwGle/ZO55RYFNwFAA
	 U9vlbKtsYIRkVf9WVt0BmPsqRUv7QeGPJAY0bCX61Ms+glbSbh/2FF9eGwqkdtiwMA
	 SJfDic7JPoXRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: ti: var-som-am62p: update audio
 codec configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <d59a4590cab14865f5caa5249c4c6ec7632f7d5f.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
 <d59a4590cab14865f5caa5249c4c6ec7632f7d5f.1782665899.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 17:15:12 +0000
Message-Id: <20260628171512.9929A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete device tree audio routing configuration for the new D=
MIC on IN1L.
--

commit 7dd222d83843c4dcd6d8e965ee097f2c019186e6
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: ti: var-som-am62p: update audio codec configuration

Update the WM8904 audio codec configuration on the VAR-SOM-AM62P.
Set the audio reference clock rate to 12 MHz and add the codec DRC, GPIO
and DMIC configuration required by the board.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/b=
oot/dts/ti/k3-am62p5-var-som.dtsi
> index be19cbaffc4b0..9440891339b3a 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi

[ ... ]

> @@ -204,6 +204,25 @@ wm8904: audio-codec@1a {
>  		DBVDD-supply =3D <&reg_3v3>;
>  		DCVDD-supply =3D <&reg_1v8>;
>  		MICVDD-supply =3D <&reg_1v8>;
> +		wlf,drc-cfg-names =3D "default", "peaklimiter", "tradition",
> +				    "soft", "music";
> +		/*
> +		 * Config registers per name, respectively:
> +		 * KNEE_IP =3D 0,   KNEE_OP =3D 0,     HI_COMP =3D 1,   LO_COMP =3D 1
> +		 * KNEE_IP =3D -24, KNEE_OP =3D -6,    HI_COMP =3D 1/4, LO_COMP =3D 1
> +		 * KNEE_IP =3D -42, KNEE_OP =3D -3,    HI_COMP =3D 0,   LO_COMP =3D 1
> +		 * KNEE_IP =3D -45, KNEE_OP =3D -9,    HI_COMP =3D 1/8, LO_COMP =3D 1
> +		 * KNEE_IP =3D -30, KNEE_OP =3D -10.5, HI_COMP =3D 1/4, LO_COMP =3D 1
> +		 */
> +		wlf,drc-cfg-regs =3D /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
> +				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
> +				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
> +				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
> +				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
> +		/* GPIO1 =3D DMIC_CLK, don't touch others */
> +		wlf,gpio-cfg =3D <0x0018>, <0xffff>, <0xffff>, <0xffff>;
> +		/* DMIC is connected to IN1L */
> +		wlf,in1l-as-dmicdat1;

[Severity: Medium]
Does this new DMIC configuration conflict with the existing simple-audio-ca=
rd
routing?

Earlier in the file, the ALSA DAPM audio routing maps IN1L to an external
analog microphone jack:

	sound {
		...
		simple-audio-card,routing =3D
			...
			"IN1L", "Microphone Jack",
			"IN1R", "Microphone Jack";

Since IN1L is now configured as a digital microphone (DMIC), should the rou=
ting
be updated so ALSA DAPM doesn't incorrectly couple the DMIC's power sequenc=
ing
and userspace representation with a physical analog jack widget?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782665899.gi=
t.stefano.r@variscite.com?part=3D2
