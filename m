Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A36B3939A3
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330819; cv=none; b=nrNHYX7odz2AgOn/TBDPubkaom2ZDU31UoP7lwoSatDhMUNvFmkaomV+ZOX9vRcAnpPUIKjA+di0Oxqjc1d5QRdZjQfcr1UiwFtwKrGHUEZadaZ0ufTT5JP5jOydsozZ8Ri3SbLDp1kzfyGi3pc1jJByrPqsw5hGNKLc5hMafbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330819; c=relaxed/simple;
	bh=/mGvhP+bM/UE7zk3QUuSnK0plHwAziRdFpYlJdVwdK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpHrMt77fVqKmzwn7+k/HNq5gGuy+CLvOkj4svBxPCY5PCcMGC3m/SrxRAP90vfRpyyCjRFAnm9sm0CPpNI/53XdlA6GsBBiU3mSWi3dKyAYrRMifSQfHAp8BE6V4Gru0xdp9GOF0teVPlD3YUY1E1igsBrxPc/ozVIZ5/PLRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkKoo6P+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhMBEn0z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gkKoo6P+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhMBEn0z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693s0V4172335
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ut+TLtnWZIvlepOTyMstyRteyQgk6ZW9hRzle6ONrB8=; b=gkKoo6P+MsiYfvVT
	aGNasdm0QPQYJinayQVEtPkSO1T0jI3VFfioSA3AQNpd8fQgzbmEBKn3b8Q6/ww7
	vAFW21F5jz6MaGtb6V0fXlR1JDQ70KAbVf/vDbxiIlLxZuO8qiw3l+tm2GZJe6vw
	aQRrzDmJx9TAvUxEu2Eja5UC6jTzT7qku/mMdkpVYd5prABCk2NgFYoKgUyDahuO
	6NGYb5nubl7scvyy00uameIM8+ltJ5nTvxKLzZ9rDp5vwZQ9QjC2kZL31KxKWZLU
	cPCnbqwuw2ToWLcyYAGyMfVdUPLnRYOnF8kCRxgMK5PKiA2Rtm0071BS+w/HYEX8
	fWFuHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88a35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:40:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c08e9c344so12443881cf.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330813; x=1783935613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ut+TLtnWZIvlepOTyMstyRteyQgk6ZW9hRzle6ONrB8=;
        b=LhMBEn0zxWA1jTroFpXPsjtMVnGwPuxb/EBRZdSm1b5uVqxcbZCEm4jerQ3K6f2swo
         2uRSohYd5Sbos3+cSAVTaIWL5L2YHbMfpKqB4NxnqZJ0n5LRd5m4fUefZ2ldjKuwDvd2
         kyEk6j92DFpYz+7xiBJZy2P0CW2/Aqyn8jegW7+768LYpPJ8rbgCNVRg1+sxRR13HIYa
         hd33q6yRQIOMh9GAfAxgoqdQ3tB2WgGLDj7eFfb3a0f+2tMdGzKNdcnOj8jBRjPeDAge
         T6OfnAr4qFpmWaqoOdVcYqgJ85T8SG0o9f9TRdvBglUIAY8Qo6TpT+XCaFEW6/khBv8v
         Yubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330813; x=1783935613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ut+TLtnWZIvlepOTyMstyRteyQgk6ZW9hRzle6ONrB8=;
        b=sUKd/nU6H2m1Dql8TwOAuH99mdA+sqwmUpl+LTARvXQIa3hNkBlaHcsyPrOQzY8ruG
         5NUcYlDcgBTuGVn/1/pTolTLstbufzPLxWPkL0PAewWBxcoc8xny9gwdQFlY7xIpi7cd
         wpBkE19UBWj7tVpY30ErZoMCkreuWJQOTPVlZfftXnIOhNq0rF/CsgLuALvOL6ZgjNOa
         AT7JTPjCTdeNrN4QoRSE8MgGEe05NNJeiNlPQSqh1PH5L8vfduhX7v3URSycKPW9d5n2
         DYUTP9pSL/K9K8Sd8/5k/i5FLHJxC6Qo+rdCWk3ZYpiDRK5+5Iwn+c6kblJwy7fLIbKk
         cxSg==
X-Forwarded-Encrypted: i=1; AHgh+RrLvJvXy+TrOqfdeej6QFLTfHB9q0EK26+5eIkgI6evz+6cc/LAjKjlpVYWj7Su/leAIJ8weLlgDs5I@vger.kernel.org
X-Gm-Message-State: AOJu0Yxspra47cpEiIHJu+vnLbFOIuCSi0zQA938wu29KEJQBUh5xn3B
	iRhHkypDnoJjPaRWTJb+C2ZCV0XDhpFUXtXQKYJc6Gz1q+/pp6f/EwZ0W45ETxDjL9OiFy70N6+
	pSFWexrf5DLZ8k3NZY+FIXZBhtRDycK/7tSPq9w5Gv4GTlG70DWQyYS5OW44FZfep
