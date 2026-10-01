Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538714A5ECC
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843356; cv=none; b=fLGM60cUHfij9Js8C7V7aRw06X1Ce0HTtx4bt4JlT2JSPSq8MnCBts33zxaq9mj6hPDunTLTRmzwQHxTcbvkoxwhBFejFclk3twnhK+pYahkSf04l3wjw6OZ8VoIR10OG0xN0IzV3nUh4eg4zTN9+0QFJT2e1uo6SWuwWoygJpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843356; c=relaxed/simple;
	bh=px9auo44XRq2/gIVEu/P/EZU8qovirN3WcDVMpMg0eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTVdR0rzheSpvPxxeRMVrVCYTixL+owVvBPQMgWXggu4VI9qJKriPxDv3MqemUB53eBpJ+Ol/MV1u7eTjHHUyRvMIRds40aopxYV8GqTiOWQ0XQlrB1BD3uWK6Jm0ezNxtcrZlLuVm3RQnCp9McbS1B4xiN6us19lo9aE/9tmDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhY/mM+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXtH9CZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhY/mM+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXtH9CZ/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xLDa1932294
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 08:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEzAiVf4aIpnZQghkkpyTEzFfNFg1WiE+JWN9vWy27Y=; b=OhY/mM+JVbvxmq5o
	mX3nLXY4kG0ujjBI3ejFR++3esOjOW1dUaCMXY934jZTYfyVK9Z68e5Oe4FycRfq
	UVerHgbVlw0+65ruNxk20g7YXK3RxgGaG9LoQ50h6yaOcQ0Ve0YXS/9o8/LWswtC
	wryO9mpummylTb+WuUoQAqjEBuBC3WzV4aWi7Q4Qfy1YEUipkYkdeZ83Ipob3tHF
	VBw9+KSPivzy42YkQzyn6tdW2pn3v6eqdw+cDajJu6I3ul3fpPGcHGYr4IlNDHpN
	fAQwoK4/JaPVYmcLxZkL4TURERJAVZr4+rWDR62XlfJEhoFBN5Kb6Nd81UkUi658
	HRvtmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59ucq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:29:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso93495585a.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843353; x=1791448153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEzAiVf4aIpnZQghkkpyTEzFfNFg1WiE+JWN9vWy27Y=;
        b=PXtH9CZ/tPG/5jBh/Z2sYjDwQFiCZrjRSm52fd5kkS6ZUkKZ5CEYAO0N46OBGxaK0K
         wU4U1eTQ8jY7Nnov/8PCss7i1qZ1SKU9YP0XawPc0M+pQVmWiAe/uCt0q9rM6IG3pHVl
         v5194cZeSKCXDlTZR58JZUKb8X11TBXBmsTnh5Q4GBBEcipmZmHdGEQbpohXEDcHe/zf
         c0gtV4qgA9WnneJ11rDkgMDEzs5WxwoPOCXLgeAZE8o9/O1M69zwCXVX7603wfrZAHBg
         DjEzEh4+J1G/lovuiRuDzg+0naJa/+6Q8VSDXzZNqDjqUlgY+w0tJW5hm44X4g8qzbEE
         IF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843353; x=1791448153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEzAiVf4aIpnZQghkkpyTEzFfNFg1WiE+JWN9vWy27Y=;
        b=nH0gDX23aZ5sJQ8mj2WiFBr28lvq7kQlbcLb7X5ffyMqsnbJJ6I3BrQRHeKtevElaT
         TypuLVrhS9K4dgjsAcnMBFztDYChMW/A4CIClAPFAdJsZgaNJQgQZRuFF6vFyB9QCKBz
         donZi2AfEu2LuHIzBA7pjWr14oXUPKwy9J/ByztnGP2Ha1tRYyyZ6ArsPgt9OQQ5QO0N
         hGsOTF9FM4FIoAMyVNiRm+k0IywTha8F7JtIA4NIHp/jtuYop+hi0y+FWeO8XTtVYZVW
         SKfFAyOZPeP34TYGAtaoM/ivpggrwoQVeYfFcZwIFwo4WBEYxzyAufh1ozspKsc/ceun
         9DgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDwe7UdxYBseiiwEAU6oSktRC9d9wBPKJz0WxR4382qdvQlBFZ/1lAwws8/YvdvQ/UXH6V9aeg9dDb@vger.kernel.org
