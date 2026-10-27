Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089711;
	b=WgE3UxI0JwEyWIxdMetnqGoa2rWUz4ZE9YLTDizSKPjS+qZ3L6KotP2tRi0kPwo5oDbG
	 U507cWb+fE4tJ00k4X7AjPPhTVYDaMBuQlTZxxjpgUW2CeF4r+MgT3IgYKx/nV5bkMbk1
	 BxyhiiyVMbmW/USfR1kp2RAYJ/ed+qxRip8VIcdVOTXRelLk1hok9uDeTXy30y7QEnN58
	 bnduVpWRJavPx7TuMr3h7uoV8YGbGF8TcuaW5rlWnmwQKqbPBDWZQf26Q4Yw1nj+d2Z05
	 TaugSNkU+Q9VsleJawDobaxp9vdAriDRGQLvOgzlnv1urYMw+v9ZwlIdLlsnuImHu5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+lO09KkTAsM7ProbM/oc2Ec9Kk1EVdkd8GU8zKqLcjw=;
	b=sqGddIaskxaTDDuGYjJT572CzQFI8EzdLkFhkpgJgnLRFOr/RtbJlerHIfEzmftdzzhz
	 f+MQBE77MdndA1w2Z4nLKnigook4GixRMGxXO8+dhNUNb1lsPJ0lKXghucMtC19pBbnKs
	 nCXSgGoudUDotgDcLY8GuLxGeJqNgWAIgGxVSuBEd4N9461q8UYLx0A+UJUZJjpYT/Ien
	 Tkyu1z+4C51SPzXs0Lls75lpQqoB7mFNjZNboPD64wd+sEhekn6akP6n6+1iTlLVam4tN
	 EuHyaJxcO0KmwrWwoiAD/oOSg3g59gNojKiJDHupSf6vvQsKZir2+CHYY6SQPFfLdpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GlbFyay7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOKkjIOE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3294606A323
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3294606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GlbFyay7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOKkjIOE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z6C82337076
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lO09KkTAsM7ProbM/oc2Ec9Kk1EVdkd8GU8zKqLcjw=; b=GlbFyay7dsKQ9ONj
	Lj/uYjVSZ75LQTwtVnw+tCNv/wTfopqDcEJ0yjqd4xxymac5LTN/wtZ9c37sqrdz
	m+RqgmI5dkYJAg8JyyJx3Nt45q5KKCWIpZSC4T6co91RCnRsnojpe7MXpAwqtfL5
	w4bgb4COYr3OeDyJ7lDoeXtlslqt8s+Z6H9iq1dlbTNW6pyg0xeQRWLBvXnHfHTn
	6DQf8YRnKb+TuuRFKS5UQI9q/oKzOjrlNj3cjyBbFIjCo6VgVOeP1ufuUT5diUem
	rClYF2XWK0ldpygT74Q/Ta2X9WMC53IPT7ngtN3b4Ky+jq3R6YODlrHxnjetmOgG
	A+BPlA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3da3nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:28:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so5393362c88.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089709; x=1793694509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lO09KkTAsM7ProbM/oc2Ec9Kk1EVdkd8GU8zKqLcjw=;
        b=cOKkjIOECaLzaqzzbCElC/reN3ZRiJ2LMz8/Q9jrv992ZG17jhW5epqYdN5g/kOEjN
         7yMBimWU6rN2+rtY+871NjsWTSI3SrV9OVsJmPiXXltW5E0uEQvhHeEu1rkS6xnx4z/C
         J+auHE9W5dfgFsnaLbjbz3g4wTeuUrip4d83/XXyW2nGWuDPIMHhqc9UrY2jwEQI8dAT
         6oJbw/VW127ZN7HrCwrlyk6YGN5NWCFq/PYeiyqMFgD3dWEyVPlQYma1ZwrwNhro9YCl
         oNulmnttgMAw1QWi9Lhcbgc9jNrgHtlwovAdYG4MgNYdlhEyRD41TF7e8EqoiyuOZ4/g
         Rkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089709; x=1793694509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lO09KkTAsM7ProbM/oc2Ec9Kk1EVdkd8GU8zKqLcjw=;
        b=m0prugjJVwhD0rXFDwb8Bog8Qoku6j364gB33jyXmoLqTSTpBkKDFW6p/kA+5ph3hL
         4DmLzm8ogFUOWSM7lShXO91P5g1l+m81S/ohvwWjAFu34k6KZOqLyufIR3SrUJ1zze4+
         LuIp+gfO70dmnY7ihbR4GXk5DqtyjlcCpPKozOCZFlawFuoE7HtnU7K6HV/rOqCQgg4h
         4pQjUE43o+FM4yhqDIy2fcfAeDsLqPx1QZV7BM4aHU1qXIzStKIzLL56RDa/FSo2+4CV
         PA7z2AZSAo2pI5+3LTPTH5TK/bQwuvajO8VGcVIiMMHYPP/2G98OBWeDxnDhof10x+R6
         JR+g==
