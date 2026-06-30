Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628B367B60
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827423; cv=none; b=WvuP8FrBmWpfT3NYucQD9y17+J+Hs+t1laFBfUCIouvV1Xoq7nlCH3dmi5H0RbaOUuAbBSHroQ1jH9KFl8u/5p78ADkl9FIAc56QVJttnfmKBz5k6KKCpbJMYbZzCX3HLBjIeXx/vpRTRwuULPlyWRxqFddJrLGq1EDKVA4/HYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827423; c=relaxed/simple;
	bh=YdPI25Y0KafMkusWlR6kufqN3mfL+8si6vN4ZnzjUlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ek4bpyUhgUdMSd6Z29cRGbcJm1po1HiIPFNkRMUjit46iwnxPcIK9jMmoV3K63kOScALeX/fB4lvok8HmvYi+KYSNGTgn6d6fR/M474RwV6c19adeee0zqFKF2YzofYJ3+FL54m94Cyf4a/SN1telo2s2twJa2RqaVCH/u6iJg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHX4chGf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbQDts9O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHX4chGf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbQDts9O"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mpeC1611511
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOKJcgnb5KIG7WRtPDHZ60NI1QVvp1pmwCPdue2Coi8=; b=RHX4chGf53jjPNcK
	Rmv1cA3XaQr0OVrY6o0EJMrzp/scNiYbjLRkLX4YTTNeZwPaUvA/VoewQbrctRus
	POVx1dYClq8+V9qoW/+lqsR+xVUa1/RDR4e/v4P3S9djwD759UOrukFBiyQtF8gT
	gOZuHoO/LVDp986HLsW92RCm8avyo55U/Z3m6NehuAsUowfBaOhPwmtSzKUf7bJP
	ut3rkl/HWqsW7S99s8wtYuUUxaiU74jDhaPct7bIVsekGBFE0g32a6rQ1IoGf0ug
	pKOkq/qRxG0ODSSP+Om7R9G3fmtqCDMTutihvtlDTgaO/zmkR+mLu7n0+yyoEzx4
	KWVtwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gtwv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:50:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso36314585a.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827420; x=1783432220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOKJcgnb5KIG7WRtPDHZ60NI1QVvp1pmwCPdue2Coi8=;
        b=gbQDts9OZH97dctNmkIdV2wFPhaDC4YK+mTM6NQ/cRvtQcAuiThxuka7eh1zkItS71
         V2hXyEgHNWb7DY0LrPO//CevBVIRzDQD2jNNL04HMWjEItQ7evAVaCqJF71PCJXl00Sc
         YbYWczLnLHcSN+4G6lRj9HfZyYOfhRAVkxRBadJ9TQEVNDzOqMAvL/A36DSpznTTno9K
         BziMEe8RynBsQpM1zVqB4dsqRRaIvReYxJ5XPGPC1nVu9YjpDpciA8DklNaNUr5N6tQi
         PNOEL3eObnLTS0mdbioanjeHJX/yOzC190VZCFJJ0ollcouNiZUP0csaaDxHTpLyurrc
         R61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827420; x=1783432220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOKJcgnb5KIG7WRtPDHZ60NI1QVvp1pmwCPdue2Coi8=;
        b=E9tAzUkSf+oX1JdeAw99YB0sOMV6SMR9a7eTbZJ5opjrry55hnKXvFh7kyB8KYcwEo
         9YnTkKXRkTP9FV3g/P8V4bVylhLqkjdy2whqKV/OdKW5wqU+U1YDrXkK1cLAdFDrWA5I
         Xy7SpDLCqjQkejiIkEfzvhs+6+4ljyZeUKmg6ewKrkBduH5E1hFSxkecyixBqQrMhep8
         vYSAhrGlb7qsxsYPtR9QkMO5dLaCbe7z7JBWEl0tVfcKK7TbI4UQkwrkBAIDEDE7C6R9
         sfN+QxTEEquQbNtK1jiqwbwEvkYAJ8Qcx5Q+GEAObAQcmNkHjbDKjl9zwgTMI1gryCV/
         0pcg==
