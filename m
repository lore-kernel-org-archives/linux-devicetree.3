Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0E531AEB
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906573; cv=none; b=DsrFVzBdG1KQgJsVGIselvM4bvg3cUfzmsr/gWmHuksnJlW6iEzjG2fIMGOTXwv1QPLGT90Lfh3dJjZqSjnKdr5dOEZsFozbCL5g4drW4MSbCo6o0SQGuyhyI83uJdyZqypCSnawYku5pfitoyUGe0ebiJH9vYV9uYHPA/7RFj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906573; c=relaxed/simple;
	bh=b2JGE3Wc/pnPBuGxto2Biq32yDH94ti0M+PIkBvUGqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nchwZgY4AUscxuHsBTX78PTmVDWx5OpkV/0J1HTFKsdmCJfYM7a3OQ68l9+nKVDmUiI6HLRae+01CTGMRsw8QUhCWMaEc2RgygC3bH8xtnxj995GQTHTt1bHJimnD6K3t2CxcKprfTXCfJKgDFTHs007pLfllv2f4k+eCn4P+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blQ2afTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhgEh8JK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blQ2afTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhgEh8JK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3r3u1999317
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sTRqTVcbxy2qXaHDYwoiLfb5eqvuCDT+3z1fXqGarf8=; b=blQ2afTqo9hiR0IK
	xN1a3rxhXFKN2//MhwFRypdUeVfFStVH3xjIn6yRWLoBwENsk5xodtBlwr5VSuor
	ygwonH9bFdxXiSWNIadMGWmnKurcK2M5OseyICqWogzpQjIdO8gsK2xgog9lwo7E
	utAmomisVHmmdpX/Wt2d1xN2UQoV4k99bfp2SvSKujEVadiUopmRGQq3Z/Afq9e1
	FjtK0z6pUhZClp06DmZwk8NF4vkM9MhAO5KL9mCgDi6ZAekiS40PZHwVTej54jA7
	lEgs8hcUPRkeEFgNBiAptU0qRMa4NP90ux7HakfifYAu/723zUKOyDIEEYoTgUW7
	N1HexQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62afnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:49:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so86939e0c.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791906570; x=1792511370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTRqTVcbxy2qXaHDYwoiLfb5eqvuCDT+3z1fXqGarf8=;
        b=EhgEh8JKkugsZPie1WeR2i/HGYrQ7GKymR+4tN3J1wMEXBzd5tDcToTMViBoL1iNwq
         ojdKw8KajryegEarnqSRvsP4CaIPxXEBvu3II4zljfH5WaDhWujbJBULxO4xTfu4gFOh
         d5MwQOicQ7e536s6UqVw1X3CgGeIZMIMTirfeGZVPAyZGk6SF1W8WYxTc/in5JQqVrw/
         pF298YfawpwBXniKZ62SkCvZtLo+khD77NaL598agE3QthlTFZ8ZApQwLCynRVKZgJLn
         VJLiv9VflBzQG5wiGTYW5azKe5RxKWnOszgEFB/3U8d8ZSyRaDtzhljoUxY7sr1jprDW
         MW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906570; x=1792511370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTRqTVcbxy2qXaHDYwoiLfb5eqvuCDT+3z1fXqGarf8=;
        b=LQxnnwk0wO0dgW7ZcyTJdhbFqmCfNxE/UZ/DTUQsA90e6bqxwtrcg0qI3cJL3jALEO
         EUEibJQkmNeaAvdt94OQ/U1hO4fzloaXJShfh24DFog0WBL9gnVfl6DtbzwChrDVaYYx
         YroOmHoa0ieQSxFNIdMXHdUE5KFUMWPeWaBYMrXN315v+ebaZDyLZmcvoUMFN1Bhj07o
         cPZOes8zkf/owlUZ5tl8TSiBZZErAD97jP9upokryAFzRDnNBfoNCiLf5g77+OR9IQvp
         LYW2wCx/q80QU3dFkUdXpL5fg5SwvHtnhJcgYXhLP/8seKQdi3a6JNTvMmJEWilkJdq7
         1r2g==
X-Forwarded-Encrypted: i=1; AKwUvByNeTQf2DrKMStcebxF8XEHxlbsASwbomTLWMDZM/DUUnCESpP1f6bS+XT09lLuCp4JcGjH791yb57X@vger.kernel.org
X-Gm-Message-State: AFq9FYKHrWB6sPPiaR6fj1svQ61zBUWKEFFKNXXq5oTlprCWkXSsj08O
	gW7LEqWJtKqVMftn3DHdjJLLST9ZTc7No/SSyxe+FM1pMGteWhDoDMPbNk4H/NxNAhWzUMHV3Jw
	O6/rXgdT1padBKbQIQTkSczpgOzSDgw+I3n/OMEFNUdefQZnHUZrZ5zaFqQ59jUOr
