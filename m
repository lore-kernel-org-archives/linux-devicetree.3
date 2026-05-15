Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820C396B73
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845328; cv=none; b=o6UOJnsRlgejusCI/hsfnHxqSxgwS4PFTnP/Ge1rVzLt18B+du14IrYIsNfdEfTk6VioEvTuH7xcwp14nrfM+iOj26Ljl3sJhIVJXj3WUbuZ/PXC9Z17AuXv+LYy6z8MhRu17tXhFk1XpaUq1MCP0c3AystSZ7PDqy1jXK6ANmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845328; c=relaxed/simple;
	bh=X7cpY58K5B1Sr8XuF8nY//nMLE48gXUs8BIrya5Yh1Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dWwIaawBbc75QsGm/g2ybs+kP/kilgZh7YF8w67NfESp34hC6R7aDJVKxqoaBM0jcCEkeioXXBeagNMKsbBON4f6cF1mQ3V4k2Yic57eA+CbyFY37OYqehm7GDegmmcocqAMdYrORv8KhLCwORphiVodmlUhxaBHtDy+e+qjhZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yqx5vsO4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yqx5vsO4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B877AC2BCB0;
	Fri, 15 May 2026 11:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778845328;
	bh=X7cpY58K5B1Sr8XuF8nY//nMLE48gXUs8BIrya5Yh1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Yqx5vsO4R755JeVOkx4hg4r7TlqPVSwjIDFa8QR3VAHfdmZgP5+c+mbyfoFA1v1xq
	 EfewERqWZrpMOB1pxXG6JCFCsCG6uBUArmrj1Q4rVyd3fq/Fm20MEkZbTkefXzhnI/
	 X2C3amkrKSEx89DVoV//wIQoP+AvBh9YRx+H0yKPCUvAbBW0NBNL5/bgS4ZDOjo8fz
	 lgmldkwazLGl/in/lcxKOMhfZ8ttxialIDiaLAwFDldhP2OmvsQFAABkj2FfGXBrQ9
	 CK3J0STNk7jk/ZdIcuGzhSiko1wZmJLwptbolB6ODjg60sNFVtCnYfyyXQXNN5h4RN
	 2JNZ+Wm4mlPcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-iris-sc8280xp-v7-3-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-3-2e21f6db1897@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:42:07 +0000
Message-Id: <20260515114207.B877AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `iris` device tree node adds an `mmcx` power domain and two `r=
equired-opps` per OPP entry, which violates the fallback compatible's DT bi=
nding schema and causes hardware instability due to unhandled power domain =
scaling.
--

commit 39fd9222ebc24cef337abe30cd891e4af77696e1
Author: Konrad Dybcio <konradybcio@kernel.org>

arm64: dts: qcom: sc8280xp: Add Iris core

Add the required nodes to enable Iris core on SC8280XP.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 41c57e7dc4333..45e1dd5a230cd 100644
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
[ ... ]
> +			power-domains =3D <&videocc MVS0C_GDSC>,
> +					<&videocc MVS0_GDSC>,
> +					<&rpmhpd SC8280XP_MX>,
> +					<&rpmhpd SC8280XP_MMCX>;
> +			power-domain-names =3D "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";

The qcom,sm8250-venus fallback compatible is used here. Does the
qcom,sm8250-venus.yaml device tree binding schema support a fourth power
domain?

It appears the schema might restrict power-domains to a maximum of 3 items
(venus, vcodec0, mx), which could trigger dtbs_check failures when mmcx
is added.

[ ... ]
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
> +		};

When using the qcom,sm8250-venus fallback, the Venus driver currently
configures a single OPP PM domain (mx) via dev_pm_opp_set_config().

Since this node specifies two required-opps per state, will the generic OPP
core skip scaling the mmcx rail? When _set_required_opps() in
drivers/opp/core.c iterates over expected devices, a missing mmcx device
pointer might cause the mmcx rail to remain trapped at the static low_svs
level voted by the videocc node.

If the Venus hardware operates at turbo frequencies (e.g., 560MHz) while mm=
cx
remains at low_svs, can this undervolt the hardware and cause system
instability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-iris-sc828=
0xp-v7-0-2e21f6db1897@oss.qualcomm.com?part=3D3
