Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514191;
	b=AbNlXsF1AKk5++t2K1hN0/MHh9Byf8eDCY9P9qWE7x41HBYnWNEBB9aErYnSOEayIr4T
	 T9s3T8/bu0qNu9DML5UIhXy95uaXfyuMZn7lnlv6acxT4PU5E027ckD2Km2GsaUrDAeLk
	 l6p1jFLXDLswWUP1FKFxfdMSv2U7w3Xt/3LhmVRs/xah+y4U15erQwyge/HiPOU35VLQQ
	 F94NM4P3OdOjE0E5u6RbXKpV1TRqglE4EMdYMCfvY1viK1Dvp80QuvvG8LDp/OCbKj/MK
	 Mws9LoHbo4vobRLXnjrShmU4aEKAs6fQi+3p9/DKW7YCaDgSc/EDomGACHOPWdRoIhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514191;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bwHwYbEcRVz5ir8sDVfhgSO4b5sdvLUfauPb0g9K57E=;
	b=ZKnaU00EtcMOsbLYzTNHF2cgzLvQUJHgBVCH4cLn5scNkcgdATdymws7CNOuM9bOAEHG
	 XK+Dp+SzJ4Hi6l/NDj7jtFB/6mTMVxG5c+IGpqlICZSPPMgj7SIOegNfjBTKaL2qOkzcF
	 0yk3QWNaHVDZO3BcIYz1klNpt63ooQefXyXWO2tzWM7N94SUzbPNMNB1b3LTEYtwMwE86
	 hQ4yP28cpubpe3rorfUkqAsn8P0/f43BM3Ha0DwlNvpqTpTQLXqF4zeVgKrugsM7qmTmV
	 OCx4lge+6pRBwKhOuwR+aCZ04eePwC37rYckB4DMIvHpUah2Dz2ia8S9HMx/KSLXaCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROvVMQCD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45EF606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROvVMQCD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352081F000C0;
	Tue, 24 Nov 2026 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514191;
	bh=bwHwYbEcRVz5ir8sDVfhgSO4b5sdvLUfauPb0g9K57E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ROvVMQCDv1Iv09wEEBtDt/vmq8L11p0koDzv5OMgdhWu1JlapWPNnzvPyIZ9gsE3h
	 cQCGPYDyXOp71pY4hw8jJd6clx+iMG6fXqzNz8VJAYHPTHnlDi2D9Rs43ZmhWTBwI8
	 qvxmRNPjDAYdFP9dH9tt4dw5Q6TvZ8h4dTzDVlaHpCKtk0qJkfYV/0QQMgxo4+j3xI
	 kfsRAcjd+iGx1xmEK7NwszbBnpI0avktz+u0E/7Quio7Rb9oV9ZjlCG0RZPI4lWiC9
	 GPWUdIly0PL2ylOW6nQpF54V00AzPwG3hqPKklGFV0H6GgIu41cW0DFbTHttl2m2QJ
	 3ynvi0eZPXdmw==
Message-ID: <sashiko-outbox-230893@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add CoreSight debug nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-add-coresight-nodes-for-eliza-v1-2-e1679ce78547@oss.qualcomm.com>
References: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
 <20261124-add-coresight-nodes-for-eliza-v1-2-e1679ce78547@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:56:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: eliza: missing element-bits on static TPDM
  nodes
- [Low] arm64: dts: qcom: eliza: wpss-replicator port@2 violates DT
  binding schema
--

commit 54f1938fd654d770e58cbcb66d2760184479af8c
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add CoreSight debug nodes

This commit adds Devicetree nodes for the CoreSight debug and trace
subsystem on the Qualcomm Eliza SoC.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 4a125ef386c02..7bf58daace9c9 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi

[ ... ]

> @@ -5430,4 +7484,127 @@ timer {
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	tpdm-ddr-lpicc {
> +		compatible =3D "arm,coresight-dummy-source";
> +		label =3D "tpdm_ddr_lpicc";
> +
> +		out-ports {
> +			port {
> +				tpdm_ddr_lpicc_out: endpoint {
> +					remote-endpoint =3D <&funnel_aoss_in3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-lpass-lpi {
> +		compatible =3D "arm,coresight-dummy-source";
> +		label =3D "tpdm_lpass_lpi";
> +
> +		out-ports {
> +			port {
> +				tpdm_lpass_lpi_out: endpoint {
> +					remote-endpoint =3D <&funnel_lpass_lpi_1_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-lpass-rscc {
> +		compatible =3D "arm,coresight-dummy-source";
> +		label =3D "tpdm_lpass_rscc";
> +
> +		out-ports {
> +			port {
> +				tpdm_lpass_rscc_out: endpoint {
> +					remote-endpoint =3D <&funnel_lpass_lpi_1_in4>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-modem-rscc {
> +		compatible =3D "qcom,coresight-static-tpdm";
> +		label =3D "tpdm_modem_rscc";
> +
> +		out-ports {
> +			port {
> +				tpdm_modem_rscc_out: endpoint {
> +					remote-endpoint =3D <&tpda_modem_crm_in0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-modem1 {
> +		compatible =3D "qcom,coresight-static-tpdm";
> +		label =3D "tpdm_modem_1";
> +
> +		out-ports {
> +			port {
> +				tpdm_modem_1_out: endpoint {
> +					remote-endpoint =3D <&tpda_modem_in1>;
> +				};
> +			};
> +		};
> +	};

[Severity: Medium]
Should tpdm-modem-rscc and tpdm-modem1 specify qcom,dsb-element-bits or
qcom,cmb-element-bits?

In static_tpdm_datasets_setup(), drvdata->dsb and drvdata->cmb are only
allocated when the corresponding element-bits property is present.  Without
either property, enabling a trace path through their connected TPDAs
(tpda@1080e000 and tpda@10803000) fails with -EINVAL in tpda_enable_port()
-> tpda_get_element_size() -> tpdm_read_element_size().

> +
> +	wpss_etm0: wpss-etm0 {
> +		compatible =3D "arm,coresight-dummy-source";
> +		label =3D "wpss_etm0";
> +		arm,static-trace-id =3D <44>;
> +
> +		out-ports {
> +			port {
> +				wpss_etm0_out: endpoint {
> +					remote-endpoint =3D <&funnel_wpss_in2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	wpss-replicator {
> +		compatible =3D "arm,coresight-static-replicator";
> +
> +		in-ports {
> +			port {
> +				rep_wpss_in: endpoint {
> +					remote-endpoint =3D <&funnel_wpss_out>;
> +				};
> +			};
> +		};
> +
> +		out-ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				rep_wpss_out0: endpoint {
> +					remote-endpoint =3D <&tpda_dlct_in5>;
> +					filter-source =3D <&tpdm_wpss_dsb>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				rep_wpss_out1: endpoint {
> +					remote-endpoint =3D <&tpda_dlct_in6>;
> +					filter-source =3D <&tpdm_wpss_cmb>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg =3D <2>;
> +
> +				rep_wpss_out2: endpoint {
> +					remote-endpoint =3D <&funnel_dlct_in4>;
> +					filter-source =3D <&wpss_etm0>;
> +				};
> +			};
> +		};
> +	};

[Severity: Low]
Does port@2 in wpss-replicator pass dtbs_check?

Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
only matches '^port@[01]$' under out-ports for endpoints that carry
filter-source, so port@2 falls back to the base graph schema where
unevaluatedProperties: false rejects filter-source.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-add-coresi=
ght-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com?part=3D2
