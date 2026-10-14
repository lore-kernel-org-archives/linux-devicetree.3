Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FFF545DB8
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988314; cv=none; b=s4xXFSdKvF9hFT8Y+/izXqj2bDm5B5L3hIa+xw3qX24DXRsFJOZjjZ2pHe1PmX6UwzMxQl8B1tEylaW3cNQpSQ9WQjXCn8vD1l4+2wf+Z4XHTu6BW/hi8v5huiNT4jdFIwbf3OwZPrDPcv9/+kLGoKFSNZO5g0RyOGjvt00jxcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988314; c=relaxed/simple;
	bh=VJ6gRZxJ5I417VUJFcUxjTbPRR2s8FVgzR280XCPIzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zzymg21TMbGjcRBdX4gZ67hr8rO5tBJ6sRvojskfW4fXjkb1E17l7AUo3CLI2y10NkjljgvgIehiOIm10+pl6jFchm7IvLvN7la6YI24sNtCaCPJx3viSqUNRiajQK9MzBdmLUGTYLwXMoD3lOpyIO0Ji7qsR6Q7oImSTlVqswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIhC0Cju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USxORKOv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIhC0Cju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USxORKOv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDHxIj329092
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouav1jCUIGC1aVQKVliTm9owRud1HmZkT7z54EYBB74=; b=aIhC0CjufYqOf4yq
	cDNQm8OrIw+xK6tMPiXbfr6h85/TEamKxR0bOrdAk/DLJ6nxTR/E7ANMCImQn4c8
	dRnhQvd2ML7bM+5TYsS20mo4ncX7d5As9FZ5QSiatcOsIk/36tdXfu5caVnM+ulv
	uiriOKoB/k87VY6wyMvXMGdYsV4bZQ0pJZkyy+yNcKbFpcGD5pZlc7HjIGo6pm4O
	wMZ/d55si51TKkf+y8evvnmdE2XpxPSBTaQAe8opR5rJ5GQb2GQ6vYw0YjAat18f
	VPlqb+J9fycj5mMbEOMjHFMQLfhSrh1+XmAHMx2jTWPjDI5L0jZLBFibAGIk7UVr
	JDULqg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf09nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:31:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d44237e2faso202465e0c.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988310; x=1792593110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouav1jCUIGC1aVQKVliTm9owRud1HmZkT7z54EYBB74=;
        b=USxORKOv5W6HbprefhERVyM96i3sDBnnD9h8fsRinNu4nRZzfDzBv6+yJKk5TvjB0p
         yX2VgQdC6V1/rIg1++ctkBZIOsgRvadlVkSPllTdz9NfLDBOldDRZaEePRAWhUQ/vl2o
         mG9vqYCdFpHjBoCKmPwFG9FliA7ZN2Ol5gU4oERGLRSrLWfqPMrvnLZHfDB3F5wasPvm
         oHSkEJub2tHHGKFvcR77IpsDmvy38Yuzy8IqeF4Pqku1TCDRzHPi1oHkHYfpiiR+L7uJ
         9Sgf81YG062SPIoPW5vGP4vYgQszZFV1IQmaZqrKc91THQPZD2SW9DgjpI6rhFMUAabu
         xGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988310; x=1792593110;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouav1jCUIGC1aVQKVliTm9owRud1HmZkT7z54EYBB74=;
        b=jP50aoBTE7gM7++Ps//7XZCl5jYOEg4Q64te/KGkfgRDC5C/e5NSFSl0WZANwK7QSG
         4gM2ZnWId0iz00dFgTHVEc789Ngqac29re4I6cpuEtVO3IZ06w8jSQVwp5kAMF4vmowT
         OStpAmt84MLrmq+KOm/Vl3SardxblQuRAAq3OlFIF0jfWygxUONzDrHJWCHPx4LL5Wg0
         alqf4NlWO18r42SsCUo8xIpr4Y7SajIp/+kFkOrtyH6AX/7K1oMzysCnVryBUqTTQFvY
         kPTe1VLYf/hRGc4bVvOfylIdH21mcGE8AaqVVrlakGGHAT2jJLB5h4mn3gwY088ZdhWD
         fHrA==
