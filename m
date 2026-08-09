Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DF336896D
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278445; cv=none; b=EkuXxzpd47CH7SiidTB8Cccj5Qk6YcOGnye3hxM3j4b14I5S5mTJc7rkT6j8MaTdlwaBs9FzVcg/1/JqSEa8GpLrNh8Q70NMI5IC0dB+TeydO8iEZUt1U5qLgcWPjYIs5uTAQywZcLxrFfF1ClskStk8nZM7kk9LNPAXidQuNA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278445; c=relaxed/simple;
	bh=Y7fgl7Rf8At7zMZoDfYsNFsxXJnIgKZYtPdNKvusOrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpM1NRtTscm3Imok1vnsPtZilNPrWRMiNo8zxSprnO+6EsNGI75xvJc1B2xHEhor0+efzrbls4qp6pyvV2p6T0E2KHD0UjkRfYforgcqkVT7v9VDzQFVZ85GPC/GNktplpGL4xAYAMIoT/PtyG+aeDPxBJh6zeE+g8bE1SjVlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jr3QDrwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5Qp9ayt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jr3QDrwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5Qp9ayt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C25nf3228916
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 12:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lr2wlWEu7ytvAfSPRDTq9nfH4lSgYTuGaNzTWqrbUQQ=; b=jr3QDrwFw8K+BBNI
	YMSmBfgh7ZiV6UnwESJ7sKgRyLCCnadqXaI/xvRUwqYCSZqu0vANzJaCzq2WeMWH
	FBygX94Zb6e1HderXEuOPljnp7nZN93V42f0NKXdpyU71fcxzvTFgVmt2vmwggM9
	ZXx3RCheR2N4WRF75ETFFtb3Z0AQUuM/daQZw5dNdOGNL0q34VkyA6Ow63n6e6tY
	+whnyaQ8ZhfOHuh9Cwp8cFDZ9d6GSUFbOhdng5DqSNS03VRH8TO7KFDYVbcvN3uv
	elkklqJjcPuDZmyNnYJ2BHYiOa4MuS35j8lyNMDkXjRDsb/qUgP96S50SNYTH6xN
	BNYe0g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqjx1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 12:27:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so15602325ad.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278443; x=1786883243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lr2wlWEu7ytvAfSPRDTq9nfH4lSgYTuGaNzTWqrbUQQ=;
        b=M5Qp9aytDZFLj4UZEEnQlGHRQGwEKP0BIXAzudFYFl1lVSmaFC3ygfFrvaTy5qAQTJ
         a5tjaSeSw2w8qPfF+9v1Sp+lnjNpMqXi590uaTStasH+crhJxtf8M5nGNsz8R1GBrmc9
         7YdslIrPBVHcr+lAUAGqtEtKv6O6DPf9DfvUBeGOaUFZw9gLO9NmXwjh66GqJ//ioAu6
         fnF4aF0W58Tjx+rSMWWRXGsfGMV1R9n52PU+BMMVx1vMyzqMZ/BAoInFe09egS1mnTtp
         U/1DEJYAq56Gq6w6D9V9rcJjrST+jodYKN8Q1sFUVVg/TqhimzqgFD96uhC3bu4gP0Mo
         Lnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278443; x=1786883243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lr2wlWEu7ytvAfSPRDTq9nfH4lSgYTuGaNzTWqrbUQQ=;
        b=Cg1CA2DeTK6Ktk6cSrCcSMCAhTVuevHah/pWUqdYUmX/rUTcCIgr1LFmi2tq0WJGf9
         571Vqfj3zRXb/uyDZ9U55LFf66XIt9yByUN/BA/rWP/WKs8m8DV7KPFYft6f1y5fCTeu
         4rCaPZ+RT/wFazCbWpP4XZyfQogzZ6KqqaGpfS9E6lQDRepmASbbJV0WGZgQhbJ9sxAF
         O5dTEZjYp5ZJRORtba2w1qdYSaNLI8/zxnBTczpk0foerN5gVdd+pBd0G9ZUWocwxGMb
         uMiHc/3ddaaixtpGsuw9MQZaJOSsN531GUFq1CGVpSVw13QQ3E0N1gDQW1auCYNB5z5m
         8qQg==
X-Forwarded-Encrypted: i=1; AHgh+RrHfzSOFAA1O8NOeuywPrBvrcJGu1ev2DcVGYRheQOj05YIXbE9r0t8EXoCbVU4k7xmttw1m5bZcyfb@vger.kernel.org
X-Gm-Message-State: AOJu0YzIX9oX7AHSwIYu7Gb/9F305gZ38HKf6FKJBWYvqBfHiUh3Jk+f
	2q4ZiPrbmABZ6gSaZBWMYF9miDSgk3YObkey3H0cNV6HDxRDByBtTFDBBMH608YYHE8bxgBHltV
	tPF1gZKLpo2ONXuHI8odFPYmodVr+/Fb+H8abEnBkOrFbFGDiaSnWEtFlN8xT+0tt
