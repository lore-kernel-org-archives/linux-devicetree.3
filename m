Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AE838C41A
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558797; cv=none; b=RqlPLDI4V9PFEWf0Y5fKXbuwoaPByUvcjIhQPfPhF+s5yZoED4xO/zKXpwMHAl/Ty9sBDBGzf60RE9t2OtnHzmtUMTUgW5LiEWISL37peQId1OVTVdGOe0palT8Z7ASOXtMwrJvYvlc6eZdkhBHmLYy2bZxdDW1xd2lwSd5E56M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558797; c=relaxed/simple;
	bh=Q1BRvUsv7enXB0YnuuNX6vXf990i10fxtIvg0mqMj2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iR6s86xlUJ9SJwSp9jakWDTeeRe6D+h+g433nwVZ1v8/Gn2bOkvP31TY+i7slQtyQY3HimBgYYpc/w6WfQIhnpdrvdvrdOKdWzKbnuzMgE7+/M+ofdctZYo3B8mrTNiaTFb1/qk7U9pySIM75O8fZiLg6tMzBWSHZYk0DwSpizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwezQetM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dlbf4ixm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwezQetM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dlbf4ixm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Pht74009039
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gktZZmnTluNBNjz5xNXTFGFAII1CmVulmd9Uz1N/BCI=; b=SwezQetMuZ3u3nfv
	aUy/DL3aP/64zWDDeMlR32eZAGfKBroJDwYbyaYXCdSQIoYBXaoiTjgZmQOHoPah
	BihykaN1LLHC77+ID2JRRmkvy2G5RqLbNn6ApDOFWlhI3YYXFe6aXLfCl7hhSgJN
	1WjxKCnpo+vnfWDFn3F4OVtwsuAgP/UGDahvVY0n2iff7R9DNN35un5rkT6EVGjU
	cSIQEC91mt0ccar4tk5NagLP1+2ahDh9+Dld/MtRuMR6UMe1Nsl3qzx8RXsO5e+s
	AF+YM0W+SlEXaN/0JXFyh2Xko+RPu6KDhaAU0Yu2sFg6anmCxyzhRCicnzlZPpGy
	d/EGgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrktadf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:46:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b6f869676so118789081cf.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558794; x=1776163594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gktZZmnTluNBNjz5xNXTFGFAII1CmVulmd9Uz1N/BCI=;
        b=Dlbf4ixmsNrTnKd3ZDRqLZBBmjzKKi7/qAzd93w9dBH9gw9QpHyq1UEgd9oPZpz7HU
         +v1UQwB3TiEcgzenUDexMvGR0oXMtCpwsPoken9iN8brBJlLhrZFy5YN8ytoZqJfOsV7
         U0OUVgbPxQVZ48eeyA3L/aZYQSUX2dQPweFvYpXCZgWkt2s67v06ayBpK0SczlKCfPw+
         tB+bEVFkoz9ifQSoWqxyeApX26ey5Yh8Jsw/MIlP6CjZfxss22wvrpr5zWoDmRHE24cY
         cS4JbyVm0fgkIGMJSacdbKyL35692PSITwhmWPqM6ExjgZwKdpWLxAu/t0w4+xKd9lmT
         6RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558794; x=1776163594;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gktZZmnTluNBNjz5xNXTFGFAII1CmVulmd9Uz1N/BCI=;
        b=d+CeUv6oY0zyDFWF29FbWTRAIqubSQPVZAxQv9ijx5SYDKOU2noY+hvTk/j/YP8Xmr
         +92pQbdH+uoSqZcbSDpzBxsZ+1q9r3qAMB/UZ0SN7EgOn8Ss80tZgpcuVTOnxWyvVOpB
         IpQk6F5VQHRBYDq6I9AgvpyspTov552fpjQ1H7jbyZc2VLT+PGYX0pImGXLgInoGx0X1
         xEaJ9yxjfl3ChEBRyuXqjJk+eN5Gv/wH9im6dH4LNH5//9FSmdvhP4GSuHj4hmSXya3I
         0x2TIlXNOtai8pUwo+xbTAjY9CeZWb5MOJ6GH2X4ojABnUsVHgEsx6USHIZ+5NkW35qL
         9gdg==
X-Forwarded-Encrypted: i=1; AJvYcCWI1lr581BFBQoCytKrJSL8G8BSzzx+81iwOpEeCwCTIeOSkkAXVfWAyjmunXT6JZ3Sf4U9I6zUo7+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjGBtJi7kE2ED4aAtxNkggMbZpcfKD1KpMqw66NfqWcYEN+gh
	lmYdwSs1HT0jluvqGLp2E5HJvXbb5TDl7CVQ8hS+5k9rlIMRhsHD2gBmwWhltoGfLAzFpX3B+PW
	l53fM4WQu/AuTXHljsSKOicMdLhfXZtTl43f6XNRukbM9IzoP9qXKoDgh1FD/bUQz
