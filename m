Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D35380FCA
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147398; cv=none; b=e60jKsWy3NYaclGD7aPAhum3DEHr1Y1wBfr4C20jZ5iE1WSH4uwDLF86pIt8qZLc9vMTQgYBiegTL9NHzRxkTTtB4qjpmfuqAg5fBfeUlmKtIJdb+Jhu9IzYhpfyNk2g5ozmFbjwA6XHkKKmsUsEWtiFlX91gcbiWk5r1jOSV98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147398; c=relaxed/simple;
	bh=cSagDUKgsS+Rz1zOWJaGvfzPQuTL3+CgJVY9LO7acaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZF4y2e7sB4+HvS04dpKAR4nbzaXWz6bUwEP/aRvCvO8utSbH5SLIGI0Z/JbtrZa8semZ4KHs+2Ec5kdBVzt1hl4rsXm68fcc64z/drMOjYdTVyuxgSA83d2ukV8pGrmqChX9SaSAgoYE59opjJ2g83RdBzsxNrC2FMhip+dRI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeOKhGUN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7gdDz2c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeOKhGUN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7gdDz2c"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0ViF4136772
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ndo/jGpUFYIGSgsTatNv4+22KoAFZJ4XyJ7L2pJ/pP0=; b=jeOKhGUNEweygoPX
	cBFx3ftjk6usa4EGvx6d4cCJVSppBBs1L9kvY4A8ROoiaSWGWjGt5k/iiDlVNV3S
	g2wkdb1fGvhnn/1piEQdV9l3xB333dma6UeWopjounRLu7EtAj2lyzUf+iBbxuYA
	WeEKb7dRA4JtHwurMdxi+dvN75Groe7UHGxDstvXuE8wZhiWmnVHMnAlLpJ111mg
	vM76i4dPkyYY7Q7t/l2Rhghf7plzlHx3Z2XXdxD+FJoPbAgc+zmf1rmoXWsFCf1U
	1lFqz1t1LvOxOiTy0X+7BA46JVGmFQOnYzFhi+bbN3BGNHfcjMv7le52rGcpPSDi
	Qp0xQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffkefx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:49:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b81c13b0so19372685a.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147396; x=1787752196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ndo/jGpUFYIGSgsTatNv4+22KoAFZJ4XyJ7L2pJ/pP0=;
        b=D7gdDz2c4WAAu+hcIOagW9vX5iSIF0eLsW6N6Me90kHeE4r1xJfqnBWyYhoCVe1xvK
         akh8ox7ZtYmNo7Xr/cPYI0DSCJf5LFdbo1Gmp83i9unzL0EXN7mwQDAHY5VK/te+mShf
         JjqVLserEftrGJ8ns0wAlTYWXhIElzgSB56Q3s5Vlq8hKe4TsevR/1HG6qlyP29EAM7W
         wyff8qcHHpad1nyyHBx8odHnmrd21A/8SK9XYJ1VEu2YmCvn7PRljCcI64ZEfT2RBs5D
         pD0DBUupRR9Uk/rZKyzTokyhP8Jsuof22UW20uwhE17QHrvnufYVL2ffRe6hcRsbd686
         dQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147396; x=1787752196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ndo/jGpUFYIGSgsTatNv4+22KoAFZJ4XyJ7L2pJ/pP0=;
        b=IxfLbhJy+jbQVnxpNnXpoYO9BNux8EovUvcQtjpolEGY/W2TjpiYpXLj3UYmJwj6AQ
         gIQ08sRJMVaYWSLNuLt0c4u7vb4+/je0/bfVolpLe0YBwiLKX/NsUm1Q6ait6EGR2Hfz
         7C+M7Csn5ZEtNP9R9rqZBSUYfSQAQZkKnbnmVfRlEsZ+oQ56oN2gICVytfBZFlBNoEJ4
         uzKF+//WWhdO4Gz+HhHXz3JZFJR3wrf0ZJFSqBpQ8epPden8/iuGohdEpglps+5YgRQJ
         z7s+uMBrvhahEjC4bzHzOCDwPgOhBVDO0K/s93yhtnitbFj7/chZZKcoAYj6Gndgw0Fr
         1CBA==
X-Forwarded-Encrypted: i=1; AHgh+RruDgBB8GyXO8LGC5BW4D0/js3Hq0o/2Dm41tT8HjSX/0svqUfgY+LkCsguuqhbQN3YobLqw7mH89lh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7KRMIyl45mzfJ3PotK+QMrmXP8QxPOTuR7Rw5k54Ui7X0ZwUj
	rC29LaP/iaO3W17yi7tczvkDr6KNx6S+UIo/dJKhXchSvCpAZ4dxIou1wm+OywcXWDD+axqtZXH
	h/M7SxM3n9k9I33vNjZW+LZ/CKn8SeSe5pzMPwSVs8dkbw72HlteCq6DiJNY8MrBe
