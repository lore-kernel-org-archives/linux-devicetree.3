Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFED471CF7
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798623; cv=none; b=OSqg8WwPN94wphSVEndNrSaNq+SRMMTZ/r/TbBAb6zphQtOgUS3/w7Ugx4q+IMV1NxOmFQXZ6pT8ElXxD4jfjKXdKsxmcNP2Y0rQffCpTBu11PhqtYUt3S+nNa+kCNUCTI6/XPIqCgkc1wLGOjaZY6Ofn/K1Gz4YomgEiqumuc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798623; c=relaxed/simple;
	bh=bkUoku9vvOCC45/xH4+TO5c/C0lBGGKl0K+LjBajYl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cF3kPe0YdIv6XdcmwRlDImAoL7gHZg/QTew0Yiw/eJpBEzl8HqrGebqCvomTLost55EPAHbrIpYUEjkqQlf4hdpSm+yVyIGoY5mCVZzki4uNm7IFlH1xXTl4RNu/Mv97bwkiY3vJe5KbKGF9wp4jn2VmNOlb4a42r1enCZxCefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct8zVjhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTt+9bnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct8zVjhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTt+9bnn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KlbN2181470
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=; b=ct8zVjhQxysGhVih
	XneGqg/XFRjbzCqBQQFkh5XFWTiZYRtSXVuOQbrBw1TlcOg2JOV4sRMK67etHbIr
	pQE8YphIJmvBSIE9dkdmMZrMosK6ErNtRoZjOxF3xvbN9EGN7MPnLTQSrznqQzed
	tWctd1AR0vT+wqw2evnJyPf+r8YnzToZhTURIIiTY24IVf0pQg7iMEHlD2ojmqjb
	PGqwpGrt9U3nvSyC815dB4YDkonbX7kum1qrrBZ3qAcmOCaL15L73MtVT9/NTvpd
	Zzd1MJpw95yo0qGmMKqNilfqflBKWwO1aBaO0RSGBrNBpLOQvP0KIGW+0mpdoSJ9
	9fFkRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1s4xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:50:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so2388120a91.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798616; x=1792403416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=;
        b=cTt+9bnneodA8YzTBbwWThEz0qk3PMa963D8SusqaQSUbV9mageUyJb6b5HYNqtKeB
         +9SheizQ2sTBsK9jwiqpWXXX5FuLmTPI0VKVmWTpq/R9j86ury6kmIiLnZii9v9nJvwR
         +c8gwkz2lpQigBl/8a/VPnQq3iKY+g1Y16zwi7IbBqp7YRPmho5LdzmiwI3+ek8NI05v
         W11jhpFSTRQcmoIDk63vL89CRRKGcEzT4pOfL6FfQQdylEfYKJEXKkGL64vbfN/cjPAc
         a1iEOfJf9NHrcLqGE/HIee+MA2dINDUpLyf0nh/EJSYn43csGCLvNkwZTNfW0vK6zK+3
         KKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798616; x=1792403416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=;
        b=b4KmqFbq45cNvcDNHTaGCkj4SEsg1044x4xYYV0ZdatCzDX47dpDPPtw0MID4xYyrJ
         DKuVGc6Otgglp4HV5ZcDxIl9EkSWJOsDUhcJbuGiQhoUBJHrA/IH7PPpG4tKPfLaRQnp
         yxkqFT9LcEVMQjjwy5wylJAPn00mTjz1zpjHOz3fCquCXlLAWKV3mWbksCp8CqNPG/xr
         GNNXplBmMRJq1br7QifDcwZgdiOyYTC1lyV1TvlbDi5EsYHSS0CQbW/R+4Hv/ixefTwD
         aQPF/tElj+XIrUUhKll/cvGtUPXafbgFno4sWYQ0kkmLpyMsS/DQv+X+xX8FhZFUk2Xx
         dLng==
X-Forwarded-Encrypted: i=1; AKwUvBwBlfdFqtR8Nty9BsDVJbuFq/+m+VpKeBccXZB5jS8ZqovE9c4osx3KHiJ0MfWQfPXdJ530W+gfeqCZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJTrC7saRBl71dVL94YUWTqPn6SnyKBPkf4x91lo2owusucILoc
	2U0KnpMLLy5kTTaK1GDyH2DLhcaUYruEA+O1H8tCFrZWewSVoOQlHNOHYOEpI+n2lRoHNZ4muOH
	7HsVFaOQUklcRFeBHhiCbEOynEu2gMET/fKDH6CG0p3+TKIza048vX3UpLk41gFJb