X-Gm-Gg: AeBDiesj3kTX7pXz6KQ3D0wribQ9rTgTHedihroW1XYZTTohc4s0yt2aVmH5Q2kBA1E
	5gDoclWlAvBzzXr3fWGV3iayY4QJSIlqWaYeRWVJ4/JhLAxZ2Z+dMlHkUMG1SUMkPc14Sjj5o/q
	QgYeTGwPHoln11c7rHbRyl+mcrJUBGT0WEEH9hnAAkyHpa1sg5iPOt2d0EcKRYXNpkRm6OMeORc
	b/R8gw09+QTucqA8Jt28OQfZ6Tqe/53okZAijwDVNDLPbnGlWVtoUxBr3TW14P14owR/r+T+ZkV
	QZz5Bubc0MWDRNVPso/GYLBz43Ur/rherqlvYeHlwTECIwgMyOPKqBuIFGwBlaiJISXQq7xowG4
	rceCQmBavoZO7wFkJ2BE452DCNQXjl9FwzXYBzRkhPPKqVW48
X-Received: by 2002:a05:622a:8d06:b0:509:15aa:cf01 with SMTP id d75a77b69052e-50d62b57d4cmr220989661cf.61.1775558794617;
        Tue, 07 Apr 2026 03:46:34 -0700 (PDT)
X-Received: by 2002:a05:622a:8d06:b0:509:15aa:cf01 with SMTP id d75a77b69052e-50d62b57d4cmr220989391cf.61.1775558794231;
        Tue, 07 Apr 2026 03:46:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83e906sm629215675e9.8.2026.04.07.03.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:46:33 -0700 (PDT)
Message-ID: <02d04a30-695b-45c7-931f-597908041b71@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:46:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: Add schema for LAN75XX compatible
 USB Ethernet controllers
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260403-b4-var-som-om44-lan7500-v1-0-0dadde850143@bootlin.com>
 <20260403-b4-var-som-om44-lan7500-v1-1-0dadde850143@bootlin.com>
 <20260405-smoky-spectacular-koel-dbfcda@quoll>
 <c2026868-35ff-4b5e-a0e2-bf6b3f6b75ce@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <c2026868-35ff-4b5e-a0e2-bf6b3f6b75ce@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4e08b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UcA29lLBTw3q0Y6YIV0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: cyBLKKYODK0m5THJQHpBby3DTjizQB-X
X-Proofpoint-GUID: cyBLKKYODK0m5THJQHpBby3DTjizQB-X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMCBTYWx0ZWRfX1MdM8HSZ+H/R
 aAyNVVFHTXpmii+qBFzqIHFj4kLqYKGkat2BEyOxq7Sm9d2GJrEfk4KCtVmT45UCCfPGLFTBa0W
 ff+dUkWVzeYic4QZ64lqUduVCdyNG34hHCFoaRAGg7XL7Dmg/MKwG8gXYqTSpg8zb7y+LWpwLni
 4h57fE4NbTCcXUM+QCYSJaP0XjzifMtTpuzOlWIg3SApfs2PUNB4fQUeIBi/pQrAzoTYb/FmS3d
 paGY3pELlUkCdtl41yqnzeXJQphNRxwRUy6OeR/94ANzWaHb9TfjXbhCEdCvYfd7tB6jSwTnS/E
 ACTN1WRv0IddVmkrm2H0Qw1G1Ss3WAjTmfLQkIqgwtVoyoYiLbs9KzGn7FZY2cJkUvw86PeLsIB
 prVvgvNImQ1rxVHTpGzamdlIAbTbjEt0PTLXn+k+PBmJjD84vTPcgnkMj7ZCV2AVUzfI6SVTblT
 +l8P4czKBbyPFPQ5dlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070100

On 07/04/2026 10:34, Thomas Richard wrote:
>>
>>> +      - enum:
>>> +          - usb424,7500
>>> +          - usb424,7505
>>
>> But you should notice that this is exactly the same as 95xx, so why it
>> cannot go there? Because of the wildcard 95xx naming? That's not a
>> reason.
> 
> Yes I noticed. I did not put them in 95xx because it is not the same
> driver. Isn't that a valid reason?

Not really a valid reason. If you split driver into two, do you split
bindings? Or merge drivers? Bindings here describe the hardware, not the
driver layout.

Best regards,
Krzysztof

