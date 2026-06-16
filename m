Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267EF43C05C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611472; cv=none; b=V7/p/AORuGS8dzjaJXzEhbJocU+b3N3jprjFHJUNaeQlcu2Hm3jFak/X7sT1ccQFUltaL5n4AfVsta4QuCltJuqmWQhWhrrX8+8lFciARMCqYv3t0F/Y2nTAowgfaT5bYOx2V+T1uMqiZmiHwoINJNoN/YzlTkOQeMAWT7uKmMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611472; c=relaxed/simple;
	bh=DDkm5XCp9QcGdO7E6yJwdMFO/sI704vzAoq+VFSQUSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kk2E6066hJfLQKwAv259UnXP/BujrII4uqQ0jkjxHnqe5pS1MzEwg0NuBNl24B2uw7nLoMyAwMTm74k3hkvgYsUvcTYlmkHmGAz2A63ZiUehDxYYAo4D1Z9CF86uhNguHafG6KCQeaiRxe+Q/dDcVicVYM4hjv/VXV2axb4BVYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZ9J2lz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfBSj1I3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZ9J2lz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfBSj1I3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABnni3384135
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LO7ewEKrdNJ1MfAiKPupz6CUcmlGWMVqGMR+gHzOGpE=; b=GZ9J2lz0AwR4+li0
	t+Pw4YL0gpu09jzCVWmeLPOw60m1z0A18KZ31+6oSJxOEFA2/5H+8kdImzYjbODk
	osaD8pVS6+h7Y/H+gANAKuviF1TsUcRUdWR0uCJ6sS9sHan2V9svjcCsMC468JBT
	cHkXklLs2i1tu3SYCIakIWqLl04DGjAUhj3EVy1/3GOIr+XO+L6dvAqEfVukAB5+
	L80125UiNI0H+8dOaiyPn/ErhVIXjIKz/bH7JBsr3VJ4rmgqWxOGXjQW/gyhCXA6
	1l0ssQErRjlGVQOUsqFlQTGAKGP5VO2MZhmKWOwcabzgO6nVRINjoP6UItScJJxH
	nu3rKA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep99sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:04:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cf9fa331ddso179828137.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611469; x=1782216269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO7ewEKrdNJ1MfAiKPupz6CUcmlGWMVqGMR+gHzOGpE=;
        b=ZfBSj1I33nxAb/qhWHFG/wLrDFA7m83kjKKO+6/t5CIuZnBbqW3MTUPzxz0az4TveL
         OFaOgpvZcADjtX1UBH91BMgw4hHCB6XYtM433Wm2kCTwOQd+i/UiVX8V9489Xdih5aaM
         dbS9aBZ03v4MCqMbUzAgrqlYAV4HmEDbqYPc9N+ikdMWq3qxzulWtRDYRCkHM4lOFEi0
         cb/oZ/PhvHF76lueyuAm54y8TQxwg+qd3S1ivv1GmWQF9b+bOFYylQvKOr0qTohPELjy
         Gh253DBetumGcGYG6oJkHic8INwhNaCQQwiP2S/Db8wtTi2xyx+5dBiojUqar1ZLFcM+
         ZEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611469; x=1782216269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO7ewEKrdNJ1MfAiKPupz6CUcmlGWMVqGMR+gHzOGpE=;
        b=DkfKreZjyR1TOvRNofkOffItGtlGzBxutg1yyrn2mUXSAowoCMr8CM1ZIB5O/Cv2cu
         8FTkMKpfvTanXP6YgqtCoZqnOuocNyvJvMvrl9891wYMLyukH2a/pMTXCUQ6A7YgFVeb
         ddC098LJzmOUfNqXQwbF2JrLTPh+3KSCeCbhPOZ7K+RTsgevfuQ3Z+9mbxr67hmmGXfZ
         0IFV648p6yBsxqOaP/r0R3V++DaIn6IrlXeXyxDz3AYFIiHUPR/yI5APIaJMe28v/msf
         HkkBeXrH4b9JJONuDbyY4FfOFfYAwVNDo0SdWIYUXAO2xls6ZGv5pjntwTw2+aW5kZ8h
         xlbg==
X-Forwarded-Encrypted: i=1; AFNElJ/0Qz//0SV7Gloro4zSxRAds5wE2j/OL0pEiqYzAmLglHgs0g7Eg4BALS5sh3FuYRu92kxS1Yyj7lzq@vger.kernel.org
X-Gm-Message-State: AOJu0YwhziWMV4ZXFotqcHRVuBI+/w3rX7aHYOVMkstlcsepRJVDkJmE
	B1fJiPFWbcGCY5HSAufqYrchuSCfl8Pfdqu6qAa4snoo0o4HarTZao4xEr+qovsHI088wpK9C/Q
	kz+Da8GEdxZ/VM6NqzbiUWojktRaT337D+t4LHhrs2WBq2fAvtXSTULPU2I3CtU6S
