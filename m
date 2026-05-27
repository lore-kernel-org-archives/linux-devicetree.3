Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78943D47D0
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889910; cv=none; b=TrWnS99FJtBieFoeheJPlUdEjuXyS5dEcbDzYohmslI2Jd58WdrhPZ6kpl3ViB67EE3gpdNc9pqU5MsBulZSIwJ8MHegxkI3HNgxgAzD1LWNGFiG29dnW/qSY28o8QrxLL6nD2Qo5maNOcdNVLZgcjOzLj6K2ED1wc91bV3MCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889910; c=relaxed/simple;
	bh=r0aT+QTWj1B7a2o03LnJE8w5zsP80m9ExwvT1Og5Mnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ed++Hb/yV21MI037zzEoM+0r9tTYJ72CV3FwHuiah9+OuKBGY2RVq2f/XoqT3WLygDm78pTKmgU86KUzLmGE27maCLNKsC5TfdTiPFgosewpADeSdnWvQ2g7mUQhSqYoJOw9yMTAmrXnPI0kt0Fq0S9Q/Nf//QxA4bDtGpIOk+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrGw6F0/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAw2SYaA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrGw6F0/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAw2SYaA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mTtN3830775
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NquEXa+wXS0JZmWbAUizRlERWzjLifHKVTda41vYocQ=; b=XrGw6F0/2xToLL1h
	h3AZWF6ktGDptzqrljIuR1E6Q5QFZAhdyn3fyBVhlUA3vVUz+PQniHIR5ZrnYr0/
	Ns0T5uJAzrcpdtaWOBqMlsWyT1TDgme1cVjI8yqucZ2msNOpqnXAxzcBYv6HQuRC
	AKN0DkMxoxez4Pn0d+PUr/Ym3Vue5u7LYxKNmVAzLxL3/wr3xt0zt3P52HDf84ac
	9GQLSDXdk7zpmr4qrPhqNtWUYgU8hAOG/ga6BH5f82+/XgO6wOwi2fSTqKuFSUgd
	FqLxKbwwBVQfg9+1MXN7ItiDZZFUltQYtysCq24EnpY80WEr842h7tpV4Wvuq80N
	29JHPw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edn17js8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:51:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so121263285ad.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779889907; x=1780494707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NquEXa+wXS0JZmWbAUizRlERWzjLifHKVTda41vYocQ=;
        b=EAw2SYaACTTJ12iy7fnemSQwvwB1zyzDbK1BAef5r+43OAI5RsBJKHUpMZenIaNiqH
         KSJed6VMukM0mWLQ6T/ISe5NRJ4Wfzxd4SLQJpt6BgVFxw081k/bNto6K5YJVw3yPtRm
         tcMUi7/IPgNsuSxNsIM+Svve5opU16rzvuzdWfuyDty5JHZPKutBcM4dn5yNHxcyIVNJ
         Z9a04Nb4smUg9UkrHKkDW6pC5iTD/k5gH6KSc2oAYOBA8jwEy3az2RSjrO23rquMu1+i
         KulGPmH8NnhU66v2eHlhfty0ba7F5rfTZZVWvOJWbz31764MvK+bWO5dgoqvn3cy/xDf
         ArMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889907; x=1780494707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NquEXa+wXS0JZmWbAUizRlERWzjLifHKVTda41vYocQ=;
        b=Am9Ovf5W7jVkB4f4lgcfqAGpbjrKwhjOgJydz2QQOIgf+9CSCG+HMXagV2s4CONfKd
         Qh8xK1xlKUhYGeo1+u/rSbTxI7haoFzhzUw3A2gzcVnD7XbLLLt1EKm1IZquBWLd3qg7
         vua6JTQ6dZz2zayZjfDFS7/rEdQC/SRVyvmyTHRcOUw1A2FMDat2gvofFK7b1FGHFSRq
         WIAhMnYbnHBHaCZ5X5RxViWUuoTZSOwlfLpZ26zp2ogcTeu1xG3FgSQTe3DYTfCb6xHI
         KD96BcQTTLK/uYgTheid3MUVK67oxe4IDy2X0P8bKAp0MDNhadUVYHWhUFSRv0cfa0qA
         ptJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/K+OvPkBeL20lVWHoyb4QS0aqSu1BeB2yUPLkEVtyRre5c5WuqRd3HmysBw0OGgx4GHpFiP8sEHZ6h@vger.kernel.org
X-Gm-Message-State: AOJu0YyiB/77DjX6eRzVWFM2p9Wu2D0GgL00/x99C4OLLjNJTOsDrNz7
	oYtCrm5XsliKG+DvDweANjpg1jbabf/Nwf2wh4LHB5ntZPGeN/5cBXiOzD0PVDmSZ/3P2Wo6yWD
	tc6X+dbQBN2IOR91IGqGNBuHrc6gbHudFQTZOHuWCGsPED5vo5rm1c48A3gOTxYlM
