Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94F52222D9
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786929131; cv=none; b=ukF09orTViaNW2ZcmphnxLraHOyAXzX8krti39nH4vG9Led+9CXOz1XJE33+VDncYSEQxBk9igBqzD74XdSKEd6Ys+QtT9mdrwq7I0VXTIekutoe64B4dCnY5lP4iEnAAebqG6mV1LfnH0CvOppAP9p3bzcVo+2rEQC3VLU5Kz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786929131; c=relaxed/simple;
	bh=8liI0C/dxeSCExDf1H/aog4zqnD6SFGcIl1q/dv30/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGsy0PAslNhlw88svUj5UAqvUQOHkWEZpjJg7Y9CpDxyzXMagmoX23Ahrh48zIHkN1SmihlovoGV6wc4/niN2CxxYW9Li4fBxg2uJZ5Cp031NmoT22xY+cnlqn8j2qDKFYNBrpiJcQW+XwQ5TYGw9SLlc/46Y/LtBqOzrctifYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRdv45qs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bx5y0VXK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRdv45qs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx5y0VXK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDQeP856665
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0FL/S1tmx6uFpaBYQVY6ueYj
	6jzB1S9NDWg3B1AEHIU=; b=JRdv45qszVvcY66lnTQeSQvQd2d45iItDPkc3d/W
	PE+ZXUhCgH2MBoAACRJttEwZWS/qQethOvyUJ9ZBSGqpXax9X7ik4G+ZrQkYSDAo
	d6DuxBdm/pUlGzog9/cTJ/xlj4gn26GdVN3220yIZe9vWons44CWzSVFHXl9mWjq
	MkQWxr6CUtms00u9hq/ITFV0UiPBTWMZgExtKfPYMSmNB1sGD58TZcTYpwrj/s1S
	9kBD99EqlBuKGerIAHDevou2AeQrJzX8DbwRtIKurZg24UD+5VyitHTy4HHUj4Zg
	vWYjlLkB4KN7ZYQcbB2B5Vo/k7irZi+r6F7VnMhSUmh6mw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwmmxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:12:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494527488so492468585a.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 18:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786929127; x=1787533927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0FL/S1tmx6uFpaBYQVY6ueYj6jzB1S9NDWg3B1AEHIU=;
        b=Bx5y0VXKSGrxf9i8UAViRozAfAdUO8XvFctMWF5VFH/GwsutiEjji1YkrczYHqwcn3
         HZewE9AOtfqicXO9VGjUL5LP79wl4mpfuONMZo78VvHHgr4OI1GF48j3zxlIY1/dO42+
         b3OMDjZ3QTuq0lnI6VJ66jgzwHfcKm11i9NJmqHMGty9TOswWx9Xy24RYcls9qFSnfQb
         6XMt9raMxEa/lxoaOaT/1KYmv1nMPVrKJhAXDSjVxvgzIrF28/sNCxWD2oGt3NDFD8Ot
         yfLTVeNFd2E7A2lRYToj1i+XOwZPFH6jhZ1cFOGNj8fqw46xEllE+TkvFTpM3V5UDlFD
         Dy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786929127; x=1787533927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FL/S1tmx6uFpaBYQVY6ueYj6jzB1S9NDWg3B1AEHIU=;
        b=anTjO0NNI2fuYZFc88UiYg84abtQbEzgPj70kZf9yeFP4mYBoSJC7m8zCe/s3UUUUP
         qfPmiGZgcLHPKeZD3Rk9Co6/Qmm2wOl2idmLhmlU8v2dFGeoA/F1sNHp27a0cLCYpsbw
         VgoTd77Be3gVs9j5iyBQd5lLsLTv0ECc1W5umrTvRmlFBZnuIR5AKEhVn7dtO7JfvBJZ
         AlDUd0rDYe614RgON6Amqk9vbrG0JzMzcKE/bhpvGh+lk2S4f4KvqBFCTCB58lv3Vsmn
         kpbZMMy/jGn5TB2lLUbixm9pIDZdfMHQ/dTTM+WyTZaENt+zaHXDseSge0c24uCZj2ra
         LfLA==
X-Forwarded-Encrypted: i=1; AHgh+RpvyKnoPpC4+DTn1vzOcnEJ4IVICAVKfs6zpBTJ9j2bawIj4qUUa2hWoUEAth0spwsKpqn1P0NQE2iM@vger.kernel.org
X-Gm-Message-State: AOJu0YxgyV9zkK4t9hRMGXZXYdaaRcoCS9vU1saljAM6cqnN1oMoRh8b
	owOpfOub5QC/hDF2ug0aD/yO1hVgECY1wCaukPg2VqVXdNsZukvJNsCL/nogTxzdJEH0F1M3oAD
	ydFDGSE5gtycVjlpqj8+/8qV9ur8sqAckZ1QyaLNR7pvyTVMQP5DSxTIWaQjXht99
