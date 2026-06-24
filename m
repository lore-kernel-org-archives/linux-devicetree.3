Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1221126A1CF
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302448; cv=none; b=itqaVnSAOLvC3ntTD+9Goa+O4uyZ8Di7Az5wwq3bZG6BtmvlW4CwZ1rQTgVeTh/0amKnG3dRdz+cf2MIiML/FiKK4XO3LdtLKfKGYrizpt8mIVAxJC6j8WWNvUDxrxFXePPsrh/W44+RNRe+gIQzJAmz7oYw8i0nIt2nl2RHG5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302448; c=relaxed/simple;
	bh=yn2hY3rZbDM4MtiWyAwzZb+JM7DadqcO4MGX+CvMBpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ed9uWchDifQ2ZLusL/fZ1r9al3emmXB9rlHDwWVLuVXejislEuLKst7kYzrJKlX8cJXJ6Xeia0+e64ikZrJF7vQKAV2VzIm8CXw7G1RcNUbFiEbyUMGdfEBmmRV0ddmu7utfRLazG5H6P5/CCRwYe8hPgx9qhFWGTsL8MQ17Ncw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOsamObv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0wgRcOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOsamObv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0wgRcOX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAO2pe2845789
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYFj4kPcouC1mjb0JYQRO9ALhnR8UReul2IK7X9tdqU=; b=AOsamObvUdQ8JOaP
	xhWSiROqh047p8JG9Lzjd+Nj6G3T80rUt/4dYKHZvPcGtXbLxuz7AFMtxw/WjNco
	rnEqD+8Qk3PE3eMBPgqOZweZnEx23mDJ2RVkWEv9dKdF7Ah41sTbPeneBxQiHwr0
	bDG5XRoEtI8xuehkmPKQAfJqwQrRAP3I5zyqd2nt6qXS+j5FlFltLUSOtQevo1bn
	uXu1hDYdolWEsOwbJpH0to9mL5Cdm0oPv/vVoC4f7S94weKTL2ZR4E3zgXe62cgc
	Icjb4Es+h51lLdDxrnUhmMOTDuQvgWHobcF9Wr47NaRhDDkXo4qJ+L6BT2HGXO0Q
	TMb14g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p319x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:00:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a15cef334so1361341cf.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302444; x=1782907244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYFj4kPcouC1mjb0JYQRO9ALhnR8UReul2IK7X9tdqU=;
        b=i0wgRcOXhc1Oe7foAW6gk9Qdc1MQ2DJzb58tgvTepfC4tQua0B3tPv3hPHI64ix2vr
         KSrq1OkCzQocGiH6YLV7xcg6BIgD7Z4765BwNCIiMU9UniA0eD5oVihUnUBJDnCXfk8f
         y1xETLLg82atKvc867wub/Zz1OSuEEEkhrbpU5KPTrHxxovgf7h7zJqp8U0IZAmb1ODu
         fpiAFNsiY4DZU5p7JR5v4vfXpt4867/FxHPBRwY2zVW8K+lG3OwHIR+cPFGHCM+CuTKI
         KZJ2IDYmxX+0Uol5GiSIX9gIT9NRtXJhXpK35t5ZdT7QN9Dn0mPerWma16uG7OSm5Y1g
         +lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302444; x=1782907244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYFj4kPcouC1mjb0JYQRO9ALhnR8UReul2IK7X9tdqU=;
        b=qew0TEc9fpvT3gQYvYGmUC7fbpMQSMync8B/PoXxcGVMFkjhm1DSO+rP9yM0oOkbKC
         dpk7pDusBlK0fPbp8acFZEObj6ylepu2RXP3Ezl526L6pB6n2HlJM5Kfh6eLJMtTeujx
         c6fVTQPZo7uAfZ7spkhvWtRWeJSkzmJe6Qt/t+rSxAX87yMj+OUKTpCyjpucJpBJdmhY
         6dmQlqX933p9dTbSIv6grmtEnU6rgzK3EYYyPPT6GnW6Rf/swkMTy1Y446jqwQW131yd
         VgnFT0juFLrkUuc1X17C8tpd0Fy2xo9FRUalEvQ46xvP4D3GIOYpG9kZ7yu6zsLBdOfJ
         mRzw==
