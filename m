Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686534B68C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494221; cv=none; b=ku7lPXe4i7H7jYoQFLtDKedBKB4vaXKe7+93vvIbp5hISe/C1ISTEQotDMIrvGPgwVQcyyluI7hSBgQGlzGkJWT5Nh5Xh9FnShtaxbZ6gTsV7Jr4eg1mNg8dkCCSXNjadorD6vBo9Jo+YoXV6zqMBdPFbJPE9stVphnHfymVgQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494221; c=relaxed/simple;
	bh=X9sORV/wiiGYQHAzTx21UitHqOYw3XUCsUNB4SyMAlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAEp2h/xEBh7RKS6zeXnEbZaleIq6LL26vuH6oCpnxnNL3MIvNkPa0Qbs3OD2gY+ozufoi9J2Y8IZB5grZ/hshay9YIp/nm1zKc9iM+GZCDes1Zj7lzyPJmBCLXwxLAwLobTRcAC8eFjSl7LhZRhAoLTosciO0V/UdUZlXogdTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftmuEuhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRJ4tnUG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftmuEuhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRJ4tnUG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8I7et1850699
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=; b=ftmuEuhbOoUoXqtQ
	6jYtklWke3lpIsk/h2tu+2yTOl5LVm5MdjpfmNjoIU0865dgsYtDcvju4/WOk3wX
	qoex1B9/RE251StLkhmk4hUxfh2JJ6B6CbWz2FkkY2lyt5XGpj4mlFJvMR/HjeU0
	s9Q3GxU3jPSlZH2ICxYP/fx0LibuYYbtDkUre+sPAicMK1nkRXVQkYFtwMvvDEKE
	LxcDnFpgaKHPyC+xUZedYnrXmf03tsW6WoM8NH5/fmSSysKzBcZCzFZPjoyF8nNH
	Rw9UTFBRR1KdGEfcYwte40CAXMSWZmD0WLVWaUmI+hEI4SCXuUwjTJ5AfCG1K0IK
	u8k9iA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3bfvge32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:10:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c709551ec08so5072188a12.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778494218; x=1779099018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=;
        b=cRJ4tnUGmFmF0ph5NEFvvMNKt27HcI10vdUkX8ojwiy3+NkIB1O5hsVk+jXjEl0+na
         2RPkYP2fFPBTNFee9nXG/cjWxs44xuiC84YN3a0njBs5t2WuWeq19Kj3J+f+qqS9dspr
         RlZrvht3WKziaX1jT4YMBmxOgeXOJ1B3DP82sVTkhbfJV4MOYXbldgjFJTr3rp0AsOMW
         Lz6CX/t+xqvlzjIS2VjjxWDv4u8tWoqK+uTYDffuZoTmbE8a+T4LkZkwkK+iaCf2s1Ee
         HOmitjMKVShvNly8+wcyceCvmOlHTe/b28tYfnOqrmxNJ0Wq00WXx4H4ixXutCc226kM
         F5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494218; x=1779099018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmvXZ5t54tW0Dx9vyHqx34Lxx4w7VRwNX+TNDvhocGQ=;
        b=HDfZNLT8aeebMW1vp2bjqxbBAgshWWTyjaXsCTldcDPwW7QuLioHnOr5Mw4HrbtAzR
         drmCP4V3V2htRezZYJVYZb3nXSy9sn5dRE83fMo7ITTS/2R/7Bo8TbbNS7NJph5aheKX
         Vyji/NSMCszqQZKZc7ewDHNOM6JA8ZBm8lLHgVAuBAmhn5PBrikcRmM5eF1hvc4TLp3e
         BYqrOCztElGyXqKNHszfxv25nYc1s07WDDFklZqcpxPdG9XSyEdusea5tM0Qug2uL6zX
         EsGtyZWCGzsg1trs9hGxOpsptEjP9B6lWnsBjaOuU9JvubC2yjUtixRk5aG2dqbFtH/2
         mC+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+znj+ORJ0dbYtHDkMrzyXJz6aDkm886mRnIg5Dh1uNaG3POmI2eovoaSarBTmLeUN0Gff/wK5o/C5c@vger.kernel.org
X-Gm-Message-State: AOJu0YwM70YkAeYQU34X+Z6k5PeJH57VrNhYKaKCQSKyhgbP2PCF7olJ
	ms8Uf/dNR5/bED4vvVeZsgROQb7dP/SwxBbbbEy3hFIq2tLhVYu9vjNpjD5rmepTDj2KhOKvbDT
	mbTQ5Pz0Urmnz4DB2PUlBKEcjAfEzna1gEYhWasUGUFv4J8S1ro7CJsiZj8fj5Jt5
