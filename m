Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F61535675F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455299; cv=none; b=qvpiQKl4BB9N/x6C4tvbc8iWPN+QskkbFRSTTBezAo9YYrMu0bxZaWbAD/El39UGFl6GUmwWFeAGKRdBt8CQYRUF5biI5PrWdkaghgK/OeBTBYuMhivy2v41K4kUXsx+gCPpr7r7akLxHvQPP0PMMvuBw4G+C9SAzckL2T/0WSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455299; c=relaxed/simple;
	bh=OrukJg8m46sj1Pu8mW6Du4FkCv/lEs0V0+4sCQUjoAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8LOtHlPMn6U2WO72PGPtIbYf/wEmkFM7+hZ05h43p+FPp8Arpn7vu1VYwp1nqA3fcvQQ7GzjW+btyGPsBeBGaEOszcMyeWFyNBO5rucEv7nDkjZVFVI/NOyM0L5/tiaPTiSAavmlaQi8yV+6N4YnYhwEBUA7WwYWBA2N9J7ujI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHFmoVU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acLAmuad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHFmoVU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acLAmuad"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9015p3005132
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xi3o5QDtxodOA7hKGtfvSi8vreN8UVFATY7/epF/EI=; b=VHFmoVU/Ssi+h4ke
	2Yud1BoX2w7H1GNDk9jhpRH7icB1RLXDxZ45ptkgMl3+x3381MvAbws8CQhB2Cy+
	rC4yvNQt4W0VeHR4PM/39ljBmA+YRyDa/wTKqVR6mztau8lsgnZWDRXvMzz76Wiu
	usqycIYBcaWF8Y3QyCNgxZp6PTPh9+bGtKmt3BrcaixpyEFCLFj4hyFkm/R9FBnx
	Wwfr1HR6vLzAPOXxVThafyAbiXpO+2IeWhIcjg7qit1zmaohL36/Pp8TwJrIGheO
	1gS7Ng3aWrvqAztxdqhPR2mnZ+r/YNRtMsyZUYeq2aeApoaTP9F2QPlmRafabxVS
	LD5yaA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrta2h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:08:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-836d0184333so9032406b3a.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455297; x=1780060097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xi3o5QDtxodOA7hKGtfvSi8vreN8UVFATY7/epF/EI=;
        b=acLAmuad4y+EFIMBpH5+yXjEU0WObQAEtGya5A0XX0QHrDIxUlpB4ptkssC6juXcli
         +T0pvFiMRdTl9nSZSFjNv6pyP5irQo1cVU3JIIWEPZneTRsxFs92JRDoe7o/xt+Elhxa
         KLztubl0ALP6vqZXypCVWVbwDZTBADF23nnyyDN63gXSFQ725apgqy+66MhwNpzx1oKo
         SmdkckypxpKwf+oNe7/iqdQF9i6Wwu2qS3R0TfaKEW7a/0ekh7kJtaoMb4yN0zNn8Rad
         tYY1qFTc0XxtScx3iTdWWxH2Crl3vTNyYJMeB72eokYoEz00ATWTmHxzQm5UixDsKUmK
         LIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455297; x=1780060097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xi3o5QDtxodOA7hKGtfvSi8vreN8UVFATY7/epF/EI=;
        b=H6NeoFPdhwUnLqMffRCEXussmg6SS3kXMcWNh5B4c5GJ6Tgfp0LlWLKbsWzTmtM2J5
         ssNorpq0MxN/RT1BmqB2naTgSlPRHoryjfROnUWlhfONUKTSfTBkPxGDmmMuIHjAZwN3
         YmNsM+Tw4itiB8FLyf3oMRq6q43qAGHkXmYTTxjJavkl2IvJTS7o31Z3d9HpMAvrJT7V
         Yy1Xh+pZtA1GGIYiuTsNDCrWgLXJOh+fBJdsmxIoL8ZzHoFDjNFosUmP65sxrqqvDy2/
         14xiGkYp+08jY9ct+YS0vo8KIXFxQvgrojPGyQoeVUKCe8jSOgDhifGQLEb4NGX3qF8o
         bwNA==
X-Forwarded-Encrypted: i=1; AFNElJ8D957asuwKHht6Ey3Pxtd7WanNp8/logkn6RXDMhw/Dxoz7njPywodoMRjuzOyyj/oV/CrCOrLHn0O@vger.kernel.org
X-Gm-Message-State: AOJu0YzUBpkZ5dRs+32Tzt5gLotFiL1Bgj8K1Zh5wN9DOzMHe1q9w/Wl
	cUH8wtpCYvRwwx7cXIOKEl6fXaVBAHIBH+B8qjU2+2hGCXUK5D6koDysAVvDCKfw80BP3tLeNAr
	7iAk/+acsiMwLTEgdYOAnw1Mih7tNDHc6XP9tTlxjehqLDJtBClAhd1blZx8dosX6idnCpFAD
X-Gm-Gg: Acq92OHxDbOptuI99REQPXOehvC/TiyeS/aMDlPwpbOCAdKJ3jN4fCXJQfTuFUdw+Vj
	Ha1W6OuYD32Kti186bznQW9ENcOw7MMUvRBit907ynoqph6+06hsHNbdkAL0HWbRlJaLKtQnIxo
	dqI6z9RU8JneTvDx4aUfnjq4Q/sgQs4fjQN7SbWavWmBsmzCN4Hyt26RE7kZ9gG+xBfFEFkYBm4
	N/geHNwrdLmJhdmlv7frHgKykFccHIufShfWm0B6lhu+3jk5/b/ro0hkW7dPJuYRnWVrM1s17Tw
	AGBPQtA379OJDRC4NNNH8WPicuNCh09RdRe0C4ER6qdc6ikhbFapm2dSYpsKACc8NMk9x52wkEi
	X8GlGZf2yL49uSviXb+8TohbibIHltHLJJ+k9ZaKtpe6LcjzG
