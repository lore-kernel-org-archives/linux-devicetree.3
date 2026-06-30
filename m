Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CC23EFD25
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814572; cv=none; b=oB5+J4OJ32D/NRQ9wj7CC3Lyo1RcCsrzWwkAqooCfkBH6m6pe3Lz5TidWzEpz4muNT3Fg3KekvmINsnEUeNxMSFb0BB8Q6yE0UK0uWJG4EHpr+ZWKbcGKudevfgIK/n+cLMTYSO9xfz4fAJAx3EtXyIq3VaAbVxWy8gqHNOd1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814572; c=relaxed/simple;
	bh=lRKXJKZrP495IiUZDHG4weeCWTHu4o8bUjJfmGNlq8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pE4TqAm+BehSoA7F/34stk6r2IX3BM6sO7EvYZo+aI0l8JRLBBX4RLlgJ5ZSQFfTzklVJ9Qxl53Ix3p56CDsJZXmDlUYEWm6i4chjxxKUQ7OYtUe8xUQh9VSz5JXF8t35Hf58eniPg/Ba4WARSuKTE9xx99rSWkLtwhRquGMJZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CImSIX+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rxegup9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CImSIX+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rxegup9T"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtXg1611941
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7blyNdpZKWQkeLr0/kR8NAwTa+IR77dLcCC5jAo5Pc=; b=CImSIX+lnYq6QRGC
	gfkBDthWL1CvqXsbiRVsRpxi3pFdzMuBGz85OsV++lx0BqyyGS9RQbt0WKHpB7MG
	vY2oWnceAoDcB6q7audWseEFs0NHaOpS4Qmk0q2mS5kGIIEKRc+PivXDv3HykPeR
	bjnH6Xl43aWpdZVOLUxueVOlQQFU5Ut7AcRZDwovSkzWpAEKsdKCjW6z/qmYSm0Z
	B0oLZMv5T1xjSHHaejA9tMj2wnWLomphV90mWkk6AzZaqVU86D/TgMU3ydl444xZ
	ICrq0AArOqkWtFn6ELk59EpGLc/89XpHh94Qw3kpEU6MVQ8aaazVCZ1Glli1DJ4Z
	wyI08g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gt1by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:16:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so3160641cf.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782814568; x=1783419368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7blyNdpZKWQkeLr0/kR8NAwTa+IR77dLcCC5jAo5Pc=;
        b=Rxegup9TuMBqrFwoI2Rubqz1X01lq7BdUGi0JcDKbywzUy1GWll1EThTy4E+nWzLmT
         jOZYZsZZ1/MbFDKOukp+lbbZHmJjKh5S1IJFjcxYX+JPTocShpDuG8ofCsdscP8tW4mD
         lOuEFgaRraR/isBgByXG+SZZRuEl36qyLPBbf7wqItBQYT7sgwYTdml7O2Ph0cax8KcW
         H5uZ39xtRuZtpPp75vi0zYlTkLhZCJL6tVL4VeDfG/bBH5rOQKAZZyaSvuORld2L7swv
         yCnHX07T5U4skvdRECC/eT0cM9YMYz3SPc+6PIxwADOa54IyTUUcIRkT3sALpnN84vCr
         GQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814568; x=1783419368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7blyNdpZKWQkeLr0/kR8NAwTa+IR77dLcCC5jAo5Pc=;
        b=aB79j3rjsfekmBVik0Hw8RaZHxIx8tAIAELiw/G0HCVrZPGeoFDCQicbTHUPmUUfh7
         Fy02Lneuyw4ew9if/AxxFN7RNh+Mm12sP9yi1OC0Ay+nAORd7n5TOZHmFlQDHjIoWx2Q
         MdeRYHc9XR3Fy+IY4ftx9qgdI0GUytYL5K8g+XACiHDcGCUO6sNw93hbt3OawvC04C7w
         9WECT6JvZFk8BrRSUhPuMQdFcrDCdoolldfpCa+jNkrxA0JII3ybqnZzOxnRdCYh3onH
         d8pUnTAX6P1/FnejDquB/tUuCL6ikkMfis9wURe8xmjc3ZNgEbzOI+alouplHcgXKWJa
         EQig==
X-Forwarded-Encrypted: i=1; AFNElJ9i6Wo2Yq2bZMUjJl8pEAmTlCELYL1OuYhWZcnznxEt4e9Ifs9L5loQEW3OSVbFF77g2fmns0lEBtPF@vger.kernel.org
X-Gm-Message-State: AOJu0YzPk7NsLDfLgOLxVF9QXf45CB6sVGjNYP6rnWk3kgfaQa+zyL/y
	WjgWYCgRylbtgypj9VPq5tpxCI7FI8zp9+oUSv/IRVRXAMYkqAvVIJmHkzEHwOmnYnN1wRs5U0y
	wYxF8+6Hfc7NIXomjqVDPjJS9Gr30ioDqtxNUPatxmU3DRg2liPqmLBlpGHTMCS4r
