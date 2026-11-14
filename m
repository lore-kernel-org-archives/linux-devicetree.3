Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649409;
	b=DFC/Yd7Jt9psIERcDRhKji3Y5Ui6/wZWvSJCneU1U24cA5KChrMcnQ3n6vFF1bv2O0Y5
	 dpnHoKI4abLEZogIBbAYv3BLhnCxILcM5VWW1h3PZMNUibQoxn5QmKvPQRSiR7ymo9CNZ
	 3MWZdtI5XL/03J+MoA7xjW7/DjPjw11MfiG1XpvnGchf/nrp0HUtrWtA3Oj7vIUvp9Shp
	 7aQa/U5QmI58VVfRq8yOIbDPuDvY8cmpmW2fyXoii5cwfplzQzQlSOGKLYDRiEGOqe94Q
	 +44Kx07XTGjAu+Id4+9uPfuOBeQB+tgUVaAONdz3BZMvQqPh1FD3/Ht34LSS2ylGflw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649409;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QKoeYA8NjhRcil8/GX8qB5N91N+EQFpzcwu1b5Kz3uA=;
	b=tX1HzhRhUIgruSeE0i+BAJ1ltXPR4xputD9LiikWOuUqMscgvc6GoBFXMMa2bMo/9UTp
	 vIFYI6Ysl+EZvHSfElSwqofa9ONON5/dz2ZYSkD8tvFtj5g2pKfKIIP+n/WbSncx3rtQ6
	 W4BG+zHNbTgMz6uMLda/+GDcfxRL8Gdd5mO44rXTArUmlbhqI+j3d7eHaR5N8kchu7XQd
	 0Lu8izaF4arAcO9n4XSrXUCx9tyCGuFXpI2DNKq/+Pgs051Zi2tGwAcvuFgaJL2Cf8Tu5
	 JX1qCIEPVULPYXdliRtYRkJZUurASgx99VhZsMF1zcz2Jud5+VuLJ1c2YGulGDfEC7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UuW42C5y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FEF606A330
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UuW42C5y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160261F000C4;
	Sat, 14 Nov 2026 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794649409;
	bh=QKoeYA8NjhRcil8/GX8qB5N91N+EQFpzcwu1b5Kz3uA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UuW42C5ySnR+rKEUDxFC6Q3yBXoABTjZoJ6u4bWBCY/YzBZk0MM0Hu3mI7bPvRYmj
	 FLT3rOqU+DWpc98x/XnNxmV9B9ekD727nwsIT3n0LaxK1L9RxUaKZM+r9C7K7sqit4
	 w8dbjWZaqPL8qqi9UWhXh/egfTg/A6HdHHXGyOBYI6I1YB3wowr8ixlbpkGamxXWuV
	 dX63Ej87974PQYC2OFZkjXKTg/J0ADJGNFD7PKL8SwbvYm7bO1PUJ7h5cbT7Mg/TT6
	 BjgyEceIUcGJ3MAY2KQDijpWhLGckyMjcfUpuc3SCtg+uv3k8aGIXFgOKgdsbhPzcC
	 muqN+NrpLvpfQ==
Message-ID: <sashiko-outbox-214332@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco-arduino-monza: Add
 Waveshare 8" DSI touch overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114-monza_waveshare_dtso-v2-1-d35703f59832@oss.qualcomm.com>
References: <20261114-monza_waveshare_dtso-v2-1-d35703f59832@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 09:43:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: Makefile: monaco-el2.dtbo applied to non-EL2
  Waveshare DTB
--

commit fb42e57888d978dabeca7a2682d11658ae75d3e6
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8" DSI touch overlay

This commit adds a device tree overlay to support the Waveshare 8" DSI
TOUCH-A display and touchscreen on the Qualcomm Monaco Arduino Monza
platform via the JMEDIA carrier card.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 8329c06b60a3f..331ae62494e57 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -83,6 +83,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D monaco-arduino-monza.dtb
>  monaco-arduino-monza-el2-dtbs	:=3D monaco-arduino-monza.dtb monaco-el2.d=
tbo
> =20
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D monaco-arduino-monza-el2.dtb
> +
> +monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs	:=3D monaco-arduino-mo=
nza.dtb monaco-el2.dtbo monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D monaco-arduino-monza-waveshare-8-dsi-touch-=
a.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D monaco-arduino-monza-waveshare-8-dsi-touch-=
a.dtbo

[Severity: High]
Should monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs omit
monaco-el2.dtbo?

monaco-arduino-monza.dtb boots at EL1 under the Gunyah hypervisor by
default, whereas monaco-el2.dtbo is only for the explicit -el2 target.
Merging monaco-el2.dtbo into the non-EL2 composite DTB disables
gpu_zap_shader and iris and attaches EL2-only apps_smmu IOMMU stream
mappings to remoteproc_adsp, remoteproc_cdsp, and remoteproc_gpdsp:

arch/arm64/boot/dts/qcom/monaco-el2.dtso:
&gpu_zap_shader {
	status =3D "disabled";
};

&iris {
	status =3D "disabled";
};

&remoteproc_adsp {
	iommus =3D <&apps_smmu 0x2000 0x0>;
};

When booting monaco-arduino-monza-waveshare-8-dsi-touch-a.dtb in the
default EL1 mode, GPU zap shader loading and Iris video acceleration are
disabled and the direct IOMMU mappings on the remoteprocs conflict with
Gunyah PAS management.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-monza_wave=
share_dtso-v2-1-d35703f59832@oss.qualcomm.com?part=3D1
