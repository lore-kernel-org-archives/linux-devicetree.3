Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E540DB43
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374794; cv=none; b=sewfNT7GOVDi8Acf5IvnMF0SGgORE4LZkGDC96ThBRixvQbzF1vii56motMXfBhesQkwaZGbtsgRNi2ZOFtFU58wfDrnVdcURwF3fA27mJUc8N4VUubj97UklMi8yWs1MpMXj1iRwcisyLn/diJsCaiozTZ/RT/sDjC5hPgN05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374794; c=relaxed/simple;
	bh=Z/dnDR91JaOOm7tCQOgtRQXg66Drh2LR1ZgLyfNFPn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F70jCYnE0z4ej8bJBeI5yWaTSERH11jUn1WXXhfKAtAiAQ3B+MxsvCs75ClOiXc6H+G87N7aOEE6GVF8Z0HEvg9gdlP2WSCSuooVnFE9L+xU9gWVSjyI7XCF0quZ32m8VUh1LiIvd8XpH4lH7gPTjpcZA5AILmcEctI+9mItCt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7/H/aIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaiO/pFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7/H/aIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaiO/pFP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7xxpk3490199
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9M8c5GIhlhYtnwXpHSwrc5gl0njHPZHWU2sW5mopQqc=; b=P7/H/aIxjinZ7tbE
	zP1tjSeLbDVKO2j4rcLWnKJX1W9YAm29Wjn+nhi57xi65Cev8mPiYMNpGFXT1Z0B
	sudMWv9tziJMMM7xJCiQLkKINf4zJmp7tDeD60+WJXnSbJuHNG3n+gTEnYiQ/jYH
	79Ts6Nw7+65yPHN+ctk0uJyXbD8MkwU5W3OfERHEug0Nhpr7msnj1GpiTtZ5zdvi
	FWj4I2xXoPkiX9lalTHG2PMDgIyWfvmOFCf081MW7Dl5hkMWMPo2UKIPRblVIIJ0
	WC49ms0CYM0I1Dbgt0vMlvbpG0Syo33/50SYmuz7OG07+6IR6B52DqIUYzs2lDe7
	bVCfEw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f03fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:33:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9102fee9920so3642446d6.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789374790; x=1789979590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9M8c5GIhlhYtnwXpHSwrc5gl0njHPZHWU2sW5mopQqc=;
        b=GaiO/pFPoORytKrGsptXb37jb8ozHG32OVEncmJwD9Qhgw3xh8ICgbzhhaHGfA6rD3
         J7fCF63klZkBsptCZ7pp5c9/xozxISR+0QEuIW/n8EagIRY/OV3GdmNU3JQrK+9Q04Ay
         X3X+iVKRGCCKXW02xovqFUKAdOzSgD4KiszQ7VkajcWzln6ZC08/c5A5+5K/yc9CGD8g
         ku3WU25zIySlD7wsBQ1hyudaCvK6x1g2hy2yCNmkLZx3AXzChilreoeB87IYEfR6e0y7
         wpjzS7kpvzSpEmlC63nTj9gEjNfCCMC6XZfyRWW5zioUgOLSBn45nboYHzU+H/8aIwzz
         Rheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374790; x=1789979590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9M8c5GIhlhYtnwXpHSwrc5gl0njHPZHWU2sW5mopQqc=;
        b=r0gkMZIfzmMwb8errzSk1CKEdTJXFwDCUQ229Ci/Irut4/X1/Hi0BCXQnlfDpf/ykr
         xmMB7HemVvzeVx5h/JDuhybLVuk7qeWr5jRVFhFzD0/AOQ/gJw/4SdjcSwNXyzQ/YS9a
         c6y089VivzNmEtIFyGYONHvzlh9EbDjizppmqM8IM7PfkFoTGgqZ2s0DMIW917vyiqT6
         oJ+iHqVoHM2lSRf2rY2Ea7rdmW1nEFhAZeZ5FW9eSWZtDw9qF3UaR94HFZWZKFIg6lan
         2mftDLaGJkT8K9ZRv3cACuDbQYqdSwMvsKWeiN6VKkYqf7KnmeRrN6AYNJsvdxvvO/dM
         XeZg==
X-Forwarded-Encrypted: i=1; AKwUvBzh3PhmbSvrYod2CNDTqSXd6w9vjI0sqbapKYktCGT3x7m/e5/9VvVbhA2TVE+nENzDkpoS9BxHzpkH@vger.kernel.org
X-Gm-Message-State: AFuF++negoaqgbXE2isVTAtQvqRoMi7gSTsLYiiRbX1EmDZFpWV/6//3
	JsOOgwJ6+p6cqsjbeiGghUP5Xu4NwVMLxEBCejB18AoJzaxfC+StlNcdLBSdfyHJ4xHyFHl4IWm
	tkZvPdofNNek3TvCQ0t9unzCLDW4/yTKHd5MuBpqPEX/5VwAVSxrVwTo+4UUazwpJ
