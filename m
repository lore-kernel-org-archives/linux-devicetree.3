Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B773D349C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510062; cv=none; b=B4SOJrVb1Iiszv/M3x3EM6WtGcNEyEnoC7F/r4XnPpc34xX4McL+NM4N+2ZEloG3N89Pm5/le96CPXv81JxCUmlYOWWFHZC0tsmq/VmHAyCtYuXL8kwjETJRBQFesrZKxNhWBAEs7fpb/6T2huzV1NmRYTwy8Y1RhxnkgFTuZEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510062; c=relaxed/simple;
	bh=BzMsn1QlG0yY8ysaqlyvr8D0YozX9wNRuLlUJ49ZPtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3bP7tROpKBMGtf3svoH0wWcZdd6PJTaOrWzGK/MWAH2SZKa+lMR9W1BF33WTZ6LB0kgZgS0kxcc7VHUZjxDit+YYg0lKXXkh/baUqxjVQ3DL5gWNuxFxmKQyeQ1uqYtaztSWuFfEPV877b1PN0PJu+vLJ2GM2rnqC2xjpsH7lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fj2hmh1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PncA+wwP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fj2hmh1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PncA+wwP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889uW42053038
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCURb30G70qdUrMDaaA4as5d9b3CQFXvj20zxSJZ2A4=; b=fj2hmh1FkqydE+32
	UkiMI9+iy5UigDCkd7I1xOdoHBPGdyaC2vtJqcdOWTBzX15j0+NJaXXru0my0IoT
	J/8Oo9oHRe1hDB+VdCzw3Z1k95zI6Y0kZQTZH6dQx25mXRrYur9cAVJPSvNNrtle
	Zzhsn/UrVdAoAT/8jPOWbi8nv22FXkl5PWoU6XRoecIK69MMM637Rj1Orh1JMYSy
	nYriOM3ZmVs7ZWQV5P0uv4S3K3mq3Oc7cS5W1oPJbztF9DGrOJeUmfmw4ktl8HIm
	3oTQHwsiGhNP0MNicHNVbso9Y7BTIdrDOdA2RkLo1G8TSuTevaPCtSVWJetkE9Dc
	7anPBA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gag1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:27:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce406883eso6465905ad.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510057; x=1784114857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCURb30G70qdUrMDaaA4as5d9b3CQFXvj20zxSJZ2A4=;
        b=PncA+wwPkYrz2QGnfWEHfs+gSURJ0vmQZaPk+XOw1t4ubarTnwQTi6vn3lxh0VCqnl
         vrZ723FGWEFXN/WmkyLg50RvSexi05S33izOBiaF+r18FT5AEefM6PNFagp3gvAYdkKx
         HyMZABupP9c8qJBrsRXAU5Lv3xJxlVei9tem9fRpDM7q7trTwE3yPtjUv+eTVDGUTKk7
         s5LiSD/cDguQ9G8XNcnFzZtAycS/fd0qwNt36j6042CkBfE9p9I1El9WxX2SF+WzzWmT
         j3A63B6wcVyaO2oeaV1ZY9fcDCSi73t7QCtbjFHuxcqhHvAVlFQxrxqQ14CeUx6nzc96
         k8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510057; x=1784114857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCURb30G70qdUrMDaaA4as5d9b3CQFXvj20zxSJZ2A4=;
        b=nQC0ed+be3fmZNbaBACcUus04aOi/4nzxGdklGy4bZWCrl7h0WEnozN9R+eAQvmlO/
         EX0tLeIQeBySCbVLqtzjJHNgDU+GYFHa0tJQHZPbj54cOqy4gjXrK4CHHPs1QsTwnABt
         J2EBGbY5n0AtYcoXc6NEAL7F+U6X1G0nc+BPC2BwdFnYak/FmKWTI2COk5qVLdeTbWmy
         0u28dEdNJEdkq7KIHk+s4w79o7jycSeVyWNbeBpVNtzd6hemniwVi4nf9Xr4AEvEwHFh
         BEnLoRnIQulD07IxbxyLWRqXDWycz3squbPxc6i295EADVqGR3KFER1hbHh7TfuW2iUy
         5KOg==
X-Forwarded-Encrypted: i=1; AHgh+RrzFemiiw3mS1w79lki8O8qZAU7D0cGvl50gNi9+NZ/gVPHxLGITgIw2lanIom9xAkBl+TjhPXqy6j3@vger.kernel.org
X-Gm-Message-State: AOJu0YwlGrqJrgcbxrchUhjKSKfix5NO0VeToYOie7mMhy5eJO5Ac0ky
	9DuXK2l0t+vFA+Rd8vyNYrE8JdyH5WeEB4n8E0+xHx+MbIoPO1+TpZAAGPu6v7s6ETeSXovWgLQ
	ZadbGgQbv0D78lLcDMzuZFkh/3z4BauFBpRxerXVnFqPzCL8q/yXazmGr3aTI0ntd