X-Gm-Gg: AfdE7cm5oT8Z64+rqbxZTnFE3HCfpo0NUGUSiZ/i0PaCxJaeEkxou0vv/tQ7OsAhk9E
	EnpRKvpZ3r9vOF1SOpaxu2XXDzjacTb4QDXr2DfEslJCXodom8be5Yg89SIuODrj8+9Y8gPSaVp
	4xtj7CwkK0bgrFqf8/1e7WuJIklBK9+dgaSZm10YuUqGagLA+SmNSHVW02OKf3RGlc1uS0VhI45
	E0nUlL5DtXJiNO1aiv0mQy7qIjYJNtsK0eihmcpm2vniAnTWIOmyVgX9VEFLlfnpQoTD1+otFtB
	ZZSpmIm9880D+a6PR/YdbddA36f96y+567uQhjr+j0eHhqvvdMjmtn0IeeZNk9h3kjy6qAGYfte
	PAw5epWu2qT3QVQAIA971cIWvXrkJNgV8N2k=
X-Received: by 2002:a05:622a:1ba3:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c10731d27mr24969671cf.1.1782814568011;
        Tue, 30 Jun 2026 03:16:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c10731d27mr24969481cf.1.1782814567520;
        Tue, 30 Jun 2026 03:16:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb41sm98630466b.38.2026.06.30.03.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:16:06 -0700 (PDT)
Message-ID: <4fe8d4d7-1aa7-4c18-95a5-f0a9d91e820a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:16:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
 <aimlsgJssczxBGhQ@linaro.org>
 <1b30fd97-b298-435d-83a4-944e536bc8d4@oss.qualcomm.com>
 <akKUIsKtWXNYSaxA@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akKUIsKtWXNYSaxA@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5MiBTYWx0ZWRfX7OsGe4VKkGsG
 6yShGACJc34SjMJ9Zw7pC6EW0usNtOwQfX85FPiVfoB6vWjJqzX4JbvYbzn100U9ucZKG8IT+7A
 +JD1nd0TWBQriYiqRxbwpNZm8t42PPs=
X-Proofpoint-ORIG-GUID: 2VXhrVOIFNN8qAz0t0wac1t9ay39A-9K
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a439769 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=n_5_cvKnsOMzfkmOiNQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5MiBTYWx0ZWRfX95X1W/DGd5SJ
 0UfGPPLNKvAmN3vvuG4Uw7FHH2koiR45XcjaV/e8Ta70xcqLYgeGu4B0iqESv1/O1x8uUqYfLHB
 aVRY1CHZtZOvq7RTlS7tyXh4WuFJWMldsqCGyK1OsYDN6Vg+cRjdeZIjCsWBbUR+WWsssIYq+M8
 ROXFCrC5NljI6OA0hJlKdDK+uhBGsiljQ9tUt0mPsuFC7jI5KRpXWcp97/KAqRTX25ZSt33b2lt
 PrQCPzi0tE+/H4JTwF0I0E4FR5etJrenFaSln3ZjNemKI7pxT0uq2wARQNO9bzrIL4r1B2qacls
 yq3OxR/WLhbs5HJTCkrS9AWEIFwqQGVQu1EvwEoA6k61na0408LdTfs6F+FjguqrNowh+VL+AU5
 KqcJtfc4VB2uiVxsEH9o25qRv+e+6VpkYTOVlQFKYLqjllyMp3rx2KFjwnsm4AwMBIafBkw0VW+
 /vidAraH5gljKObkRIg==
X-Proofpoint-GUID: 2VXhrVOIFNN8qAz0t0wac1t9ay39A-9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300092

On 6/29/26 5:49 PM, Stephan Gerhold wrote:
> On Tue, Jun 16, 2026 at 12:52:48PM +0200, Konrad Dybcio wrote:
>> On 6/10/26 7:58 PM, Stephan Gerhold wrote:
>>> On Wed, Jun 10, 2026 at 10:43:12PM +0530, Taniya Das wrote:
>>>> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
>>>>> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
>>>>> match nowadays is gcc-msm8909. Looking at the differences between
>>>>> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
>>>>> definitions for the BIMC PLL.
>>>>>
>>>>> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
>>>>> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
>>>>> used for GPLL2.
>>>>
>>>> BIMC PLL is never controlled from High Level OS (APSS). These are
>>>> controlled by other subsystems and voting should be via the ICC for BW
>>>> requirements.
>>>>
>>>
>>> The driver doesn't really control the BIMC PLL here, the PLL is defined
>>> with fixed/shared/read-only ops so it mostly just exists to model the
>>> clock tree properly and have the clock rate readable for the PLL itself
>>> and any downstream consumers.
>>>
>>> There are multiple drivers that do it like this (e.g. gcc-msm8916,
>>> gcc-msm8939), is there a reason why we should drop this?
>>
>> My fear is that the kernel may have stale data at any point.. perhaps
>> unless we set CLK_GET_RATE_NOCACHE?
>>
> 
> Looking into it a bit more, it looks like this "read-only" feature with
> firmware managing the clocks is unfortunately a lost cause...
> 
> CLK_GET_RATE_NOCACHE does help for the clock *rate*, but the clock
> *parent* is still cached in the clock framework (and only read once when
> registering the clock). So if you have clocks switching e.g. between the
> BIMC PLL and XO or a GPLL you won't ever see this properly in debugfs.
> 
> In addition, when enabling a child clock branch we make a vote for the
> registration time parent (e.g. the BIMC PLL). But if the parent changes
> later our vote is never updated and will keep clocks alive even if the
> firmware already dropped its votes ... :/
> 
> I will drop the BIMC PLL and other firmware-managed clocks in v2 like
> you suggested. It doesn't seem worth the hassle, and that's what all
> newer SoCs do as well.

sgtm

Konrad
