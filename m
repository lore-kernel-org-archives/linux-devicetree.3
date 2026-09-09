Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E88545D80
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953520; cv=none; b=ncixO6qwfONA9sbfUqBGjBDUIaAy31LZaEBAs+AOjBPubhXwuUccHLGupQlLkJhYl5w3nj5AHCeETodDbqNSwRj4M1LdvIQjK3taKGWOyakzWwrAc2J2d2+PI70tvaLZUIygqSxAC8k9a95r1xJgcxALOYQKHLQqvWkgsn2WM6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953520; c=relaxed/simple;
	bh=2bI+hvC4gIbQMw3MMwoMshp1SYwCTQOzMUzddE9Ei50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtJnUfgsNWmb6R9IDdRag6tXZCKehPdXTHR9QypAfl7qCzHNZpNwqN0b/nnvqUtE1CrIGsimcoZO++0ulnNAy1dwqEqIPICYxE/EFn0Ru8FSuhfR2CQwGA/1ZNbhppxYzazTikMJPyowDap2iE2uS8jiOba2dzMkBCMBChLYvFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQ2z9hcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbJewmIz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQ2z9hcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbJewmIz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUCP71843087
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 11:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HTfQcHjuPofeObVYGqE1jAWmGHTVv000wfTZ7gq8iI=; b=fQ2z9hczGdB1BGzh
	iDO/7zRUnWTXugfJgoIhpkPkg4xLoY4RP+uRYiunQoPWrEhb0W0p06Z2ExHOrPyx
	kiLHrt1Nwt62jrs9UgR766OXSMDxnFq7Aov1chOLguHR/gHFDVgrChuOgnHLzJa6
	CdpJvJsGEx3SGbjx31JJEVrHtbv1cFdHpRJPyQq7ggLbLTS3ZZpKjC1Z65ztga4U
	6tu2W0Vnho4WmD+lUFFpoPiq02/qo/hxKKe0YMGnrvf9+Ax1NDX9Z0mh2co21FS5
	Rxl8FI5HqNEVM+5wbPBIjHNdvDNEFclbRQDWoD2r1mS/4OoUIvFQHZXyJLeZHzV8
	6dTfIA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqja10v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:31:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78ff6c94908so7881137.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953517; x=1789558317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HTfQcHjuPofeObVYGqE1jAWmGHTVv000wfTZ7gq8iI=;
        b=YbJewmIzsDdwhaiPaUeWK4rmsnTh8C2u3glUDaxgYoW8jy4MOqsk8vUudWQs9jVx3J
         jp/05my5zrpvakejXTBDez1rtQ2KA6a+ZbQTqhW31yz9NBxIVhyQegLMPrz53K0WOWfT
         YnFipm3vV22toMywQy9igMDSYUd/YyIV5voJpLWzoNNJtWQNSdFBJfgd7D7b0nqtMbgK
         65qbxP7uN+xea0ZdrBq8gt6swVV+wktuCbNYtJVcGlStZvftTIko5K3oJIkFYar2My19
         h2pC0/q3uZ6LuOTPc7CViLfYdRiKHihMKo1mh9J0fwLE3dgTA+yIn1PVWpD56DjeD4R9
         azgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953517; x=1789558317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HTfQcHjuPofeObVYGqE1jAWmGHTVv000wfTZ7gq8iI=;
        b=Qqg9DG99BhrfNp/knP9inHhhNVlVd0NEMP3u9iyxraNb6yHtmRwkqucIB5l2BIRTGx
         wWGB9fYQWzE7760mD3moYeYBmb4aCQcikW2fQKTOKSQt7D67qRKHh9rz6MdA4WJK2AJB
         XwXaoNlu8AtLPqYy5UB30t0nuastGGxFwNoRLREOPq8Wi9zaOVhCLOL3Ag+0K1+V6MPB
         PNaNTuNyP7lMzpM+ybMVRk4s0jtEoVRGhpnuxxG7ZERIWW1Wkq3nMycp2ATFRDSBJtd8
         A5r81G68Xa52cMOyF7R6G8puBUrQR6fzQNtp/ELSz2H+ZCt1zttaCCtZVPGRyl1jPaN6
         HT/w==
X-Forwarded-Encrypted: i=1; AKwUvByBrk0nGvTx1GMEAa3EBbQWdsdxrYZ0TphnIVQxpiPj13LD3CZO5y0bYNRRApbasSvYJFeYuR0F/n09@vger.kernel.org
X-Gm-Message-State: AFuF++kTrcYSedmx1dsrWU33KnmepJNZh202hv4H0ADmRmb9cXDoVCx0
	hf1Nne15t439InnVj6WmF8cf378DP5w4WoBwry9wLv1Vx6iQOItb9Q2pjb0AIxQg8v0JPhOZWb9
	gQugzKw7BFnmDVFJjFbPBRjnh1/yg7UfXWHyEowuW0MEtFAW1NNmS99vvFMQYE1cg
