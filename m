Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB03F39FA
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778882948; cv=none; b=kebXvDjHYfs9e58UHLuSa8cfqUSwMXRKL+vLHzoitcjkFJkSmCsocruUvmTaZ4ORgoOerNn2wg0ts5tpU/QrxvIDjbfU3UcQdvyS6qWG1oGPu4KeKBZ0vRfINPqn27dAdWIDmOZtAhNLrOnTY1LpWvpMj8kOCOU3sl4rgYD2tV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778882948; c=relaxed/simple;
	bh=IET5AU6rrRRsH37Au+nEzTi6bqMiuH7lodZQGEdsPl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLbN+Z02xO+yzlJN2cKtK38JlAYg3J4++ypCi6VR32AXbVBfC3NQbpzQmQBH1453uewbjAT/ICQsWnA4OIo+tPmqBFIy5TDbGAOKY0YoURbSH4he7VVlsVLKmZuIiUIxgC7U7RcpQazttVS41+BtkSnU918rxQs403YTqb/VT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io9+h9rw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePf8g/PB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io9+h9rw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePf8g/PB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FLJif62457710
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=; b=Io9+h9rwNtHe309S
	OVH+h6e78ujukoFG+67vJwR+0WA8GGWvkfs+CED7kM3wyT4k1v9lowfjIPwi1Zk+
	+6HG0ljCnzxDh37PtulhGakMBC3hAWzzqfiitC7kHCE0v8DGQuUOaLNBsjzd+0Uy
	tYfqFXE0S9X27qzlkI+MDCeT+hPOdA6OOb4QT4aQV4l03YH5e79XLqGMN/4p1pAB
	sRgAncfHAIY03FZYu7dmHCywYpzd1GvogS7gldtYuJEwrzQMNw31J+Np9vja47pj
	jyosMCP8W72ChGMJzytJE4aK0CiMbUcGRbLGSOjoEupsbn08EAUyxNsaOnW7tihV
	XD5tWw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6ba6g3jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:09:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso140292b3a.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778882945; x=1779487745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=;
        b=ePf8g/PBQg7UsE9819vV4XxfqtpAc2pqLXkIekwsE03yQrc2+bIXxepTe4Jgwq4UiU
         qKfdP4xM/op+dHrJWNHDFLkKHesNM6dp2T36zKuoMmYcBSnIjfPiTwn6AcU5Hrr87q4a
         agJd8MODLlaneoWFOUzdwq+YAHY+bJEcF3J2i1D45bcDD1e90SADvPOJM7QYBkxOyfB/
         bc90SHa1hzxBJ5xeM4hRr0PSiPE/bLk7F3dV1Namsv8W5J/SMk9FRW2DrElWbDs8ujyr
         zRjZDI6F0mvpWzgLkzLcBYTVweBCuYs67ezDnypY5EZEHK717N+MWJs3wYot/H6ItGtd
         rx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778882945; x=1779487745;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=;
        b=KxiGLfNgbtZ9mtJtgi5hpw1CzSMyRyZEzTWuJ7CFwSI038SmeIoUrw+P4/oBR4EvNl
         AlP7Z4AvELE6XwzUmmX/RXVjcv/PdbE0tYJxiutMOu29a1AEYme+G9HeRew+GziH44Na
         HX7glxsG6+URSmyKECCZsRM1AtoyYhZQ3OSiWlhwg1618ESwHZbd/r9RFnRR5FMd9gWq
         YD3zlb82HdCgZyl7YC+LvgvywQ82jOz4HqeRlAiHp59S2RAYElv3XeyZa77Wypeqx1pQ
         FPymunvatN6xYRLQn6/8EU2HlRDnH08ML6QBxgwcqvtNikj327bCon0ZweNhRFsO0Uwb
         8wGA==
X-Forwarded-Encrypted: i=1; AFNElJ97Nn+jdGuVZ5a4EbEhjo0HPIwbH6Lz0zz0zfg0ylOu5bpPUhHEufQHau7QAAi7hBSferj/WkoWxbGy@vger.kernel.org
X-Gm-Message-State: AOJu0YxdcvVqwPmrFahWzQl25nU1XYYJz8dKHjIw88LLSDTrKE3dHkkq
	x0uxPkpiBtPjCgZCmV0qOlm4rMV/utpjqjKjn3a/z/+6yzPrjDOzxOysOP+rLIaGnCxIDc75Tpf
	7Olc2xL1yEW5ErT98NtVws3sV99krz8PlzJxmPdKmziQe/N4znH+6YPibZ8agKfBrlbSMEPG9
