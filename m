Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EDE39D6EC
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489743; cv=none; b=pA708iyxjn4PQYydPgtovuiqfEmSDoQp4pQuVS+LtpjaaIpq+/sYrMbQhV5u0syHnnr4v/Ei5mSDg0XarYT1rYkzL6yFWAu6KtKo/rYYF7sa4r2/09DL8Uk5DkCZrsiC5LgEryCKq5O2HVKa5Z2W47KZmka/QiHRej2hMVoV9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489743; c=relaxed/simple;
	bh=2BHq0ZpZPgr/aASBBER4Fs0G/mk5+MJZRV/nm6HNQ4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6CcklJl9gStPEV/ZBwiH9oj0aUBrCo8Ti8DvMislxYtCoDADfuF3CMYGsA8paQ3Eds60z8fznacVVeeIve8f1eCSCSfuI3lajDI1/GcllCkmlmJfZ8mtU8FO9O5pfz3VdcPgUXSqhU31uV7wC+q2nbd4ra1zz5UHvwe1N0YeDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKEuMsf9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEjEAQW0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKEuMsf9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEjEAQW0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFigLS1725996
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CmxH5NbLE/rXyQzlMnYcKPc9Kofnqwuz4x4CSgwry48=; b=KKEuMsf9mVgDGShF
	LUVu8O/VGaujnOGc32HcH9nnIs61S53Z7PnOToPKk8X30DPSphuYHRf9PaSjSau8
	E2B91rapHMtAXsvIKbNseK4SJov3VMPe10BecmHEIFcFsifIEszqPBFVjJAex1sa
	vtwS9G3Uf+fQ59slpixRcWrdlSKMJZcNnHosn5edgMgvdUYtdgNmdNchu9FtQEpE
	gDbrUh/IA2tLgGhky4mQjI7WbXTpRb/ICPLPxGKc187V6C+xksgU5g2cQgjPk4YM
	NGJ1K6gfmDTmoENQg8AURtu3jk+lCLn35b10B0xE1KDzExmXDMFS+2IUEEpZp8CX
	5FCQUA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ngghpj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:02:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73596f5a188so28714137.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782489738; x=1783094538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmxH5NbLE/rXyQzlMnYcKPc9Kofnqwuz4x4CSgwry48=;
        b=JEjEAQW0LfQGKq55qrjT+3ljXaC8MTnqCN39/QHimB6MOEBtga75ZFgZ5QbNiRh9mT
         rl/U4zKFC9O3MuRgEadNLSRsNEJUGWl2t/oDVnQwq/AwGMUBwCWJkv8Tm/7fpsIYUrfb
         62bVJsYOtNs0ncj/j/VkBCkXDf8v5sXKfBqLnJTM13PA1dlGtmNUI0adX3MpRIpJyHlN
         RoKMSb0KE2KPGW0OfjdBQlFwzbLDHS+0QHFSOreEDtQFXEgpgyZdZvqJmW/JYIob8TA6
         HlaO0eU+6KojURk7FIdnFltqfwkxjnRjEhV/oDZYu9RlvEIneH7ocE6+1b21HfT4G9lo
         YaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782489738; x=1783094538;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmxH5NbLE/rXyQzlMnYcKPc9Kofnqwuz4x4CSgwry48=;
        b=hqgqsAf9CHYTyby5WCetQ0mDiLU9xsLsDb66uF+U66CWq2EGEL570QNjUFf9PFQFN3
         wk/2XB1mD6TxgmbE9lL8zUBa+ebgdHrxBcX8pkfsbisIMoTjwiweRtNQYHKTuybT2cbp
         T75fQjyq/4Vlz7kXUbjN0gBMpuRL0BxgBwvutobPnmYNr0GYGOQjnfMoyMIZ677q1UXg
         lAQ18Cu7owFMlWXLFJ9H7gKRSlBLVglhFH+BaOYQS1bhiC/oyA3b2Ie07dEuxlY02WR3
         qzJ8LLKbe+W+vcvIpdyKVXUwUwMg5kKfsS987G2t7JC7ZbsOdrehCuZcMTF4BL3+aSUp
         sLPA==
X-Forwarded-Encrypted: i=1; AHgh+RpTojeOB2mBEQ4mDuY4eJvfcaKZ5Logu0qU2jDtY7TnxlfOYyXquoIt494zCOjT2IkpUrN/YlI9S1PJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzLexatcPvesbZ10g3mvxf4Y0FN4FoExGDIoARQed4xn7ZlWY0V
	xF9s2bXXo8SfUsibWGtkgwlwLbJe8fxmwmjNI/KzATFPYxR87P2C6G/Ebczo6Pcy1XKuCrlsFFT
	YVS6JxFjDFCcrCQgfX2ewBlQfiUWBiKF2u8PA1l5F58DDY/9AvOMi16JHPIXy6ZoG