X-Gm-Gg: AR+sD13K3zECRhP3CBs7tktPpiJDL6g1TLNZashvP1Wd8mVy7iDHyQbad3cBPC/kBxQ
	tfy1e5CctNdeSkMxwjjHTxi52iPkQwNaALo5SPl9IFv+uvWREG65mDmxa1aCoCIFA5NyCQy5PM8
	8LqFR8G+5FM93r/ByKiJcsesSHWRUR7UeU9iHfLt/CjcbBQ29lbcAjV/YmvoAtILmiasasqK/Lc
	tPiSYidt4dfEzNYKnMjS2QDEkHlujHzfsBGj4wZdkIukhGJTN2TeGabvAmhCOaJX3qI47r8Pdi1
	+P2dy+p2/78AWb62DUqdKzUXEgXQS7MdE152JIsLEOUBOfnmj0/wW7ppdYTrnFDwGWiC5qIOsDu
	WriA7bwB+6tj0vhkOJOGNrQFHugdaPfQ3K/c=
X-Received: by 2002:a17:903:38cc:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d106a1a369mr289979445ad.1.1786278442887;
        Sun, 09 Aug 2026 05:27:22 -0700 (PDT)
X-Received: by 2002:a17:903:38cc:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d106a1a369mr289979025ad.1.1786278442406;
        Sun, 09 Aug 2026 05:27:22 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86f98esm30793197eec.6.2026.08.09.05.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 05:27:21 -0700 (PDT)
Message-ID: <e88326f0-e945-4d63-b257-308cb00df756@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 17:57:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] ASoC: qcom: q6prm: Fix QAIF clock ID typo
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-3-prasad.kumpatla@oss.qualcomm.com>
 <20260808184539.3C6601F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260808184539.3C6601F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX0BasKf/FCviZ
 sXwh46kSNVIZCiiMFoNJg/+8flrUX7bZZ7HVWLkmKTadcnf07mPXvkbSgFHQ8SJiB7Ljf2zO+YA
 zYJsVRYlCb7o+GWlx0RafXyrVIaeyIQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX7CQpSOUvt8VU
 PLgCH4x8kSkSS761bZJwItbyCRdu2tyTIJ1suFL9t3BfvBsj7wBUbEriOzfgl81tlrRLygNPFbJ
 yWH61Hm9wEM1uXyUKy8BhNQuK6rJkr+KCR1Mny4cYtPrhlaej1/NMaY95R0lyWVtjESVnkAJaVh
 lCc+zdf5bngKa6TZ+YruW6iZ8dsNTfUlu8K87aARrg12OyQmqAJrNSegmqYNZl+eeHwb+SCDezC
 dgnhXT0rR45nzi9CivQw15KG3iOwEejwWLgQWehQxesvQ5EIvh7wyHBG9xdiDwYDK5LfTg5zViD
 SgrycUCpy5G4FT/uEwIR1bBGRwx9liex0DmzY/nCQdEmfTCCTK9I+3uH1KNTFypP6DXJtGZqWy0
 +zPk3NVp25Ng2PG3pwKRsRp51mfmOnAS7VsDSLsL4QQ7qC+YlK9ui23mPLXiFfGYvNdYhR5s0Mp
 ARXB/0k6mm0HdUk6TxA==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a78722b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=c80W3Nm1xlcA-_PN7B4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: cptjIcynH5dS66Ee59F_aU86eUIp1cKY
X-Proofpoint-GUID: cptjIcynH5dS66Ee59F_aU86eUIp1cKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090110


On 8/9/2026 12:15 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch series breaks `git bisect` by splitting a macro rename across commits without retaining aliases, causing an intermediate build failure.
> --
>
> --- Patch [2]: [PATCH v1 2/5] ASoC: qcom: q6prm: Fix QAIF clock ID typo ---
> commit 2d0653a87462572279fa5b7912ec981aed567a40
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> ASoC: qcom: q6prm: Fix QAIF clock ID typo
>
> The Audio IF QAIF clock IDs were introduced with a "LAPSS" prefix instead
> of "LPASS". This commit renames the definitions and updates their users
> accordingly.
>
> Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
>
>> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> index f613e2aee75e6..b4f9abbe02cb0 100644
>> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> @@ -64,34 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>>   	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
>>   	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
>>   	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
>> -	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
> [Severity: Low]
> Does this patch series break git bisect by splitting a macro rename across
> commits?
>
> While this regression is fixed in this commit, it appears the preceding
> dt-bindings commit removes LAPSS_CLK_ID_QAIF_IF0_IBIT and related macros
> from include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h.
>
> Because q6prm_clks still references those removed macros at the preceding
> dt-bindings commit, it causes an intermediate build failure when compiling
> the kernel at that point.
>
> Should the dt-bindings commit temporarily retain the old misspelled macros as
> aliases until the driver is migrated, or should these changes be squashed?

Hi Sashiko,

Thanks for reviewing.

The series remains bisectable as the renamed clock IDs are not
referenced by any in-tree users before the corresponding Q6PRM updates.
Therefore, i think aliases or squashing the changes are not required.

Thanks,
Prasad

>
>> -	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
> [ ... ]
>