X-Gm-Gg: Acq92OGtcF32/mmhgKr6oBRHEY/2yEkAGArp9zaeYa68BftkcwkJ4bfZSnqLPM5vJX2
	uRtpgZrhg3SGPb3ASgEpHxg0KhpL4dxhFH7e3uqAWd/2/2Z2d6VkD5jbX9E4/Cq+BYVVd7r4u64
	nljuWasAbDQX//tKTv67NJdRTCpnGMPV0+JkZ4f2dbSOk6mS3mZ37X1Liuj53OlGpy8+89gyhKK
	39vjF3HTFWrvO9OHVjJEbN/vPmkuEPGroj+bNeRZssbQb5If+r/pRmFQQEsv9nDn9GcuYgt6mo0
	X4MdqNrcleVRTXQN6Z3Rmk8nBMXhQorgAn6168uRSoK5SFwSptfLsrRKRsnnV/2CSVqk5oWhsa9
	f5aczTXVTOrbQyoGcoLLiINYYCFc57lV49U9/ZFjaPDU=
X-Received: by 2002:a05:6a20:4305:b0:3a8:2339:24c4 with SMTP id adf61e73a8af0-3b22ebed4a2mr6668401637.26.1778882944655;
        Fri, 15 May 2026 15:09:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:3a8:2339:24c4 with SMTP id adf61e73a8af0-3b22ebed4a2mr6668373637.26.1778882944158;
        Fri, 15 May 2026 15:09:04 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1156absm6447536a12.27.2026.05.15.15.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 15:09:03 -0700 (PDT)
Message-ID: <7d3dd8b9-8411-476d-a1ef-fdac476a1515@oss.qualcomm.com>
Date: Sat, 16 May 2026 03:38:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
 <14a2fbfd-97c1-4ba7-aa51-a07134102d3b@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <14a2fbfd-97c1-4ba7-aa51-a07134102d3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PZbSZ8FIWBWqLvZOdVfVN4_mkAnn-nNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIyMSBTYWx0ZWRfX6/B+BaHiup+U
 cYOh0jpO+ucJyEH0ngJ3NKGoTjFCiBzsf4BbFVbz3a+PXCbAhBXhmdT89+1Yaf08WJR4T+rFflX
 b6rcu+Mcghdz9B1/0xwcHP1uUNDvPKxexXPs6/CuHnKCFra77vKw2lRUKmXsXMoxzOrJv8wizOg
 +6X1rcufMDU4yAjilz7YcJJnG0VkFJQLFyyrsz1tlG+G8mp8ZCxSDRlUL1cgJZNW/xWs8DvPwJr
 g+XhAlJDpWJ+c/XA98aOzbYNINTOQM7ezb4909eC13VXK0sH3LacM8JjA0owjd7dimJsAbi03IH
 dnRk+B3noXJdZ9qhbwlsHcp2ZVAooiSoHKBGwpOcn1Q4TT0l5VHDK6Q3XbY9qgKPrnOr58ZT+7T
 b91yRR4qySfQcZC5Brxz+lu3XDXJi8NAmydW/IaGXPjzz90DlZpQGQ1NulVTrWem6MAdfX5XAMe
 uuhP4RINMPDr0mOLbRg==
X-Authority-Analysis: v=2.4 cv=caDiaHDM c=1 sm=1 tr=0 ts=6a079981 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mzNi1YEEKYKHT8R6ei4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: PZbSZ8FIWBWqLvZOdVfVN4_mkAnn-nNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150221

On 5/14/2026 6:13 PM, Konrad Dybcio wrote:
> On 5/12/26 12:23 AM, Akhil P Oommen wrote:
>> Adreno 840 present in Kaanapali SoC is the second generation GPU in
>> A8x family. It is based on the new slice architecture with 3 slices,
>> higher GMEM/caches etc.
>>
>> There is some re-arrangement in the reglist to properly cover maximum
>> register region. Other than this, the DT description is mostly similar
>> to the existing chipsets except the OPP tables.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2-adreno",
>> +					     "operating-points-v2";
>> +
>> +				opp-222000000 {
>> +					opp-hz = /bits/ 64 <222000000>;
>> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>> +					opp-peak-kBps = <2136718>;
>> +					opp-supported-hw = <0x0f>;
>> +					/* ACD is disabled */
>> +				};
> 
> The clock plan also has a 160 MHz OPP @ LOWSVS_D3 and there's a couple of
> interim OPPs that you have that aren't part of it (but maybe you have
> better docs)

I somehow assumed that the 160Mhz was a thermal-only corner. Seems it is
not. Let me revisit the OPP table again. Yeah, the doc is outdated.
Looks like there was some last minute updates to the OPP table.

Also, we should update a6xx_hfi.h to accommodate more than 16 GX levels.

-Akhil.

> 
> Otherwise lgtm but the size of the GPU region and the GMU base look
> slightly confusing when I'm comparing them against the reg map
> 
> Konrad

