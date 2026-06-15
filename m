Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B9D3EA66
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781498763; cv=none; b=F9FDMTayzREyl36Be/sZ5tubU3tOyVYLe2L4Xa+J5rqNvuyAh+W0f2wGk3OddYsy6lUdb5jpHqel/BP7BUhloNhA+OtCeeBr9NHWQ4vt0bgBZl1xRjfhqzP1fzPVfwH7CglGVvpv7WIvv/4+hUIv+SLumH75dLn7imOtorllKHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781498763; c=relaxed/simple;
	bh=JWiHeFDYut/lNpRe4jVppjxnuTFiIBDbHPlaQpSFS7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhwrZdwoDO7gbugjqKNaApGf0/NkhqqcZbhxjogw3cEcPeBfqKq4m286dwSXHaJlBXX0m7QuA3na6JNfzw6n2llBXj2QPGnlSYWTBdCYtkck5VR5Qk8HWWQGmu+4EMuJaIv7ER82JtWkYz515ALQE52DSp1Ze3zVE/Y5vib/j6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxDVXswa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvD2lWAu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxDVXswa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvD2lWAu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1jQZw3089772
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7B1Rri1bOKV6WrRa0Ahdi5sYNCs1jyUm85PYhWylAME=; b=KxDVXswaXB+WGYJ/
	yiCJeN8HBMKIM6XpNpdP1qgzzBLp8yOi9HbsZXvR3uC2KnsktXDA9nlkPxkeOFaV
	TxbVfu2CZy8fRFlB50H21qmpnNqk1rdnwgdOWjUSsriXPzYxRS2wTFmsNlXirKvb
	IT3MHDlPiQ8CiCYdOm8KCSWHqVisWwA6ckRkwmvevgI4mnu1s6Is6pxpNtp4Aqx8
	2R2jlB94cKfWM60/jNlK3WSs70Y8bWc2SPDDrGWl/NUpOQLu/Rf1/8687xPwDQfr
	q7u5+inO2ezS6T0HiH/RyGyd7NEF/jL/iQsGvZE2BUaMwCppAdATXVfYkq8x1i9f
	eJ6HbA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6denu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:46:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso2106798a91.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781498761; x=1782103561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7B1Rri1bOKV6WrRa0Ahdi5sYNCs1jyUm85PYhWylAME=;
        b=cvD2lWAu746iWZB2hVJoPwMF60UIOOT8QFpWOX3lJjLEAe0RGuqhVr9q3bpuZncBLH
         XgUxtDe9aR6ebe/N1WxXVL5t+s1TBrabE5aDycVG8SL/zhII/V94WdzLJMO8wjmHmouo
         cm7LypP2fW+t/xQBI7Ki0Yawg1ZaflZM0C5C0bjjXUAQmzufA+hqLWg8GFhrZOmeYC4e
         wTmgA+Xya4wswpfMBeWH1aCm750bmmCYhZGFRoy6la6pD3VBQa10B8YnxgF8lvLR1/Pn
         E59M6ra2coN6ZDR7rh+G9f3pUf8e3TkbDUfCGgDBzCv2DQV0ELuHl/Yl8CXxCtknm4aU
         wAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781498761; x=1782103561;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7B1Rri1bOKV6WrRa0Ahdi5sYNCs1jyUm85PYhWylAME=;
        b=BLqyn0eskcylecQzwbBVVHChjLkZzZFCbKhyQkOsrEJ+teeVd9/7ljOLgzZGP7G56m
         LIHkK1c0mwx4LZsXpyqoKLT/K8KBsYFKHiIsoxM2iahHEOB0c0P+WOOGWJRrF+iiHP+R
         NKCEWXIL79RwMvldTkH9HTAR0vzIw3pGZg5f4F+UFbmTHQPZrO9hu5KaW9OCy7fcpasS
         Bitt42fv6lpSUCwqY3m2mrvGrJxuuRolLBDMRraLDszvf0W7NGBIeaBVErpYvT6TfsUB
         bIMpNJi5+rxVnzu8BbTloVGU+4t41FicrmWAZXOFIBG2S8YEpUKX+miQZUdvzR2xqyvR
         16dg==
X-Forwarded-Encrypted: i=1; AFNElJ8samGq8C+lR0mCd9OCaNpnBtd1HXVsy/sxDqgsqyY1mcsqctanD49oeo7n0kHTrBZBXxFvvrLoheSv@vger.kernel.org
X-Gm-Message-State: AOJu0YzNhQAwSXRr/JBSERrcQSjWTBXb7sXMdZL3uIV5/w27d7ozBYX/
	58gMeoWoqwYOJMLE19/WJE+dJV7xyJrh6J1QJSdAjSrrMoDQ4bSkx1qbu/SbKv41yLaaNA0oYkh
	8nv9q2CleDT3EkSFOdJVWTs3vOq0orLKg0BWXOHWLVSucnkgtyE6bh8QJfJeRKjH5
X-Gm-Gg: Acq92OHkPTPJ9Ol3VTbQxo9hRAkcZ5slkMfMNlRTq/76E1yHG1bkIesJ2X8s/JF84nI
	qVuPnfQkJlwMqkPUme7TMTPo72s7cCpeIySWeAMWIYNg6NjiNgNuRAsIelZCId2rKyJIsfDeb41
	YFpSQ7mUMrJkLxaqEfZnSvjHg31pzZhFvQSMXjK+PWeH99d5X3zf7S/50xJFRXOoHzogMrQLt3R
	wxsi3aYJBof2UPer2QxP2wWRTBeyniyHGj8v7DaMSg0/rRsTOLjjMJYXsMW7kPmfL/57yqtMhJC
	ELvGb5Ov1VbWemxYOSRd2Sx4u/Z9y6IjbYcDReLJphizq9N4DoOBk/QG6buVW/urgwfKkuaVxPl
	/rbRyUJo+0yfbYBDFm18FJFgwKo6sgff1MTyBa1JEeNSTmTY=
