Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BD3367B6D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896939; cv=none; b=QsXlFuSVYNf8tQcqDTPnroLA4SEqxoq/ZKeOh8S55GbEtm8H5Eq9rGPupvIXh9Xn1vpUOwXFSs/U8foaD0JTQfGzXD3H1IyQ1c80lYwFqTvG5VgfyczRhkbTTwrqvV4AnpjfovEx0jskE2lvOmqBF1j5nH5Se1Wa8Bt3jxLNFQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896939; c=relaxed/simple;
	bh=VXlgY6yBKKENxS58xUaTNOehcbEaALlRr1BWIPibsIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmS5epk467JaKIdizG23oxqLhAc0Bg8H6OWzBJtZ3Szk7fnM1Qljv0ptc6DhQOlhen3gjUrzBwmmZNeyvx0P+PDG38SaD+CPiqjNYDidP/g7LcV9MzFX8wVBkAVGkVvcYFOrGwFffwN3zMHQ5wT2Wi9HvHGxGtO97KrN4fg/ykc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcrHGNol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzQX+djN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcrHGNol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzQX+djN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8J0bn3908171
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAZ6h7pS3NOYxML9+7tZMf12qTh19fKQpUSnbPSFty0=; b=YcrHGNolk3SwrlRj
	weQR6DYfpqEbAtYmGRuWY+OdjwzESGprpuGrilInBDoYhRlDdB7jDEr39eRPkr0z
	KjP4FmtKhb3rQHAKSFj3ZeJtgph1sVZsNF3qx6wa3ABWEEc+8DcqXsZeh50JZqFM
	1j3QsftyGmLPBf+Vu/XO/NQGUAMSwaRPSSNc2ovMoGX2C86qQniXNwkVf5PA9bDt
	wvYDR80lHPatGbw8XfPSla5l7z9DcakNUKQ8/FmIeZXIzWqBb3Ckxn6eQTAu/gsC
	PI1aEFIDnjkFbKsceywm+fnxb8PJ+hZCwtGApOh6uDzYclOIA5xz17rl5ah4DC5s
	CYKsRg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xquntc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:08:55 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8461ade272bso24555827b3.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896935; x=1792501735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAZ6h7pS3NOYxML9+7tZMf12qTh19fKQpUSnbPSFty0=;
        b=PzQX+djNY87xJgFJUblHvgVudQPbi2xh657tpbqBe4RZ8DTpGiWKq+GwS+3cFpkmzC
         IX0nB/mODz0W7dKkkMNJZvqQ2RpDtrDi73wj5xZ95l3nYXFpEI2Dfe62lkmgUXCACrXR
         wmqM6bAfPfjyUhHnP+oevcFuTdvT30tpgde/D4cP/PLYehC4lxfncEkuaUPKVMi6MMYL
         DCgyzfYdtfm7LpLcUcUNSOEVYhHem9Xnn9WJdlB5Jkrn9g+uB1Q+kzibXflXROffHuDZ
         CVTqiyC/RtRgCVQi3S0t+J+QZSfho7rM/xCcscbzL/OzbthanCoRjuOEwdvF35fbmbwN
         9aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896935; x=1792501735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAZ6h7pS3NOYxML9+7tZMf12qTh19fKQpUSnbPSFty0=;
        b=zCFDzfTZG9AYWrOBGh/QEk6cd/kMSqpJtYDcWx7FQVpXcGQP9zR6mfZTmzvbMMAHof
         UZCjvQoWn6zo89foxuoArVVPkn1I78buojY/tnAReeEwIO4eE+4E1VJQRxW9M/XYXzHH
         aU6IvpaR81FagqYYdbfZ/hIkPObwRelG4WAqXF/3GmopjwwtGC3doSlv3bZDlcGZg2O1
         Bg9RmomdHkGXLvKUapukbLabIT+n1AEa3XrdDLNEU8GAQioGXzFQQl+BqJQacajWzzer
         H7+9f8gJOQCj6pOGlCKvvTNnvVCRRP5hizWPfqsUBsXXrmbSelQdtzHHDnXsp1EX52ct
         tTEQ==
X-Forwarded-Encrypted: i=1; AKwUvByyA51nfaNhQiI7h8mXGkRv1tmIufn+uvjtgkU+aDlUdkpzQFRzUkJdJIc/w8EZHK1MTpujTj2ajlV/@vger.kernel.org
X-Gm-Message-State: AFq9FYImf56+AtDJlxBXacfCCBRU2K7QW1DbZ7KhZ2ZAjGEjG6W6nGv6
	1Bxc8lIdnoKtgSxEMKRXGrRyJoZcf5VKohYAX5XhHcfJdzhTO04KXJdQA4nC5s1UPAvPoh87x59
	F9E/oeFL4RKi5Q9e+Z9nGBM0IuZ5b4ay9YNSncC06V5JGGPvKzhOJfw1f+DwoylSR
X-Gm-Gg: AYBFou1IWtvzqXzpj66rCukH4C2AdjjpvSMMT67tkUjlPCxF2DHemvo27v2uPfKUH2e
	UVGhVk49h593/Z7PLmytErG5uoTLFroWOAfJIiUm1jUox22eBaiTIQF8Z8oZgSNDf74l+wR3oBo
	jCnX7DgbLIie6VyndwJjhZvDYMdRfQBVxwC386ZWXJUjiX0+ZA+2Amcaev5pRo3Htyf7WI0M8cF
	7Ae5GLdLDnGWLijbL6I9CvJzp+cxSJbKqsvzFnOHYauPdNO+Q/r+kGLsWuBeYaohUWzy5o75K45
	XibwZ7nsOH0kOsC9r6z7jwMJ08UNMEPbzYjzbzZYeTgimVTwnbl2KPEo879SSIpkA++Mzl/jEnv
	dxXrMqAKHSO4IM0lQfexqhTiFLT8q659WfsJqCxs3spo=
