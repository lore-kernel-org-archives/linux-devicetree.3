Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563833DDDB0
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334229; cv=none; b=EW7bg7LECCJHP20fme+IJ5OSKVnsl7PgYZo65Rje/mQonszzsCOIIHcC9ho6L2yVufzT4bY2MUvgBJKIJLfiv+2nsQcfZ7+a3IZ1cy7QAZ7XglUQ3lOt4B5h+/RsTbOyW3gz9qPQtGso5VNQ4bxj6jdL3yt0gcHWgj49knqpr3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334229; c=relaxed/simple;
	bh=chib4Wmg4NNOhfRRVVf8fIUKZ9B6vaZsPTvrdjRASog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUMMpSagsoN38PEJn02gfZL4/msqU1oR6M6zaRBWxFfxNInyKuVKTPNxYX3l69Mlf1MM91vT+iNzsr2QFzGyW2hkWj9cHn6/GR972RBPridLNRhunNKSOJguqGC7rJ3DAx0s6M+oLs6Cs/3YHW83IlRNeilTZBEs8EoSeq65uXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L91Bmjwj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqh56VPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L91Bmjwj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqh56VPl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666949GJ056982
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdiCMuLc38MUQcjEkFqoC4yvkqdVQieeoQZppe+XN5A=; b=L91BmjwjN3S3sbBM
	0QkVH2/17oIauo1HMdzbXHrhkvgNs4Yt1JUTRUSOR4ClanB05qcBf+UIGVggpqoB
	wGQzMj3mwp8OW9QQ6C0tS4NhfbUGlKKA7MJXTFRpVeRYOG1JY6swuYcoS4MNdpWX
	lZ7Jx0L+6R9HMFXMwwUOrDVr6nxzyP6gQEYndfM5dXbc5J7wieT6uOmtMC/Ao2M5
	Ou+HlVqW3pjppktmFezr9nUF5vaSNkLUUeRuDs6wfjzJDz5Lo1XOQs8aBWis3wrw
	9P95SwEKq84pEKWhVarJ2q/nE/VrBStmSAhQlSiUUgzY7+6odhIKKXDEBK5mAiit
	WroWIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7gtmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:37:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9421691cf.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783334226; x=1783939026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdiCMuLc38MUQcjEkFqoC4yvkqdVQieeoQZppe+XN5A=;
        b=gqh56VPl8x4kYxrbDUenG1aerRZ2f0au46RoSwsFYj86H9YXy+XOA1EaIOdVp4Hd6A
         j5pl7gS5nOOd25kU1uwYxwbR7UYbh7aqUxOpgP8KXJxx5IWd2BeR0uLl851NXXwAUlZ3
         dTAlwPpWtIKAPsJiWBE0Bg4rXxqhBYeOH3YoRZgocFGAIj6Sxc0NGnM5pUsRiG8UvfBV
         TLXpW8UfFgEm5JR3CCDnP++TujqQK76Mr5WVTkS2bqtsgy3SqbZCG7rRuBbhVTfKrr7z
         CWMQp8Mgu9Yz6dsK5bn2pbjz5Oi4ax0uf5+huL51j+fQD8l5TeSkepjsF57q65AZIA00
         WXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334226; x=1783939026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdiCMuLc38MUQcjEkFqoC4yvkqdVQieeoQZppe+XN5A=;
        b=efZOQZAYekqrUVThQXk1RUejM/yR15RbHtGIjJqq0zKkHmWr/dwr2QJNH345ipGd7A
         3MV1yvd+J2N6WFHgp8MNLHN/gIgDKx7lFJVd94iasvy5IPEPvmbkerEt4p4mwhmY2y6u
         bmUP78TmAXyyuqPill1qrsGlIzlrhq6bTAWeAx/oxOkV4IBj9QVgAMt7CfYdAhhPDNY9
         T27aflIG41FYWhfl2brAp8hMYNM3xijKJJObyp8ccCRZn8Ff4CPakmVTTFAmBHz60iuh
         S5JRq42KHy0vPi7zj7hzjC8hGbhM8MPvFb/Q/PWQsq7dCgOd1XQkQsGJdr7UvOFycEuW
         jX/A==
X-Forwarded-Encrypted: i=1; AHgh+RqmdQY/LwxBH29kteTBnVD0tGxHVsxNrBtQ0K4Ri7RrXDQc1yxpah6T9/ZOuzrefyd2VUmqAWGJZXFr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyvae4NSkHnjaOtTlARDNiW2Xqx29+7SRWPBQQHDTErlyKvv6b
	S7Zi2xk/H0Z78ZthwnX4cmkkIagrQcLuXZF5Aq+O7WoiEib+h3nopn+BCZc3RBkMPrgklBzGSmL
	Ks+huhgzO73VgdfhVFXlQjpiuCSvQAQlNVJThSie8w1xttp8iWXgZfnLudpxPmGZS
