Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792624849;
	b=UhgMKqrXL8PXRfhI171d2QoJkBuppZkocJk0IUvHQnykPo9nt1C/UmzgbfJ5fc5ND91a
	 bx7rxpHXZixr4GwhLhmwtvTJdE40m5tUQGEBt89sbqkDdq1GjGUGcjXhU0LqMNiZoDNQ7
	 +k5NRTeps6vq4znea30qe349Q403NBlfn/8rHDiUn6ZPTXwAywYXWvFmXW1XMrvz5eVgP
	 n/2sNnP7bZKDmxeKOlrS0IumoCE6ZmXQ0fAd0EoHzYlt1TnZVzI0MRnXT+oEGRU+ZiiZD
	 SCw/vAIWMLdF8uxberO9z2VRbl9suiOlGtEOFqyk3oe6bVWeL4FdGS5Dqxjzut0ayQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792624849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3/PkX2wBAHz4wgjVQm491Wme4i4LqDRLzwrJqI7Q9ZU=;
	b=HKRadOhUG2p3l4U8v7xF74NpotK0oAJmSBIJfbeGhAYb7J+cW6tPUhHYvY4qDMCiTn2j
	 jk0LcJZUrRQCD4D3mEN2n56dI/XQfWWyXCYHzEkyopUJkQHqeumNm8z3gVx2X7fa7S79O
	 +37PdAXDo+NHJJPjU/Fd314IgSaFm4dfI78VhdNNcTEdeg2Fi10dJzbjm8AVzMft14F5E
	 GGL+jV0MOF3y+jQ6fbG0Vtguh9b0BQU1XfObfINco7Mc/vqh+XIJfm7xK2eF8u6Q9Nrjw
	 86z9fRLVOU6/WW5rpUsz97lyxJuxnP9BRvemdADaPthnpvx0myDw+NJ0NYR3ppLz1kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aoG5jBUt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fX9i7s3k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0F606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 23:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E0F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aoG5jBUt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fX9i7s3k
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKfrBV1157501
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 23:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3/PkX2wBAHz4wgjVQm491Wme
	4i4LqDRLzwrJqI7Q9ZU=; b=aoG5jBUtNK8kERS93tcIiM5kXorD1DsfgPMOmqxD
	pw6PESFbT7AhDZy3SiSjzaKWVkEgP8LObCyg9l8vi3XTJvkwQ1Ai0NTfrY3i1uoT
	b6ybuz7DL9SoB2KiWNFyM98Qp6wzp7lE7v2sRfgQZkq3p3/UysYffU/ipvwUp6Vb
	N2zlaov2+Vjf2YKxK3GvfeT47bCzP6dCrhYaY3FQwUckiL87nEggLfdeS/HEsLwc
	uQ7OEShk1wzsjG+kMLkumnu1lVbHk0ptrpwZfohvD/F6kS3YsWKrjI7monttrBha
	BIhX9efcZO+zNIDbdQWCQWV/vemHrDoIpNWDeLTH+8EuBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv1k39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 23:20:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so267260585a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792624846; x=1793229646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/PkX2wBAHz4wgjVQm491Wme4i4LqDRLzwrJqI7Q9ZU=;
        b=fX9i7s3kG3g9Es1fckdmdPRGdgkvWuT8GGGsIm+YA4EgQzNRE7jkFrL5hGm3uISA++
         zD5Rwmz4b6LoAuMcA1p7oSi9OzovGfZoGpMDKDe2BPeU8bq0JsLJoBWmQZ2e7gePHFpd
         AkiRZd/8uID1uq1ZqAWybSOn10oh26XNpCR9XcicMbexvXELZq7sdD+o1UmMLpwB0t9U
         ggEDXVLaLCZoK0G76EVyExeNejX/FJ2/2qmLxJyPOvoZ095MDNT3wjuKnRT+GU/fFQpn
         NV0CoFpplkXTvDCYHbuBZ4F8QUgvemXuxGHb99PtC270xfLcND09hRXPv8FN5Mjx9aow
         KUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792624846; x=1793229646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/PkX2wBAHz4wgjVQm491Wme4i4LqDRLzwrJqI7Q9ZU=;
        b=QawpbwuA3rWRV650eGXdjTjbi36uLAjFOlNaIZiGJS5PTwJzSRRhEGqpTX8m0RxVui
         Ez9fduefPouLTiTpNKZcONR1KDLT5lMRXS+lPZveS+iM3FSC1tnYbt78b+iENan1Fj+4
         d2oX+ZVOdJYYQ4powUCCjgVksvUFeTBl9QXbS+PRgWYeP2XQS9Nb2cIWpYxH9htyFfBM
         Tddi5yht0p8E9wCvcRGhMx5RFyH7F2+BEHLkn3x0jOtGm4iEJBRupR/SJZthADbddil/
         iAYWVfoRPNJ7d0+1cmWs+RUiIZvUSjn6J2LxlW1LfNiECo/h1Sx7SEGjXdWsrrccrrev
         M4Pg==
