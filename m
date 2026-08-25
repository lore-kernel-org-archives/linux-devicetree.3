Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B783939B0
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654155; cv=none; b=gYVjtcxw5xTW4Hm8q7dOgqq/jfUaJ4iXws8bofffeNmbKKcSCFZ3LBbfhDn9gsEp7ScaPE12naw5rjwp36iQrf7wDp+sG26MMYTyZPE1HrRFJNNxGt8oXYd1X7atmIIm3K8wpV/VqY+1LB7jYrGYE5ftOIB57TVLfznmsWzBUBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654155; c=relaxed/simple;
	bh=DfyVBN56e2NqPZWvmOnCCiUB5xG2xPKXSlt6DQy7tUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsYc4yxScqaHqipvmDSh4FiOu5B7DUE6K1Y+Bwq+WtVqEDjDZYemBA0uWIrX/BgF3DL9v7CASjSHqmLxnFJaN5UdgNV1AJYgGYR/PA8NTFl/Cl9xqvot38M2m0E+WmW/WUVGzhUIu8fI20gaYV83OxtJvipqiEepxcAiaAO+kNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH95ZmWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7YeByVI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH95ZmWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7YeByVI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88Dl81934789
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yl0QksLVyVsTjDDZ0w/DwLlXDR6Eujjgayv0fISugvA=; b=dH95ZmWnEdI6Gjju
	+GkgT6VRYbp2Sjz5518/1EMoLgl4kul48SA4WxbLfl56HAnB94A+cBDpHPAZVTeQ
	fUToiNw+8fawFtDTCRaskxWUQ1rXPRIcEIfgu42tvAfuoDd0Oum4ZZ7Ppd2+kZPV
	fBDMLKbE8gjFrCkXO31nw6MFiBt0CfLjQ2Cm+kObWycPOBVf15qFd50/8+mWi3+T
	iaFUlwsq/Pa03BUQFMkt9HLdK1bN5HGkW6BBOSZogoFEz6RYtTpisDZsocN2JZvn
	A1bRrNVqjxktK0nW0d3MT0ojcyS3PnNri+UDa+5YxskbmPlrPu8t2ey0vp8/9bK0
	GUSCrg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqsqbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:35:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso3309441a12.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787654153; x=1788258953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl0QksLVyVsTjDDZ0w/DwLlXDR6Eujjgayv0fISugvA=;
        b=S7YeByVIBIXHZe9m7b4XBpAx6cL+KB74aLdAZXXJ1R857R3bU0hkw81iu8cyRU5rBN
         a3m+6THWxmKLsd50S+6PCuGH2yiAvoI7u6kVI3Tr5hsmt+VoraCkP0ApWbFyNnlibsCb
         mAcWfZAq9+ckeAcexUCQIzZwuvc2hr+LG7FnV2xQ/mZM9X3+E1m8jcNcKnRgCOKLdI5z
         ouT+xz846ovQyHRmlTaRxVGUBVey6yELk+hKJSkjZIIeeDuCpKdR77QPzdNKaILu2ZJ9
         tgxgGOqvNRUw7swmhh7+P3J0tm95pfolOAAUE6Rh1lHGljo8ZDThQjAGwoANaptKVPpT
         bnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787654153; x=1788258953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl0QksLVyVsTjDDZ0w/DwLlXDR6Eujjgayv0fISugvA=;
        b=nm6ATmvDkeovI90gtR68N+MR3AbD9CRtj5srvRVejYN1BrCWgUHGs7HwNNl2kS2k4f
         jW5d8UIAR/ZxqFIexRLfWM71KEI8G7nLrpoF8E4Z3NVvCE34ClXfLmXd2LGqB84PMN/Y
         5qNsLxBVVqmYZMtrPKuIDsXVl1uJhgGVqjtn2vNVl3swwE9hdLFwHEuFp2KeG58rKN0a
         /WmtYYtt/+FUB9j7JaxHS/FmXGoc2smCufyzGtAQq/Ja85neLrH2jSfESjyA/ZzwV5W1
         nO3dECiz+FoJ5v2rjZWYl/iWl4Svpip/dk9+aXfPjCFB3BxVhI8xzKgmXOQNh9elPc2J
         QkjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9sNET9ibliSnjqCBAYxTxOUIbdgw80VOXY7OQmyzwldkzCeiPGdsdE4ekvltaZqLp4Nd7NBb5DQqT@vger.kernel.org
X-Gm-Message-State: AFuF++llX8fOX/Mp2i26lPycrvLDS0uGtovTMhoB19bSIFso1kYT4rfJ
	hL7zZ1jYA67t9dKtrAIdaG2YSWuu0kJGBYXaoojYCUOzvo2vzUwgMpchgl6QxVPz00gJR+qWQCp
	dzqSIvGfehsjuZhahNGmoECb9lyguJx6eKXXHoHF5Fb7Q4mUbZWmbaCmyxRRl7aCS
