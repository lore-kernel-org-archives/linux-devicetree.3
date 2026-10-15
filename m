Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D43748C405
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066716; cv=none; b=k5ztCnfozNl8fX/nNiBAcxIevSilJXr73GbkpRK1JdVw2HJ2Gv/h2UNSfxdnD4bKyZwrliPyTNEJ9gamQpiedQsSS6xCBZ7D112yO3BS/HLlFbb4bXYht/BmCgU0wGITX/CX/ny8qmA1G3couRUQSuDQbk2YBiBkUxXZv+BB/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066716; c=relaxed/simple;
	bh=gR9SYK+WDeFVXkNt1T4kLywYpY8XWbUCAO2xgtd4jk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArYpf7kCO1IfhxGJgZ216bZCohxOKS62NGHPce3rChJcn1pALi0Y5+/5Oazp1H92pFEGeSRmjmP2ksVF22fRGLirKuFttTv5FyZMp/RH8Fmx4bWDOgCyPQeokY/hiwGYoL2mQ39SzK7Q0aVv2sXKpY/npirV2gtQNEaw/zecT50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgD3qVXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKBSb5ql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgD3qVXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKBSb5ql"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kEvh2999156
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UPlVBw0/Iv7mA+sI8M/ckiI+nWsMDG2rOrmzA6h9hA=; b=AgD3qVXlmKSINkXf
	UaSid7FWWDw1EPV1R1FhJyc6uiWKFmNvIEpfFD5irCsvtpCewyv6EcxkQZwAA6RK
	P+N0z47odSGTLDU8P1gu4b1mpz4W5lwropmLlevmXXgAEz3OwK4eaD5mdx8mR3Xx
	S4doljcLdrHMzQiP+2uPtVr5/5davDDzoCXEOnw3KADcTPl9vgjdKNpCAkFemH+6
	9+q3FV5vGYXkfV2a5r+Lj/j2e9yobxxqwOFsgAglC9Gov6EMg3luwLfUGW81HEJi
	avpgUJyIgBwR+7U3JNT1CS7G4RfYwEkZAidNG0XNAUdfikXdvBwOIMaaD4icBq9h
	iiHTqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0v4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:18:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc19d8e59so63352285a.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066713; x=1792671513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UPlVBw0/Iv7mA+sI8M/ckiI+nWsMDG2rOrmzA6h9hA=;
        b=WKBSb5qlHB+lZQVVMwZethzi+YvyFo3BU0YvavlBazRfsS8s39sxcKF/IUVLevb2hx
         de63sNIgNM+YfaTFmpKPzHtwLf+/OMTnJJuN5sHwOftqaHKZl1QLJpzMOR/3LcyUPuHO
         lTKjeR64X7AVbv0XzZN6xwv4b76ELdABk8bebCJq2mUKPqd5mMx25WqF7+bd8lcP7Ng6
         kCB66QKulXH7zriJVUxKlME4NfvlzmwvHXEiebd0KxXPWMLb2X4TsqGDwrKgmwjHBKFN
         ESgj10IQGtUCp4TZmzN7P1K/2eHBS9UiSLjBeM0t+wSDefdkNhJaNavisfjFshikb/1o
         PJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066713; x=1792671513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UPlVBw0/Iv7mA+sI8M/ckiI+nWsMDG2rOrmzA6h9hA=;
        b=yXvybIFWzw5XfTYSI6aLR/Jnt0aSjcd3SBANgEKobG2ezPj8n1oSgYnD4QhaHdZZ8K
         X/OF83aRvF/5dsYPTOR9wv63+2Eit3kzBxUkZpdvVSeo+u1U255TSFUO+c7Wx5G+WvJR
         lIp1L6MVgZ8PIk54LNZ5LJD1gz1gbfEx76175IlMvDgIuVpLSjjWp1UYY0b4/fQmDLmf
         7BFZddK/0nCD9onWDwxVFv6Jmh9AsBf6ohZ/P0N3Un0uZnEFc916pqPhcvu2M7QWjqkN
         wBm+fkoZEg0LEhhlQuARhN/XzSDSv5zsJK3mHGppZQgL6/UXeuzup0kybc+9/3KKJw1G
         05bA==