X-Gm-Gg: AR+sD136hjebgt1x8iMayxcYXyGTxc+fDFLuvDSOZmohtMWrDXQX8EyBXnXODEs1VCK
	w+OCbD3mkoTe8KshN0EJqoRAtTe+qzdlgitIEmLQlQhq87LosMCXduGcwQm4IPa+4whjsRto4Mi
	odnx6S2m01ECASoPSucYXuBedG26jtWAkiH+h4GpNanyWvnyxpGWPFohgtSTRXCfmC4l+i3CDlQ
	1RAjqjm9xCMgU5nuiyJEYS54g9UEowi27Q/WHm+qGmq14NGMzLCHnQWyE9ogq2KsV9OXnijc3ui
	CFgpalNf1zvFOTAiPi49zZgjsHAHQtTFB4gaNwDMdq6EooZhLMTuhGLI9JBTtRWbodRxJwXoDWv
	zww4GctPtOVDWjaOn1GtY+hBe/2Fv3+Ip2DD+7TyOlaYqau7cquZf7s4vqC5PoFxrLE1Tvkq3Sb
	pM6yUVxlzJl219
X-Received: by 2002:a05:620a:4492:b0:936:583a:dd75 with SMTP id af79cd13be357-936d212c6fdmr2016202485a.17.1786929126997;
        Sun, 16 Aug 2026 18:12:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:936:583a:dd75 with SMTP id af79cd13be357-936d212c6fdmr2016197685a.17.1786929126410;
        Sun, 16 Aug 2026 18:12:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458baa6acsm2133694e87.34.2026.08.16.18.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:12:05 -0700 (PDT)
Date: Mon, 17 Aug 2026 04:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, tglx@kernel.org,
        lpieralisi@kernel.org, robimarko@gmail.com, linux@gurudas.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: Add SM7250 base dts file
Message-ID: <5rwvkw76ytwe2ip2vsfgxopp7cp5gryzm67cfvjsywscjrgpwv@hydeqoqnlg67>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
 <20260816161808.12419-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816161808.12419-2-sreeshankar0910@gmail.com>
X-Proofpoint-ORIG-GUID: JTsKTlqBNSffjEMzb0LIej_UCRvF5mWg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAwNyBTYWx0ZWRfX9YqVHtc0k3Eb
 h0D2PEMRdHx3UbJ+IsLrDaLtZ+y9WgRQi2iW6G7igJ2TrT+5uWVd6pUT+mNiqIY078Tu93bk5am
 t/X9JpLZEqB6mlKYvHwTZhAfgC6+CRUrL4QfOM0h52TKG6ldJcHKDtMAVyzfgd+aeKGRKiljMr7
 wUpB22OvCffIF+61k8hm0h1VDKVpj1IoHd8DKWDILRaLGIj0bJ8WqEztuRdf7x/AEs97l6w77KS
 nXz48RNHxuVzXGUGgNEefsma3DDq5Zugm/SjiUuzBsAn/CQ/cB+pdp4G37JtI8r0K4qmP/7WhVD
 iVElmWh/z7kxG4PMFsbPjarEbREajmCz5pIO6Q4oczLyt9tfqoILE6zhx24KeYwYRuKG2AwSPJc
 Lm/sIZs4b2LafJzd3IPlLRmxiEL3y1dNkJ/KVFIHWdpYmtiqA6NEaf8WVYfdVjsAwkX4i0yRC6q
 fj0U8VoapRbYhw3cfxw==
X-Proofpoint-GUID: JTsKTlqBNSffjEMzb0LIej_UCRvF5mWg
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a825fe8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=w6DgJsjFCm0bfvo_ST4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAwNyBTYWx0ZWRfXwMm49TxuehP8
 831gd/6xKRVRYshOW9N2iO5yon1r8Gd+94LyrowZ8Y/BGyH6Qwtz7G21obeOn01IUyQ1p50a9KS
 24GfPh72fKiJAVBl/wpwm3VGVdRWQHk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170007

On Sun, Aug 16, 2026 at 04:18:04PM +0000, Sreeshankar K wrote:
> Add devicetree file for SM7250 SoC and SM7250 MTP platform.
> This file adds the basic nodes like cpu, psci and other required
> configuration for booting up to the serial console.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/sm7250-mtp.dts |  30 ++
>  arch/arm64/boot/dts/qcom/sm7250.dtsi    | 499 ++++++++++++++++++++++++
>  3 files changed, 530 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7250-mtp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f33c4e2f..4b68ed17f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -347,6 +347,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-curtana.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
> +dtb-$(CONFIG_ARCH_QCOM) += sm7250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-motorola-dubai.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-nothing-spacewar.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm7250-mtp.dts b/arch/arm64/boot/dts/qcom/sm7250-mtp.dts
> new file mode 100644
> index 000000000..062b5958e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250-mtp.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm7250.dtsi"

If you have declared SPMI node, you can include PMIC files here.

> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SM7250 MTP";
> +	compatible = "qcom,sm7250-mtp", "qcom,sm7250";
> +
> +	aliases {
> +		serial0 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> new file mode 100644
> index 000000000..f942eb230
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> @@ -0,0 +1,499 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,gcc-sm7250.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <38400000>;
> +			clock-output-names = "xo_board";
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32000>;
> +		};