X-Forwarded-Encrypted: i=1; AKwUvBzWnldDT6pzeZsnW6PH7qnyunsQ9okBAFPC1Z1Vydu2hTSotVCuxdHs22z17JxOCdyeTw8tQLyF2GIs@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4aXG0e3/C1s5NnK67zpFh7SL5zbPCiL0Wj0eqJ/A1Vr4zXpLa
	UhQ/yyAt4oUaBr6iDxv6TzBlndum7bi4u4nys+o5rUFYiQslQS8kPI7iAxah1f61eLR2S5+JzRY
	sTxlpW9Bz3liDZSxKEsmH55Q3gcccg1TrSMS8hE1eCiXB8+FCTraIDt26PE2tVz+W
X-Gm-Gg: AYBFou1NV3c4IqF12BIdSL23VzzWoge4kx8SWjD8JVl6EwrIMugubPMuetwX4QCcgT+
	S2rY/kf7NfecQMOE3PLDRqx7ihpdRTA8Eh+G8xz4uScgYQV/ofarfn/XK3I9icsH1u2so8edAVi
	R/Sn2bWnNsJTsiuQGTSEhe3hhgPmwyPC8e5rm7qguD3BeiP650VYbnrXw5DyX6MixKYlexWWC/W
	VZcFo4blze9CVRNu1NkFZA5e94/gF5LWKq7+kyjtfOWqbTID9D3y8XJqvCi2RVLvcpxmC0N80LC
	MgjrMflmyHsCvaXb4UyG5ke2O2Wo2JiBUbxHLa0y8r6RZN51Xy1YQHx6q56B+CYeshx2ywwraMC
	ZpJuNqvAhOfGyF0bjibepcg==
X-Received: by 2002:a05:6123:5c4:10b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5e91f52a44bmr3173587e0c.5.1791988310167;
        Wed, 14 Oct 2026 07:31:50 -0700 (PDT)
X-Received: by 2002:a05:6123:5c4:10b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5e91f52a44bmr3173534e0c.5.1791988309635;
        Wed, 14 Oct 2026 07:31:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9af103csm709600266b.87.2026.10.14.07.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:31:48 -0700 (PDT)
Message-ID: <f8f161d1-be35-4fb7-8dee-8bda3a231438@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:31:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan.gerhold@linaro.org
References: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
 <46ba46c8-c84e-44d9-8729-9298867b19fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46ba46c8-c84e-44d9-8729-9298867b19fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXzzJDamN1f905
 mgxVG6Z++LwTc4GLCsIB6DLEidsgR6fpAnKtta1hHRQfMUylKcHuUVOu6jqQ2Sxt0YGk5zDOGVF
 N7sONqcU1gXQCBRqEe0gxAsDWdex9YOk43R+NOCiObwVzYExWZWdMTfmVs3HDLtn9MWIj6DES8b
 5dk/Gc926T0B9PO3YqUSgae8VkqSdaRWvsG6oqdqFYenvmIOyccTInLcFw1tgwNlD0SCeyumKGI
 FXucgL6qmsSC63Oms4rpcm1w3DT6miWMifsZ9Ai4GHIM8DDabmAuUCme/z1lkq1gsLLxl+N2rex
 my6S4xdYRfbIGS4R0odFDKVrXcm/yT0LHUyvEuOcOmopPfd2gkmHj5Ia61Dgo0jbzKWmhdgPo03
 Oij0mwkf0H3CinFdGIuEvgu8eX4W4Btptuimp2MEkxS12ZcPht0fbScy2TUqvdUTXdd5UwraDI/
 lRCzE0F7MargOc/aAmg==
X-Proofpoint-GUID: gDjS7RmWiOXAn-uydSPtY0ehL55s0BHB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX+kWKAag4N0d9
 T6FQjPof1GH9L/5wzKKRLJgXniGe2p3H9FCwET4bTSmSYaIjfU+FQ4XvSaKJCIuYrtG+srpv4MQ
 k2Y6+FQ6FKXUyDiFKA0puTn8tns+NXw=
X-Proofpoint-ORIG-GUID: gDjS7RmWiOXAn-uydSPtY0ehL55s0BHB
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf9257 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=n4yv8perxTnihnHdoW0A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:16 PM, Hans de Goede wrote:
> Hi,

[...]

>> +	thermal-zones {
> 
> I believe all nodes should be shorted by label, then name which is why
> the first node before this was "wcd938x: audio-codec" since "audio-codec"
> starts with an a.
> 
> So this should be at the end of the global nodes.

By the node name

FWIW:

label: node-name@unit-address {
	property = value
};

Konrad