X-Forwarded-Encrypted: i=1; AFNElJ8jZp4p7J2KHpe2QTpY3gsmO8apQ5eYDuFRSFAP6uihYUT72CbYcxF5jNSsV1Zbm+kz6MQC8ViOVpUY@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFO9qtuPNFpT5B3wdMgVrzW0dMj72vQlVyRe78X9WvdCsufyx
	XAWHfPKUtRLHypamR/Hsc831XNL2k2eg/AGJf1N2dLoP6P06Z+67Z0oGp581aBV6wI/LfLmX5dg
	Y9to56unw6d0MB+z/2T/LYwDdpFN8Xi2GBx1nJ7wcPG3QHl0F19p8GYu5m6mSpyxQ5Kk5vv47
X-Gm-Gg: AfdE7cl01irj1g/+uEgnZmzF9IeGJ8d0mWT/jpGAicDra39PyyLnRVvyp3pr9ppPv7X
	ogiNV4Py+f7PeJojMZlr26mCU0HqIXqpY6xsCMGS8S7Lel9OXKIEzEkjCvTuYoEcTFxsQBnkGQT
	4n1MQUSP8U+zIEZEmG0eihnG4fY4FSFFCWzwQ8r5JRVLMYiCZqncQUSLqIaQi9UU1Q8x3x3vM++
	L5Bqht8nV/ULTSvn8fD2dx5ejJBBJTJ2XNHLvV+EWCGJ/XMVQjrvxtkqnIe24vIiZeCcHvc4bXO
	mDc3pXS7bxQS3sICGmpQlRyfjTH5UxEMfaQcF8jkWBZ9XiwZ1ZfTK8uM+UZQDlK04cj0qdMJSix
	xaZ1BYXs41Q+1cKY702pAs8s5pxiad8TXtnU=
X-Received: by 2002:a05:620a:318f:b0:92a:228:1bfc with SMTP id af79cd13be357-92e6261ff87mr418511885a.2.1782827420533;
        Tue, 30 Jun 2026 06:50:20 -0700 (PDT)
X-Received: by 2002:a05:620a:318f:b0:92a:228:1bfc with SMTP id af79cd13be357-92e6261ff87mr418504685a.2.1782827419677;
        Tue, 30 Jun 2026 06:50:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0d68asm131816766b.31.2026.06.30.06.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:50:18 -0700 (PDT)
Message-ID: <33c74e59-076a-4877-9e62-83a8ebbf2d54@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:50:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
 <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
 <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyOSBTYWx0ZWRfXwCSk65O9nySs
 4rGUS/G8YHHnBtq1id8RHeOQN+b0M71wfFQkPZTK8fln6auwEtBjIQNyKcPmMc0OtBR34yoaq8q
 /nRGD6zQXGi7uicLttCtu2ZyVKU8wqc=
X-Proofpoint-ORIG-GUID: mwDw5FFcoJKewoA2Wk0sMvKRVG6wmYEQ
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43c99d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rAtRr1t42OMwFRgtCCUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyOSBTYWx0ZWRfX346vsrz9CBAr
 Wv1S1cx1BnMWxMnj9o6hk6SrrQB+iAjZ8J+XAkJH2Uv/g3PTrCoCgGq9XJo03wAnqpbIHQDqbtS
 QFj05eRjJTgZOkjW81Voh6dbnt0UfJ5oFIdbGSkkeWKtr5MYQIpTnzdVpvGYAkb1L5B4bQKUBnM
 CKruFnL1R4d7a3Rzk4u/pPEQFwb18+G1syTP/IcZ1nD+1wBBspUex+TFzUHl7V9jYkqL35Ouc2H
 RmGYxf1sfosCjTSdDfzZo/AVdXiptWdwJiif4hlRpH+uGIVNVvabbGNxjwOJGpJHS/omuNfkKje
 ycLU5j39HbKAQKvYJZN9tU/C/ggEuRkRwMQutSBILecrZVUC+NICRblGGrqrtftD+xkLEPBsIIe
 KV5G3Qb8qWqRsSBcbl+FCULr+yP0zyYZt6neKc4CwM7/Wt1CcXlOvNcSNfKtzSJyuQijmABpmcD
 27wBeYavtSzCP/J94FQ==
X-Proofpoint-GUID: mwDw5FFcoJKewoA2Wk0sMvKRVG6wmYEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300129

