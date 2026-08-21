Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5D4749F3
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308330; cv=none; b=X27qYyR/rRJxxEpzXBmE3BqM6tDRQ69ukeuvPRlqJf3ZA6B42aqqSLd29XeDaxtjQ5PvIr9RtmEYfVxwutMpx3T5p5x4sR2JN08R/iWt+ohosVlAD2qUWDs6Jt3JAKxXqRYxFXm77Yu4ZBJcHPjv/IpikuQGUW2rn52t09uxYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308330; c=relaxed/simple;
	bh=zosSe2E/ZqD40uYiqTnsIoI6CtU2hb2xgOwBPZusLho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INSvzg2hwXCs+WnPW1hp0PjB3s+mmgxgQ1V3pnYAYtECuwfmZ+3XVv1le1esnoTvkrI52bdPzYrLGe8y/b6gSngwpVEaK2pYV5oWmmvW29FVvNlxdCeUhG80857rEKgmUNwuZE5bNMzBXQmKZlPPFfaA656pVAlnttVNSDIufHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kk4VTiGm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAIdNZsH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kk4VTiGm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAIdNZsH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LgD53029274
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hGKEQYpSuSXB/Y56MesVtsGp
	Jo7XRCToceowX7JwN+Q=; b=Kk4VTiGmSS4bsU8hB66aV8jAbMyuqKtjz5zW30bh
	k6oxKfZogeuz+Z3y1nip1ixM2VFhveniiiPl8pT63+GmvIaczTBybMkfbxkbbSBd
	2svBEhy94uahK4Jo3MfuSf14xc0sZCEMaojqIfC8bqYqgVpK4DxqmYjz75rrFJQx
	hBNkAyb5VTgBz2QfuFVjtU/qtvKYyFM9hWNJp5sf7PpgkDuF+YpATTylgWASNJgg
	YzvHSvd6MuYTseRRwSFaD86lbXlydP0L+s3+tBcKhPFupoW07AhS/fYpVTX+kLTm
	sKdVviYecdLwLWfWBBFAOcxOD/OfEa5JSP3lmnVyowtjVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9s8mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:31:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-933023a5980so131621485a.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308316; x=1787913116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGKEQYpSuSXB/Y56MesVtsGpJo7XRCToceowX7JwN+Q=;
        b=aAIdNZsHXkvqidISG7C06qJwFAKt3YFI/1SWQPeUX77YArstPH8f/Bi43R4ef/fylE
         d110DBPBlZatQ82k/yseDynuz8zII00Sg2I8oB4qWUW2iwhwM8jTlHXWIlYTa2sVouP7
         91vEcNv3h72SnuoA46NjFHcFByT5U3zeWTKEYymQWdfRQtfMrPaFwb3gmu401rw5kKIO
         OU1sVgK/ktKLyTurBBeyPNEP9JZho471DDBvyiDt/dE67F3zgScW14tnUGZK6ZApsC1q
         a2qx3WJXnyNN2/DsVltF9b1yXMwPCBP57QmLVJn0i9AbOU4OuHqIdkv9UN6qBkrsxpzC
         hwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308316; x=1787913116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGKEQYpSuSXB/Y56MesVtsGpJo7XRCToceowX7JwN+Q=;
        b=dKcGWM1wnUN8EaSXHQdUjAYhZiuRagYJfnbXUbhBmbSnjxtI+qUzmO9tcqcCw1wLrJ
         p+k7+TrjYM+YV+Ajc7ixdU2LUG4dWYPsWoMdgl9PdXzAK/wD+kYKv5Xn/hNbI+V7qso0
         Vj2cWEqf4MBT4Xk73rdLsYHuqHTm27tuc2Q2vfSh8hXP9jhyvVKNW1pK+KSrLWqt3OZt
         7Ip2+PCyfFHmvByaW95oaB9Mm9ugyqFkrVZc5uxG94eF1tLFzH/b+xmx+kzGsflIEsXH
         GvcQz+fzv8ffeTVgCHPgaG2m6kfoyxFNcnL0RJLJp0xy7hQB2iJ7GeSeKpujSu6pKA6c
         XbpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAf0AruImo7HJ7dEkvvzWpe/fPZrWfg73HOr+7YFTNa33J96qKbi/4lcF1GhoJVKoXBgugM6rc5y5r@vger.kernel.org
X-Gm-Message-State: AOJu0YxAKGAe2C467erZ7cwOm1nm/SbyMG4lB3Ga1shqmlS3KeRjWtBE
	zxPxWnZ2EsTtlcjCKF1U3kFVTfzy43BBAiOUXy9cx9RgIFuv9rTLeNPUHAjteGFn4qDnQabepVA
	HIZhD76P76DsbdCeNh3K/mQQjIPiEUrD7TnTLRTk6+Ur0JjZ2QbirC5Smh3JvwIQm