X-Gm-Message-State: AFuF++lyAPy3aDhXsixoFXyiZC5KrKd2jwlHUE/1r0/qzpQZgFPAl93W
	eRRO+H4ici/QwWqw0XmGYIb7zHxjZcRVd+rZ6zqOA0vSqSrNFHnxBFrVBlMvuOfi6oD4Y4TcZ+5
	VjbE1SIO7RG+2X8puOF1Cx1oikd1ImFkK0EAY7MKlu+HNwwjDddyzeOsH9hdfYsVI
X-Gm-Gg: AYBFou0Od+toe0yqexbhs+OUfyWN9tGkoH6W4xWQyhMf0jL+knUTRPPvuMOn5HHTIC1
	Lmi6P2dTc1EVftc7cLZ1ogeqLItE2eMGFeVtx65upZPddTCQH3OxG9r7r7fbW4gzwPnk+PfTo6D
	rhsiap3c24jGhLLep5fGf2vUn/F0L3qeQilanW31AFFrLpCL6mj9cgrkcpcRM/b7yt0A08Fjw3Z
	7/TBhVXaT1gWqq2U3Oiq5NC9mPDVn+ozPePYLFzkH30auvU4W72M/TDscQps3MQy2Bvi3UxC8R7
	MjqH985vJzc2sBEPBv8G0JAHaSp97G5DBv9cIOTvTwCL+tESYZGgDqnVUTia5KWDRGRoFALi+dc
	Ygf885bIYQ+jjLgzfNP/3uA==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr676878885a.0.1790843353444;
        Thu, 01 Oct 2026 01:29:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr676875285a.0.1790843352958;
        Thu, 01 Oct 2026 01:29:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce2ac2sm111175366b.29.2026.10.01.01.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:29:12 -0700 (PDT)
Message-ID: <dc353f9e-e189-4ee3-9c4f-de35b07ffe7b@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:29:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
 <90d203ad-525c-44dc-83d6-1548b42c131d@oss.qualcomm.com>
 <49dfb307-8d12-4008-8e1d-63d35ffb50b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <49dfb307-8d12-4008-8e1d-63d35ffb50b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pHSMah8X2dFYJrmtw_3fh64P1KH_l2xl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMyBTYWx0ZWRfX94UzXHauvPPm
 72btYCJf+ilwat3xwNQRbmDX4njlpYdNPICix10Nc505/aSO7GgjqF+UUv83P3Z26qYes7QMKJc
 w8+n8fmMPTf+Apv7swJ8sRmG9fP5dZc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMyBTYWx0ZWRfXwl2brm9dbS8B
 /IT0V0WDoPURcyJHKK9aUYfH6Uqodhk6qB12uBl8t9PEly2jPAuI9h8grwtpEF8/LKdVDvIbNvg
 y/Elj6R/6u6VRW+IETxjeUuw8lQ0gG9kZ1aOinPfQKVwXRt/ED8Bz8SjRFZDURH/R7Ouc4JVujS
 GT8G6+GC/sNsyjvdhfVZKnnw4f7rGqqBKN8APSisFvsaI4JKxw+agCrYF7lsqz1CMqOx1M+OsuF
 oCJnFu0ovhExiXwgMw19/TianFFqnXX2zVwrNtTOd1v9QgJR+QZ3GStOaImRGhDk7ZyfETuK2iK
 Ys/RmVCyWegp3VQIL9nIx1JgWBhES/X3QwpmfDYmZhZO1KL0ahVUhCi/R/JpaRqflKtYRRrBYBs
 0KMRngLd0LIn+LKWnpohIV4XGLbTuwdi+Uw1RVGVH5eaJE3YjaFTZGP9Asqmge5qp8NS7+ioD0H
 YFzec1asa8Ly4GYbGzA==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe19da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=xMYjRGLvxaAixDAT_M4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: pHSMah8X2dFYJrmtw_3fh64P1KH_l2xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010033

On 9/23/26 12:18 PM, Jishnu Prakash wrote:
> On 9/21/2026 7:03 PM, Konrad Dybcio wrote:
>> On 9/18/26 6:42 PM, Jishnu Prakash wrote:

[...]

>> or drop the GPIO support altogether, if we conclude that they are
>> fixed-function on PM8008 too (I couldn't find clear info)
>>
> 
> Hi Konrad,
> 
> From what I could see in the relevant HW documents, the GPIO
> functions are fixed on both PM8008 and PM8010, so it would
> be best to drop it from the driver. I can a separate fix
> change for this.
> 
> Do you think we also need to make binding and DT changes
> for dropping this GPIO support?

It's okay for a driver to implement a subset of what the
bindings allow. Maybe there's some esoteric use case that
allows exercising these GPIOs, I don't know

Konrad