X-Gm-Gg: AR+sD13nnJKfW5EynuJ5NfQKDI4SHEsVG4EjRaGmWHXOUf94OIoWuH1XYJUJejGOgn+
	m6dN9ySGv2QcQXbLmrqfIp0xNyOqxKu9trn8pnQevLUAcKVQVu1WlvpsrmG4wFa45TdosJ+vite
	w+fIKzaHxMu9rsPhDiTfRlllS8hqWax8xIuwMr5xp7pVQjUYilLFUpg8Ug9grKhgfAX3ZXniPsV
	7SGLYFwrZZ91EBDVwVDYQxDMzmIOYqpnoEFmmri5bq/K/zeh2h1/XY+BbjNEmOWBweifHegs0TV
	F8uOJb8+cMZhdzTY4mtxx0EU8KXKsfJNJ7ghuBADrIxI1lS3Cu5QrZxxrFf9F9w+UCCefqvtXBM
	4h3XF8yk4anIcV1Vorx1mPyvB
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr294147985a.4.1787147395769;
        Wed, 19 Aug 2026 06:49:55 -0700 (PDT)
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr294141985a.4.1787147395137;
        Wed, 19 Aug 2026 06:49:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788e7a1csm525600e87.66.2026.08.19.06.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:49:54 -0700 (PDT)
Message-ID: <62f630d1-80d5-42d9-a818-945f3c67df2b@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:49:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
 <d7402165-e4aa-4860-a1d3-92841df7e7c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d7402165-e4aa-4860-a1d3-92841df7e7c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNyBTYWx0ZWRfX8lswnmHhzuJT
 re5dYXQFEzVis3Gr0nnXoFGVINh90Bh80CrR0ruvG5V72FlSKJdUxESaEPDqx6eW0ZkOYrHtY1k
 UQscebUFLXR3g+PtuLhdW2MrS1FrXog=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a85b484 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ofFnG4dxOzs5zDCg6IsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: djaJeoxRncbNYzILkhrRkIR0unZvwpx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNyBTYWx0ZWRfX+j/0QUlgW+S8
 FwGfYqbXSiMcHC3A3eRI5gHnDFR6Q2I0gXwNCz0nUl5FF0wtJCYjU/A+V5JCH9oFTYDOCSmwjL4
 j6RhRzeYHiMsHKL5LPGXrFIQW3rZJguPTZo+ZkK+s6k6genzyBZCjOpnu21SARSRt3rB0PBK+DP
 GL8g+iWjgbVhVWUpHyN48jPR5ASCR37VZsp0QBE+2EKZ3o81EYr/MXTi8GDEqdu4UmFl9l4aAh6
 IsIRyYk3Oz6Q8+GteBDCMPpiOGCrnwuHW0dmXSrcJMUlCyH875nReMNm4v1yt4lY4xBiiJAaoRr
 UvUMSFv21sXlA1Le+BFLlVN9Lev2ou/FwzJczZ7l8EcwJwioAeM+Z9tMXPK1J/mpogy1dA+U6kU
 2zrwhYm7K3scNoTIvW2gP+/48QHIA2ErsTM/KdcWE3M5M4rfZprXP5jJ80sHPtBeku0DmX3pQv6
 hIdU10kyWOCqRq6T0sg==
X-Proofpoint-GUID: djaJeoxRncbNYzILkhrRkIR0unZvwpx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190107

On 8/3/26 12:58 PM, Sneh Mankad wrote:
> 
> 
> On 15-Jul-26 4:04 PM, Stephan Gerhold wrote:
>> On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
>>> On 7/13/26 12:25 PM, Sneh Mankad wrote:

[...]

>> I don't think this fallback is relevant for the non-PSCI QC platforms,
>> for the following reasons:
>>
>>  - They don't define the MPM.
>>  - They don't support cluster idle upstream, so they don't need to
>>    define the MPM. They can't reach the idle state where it would become
>>    relevant.
>>  - The setup for cluster idle without PSCI is essentially equivalent to
>>    OSI, except that the SPM/SAW driver needs to program the idle state
>>    to enter. There is one SPM/SAW for every idle domain (e.g. on
>>    MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
>>    SPM/SAW instances as power domains to get the same setup as PSCI OSI
>>    (I had a draft for this at some point). So if someone ever implements
>>    this, we should be able to use the same approach as for PSCI OSI.
>>
>> I'm not aware of non-OSI PSCI platforms with MPM either, so I'm not sure
>> when this fallback would be used.
>>
>> We probably do need some fallback for the old sm6375/agatii DTBs though.
> 
> Yes Stephan, this fallback will be required for RPM targets that do not have
> power-domains property mentioned to facilitate the RPM notification in cluster
> idle states, including agatti and sm6375.

Will it be able to do anything useful though? Because if it were, we
might as well not change the bindings. Now don't get me wrong, I'm in
favor of straightening them out, but this sounds a bit unclear

Because if we lose nothing, we may simply not carry the fallback (i.e.
provide the interrupt part of mpm without the cluster notif)

Konrad
