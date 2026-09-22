Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A35616DE
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092413; cv=none; b=teA1iAaHco89m/95A1qFjVoB6XfXVsbeU+qq7EgDywLXuqqe8LF/OEpL/YYZlQyT6mzYLZ/Gk2C5CaInAcKAUfwTZCkp76FmRc9YbuaPlHkzTez3gmRjDi1hg0cKYWrPOA+j9GE+UlqnvNr1+t3BiusedR9H3QVCKebjjfTZXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092413; c=relaxed/simple;
	bh=1ox+s3r/Lp49qOJnR5SlvSJcD70klbBFmDZHc2fBQ8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jniw37BIekAG25A7bajQi8cV6ZhaM9ubCRXLGnc5gONlxPJyiptpVU08jTgIDXfn8wqc6Gig4djzTpbDhDNb2XU6BIMpQ6xKHMk4BGEtVXsgao4QXwKN3VbB8CGVzo9ocvBWlWlFzuUQuGu9xDaWfItb76Lcl3vXnejIXNS7o8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBnaACdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mel9eLD8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBnaACdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mel9eLD8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjdQu898359
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=; b=EBnaACdN35LR0TSm
	uT7siCIIr5YiLkdMaOTc9tROU7tlR1y1s+UzHutqFfBbi8+Ch3QYxsUyHahLSxvC
	ejOgaI3Do89ZrKpZB87X3Y7Vvk+nsf7Mu0rGc5bgpdfLblnByGMve4+u6tTf8P2x
	x2BHtRANSr0XizjIT+lSyqYeD6brKrPMxeih3imdpakpN4v3BE5cu/vHNEvLa4z6
	oCLQ4vZmTHpwv4QgHFjVD8MdQku3ZmQyyREBT4JyPXbSHk4i9oUYH0p9KM+SxUjw
	JaLMj4gMa70WzUgdXcZkwAIKBh79nbkbR/r7yzNQcreW6va/2xOQ/ga3dXCr4NjR
	f70nsw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkktf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:53:26 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9ea608ed0so69787e0c.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092406; x=1790697206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=;
        b=Mel9eLD8/NyrconfXiHVeNdYM5hH2iCDDCH9BwcCkpDvlvAiN5wy8dI79K0JjLaTXD
         RdMIkQYm/Q88BTHHuO/R6dH85vNQoeQ6I/JuzoL/l1+anEXVcAb4PmjqEdvooXiV9651
         xEmw0MptBbY8+UGcumKTRQ8ulKV+GDUDxj/Wjfk3axhqqeJQOKgExpbz5f5bCGaG0y3U
         S4hFKpE8x13S7oYBcbs+gRp+mxnH1Vi+DwARQNXcxIV0HK/5eP7eDRA755nc8XUHwGPU
         PG2nDE1mB8Shcy9+caAjpuNlOxWiFIcNhNRlefu/tEQ4Q5+Izgg7j/DsaCI8CWT3TydX
         0+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092406; x=1790697206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=;
        b=spFjnsP05/vkwuTOr/6BRF9uPr1gLMXsPj3fsZwqSzvGBhHU8v5GLqpW08gYQsgnW/
         JBno1YaubeWv4fHfmNwmGR0DESNtWZgEqb2f7yiWxFribDzVqeT4Db+pkfVaxyVJ33M1
         nZ/vH0WxAvrhpwA/zmRjQtH5LdL5HO32ZOX7CU6e1OfRAM/0UFFaXRNNCx4o4rB+JGR5
         uhGiplvJy4HPEir8qMMKKuB9ujW1DI7Pv1h3yXhLuerno5uVwX8BT025ofGgf/LsB0ES
         elroOyeoWYFNN+h8ihM3+cZKLa4GjXFIDxlEiHFs0SsxMVNYInRIsmmiEDj2Rheo3Vvz
         pNeg==
