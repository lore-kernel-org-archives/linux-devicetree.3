Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711BC355803
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224302; cv=none; b=bzOQIlUwRYX3DkaQ2JsMNghRux85/gX6H/iQhZZLJ/yz3elsRKQoZ+EcpRokeXk1zqIKK66dKr2f43NPJrq3INf1MIqBw2bkaos6yCjdpPpPCFnjhN79DhacU7fgfTHYJPiUOBNVLeOJXWd8eWvShkNPFpXMfRVSLxUU+DoLN4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224302; c=relaxed/simple;
	bh=cUZ6i2Et+bNGbk5bcnO3ZKcnbZRCGsfE6AsUyJKB4h8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7gVSLiwiAXWqqYUeJDybVlsnvGzxJ/Qnyw24QOgX3DfcF64cqDw2rVjP6psBiGgfNHLjPTp1s0OCZ+8WFsHN2jHduNZY9wPrxYKraJl7ZhPcjjwUr4JsNJgkunsulFh1uPHAlfOgKFMJUAh4tiOQXt9R7qkIUyVLeM8s8xHmUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIQB/XWl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8gTAXMf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIQB/XWl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8gTAXMf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSw2x3172368
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2J55IczMGCViMSYvTExD41TEsQ/LIk+6172XNtB7CFE=; b=eIQB/XWlMZ9FAV/g
	sFAO7WudT70e3aLk8CeCaK3OJpOmX6ZbYRMMePksLLqFKYMKElAcuBhFB5whWjZk
	Ja+Q5kID21X+YK0i6+HVEk2f+mqrI6y2pEzp6w4weR4aZfu77cwSOA3043jagd2j
	gCqWfQwDvq/KSEKSEmk3qEY+raNrTqknZdvnf0MAh++tRUyZ2ykgGMY3AZmQRRYg
	oQAE7WzMHz/pcggqP1rfR6ZE/2PLALpFsyarfXhCbs2eueg8FuXnEqqvAjWLwG9W
	nNOyqUe9Ew26O4hDW4u/yuKGg17v9OhKW1VP5ixE+MnxwYHARTIqFYBxJP5YPA3s
	2douiQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv29bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:51:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe75b7dbso17140661cf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784224300; x=1784829100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2J55IczMGCViMSYvTExD41TEsQ/LIk+6172XNtB7CFE=;
        b=U8gTAXMfMah2snxmcQmOBnoJvCqzM2sfaqp5oRkFV7qU+5PUBC/uubbrO3JSw/LYUp
         sSq+2EiASE2YYQ7fm1Oac9DqCBKuUV1H8CUdUjuYRxn83k4UNOZW7zFbVra87F684b/1
         LmwUhqf+VJQu1UC4fGI7yPeEedn/9EFJSBPSCzO5QiSJeng++zFSMDJZcwI1gIl6/HeI
         rTzu7MUL2EfBIS9IuCPj67IdLgggSTeaCkmEFxBR0vncEiulXdztN2NHDhfiJ/JOh1Nn
         c+aySlMk+nFRHHYsIbJGR7hgip8mEZXnDbxxjLVgSe7Yz3+gO06ovNSaIiVKZD4QGTwR
         /eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224300; x=1784829100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2J55IczMGCViMSYvTExD41TEsQ/LIk+6172XNtB7CFE=;
        b=npLSpKVWsG28APNtBqIbhpTofeE/jAqxIMgkh1LG1akkARCxT8cRnzWhBeLsqFTKVH
         +OR7mYlD+m/S7G85W7AWOJkajlQ51z9OvNxXNBqFO8hhaZzyPfbMorykGjkI74CkUumW
         XBJ/2UsExG1snsN5ETv+k/z16nDYZZcfFdQqHIBsS6XUkDONl1ZM4E2R4HtoWOVRY8v1
         wIPsNorak4UmcBEZPErnU7SssEJ+0Wo31zJPp1mq+Q398zpJdVrb158gqBSUhsKhFIaq
         4aeliPynwwrgROCpn+I+4WYS7dep7f6EspXX2IKnuaLF6j5IMDWEAr8b0Af1xuMJJ1Af
         RcIg==