X-Gm-Gg: AfdE7clvgM89qCOIX2dqkKwYvV7Qfc1D6nFZcsWa3Kh6ttZ4v0gDPpx+xEc5IERjr26
	i5eDbrs1xnDw/+n5bu4D3SCiGtUUfx6pqRc8B5mMtxnPWTCV4DeKNpKN0Zj9qxz86ZujjLjHGx9
	cqOIw66c64Q5g2MlBp5Vv0IDk2sF/Di6S6r0T6QEyXBrvU2SXU4Zr8uQgSE7NpgZq4E49s7tIgJ
	+BnZ5noouBYaqmAX2uwnqO/gTAUiVOFvngj2zbEhOUf/qTfQBFjxf5czj9OUxgzB2usGSsQNrrY
	a/rmrAd+rFA7HhkpHKcIB9jnvVvrGV/cfcNQJirVeVSOyZDjATueYAk7E2VN5SRQQxiBKSWP71z
	Q8X1FN+X2DEdSwdDh66owf9v8veABr2BQZlw6rA==
X-Received: by 2002:a17:903:1987:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2ccea3d97b9mr20854765ad.20.1783510057275;
        Wed, 08 Jul 2026 04:27:37 -0700 (PDT)
X-Received: by 2002:a17:903:1987:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2ccea3d97b9mr20854425ad.20.1783510056847;
        Wed, 08 Jul 2026 04:27:36 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3da55sm26512345ad.71.2026.07.08.04.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:27:36 -0700 (PDT)
Message-ID: <059f8b92-6df0-4439-b3ff-1a270b5ee1b7@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:57:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
 <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX9rvGKLP/Wkvn
 HJp0HBLDq7wODbl7byS1L+szppcIgYgdWlOJwhWtxdVQSTk7E66zfQVVTrp9JyGUgiggjmJfOdC
 Xk//g+azJmjxGfR3ohW0plV20Pgt/Hg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX2dh78uHTFC1o
 DWoe6QkOKUtuDgqj9vyE515NwPIqSb3ZGT5E0vJcf4CCtnFwplngfYt0cPTtzXiX+KFB41Nizw/
 +ewpQyf+dkFrKTWzzVpdbL5DYk05BMA8HLPXilmpM7OadtpuE3QYfgxJIWcbpWfEskEAui+xO4O
 bbzV/qvVjV4RVgvRgC+b5ldqxYH7tF7w0sur1zJPOKHZKtiT+SX9iz2jRmQZUy0Ivn38fHDAQLr
 d3ejaMvvw1Mzu8enA0wQChOWu5KWLSDC/1YHhAPAiCKD15OZWTVZw7FwmlhUnpAkNo7dO3oBluA
 hzxzlYPvREbDCuE9xzakyNS8C/m8e7xR+9jIhEoRSHV0PfijNysde9lSoyjZMmrTZSLxLWfJteh
 9ZU8t66jv31oOKT+iwI/6jpgT11BHjeQUMXYtkM/wBEObn0sO8+Stopo26EmzyrF7WzRj+LNoHO
 LNktTlbZJVICDFgvWWw==
X-Proofpoint-ORIG-GUID: X3HKcL9lRaSm2G2ScOdkP50-gtirs8wV
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e342a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=c7AZHyT8zQvrOgSsV18A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: X3HKcL9lRaSm2G2ScOdkP50-gtirs8wV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110



On 7/7/2026 2:11 PM, Konrad Dybcio wrote:
> On 7/1/26 7:43 PM, Ravi Hothi wrote:
>> Enable the sound card on the Eliza CQS EVK platform, including the
>> WSA8845 external speaker path and DMIC microphone capture via VA macro.
>>
>> Enable the required LPASS WSA macro, VA macro and SoundWire controller
>> along with the necessary pinctrl configurations for DMIC and WSA
>> SoundWire interfaces.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&lpass_vamacro {
>> +	status = "okay";
> 
> 'status' should be the last property (let's also keep an \n before
> it) - file-wide

ACK, Will update in next version.

Thanks,
Ravi Hothi

> 
> [...]
> 
>> +&pm7550_gpios {
>> +	dmic-eldo-en-hog {
>> +		gpio-hog;
>> +		gpios = <7 GPIO_ACTIVE_HIGH>;
>> +		output-high;
>> +		line-name = "dmic-eldo-en";
>> +	};
> 
> Why add a hog if you defined the regulator already?
> 
> Konrad
> 

The gpio-hog is the mechanism that actually drives PM7550 GPIO8 high at 
boot to enable the ELDO hardware. This GPIO enable is required to enable 
the ELDO regulator which is powering the MIC BIAS supply.
The regulator-fixed driver with empty fixed_voltage_ops has no 
.enable()/.disable() callbacks — it cannot toggle the GPIO. The 
dmic_eldo regulator node is needed to correctly describe the supply 
chain to the VA macro driver (vdd-micb-supply) and for power tracking, 
but it cannot control the GPIO itself. Both are needed for different 
purposes.

Thanks,
Ravi Hothi