X-Received: by 2002:a05:690c:d8c:b0:8ac:c329:6835 with SMTP id 00721157ae682-8b07ed07cb1mr44775967b3.7.1791896935386;
        Tue, 13 Oct 2026 06:08:55 -0700 (PDT)
X-Received: by 2002:a05:690c:d8c:b0:8ac:c329:6835 with SMTP id 00721157ae682-8b07ed07cb1mr44775877b3.7.1791896934949;
        Tue, 13 Oct 2026 06:08:54 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee83bb9sm46061337b3.2.2026.10.13.06.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:08:54 -0700 (PDT)
Message-ID: <06e6868a-c106-40b1-85fb-5ebbc01eff16@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:38:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-9-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-9-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfXzsuucvxqO7qq
 smztwqhWF1rdlpK3HRlnKBsYRw1m31ZkXRYvEeg1PoGo+UAy12X6DIEvtMkHuOz1Qjv9phchrZN
 wMuGU/muY4km+Mkggid14tUwectHGtKlfPiH+qjH2XXeZFwU5b2NZmJ8h6AP9by89x0Djduk7MF
 quxaJQB/KUAHk0zswER9f//XOP+LJksCu1hyJCJg4FJEpzG5NrdIY6WguZfn7OLBk2CMle9LLwR
 lDQbWYjYdBkiw6Buwi7/bTA8LStNc4ljxhbRqWZrFw9XmSBl2zKOJduwbsnBzu6w9daD9IGCZ1r
 ICNcVnr4GL8DbIPi/+GyMkSrVYoZs0i5LnbDl879n7gztEz1b5Zis57wvWm7bDh7DyEcScJUlIc
 ZKLWPg1cCnVMXwTgrPEvzS77Zmtkos1qfNBho4QzFo261kXMqFdzS0X+ynFn4fNvC9wggjay34o
 1mBEtG9JzbVvpL/Bipg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfXzuQd4xs59I81
 b3qXwnU7Vq+N32014JesPvM4mdPRTlKconU9dR/U/MFB7Cg2eXIgEivCIuX5uM2tmfL8SO/sPwp
 qKqLvQNBiqroZao4O97KPC8a+uk28XU=
X-Proofpoint-ORIG-GUID: SvkHBSB725u7DFARv1UqIpWw7R8jZ4mY
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace2d67 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RIkHY3iu5ay2cf1b8NoA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: SvkHBSB725u7DFARv1UqIpWw7R8jZ4mY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052


On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
> Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
> the required pin configuration on RDP504.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>   .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 23 ++++++++++++
>   arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 42 ++++++++++++++++++++++
>   2 files changed, 65 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> index 0f7a8f2d886b..0fd85b78e5b7 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> @@ -59,6 +59,13 @@ vreg_misc_0p925: regulator-usb-0p925 {
>   	};
>   };
>   
> +&i2c0 {
> +	pinctrl-0 = <&qup_i2c0_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
>   &pcie0 {
>   	pinctrl-0 = <&pcie0_default_state>;
>   	pinctrl-names = "default";
> @@ -197,6 +204,22 @@ clock-pins {
>   		};
>   	};
>   
> +	qup_i2c0_default: qup-i2c0-default-state {
> +		qup-i2c0-scl-pins {
> +			pins = "gpio20";
> +			function = "qup_se2";
> +			drive-strength = <6>;
> +			bias-pull-up;
> +		};
> +
> +		qup-i2c0-sda-pins {
> +			pins = "gpio21";
> +			function = "qup_se2";
> +			drive-strength = <6>;
> +			bias-pull-up;
> +		};

We can combine these 2 pins definition into one.

> +	};
> +
>   	qup_uart1_default_state: qup-uart1-default-state {
>   		pins = "gpio38", "gpio39";
>   		function = "qup_se1";
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index 22ab99ca0903..fdfeedcf5618 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -427,6 +427,48 @@ uart1: serial@1a84000 {
>   
>   				status = "disabled";
>   			};
> +
> +			i2c0: i2c@1a88000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0x01a88000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
> +				clock-names = "se";
> +				clock-frequency = <400000>;
> +				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
> +				assigned-clock-rates = <32000000>;

We should use opp-table as mentioned here [1]

[1] 
https://lore.kernel.org/linux-arm-msm/9597ab85-6c91-4e76-b160-0257bc4c5412@oss.qualcomm.com/

> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c@1a8c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0x01a8c000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
> +				clock-names = "se";
> +				clock-frequency = <400000>;
> +				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
> +				assigned-clock-rates = <32000000>;
> +				status = "disabled";
> +			};
> +
> +			i2c2: i2c@1a94000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0x0 0x01a94000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
> +				clock-names = "se";
> +				clock-frequency = <400000>;
> +				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
> +				assigned-clock-rates = <32000000>;
> +				status = "disabled";
> +			};
>   		};
>   
>   		sdhc: mmc@7804000 {
>
