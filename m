Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CE73AC0C7
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791307; cv=none; b=bvheJZI7hTO9bDLouwVLvc+NhhUB7mQGknjn+R995G8nnSajuDPLAbioSbBeXflZU/9M1ZwZyWu5CGA8+cugM2mi79Sx26N9qKFUtG8aa+7/XEyltTNI8O5Ud47eBDVgOHguKYhk1rYsJ1B/9nIm8Hut78b5SDp9c4bxIcJZ4W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791307; c=relaxed/simple;
	bh=FaD26F1hjDGU7YdmsMYF2tmo6eU1dKriXvKBCTWPLv0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l/7XDbq/P1qNNjanSzIy6JCsJw3EXmHbmF1N20i8EtLpCHnDBYxhuMX+ioVHoXzIglI/Pn93kIcU3Ffqu2YNzhdrHoe3Xe1d4M5ooYxbem9MRBonRSv8oHYqsmeMyqb+M5IeT8KNE9MBYWjlYbAz+3h/RNaRLMlcZ6MJgqFsNuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL6cWM3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTjNI07B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cL6cWM3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTjNI07B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdXFc851901
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 14:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aESJFpz09VdSP8sMubuL81LkJsF+Eo1ATJT/zPwx+64=; b=cL6cWM3u0hVwntwq
	gH0kPyquT4TA0l7KwGuexA4YqhmRMrGeuhz7E2Xbl8oOxlWqB+1FcN5HeW4UgSKK
	D1XGXet3UoMmAP+h+BfHzbl12t/BuU7E1BgxTYBs6mG1a/0unqU1c6F/CCvLGPWo
	gNlx4Sdz6qWsW9xjoq2NY4C1IGNLZpaJnhZ+6CKlfjdaoJHAibfZBtPoY818oPqS
	WeYpAITB3y7jABXquJ49hW5yb+7xYRAhXy44YxyMbvv8suzFCm+kLYq17XTMR6zU
	fZ2cdXKQaKuFAwZz4TDKZdjuNilYWvmFPks8HNKP3CuCxUyJmTwLWCkTcvJis0Y7
	iUDGCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8qqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 14:28:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ff0dbeaabso3033381cf.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788791297; x=1789396097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aESJFpz09VdSP8sMubuL81LkJsF+Eo1ATJT/zPwx+64=;
        b=UTjNI07BxMeLdOt2vBd9IQxSqy88cSyZCCOYgJL0xxWjLjARhcq1qmYk7o2gArznf0
         6NPuBUZIkNXN5NDUYL8pfnSbOSYlNgb3KzdriZdjcHvSjUReejXCiorl5J5S17utRPV7
         8EqzmJwzdS6gY3zHTpY9rKSpcEYJ7rVVnXxhmXZFgeyNt4MlGOTccS+UlyBiOyi3/bL4
         FHPUEENQULtbM434OuXDjLh5c24T7zl1JOlPuHBtoJUlW55CrZ+mvEM6H+iBnv7fG5zi
         EXZEPw8I1icxw560qK88Z/bBVfeTDT5pqEtTt4ajXSvE9ILwGbQlp0eaiPdO3fHuxGqQ
         wQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791297; x=1789396097;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aESJFpz09VdSP8sMubuL81LkJsF+Eo1ATJT/zPwx+64=;
        b=iQm5W+z2M1in/O5M9uhS8YEMyOe80MEeUstcCfC4WoK0yHe7eT7azEpU6oz2TkFv+K
         qSV32jRs2/liDFDbgGrHkR5TShHjUJYCW/WykKmdbtXdsalcRsOl0rJGuxkW6nigCZf4
         Voz6uRxDOUyBWkQkqoooQlUkshi6WlhGD+V3YcUBS7N41v88GYWsmU9xO5+LTUu+TarN
         LBtVHNZEc7AJWtiTBkDlJhPUd9hRJRAt9wR7+vYue5k8MJhDyfkT9+3dzNBqaVHjnosj
         KOUEzFVw18Rly9lXVTXia1dUGBaSHuMqcNvQryBq/YcYBO/PnvymexjUmtraGH750ymi
         rYxg==
X-Forwarded-Encrypted: i=1; AKwUvBzLTd1bVg8Z6coXqXt4yMrQZ8nL/YF/WZp4Gq0EkhJkPyUt/pqAg8mVI/Pr9Mhi7+gYsLZQWVsirsaD@vger.kernel.org
X-Gm-Message-State: AFuF++mCV2OpY3snnZ+Nda3bdJqTk9xvmaRjSQp0uqghbWMTgsvDPIGV
	Pi8AZWbAQgbi+OdKjjyzrENpzsjNPUHI8WZuDK4B1JaFaGydaTIBG8LCrGTDuiKnvSMfur+2SSY
	bc8KCU4uz+16P0ZJOh0U1ZuDMNC/IgO+KHWpvvTDVut5ECVXOolgwpeyCJBltREHf
X-Gm-Gg: AYBFou3ByMlDCYxD9JAgimqYayIAH5m7cvz7Tb6xPfQSlhR9YrT67TxHX4slW32Qu7v
	53tsvwANGPJneSlOnZnVVErZogPQ6j6KazJIyOJNxLeVcmlKJ52L3OUifSsg3aENRp7ukb260Ec
	+NjOvdxWLVRuvpAtO7rrrPqt7lLqJ7wRJio1U+9eNa51jW9xzHLtbQrTHJr7K6LNT3Ew6UsIJHG
	+AK7kniBjE56F3Jka40runUGBnE0+jiZJoSVclhHc3CdMJVysoLun1sZO7GfR3dO/T85Al0FV9K
	HVeK5+uVROtRTjF+TyWd3pT0HpfZYCgZKewcoCt6/obGDbI39jOG6vG2gib/mPPtpGue9MWudRR
	yrXANooy8XxDWvACWxCXqCyN/wN9IRohrtg==
