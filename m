Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749613;
	b=zsCnC9eKRt3kNgl6eSevgoGUy/Z3rdLJBz/AZgeTlnnPwWK8bPtg6aSlorMoY2vKx/Iz
	 spb2Xvdw4UUwhOxiG0/ZRZv5CQ1YGU0vnIOnx0yfprtcag53INw/8nXSFjNwrRcwRyEmy
	 QV1Ot3yCbAHIJKgZo+176pjmwPZ/xLvRmkP/prqpNqs5IyIQtJ1Q5Z8SB4De9LUMYAEfr
	 nyyl+h8W/PiEN+JL2uq6FDzjx1K4UeicfpEQXwLlapeA2V0AcOUEnceZvhRmQChSOsBHc
	 l7UD3AGwMRUSTNjeX7atU5Ub2rQvDr/+o0iem0DeTYE0q9A5JIDf9e87Fq8RFWPSHYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749613;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Zq7XDH+AKk/ykks+gFpUbPjX4AguhtOl0Vtdwbv/zKk=;
	b=YSX1NyLxZTtGLNE0yNsFjD4Qgn/wlDtF+xGhiMVhYUPN2U/CWwpCungrdoAXHZ0TEvwl
	 HVCphSm94w/TysHY6QzwL2a6Vp6hS34uv7t/ktHLdmUy3mcZvrnDMFTT9pnpfMqNM/oZx
	 IBbWWmY2nZ2RnH8GtBO8j5sybdWKpHeJ2nhw/zw40F1DIIxQ5zlgqSF9jWqDS058GZ6ge
	 SGP8875XHNmEQgYM6vGFa19FjH7BktrFr9hTWP1NfqnozUVSfOZg+sAjyXgcIQAfqXWk8
	 wSEGdQOmGUykodGKyGLP1iGAIL2ZG16zUA+yxSzyM5s/qiiSowr7X9jVCqS9pmQdd4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Wk/n97Zi";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ACD606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wk/n97Zi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B361F00893;
	Fri, 27 Nov 2026 03:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749612;
	bh=Zq7XDH+AKk/ykks+gFpUbPjX4AguhtOl0Vtdwbv/zKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wk/n97Zi2D3j/61+ttkthNG0VDm2GVDkTMOzBIiIO9djs0Cap/sgPVS5h92OlFFeD
	 9cRhhzrl7acC1Dlvva6PUqxN8AAnH3kqH56q8iZOVxuumBvuCyGxOY+M5EnzZXZ75W
	 4F0H9qiQsyqvIT2o2I6oFead99Z8wFCnT+i8HlLSLgKq2N3BbXYJRXhkaXEpsN5KP8
	 /V1FRDzL4fVhyPxwauaDEGPStEibDQGfRHYWIQqfvVkfyhTXITxbpatNpBFdbtnkUt
	 Vw4/xnVQZLUrOkzkvs8vmxOkuAbtQLQHtOvRDLfmJFupA7MJ821oBCHBAtqBbuHhRE
	 MJK1CcyzL4mpA==
Message-ID: <sashiko-outbox-236510@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add CoreSight nodes
 for APSS debug block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-4-42d47474a67a@qti.qualcomm.com>
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
 <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-4-42d47474a67a@qti.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 03:20:12 +0000
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
- [Low] arm64: dts: qcom: glymur: funnel@12080000 placed out of
  unit-address order
--

commit 4ff62bb07263d728dee6b06444732059ef9a16de
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add CoreSight nodes for APSS debug block

This commit adds CoreSight ETM, replicator, funnel, and TMC ETF nodes for
the APSS debug block on Glymur, and removes the non-existent cluster nodes
on the derived Mahua and Kalambo platforms.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 165dfa11f17f5..9dd23a52fb2bf 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

[ ... ]

> @@ -7837,6 +8151,51 @@ pcie_rscc_tpda_out: endpoint {
>  			};
>  		};
> =20
> +		funnel@12080000 {
> +			compatible =3D "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg =3D <0x0 0x12080000 0x0 0x1000>;
> +
> +			clocks =3D <&aoss_qmp>;
> +			clock-names =3D "apb_pclk";
> +
> +			in-ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				apss_funnel_port0: port@0 {
> +					reg =3D <0>;
> +
> +					apss_funnel_in0: endpoint {
> +						remote-endpoint =3D <&ncc0_etf_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					apss_funnel_in1: endpoint {
> +						remote-endpoint =3D <&ncc1_etf_out>;
> +					};
> +				};
> +
> +				apss_funnel_port2: port@2 {
> +					reg =3D <2>;
> +
> +					apss_funnel_in2: endpoint {
> +						remote-endpoint =3D <&ncc2_etf_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					apss_funnel_out: endpoint {
> +						remote-endpoint =3D <&tn_ag_in54>;
> +					};
> +				};
> +			};
> +		};
> +
>  		tpdm@11c03000 {
>  			compatible =3D "qcom,coresight-tpdm", "arm,primecell";
>  			reg =3D <0x0 0x11c03000 0x0 0x1000>;

[Severity: Low]
This isn't a bug, but funnel@12080000 is placed before tpdm@11c03000
through tpdm@11c0d000 instead of in ascending unit-address order after
tpdm@11c0d000.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-add-etm-de=
vices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com?part=
=3D4
