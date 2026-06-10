Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA73B0AE7
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081738; cv=none; b=vE352CsTfBu5fDIQWppUXu4pHoJe9hWIy6L16nXlqJqYYB1DBbD6jJsmeDK1wBGdMCvmFBr115NmN8iqIZvcF15ZVdb6OsbeRTLCRvbFOJsLWYtQ5MIoA5f1Mx1TB1EgtItb9gl3mLWhW34WrocF1Mz4YJFxwsGqLo/TG1y+7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081738; c=relaxed/simple;
	bh=hNijcgnkYPKA/7wrNZ59fyYQzhIfXIxHB80FcnuTr9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3jISzxzewQeRoS6NR3hHAlAfDXtHCwCfm2Xt3IoxF/IhDoxfwgXPPLLQylb9zOHc/qL1tFE7SZCntnNiWSOnhy4D7pDzQl4bvTw40GujvdDgYmn+Oj60J6nR0nqu682rMkGwjoG16flU5LwMAhh/rCsfSjgTY9imzvNsqcXcE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpN2yX1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQHRRvfV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpN2yX1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQHRRvfV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnbc530869
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyYyxpnmdWgua+0JKg4PJ65ICvAFQSBiyXY6KNTh/ro=; b=SpN2yX1z/z1L1wf6
	bUOtXfSSnjkphH+T0UHY7+r4KkyO6OX0EZ/EjIzNP54WdymfFjQbhhpeGsDgTPR4
	iXQEh1yVoKjUnS4ngOXQHECyh0+F1KusGKDma/B4YGdFeJCA4alS9/RpT4VeUPpX
	VMbRr0IZAtP4QDBxB+YZDy1Kh26xJ1iU6eX+ExRDbdQhaUnp3ceZoRxvONcUElh4
	YfZGNGEZ6PtUoXquvxsRStP4zXtWt2nPyUbmz8rBDbgQ6+MGNbLnSETbeHCeak/r
	2am4Ewf0wMNNe3SDXIDK3IHXhRTqXQBmacJzxuxjDzpPtMKBWPQxjLYzL4kd7Weh
	jGBTVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1n3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:55:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517741bcc53so17830211cf.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081736; x=1781686536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lyYyxpnmdWgua+0JKg4PJ65ICvAFQSBiyXY6KNTh/ro=;
        b=LQHRRvfVIYXsQzLoUBp5XQMc+JeD4AnFM/+afq8GwuGWvLDCuuuAj0HGdxKde9t7oR
         KsUTtcv1fqA681ivIlWPn3XYLKuMxxpQc9iYQCtIPvIqqJz/zSnSwtuNLIbTs84vRgxW
         QTXqUPKVndBoiEOUlPu+eN6E7E7HZVrmtMsB7lRtAZhNVMKG9eKFyphgaauIOVU4Ib6T
         B2vQRToLq3IDtfTJMwC/WbsF6TvM6OirwrTNV5rkfWMLa9oS1x9tqhdeygawgxS0J5aT
         99y+glNb+je6tx4jPon3LBXfVzZn8NdKcv4ghbDW2RDDVl2N0zXpFwhRAlnLN1/5DqPM
         mneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081736; x=1781686536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyYyxpnmdWgua+0JKg4PJ65ICvAFQSBiyXY6KNTh/ro=;
        b=Ne7FrHHjmLZaAu2m5WW6CHO2iP1unipuQ2bhiUXpyFQFlgZkV6arlt6EpLJxmH0jEt
         Iob2K4emWhKzAzqA4ugbpLZWe+usBMc59GloBSI6G9+gJQwUZf62z4GU5nxTMImvT0wh
         4Sgfpcjm8faK4UwLm1BHyGnw8z/iogK9wTRB6ZqtWl61YaQQpSR8CdUsm3Gj8Wdcm2IF
         XgJDU/AO+f1yn3QpdMObIf1Nl43YsgedxIOUglq9FKlIjUnFbyLuc8f7ev0OdQLDaDFO
         SE4U2rAtSUWOrBSow9VHBhnh6T1TRhZSJx2GepvspmK/jqzUQKAmeOYWX7wryq2JOXj2
         XlNw==
X-Forwarded-Encrypted: i=1; AFNElJ8HtvO40hRXWu/ZAPyuK43EpmR6+9keHVqqHaNDrdYg6Cu+8S8gPNPJPOvhZ06Ye/1TSTYqN5MMudld@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SQ2FQmL1UYzDCQna+kjZoyj0DgqGoUJ5sx6Ztqjz5wY8lnhF
	RL5CQtkNFzGXx96G1MA8AyxGPXlob1pg0eEiKoqq0WpSGyEFcBnm5BPVRE16VKHzBjEb3lRQkwU
	Fr2TjR3ty0DnTH0VUNgadpGg5Pav9XloLHMmhODDSiouvs39hBaFb8W5g7245PM5o