X-Gm-Gg: AYBFou36Wi75p30vNGPvWZgOlaLa1VwJRebRBA/u+F2dP/eoTFcLsTj37ULLtR0gU5E
	PnTE9QgHG19p8WuJG4JYjSnlHRs7ef1D7EEhUJRToFLLKpeurvdQMnTSY0C0AjrH1X2aa1FOu9w
	L30WxVsROQkTU8KZ6b7D1oLscElOVj5PvEsepS7WzurHuro8xLvF4F/Uy/GWa2TJL41O2PUXDZp
	O4AmhSnxGIZIaPf6J3nEcV6tKnISHbHWtC+oaMoK7H4X5OFQG8jKAFaAW4Rr3hkZgwNmxVaEJyw
	jKcJ7FHIyYeL2KgS1ZLMxhcn2uT9SPPhb4eKFzERQj0As3+IJMOpoFb3cIVAoUXpXR9BCxxoZXv
	K9tCDfP1fbMR05uw3KG/fzpGWq39xDgyAFGVPQc2C0HsiCzR0f4FEHH0mGZUAyEE+XfmnGMxTSN
	/LaXIHuhZSc3E=
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr6364583a91.12.1791798616220;
        Mon, 12 Oct 2026 02:50:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr6364571a91.12.1791798615743;
        Mon, 12 Oct 2026 02:50:15 -0700 (PDT)
Received: from [10.79.117.80] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0d34sm16558029a91.14.2026.10.12.02.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:50:15 -0700 (PDT)
Message-ID: <bc6440b9-0226-47ae-9e33-594ab6b92004@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:20:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
 <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SUT6ypoUs1AkLXl9talXJxyrQpKqhVP1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfXxTZu+igHamwn
 uqigmQ/4ZG8NIg/MD9ccCgWnmB8797Z4Yd7WFZNMdc8se+sQ5R0n+1kxdMKtBE8n/YAM8s69WJs
 D1E3yUJ5F7Ip/AMFDVEdoqC6TBexLdk=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accad59 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NpMNtq8KyP0wiFrzd7MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: SUT6ypoUs1AkLXl9talXJxyrQpKqhVP1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX0WS7tUSAa4Tz
 j9Kkuip9zoxmgjbc0jcgotCIlmfAJHCXmdKxCUXy4fVUnrREuB+Ja/y7Wg7QCeSXly9dvKpH186
 LHiQHJpjEco4huA8kEQV00sbFIzLzjs28/RU+Sf2ZKvyacyGgHZhhUpWXHz2aeiaVTlwyAUxOa1
 rUNWoptw/T3WFRKNByvvtnZlQx1QwPI4bacWBnaSFrLO6q8P3O8TC/8BopOzJrOkxaP8nZAg2vM
 DQrzh9O+jVKKawiYeGx0cXZwIi5GZ0QERXWV/DTaPH1QDEexrGUEowmJHMUWQMa3C58fnMT7krQ
 NbmIJaK1E+TLytewTCQO8NqaMVrbLlnlUsEc8WRHdvmb6VUdE/h8eowtkAGITbrTLdGVTX+/6Sl
 vrx/u+ZeryFNZ7lv8wDf6UNaxA1KtBQxaJf8UyI0Rehb0rUmvEGbqp3ndDx2NFezyyCl4WacD7j
 wczylkmVfcQJqOhs/dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120039



On 10/12/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 12:47:42PM +0530, Anvesh Jain P wrote:
>> Add coredump support for the secure and non-secure OOBMSS carveouts.
>> Register fixed dump segments at probe time for attached-state recovery.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 85 ++++++++++++++++++++++++++++++++++----
>>  1 file changed, 77 insertions(+), 8 deletions(-)
> 
> Why is this separate from Glymur support? How is your device suppose to
> work without this patch?
> 
> Best regards,
> Krzysztof

This patch is diagnostic-only and is not required for OOBMSS boot or SSR
recovery; without it, the device works but no OOB coredump is collected.

I kept it separate to isolate the optional coredump support. I will make
the subject and description generic for coredump support on PAS
subsystems with secondary processors, rather than limiting it to
Glymur/OOBMSS.

-- 
Best Regards,
Anvesh

