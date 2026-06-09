Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E55D2DCF74
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995684; cv=none; b=ZL6DbJe9CD6TVm+77kIMxIb2vE2GaQB58yF7/fOVnOggXniomNqfUtI5PITwwBoyWISs1k+RUHtSTVEUOnm8zfmZiVc4CSMQ95i0t3zruPDcDgVuCcDZd6kpMhe7692OTjHHodAbkDpJMtfSktB4XnIpB6cIFV8BPG5F7U4lejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995684; c=relaxed/simple;
	bh=zzzN4Be2NFEgK4QWInZ3gxPwLCwSAylSgffkByOEduk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aqDfIfGCeLlxoFKx4VatvI6m+pWcH6AWdrstVGfNWCgzoeH8dayTQZ2nMWbxQby/SXWjT1uQn9zAdkMQEHHzu9fVwNZO1RAl1uiYFOk96o9ypeteChZhvwiQrvt9+8gOYQ66zH1gDzXzpPIlws1VTEwCj0wfTM8mMGdIiNxHmqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDhxZMh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CbNKDlbQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDhxZMh4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CbNKDlbQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rtvJ1587566
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhdJx7tJt2646CGv9afkB55pu+a1qaCKdEr9oqg6cXM=; b=eDhxZMh4nvqtE5ZR
	2dhGU3psVi2PrdczaAozi5upPCNeF5tl5KGWASfUYD1MaBFnP75IBv3yQsbtlU8w
	bjTJDcP11C3R7lce0XzyGKTtqjF45UgWT74XOgZxak6tj58Fo7wBr3wVJFyjKl0w
	JIulpIFh69whmz5l6DBbeKeH3i2uCM+6x/SpQFSoe1ZRXZnLBTq0tyoenFpWl2t/
	hqmP+pNf14ZBoP5Zt4TrdIX864vOY5kIcBczgdOvVx682WTUlar9pfwdM3Exyclv
	eHPIJbi2udR1/XDsIaxA4vs8/k0RbYgD51nK2HscDIuDyx9si1Y2WOv1Q+dIAsHK
	EmuzmQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m5057-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:01:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eb436e77cso326029e0c.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995681; x=1781600481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhdJx7tJt2646CGv9afkB55pu+a1qaCKdEr9oqg6cXM=;
        b=CbNKDlbQuO52JpUZ/KxzkQ6BEmGLQSdPibTMsefk78zEuV7OIOWXw9V1ZVQIIeZZTB
         hUMjxFtgOg0DwcEdtfrQb4rb3ndI/m5TLWXLBcKgxoC20jgOretZZ/MagaUtljrZoiIf
         yzVYyIMMbVHrQ4+jr9tosg1QTxyD8G0d2goqomfEfA7wIy9Dyh5EFELwZ84UUPBAEnG+
         903wzNun6LWIN/2VO8O+jmxypkbB39m6zFv6fwCADIqOOFd6fdZ4S89JJm9G2HiPBzl0
         UC279aZgwG3jNcv+lb/N9VniRupgYo012afk3xcaFIOnPqtTFExNk704YY3BddxdkZ84
         2nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995681; x=1781600481;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhdJx7tJt2646CGv9afkB55pu+a1qaCKdEr9oqg6cXM=;
        b=rgz+8IXoJD3bbJCfN7OFKUhArvGeWWHIysCYdUopYGFMmKv7cFs+hFrYvBvgVpcvCP
         lHDQ+W0VwhcnX+8fWisj0bHqv4s92FhnTZu6rnybWytXST5P7idEu76Dqzyci3lf4h4M
         jU3z8vX+UzRzeeMo1krMh4UKOx6leSlJmKeYPWs1Oo92QxAEhq+RKFhuDJxd4XGomppl
         xfBDZd2qPWrsa4MWs7uQvh2+tUBta6fzCPbwKytveeE+D2Hg96VLkhs8kBM8IGfizqRw
         w684rS9aRtTKm3zLxHm7vwKT4Bu0l6VU+mP6D87nOPAaaTXfr5N/r1THJCC7UYYkIWsx
         lhKw==
