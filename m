Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CBA3CAE74
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033742; cv=none; b=GEluTHOALhhgws7kiSYriEN7tA2IrKim4IbToudOkNX0fGsdBgbuX4ttZP+glqJwi/P0+cUIcVwqBsSkdktVsX2RrbF1PcKN9Py6txCRPtb8UoKI3xPEJORQ8F87R3SF4YH1QbrC+G/FbE5Ed1IkZn1ucMAS5cEBOSPJRxfHTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033742; c=relaxed/simple;
	bh=uKuZ10FzN1B6RsuxZLoalMZv5ofuEdcyCvW+MB5LzYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuzpyJTuyKoCdGgV7TzkAK2KbSQt4knvjrDCX6a+9n2Q0m2V7pRtJBPtsG2GB/p1KNphCDHb7Z0MJRJGwFE0QE/mrHexTJLBb9fYs6HcAqKnwvvk1kA2cwSLO5Hf6ne8VHEgN+fuA5fPgyAT3f04uPBYn3XWVkFT/rvM3tBkZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epN87TOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPGnIU26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epN87TOT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPGnIU26"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAivK71959520
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llEIp5fqwyaBtRtveOzWn174fewDCK2wqKtqzpu7duQ=; b=epN87TOTCcOeY5MP
	eEI/q95jI5CenddvdPQeuD9h3drChkEqUP+7bXNAKsVu54NvFuUuxbx7aotXJyW0
	20Pe/S/9GHlFNxjjOyoq848MUz9bNqQsnNmQZjS+nMjL6TtkLRo1J5SPyNJ47TwA
	KdCYU4EJYvy25ODcUGZfQqooqBwY1o72PCA+YbcYjoviTeAiSTAyr9tRAdsMr/EN
	sz62+QxH1mtLkxLiWlRZb/uIVtLh3QYvW6R+N8BiR4exXcKg/UkH1m/bfARTNofT
	6PP85PdUskYXRySWvyg74vobYNE/xMc5p+UL0+fIVMeB3Ywcsm5p7a1PLm4G+7z6
	rtZtvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrhtbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:28:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e8fc8af18so601964a12.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033738; x=1777638538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llEIp5fqwyaBtRtveOzWn174fewDCK2wqKtqzpu7duQ=;
        b=BPGnIU26B77CZNKJ0JoecieNVdVr/PDkGU+XE51CTwfpOEms0pVhSCfCll47TUP++P
         0ueziKM83ECsPH2Fb3Hcu20/myhhl34JKF2He/XD9J3RfSYqPCbU1D3xX6y5x2sOsEQk
         Eb2AQxq+9sMWRNJNZZ5N9TiIK4c5GwPIUd8cruMf0b1/jKrO9xFld+MpgOlM9JLLp1et
         14EhTSQl+yQWKQWvm4m6HNQuK5Jr9siJHJ9b1N+c1u1f1o2za3Xj0wsQWZRf6ziDyliF
         hVjFH3+AZY7a0f86HPQWtAwG4Qq1NrmOLI3eJ9FWwZvFE7wA/4QuTRnVXDJBgttmxN7I
         2OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033738; x=1777638538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llEIp5fqwyaBtRtveOzWn174fewDCK2wqKtqzpu7duQ=;
        b=mjqsSLoriWJACj/C4D9lTMvtgrad5tOieurjP08+hgEvteygEV0d9J+UszNnV9DU/S
         3qq1S+lns9TQZTSMkhIAGIWv1gBQ7X9ONrARCuToPpYB5aRulGUIQs+V6lCZfcKTZB/E
         jiICuAsPMgdCGTQ7ljQZ3bbSH88bVc/Dag/q9Lm+jOkj0Iac/V8Uo1DdYEG6nET8tMXi
         OTUv5t6XoUuTEONgXJSmSxWyOduAj+dhTVOps4ss7gV1QQJDU3rorqUgQs4gCFyrSIWZ
         4LS6n5TqmDTxAF4QaKbMRiU1C+/P5nN9wFMDr67lmp5DcutLUnRvFSNlstRewF4kgfAE
         I2HA==
X-Forwarded-Encrypted: i=1; AFNElJ+QGSJjWZ+DFWCez6C/7FWbzYqJFZp7TJ84ywcT+m7V0bVKy9DDKkvLr5SyhZj430Xrx4PEMdWmx+1X@vger.kernel.org
X-Gm-Message-State: AOJu0Yymz5Jr/OBrz43HbhKAChJmll0s0m2/8Rsj4Yhs4XMTI3QdXkss
	I5OWLbcIcybVDTqtRVlqtT1d13cXydZQzYlJ0VER8R1FA9P3GEeX21F8+Rjy3k2enCZIzycIjuk
	ThmQcTJ2ZsvoNb/meOedJ0uUpEfe+bwjVsxKqt04TCyXfSgx4eQa11rkUj2f/SwaZ