X-Gm-Gg: AYBFou2Btd6PQp48iZ21HlVpVJ60L0NDROKuk/HC1jws7C5VBIqkc7B2b07syLRSw02
	m8ockLYRWDEptpBoJwFVAYgXR/zYOM3AzlHX5XcgFe+KH18ecoRlQ59/5+s+a6SuAkqQ6pcrrEK
	HnsOEL/1ltrvA++8cgZiXdpqD8PjxBNdK31rU4xUa+oYZd5PQ+UcfqP5o0CekGXfMd+P5wEmEZh
	/cy4O8nsarYwspmRESapRSWl8sgwXIsFN03gUo9MZ00yf6/VRj3QDpFspbn++DjbtgfqFOjW8K9
	O7WHqgAli1GCYks0Gu0ubNa7uWRdUWrYApI0kqQQblpmyFtPBHNs8aNDNIoj96kAc0BOAokFrGG
	k9RyM+4xZeNhdYhnFxoDegQ==
X-Received: by 2002:a05:6102:9d8:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78a60ccc908mr4296859137.1.1788953517419;
        Wed, 09 Sep 2026 04:31:57 -0700 (PDT)
X-Received: by 2002:a05:6102:9d8:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78a60ccc908mr4296848137.1.1788953516915;
        Wed, 09 Sep 2026 04:31:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bd618sm796814266b.56.2026.09.09.04.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:31:56 -0700 (PDT)
Message-ID: <f89bf46b-dfda-4fad-9e8e-fb88741fca1b@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:31:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: Mostafa Saleh <smostafa@google.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
 <ap_qwdz-3WibXRjq@google.com>
 <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>
 <ap_69OsnAOwQyo50@google.com>
 <9762659c-fbde-4887-8da8-200db7dfad09@oldschoolsolutions.biz>
 <aqBKI0Fg3ZqYPOJh@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aqBKI0Fg3ZqYPOJh@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZYZ429y9EhlpB-nGZ3JrMT3oqSpL--Bl
X-Proofpoint-GUID: ZYZ429y9EhlpB-nGZ3JrMT3oqSpL--Bl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyOCBTYWx0ZWRfX9eRLWQKMsi91
 mIoBCrEgzOpchf92U2h7bx07mtEj2waUy/sQHAwrSJ06a3YCIKlz/ThvMSRjzo23L24QZJjzBgV
 tRtVvB/DnJGCiTYRUZSi9GSpWaiop+LEO5kHk5xcpIDRZp6H36bTkYDT8aBXqdgjre7+SXJ4/Fe
 0JiwxXvaIfV1cEylz/fsluQje4EEz9YMUNtrLOXw5FKCE+1aJWPG+IGISHJHRoOMJ/McmssGuZu
 xyDYCOVk6E7FGxeUeoRAAK+Bhe1GvsMQiGCwc78brXGr1/ciFWcUd6xcfMivhXmILfHUMA141ME
 XpJZzfqptmYcyGepzcIxqu2gvEQ964Qrc2SIykE49nJP/BLIXF2fyWgAVpOaqD7HWxvcEk9e16m
 zrPpxKzSf1/baQg/iqPOL9UmX3qvn4B8BVLEhy0sh47dQcGTxgj6TDK/wFMCbmENbi8wuB1PDrh
 tPCY/yGFuse5zjOAhTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyOCBTYWx0ZWRfX/sffL8reRSDu
 +Wt7hF5lqcAOvhLCsZUzp+Sox/VcqykkSZC7d7SnYEroCI7EXuungfN7kWv3UzRd/WbmIXgCqe3
 nVkX679T3c8Kc9b7itA+Xr28hKW45Lc=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa143ae cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=vZxbLtyPAAAA:8 a=gs9rdYFyacZa6GlARNUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=YIznc7gRMHvxYRuyG5Sm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090128

On 9/8/26 7:47 PM, Mostafa Saleh wrote:
> On Tue, Sep 08, 2026 at 05:04:44PM +0200, Jens Glathe wrote:
>> Hi Mostafa,
>>
>> On 9/8/26 14:09, Mostafa Saleh wrote:
>>> I don't have a display connected (never managed/bothered to enable it).
>>>
>>> Can you please share your .config, I can test with it, just to eliminate
>>> the possibility it's causing the issue.

[...]

> Booting in EL1 hangs with timeouts and missing suppliers:
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
> [    0.000000] Linux version 7.3.0-rc1-next-20260904+ (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 SMP PREEMPT_DYNAMIC Tu6
> [    0.000000] KASLR enabled
> [    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
> [    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
> [    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
> [    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
> [    0.000000] ITS@0x0000000017040000: Devices Table too large, reduce ids 32->19
> [    0.000000] ITS@0x0000000017040000: Devices too large, reduce ITS pages 1024->256
> [    0.163152] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> [    0.163313] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> [    0.168334] clk: Not disabling unused clocks
> [    0.168336] PM: genpd: Not disabling unused power domains
> [    0.170770] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.178347] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.184718] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> [    0.211932] Warning: unable to open an initial console.
> [    0.212057] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.213907] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> [    0.213928] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.244210] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> [    0.244275] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> [    0.251833] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.259418] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [   10.213618] qcom-pcie 1bf8000.pcie: supply vdda not found, using dummy regulator
> [   10.214873] arm-smmu 3da0000.iommu: deferred probe timeout, ignoring dependency
> [   10.228713] arm-smmu 3da0000.iommu: probe with driver arm-smmu failed with error -110

If I had to take a guess, your initramfs it missing some(many?) modules

Konrad