X-Gm-Gg: AfdE7ckL9FwTeyga8at8zNpsNRBqvHgIVU6WDxSVhe+gX4je6PHIRgNO2GMdYOmckKn
	O6iaZvnOGKlF4gyB7j7+zqcpgoUWG0SvNDpxnDSzOvX/0EZoP/AoM+QeJgj4ydeED7XqsyO43Jo
	NYf7GqorFzJcbrgHFF3r0qLF0u08idZvIoQLcGe2jBElKNS0fxS4Vpm0XLayCTLOW6+C5yTbAeT
	7bk/RRmekt5QEa6E/SW93+QxTdUFZ/b1CZw3wsdgk9HxqsiXsNOzB48kREKQn5FZRwE614qGtn1
	tPurCUeWdENpm/WRJPnfHc7GkMipsm70qI4dnx2kU8w+2lm2KZp4OhScYb4v5KplARu0ZPTbfXb
	oQHwfj+i6DQ5zYsIwrf/5KkmaKXnwSOLXd+c=
X-Received: by 2002:ac8:5989:0:b0:51a:8079:795e with SMTP id d75a77b69052e-51c4bd8eb68mr114023061cf.4.1783330813240;
        Mon, 06 Jul 2026 02:40:13 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:51a:8079:795e with SMTP id d75a77b69052e-51c4bd8eb68mr114022901cf.4.1783330812816;
        Mon, 06 Jul 2026 02:40:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm728351866b.37.2026.07.06.02.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:40:12 -0700 (PDT)
Message-ID: <a1ce3c2b-4a68-424c-9aac-6cfaf6a98a24@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:40:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
 <15493c41-51ec-47f1-be1f-d211a970e487@oss.qualcomm.com>
 <f71e9b9b-a023-4d07-a6ca-58714ee22d06@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f71e9b9b-a023-4d07-a6ca-58714ee22d06@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX2rvKibL/x1sd
 zVu1JuLrw1Ta+eCIHKuELKN5nEUEhDTiVmNTVOwYOALDsrqtKwpLn/+Hagly0VYpFEU4xwoGHmG
 ACHj1uxWEnNCy+E0/LDG8VOq3lwWyxQ=
X-Proofpoint-GUID: J5ghW_WZe90D6K1KdjdCclOkjFSPyxTt
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b77fe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=widc2lmKH10sdeCS_vkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: J5ghW_WZe90D6K1KdjdCclOkjFSPyxTt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXzgST3OqpdG3e
 GV3r+QTS5aEdYUKaYMBYhvTRo1TlypelaVRCRb1bzpQhUAiqx3EC9kyoZ61KZ0ECoog2aI0kbFI
 dr+cThvT6madcPbeUNhkSBqMVCGkFms0LsX2aXqWFCaeoWCGMl3rf7Bqq6Ga8r+uYfav0WevIVW
 Y124sJvPcl3grN5rUYsvTPi3EWsXn5Q60GoGM5SPo6fWgluZmdC45B2jDmIR4onh/gBPxU1npqY
 LquF02eK2XAahGePUwwuQMIW8pMo/R3n0rgxwKp0ol32yJNORwMAtSCF+eCjm+2ieHdJgNqVdy/
 NIyXlOgyU/JXWV4gS144m9qK5aHJEIkBB/kiAqNWZoZxDRxhqKbAN551HvaAUoCxwgcAfsx1MeY
 hWVX0gJxX6ttbjPAaocqlSKAMASXxEf1VyexL1MqQKdKivBcrnbC7umrJXERYUc7nQUHl/A5L7e
 Zc29w+uxKD1HgARc06A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060097

On 7/6/26 11:15 AM, David Heidelberg wrote:
> On 06/07/2026 10:33, Konrad Dybcio wrote:
>> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Before the DSP_B only worked because the only close-to-mainline consumer
>>> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
>>> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
>>> Use the right codec (DSP_A) which works as expected.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> Fixes?
>>
> 
> I was thinking about it, but I don't see any mainline consumer of TDM within the sdm845 arch.
> 
> If you think it make sense, I'll mark it.

I personally think Fixes makes sense whenever the code is fixed,
not only if there's a user-visible bug. Up to you.

Konrad