X-Forwarded-Encrypted: i=1; AKwUvBysw25+eGaYA1ltXwu+QuyNy4VDwxowquVcjZnA4nzTpsPP4LHSDLMmc46oX7yy6k5huRI2sG0PYmIw@vger.kernel.org
X-Gm-Message-State: AFuF++lHQ/vcE5wBIpLAVbxruq3sMX00umqpZjWIzXu205XSnDRuJZ5S
	vimwIfYWv3QOARFu7fPTncVMiHX3S/eM5N9CT5Lv/49bgGSVn+63kk7qWVd0LL0KSYnY2jGkHeg
	Q5cyHpaP49yrA311lJCyEPTvYSETgSFxTgFIy0s6NJiW53lS76aQI+im2nW7muXPF
X-Gm-Gg: AYBFou09n+dbg/ORziMqbDsPAUwGwUT3KQjxi+jGp5eaRFze5OI67rxpzRCZCc8iSJ6
	5QPc26vuMUiGG5k+aFtSoib/UGIT9WEut7cswp64FX6w+3cSQw8olTZeO2lGRoAVnsScKgpOWd0
	PXwgZcuXTv6m1a2hm0JUSTCfqTrqi1Qsf/LXsgae7Wy9Ey4F0yb1gtpIX+fC2bwcUf4ubzUVX5K
	aXoHu3uiRes4x1tR65DEiEDZ7CIEQdGjYKTnUtcfA4+5JiEiA1xz0tNncWkoXZ72pZ/rxMyTaHD
	IaVuI+pOCEdqcqySyFURR4wpfqBdDceoPMi6n9tlcAmFGkaPONKfXj5NTXxSCWh0+RAr+Y5jF5J
	3X+KFcuDfrGUCN2AAGR1BTA==
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr6422294137.0.1790092405806;
        Tue, 22 Sep 2026 08:53:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr6422236137.0.1790092405243;
        Tue, 22 Sep 2026 08:53:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c583022sm109114066b.29.2026.09.22.08.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:24 -0700 (PDT)
Message-ID: <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:53:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2a476 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EY8lGxjS-5OGnG_HtjIA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vn0RgwnrIwGo6EHEXzS4ZDSBNIeuSc1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX8zj+6niH+Ubb
 dRVcTruK/laM+T3gRSpcaBz/HbONvQTX7JouU3sQhsBm46sq1M+/j2J1qwciBi2QU8t5SHrOsLD
 qJgW5mUtW9U8/bS7+Tbi8Z6Gvhjofg/6lAn3AmFYgLP+ymPajizjAM0UychUqjCGbGV7DzDvO1d
 Kei7exahFpfVuFN7lqY7SS8DHsHHXAQAHhLdZ3FCSX73Ft4mHd0f5m+JlM8cn43W9H/x2V1q8fa
 pin+Ed24A4c2PLWexIqKJt2MiB9rbq2sJuFUOcC5Cu1nNG7uNtw/vTMVuiGs/RwHj1YfBwBldYW
 Xlj4zYXmWO1Y4qcs7JbN168Ly2J1bQEqCrpLbJ/mFe7Z7I1l5I8AgiKeOhvsMQ3M+6wLu6j1fN/
 pYuf/xse8ekkpYizNvygm/CVA4Ako+dS+3dM1nX5M/eSyrqsPqcmgOYGYc+DNCT0nc1VcLkKhNp
 aPCYGGkzKOUmXXMMHpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX9BHYtKjBR1fm
 awRKISCkuRIYgdsB63+4UnT2WIaJqHd06V+vzloSAGk7iAYZ95h6Ctjd8Pu0ysT1mSJJ8KWhBxo
 1Y0NzQ9wa/TE9BpKo97fM1is4J6FYJ8=
X-Proofpoint-GUID: vn0RgwnrIwGo6EHEXzS4ZDSBNIeuSc1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

[...]

> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};

Please realign this vs the hamoa series - define a port in the SoC
DTSI and reference it here

https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org/

Konrad
