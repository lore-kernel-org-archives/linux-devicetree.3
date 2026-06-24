Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6895296BCD
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286566; cv=none; b=BHvP7QvZjIAB+/LPyCRlJqrc+EXtmuuQT+WjQD5aEiWDYtCxmVswMf/cSS8pCYGWmDat2+J1P9VNr3fjY4Bm7VZ3thkFhiybuWNiiDhPoWL/P4yIKdO022EMKq+cQaK2eBENTBxYvV3rYeT8JnRGLXIf5noSWy0IE6+hXy2cp6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286566; c=relaxed/simple;
	bh=zOZeDrcLdvch142MfHk5MS9B210apc38s7awcfMUppQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACw16buJDN6kg9FzSHL5e9mKxd44TWuSqDB6liYkTMGHvxOIAiJTbyzWwvf8CsE6NlL54/Xm5anT84EGUCk49C0VKD2r+P34H41FFQ6en1qnElPMZt3i95F7I7S1cJbOD00qWjtOPa3TcI53WG/CZep3gAlI6LhwPLABJ+ZkZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIr1vla6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1avWWk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIr1vla6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1avWWk+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uIVT2460775
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6RG6qHBDsBVG9WQlfv5QhkPRXQjiqbUmHJ4OHjs1uU=; b=iIr1vla6ptbh8LBu
	YchkggFB8ha4UMlPZS5dJjOtQtWI5NhA1MHPf3KVXWNb3p5AN7t8yu4MCfEh68rN
	+uHUTuU6DkuWQe2t4UJWaWkgYIjAhMEFkqyR1kpyRSpB5Dp4x6Pc5jaOOcvzl65z
	3h5blo0iux1UQuKDygbiNr89i6XGeSc+UnV5A2tHh4E4uoVS6A6p74P1gFfGKSDc
	eDwmRJ6nu9q3IrDmEMf9CJjXLn08rw06h0fBteO+YCoqspZ0MrShVZQ88Vn06Uv+
	1jAb2bdEVUrGXlMdTMKIiNIkaelTb06k2VdBPQbLndpyxQ74b5etk99RBHCpofuu
	7hKJtg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh3qn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:36:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8df7f21069bso1463696d6.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 00:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782286563; x=1782891363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6RG6qHBDsBVG9WQlfv5QhkPRXQjiqbUmHJ4OHjs1uU=;
        b=I1avWWk+GDcDpkdfL8gWCSEgW/aPKQ820oIb9G0TcXdy4J+oM+AZxzY40TFam+KgI7
         y8MUFoYhhh6fPPDYruwF3E8SYUVCrpFjKGE6NMMKVmZ6h0AFQTRdD1x48Pq2LiwEdFa6
         uj96QqiKHbh5t8K/Zb9jv5ztzMZuRIcFZiZHsmr4ZuOhEYnGJKSZcpL1n90rICSdtVqz
         i8b/xFALXAwI4veil5TIUGDwv+kjm14ZCtNapTwV/eRU4FOs7ZvMjETV1gs7UwMR2Y5R
         qT2wi77Iu0/yEKkTuJpxIgmvyg4gKtziWM5NQw8n8MygB++WZM94H2JYGy9yuavwXhhB
         x5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286563; x=1782891363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6RG6qHBDsBVG9WQlfv5QhkPRXQjiqbUmHJ4OHjs1uU=;
        b=hhctM3xs4ld09+dOm1u94EDu2AgGN1hD8tagR/IfGOU4jLwU559sF/8tq7oKqFVnyp
         z5cSmTgvtXzSuh3ltQblEAchqPg5bQCUFOw75iNl+rrb9gj13i8BjtllBJCj5hcPgfkL
         LcTOcV7JlQ/bW1ZCdDJQdE3ZKT6IO0Rnc83rsLDWrLIwFMJPA7S8vtIWpHgGPRL7TcXC
         OGKR1TdVAS9PcQDOEu6WseFakzmCNWSbj+ptTQHSik5BK/CdqvTB1yDxI7KkTWb9PNqL
         q9/P+QK5T3TX4HNUZB3qHQjV3CnSM4adTzg0RkskUef15dy43VIi3ch29mcRauOciVUU
         NVcg==
X-Forwarded-Encrypted: i=1; AFNElJ/d2gGWRhiWAzS64RcnVyIjY8nCNDB5ejmopdEvM7hFKIIHkCthE3x+uaa2acsY4KZ0zCe2nhuYibrQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6d8R1uQp7DHyXi7smtIThbAWzkkQJiZBeTMY0sm4Q7XnvU+lF
	Qvm0ztYFG6Mb3w+C5B1QX2MKONT7bSAo4w9wP3Lhbak12sywmNDV8Y9WpKEK1NiGMczuI/z9JbG
	TOTbIVYR1PTwD7lgTUIRzNX77uU9xL/z8BlqHAW1sibHwJrLDZVCZ2rblsWIJvDvm