X-Gm-Gg: Acq92OH3kyJ5c5hJ0oRwqNF3duPgMkA8umxKfgb3rkckxVAIYha06Vjbrg6xFMhABeG
	EEV1IEGXdGVQw26b4yzmhkec1LL/ay7P2FIUQs3+Uy300ZJ/ku3CHYkY2V0hqrDXPh/kkB7OXu5
	kXjTeF7wu8Azfo11SxSpYrRu4/7QXPozqtueBWThBGwLCxIQvshgH5sggCsJvJ0Vdo6JXvTOXUg
	ItdfbmQDXEgc/wTtUz63QBfZB3j66yA/1dlzK7nnxOLpORZVgIcazk4j9IwZdw/yb0A3ODJezzZ
	nONf737SHl+iaMReGUzAhTelm01PTplFa4veyex10sZquEC8RNkUzX8fzgRsaYwUy58A34YRKOe
	rgk8+zwN9jsZa1ilA5OR6WbOjEeo6I11L4FWkGpZFQ0Ugr8qdor3xYl80
X-Received: by 2002:a05:622a:2612:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517ca3313e8mr60735161cf.2.1781081735748;
        Wed, 10 Jun 2026 01:55:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517ca3313e8mr60734891cf.2.1781081735237;
        Wed, 10 Jun 2026 01:55:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176e1b5sm1154737366b.8.2026.06.10.01.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:55:34 -0700 (PDT)
Message-ID: <39183dc1-5fb1-4dc6-a17b-e5aa48138602@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:55:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
 <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
 <9ab1340d-72bb-48df-8784-a584a37b5c76@oss.qualcomm.com>
 <91117dd7-91e1-4c1a-934e-1b6717698377@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <91117dd7-91e1-4c1a-934e-1b6717698377@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX3SUBGP1ezPBn
 sSdiPdF8iVKqCmI8Idk51XJPaxYGqSagLrV1N513+rvnxtbDQqXdW+L/OSZHTTgCuRy6fdbPCGx
 J2oPC0amQmxa1/I+2Dl9z094MN86GbUVoTxsIrN1Ox7ccL1zeJPKPt8029V+6v0w6eRFjNpzetH
 yPIFhXlzgCnWtVA7uSLijSlwfiMNoMnos3PXky5YBK2aiWIIfTzRjXOhX0WGcqVv/lsfy1tWn3m
 1uJK/Xu5UneGmH/w0ZWE6RoQ+bBY+dkTYj1f3C1E220YY5SwTxsBz4DdAE7REpXE1K1+BZ3kW5r
 HcmGGTMvR6jds8BWsFKGy1RnTxjyhFOLA6NO+ksrjWt1BX7b3owAoy2LU0LxGBR0EYuo1xg4zD4
 2ADv97ZTNGaBH3dFUd2Qu4JLc1PjqHwYvrGpRYjAQQBtefJOewwt8voCa0oUuDEQhwJ3ul8zSUb
 tY9CmuZI6o4PF/E+VDg==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a292688 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=3wsk7ZOv9uQ9785ZvD8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: lukijX84OwrGAVDpjLnQpNPEqBDPvbBd
X-Proofpoint-GUID: lukijX84OwrGAVDpjLnQpNPEqBDPvbBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

On 6/10/26 5:10 AM, Jie Luo wrote:
> 
> 
> On 6/10/2026 12:59 AM, Kathiravan Thirumoorthy wrote:
>>
>> On 6/9/2026 8:42 PM, Konrad Dybcio wrote:
>>> On 5/21/26 9:55 AM, George Moussalem via B4 Relay wrote:
>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>
>>>> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
>>>>
>>>> The CMN PLL driver did not account for the ref clock divider which is 2
>>>> for IPQ5018. Therefore, the computed rate was twice the actual output.
>>>>
>>>> With the driver now accounting for the CMN PLL reference clock
>>>> divider (commit: 88c543fff756), set the correct reference clock rate.
>>>>
>>>> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>> ---
>>>> Changes in v2:
>>>> - Removed line break in commit message between Fixes and SOB tags
>>>> - Link to v1: https://patch.msgid.link/20260519-ipq5018-cmn-pll-rate-
>>>> fix-v1-1-3c83a173c27f@outlook.com
>>>> ---
>>> I have no reference for this, but I trust you.. maybe +Kathiravan
>>> could double-check
>>
>> Thanks Konrad. As per the HW doc and the commit 88c543fff756 ("clk:
>> qcom: cmnpll: Account for reference clock divider"), default ref clock
>> divider is 1 in IPQ5018.
>>
>> @Jie, Can you help here?
>>
> 
> Hello Konrad, Kathiravan,
> As confirmed on the IPQ5018 RDP board, the ref clock divider is set to 2.

Thanks

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
