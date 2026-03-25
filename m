Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551C3A4509
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441369; cv=none; b=TKKJzNzKLaztKwihgDdgOuqDDYnL0DRLpNuutVfwxFSVwkUbT87VUOqe2qd/oMkSfgVHXMFLne9bhWpC5P2trqC/IZ4t/FbqMEBcboB0O4nfpFLgIQNjqCcyCDhBOZnjV3K2Q5eoBnrDCLoswi5ULYTQmOMRgQembyFb/h3sgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441369; c=relaxed/simple;
	bh=TMCmlT4lKjvdK6c8V7F2YZZugxH46iQSzcyJH6JlULo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsKW7CyjiOTudJEExe8oSJQ8hLZtMX5xoLEa0owPKFmobC2YtURoEv5psXlArMHMhTSxFGWDiaU9xsQF4KoGkm9ceQrX/WNYOnKspSolFNy8sT8ZTunFeNMTRIOCpYkdOGi/5EooRQtMyYQbXdQsWLqXG9YNKTAp0cwUPJvbkQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnEekR8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AotpVWps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnEekR8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AotpVWps"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGVtj1895857
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NiH8h9FCcRDmHsbMCo6PaEBlTF7I4rvPIJvh7gacFE=; b=FnEekR8YsCA18qut
	VRAlxXzs/fDwu3HCeG6YQrfeofTBVu66zROcFaT1ZDpKBdB3hpUU5n6VUBMopYEl
	wxcrXWw713X/575rL/bR9+fO4mF85iJFO8B4jII9DNvoOVwGrtWJnj+1S479fbAb
	ZZYhNctx3+rbEvjZLeTPdVqmlLzqQAH1TkEDfe67+FA6yzA1OWMxPxzUXcfZNfT/
	0ubNWF53KgDd65TVk2YiHN42PgLEFyikj3mNXyaedzJKm9ch+DxmWBjtpkICYjjV
	HUHbH872Y1K5pl4ULB1U1hzQSjiWNK3KQu6yW0pLil7IvvHA4i+/8dI7OvHuqvyh
	xtaoPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mhr6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:22:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b32feb719so38277671cf.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441367; x=1775046167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/NiH8h9FCcRDmHsbMCo6PaEBlTF7I4rvPIJvh7gacFE=;
        b=AotpVWpsf7/ICSO28BoW8zs2Mkg25Wlwl1hnQx7yPV9MnFuIuFRCEtNILoNSWUStvU
         7Z2jj2+lWKLCJAm7BZvwa6SPOkZ/G/e+guS7CNWIrM6Qp16A75GvK45bRUlqQYxeBI9R
         t+gSQPE6aT/fya52HFIu50XPIvzMQqVy0wEWBtDo16C5Tp5bEAlJtHAVMK+DyxekIaSs
         J2pY8DiIID7J5jhBGF8pojktUx1uKDhXnp60sT1K1d/eOhtcCfZ8ag7gku7XWnHMdSQI
         rRSo0pn8UNi0dPSuZxf5jmAc2r2pkcedf9+MpNe6I98MVNjKYAqp6lKPHR01p2g0z0LO
         AzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441367; x=1775046167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NiH8h9FCcRDmHsbMCo6PaEBlTF7I4rvPIJvh7gacFE=;
        b=JKSUZnDGwqiFqf8eFYZYnQlWtiRCCSx79JX9j6sBIcdiANPO33UBSZ9mJvNj9DvHfA
         SEOeia5xHxI11fcOw4v+6zxzMSxyxlAeldh8mKaBa51On5a8hU8qTP4ArzZjeBNt9n4f
         0yNNgVs3o/Ve2PMIhaT8e2Qs+kmW36iASztmlIXmWMLXF7QmcOkkemJKXhhEH4N4EW2t
         5ahbAZWkEkZr3cKAcAnUXI+axlxven4h8htpAIk614GqJVIfTf3dZpwIEV7VvMHLXell
         D/9qST6YcxFu6ec8wqpEmUd+5JR0vg9tyOkRHX2fZeIO/XH4XLakyEkc9kClVAGCHq8f
         uqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Z+hz+dOR1Js15lGyypUyWY3jQrvmzliOvIgoVfWfw4Psip4TMynn3Y7tdhgusPzWnoI8f/Y0A7x/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdg45dNq+FLq77duXQ5kcSAXFwJ1X72DHy+TGJwjFUU3cCeQfj
	LCJbTLPG4CsS/d9dngISMKdHLYkOdqih3IyFHSUjGR0OUczYowGa/gIWjCI/qqLn2UukSe6tuBM
	8u0BZMyEReud4oeukJzvTLKyruMISxNmMcMNMYtAZsTqkqFWgBR5TatqyU8IbyY9D