X-Gm-Gg: AfdE7cl1Oyh2cbrn4YZkOGZnNj+Y4WEPZKwf9urJRpFBIbAGYDwgJJeS+HMQWUBnVaZ
	wdrLiAlcFTYoOJDRLZAw2T2gjOMwd+oNIxRzc1GJOY7ERAGDs/zqTYFs7kQTRmV/T7Ygo9Rilwd
	45ohBDcOb0jkmuVlxtl+xCQRhXPTL3K9tswuH76bvIk4g/O5jp8P3M++cTY7R9U1Xpz3N8oua+I
	XNYWEYqaLfUDitknw4ByTYkwMaKQ26vfgNQZ8H1qTeJ6YR7TAO541tZ2HFV/2xeqf5aRLhXjz3s
	uNwZdClr4ZAhtrIqW5thCVG4P2aY6Ux2UkmE+5An1EiAsKiG1e55KzHZ1ICwA8dHy6HZpFiu8jJ
	J31leDub728Tua5N790ua0iIrWkgZTgIXL4s=
X-Received: by 2002:a05:620a:46a5:b0:920:798b:e28e with SMTP id af79cd13be357-92185ddd071mr1940279485a.3.1782286563020;
        Wed, 24 Jun 2026 00:36:03 -0700 (PDT)
X-Received: by 2002:a05:620a:46a5:b0:920:798b:e28e with SMTP id af79cd13be357-92185ddd071mr1940277485a.3.1782286562587;
        Wed, 24 Jun 2026 00:36:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49a759sm620337966b.6.2026.06.24.00.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:36:01 -0700 (PDT)
Message-ID: <90f9f8a8-971d-4cb7-b2a0-248349b329d4@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:35:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDA
 850
To: Krzysztof Kozlowski <krzk@kernel.org>, david@ixit.cz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
 <6ddd0652-d18e-4e23-a230-5f5c8a9756f8@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ddd0652-d18e-4e23-a230-5f5c8a9756f8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MSBTYWx0ZWRfX8uXrRknH+CP+
 72ANe8np4nHBjsCbRDBOMCyylqV6hiyw9P5yVMfN20WQQpdTDfcRasrGrkvPkU4MLu+fIqGJhBw
 /doS0zgtZNFOwDGWVcKCDEOnoiebs95GNoZzjFHvXQ337iwKs3jGcy7YwwKurxzjWpDseCXP7HG
 D6VTHlApz761sXQitvadQXidFapucesN1QhjdQ2yN3hA7+DmGRGZ+9G/frMI8mYAV9ZzTTAMSBM
 T6JJdny7vIvp12IRnTzII2QEkq2J32VMN2myXYi+Y6u3YoDYGoP4ZQADYQh7TnY1hTt+t1derlO
 ZAAcv9KsjwniawWFZz9HoGm7Wz7K4EMH167g0yNUhwfB5sP9f5Lc2bMVEYBCihjo2Net+/o69tJ
 VNhINsB5SFrIAJP4VHCz83doE67mcAXmGoAzgo9tVlH78aGZKky2I7nePS/rvdY+NrYZp08p4sd
 1yR7Mli0SHvuYIYBMPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MSBTYWx0ZWRfX9yk5yQzB4ekJ
 6WIMIsoQhV5d6I4OoCFywWVgwWDkcmse7CadvqkGh9NfUbghE96TMyRkR39yT3HK+HXAbTpi/fm
 iedbi3IXgKp8NVjBggbnVxYVekQ9Ezw=
X-Proofpoint-GUID: EGa_ZHrUsgBK-cdYSyMzYlXb3UbtE7-Y
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3b88e3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=zeegRnXwAAAA:8 a=Cgdc60V6Jtu-LXmvHXoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=aYiELVVybkd6ZUoGVZ6h:22
X-Proofpoint-ORIG-GUID: EGa_ZHrUsgBK-cdYSyMzYlXb3UbtE7-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240061

On 6/24/26 8:26 AM, Krzysztof Kozlowski wrote:
> On 23/06/2026 20:41, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Add SoC ID for Qualcomm Snapdragon SDA850.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> Will be used by Comma three.
> 
> Can you provide a link?

Previous gen of https://comma.ai/shop/comma-four, they don't seem
to have the old one listed on their website anymore

The other computer tells me SDA850 doesn't exist and 348 is SDM850
(for which we have a number of DTs in the kernel today), so let's
rename it and add a second patch to add it to socinfo

Konrad
