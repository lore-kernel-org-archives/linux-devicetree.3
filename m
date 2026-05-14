Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D2517A2EA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778734636; cv=none; b=r28oLNTUi1bzk2y0q4IZMd1oCsAaYO79TUS3YK3ZIvJezZvnXuO3zS5ef9F7MdWQ0EJcvRaoxqkRlaqRuvaUEyQDH/cveaS5v3jkxjmnH1pfSabBqoIP4Nqrmf9JvleH4jDuJ1/NL5Kqd0BFmTaH88Noav9fCA1uIZ1cWTnt3As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778734636; c=relaxed/simple;
	bh=3M4jATqlwPqho9sIYkBqwFQF480Pe60+azb9sYqQX+k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H0IZb6q5vX5sVE0VH9Kpqr1GuEghF6/hCBNaQTuLljSf3FHC6F2yVkyw+ip2smJqABPExaQAbYauNrpm3qo/EsXFD3mZzssZcWyIUYQuP9dPR1TlzVbf6bZtduZ1t6Z3fxzh3mlm2ZScWkAnaXWksySg6CxUtHPR9L0KnT3xuwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WS255cXF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WS255cXF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22CCC2BCB7;
	Thu, 14 May 2026 04:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778734636;
	bh=3M4jATqlwPqho9sIYkBqwFQF480Pe60+azb9sYqQX+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WS255cXFcCGW+GWtFHscGLMz0bq0svGIw9Ia2vPWbsiux+iuFhDoU6NjnydQqLE/l
	 vWGCL90ueZT1lZh/cg/3+/QbtSK98GFeHM8yAUKZqOyE9dR7jP+Js5fJd9d6YRHWW8
	 JPKzoJPyd5NBregSOnPz6dnFGm4I98yyR8tjzsS7cxZPG1U9IVBY5NqVlYI7PJ2Vb3
	 L01yZMe2INUCZJ/Ks61VEBEMrY+Vbh6l5L9AFnoUbBeVvLyftZaBs4V8kRd0pVtcuG
	 Lkdabv8gHN0vyfCDkgngX/TI6DZEEe8jmI4+aHMPplZed8MznCU9/f47M7KSHKRvJc
	 jXxjpnqAMuTYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260513-iris-sc8280xp-v6-3-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-3-0d11d90d3e26@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 04:57:15 +0000
Message-Id: <20260514045715.E22CCC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The Venus/Iris driver ignores the `mmcx` power domain, failing to =
vote for its performance states which will cause MMCX under-voltage and AXI=
 bus hangs at high clock speeds.
- [Low] The `power-domains` property in the `video-codec` node has 4 items,=
 but the YAML binding `qcom,sm8250-venus.yaml` restricts it to a maximum of=
 3 items.
- [Low] The reserved memory node name 'pil_video_region@86700000' uses unde=
rscores instead of hyphens.
--

commit 436af127f4d0421fee1976f98a2eab9818c98aa4
Author: Konrad Dybcio <konradybcio@kernel.org>

arm64: dts: qcom: sc8280xp: Add Iris core

Add the required nodes to enable Iris core on SC8280XP.

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/q=
com/sc8280xp.dtsi
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
[ ... ]
@@ -691,6 +694,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
=20
> +		pil_video_mem: pil_video_region@86700000 {
> +			reg =3D <0 0x86700000 0 0x500000>;
> +			no-map;
> +		};
> +

This isn't a bug, but device tree conventions expect node names to use hyph=
ens
instead of underscores. Should pil_video_region@86700000 be renamed to
pil-video-region@86700000 to avoid dtc W=3D1 warnings?

[ ... ]
@@ -4181,6 +4189,97 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
=20
> +		iris: video-codec@aa00000 {
> +			compatible =3D "qcom,sc8280xp-iris", "qcom,sm8250-venus";
> +			reg =3D <0x0 0x0aa00000 0x0 0x100000>;
> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]
> +			power-domains =3D <&videocc MVS0C_GDSC>,
> +					<&videocc MVS0_GDSC>,
> +					<&rpmhpd SC8280XP_MX>,
> +					<&rpmhpd SC8280XP_MMCX>;
> +			power-domain-names =3D "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";

Does the YAML binding for qcom,sm8250-venus support 4 power domains?

Without adding a conditional block for qcom,sc8280xp-iris, won't this fail
dtbs_check since the fallback schema restricts power-domains to a maximum
of 3 items (venus, vcodec0, mx)?

Additionally, since this falls back to qcom,sm8250-venus, will the Venus
driver properly attach and vote for the mmcx power domain?

The video codec driver using sm8250 data explicitly defines only mx as the
OPP power domain. As a result, devm_pm_domain_attach_list() might only
attach mx and ignore mmcx.

If mmcx is ignored by the driver, won't it remain permanently at the lowest
statically configured state? When the codec dynamically scales to higher
frequencies (e.g., 560MHz) requiring turbo_l1 for mmcx, could this lead to
hardware under-voltage and AXI bus lockups?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-iris-sc828=
0xp-v6-0-0d11d90d3e26@oss.qualcomm.com?part=3D3