Please move these clocks to the board DT. You an keep referencing them
from the DTSI (see for example, sm8750.dtsi).

> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo475";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +			l2_0: l2-cache {

empty lines between each subnode (here and further).

> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-size = <0x20000>;
> +				cache-unified;
> +				next-level-cache = <&l3_0>;
> +				l3_0: l3-cache {
> +					compatible = "cache";
> +					cache-level = <3>;
> +					cache-size = <0x200000>;
> +					cache-unified;
> +				};
> +			};
> +		};
> +

[..]

> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		hyp_mem: memory@80000000 {

Don't use just memory@. Add more descriptive node names (again,
sm8750.dtsi).

> +			reg = <0x0 0x80000000 0x0 0x600000>;
> +			no-map;
> +		};
> +
> +		xbl_aop_mem: memory@80700000 {
> +			reg = <0x0 0x80700000 0x0 0x160000>;
> +			no-map;
> +		};
> +
> +		cmd_db: memory@80860000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x80860000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		smem_mem: memory@80900000 {
> +			reg = <0x0 0x80900000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		removed_mem: memory@80b00000 {
> +			reg = <0x0 0x80b00000 0x0 0x1300000>;
> +			no-map;
> +		};
> +
> +		camera_mem: memory@86000000 {
> +			reg = <0x0 0x86000000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		gpu_mem: memory@8bc15400 {
> +			reg = <0x0 0x8bc15400 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		npu_mem: memory@86500000 {
> +			reg = <0x0 0x86500000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		video_mem: memory@86a00000 {
> +			reg = <0x0 0x86a00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		wlan_mem: memory@8ba00000 {
> +			reg = <0x0 0x8ba00000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@8bc00000 {
> +			reg = <0x0 0x8bc00000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: memory@8bc10000 {
> +			reg = <0x0 0x8bc10000 0x0 0x5400>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@87400000 {
> +			reg = <0x0 0x87400000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@89200000 {
> +			reg = <0x0 0x89200000 0x0 0x2800000>;
> +			no-map;
> +		};
> +
> +		modem_mem: memory@8c000000 {
> +			reg = <0x0 0x8c000000 0x0 0xf800000>;
> +			no-map;
> +		};
> +
> +		cdsp_sec_mem: memory@9f400000 {
> +			reg = <0x0 0x9f400000 0x0 0xc00000>;
> +			no-map;
> +		};
> +	};
> +
> +	smem: qcom,smem {

Don't use qcom, in node names. the label is unused. Also you can just
move it to the reserved-memory and drop memory-region.

> +		compatible = "qcom,smem";
> +		memory-region = <&smem_mem>;
> +		hwlocks = <&tcsr_mutex 3>;
> +	};
> +
> +	soc: soc@0 {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x10 0>;
> +		dma-ranges = <0 0 0 0 0x10 0>;
> +		compatible = "simple-bus";
> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,gcc-sm7250";

qcom,sm7250-gcc. Where are the bindings, BTW?

> +			reg = <0x0 0x00100000 0x0 0x1f0000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			clock-names = "bi_tcxo",
> +				      "bi_tcxo_ao",
> +				      "sleep_clk";
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +		};
> +
> +		qupv3_id_1: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x009c0000 0x0 0x6000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			uart2: serial@988000 {
> +			compatible = "qcom,geni-debug-uart";

Wring indentation.

> +				reg = <0 0x00988000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			interrupts = <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,sm7250-pdc", "qcom,pdc";
> +			reg = <0 0xb220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> +			qcom,pdc-ranges = <0 480 42>, <42 612 28>,
> +					  <70 63 1>, <71 640 15>, <86 522 52>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		spmi_bus: spmi@c440000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x0 0x0c440000 0x0 0x0001100>,
> +			      <0x0 0x0c600000 0x0 0x2000000>,
> +			      <0x0 0x0e600000 0x0 0x0100000>,
> +			      <0x0 0x0e700000 0x0 0x00a0000>,
> +			      <0x0 0x0c40a000 0x0 0x0026000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +		};
> +
> +		apps_rsc: rsc@18200000 {
> +			label = "apps_rsc";

Move label further down. The typical order is: compatible,
reg+reg-names, then everything else.

> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x0 0x18200000 0x0 0x10000>,
> +			      <0x0 0x18210000 0x0 0x10000>,
> +			      <0x0 0x18220000 0x0 0x10000>;
> +			reg-names = "drv-0", "drv-1", "drv-2";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
> +					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
> +
> +			rpmhcc: clock-controller {
> +				compatible = "qcom,sm7250-rpmh-clk";

Missing schema and a driver update.

> +				#clock-cells = <1>;
> +				clock-names = "xo";
> +				clocks = <&xo_board>;
> +			};

While you are at it, please add rpmhpd here. Most likely gcc needs to
use RPMHPD_CX as as power-domain.

> +		};
> +

-- 
With best wishes
Dmitry
