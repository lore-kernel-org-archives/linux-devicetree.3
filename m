Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100846;
	b=qh8xl67slJDsUEFdKtFtkky2u9dDidrxnGoAk0NpuQCZMElFhwFWUURjNY/N0gvSgjwa
	 TtJcygE0PydajJ7vKdj06/YU+0ShTzPpdqqkQH0HV4zLDQzyoVk8QbfAOG2Lt1GA5vaUu
	 d11x6whrz01DHqrok0unDd1+fCWGI1Py9bovg3PQab6W8la+kR0SRp6r7fRS0qUlhpcVa
	 8+k9wrKfApWlolwaK2vruVu9TI+kg0qSWLbd/AVttCMAIsSjQupnGfjDzlhwEq1q4Kf8O
	 Bpk0UkWa4Uhc93Qi0xshvv1UZoyNpsPlOujTgujPCxGSJRfBRlBgkWgXzBpwHR1dHGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
	b=YXs7DhmjfJXltmqwZzwJEXMcEpifOse9CUQpwn2swM2QnBKZ/4F6Yywq7uSCbqj37SRd
	 z9gfcYRRUK0BY9s+X9R6fswjvjYSVGjE/TbUDFxTinLguVdweZgN8Tj6IGKaUhO+Mx5ro
	 crWhurB8dozewYVMGuy9g0bMuy+bINHBoRf/bc+ExDDbxc2nYsLQu6uve6TCetAC5H3P5
	 qOxAhZ6FZqoM/PqW6zOa6Z68+7r3BsUhmOYK2JwfUlyHEwQsKvzUUuJ7wBPtasIH5vnTe
	 aCY8VqWV+IpEHI+PiGH15L0O/c6XwbKLO6o1X/cNi++qmbYSgjnZQITvuLa8hmRGAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDKH5IxI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVRD6031;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F0A60A381E
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F0A60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDKH5IxI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVRD6031
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe5dQ1922139
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=; b=UDKH5IxIV0M1zIuK
	wfthDtrI33Q1APWL+XivnX0a4xs4ouEd0AFb5cAnlMA6Tl3Es/yAUKQX2EQ04j0h
	tl/9Xg5HqTRZDkT75hpX2dqoabff+OVq5TpTG4N1bzDuSdAdKBPd23y8oBsgsrM2
	tFBpiQIl94JxmVuII/2Iof+7fclT+/qrpM1sb0y4JGdIUJcliWuiEgYw5cuNjToD
	VJMQPQ77dk2Ozo/rNkCQ1u+R/jyGF5EFL/FmwZGEVRvE4Z7PW/uYb9qKAYoauQMO
	R/2Y6I+qJptUeWN1s1zvZMeNcVhnnn/gn1U39U54txoHHYV9qbRz2qgcJnB835kr
	VRsCTg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68n3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:34:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso7279635eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100844; x=1793705644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
        b=kVRD6031Gq6bxMtGSh9EcEKA4RPRMAAcIW2iG3v3BPV8QSB6rafpIlPgf0UMsVKtlz
         IlN3ub5rgqcI2JeqFULEIiVfk6sREveyqZwPdKIJqC5wsdRpZLBNKppLGPRuRFr9OX8I
         hNikVyQOl01+HlaNmRC65uhdClmSQxeKBIrBJosajNQL+I5FDwXDV5F2oDkJ55E/m6d9
         GRgrFQ9eLe6qC0DKzcsPzF9wuh45qKTptWejgXmbSRvbsFPqCoXVFbtYKRtgcOlhuddD
         f5WZw7dma5d+Oe0v8fR4285IPgqxRMd4FSFEXflidnyKzGKdfOY9l3JTR6KKpT3qlOqh
         Usxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100844; x=1793705644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
        b=kuGuNPwzONPiSQDZQCT5/xJ8RLS/hOjOhw6YXNmHpxMC41C5d/6THKk+GEr5z9/afV
         vb1AoRxiIFP6MsoQE1YQyGT47doGn/glsykNNS+VSUiF2d4TSGanFB7iJVWKFcAAbcDT
         2HUI8tCeEr7Nq+fAG9QCqun4fFSUSnkgtQ0BQ3dGD2hev0lIRQdaL8uYF1z8ITqvA+bL
         wb6sOlaUlL4aQCi+NXo5y70bpsS8Xyzrm+g17GUGksUPtbqa6bPcjaLnYO3myMGBauTc
         ImIMqnDvlQzCtbKp3ZE4eAo6DfV7K/xSB49xj+szFE3ZeBDt9doOpfi0HP2Ag9hDZkNp
         DjEA==
X-Forwarded-Encrypted: i=1; AKwUvBzvDBTerKi63B96HfQd7XFv+ZbItebLkXKTQNwwfi5zDSvR+miZr7u8E1SrvYW1fwYhJI3VzBbnhWCv@vger.kernel.org
X-Gm-Message-State: AFq9FYKdb/sKhV7qSBc8/Px5Utb2ky6HTWL9lyy1PU3wjWQ1l8lq0kTO
	QyK/pIErNJKHiTD34GNIMDEWHId0W8KdHQwOnIoxdpSgr6ZFG/MAg2N7lF4rrSd9NKKvLWt7iYQ
	hZqkwoZJ2CWv6bzUUfGPVWkGbLClrIFWy82alD+ykwQCWAouwDTYwYJUg7LzPqeFzG2VF1e+f