X-Forwarded-Encrypted: i=1; AKwUvBwE0EXWoT38jP10XXIrUDzYPK3dSlBPtPqELt+SqzeZbmLtp3poeBsk4pJGARekE3EeFotFJLJu0JcJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKrnva/H4BFHUarPpkxUzkw7na4XqKMw6n9ZyMW3k1pWlHPSMU/
	cqWH8jXjT5byoN3IKBmeMkdRoDIGLzDCCfqgYDc5GjCgk/n+zlEsMVf3v3xoMChEVBjnEMqbFT2
	p3tTkuCgecxtgqVf+LJ9o/gQ6DX3HTHZjzcGRy17Rz6dAT7Livz4Yfd0Tg3b3km+k
X-Gm-Gg: AYBFou2zp016bXHiTW1W67gYZ7yqLjNiylA0a1bp5a3vMyJ5eAeJw7DqGzTZkC6pu/3
	+ek3Jq2HVBJ+s8hhLEw0jhImS9KvJKwO7T87WNCBQnvMhqrnH+Wc3OnzcY/I83/lloJYFMuYoH2
	917ivF+kTHzpSu8b+7HuYxnV7pDcLRw9c+ocA7OTAHmOOUBv2ZUmcCCobmBkPMWVjbyd84GRSbl
	0yjAt6+W4nH2U4ARgOv1QA82ycw9OAJ6IpxcaZaKjomitHtQzZkkE98ZRFydRFVgWIihFqv06s+
	NmVgndnqPOVnAMSm4y0ASDcDvhwpUe6Zih/BhuzgnuuEP74L0nGr1EpDonFtKAFEf5l1mkqJapT
	OYLVrcAom0ODtafZM2eCdwQ==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3658960485a.6.1792066713393;
        Thu, 15 Oct 2026 05:18:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3658953585a.6.1792066712824;
        Thu, 15 Oct 2026 05:18:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042e95sm116846666b.52.2026.10.15.05.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:18:30 -0700 (PDT)
Message-ID: <3d00c7d2-026e-4ce8-bda6-bb2d0f3c3123@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:18:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl
 states
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831-sc8280xp-qup-pinctrl-v2-1-a69bbbdb37e8@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-sc8280xp-qup-pinctrl-v2-1-a69bbbdb37e8@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z2kANdn0ofRxmVHwGf-PVAhmflNeKd-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX4DnJVLMtbgf7
 U7kNZMkIKtXZkHXbzJoGRso2yw6cMjCARojnHYBiNsjVW3c0/1s5udSGiMToUAZCrUkadSR3W4t
 cI2PGZCiKPq0PTPlxrwSJNM69mp3vxOi9648cu5oIgZd36YdD1lcA+Te+jIIUNTpeU7DC9fH5Nb
 vym14qxdsmqzI9cB3z5u5eALCMJSNgPf5sN5o9akAQIU+hd8qrBHPrWDoLTE6u8uiXhoLczR404
 bDCjFinuojdlYeNSKbT67Q2zRaKTppZn2JsQtnwhOpXmq9mB4jEevRukYEhk0BSGtAScljZWWJD
 7o285YgMGZOjoKJ48CjhChxyZBOtQ4iSFEm7PTotoY3lhOwX6sJrPF5IGio9XQ6Lz7L7syhlD2y
 TBa6nyOCYg3GdK4YOzy1gkbADTrB5jKPgyPyexWTQmxYwKeQbYqFplh0VXXiQ+U/WSyyc2tDMmn
 5/6WQVZ9KFWIHhGe3Sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX6ChdwqkbT747
 DJG9V0vG+TDZz0hkLaN4aRZGkMSfv3EANQ3pIJNtMMCOydAHKWbX+6nr04mqVaS9hwEYJamTyHS
 QxXiihHFVvp8a82OK7Vfuw9TAX90AbI=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0c49a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=0e7TjCIZWrtQGaCp0SkA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: Z2kANdn0ofRxmVHwGf-PVAhmflNeKd-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048

On 8/31/26 11:55 AM, Xilin Wu wrote:
> Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
> I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
> Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
> the non-linear QUP instances, and keep the mux function names aligned with
> the driver-supported qup0..qup23 names.

[...]

> +			qup_uart0_default: qup-uart0-default-state {
> +				cts-pins {
> +					pins = "gpio135";
> +					function = "qup0";
> +					bias-bus-hold;
> +				};
> +				rts-pins {

Please keep a \n between each subnode, there's a new tool in town
that will be very grumpy if you don't:

https://lore.kernel.org/linux-arm-msm/cover.1790892852.git.waqar.hameed@axis.com/

https://lore.kernel.org/linux-arm-msm/e869c2bb5005830c9ac1d4bf998696ffc4eed335.1790892852.git.waqar.hameed@axis.com/

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