X-Forwarded-Encrypted: i=1; AKwUvBzeKpTbfZZVLxP7qOteAKhSQ/GT7FhWuVvnAARfMRKOkHNCizZEFuOhImcsI8DWAZD1MkmTK5Gopxkg@vger.kernel.org
X-Gm-Message-State: AFq9FYKBUVIENSfRyY6xrlZPH6XfET1wW0bsN5yD/IfJfVoxHe3wI38m
	83kmdDDRUTjRPRJ3bt+M72BR5dnuMpyyGvuB8enAlj3kM8CotF7xGN+91CPy4A7q9Ee0w+vzEvv
	I7fxr+vmbTXd2SvCK9eudKDPs0B0rtSHJFyPfTWoHYwWtDpqTt2T1QIJzyYXagstn
X-Gm-Gg: AYBFou3Clxt1qALCFoHSLb8vunKKR0IKiUjXUOWFtCcUZ5pxn2cvA7HEC4t8JVIMbvk
	92WEX742Ru0W3W+67d5ZMTGfNpz/eOYSZt+hxaTp6VthkZKr1NEAhweIBDYx0yZqjcNS+xw34y+
	7LE9I/U35KMpGkO/mtD8h3LLuh1tAVgAQFz0D2CW19JTc91tDcnF9uC79nh9SQsAj2SSgS1EOAV
	OkLYBPWWZBN5cDtYbrXSOKNQ2mDgpxFdlTYwWS6zYUGc8Fcxq4yIutPv5TskpxfYUgIjDuTt1sc
	7cJ8M4sBDvOoWqsB04PgNxt5wTWb5XQBMbbWXxScEoZuvUEWpFLfEYmWa1Af3ZykwPp79HCZJET
	L3SF87GzdNZQ4KtB/mQUotrFp181gRlXTfwp2SV0/5SSpvwv5Rt2vygOfZzLTVYU2XnDSChShzW
	lVSdgQKQLE6O4c
X-Received: by 2002:a05:620a:19a5:b0:93f:2d52:613a with SMTP id af79cd13be357-93f57fa0c36mr725659785a.29.1792624846313;
        Wed, 21 Oct 2026 16:20:46 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93f:2d52:613a with SMTP id af79cd13be357-93f57fa0c36mr725657585a.29.1792624845701;
        Wed, 21 Oct 2026 16:20:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa45b4a93sm404364e87.20.2026.10.21.16.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:20:43 -0700 (PDT)
Date: Thu, 22 Oct 2026 02:20:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Linghui Wu <linghui.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
Message-ID: <3v7ya2xot7tjklzw2docgzt3vq2d2lwqxnaiux3ehjqg424rne@ealrgump25o6>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
 <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad948cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Wc9Em7cJ86xyjQT5_ZUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qDDVCOKmioO1kwPncUs7k03QsSjWXXlQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MyBTYWx0ZWRfX+u1Nao7ja5qK
 /LCcd+HpuatnzWNWy/GSsUmfa0A1IMBWVV+cp+KIbHzO7BXKd58QXCiLhd2zzLKOM4I2AuJ72Ni
 IGS77xY++sJWLotYsA6WvYahjpGJZKQ=