On 6/30/26 2:42 PM, Rakesh Kota wrote:
> On Sun, Jun 28, 2026 at 03:33:23PM +0300, Dmitry Baryshkov wrote:
>> On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
>>> On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
>>>> On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
>>>> <kamal.wadhwa@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
>>>>>>> On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
>>>>>>>> On 13/05/2026 17:29, Rakesh Kota wrote:
>>>>>>>>> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
>>>>>>>>>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
>>>>>>>>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>>>>>>>>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
>>>>>>>>>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
>>>>>>>>>>> --
>>>>>>>>>>>> +
>>>>>>>>>>>> +         pm4125_s2: s2 {
>>>>>>>>>>>> +                 regulator-min-microvolt = <1000000>;
>>>>>>>>>>>> +                 regulator-max-microvolt = <1200000>;
>>>>>>>>>>>> +         };
>>>>>>>>>>>
>>>>>>>>>>> Do these regulators need to explicitly define their input supply dependencies
>>>>>>>>>>> such as vdd_s2-supply?
>>>>>>>>>>>
>>>>>>>>>>> Without these properties, the regulator framework might be unaware that the
>>>>>>>>>>> PMIC regulators draw power from upstream supplies.
>>>>>>>>>>>
>>>>>>>>>>> If the kernel dynamically manages the upstream supply and its reference count
>>>>>>>>>>> drops to zero, could it be disabled, causing an unexpected power loss for
>>>>>>>>>>> downstream components?
>>>>>>>>>>
>>>>>>>>>> And this is a correct comment. Please provide missing supplies.
>>>>>>>>>>
>>>>>>>>> As per the Qualcomm system design, the parent-child supply relationship
>>>>>>>>> is managed by the RPM firmware, not the Linux regulator framework. The
>>>>>>>>> RPM ensures the parent supply is never disabled until all subsystem
>>>>>>>>> votes are cleared.
>>>>>>>>
>>>>>>>> How is this different from other, previous platforms?
>>>>>>>
>>>>>>> This is not different. In the previous platforms too this is taken care from the
>>>>>>> RPM/RPMH firmware side, the only case where we may need explicit vote to parent
>>>>>>> is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
>>>>>>> may have a RPM/RPMH regulator as a parent.
>>>>>>>
>>>>>>> Even on those previous targets the parent rail of all RPM/RPMH regulators are
>>>>>>> internally voted by RPM/RPMH FW at proper voltage with required headroom
>>>>>>> calculated based on the active child rails. This was done for all the
>>>>>>> subsystems (including APPS) regulators.
>>>>>>>
>>>>>>> So no explicit handling from the APPS is required for parent supply.
>>>>>>
>>>>>> You are explaining the driver behaviour. But the question is about the
>>>>>> hardware description. If there is no difference, please add necessary
>>>>>> supplies back.
>>>>>
>>>>> I understand your concern about descibing the parent-child relation in the
>>>>> devicetree, and given that we have been almost always followed this for all
>>>>> the previous targets, it will expected of us to add them.
>>>>
>>>> Yes.
>>>>
>>>>>
>>>>> However, we want to avoid the unnecessary access to the parent from APPS.
>>>>
>>>> Why? What is the reason? Do we want to do the same for all the
>>>> platforms? Only for Shikra? Something else?
>>>>
>>>>> At the moment, I do not see a way to avoid that, if we add the parent
>>>>> regulators.
>>>>
>>>> That depend on the answer to the previous question. In the end, we can
>>>> make the driver ignore the parents by removing them from the regulator
>>>> desc.
>>>
>>> Ok, this seems like a good suggestion, so you mean its ok if we define the
>>> regulator desc's supply column with NULL? And only keep that in the DT?
>>>
>>> you mean like this?
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
>>>
>>> (please let me know if i got that right. thanks)
>>
>> Yes. Don't forget to explain in the commit message, why you are doing
>> so.
> 
> Currently, Agatti uses the same PMIC, so we cannot set the driver
> supply name reference to NULL. Since it's an older target,
> we'll need to run a regression before making any driver-level changes.
> 
> Additionally, the child-to-parent regulator ganging differs between
> Shikra and Agatti:
> 
>  - On Agatti, l3 regulator is ganged with vdd_l13_l14_l15_l16
>  - On Shikra, l3 is ganged with vdd_l2_l3

Is it configurable on the PMIC level? I was under the impression the
supply maps are fixed in hardware.  Is there a chance the agatti
description is just wrong?

Konrad