X-Forwarded-Encrypted: i=1; AFNElJ+qCGiedfBfrPCvS55DFbcn7T0U1FicCWWMy+QtWgR6De1bfNWU6YMca3BLZIaL/Mr6BbETIgabkpHa@vger.kernel.org
X-Gm-Message-State: AOJu0YwLLiVreonSlQY4hB7U1u2/YTYZwZ4p0/TDKk/oKECGWYQmQSMV
	/dFSq1WBn69IhT6TaEF6J9l5IjCaZpnOlnMr04fyA32Dz3X4Vuj4DlnG3QI8WMxYOcEGFYpAKFn
	In81ysDZXifvpS0h8H5KjYQdy6LkmfUWTEEU89AcHWpKYrLIkbBVM60xqg4vWXFhB
X-Gm-Gg: Acq92OGKyb9uQJjBQSTXgVaD4AVWcOrBXa7uCdKGTYCzMuqclEtz5z08HkFvQngA3V1
	l7bWhi73aK+dHQkhxCl0uOxAaXUJ86FOi/unckbrS3DT9glNZ5L1zonskMf3LTo5UGHZ55rYJGZ
	QpJ9nG7+kQrWDIKIj7fNSdnuRUwruBAfhX5GJlSzdgioSHhZxG4jU1ZfXFHnNew6hrsduAtiKPn
	HjM454l0VRHAh6cf1p3O2g/akj1kSWG+nM6xSneP4Xc+2Uw0pcnqLM0Xy5+lRaUHFE6yDFTljB0
	YN2GOhBG1+xSVjIyrkU5L8KVjIppCMPNWRWBvorbw7eFNYhhsDUXGOBv2n3XBo5yORAf5IsfrEF
	Bllcxa7/XNRIa73s7pXx0NfqOXhvFBE0n5jGms3yZAUXunpwtC0NLYfVe
X-Received: by 2002:a05:6102:441a:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-6fefa60bb05mr3021104137.3.1780995681263;
        Tue, 09 Jun 2026 02:01:21 -0700 (PDT)
X-Received: by 2002:a05:6102:441a:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-6fefa60bb05mr3021075137.3.1780995680842;
        Tue, 09 Jun 2026 02:01:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8352120a12.27.2026.06.09.02.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:01:20 -0700 (PDT)
Message-ID: <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:01:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Weinberger
 <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll> <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MyBTYWx0ZWRfX1JBiS+4HQlin
 HA78uoTR4HPDESiKJZ8s7c2Wyu2LyLrCsllEAZyanZc+M86jYB5j3YzYXFlnh8sF05c+vstCata
 RZhHaDB+CojcF6tO29Y7ma/UNKGeaFXkwZH/PCzJ7tEVTkhZ8AQn3p6HXbcK52iVR0P4EecvJyn
 AQYnW5cQ924FWmG4kGMdNuWje2EvZHM0O7Og0Jbj+oup6qJVf4qq7+blcHslJzSSgElvdRk4Tmq
 6IFguZH8mgIzsnkzQooJtKkTjy0Dos8Khesgf/8J8rPdFdZdW0o1COY1rue9+TE2KV1w0lY/ZsY
 b1AhorPzTr1MQlIQLQ071Ikayl1Gk/RnfswYYJh0uEpNPTYi5o8DzlG6+xhNUcDbyNRilZZLsIP
 bPR5C0ZKNgoZXYCq57PzelPjWLtRm81F6uh+teQWkG5yD7iS39XvAKl4wJcsMAjRKxAZPTncChU
 HfFmXBjm5UwT4j2xEzg==
X-Proofpoint-ORIG-GUID: HuXlgjuLY5nEY165TxmpESqIJ_Xdz-HM
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27d662 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=f2xlcQsDh-InlZPZBw4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: HuXlgjuLY5nEY165TxmpESqIJ_Xdz-HM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090083

On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> On 6/9/26 10:10 AM, Stephan Gerhold wrote:
>> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>>> On MDM9607, there is only a single controllable clock for the NAND
>>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
>>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>>>>> clock ("aon") that is required by the dt-bindings. This is not really
>>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
>>>>> clock entry in the dt-bindings.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> What is the problem in giving twice the same clock? If this is what is
>>> done in the hardware routing, I do not see the reason for more
>>> complexity in the binding?
>>>
>>
>> I had that in my first draft for this series, but this would be wrong
>> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
>> this platform at all. I'm not sure about MDM9607 in particular (maybe
>> someone from Qualcomm can confirm), but a similar platform I was looking
>> into at some point actually had *3* separate clocks for QPIC in the
>> hardware and none of them were called "aon" ...
> 
> gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> from GPLLs)
> gcc_qpic_system_clk (32 KHz)
> 
> No clock containing the substring 'aon' in its name on this platform

Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
The NAND documentation says

CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)

Konrad
