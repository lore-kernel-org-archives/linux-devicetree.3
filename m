Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F03388E50
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708959; cv=none; b=QovobJfg2pziAPo55Tl3pG8hSF6r6GUaLzmWMXu4VOlLXU4Kuel/FnypaBiQgo1dGzWobZvHRCGj7Cz2U4P2eYi9u+Tk7LOx/TGrptfsCRlKiv26JvkhRKHCxNvEY1XV0GhUTKzLSxFNA8Z3bjB5zzQcA4dybH/rGxQkNFwFi6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708959; c=relaxed/simple;
	bh=dfMOrU38MXovxDjpGMqkZ1S10kOT1MIogIWwoOzIb7c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bUoVst/4ov1WfNaZua91LQG2FxaR4Jo4ilM15y2z8KfRU8jcMd1s/7PnWLrQE9d4dT3dJnqdwDUeOU/X8H7bWCh4UvA3Me9cGoEofcmWe3ynvdaFfJQUcWHA7ERmxRXEWYzpG8P5proX9RfoazfsMx87BacAy8ExggQL+V9JYY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8WUIJuT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8WUIJuT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52224C2BCB8;
	Wed, 13 May 2026 21:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778708958;
	bh=dfMOrU38MXovxDjpGMqkZ1S10kOT1MIogIWwoOzIb7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=d8WUIJuT9bLa2XB133UC87NHXADloRhLaRTfS2cDIpXzGvVOmYrOKqGiWxdkBH2i+
	 fjMwrrnzltbEkOFhZBux42Fe7n8RxgXsMRX0L7xbBlRo2zSoeJ7ICjXxuWy+dLPgUr
	 ey1qh+CeLA0E1aC9OZqTGuLAeMEqwk3Eoz25gq3bzQAWV1dYkaHNZFPu3nqu+W8tlj
	 HUZWehNLUUZBwa8bappSKw/DR5AyiOTDpE7S7DFpJHKAftNN3Tfk8T7/CgfaUTnhU3
	 GlArzQ6OlTWfk2tZJahe+poId+3XsFSsa6kmRTz23xTYLxzWZ0p2rMODkV7dmukDCt
	 Sv2IrdSV3TNYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-iris-sc8280xp-v5-3-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-3-8cc251e83b58@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:49:17 +0000
Message-Id: <20260513214918.52224C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `mmcx` power domain will be ignored by the fallback `sm8250-ve=
nus` driver, leaving the hardware under-volted at high frequencies, resulti=
ng in lockups or crashes.
- [Low] The `iris` device tree node specifies 4 power domains, violating th=
e `qcom,sm8250-venus.yaml` schema constraints.
--

commit ae854de052f0b364828840ec87b770c30cfa8595
Author: Konrad Dybcio <konradybcio@kernel.org>

arm64: dts: qcom: sc8280xp: Add Iris core

This patch adds the required nodes to enable the Iris core on sc8280xp
devices.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 41c57e7dc4333..d950816a9a9e1 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi

[ ... ]

> @@ -4181,6 +4189,97 @@ usb_1_dwc3_ss: endpoint {
>  			};
>  		};
> =20
> +		iris: video-codec@aa00000 {
> +			compatible =3D "qcom,sc8280xp-iris", "qcom,sm8250-venus";
> +			reg =3D <0x0 0x0aa00000 0x0 0x100000>;
> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names =3D "iface",
> +				      "core",
> +				      "vcodec0_core";
> +			power-domains =3D <&videocc MVS0C_GDSC>,
> +					<&videocc MVS0_GDSC>,
> +					<&rpmhpd SC8280XP_MX>,
> +					<&rpmhpd SC8280XP_MMCX>;
> +			power-domain-names =3D "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";

The qcom,sm8250-venus.yaml schema currently enforces a maximum of 3 items
for power-domains (venus, vcodec0, and mx). Will adding the mmcx power
domain here cause make dtbs_check to fail validation, since the schema
hasn't been updated to accommodate a fourth domain?

> +
> +			resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> +			reset-names =3D "bus", "core";
> +
> +			interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names =3D "cpu-cfg",
> +					     "video-mem";
> +
> +			operating-points-v2 =3D <&iris_opp_table>;
> +			iommus =3D <&apps_smmu 0x2a00 0x400>;
> +			memory-region =3D <&pil_video_mem>;
> +
> +			status =3D "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz =3D /bits/ 64 <240000000>;
> +					required-opps =3D <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};

[ ... ]

> +				opp-560000000 {
> +					opp-hz =3D /bits/ 64 <560000000>;
> +					required-opps =3D <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_turbo_l1>;
> +				};
> +			};

The opp-table defines two required-opps for each node, which expects the
driver to scale both the mx and mmcx domains.

However, since this node falls back to qcom,sm8250-venus, the venus driver
uses sm8250_res which hardcodes opp_pmdomain =3D { "mx" } and only attaches
the mx domain. The generic opp framework's _set_required_opps() will then
safely skip the unattached mmcx domain.

Could this leave the mmcx domain stuck at its default voltage (like low_svs
requested by videocc) while the core runs at 560MHz? Does this run the risk
of undervolting the hardware and causing lockups?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-iris-sc828=
0xp-v5-0-8cc251e83b58@oss.qualcomm.com?part=3D3