X-Gm-Gg: ATEYQzw1XYWD3XSSIsLkSCu4WGlEVVSZ+WzGSq/5LALHNV5NJDd7MYApYc50QBzxEhE
	UWDKWNNkxvx8y8V/PZOTXjazHVdfQfaHbVhquDvBXBp+tzhy2Ywy1P2pZ4uEmt/5xnVaWvCfyzH
	EgngK9hjINBr39Dw+dcAdXEvIismmDX4+b8M7W6yB9XFNxRygDSFssYE8hK/B0u6/o8fOxOo4Jo
	JSapWuRfmRU5rv6ZcXp4b+Rb1TAoYPUSpZB/COQNR9H1uRepHtvWxAWDuRLLaprREdfkgJO7C7R
	Ja062DBzXP925PivsyMi89GbIjJqaN31fzigvol0OFrUNoV1gc4B3N8nQU/WHAFA1vEDU8Ixl8Z
	dTRQuNwvTAWyx4G4dpddKMO4+KCqRUjb6IhnV2Bbh8j/zxpHwAQ+/L/M/AApSPmWM509kcv6LRU
	FMXOE=
X-Received: by 2002:a05:622a:6a08:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b80f115acmr22935751cf.9.1774441367224;
        Wed, 25 Mar 2026 05:22:47 -0700 (PDT)
X-Received: by 2002:a05:622a:6a08:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b80f115acmr22935561cf.9.1774441366798;
        Wed, 25 Mar 2026 05:22:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66aa65a2be0sm204618a12.29.2026.03.25.05.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:22:45 -0700 (PDT)
Message-ID: <e2060a91-e4e4-4aa3-9c72-330880c3acba@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:22:43 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Enable USB OTG on functional
 Type-C ports
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260313-topic-x13s_otg-v1-1-cb2e4a08e25d@oss.qualcomm.com>
 <y7sxgdmxdn6fthnxkmhs2ja5hfw2mtbdl2zfqkfocn6pwnwxq2@cuoldngtvuht>
 <0dfed5a0-1c07-4e7d-bca4-8183e44c3ada@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0dfed5a0-1c07-4e7d-bca4-8183e44c3ada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4OCBTYWx0ZWRfXzBoD/57HRbUn
 xEYtY7zPG8XvpIkvZf2kKZQsZVGsnp13nOE+wBYJvVFDdGxKVCKsaGklk7aA0R6DGYF6CFxBmEi
 l8HSGhxUz+suK3BBXG3KU/Xel1t7/dlrp9D2x8si9SQHB5OxiNtf08fm7U420Jn3mWOllD7f9uN
 aRvsAu3k9WNWL+QqiEHrl88HgWQ52sGnX7oBnrzxIWCvtYpyZcRWo/kv7wR0VPKd2ztwls9l0Ll
 2A1jlffSCmnsfO19bAQ+0wXtkKnH9shJ7sjTXgZTRmYxpawXZJddtepavKyzEvhipEhh+1XaQgq
 0a5DqLjK4poQAzFjhNH2id5/JOJ4/7ip0Jmwf3jFxV70Tv6P9PTe8aSY4E64u0j4IUa1Q1z0cPT
 jYdgZjEBtgL2VxhsjpNAe6r/XzNshFDYLeuEYNQBmY5hCtdv8qvidqb7KDw7/8MqigNJXEWrwdn
 qlPKJM4nRsjUDaa0vkw==
X-Proofpoint-GUID: -_SaS8sJj4j3QlY7FGZvTKHjkmG_oFHw
X-Proofpoint-ORIG-GUID: -_SaS8sJj4j3QlY7FGZvTKHjkmG_oFHw
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3d398 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3FMUunFS8DJlY5xvwZQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250088

On 3/19/26 3:45 PM, Konrad Dybcio wrote:
> On 3/13/26 3:37 PM, Dmitry Baryshkov wrote:
>> On Fri, Mar 13, 2026 at 03:08:03PM +0100, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> The two non-multiport USB controllers present on the platform are
>>> role-switch capable, so mark them as such. They need no additional
>>> plumbing, as tested on the X13s.
>>>
>>> Enable OTG for all devices featuring a data-role provider in one fell
>>> swoop to prevent hitting the edge case where UCSI code would time out
>>> trying to get a reference to a struct usb_role_switch, which wouldn't
>>> be registered if dr_mode was set to anything other than (the default)
>>> OTG.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 4 ++++
>>>  6 files changed, 4 insertions(+), 40 deletions(-)
>>>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Unfortunately it seems like that while it works, it makes the x13s crash
> upon resume
> 
> It also crashes there if we flatten the DT node and I'm hoping the solution
> to that will fix both, but we have to hold it for now

More details: it's (again) USB_0 causing the issue, and only changing USB_1
to dual-role makes the QMPPHY phy_init time out upon resume, without a system
crash

Konrad