X-Forwarded-Encrypted: i=1; AKwUvBxKcFMkh/Ow6K+V2dRcVFEWoZQ8NUcmkINu8Hl6GJD0boCDJw581lfglW2mzFotMMBcsOhKUtoZpVeI@vger.kernel.org
X-Gm-Message-State: AFq9FYJay04hfDBZ2FKeD13vqgI8E8xROJ0M7syVQnhQXXMMpQYKxb3h
	afYy7t9lCqzpOygr55gvwMsGun5Cz0guhCsen15CqoSiaBDm12+do/55y4G9azVeSVg2SaXDrjt
	bnltaG9jVwM12mVk/LEV6TlvEWQ5gqnXZ19gZ0o4xnqAgCxxz8uWdG7omlwA9lhnfsLYgcZiI
X-Gm-Gg: AYBFou0+rewrqS78uUpIrYbQoSfhVXM6n63y2sCUJbRrnUhFkuxaDd+j130AgkDx1gC
	Zuei2pY5L/qx+llrN8HGZNJlsokCkU1xYXER55MD4PxTnzmSC1KEnxu2xAv0KdI5icU/jli1X0G
	PsnyhS2zsg0SbMiPBuIXewIFYQk7f+Jb87heam+Rv1SZKHEBH8WWiS8bB4fVWkdtMf/dzILWQxF
	VjOTzjgkBCPpDJVJ1HDTSv5QdK4H1jXghiUFOxfUAf/0j5wovvqzKB/bmi0K+IN8kz1xphbl+9I
	StSM154mimC23yJRuC3kigxv6SFk5u9I0+i6vykcEllhMr5TV+/WlmwAa4H9h7Tb39ezVw2u8V8
	WuVDolhPG1SHsC7sOaJA4nG5+t82XLFnvEmJA
X-Received: by 2002:a05:7022:e10:b0:14b:cf58:ce15 with SMTP id a92af1059eb24-199377d8c81mr19690495c88.43.1793089708925;
        Tue, 27 Oct 2026 01:28:28 -0700 (PDT)
X-Received: by 2002:a05:7022:e10:b0:14b:cf58:ce15 with SMTP id a92af1059eb24-199377d8c81mr19690386c88.43.1793089708019;
        Tue, 27 Oct 2026 01:28:28 -0700 (PDT)