X-Forwarded-Encrypted: i=1; AFNElJ/wlhjLPlNvw9rtOllcJ9xMnJZ6GsYJdfq4tRjn3celvuu+6q623RvufufngHzw6lGVXgxxenGQKjf/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw62lF8842HGMn9K7HaxJNdhUVFPNPhMpns6uhJDjqjTl0UxGim
	aoWGZSYja03uuGTu9lBqSMNkvYKbeLTmvrPKnqWiiRTXjHX97JSIyMZZinmUSqjiccpvRPcGoVu
	MOEAW+PfZ2zOLo7h/2QC8uPHmhjCNTOiUGueOwBZwn4pfGsp+JAGl9W1t/Gg6e99N
X-Gm-Gg: AfdE7cm+kxPRlDLbF5L8flkM1Bk/WaDtSRZRGr2nTbb9GzJB7kLRedrUGywGfZmX59c
	VLt9t7yXo9qXYpglucbip+LjhmElWqgWP89JzwbefPU5XNH2M/2waVpbSUTC2ZKSKRRy++ieIej
	hFf1hfz+jb42ECv9T298OR+TvrVyaAUsFU5m/qjf3Q691JD9RAMkCnJZNGByt+NnfmA8sdZBCNd
	gJ59t0S9oWcNBKWJcTze/qFJxyPswbO/uAW2TH3PwiQZeRb8BSp1uTZpjvdfsreXB1iMmwlPmoU
	CBzm64M4mtQVHJjoiu1FVO8e7ZIob1G2i2W69WqjftwEQYOfneXhpm0cSrnU1WsDrmjQ9+Vr2L6
	ZFu0nFDu/1L53X1A5H9vzBfM/NQNfDjfJZsU=
X-Received: by 2002:a05:622a:1652:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a4f42cb19mr90241101cf.1.1782302443906;
        Wed, 24 Jun 2026 05:00:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1652:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a4f42cb19mr90238831cf.1.1782302442333;
        Wed, 24 Jun 2026 05:00:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f49d5dd2sm982723a12.21.2026.06.24.05.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:00:41 -0700 (PDT)
Message-ID: <07fd4bcb-f55f-4856-9b93-7f4569a27b7f@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:00:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008
 PMIC
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX+UsBsb9yfjgM
 HxujdDsu/Y31T4d18oSffa2v8J0EkaGUdKY0OmE+A9LPfHsQUSEWCpQZuOuJey3SlHsYOPNQ67b
 CsJlsfMTaj77Cv752h07R5Z4XtP/jQA=
X-Proofpoint-ORIG-GUID: 0RyiSIAlwU6kyLx7ByCiVeAYk5onegju
X-Proofpoint-GUID: 0RyiSIAlwU6kyLx7ByCiVeAYk5onegju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX72YfOwgfIKAy
 5+cS12t+fjXerNIXjgkkGzsPbXmMIap3iBMgA+pxRBNZcxeZmbg6aTXcAEF8a9Akg2CqrDmXjA9
 VbSu4MT3kEZI6BpnOQ0wsYm5MAmSyAG7qmVHngKV7leA43MPKSsV5zKyfuK/qf4RdFxyQkROy/I
 rdTtGgAqJM5Csv5h+/XaHZubgOxWt9NyfJ5sGSiQzxhFX1YLAJnMS6206hG2nfoQXNAcM4npSDq
 UfNBK5f6z2h3R/RHqQhO+MmYMO1JXKFY8egRMH//LNlcftoTK1TIPvAYl7lQl7uUNyKK0nixMce
 5NbX8i25tKU/GRsc4FQOJYqr4pp73d+UDYT05+eNRJJ3ldCW0MfDc2HNOGEfq2peLyvqX9DNqBl
 UqcwxPK2Fc06o51pXeGK1kzJvimnhg==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3bc6ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=dZbOZ2KzAAAA:8 a=juudafxt-d9__oLBeOEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240098

On 6/22/26 8:46 PM, Xin Xu wrote:
> Add the pm8008 PMIC node on i2c15 with seven LDOs,
> using GPIO84 as interrupt and GPIO76 as reset.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

[...]


> +	pm8008_default: pm8008-default-state {
> +		int-pins {
> +			pins = "gpio84";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +			input-enable;
> +		};

arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pinctrl@f100000 (qcom,sm8250-pinctrl): pm8008-default-state: 'oneOf' conditional failed, one must be fixed:
        'function' is a required property
        'pins' is a required property
        Unevaluated properties are not allowed ('int-pins', 'reset-pins' were unexpected)
        False schema does not allow True
        from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-pinctrl.yaml

Please drop input-enable, it's not a thing on TLMM pins

Konrad