X-Gm-Gg: AfdE7cmVZFzd0ZCsKYTDJxful7gyHbEShxvb7S0ApjaZ0vOkxboYs6yEF9ubsvbbLFh
	PBNxBi5eSwFflZqSBVzA3g0hT0zjh3WwBsA1pJyupRA5UiFyvZwoWYTtrIQsM/Yq/zawPtlsk3m
	63WlN0Y0/6gURuXy7UnK4Xq/VsJ4U+9AUZJFZYbbAStiZecJdlNHoTGdicOYOdA4U5uZwlBPVaO
	BbqFGQ6D2Mr1k774cZxoLel+XImVVTBZnLaZBzAd3EomlAjVVgtaya2/e9W76INbqYFqFuRKIbR
	ksoko9qOzMyNUcj7jxBExSUAmfRuGaCr9NYCZi5WjAsUmBseXBBTAkeYth3H0Kl8WSEbVdBEKz2
	4pyZPFNQ2J2gcQ197uHIrAI2MAvS9Hng7fJE=
X-Received: by 2002:ac8:57c2:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51c4be98625mr92163431cf.7.1783334226631;
        Mon, 06 Jul 2026 03:37:06 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51c4be98625mr92163261cf.7.1783334226158;
        Mon, 06 Jul 2026 03:37:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1370110sm2712752e87.9.2026.07.06.03.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:37:04 -0700 (PDT)
Message-ID: <4e521d62-9dad-4f51-bb16-1119dcc22056@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:37:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Acer Swift Go Pro
 AI (SFA14-11)
To: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-3-kaipeng94@gmail.com>
 <5791feda-226a-4a22-a79e-e6b72be141b8@oss.qualcomm.com>
 <13138cbb-815d-46b1-aa82-cca6e44878a1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <13138cbb-815d-46b1-aa82-cca6e44878a1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNiBTYWx0ZWRfX57/CKH4edv8y
 ejCEx4XurF2x8R3umYogQbfsr05jtxHT3ccjdxtFA3pgbTxIOcZn+ee49yOJ79BNnRxgCUFHGf8
 kLZOkb+djkxpmHsbuFaO/7hrgdL9HwOtGqqeFXLaL41VFMsNPAU24y/VB5cvaZFL8gguaOs01vH
 Tb/Iy34RLPE5y4tKGcpkbAPR3OxNQyzDWo9WMTKAhp7QzEdbeX6Thbi94086xjMCSdmLE9xZGgR
 sM+cfRuO1bFNlT1J++r+VZ0g/p548dECTAV4QYF/hqoBft78Nt4mfjjJJSeE//bbWDFXktyQKwh
 HLpWA+2m7ccEAHkGGyHeg8jt9lE2+ahEQJK/xpcXTHd3SHHI3pNHTe/nyy3PJ6g7IaK6s+7M3Jv
 cGRBdwNiBg+QO6bRH+HU+g3Mijkmcj/sOYUJ2uhz42QrRz1uMJTVV5Zysuz2urxWLHHSThn0DJr
 11hC9n10telow1bqmVA==
X-Proofpoint-ORIG-GUID: UXGnuMhJ8i_Y92gDUgylaGrPRs11si5t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNiBTYWx0ZWRfXzqqFrH6xjXJX
 qN8e/wtwB9i/8OPaOTQBPtk6pVVtuo+xHpHt6tqe1HmdJkzh6xCrCd96yzljax7NTR35MhQFNu6
 wzJjvm8fVjc+gjjbYcdAoYxZahYP0qo=
X-Proofpoint-GUID: UXGnuMhJ8i_Y92gDUgylaGrPRs11si5t
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b8553 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=5NA_9VLdZ0rIHjdVIKYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060106

On 7/5/26 5:29 PM, Kaipeng Zeng wrote:
> 
> Hi Konrad,
> 
> On 7/2/26 19:45, Konrad Dybcio wrote:
>> On 7/2/26 8:31 AM, Kaipeng Zeng wrote:
>>> +    wcd938x: audio-codec {
>>
>> Nodes should be sorted - by 'reg' and unit address if there's one,
>> by name if there isn't (minus some special cases like GPIOs), see:
>>
>> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

[...]

>>> +&apps_rsc {
>>> +    regulators-0 {
>>> +        compatible = "qcom,pm8550-rpmh-regulators";
>>> +        qcom,pmic-id = "b";
>>
>> Have you verified this against the DSDT of your device? Incorrect
>> settings may lead to hw damage
>>
>> [...]
>>
> 
> Thank you for pointing this out, I had not verified this before.
> Looking inside the DSDT, I found some "PMICVREGVOTE" packages that list
> a value as the required voltage.
> And I need to check if any required voltage falls outside the
> range set by DTS. Is that correct?
> However, some PPP_RESOURCE_ID_* seem to be mentioned only and lack a specific voltage.
> For these, should I retain the original value (from x1e80100-crd.dtsi),
> or is there another way to determine their correct ranges?

You can only reasonably-safely copy settings for L12B and L15B (they
power always-on components) and regulators that supply the on-SoC
components (like PHYs). Everything else may be board specific, so avoid
if unsure.

> 
>>> +&iris {
>>> +    status = "okay";
>>
>> You need to specify a firmare path
>>
> 
> I will add a firmware path.
> But since the firmware of this device is not archived by linux-firmware, is it proper to use "qcom/x1e80100/ACER/SFA14-11/*.mbn" as the firmware path?

Yes, it's still useful if you e.g. keep a local firmware package, since
it allows for the same image to be reused across machines (you don't have
to overwrite the existing files)

Konrad