X-Received: by 2002:a05:622a:1aa8:b0:51a:8945:312d with SMTP id d75a77b69052e-5306440e830mr135271481cf.0.1788791296953;
        Mon, 07 Sep 2026 07:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:51a:8945:312d with SMTP id d75a77b69052e-5306440e830mr135270981cf.0.1788791296478;
        Mon, 07 Sep 2026 07:28:16 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm196469495e9.5.2026.09.07.07.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:28:15 -0700 (PDT)
Message-ID: <81915983-b16a-4647-a623-3176c70a1782@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:28:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
 <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
 <f27df150-f21f-4721-9fbc-1bea7dd0f05e@mainlining.org>
 <d1ec9149-7034-4002-beaf-d389f0603fc3@oss.qualcomm.com>
 <c8f9e9c9-d619-4094-8968-c162d6b2b361@mainlining.org>
Content-Language: en-US
In-Reply-To: <c8f9e9c9-d619-4094-8968-c162d6b2b361@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfX6ct86x73DAGl
 X7hDVf26O/WiCvaFjnDV6rf8UkqbGvd7OgCgz6kgj655vRrp84S8njQvfEKWN93E1hBdE9zqxyW
 lVxq1R9qoQPIC7o8aFCh00pQaHsYx9E=
X-Proofpoint-GUID: 6qGkwqT_LLVyHe0DsfXNSrX9qJMfBkLH
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9eca02 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8L-9JjF5_uZRE6cqQ9cA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 6qGkwqT_LLVyHe0DsfXNSrX9qJMfBkLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfX6OtbSRKgjOAk
 V4QWXZFK4ICt0ewSqltnqrtUmYdvJfkMcde3OgdqnA20JbRIZPmvmtDI2g7dm83OVJtMl+AdU60
 xVpUhFwN1zhi813SRrGNiLzbyfIpw2x9wAbOdyIdK9ntSMe90HdE41M0xeusPTO/+2BwAksY1W2
 +nsxgi6Bx9WEQKd6g5DsErFt4SwqKxsGwRpqvWJkMqDzuA4kCVn+zi6VXlZFpqv1SBriyxRfA08
 KnAfXCugIbDoGv0rUKwUiITasz0hE4K5PN7bROjIcUGZm9heKhfo5SYppQxnKR4HmVLttLY7KBh
 yhATnn0uqbyrleNHPqJ/BkUyEekwuSq58fHd5X63Lt63hx4iwVp/VuhUr6BHZrQE/ONa+BcRHuE
 +KXTB9OH0Ff01sdOX3SQGXNUwwL/LNW+PUA5/TG86lwBi9SwyzJmNvsIG3rrfD/XXnXebcpX5wg
 Q4R+/rzrE1ayP/OQ49g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070160

On 9/7/26 4:19 PM, Muzaffer Kadir wrote:
> On Mon, 7 Sep 2026 15:39:18 +0200, Konrad Dybcio wrote:
>> On 9/7/26 3:32 PM, Muzaffer Kadir wrote:
>>> Hi Konrad,
>>>
>>> On Mon, 7 Sep 2026 14:04:59 +0200, Konrad Dybcio wrote:
>>>> On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
>>>> I told the robot to take a look again (and again and again
>>>> a couple more times until it stopped complaining)..
>>>>
>>>> The following feedback is meaningful:
>>>>
>>>> Hi Muzaffer,
>>>>
>>>>   `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
>>>>   the function. Please populate the corresponding PINGROUP slots:
>>>>
>>>>     GPIO8:  mux 11
>>>>     GPIO9:  mux 12
>>>>     GPIO12: mux 12
>>>>     GPIO13: mux 12
>>>
>>> I will add these to their pins by sending v5.
>>>
>>> But also I want to ask,
>>> does atest_combodac_to_gpio_native
>>> have any mux on gpio12/13/20/21/29/30 ?Or are they wrongly set ?
>>
>> Yes they do, the robot pointed that out too but I figured it pulled it
>> from the internal data and not from the existing driver. They don't
>> really have much of a use outside validation testing I believe, but
>> since they're there already:
>>
>> pin	func_idx
>> 12	14
>> 13	14
>> 20	11
>> 21	11
>> 29	10
>> 30	11
> 
> Hi Konrad,
> I noticed that I forgot to say pin 41 (Sorry about that).

pin 41 func 10

> Could you provide it too?
> 
> Also can I add mpm pins as a seperate commit in v5?

It would be best to keep it in the same commit since it's part of
the driver

The robot suggests the following:

  static const struct msm_gpio_wakeirq_map msm8952_mpm_map[] = {
        { 1, 4 }, { 5, 5 }, { 9, 6 }, { 12, 21 }, { 13, 10 }, { 17, 12 },
        { 21, 13 }, { 25, 20 }, { 28, 18 }, { 31, 16 }, { 34, 15 }, { 35, 11 },
        { 36, 9 }, { 37, 8 }, { 38, 3 }, { 42, 19 }, { 43, 22 }, { 44, 23 },
        { 45, 24 }, { 46, 25 }, { 48, 26 }, { 54, 14 }, { 58, 17 }, { 62, 53 },
        { 63, 30 }, { 65, 27 }, { 67, 50 }, { 70, 31 }, { 71, 32 }, { 72, 33 },
        { 73, 51 }, { 74, 52 }, { 81, 34 }, { 85, 35 }, { 90, 36 }, { 93, 28 },
        { 97, 29 },
  };

Konrad