X-Gm-Gg: AeBDieuxZBA/yC1aJgjgcBsIMVPy1fajbeKWX1+StdT18oiyMK8vNvVcjGdta7MhsuL
	GzO7bVAXi2UhaIx3bmUWg7qZamnLRixgqXkXRCF+9p8wWty0FPR1NS+lkPRfXuWRhzlss0/cSBN
	AoH+oGLCw882B6H+vAI0QesL2emvuI3fu7EvY0QrbgFlOvoSTry+makB3nLH4rECzb8OsG4VmPu
	dBAhb8l7vRKP2Lt6gvKzdEaRsrIe2qJz6ZT3jmpndaEAzSFcK8405byKMzAzxIlRqFnnFLRSB+L
	WHVFN43JwSyt1+vTAD/+g1qPf8eQucfQUHTddvAKohdKXpDnznvlKarScWTRD2ZssDyoWIIcn5y
	yMB675cxIFhIP/A0lubRh5zD4T0NwPfFK6bZxqlGCV+SdJ0ABDLm1rmmNV2Y7EV4UCSG/RuH9cs
	ubYPFANr0mqNomEQ==
X-Received: by 2002:a05:6a00:bd86:b0:82f:1da:9781 with SMTP id d2e1a72fcca58-82f8c2c243emr17014169b3a.0.1777033738227;
        Fri, 24 Apr 2026 05:28:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd86:b0:82f:1da:9781 with SMTP id d2e1a72fcca58-82f8c2c243emr17014141b3a.0.1777033737587;
        Fri, 24 Apr 2026 05:28:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb33fcsm22424008b3a.33.2026.04.24.05.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:28:57 -0700 (PDT)
Message-ID: <2f830f17-4bc5-4ebd-a66b-8068a14a871a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:28:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
 <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
 <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfX4pHm/Q+v9hVw
 nyi2VDPFjzC2aakR8SbJObLwabjOa1AID33nXLnw74BRDQk2g1Uh0YJZvp3r/hxxhGozMN+KQBf
 5Zz4nT0bSqrs1aXZ1o/97EUuWu7YzUuAw9VTIHoNBmCVC8S+yGOdJTIM2zLQYtdedh6dTmSVYpI
 FyCZgGVSYVX4h5vUDIEMsActBCqO6FyPnexScah/SK55bM8rkB5SL6XEMr5Z6eCvnA3uFDS6vJl
 hiG1OSEihRpP5UGpEaNwZIVm8pHz7wKaEEnuNEZE3Mau1NtwaJUjRBTqUity5/Jrxsu9Qk7556Z
 MNb/qNiZ5S8yV4CQek5E2Su1BzhjaeHaxHq4cCjaZfP8eKVyUd2WgceplOdiZA58HPZnOs9fLKe
 +0/Gj2eGCHsRjzUANFgQgSkyVjrEIiooO5MadKTxx+B1THvAq/moTwYGVeu/bZeym/cHW6YbTa+
 LL+A4O2/1xQvbJvfGRA==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb620a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KYwSRLHedoOKSWcoqLUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: RuF1zd479ujkcWy4oDnmV1O7Az8-bYKt
X-Proofpoint-GUID: RuF1zd479ujkcWy4oDnmV1O7Az8-bYKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240117

On 4/8/26 11:47 AM, Xilin Wu wrote:
> On 4/8/2026 5:06 PM, Konrad Dybcio wrote:
>> On 4/7/26 5:20 PM, Xilin Wu wrote:
>>> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
>>> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
>>> Q6A.
>>>
>>> This variant enables the LPASS blocks and codec macros needed by the
>>> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
>>> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
>>> that the audio hardware is owned directly by Linux.
>>>
>>> This DTB is an optional configuration for systems booted with the kernel
>>> running at EL2, where direct CPU access to the LPASS hardware is
>>> available. It is useful for users who need low-latency and fully
>>> controllable audio.
>>
>> I believe on Chrome platforms it was done this way because at some point
>> it was determined that they would specifically like not to use the DSP.
>>
>> I think this is more of a hack than anything else.. but at the end of the
>> commit message you mention low latency - is the impact actually measurable?
>>
> 
> Some of our users also specifically prefer not to use the DSP [1] :)
> 
> Based on their testing, the AudioReach/ADSP path imposes a minimum scheduling interval of 10 ms, which is much higher than the 0.67 ms they can get on a Raspberry Pi 5 with direct I2S/DMA.

We passed on this feedback.

> Since the lpass-cpu setup works properly, I would not consider this a hack.

Well yeah it works, but I was really hoping it would be made
unnecessary and available for removal sooner or later..

But since there's a genuine usecase, perhaps not.

Konrad