X-Gm-Gg: Acq92OGCgZTKxbNX+PpQYfMd54VSchSQGGjEOh0yY9J41o+LdhTomgob7sDEPCOuiFv
	psZkK9sliDqgB0cgeGNlOTns+yEEPqcjhs5sMGgD5wqtdO6Au7Qmbei6sZ8onDhd0BlIwchk6qQ
	uRWKFfL0Omq0sCnIl2oupoh5mOokLUzsDMq/Fj5oOprHYwfusBopluuCpb7IMeMUZCauryX1CZI
	kvT6k32oMPnk4vYT/t3gtW/YfYJaM/eNRZDDi4LY4djPTGg2EUemLvM+tPmAewetdf0FJQ29+AM
	v6wm/0bVEDOQiWWLP172y8LjRmwpVok5Eme3s77ndlh2J8ex/HLLeniAwUdS9k0Ix+ANwmDrsS0
	9H3HgQDiu+jEekKEgjDT1ziSdFuFShit56TXT2OCsQRYdMAdhvBu4awOYEl5gm2K9Ion5ALuoGK
	gbB/IMJoNuXA==
X-Received: by 2002:a05:6a00:6d5b:b0:83b:a723:d705 with SMTP id d2e1a72fcca58-83ba723e347mr13846782b3a.16.1778494218384;
        Mon, 11 May 2026 03:10:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:6d5b:b0:83b:a723:d705 with SMTP id d2e1a72fcca58-83ba723e347mr13846747b3a.16.1778494217917;
        Mon, 11 May 2026 03:10:17 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a103esm25192471b3a.51.2026.05.11.03.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:10:17 -0700 (PDT)
Message-ID: <684c63eb-26ed-4cf3-99c9-bd09ae05b5cc@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:10:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fa4HAp+6 c=1 sm=1 tr=0 ts=6a01ab0b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=nTQ8HVyESOUA6E9D-IoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: jaY26ItQVYS-qsNTiWphq40JFmX7YKyq
X-Proofpoint-ORIG-GUID: jaY26ItQVYS-qsNTiWphq40JFmX7YKyq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExMSBTYWx0ZWRfX6QE4Vwx8EVQE
 Re37zg2umHkwJ5/TcsaBU4lkZNn516u0lQAXIjeLx4On/ZOqXAyVueJAT2/0M4RqDfjIDAEVQBy
 6j9XpVi7oYocj6rfLSUkKzzP+gL3I2+GhUw0OjJktDFbREEF6PMMwxF1dClf4i38gfa+yeKet9j
 htR22QnsYLDVvb3P3wUE2zPDk95jNVqQMJXMVXGFA8iSprDkO+NqTZ5buUPwO3EALzOK32dyqIC
 BfjDA4NujDQ8ASOj52l0yAxK1VWiGJCUAcL8nsT2pp2XowWv6jK2Z2pvJfRVvuAkeytxt8NfRPl
 qAwmzqqcuelJCWOupN9bz7X0wEXkVVqhfm3QkwYDvZYg/NzvEWx0tZPgJvq1Pw37lTcEludqgtP
 IqeLYXaOwxnWST5wggGvcjMjChXDdzfv8+STLAH+fi1pdn2sXerJRWHPOQeLYdQQfSnohIO0EdB
 sMfLEcvCN+6xzUTyNuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110111


Hi Bjorn/Konrad

On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
> Hello,
> 
> 
> On 04/02/2026 02:22, Jie Gan wrote:
>> The DT‑binding patch adds platform‑specific compatibles for the
>> CTCU device, and the following Qualcomm platforms are included:
>> Kaanapali
>> Pakala(sm8750)
>> Hamoa(x1e80100)
>> Glymur
> 
> Given this is predominantly DTS changes, and there is very low chances
> of a conflict with the binding yaml change, I would recommend this to go
> via soc or the qcom platform tree.
> 
> For the series:
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 


Gentle reminder as Suzuki's proposal.

Thanks,
Jie

> 
>>
>> Since the base Coresight DT patches for the Kaanapali and Glymur
>> platforms have not yet been applied, I created DT patches only
>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>> and Glymur patches once their corresponding base Coresight DT patches
>> are merged.
>>
>> The Hamoa‑related patches were posted in a separate email, and I
>> have included them in the current patch series.
>>
>> Link to the previous Hamoa patch series:
>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - change back to the numeric compatible from hamoa to x1e80100.
>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>
>> Changes in v2:
>> - change back to the numeric compatible from pakala to sm8750.
>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>
>> ---
>> Jie Gan (3):
>>        dt-binding: document QCOM platforms for CTCU device
>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++++ 
>> +++++++-
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++ 
>> ++++++++++
>>   3 files changed, 340 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>
>> Best regards,
> 