X-Gm-Gg: Acq92OEc0dL/tewwRr/+oikzTaKlKBhHmpnMsvdHSJbT9rqNf9TnPJC90ZNUnZ+4MLR
	egAaQooQODs6wfkg+Zrp6c/dWDIlXFYhMZoFymd2BWt3QsmdW2sg1/5W2Z/c3nd2rSlnsGK6SYe
	HiPJBbEljDknSe2qYiPa85B6w+/WYepYHEI4XPwMfTTky/pMjdY6fEE1c12WfSoj402nENKZS4v
	YwOBesnOPQJ6FKhGUYIm4ZM7Gg6wTDkKPLRL42GNGX9Ime7KPw88WQJtQhhAekZi3wDH5dnVhSB
	bBrOKWf17cdwc/sv4f+YNpgEULH93XgbHToNbx4xmbCQTpYDOa7U3isCfaBzLqSHSzClEjAwG0k
	5VCBRmVNFKpOC7UFWtCouaWQfclRNLk4lFf/LgWlazhexkg==
X-Received: by 2002:a05:6102:c8c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-71e88c6e864mr3803204137.3.1781611469373;
        Tue, 16 Jun 2026 05:04:29 -0700 (PDT)
X-Received: by 2002:a05:6102:c8c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-71e88c6e864mr3803159137.3.1781611468752;
        Tue, 16 Jun 2026 05:04:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb51007a9sm626094566b.21.2026.06.16.05.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:04:28 -0700 (PDT)
Message-ID: <e7461734-9ad6-4d63-9ee4-106a635e6b58@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:04:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
 <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a313bce cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ERXISu5ESIjULu5SvvoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMyBTYWx0ZWRfX8hGe2LqC0/17
 gdB35OoAGqF9hMw5Zsxl8hty+K9B21uSKFgw0gsQlqbicWarDV2s9e24zF3QgWP+TyPHSardZ6p
 PmsEpDOcpdYmV2mRJk03WMfPL0pXCvk=
X-Proofpoint-ORIG-GUID: l0iKlAlvaMiMod8EncNmD2jLXhDCiPRe
X-Proofpoint-GUID: l0iKlAlvaMiMod8EncNmD2jLXhDCiPRe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMyBTYWx0ZWRfX9GbAXJEdvEMN
 d1WTsCvDzmhUyRM/zDGsAvXqMZL2dfx7XKJ4D2UqH1bDapyZKRrwp7kI63Bw/O2nDD4ncsN0NO2
 UQSS3zIXUloy0f+ZDr8X00F8fTICB4RI1PCy0W8FOCO6EOpPHDVHT58QnFdJwickiJ8O/Vnmrnw
 tLMeN4ToUIEHETLK7RZJ9w3YMbmMrmPiPUqwfWbgVKPxk3SrSVwolEgXdywHRtV8y2rXOvRwLQI
 KqndYcM3PEiJMZDNFllriHAIXDRoi77n2T4ECZmTczu5kInbcX6w3iaGTFDdQzAb2Xxmjb46xko
 wgrfKBsiQK+DxMJbqUDdT3At7QsnpJ7jDCVbs5IQHfaoD+xh8A4MqVGDjdJ7ogLrss/qeHI88zC
 4YSo17Y1CWCUvDh/NUpKx+yn8HdgtcyuyjciLznN6Q5/9TK5piPBJCtfoLjGHiVMUD7SFRNjN1T
 JZF6PBZHanUoOBMWi4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160123

On 6/8/26 12:03 PM, Gopikrishna Garmidi wrote:
> 
> 
> On 5/19/2026 7:55 PM, Gopikrishna Garmidi wrote:
>> The Glymur and Mahua CRDs use the same board-level hardware for the
>> eDP display panel, MDSS DP3 controller and PHY, USB-C ports (via
>> pmic-glink), USB 0/1/HS/MP controllers, QMP PHYs, eUSB2 repeaters,
>> HID peripherals (touchpad, keyboard, touchscreen) and their dependent
>> regulators and pin control states. This has been verified against
>> both CRD schematics.
>>
>> Move these nodes from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse with the Mahua CRD.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Rebased on top of next-20260518
>> - Updated subject to include glymur-crd scope prefix
>> - Rewrote commit message to describe the actual shared physical hardware
>>    rather than the code-sharing intent; the commonality was verified
>>    against Glymur CRD and Mahua CRD schematics
>> - Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
>> ---
>>   arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
>>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
>>   2 files changed, 396 insertions(+), 399 deletions(-)
> 
> 
> Hi Krzysztof, Konrad,
> 
> This has been waiting for a while now and already has a Reviewed-by from Dmitry. Could you take a look when you get a chance?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