X-Received: by 2002:a17:902:c402:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2c66416349bmr112903635ad.13.1781498760605;
        Sun, 14 Jun 2026 21:46:00 -0700 (PDT)
X-Received: by 2002:a17:902:c402:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2c66416349bmr112903375ad.13.1781498760125;
        Sun, 14 Jun 2026 21:46:00 -0700 (PDT)
Received: from [100.70.28.15] ([49.45.133.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5565sm86704935ad.1.2026.06.14.21.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 21:45:59 -0700 (PDT)
Message-ID: <432f3a3b-3d28-4130-9a9c-61be04eade1d@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 06:45:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
 <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
 <dc833e56-e127-47b7-9ea5-58d6d2cc193a@oss.qualcomm.com>
 <c8da8a89-e372-ca87-cdca-396c754ef5d7@oss.qualcomm.com>
 <1a66f1a6-840b-4de4-8e65-a3456b654044@oss.qualcomm.com>
 <91a90c37-f93a-17c8-b4fb-290759645977@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <91a90c37-f93a-17c8-b4fb-290759645977@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA0NSBTYWx0ZWRfX8DrzLPKteJqH
 YjdF3OQrITjXe7l2cnKkNbP2feVvznrbmBibIfkL9sJkTM6v+iZF3cWQ54bK+AtSOzOsoT4wAie
 0K2i0hNErdZx8/HFEyWiq537hh98xO8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA0NSBTYWx0ZWRfXy3s6m/mNTnYS
 ZkG+3jnLmFMWLpa0qSWPTEO84TMzfv8ML69CWy54oZZPVxz1cxKiuaeloJ3XqnS1OrReb0/y+FD
 TtdCoqDv3baZbkqFktH5JgSVRan4fvwSCKjYYAzfHDb4W98uUtcDe9z9/3tZnWU1isoiwTYgUSu
 A9XFvr2qsr6znZe1uIumF/I2bRdsEAEETfZKN/RIpAJ26xPlE8QNn0pNpM8WQsFw0eM9taLxWBW
 MvQZsT4PgQyOwdI9g+1MpPOZ4AWNcwimdrvYD9bQAENQGpIwADgC+beQJkNUUpGGLwoDIQQpc+s
 whO8C0mPnkRGFEO/7r9DHOB89MGc3keAxNQ6kNeTmbQtlLibpO/9QILjHtdf7vs36bm2s+lbSd/
 myLUQTP+H/t0N+OUDkr07pG71kBB/ohFShU2ppxOxXDMr4yXmZLuo2A52hprcx04eJyPIl5Psqt
 qSGWWsFsGkJCthYYHPA==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2f8389 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=0jymCCPDh6kUuRDdYuKZ0Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Kt5I_01B2RkASw4xh4EA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8z9ohZVTL81y6niIAY9DgZ165j3Hsxx3
X-Proofpoint-ORIG-GUID: 8z9ohZVTL81y6niIAY9DgZ165j3Hsxx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150045

On 13/06/2026 07:21, Neeraj Soni wrote:
> 
> 
> On 6/9/2026 5:19 PM, Krzysztof Kozlowski wrote:
>> On 09/06/2026 10:18, Neeraj Soni wrote:
>>>
>>>
>>> On 6/8/2026 11:40 AM, Kuldeep Singh wrote:
>>>> On 08-06-2026 09:46, Neeraj Soni wrote:
>>>>> Starting with sc7280(kodiak), the ICE will have its own device-tree node.
>>>>> So add the qcom,ice property to reference it.
>>>>>
>>>>> To avoid double-modeling, when qcom,ice is present, disallow an embedded
>>>>> ICE register region in the SDHCI node. Older SoCs without ICE remain
>>>>> valid as no additional requirement is imposed.
>>>>>
>>>>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>>> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>>>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>>>> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> Link: https://lore.kernel.org/r/20260310113557.348502-2-neeraj.soni@oss.qualcomm.com
>>>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>>>
>>>> Link should go below "---" to specify previous discussions.
>>>>
>>>> Usually maintainers add link of patchset being merged here while merging
>>>> changes in their tree but authors don't add it here.
>>>>
>>> Do not see any such restrictions here https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>>
>> What do you provide that Link for? What does it bring?
>>
> Kuleep highlighted a concern with the usage of "Link:" tag. The link i
> provided guides on posting patches to upstream linux. Wanted to highlight
> what i folloed and I did not find any specific comment/line in the guide
> which prohibits author to use "Link:" tag in trailer section. If there

This is reversed logic. You need to provide reasons WHY it is worth, not
just claim it is not disallowed. Adding 100 Links to whatever website is
not disallowed, so you are going to add them?

> are guidelines otherwise please let me know and i will correct and post
> new patch.

The "Link:", not the URL itself. What does it bring? Linus made clear
statement that you should not add links UNLESS you have a reason.

So please share the reason. If you do not have, DO NOT ADD any "Link:".

Best regards,
Krzysztof
