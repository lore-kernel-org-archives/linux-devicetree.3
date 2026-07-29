Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724373A6F17
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305819; cv=none; b=rLLnXpbJS+qYlVoemTx2AqJKIMWXlTbxrFqWjlkPqxME24j/308lWK5w7C30CI8PUbSCWVDwgmALjQExjbTrQ0r9tf4jFrRQ172LUrgk/1nX42AQhyKcdNhG/UzZp56oV4mff4dX4t+3/1xPHmjjqYuN3KQBMLAzPSV08ypkwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305819; c=relaxed/simple;
	bh=P9FRYygNsU+SvVn9FwNdodJhR/bImgnEE1wJG0+P3NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AG6irVy0SRSaQWW53vg9+XC6FS/Q6yohQqTa0/i4hunCW4jWnu7323iHL4R8XmZCegjizcWjVIIRBradV/KsbrkylKHTIjvpyCcXELx0kwcEwRBfFLqNNq8ZLKU8eCUJP5nBhbi1Q8wl1//A8klE1AjYa4+qemyv2ng0vNhbZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtCQKYJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EN64T7qK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtCQKYJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EN64T7qK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4cOef677750
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=; b=YtCQKYJKWcBf0EDD
	oUBMOY2zBQW95QjDHeLJW4TgIst97oo7Iggs2DLRkeXxpsQk25CkeMojtOagDCad
	8KbSu/5o3VUqvHNepbTc2f+tmv3qtIPAwVMrSBVSSNYZgei2mJeY8k5nJIN1+AYp
	c3t/ZwX9B2s9PkDK8WyzWQ1o0pZzFP/g/vNFFflKWlcU+8e15L7xdNh6PH5rSKew
	BdVx31bBDJl8rN4VcKK4cI9jDz2MF1ztSvHNY6MBiVw7id5uFqaHz2+aMrYLBFZy
	feceyXl1+3anshl/u/leQeBbqsvwTlRvONo35T64KNf0e6ctXXrdz+vw9rUVMooz
	GSjV3g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sah8gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:16:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so7150046d6.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 23:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785305816; x=1785910616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=;
        b=EN64T7qKLbYHwpq6cc+2q1DdeihvKs+0F2q0eUq0XqZemSQQnFNUqrbQ3+5zUvTW3U
         DZ4ZjYAUEA1mGlUiHIEqrn7VPu4It/pF4GAGZE3i0bvT80j70NZS4V75BcQN9PNGTMIJ
         uuwqEi9AyPptJtrquyn6kYmB3avQ8WdaNPQsSn6L0/cuCqYf+2IQn/UdscI18SaRfwfv
         a3f62GZdUxTPDRDKfZD3ahKDLCuBmccG6vyynz6xz5HAYxpwyn+kfUeZAWbzauXtL/we
         AAFjcIZoictDfWEg+nScUe2rVsOAMBw3O+W4Tawr00IWhzss7PWUbK1mbD0Nf33LOPvz
         Bnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305816; x=1785910616;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=;
        b=IrFNQd3dIhfLa4cEbHcL/9WEU+2m4b+GayJb/8ImXwyMQBJHtXPjK9ox30SC/Z+2iu
         0g1WCl8dtHNVKGmeMrACWjIfz7ZDLTFRXQjzSHuvNP6tnBXzV2Pg57mkC8i9XVu9bJpx
         V/T7aL5uqgx5hNqgYkFVTRpR868lG31o8lI/hYK10/3hoLf1yKCcLkw2chDCZ0VYCrW8
         55ixeABGTwgu8sVMnXdgFbKpmOtp9eew9N5G7Rc4kzBy0wOFAzJWhivwy8Mk/toTn8Xg
         pTI1YDx8fgCOX8r3H3EzPbvcyJ1vM8BowKhZVjsyHtPmBEClEoYdeQS6VnqGJMvyAnGP
         Ycwg==
X-Forwarded-Encrypted: i=1; AHgh+RqxcYLYL9DfhNpI9WN/6MxERTf3fsJppEQkt4vm5bh4Tr9b4hgji+ChFmiHDLkpSqr7z0SgtF1C6sxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrUb294tXlgEThKeBKF2Z6gaJIMG9JOszwYe3VULY7sTmT3O5+
	IJY+Kpu5FO5y6yM3WkaY1fAlw0wFw3W1w7LQARBA+w3nh8VmzFdyuq+Q9Pq+8W/KZuIn+gsQQ7B
	oR9MP985APlemcSDj68e7tca6JDYDP9D2WYpJqdwZz9VVLU+j3Byfy504tNXxkcKxXL0W8Ydk