X-Received: by 2002:aa7:9a85:0:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-8415f3019a0mr3899230b3a.30.1779455296658;
        Fri, 22 May 2026 06:08:16 -0700 (PDT)
X-Received: by 2002:aa7:9a85:0:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-8415f3019a0mr3899184b3a.30.1779455296159;
        Fri, 22 May 2026 06:08:16 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1af1csm1902328b3a.27.2026.05.22.06.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:08:15 -0700 (PDT)
Message-ID: <ab679636-a15e-4876-b658-7534484e337e@oss.qualcomm.com>
Date: Fri, 22 May 2026 18:38:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260521-shikra-rproc-v3-2-2fca0bbe1ad7@oss.qualcomm.com>
 <20260521135659.A15C11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260521135659.A15C11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a105541 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j0AMz7HbSoZG04DGXxAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMSBTYWx0ZWRfX2TrG8n1wjfS3
 iqAWTQ1z+ZGJv8LHOc43xY1aBMKdBrbcsj86oJoQHDm+/ggBeTO86/EEDNobyHm+hw7aN63dnR4
 Dru7FbVo6N3rVsGBGjCH7Cktd+B3r+x8nAijthh0Nd0FZ68FY6ReijhZshDgw8c4dEsUcNQoiDZ
 tmCoDVXNrOtOilUgWxuNgcXDSt9t4UQRDkmR6FsvFisjV6828TW2U6Ud94As4md86G3gE2QByUB
 smK6Qy2SEh287Ul4Qu4aC/kZholMCuawzNjnWQU5sMPuShAHd6Ltx6F+u9BfkGCy1XEtK29dJ8e
 rS6fmmkSrYdkX1331tGb2q54yOY3zovLQy5mhiMAYTQuvJ2lfjFXtSr5iP7ncoCC5hzGJ6wGZms
 bC52ptzrswRQVGirMCX9YJclY1y6ypcOoGlD5yLQtWt66wcIsYGY4j+RSuwBwgcOl/eUb6AExr/
 rcV8HCFLHW+I3+2neKA==
X-Proofpoint-GUID: KoriuaRTM--TSwGx0TrDKAo_EijD7KbW
X-Proofpoint-ORIG-GUID: KoriuaRTM--TSwGx0TrDKAo_EijD7KbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220131

On 5/21/2026 7:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `ssctl_id` initialization for `shikra_lpaicp_resource` causing graceful shutdown failure.
> --
>
> commit de542ab4b48a2146f6973ba793bbbd6328de204c
> Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>
> remoteproc: qcom: pas: Add Shikra remoteproc support
>      
> This commit adds the CDSP, LPAICP and MPSS Peripheral Authentication Service
> support for the Qualcomm Shikra SoC.
>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da6..0101f1db6458e 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> [ ... ]
>> @@ -1457,6 +1457,51 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
> [ ... ]
>> +static const struct qcom_pas_data shikra_lpaicp_resource = {
>> +	.crash_reason_smem = 682,
>> +	.firmware_name = "lpaicp.mbn",
>> +	.dtb_firmware_name = "lpaicp_dtb.mbn",
>> +	.pas_id = 0x56,
>> +	.dtb_pas_id = 0x57,
>> +	.minidump_id = 0,
>> +	.auto_boot = true,
>> +	.ssr_name = "lpaicp",
>> +	.sysmon_name = "lpaicp",
>> +};
> [Severity: High]
> Does this resource definition need an ssctl_id initialized?
>
> The sysmon subdevice is enabled by setting .sysmon_name = "lpaicp", but it
> fails to define .ssctl_id. Because .ssctl_id is uninitialized, it defaults
> to 0, which means qcom_add_sysmon_subdev() will be passed 0 as the QMI
> SSCTL instance ID.
>
> Looking at ssctl_new_server() in drivers/remoteproc/qcom_sysmon.c, the
> version 2 QMI service binding requires svc->instance ==
> sysmon->ssctl_instance. Since modern Qualcomm PAS QMI SSCTL services
> advertise non-zero instance IDs, could this cause the binding to fail?
>
> If the remoteproc framework never establishes an SSCTL connection to the
> LPAICP DSP, sysmon_stop() will explicitly skip waiting for the SSCTL service
> connection since ssctl_instance == 0.
>
> When the DSP needs to be stopped, will sysmon_stop() bypass
> ssctl_request_shutdown() and forcefully power off the DSP instead of
> gracefully shutting down?
>
> Forceful shutdowns of active DSPs can lead to hardware state corruption
> or SMMU faults, which often cascade into kernel panics on these platforms.

On Shikra LPAICP, we are not hosting the QMI SSCTL service currently, so 
there is no SSCTL instance to bind to and .ssctl_id is intentionally 
left unset (defaults to 0). In this setup, the sysmon SSCTL 
connection/shutdown path is not used; shutdown relies on the normal PAS 
power-down sequence.

Thanks
Komal

>