X-Gm-Gg: AYBFou29+ipGo307QU9x193VK7RWh8sZBFWRJFUaS/+ytpkZZbpsHtK9NQodJ3wEyWb
	r7BYg0LjjN/gUn0DIuLehDSyAy9ZZDsW1+ZIAWRm7tW5A70bu1E8QilovI0veTkATcsqOR42x4o
	3OIUZEbkitY3Xz06rwvcfOfVzQnZch+7RNwogeo4x3nBNtrRB0yTGFqy2UYiu2M6Gwbr6wCfT3o
	QUp0mIfA1TrHF7hsGtmnEtLGL1D4aMG773vaPYBM/EPphL/q7tQQZLDY1gAUZvJ2IuNbE0vVUr+
	ynscbXzWYIz6rOij5UkCzbV0u2+3eqeiSnB9XNUvInjJbQS1uJOabC7HLmDlIGUTE9EfD54WxWt
	ErUpJUbxZt8R4g1ts5ivA9Q==
X-Received: by 2002:a05:6214:246b:b0:8e9:ee1f:6631 with SMTP id 6a1803df08f44-9122e65fae8mr19414596d6.3.1789374790336;
        Mon, 14 Sep 2026 01:33:10 -0700 (PDT)
X-Received: by 2002:a05:6214:246b:b0:8e9:ee1f:6631 with SMTP id 6a1803df08f44-9122e65fae8mr19413986d6.3.1789374789717;
        Mon, 14 Sep 2026 01:33:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5951c89sm3670269a12.26.2026.09.14.01.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:33:08 -0700 (PDT)
Message-ID: <f04ee103-ada5-41bc-88e7-7380b2b38e98@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:33:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord: Add the USB controller nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C6GdrQtgr1A-dLWkJNjzcp79KvocklpV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMCBTYWx0ZWRfX1Ygev5ZKl8VZ
 jj+yT+6ndqW1TXN6PaNZzGbsGB6ioEc9CHB4eG5pG148kNw0Qp/aqjSI9t66N69MMHmN3+K9XWf
 KqaU4uRo7Vq+21VZi36wvGX/NqR/T3U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMCBTYWx0ZWRfX5S7u7R/DwIVb
 OMF2wIpVG5LpGzf+Ehi/nYGUqAPQ0nbeniEAev5bVfc1nL6798yGlax2NOLXIalt7+BFmzIA5oM
 x9l5Xah91pG/FdPWd9y2mn4y/tavUp66iVpg16pwKee+RoSEzyBmC6jB0JCCLQi8xhTw2unRAUh
 HNKtHwJ7k8nnliezH3nl3RV6YgO8+EbBgOIP96MwHo1utsDN6U5Yj9AGRYvPqw68GvUq+c/I9IE
 8GrFc+NyR4J3TcYNUkbs8MdmOvrb2lrfHl7cf9IZjlA5KHRkRv2Cwu2yx5vmTdX5v9qwMCAhdoq
 Sm31SromVc3pqjqf3ZRJwyzsjzLj4wMq0YT7pEUpPmD03YP8EG8rIr+sWDd+RGy8Gtt139PavWl
 QzNxJPyrO64joXuTMvzzQJiHL6+V1JqAofKhRxcJdPNbIg23DSLbnolvP6EebWOLd0rimIzC5Y0
 fddEZ9tfajfiAAX+WEg==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7b147 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=08BlROG3YVwwi0i9V5UA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: C6GdrQtgr1A-dLWkJNjzcp79KvocklpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140120

On 9/11/26 4:20 PM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the base nodes for the three DWC3 USB controllers. These carry only
> the SoC-invariant properties and are disabled by default. The extension
> for the embedded Nord variant and relevant board files will add the
> platform resources and enable them.

[...]

> +		usb_2: usb@a200000 {
> +			compatible = "qcom,nord-dwc3",
> +				     "qcom,snps-dwc3";
> +			reg = <0x0 0x0a200000 0x0 0xfc100>;
> +
> +			interrupts-extended = <&intc GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq";

There's also a hs_phy_irq @ SPI 908
> +
> +			iommus = <&apps_smmu_0 0x14e0 0x0>;
> +
> +			dma-coherent;
> +			wakeup-source;
> +
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;

This is a suspiciously short list of quirks..
> +
> +			maximum-speed = "high-speed";
> +
> +			qcom,select-utmi-as-pipe-clk;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_1: usb@a400000 {
> +			compatible = "qcom,nord-dwc3",
> +				     "qcom,snps-dwc3";
> +			reg = <0x0 0x0a400000 0x0 0xfc100>;
> +
> +			interrupts-extended = <&intc GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 41 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";

hs_phy_irq @ SPI 919

> +
> +			iommus = <&apps_smmu_0 0x15c0 0x0>;
> +
> +			dma-coherent;
> +			wakeup-source;
> +
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_0: usb@a600000 {
> +			compatible = "qcom,nord-dwc3",
> +				     "qcom,snps-dwc3";
> +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> +
> +			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";

hs_phy_irq @ SPI 131

Konrad