X-Gm-Gg: AYBFou0/pL1Kt1h9aKQcQyk+0Y4a+mw7s27zjF+6fneHrs4InnbURUcd+hvC8LV+vmt
	haDndv2aFAIIAa1Alq1LaMSvItGLJIBeNkHT2litVCHyYvFNeU0aGnPidLO8zrUqFdXqr1T0EtS
	E3DnR0LcL+5Q5i6NMsewXB0V36rVTsVg3SvnQTzSa0jML/RvIF+8rozjNn4nE9p/3dCE3IOd4bY
	yZe2OtftkTq/K0nD/s7h8RoVuFLK41Ezylcm2Ex4VRL71PHnlQjrXz+K/83uCPHDIaU1FN8+t9N
	RFhtWl5CrpZM5lc+sY6uzD2EdRFu0deEu+cbm+85Y3KKDuT4kl39OGB5dEuHQ+Qd2WBLTCNacTC
	MMTF7sSZCLgKdXL5OEs8tTYi4lQ==
X-Received: by 2002:a05:693c:2d86:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-369e847b24fmr20368357eec.8.1793100843612;
        Tue, 27 Oct 2026 04:34:03 -0700 (PDT)
X-Received: by 2002:a05:693c:2d86:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-369e847b24fmr20368294eec.8.1793100842969;
        Tue, 27 Oct 2026 04:34:02 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm17653416eec.2.2026.10.27.04.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:34:02 -0700 (PDT)
Message-ID: <3a1f6a65-4406-484b-a2cd-00019149d4a1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:03:55 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] irqchip/irq-qcom-mpm: Program wakeup timer when
 CPU cluster goes to LPM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
 <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae08c2c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vCH4AkwshzAlar4tAyUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: r61Q-HQJEoESftFaRLFqI-vc79A-dOUu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX32JChIYlPxpG
 /GWG1hODzbLoOK2uLP7RaCVwGpHikIlPHuYzDQa8/Jb/NfTgz+VPs5E9VHjlpP2ZvV1m6YI5XUk
 xa1a9MJOKrZeI2ICLudrSa15gZJl624=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXzZ8IuFGgOLpL
 v2PVNcDJLJAVvMjVIl+nlhJ0xnQSPG7rm/4KjuGF6utBjxEHIUeNXffhDPbGaSTbzkeInD2QXCv
 fDul9F2hQarDIPDF7gMbyz5XAKQ1UwwNqSCKYtoATAfXyWLi71uFTf6agdYGXvDZOQL6aIddTAH
 HWBod/EkT2xU12k9GZ39xYd7QH1w3AfvKF9N97c7qHIGMzSyDrOmOGhYxaANvwTh91cT8b//VDy
 9DXcBCiB4Yh38aix+1+XF9szmqogIyqFiUxSWLu8z5JKzv+PsNKCxFLbcH/jWUjg+TwjKUB0xzy
 LKJQ7WSSmPpzK2HivKzK7sUXhVdM75CuHpWpnxPas9KdUhNkF+LxswQlyOG7mycoVpB8p2gspuE
 pWhHemhXi0o7lqNW7HUPoFBv5DEnWz1VvZTNjvfL73u9mUOCgiTUQzGKawuUSPBwtnuQBfAScAh
 g3IwYGY8xV+dnhJxujQ==
X-Proofpoint-ORIG-GUID: r61Q-HQJEoESftFaRLFqI-vc79A-dOUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045



On 19-10-2026 17:26, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> The next wakeup timer value needs to be set in MPM timer as the arch timer
>> interrupt can not wakeup the SoC if after the deepest CPUidle states the
>> SoC also enters deepest low power state.
>>
>> To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
>> timer and the Resource Power Manager (RPM processor) takes care of setting
>> the timer in HW.
>>
>> Add MPM timer programming when CPU cluster enters power collapse.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
>> +{
>> +	ktime_t now, wakeup = KTIME_MAX;
>> +	u64 wakeup_us, wakeup_cycles = ~0;
>> +	u32 lo, hi;
>> +
>> +	/* Set highest time when system (timekeeping) is suspended */
>> +	if (system_state == SYSTEM_SUSPEND)
>> +		goto exit;
>> +
>> +	/* Find the relative wakeup in kernel time scale */
>> +	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);
> 
> This returns KTIME_MAX after the DT patches in this series are merged
> (because there's no power_domain that the MPM hangs off of anymore)

Yes that is true, thanks for pointing out. Perhaps we will revisit the timer changes
once we manage to add MPM device under CPU cluster power domain without blocking cluster
LPMs. For now will drop them from revised series.

Thanks,
Sneh