X-Gm-Gg: AR+sD11Ng5wStB/YIR+LQ66YQE1aWi2AN5WleeCuedmruLEGO33jrcm3S1M7aeWeY0c
	7ck2OQ7PqG1Dxbzl59Da7rEVDwE6u80c+QS28pE6cXkRsKR+nOqd4MNHYr6CS0u+0BgBOvu6EXM
	xAj2XAvga8d5fNJ9SkIyJ0BAT+swlM59HXdZDtnd6s1NjlKmQFTs8a2LvcrnEuQI58j2h9MHBny
	keihW+UYSyvH8nSbkr/0kWaakU8y8z7srHI2Nh5PrkInpGrAuVABXRsozno44rY84/SPdEvlFbz
	EIB8GYdrPX2kmLDyP/k9DDpfz3TA/a2DlrpK3WAS8NpwVCCPqvA3i6/mosXhoMAVlbmru3A1WtT
	37f1so+c9SMBaxiNFklwyrLdPwcTvTgM=
X-Received: by 2002:a17:90b:3805:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-3964c6378fdmr7844471a91.11.1787654153003;
        Tue, 25 Aug 2026 03:35:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3805:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-3964c6378fdmr7844389a91.11.1787654152532;
        Tue, 25 Aug 2026 03:35:52 -0700 (PDT)
Received: from [10.218.21.115] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm3259881a91.9.2026.08.25.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:35:52 -0700 (PDT)
Message-ID: <92bca6c3-bf00-4fcf-8fd4-5808f883d97e@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 16:05:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
 <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G3iQl9My97V9F-xcIOiJiUDzarwN-RxK
X-Proofpoint-ORIG-GUID: G3iQl9My97V9F-xcIOiJiUDzarwN-RxK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4OSBTYWx0ZWRfXzGWhjZgLKIPp
 MtnDDCKz5walOjdV5k3FZFh+TDPsFXW1fJjkHzRXa00eFp6o8A3Hd6PrR9zZooK64Cb0tyl8/FI
 Y2S2njGqHWXoCIjRNeBcEh+nXXGl4y2uHO9CR/ADJd+LUyP6aQwgt2AXUAl1DP8k+t1jg1GPMo7
 Q66so2NblhG37vtpj8gX6+HYC5+vddFzqhuZ/tXojyY6o108nBUpG3H4CCGswodrf7eHMQBYXEM
 zOsKaxRNzNk4Qc7KJEXOBJ/MwR23ULxfWfvMQlYGjbuedTAvj8qnmvFnCNgZ1rhGvPrVVpScM+W
 uqYusrPAZiqXQ77XU6mW8HX+cY68a+3GsFWf3fmJ58ouhoBUmcNO64UjZxD5sYZLmX6Ikm5S9v9
 ZCNpyMXsGJGXU/JPnDHv1eqKtk49bz9tJP427XUFYd+5zm/M6aJXIHD2MHPBlZdpesSoLIQDGvl
 BDZzekWMWjoscrQ6msw==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d7009 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pIAKJmClMoa1dPgAgGEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4OSBTYWx0ZWRfX+9N1UKfQ3XZq
 5dmALP3faEQiznJgGyoVVgKNIFZxyJ8DTqbudAjxr+P4vumQSb6wfBNLAIobaZYH40HhDY2z34z
 NHnlVsNYvcnxTZBFhxYY59/QqNd8Wfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250089



On 8/20/2026 2:52 PM, Konrad Dybcio wrote:
> On 8/20/26 11:16 AM, Khalid Faisal Ansari wrote:
>> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
>> connected via SPI5. Enable the SPI controller and add the TPM node
>> with the ST33HTPM compatible and a 20 MHz max clock.
>>
>> Depends-on: https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> This is not a valid tag to put in the commit message
>
> Why haven't you sent the two clearly interdependent patches together?
I referenced the SPI5 enabling patch because the TPM node addition 
depends on that change
being present. I had followed a similar approach used in an  earlier 
submission
(https://lore.kernel.org/all/0afa55d5-20bf-487b-abe0-4e2126ccf453@oss.qualcomm.com/), 

where the dependency was mentioned in the commit message.

Since the two changes originate from different internal ownership areas 
but are functionally
interdependent, we have been handling them as separate submissions while 
documenting the
dependency between them.
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
>> The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
>> connected over SPI5. Enable the SPI controller and add the TPM node for
>> all three board variants.
>>
>> This series depends on the SPI5 node addition in shikra-evk.dtsi:
>>    https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++
> Turn this into a single addition to shikra-evk.dtsi
I intentionally kept the changes in the individual board DTS files 
rather than placing
them in shikra-evk.dtsi.

While the current EVK variants (CQM, CQS, and IQS) all carry the ST33 
dTPM, a future
board could potentially reuse shikra-evk.dtsi without supporting the TPM 
hardware.
Keeping the node in the board-specific DTS files makes the hardware 
dependency
explicit and avoids enabling TPM on boards where it may not be present.
>
> Konrad