X-Proofpoint-GUID: qDDVCOKmioO1kwPncUs7k03QsSjWXXlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MyBTYWx0ZWRfX/2wjecJFtsyw
 fpK1nUR90TAbaWM8ndK64gOkQ0pd5VT70tpA9UCpFiNif1iQ0uKUNIWJV6ZrICuxfwXL1KTsWS7
 RNHhZ9KPy6DffvlP9mYjNGQc6lwvLMTvBjv7NDye4uXPwXp3WYrlO1TuxV9I70jwNgf38vgjmJZ
 zcs8b+mZvIK27K6lNlofMg3shP1OqvjkovGLzJhxymrwNZCwqt+0/4CHH5kl3FJe5mRACGOClvv
 3vklguLoHX1qnXkeugBX/O3O0mVFIBQ374QQmv/VXHB+FmI0krMcXC1oJ/saTE8bxB09xq+DqXo
 Uf9yCiNN5MfexOWXucLlRgrAmMDQmaVkPwTtPNg2ZcNZFRkq/68gU8TEI13lch2npwRPsPhbZRp
 NF/9ocu/Lso9H43Ihpd+UdsMVS/rBaSDnss9uDUuGU2F8zUP6QgRw4Ey5xAeK6Q/GzMdsnFXPb+
 /fquxxF7YK7bO3Tr3cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210093

On Tue, Oct 20, 2026 at 10:09:25AM +0800, Linghui Wu wrote:
> Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
> Shikra IQS EVK.
> 
> The M.2 variant uses the external module connected through the Key-E
> connector instead of the onboard WCN3988 devices. Disable the onboard
> Wi-Fi and Bluetooth nodes when the overlay is selected so the device tree
> matches the hardware variant and does not probe the unavailable onboard
> connectivity path.

You already got a question on GitHub and ignored it there. Why are you
disaling onboard WiFi/BT? What makes it unavailable?

> 
> Describe the PCIe and UART connections through the M.2 connector, the
> 3.3 V supply, the W_DISABLE signals and the PCIe reset signal.
> 
> The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
> module. The overlay was applied, the link trained at Gen2 x1 and the
> endpoint enumerated. Bluetooth UART and HCI runtime validation is
> pending.

Please don't send unvalidated patches.

> 
> Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.
> 
> Changes in v3:
> - Drop the unused reg override from the disabled TC9563 node.
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 105 +++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..799faa32e2d9 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtbo

How does the Makefile handle eother dtbos?

>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> new file mode 100644
> index 000000000000..9496c6558eef
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	m2_keye_3p3: regulator-m2-keye-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_3P3_KEYE";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	wifi-bt-connector {
> +		compatible = "pcie-m2-e-connector";
> +
> +		vpcie3v3-supply = <&m2_keye_3p3>;
> +		w-disable1-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios = <&tlmm 60 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_pcie_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&pcie_port0_ep>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_uart_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&uart8_ep>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&{/wcn3988-pmu} {

Add a label to the PMU and update it by label rather than by the path.
If the path changes, this node, I think, will happily create a new one.
Using label will generate an error.

> +	status = "disabled";
> +};
> +
> +&i2c3 {
> +	qps_gpio_expander: gpio@3c {
> +		compatible = "nxp,pca9534";
> +		reg = <0x3c>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
> +&pcie {
> +	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
> +		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
> +	vddpe-3v3-supply = <&m2_keye_3p3>;
> +};
> +
> +&pcie_port0 {
> +	compatible = "pciclass,0604";
> +	reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
> +
> +	port {
> +		pcie_port0_ep: endpoint {
> +			remote-endpoint = <&m2_e_pcie_ep>;
> +		};
> +	};
> +};
> +
> +&tc9563 {
> +	status = "disabled";
> +};
> +
> +&uart8 {
> +	bluetooth {
> +		status = "disabled";
> +	};
> +
> +	port {
> +		uart8_ep: endpoint {
> +			remote-endpoint = <&m2_e_uart_ep>;
> +		};
> +	};

How does the UART switch from the onboard WiFi/BT card to the M.2 slot?
Is ther an automatic switch?

> +};
> +
> +&wifi {
> +	status = "disabled";
> +};
> -- 
> 2.43.0

-- 
With best wishes
Dmitry