X-Gm-Gg: AfdE7clzW158aFcr/Gpfjw+a68K2r9OoXt7LxiYStg+AuSLi7SstooQQ7ATHOxzF0X3
	/nbywI+vgZ7cKkOABGKf2GSvDH847vQWuApEL2ew0aiCfqWZoEPkgiuht9yw4JtqR3X+LWYa8tB
	jzX3B5QziC2bTu3VIcmQHoa1wKg/4mwDBIxUTD2NxlAubcKWFbvFgJlgg6MBY5a9F8SDuRbE9Iu
	8+HhA/kxRgJ+R1MDzWVuMVg7+11moe6PuGwW6nNgq4yw3nO4zscXMtn/tb+prgC4SQF+AAVByXw
	xc21PMl89m+WuxPYoVvVgkI5veaNdNYood8+S0bltCqS01AwwuJAIPZyOMBoIo6ngFp9rzGSUSG
	Wqjvc7SYiIZA26uUmdsCxm2tIBASJqLMugPU=
X-Received: by 2002:a05:6102:cc9:b0:71e:1551:183a with SMTP id ada2fe7eead31-7343761785amr1584168137.8.1782489738186;
        Fri, 26 Jun 2026 09:02:18 -0700 (PDT)
X-Received: by 2002:a05:6102:cc9:b0:71e:1551:183a with SMTP id ada2fe7eead31-7343761785amr1584063137.8.1782489737454;
        Fri, 26 Jun 2026 09:02:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e15besm3077659a12.15.2026.06.26.09.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 09:02:15 -0700 (PDT)
Message-ID: <d4641613-dcf0-4437-9aaf-dede83afe04b@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 18:02:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via QMP
 Combo PHY
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <ag_QL5DIo7MxsdYU@baldur>
 <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
 <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzMiBTYWx0ZWRfX3dlXKd8NLyY3
 Cety3WjT7bsxtD0gnpxpdJO0zq/3b0OUSJeKyCerLYubOKzb5FPsBDelzrvsGrKKf5Y8UwR9QOo
 F/wGCQNU8OKV/QAIjJn2/ITz2asQfuVN9mVNM5eLWZlha4DQUKbQr/zSlG1z34vxCqJBo5p+IHi
 tPwMXrOsehbO0dBQfaxLcGj8XEZBX0emmTUB/BF/hRLEI/GUqYBcvS8QOSmNmVlcm6afDpOzzMa
 wkE9yww6ZjI/Wfdl8ynzvq1s7OP+01rQtZOtwN+FFs3OkDwP5oCKKQphVvibyot71fazC+Uisem
 Lmka7KGGNYxwNoKBcLRtJexx2ndzoXRaZkJ39cFWTDmWO6dhSNu6CVKDuUQf4SJAUujrHDSYthG
 2kTFnElsZVXX7o+5jLSIi6c64RUDSjXpJmiHPY98zcr9Ej2HQ2FhzJbVGZgYYrxj2SrL3M13qYF
 G2IEQga+WBv8fSn6bEA==
X-Authority-Analysis: v=2.4 cv=KNlqylFo c=1 sm=1 tr=0 ts=6a3ea28b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WhMr71GatuKG99ydhcMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzMiBTYWx0ZWRfX8uoX14f50u1c
 Zzo6ff9JoiXFtXs5y2AE+YXURQPUrA/by0jfiMUAYqsYEJzwe6xxKi9y1IIFtMeFd2qNkNTb0Gk
 NH0PwyaD2KTayMjNYMt6BjuuyFwj5tE=
X-Proofpoint-ORIG-GUID: vP9raDRFFM7fPCT7GiPoWL8zzYWOYMtk
X-Proofpoint-GUID: vP9raDRFFM7fPCT7GiPoWL8zzYWOYMtk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260132

On 6/22/26 12:11 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jun 19, 2026 at 8:34 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:

[...]


>>>
>>> Are you sure that herobrine has 4 lanes routed on the PCB?
>>
>> +Doug any chance you still have schematics for that old boy?
>>
>> Bjorn, perhaps we could switch to a model where we define the max
>> capabilities (i.e. 4-lane 8.1 GHz link) in the SoC DTs and only limit
>> them as necessary? Not meeting these is borderline a board defect anyway
> 
> Bleh, I'd forgotten what a pain it was to look at herobrine schematics
> with the whole qcard "abstraction".
> 
> My memory and a quick glance at schematics makes me say that herobrine
> only has 2 lanes of DP. The problem is that this SoC really wasn't
> designed with a laptop in mind. I seem to remember there only being
> one USB 3 port and it is muxed with two of the DP lanes (since the SoC
> is designed to drive a single Type-C port). In order to support all of
> the ports that a laptop should have, you pretty much need to feed that
> one USB 3 port into a USB hub and hardcode the DP to always use two
> lanes.
> 
> The two DP lanes then go to a mux where they can be routed either
> towards the left Type C port or the right Type C port.
> 
> In terms of whether we can support the 8.1 GHz link speed, I remember
> much debate during the project, but I don't recall all the details. I
> think the discussion was that we were supposed to support the higher
> speeds, but we had to disable them because they weren't working. From
> my fuzzy memory, it was unclear whether the problem was known to be
> hardware or software related. I can try to dig deeper if it's
> relevant.

If anyone still has herobrine easily accessible, I guess a smoke test
with a high res display and this:

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 5c5e4f1dd221..a39e418fdabb 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -464,7 +464,7 @@ &mdss_dp {
 
 &mdss_dp_out {
        data-lanes = <0 1>;
-       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 /* NVMe drive, enabled on a per-board basis */

would be the quickest way to confirm that. Although we can just leave
it as-is if it's problematic.. I think you said there's some folks that
still use it a couple years ago

Konrad