X-Forwarded-Encrypted: i=1; AHgh+RoCuzTUhHAKQ7W23hGdK/eO95RHtMRKqC1d6KZAwsNx4vpPiRt7LAvYAGl9C2jb8a0w6hKUdg08HDkT@vger.kernel.org
X-Gm-Message-State: AOJu0YyvTKrVpkdxFRAYI184X6lftTNQYhEf9YFuk/m02o/A9ShVEfYM
	lEPK4bAb6id+/GZO+9Fg5TGVellS5NHuqZbhp09hi4VizoyPmDuX0zXVxPmyezTdx5RXvZktVyE
	y3wyqGnGOjmMsO1y9jBL0r99igPgbWLeeyvi+5lvfA68ocyU1yPj4Ec916cAJs+P+
X-Gm-Gg: AfdE7cmpWwcOyfdtABlqVjUIe5B0iv6wuAM+Q/zwbZoPMhpLi0uUPyJKhKHuWECbpHb
	tQ2GrqsIintOzZkQTpqwsaYhZdP9ZlXZzAkcEKINTp0d97SVPf/x0xEDHIbpUhsusEtMxr6Lp3u
	Q2ejuUOvNRwPKRBfydK54M8QZty2MDx22Mizx8ytfjHheBORaZphEMUJhHv3p3ivn63Acv217Pj
	1tML+omgPfOHhpSQnCxgX+kHu2+Jp4uKQFswFYog61h5VxcVAuER78MUTWyDmTrEa0qplh1gUbM
	8WcDjNup4eMtePGEBOJGmIyL0fpxHLKrSikNfasNfYZY/9+OxcOSjjIcNmXgJEoeBtbNumDkeXF
	wmTuV06PaNwEFaC68WfMWcbyd
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr191507581cf.4.1784224299636;
        Thu, 16 Jul 2026 10:51:39 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr191507271cf.4.1784224299227;
        Thu, 16 Jul 2026 10:51:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd289dc26sm5032315a12.10.2026.07.16.10.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:51:37 -0700 (PDT)
Message-ID: <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:51:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
 <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfXzsv/s6FIwNVm
 fUFV2J34L/NqXrWXbhr15tTr64M6WzQ8KMGzDV3sLRcDArIs2MXFG2jaGC2PT490AlAsm0zd2pz
 jZM5iyidBNCHxQ/WpfUHDjrtfJwD0bHYZ6c4Xqk0E1JBb4k48B7aVPQ5MZLkxPl5Zyd05ElLB6S
 ZEt4DWOWYGEuYzmFctv4rQ9wEUtDOLx5xhm7nns2ALTkdVA3JSAfA/Bh4QxuBNlDhkys+1ZdIrZ
 1TNaP278gm5KcZmVvf6SO7yhYY/LSoHJ+9j7+VQKsVvoxRVDUmhYvBOHO/fTJ4IjVPulTfrZygY
 SGG/yUoqvzun8lRhXvBHku/hHVbPoCQbXAe0odfnXwR0nFIYaM61C4g1c2OkAtwG0pbxZalf648
 P8VZEzcEZmRDNoNp2xBcfGuJJRyVTN8R9B4OLyAEuOiLAnoy+DnPtaEOQqMg71vdzVYnMz1B1oK
 V3JP0IVzl0bdVRYxJOA==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a591a2c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UaOxsxZaHnh8_INfHm8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: VILoVHBH-Grj6xdYP9q03BRFzGhICPEg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfX6L1ZjHIjeGn/
 MtEyRwoaX0YhKxp13Tqsp4JWNjPiHue7hEAt0NzNVGt8lc0BZ9T1sg36uCqDGzGzRcEbCe5EKFw
 E/ueRs3GPFudPV3JhPnPoEE7qCdfYfA=
X-Proofpoint-ORIG-GUID: VILoVHBH-Grj6xdYP9q03BRFzGhICPEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160182

On 7/14/26 9:21 AM, Arpit Saini wrote:
> Hi Dmitry,Konrad
> 
> On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
>> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
>>> Hi Konrad,
>>>
>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:

[...]

>>> Normally the backlight EN pin is controlled by a backlight driver.
>>>
>>> However, this panel uses MIPI DCS based backlight control with no
>>>
>>> separate backlight driver. Since there is no driver to assert gpio91,
>>>
>>> we control it via the panel's pinctrl default state..
>>>
>>> So this is platform specific pin , we need this to enable/disable
>>>
>>> the backlight.
>>
>> Handle it from the panel driver. Also please fix your editor to prevent
>> it from inserting extra empty lines.
>>
> 
> Earlier I handled it through panel driver, but this GPIO is specific to our
> Qualcomm Daughter Card, it is not going to the panel connector.

So is it an enable pin of a voltage regulator maybe? I'm having trouble
understanding how this is all tied together, given the panel driver
uses DCS commands to control the backlight status

Konrad