X-Gm-Gg: AYBFou0h1yaGy46F2bebe6MS6SjUGq1mqzd6mk8jbA4LpgSzBNoW1PQXupc6roiJ1zJ
	Bncv1NveoIdpdLQNdo6U/dxJGTHSXqfdv4+g2+Mu3iqq2rxcVQCI/HMbjvRmj8DiYHPD0Z5PCsC
	wjQkzUYp6JC31eBX3bmRRTnMrsgFmzy1h/t+xIpbeQuhRMvbyxr15fN9o/ZCremnXjrJvPerjxq
	xOD52aGfX/GG6u5w0QORFJ/LNlyTXxuqYHGUSwHePswCcBv5YZ3ydaZke6QqLOwpFAgt9L+SPIi
	rRC5RuBQUm08sajAshatBVfng1Ms/2UOWWixkfo2J6icrp8uhhO2z2R5OjC7u3pUimz9vtDOfIx
	eQwFDdzJ1Tz6UpCPfgc0fVg==
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr439160e0c.2.1791906569859;
        Tue, 13 Oct 2026 08:49:29 -0700 (PDT)
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr439146e0c.2.1791906569404;
        Tue, 13 Oct 2026 08:49:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74c48sm605802866b.43.2026.10.13.08.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:49:28 -0700 (PDT)
Message-ID: <77b5681e-21e7-4a93-ab35-15554f7637c8@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 17:49:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
 <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
 <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
 <78480c25-6d83-4e70-a9f6-826760046cda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <78480c25-6d83-4e70-a9f6-826760046cda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace530a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3JqDGoTLaDOw8MreyBMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2MiBTYWx0ZWRfXylPWFYAkP/KO
 dX9Bg7rPu2cxlURCe6MqBy85vSzzJaPoqMb9SDOyKw+goIcZYq7wH0/hMgf/IqrfphFak1L9WvD
 Sn5//xRxX7tr7XZJKRBf8QrDqTejRII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2MiBTYWx0ZWRfX4eshPUVOyLfN
 JDL0Pdtj6/6uaja9MHdbp951lUdYaKFSMkAMQkuoXWoNU6aSBXMu+Lu6AfQCYDXXfUNZXspy0OR
 RzZef/1GCh8zoMRLEwZmAsB3SU/wrFnsHNfa1R/1XFLNhitI09bEtwE0xfgtRF46J8c4Q4gY+Z8
 lxrps59HeAjz7vqPpXCu0AlHxmOhnhaYbXB3qkTpVaU20NgHh64llTddL1G8rRKi3XK2GfWmLeg
 iRo71BXeysxM3Sc4Pt8Y7+QErYoAR1ojHR4BGtPp6NUIjxs60sehYaG6rbL9itGdNQntMsd79/M
 GbtU6DtAzmSIOJTmJr9w1myCJ2d7uM5dWQaiTYnvVg2rbkXZ8oFz3K/5EJbcTTVjyCO0UkuagRI
 TqekXvgJhvfbKld59tlzDai7+MrseVz19xZO/a5c6eekpQqrCrWviuvWB6MxhmHHbZ+hMm15xrt
 8TWP3prti/4v3PQGihw==
X-Proofpoint-GUID: t-ULszNJWFze4gBo2gi1aTpXQXv3RRI2
X-Proofpoint-ORIG-GUID: t-ULszNJWFze4gBo2gi1aTpXQXv3RRI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130062

On 10/13/26 5:16 PM, Kathiravan Thirumoorthy wrote:
> 
> On 10/13/2026 8:11 PM, Konrad Dybcio wrote:
>> On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
>>> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>>>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>>>> share the GPIOs. The board has to be reworked to change from EMMC
>>>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>>>> and include it in variant specific DTS file.
>>>>
>>>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>>>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>>>
>>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>>> ---
>>>>    .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>>>    arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>>>    2 files changed, 211 insertions(+), 64 deletions(-)
>>> [...]
>>>
>>>> +
>>>> +&qpic_bam {
>>>> +    status = "okay";
>>>> +};
>>> NAND is the only consumer of this BAM. Should we move it to NAND DTS?
>> Can we enable it by default? (i.e. is there any reason not to?)
> 
> I don't see any reason for not enabling this by default . Since nand is the only consumer of the BAM DMA, we enable both nodes together to keep the unneeded devices in disabled state.

The first sentence says "we can", the second says "we can't"

Konrad