X-Gm-Gg: AR+sD11SNfY+PkTEkcY8d40gMVXpIaWyhest7yoyqquf8CsvoZLUGeAkcVHOoIYM8/W
	kSoUsU+iM9cu3Q7r+e+AmSZVNFu7yuSh60KwmoFJFeul4qBeMnxABdpSnq34fTxZej5lfUkZuta
	MDekqZibU9OXs5hEaX46qH5D8rFOQ8CGz2SDmbyvTvdG5HC3GFKbcGCGBUT7zMkvfXw8fEbKAJQ
	24NkI/eHBeKp2/o1HCzKUw/Hp4f1IALsoe5hUyM3g9srNdRYa58rPeXnKU1L89eRv1S3Okvu4n5
	Veab78OLwuPkUk+FUZBfq+QlY1Q0GnSmoaJggv5U0lhIyfPapKrcE9WYddDBW3l35IWVJBLyrsF
	8T7slgtEYvRGDY10=
X-Received: by 2002:a05:620a:6b1a:b0:937:1097:feb8 with SMTP id af79cd13be357-93739537a62mr334787485a.24.1787308315845;
        Fri, 21 Aug 2026 03:31:55 -0700 (PDT)
X-Received: by 2002:a05:620a:6b1a:b0:937:1097:feb8 with SMTP id af79cd13be357-93739537a62mr334780385a.24.1787308315259;
        Fri, 21 Aug 2026 03:31:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d98b0sm398453166b.6.2026.08.21.03.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:31:54 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:31:51 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org,
        tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 13/13] arm64: dts: qcom: Add SM7250 devicetree file
Message-ID: <cgpmlh6hw3n67bgc7sxjrrixkxrxfsajnwwwucqzklef7zkusr@xiafwn2agcja>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
 <20260821081125.4522-14-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821081125.4522-14-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX4yZ6HZKl7V3L
 AI3J8+OmMG2PRTzXwWNr7GXnmMv2/LTz3uaLl2TrWRSHr6Fs534rwbk+jk8c+ipltHTeeJSgQc/
 zf2i+FzswwklaT9reihWzqU+i80p6JxA4q9AWvkvj8kr1u/E024FS/25LRFuufwG6BiZfnvOnO4
 Muusyr8CZ7COR9hmgTA9chZRbHejZpi5CvEdcE59V+MbK3u9O1SjLdnRS1Ed9uEtCt8piwF14uD
 nSOV3YdPBkb3muLn3B3UNfIfWVvlSjYMu/lidor7jVbU6/nGUgAZTKnousPNH7e3sA7ripCOdfL
 Nm7h3rgSJMxgLPTr4aAYZAnZ0M1idwxo8seNQs/P6PhHxVouKZMcjIh2xM3S+BLLsJdhRs/qO6V
 IG4RgQctdlah/tYyLIPdL34D/Y7DYrRsnmVrsDA8/YvPh8h+3UKUYDFTxuhQH0/xG1izxE0k9Yl
 iSfsuzlhnE8IEdqhtSA==
X-Proofpoint-ORIG-GUID: eaVWXIuILTDSsja3XjP3kLfvRTbBJrGx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX+pPnSa6Axp8b
 7dTdgY7kOfsIGGJkGEgTirKDUKvFrebXVT6ckb7EOWH5c1nl7K2crIjdQWQuqzaLLQfqVe0XKJP
 U7lcjyf/L7Jo6JNSLdoqIXq4THm8Ud4=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a88291c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=Ik05HghEHh1AHjvg2kYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eaVWXIuILTDSsja3XjP3kLfvRTbBJrGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

On 26-08-21 08:11:25, Sreeshankar K wrote:
> Add base devicetree file for SM7250 SoC.
> This file adds the basic nodes like cpu, psci and other required
> configuration for booting up to the serial console.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7250.dtsi | 612 +++++++++++++++++++++++++++
>  1 file changed, 612 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> new file mode 100644
> index 000000000..7caa11c80
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> @@ -0,0 +1,612 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm7250-gcc.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +

[...]

> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo475";
> +			reg = <0x0 0x300>;
> +			clocks = <&cpufreq_hw 0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_300>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
> +			#cooling-cells = <2>;

No capacity-dmips-mhz and dynamic-power-coefficient ?

> +
> +			l2_300: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-size = <0x20000>;
> +				cache-unified;
> +				next-level-cache = <&l3_0>;
> +			};
> +		};
> +
> +		cpu4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo475";
> +			reg = <0x0 0x400>;
> +			clocks = <&cpufreq_hw 0>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <100>;
> +			next-level-cache = <&l2_400>;
> +			qcom,freq-domain = <&cpufreq_hw 0>;
> +			#cooling-cells = <2>;
> +
> +			l2_400: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-size = <0x20000>;
> +				cache-unified;
> +				next-level-cache = <&l3_0>;
> +			};
> +		};
> +

[...]

> +
> +		apps_rsc: rsc@18200000 {
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x0 0x18200000 0x0 0x10000>,
> +			      <0x0 0x18210000 0x0 0x10000>,
> +			      <0x0 0x18220000 0x0 0x10000>;
> +			reg-names = "drv-0", "drv-1", "drv-2";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			label = "apps_rsc";
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
> +					  <WAKE_TCS    3>, <CONTROL_TCS 1>;

No power domain ?