Received: from [10.217.241.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm65866768c88.17.2026.10.27.01.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:28:27 -0700 (PDT)
Message-ID: <d08f576f-7255-402b-8eaf-41e0d3acc207@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:58:21 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
 <3btrmmavq65lp7rwmdx76qjvaseaoa55xdibdli2izujusebhw@fkrtjiqsnvnt>
Content-Language: en-US
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
In-Reply-To: <3btrmmavq65lp7rwmdx76qjvaseaoa55xdibdli2izujusebhw@fkrtjiqsnvnt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX8wZeotkooltm
 ac12P6c7CbAqX/rB8qmUwsdYfGDFoARsEXCwEBNlwbCKBaqxYPaEg1wfulRgj331/xteCpKwsPe
 zcl4gpDKs9c/hRVMJjeeYhUYU8/g2hI=
X-Proofpoint-GUID: MnE7nt2947nXVI6XtpW52yHG8p08CAJ8
X-Proofpoint-ORIG-GUID: MnE7nt2947nXVI6XtpW52yHG8p08CAJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX4jLK/pq77u6S
 700fUiSpbBO+GTrTdHl1Elt9lOaTr91OZnNyJBblfyZGap3mUmQugN+8OsbWBYLWROd8/662jxC
 9rQqK1YYf1DyLF1DAXFj05scg4OxhiD96I8tfNzlL4gtm9H+UXa/SX0hhW7C8Ipr3gX1W7QGfwu
 1HjOj6/NFVcK/pO+4fcR/rQV2Zbs4RLEPgpbF4zzngMR7tb7lz4pYytKxVfGbRDBVEC8OH8oo4Z
 843sclxKqH6ik1m4F4F7t4U39OvV29dbWbpn85xjL2pPBK7q/DakZFFAfvXGjl9uZIzPuX+OSAq
 cnduhiwAIiRf2SvQMy9kpqZAtsKXNyGWN3OeRmtQKifg6zDG8FCpI5zPsJMI+H7Oz8hdl+axd5S
 p3Y+zkoZX6mz5imjQSHYvNVm9cQbx3ykpn1m//ihQSSzvYX9RfVRQ8EkRTxnzN+qSsDa8TwpjvT
 hA37rHBXFtpNd4jPRCA==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae060ad cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jkk_kXO6dKdktKeh6coA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033



On 10/19/2026 5:35 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 19, 2026 at 03:57:34PM +0530, Gopikishan Thawre wrote:
>> Add the device tree for the LeMans Draco EVK platform which combines
>> the LeMans Draco EVK SoM and Draco carrier board.
>>
>> This device tree adds board-specific peripheral configuration on top
>> of the SoM, including:
>>
>> - I2C GPIO expanders (TCA6416/PCA9534) on i2c2 and i2c18
>> - EEPROM with MAC address nvmem layout on i2c18
>> - Native DisplayPort output (DP0-DP3)
>> - Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
>> - ST33HTPM TPM over SPI16
>> - AMC6821 fan controller on i2c4
>>
>> Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
>> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> Co-developed-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
>> Signed-off-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
>> Co-developed-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
>> Signed-off-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
>> Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   5 +
>>   arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 543 ++++++++++++++++++++++++++
>>   2 files changed, 548 insertions(+)
>>
>> +
>> +&i2c2 {
>> +	status = "okay";
>> +
>> +	expander0: gpio@20 {
>> +		compatible = "ti,tca6416";
>> +		reg = <0x20>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander1: gpio@21 {
>> +		compatible = "ti,tca6416";
>> +		reg = <0x21>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander2: gpio@22 {
>> +		compatible = "ti,tca6416";
>> +		reg = <0x22>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander3: gpio@23 {
>> +		compatible = "ti,tca6416";
>> +		reg = <0x23>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander4: gpio@38 {
>> +		compatible = "nxp,pca9534";
>> +		reg = <0x38>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +};
>> +
>> +&tlmm {
> 
> Please make sure to sort your DT file. You have 'tlmm' node between
> 'i2c2' and 'i2c18'.
> 
>> +
>> +	dp2_hot_plug_det: dp2-hot-plug-det-state {
>> +		pins = "gpio104";
>> +		function = "edp2_hot";
>> +		bias-disable;
>> +	};
>> +
>> +	dp3_hot_plug_det: dp3-hot-plug-det-state {
>> +		pins = "gpio103";
>> +		function = "edp3_hot";
>> +		bias-disable;
>> +	};
>> +
>> +	ethernet0_default: ethernet0-default-state {
>> +		ethernet0_mdc: ethernet0-mdc-pins {
>> +			pins = "gpio8";
>> +			function = "emac0_mdc";
>> +			drive-strength = <16>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		ethernet0_mdio: ethernet0-mdio-pins {
>> +			pins = "gpio9";
>> +			function = "emac0_mdio";
>> +			drive-strength = <16>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	ethernet1_default: ethernet1-default-state {
>> +		ethernet1_mdc: ethernet1-mdc-pins {
>> +			pins = "gpio20";
>> +			function = "emac1_mdc";
>> +			drive-strength = <16>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		ethernet1_mdio: ethernet1-mdio-pins {
>> +			pins = "gpio21";
>> +			function = "emac1_mdio";
>> +			drive-strength = <16>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +};
>> +
>> +&i2c18 {
>> +	status = "okay";
>> +
>> +	expander5: gpio@3c {
>> +		compatible = "nxp,pca9534";
>> +		reg = <0x3c>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	eeprom@50 {
>> +		compatible = "giantec,gt24c256c", "atmel,24c256";
>> +		reg = <0x50>;
>> +		pagesize = <64>;
>> +
>> +		nvmem-layout {
>> +			compatible = "fixed-layout";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			mac_addr0: mac-addr@0 {
>> +				reg = <0x0 0x6>;
>> +			};
>> +
>> +			mac_addr1: mac-addr@6 {
>> +				reg = <0x6 0x6>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c4 {
> 
> More of the nodes in the wrong order. Please go through the whole file.

Thanks for the review. The entire DT file will be sorted alphabetically
in v2.

Best regards,
Gopikishan

> 
>> +	status = "okay";
>> +
>> +	fan_controller: fan@1a {
>> +		compatible = "ti,amc6821";
>> +		reg = <0x1a>;
>> +		#pwm-cells = <2>;
>> +
>> +		fan {
>> +			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
>> +		};
>> +	};
>> +};
>> +
> 