X-Gm-Gg: AR+sD10kO2G4BoRLDzjwvCc63qjVuc9knkLPmlLMlPLkS0T1HthEWogI/6+G4jagIda
	6a/Wx2txj9CFlggC5aBgahMiCLWHmYln2teY4y+EQ0mXUT4xVZHlYa1XzM8Vh4cjhdEGJt9xooh
	fbzJI8DQTgqWdKG03k3qMga4EuAqdM5I6Gc/45OQCaZQNSFuzS5KB7apg28alo9BVcANe6A8Xjr
	aZ9Sz7X8tqo9vMUhuMZ/peOkV5RZeLEFStkOj3iN2pLk5rrrOue6r0W2EEp5dAmgtDLYdjnd66U
	x3kNRB6pYhStwUzA2CWsXSouCUJUCdbOJA5yyRuR/noSMqVJC10CerGIUGlH/zALSvVTzFkre39
	VS4d+nmO742R3qw6DWZL884cVUCq79g==
X-Received: by 2002:ac8:5915:0:b0:517:87bc:9b47 with SMTP id d75a77b69052e-529d713e451mr47632891cf.39.1785305816244;
        Tue, 28 Jul 2026 23:16:56 -0700 (PDT)
X-Received: by 2002:ac8:5915:0:b0:517:87bc:9b47 with SMTP id d75a77b69052e-529d713e451mr47632701cf.39.1785305815597;
        Tue, 28 Jul 2026 23:16:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3940sm5367800f8f.7.2026.07.28.23.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 23:16:54 -0700 (PDT)
Message-ID: <d8927b08-f743-4b1c-85ad-f64b9e5b326f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:16:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au,
        Rob Herring
 <robh@kernel.org>, conor+dt@kernel.org, andrew@lunn.ch,
        devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20260728085640.1001890-1-jackyhuang@nvidia.com>
 <20260728085640.1001890-3-jackyhuang@nvidia.com>
 <20260728143952.GA2121505-robh@kernel.org>
 <20260729060612.1085870-1-jackyhuang@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729060612.1085870-1-jackyhuang@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J2vxFWGOPT2Pb8kZ0ZHKYaCnx3O4rFv8
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a699ad9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=LSH1fm4cC_m-g0oQB94A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: J2vxFWGOPT2Pb8kZ0ZHKYaCnx3O4rFv8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA0OSBTYWx0ZWRfX4eeCDMiLjIeA
 C8Va2n5cccn1SuklFYaUhIzw+8qOg4JTxs6UBHXWbwQJJKw7aJeFDjxUbOOxLETCr09qhDgGI1t
 c6jwqvtDJgYjDAb1r1oDZooQfXG1lqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA0OSBTYWx0ZWRfXzeKRWcJEciMx
 A7s83/UFKPsVNmUkfiLHPQKq5eQr/jW1cpAGh8Co9Pul88td3/vjDv+AeLztKCiCYiuAAFTogug
 Z/D5e6Ar+XA2f6XOeFmTrAVwnjXVTAACb6GUAjh9ixx119R84pURAk4Jzv5/QGQ/8X71H/6GJB3
 E6rntigkHPJeyhkohOaNeaTCWfecYEqSkNc4cr2f7lPr/sXf0D46gjF3PhMWhVu3pAvS8nOjzDa
 i8EcS7yzOhSWviSuYsfzCT0Enwz623gZ7x1YJCuWqJlppt3BhiweGJtPNODn0J9cnJF9eyN1U0x
 nFXlZ6kIzt7JrGuaAa1Ll6qTn1K+41ib5lIEGFGBDID5ElbnvG/OdAYMm5SGuoA5uoY5ZCIa9pt
 Bm8jWra5jkJhf3Qe5hUg6hZuc8s0xlucClvWHVZLtuc3+jZkaEyu+NJDcmePXpUbo8r+r3a66IG
 EcurF0Xe38VkM+H9j+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290049

On 29/07/2026 08:06, Jacky Huang wrote:
> Hi Rob,
> 
> Thank you very much for the review.
> 
> On Tue, Jul 28, 2026 at 09:39:52AM -0500, Rob Herring wrote:
>>> +				cp2112g: device@2 {
>>
>> This and other devices should have a compatible string and associated
>> schema. The hub probably should too.
> 
> Will fix in v5.
> 
>>> +	flash@0 {
>>
>> Needs a compatible.
> 
> The flash@0 node augments the corresponding node defined in
> aspeed-g6.dtsi, which already carries compatible = "jedec,spi-nor",
> so the compatible is inherited. The same applies to the flash@0
> under &spi2.
> 
>>> +		status = "okay";
>>
>> okay is the default, so not needed.
> 
> The flash@0 node in aspeed-g6.dtsi is status = "disabled", so the
> board file needs status = "okay" to enable it.
> 

Why are you extending existing nodes that way instead of phandle/label?
You write confusing code, so that's why you have such comments.

Best regards,
Krzysztof