X-Gm-Gg: Acq92OG91MegnpaUD99zuGX1aqfc00gYZPzciVBPWzneV7+K5G6cX0WwWZ0U6QnnmDG
	XE9r6cgMxNTo8AYRDKxVANN0tUKtbNxDdhUgDgUZf3cHD+CBafZTxFzMtCFZGFFXF7BFncV9jYG
	uJdqT9pMc/Qacs8sqXVrxd2ahCZ4AtNA3z0C4ZRQIsdEnaoRlupHJhs0a5IOym0T4yG1hf7avqI
	yd8B3EWOC6xm7lPQxO2BfxmSXM2QA/jTLLcw1ANT5iZP9rTVMlG+F4S+C1rsDhc7tY4TD9kifGn
	vc+U8r/MWBtAvWi9XsAGg8nke21C2NP6GNvtPVZk06NOfUnLeYv9qfUlAE9TB0xAF7rRwCRgYdi
	mkRT29oAceQI9nQ2+Vu4Or3k+a8LfNjALeFlYB9WLrYbJJSoGawqflTz9Kf4=
X-Received: by 2002:a17:903:354b:b0:2bc:db91:f5a7 with SMTP id d9443c01a7336-2beb0735023mr265126395ad.11.1779889906580;
        Wed, 27 May 2026 06:51:46 -0700 (PDT)
X-Received: by 2002:a17:903:354b:b0:2bc:db91:f5a7 with SMTP id d9443c01a7336-2beb0735023mr265125955ad.11.1779889906099;
        Wed, 27 May 2026 06:51:46 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm205407535ad.36.2026.05.27.06.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:51:45 -0700 (PDT)
Message-ID: <68027ef8-6182-479e-ade4-9c19b048b337@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:21:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <ad5e2d91-6166-4fb6-a9da-1464b161da24@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <ad5e2d91-6166-4fb6-a9da-1464b161da24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzNiBTYWx0ZWRfXwp8GaIo53cdx
 dB8tCYNggz4edOsvjq089ynzyQuCATRXPeQhl0lYHP+RS25ls6hapmKvWW0fknrJcoy0BFU96ao
 pZ/g1YbUWsmI7yX3HsctS6VVGGhxjkRS3933ndFp0MjwuBe0aTVwpuuQswemeyky/yUh3+OmtU1
 Z+Q+ZbWnP9NGOcVM3E5Doggj5CGOFKA9lXkIra5zqBhEv1q6gVm9cQyS+iRzLOTMhh7bDo94Iti
 Z6QgrMrF7IEzy0lHDsu9ReN6zoTos6oks4cLir2zNXVdVBPmP8Pp/nyE4RGQv/83P0e0EKyh8Zj
 BkCIVf8zCU+XAe86Rm5K9K5AsM6EFOtHKNSDtI+Rpk03nobvJWsxKXwtOvvtTYsh8BXH1DgPt3i
 Pmu0DYml5jdljJvEDv5N4LbCMUaWf02sKIvq9rqsu7fxTI74xl9TOi749Vr4j9HG4++5MQYJpaf
 rc8n1o3D1PpZXsNYU9w==
X-Authority-Analysis: v=2.4 cv=R6Uz39RX c=1 sm=1 tr=0 ts=6a16f6f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ov8QOwxTnn4yD7v_06kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: hp8oiIY8L4IOIhTtwtp790XwLWBH-_0n
X-Proofpoint-ORIG-GUID: hp8oiIY8L4IOIhTtwtp790XwLWBH-_0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270136

On 5/25/2026 6:44 PM, Konrad Dybcio wrote:
> On 5/22/26 8:02 PM, Komal Bajaj wrote:
>> Add initial device tree support for the Qualcomm Shikra SoC.
>> Shikra ships in a SoM form factor; this series covers the CQ2390M,
>> CQ2390S and IQ2390S SoM variants and their EVK boards.
>> The series adds:
>> - dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
>> - SoC base DTSI
>> - CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
>> - IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
>> - EVK DTS files enabling UART and eMMC on the carrier board
>>
>> Note: USB support is intentionally dropped from this series. It will be
>> sent separately once the USB driver changes for Shikra are concluded.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> ---
>> Changes in v3:
>> - Drop USB nodes from this series; will be sent separately pending
>>    conclusion of USB driver changes for Shikra
>> - Fix CPU3 reg address (0x300 -> 0x10000)
> This part seems to not have gone through (have you verified it at runtime,
> e.g. via reading the MPIDR_EL1 register?

Thanks for pointing out this, I missed to update the cover letter, the 
value is still unchanged.
(Core3  bootup failed with reg address 0x10000) [1].

>
>> and memory base (0xa0000000 -> 0x80000000) (sashiko-bot)> - Fix power-domain macro: QCM2290_VDDCX -> RPMPD_VDDCX for sdhc (sashiko-bot)
>> - Fix MPM interrupt number for ss_phy_irq (8 -> 9) (sashiko-bot)
> Hm? I don't see a 8 or a 9 in either this or previous revisions

This is a miss from my side while updating the cover.  It's interrupt 
controller's interrupt vector  instead of MPM interrupt vector[1].
Will review and fix all the cover contents in next revision.

[1]: 
https://lore.kernel.org/all/af80ccf3-b26b-48f7-ba94-0830c0730a94@oss.qualcomm.com/

Thanks
Komal
