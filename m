Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1165A323416
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098734; cv=none; b=Y7d3c+219PZxMrZz29saYIq+XW0Aw80XPi3jQsi8UPHxAy72xj2dOfpSUQ5kzmplOpCMRNrF/3XbBxGhyk61jy3iW8AE3VU4RmGmwkmiNdKo/sek15vYSyEoKLmpFSaRIDglNMV4rHYIF/vU4Pxw0ggzFCKNGkwDeaU52HLLuMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098734; c=relaxed/simple;
	bh=2F33bP0CzluWiHtV3rOJhAl9WdVxVvWgw0557LH7+2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vqn3xybaOP9/TqxvQd8A4JbIbesuObrN+IT1Fawro6zMqAAXEhzankvZOxPDtXWUpZkJOPjxinB/tf9wS7jXrOXmquC2hMh5HXIsRZBJnZ98Z95znCoStamRaYxn3p78k/YqMyOXddPn+KWPPVfhIazZcyr5GcK/E5zv1qAcVcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh2XcmcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dabs0OpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zh2XcmcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dabs0OpS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3mMbE2273597
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5rLcyyrbG3p5cljmeoN2CF98kBOhnagbjStEAg0Lso=; b=Zh2XcmcSe/bVKFC4
	evZ53wuZJ5ujyAm1LDk1V0py4eGQ1QtQ0+WmLgSXEcnVxywgI8isRvpYoVLNCZhu
	36tgD26HQFRoASvUlmUHivsz8e7tFwi8xCOHbfneAfCVrWI0g1ZhtPh9dYIdd2za
	4K+FTn3Pd+joJHdTyt48O2AoDt/CzD29NHvGzXQVQL6h68Kq6eIT5YG/chfssL12
	M8oJUkC5tBhdNYDCJWBSw++1+DuETCuBEvQsXlfkHfsJjFuEE/4MJA4nd4RKnc6q
	j7NfbZ/HRRJ8KIsdDQycdvj7YubuLHD+SzkHLw1pSb6OtqIeNmg9MQzqIaoOYd/R
	G08Dyw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mjcn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:58:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so4336042a12.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784098731; x=1784703531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5rLcyyrbG3p5cljmeoN2CF98kBOhnagbjStEAg0Lso=;
        b=dabs0OpSD9xZe9so97AfbU7G1+nPMOIFSh+4xim2vfhcZauFULq9AHP70RM4MstL1F
         nuwnwjkVDH9zRFgNwMIwq6I0Tp4v9Q0a2PU1vUSZpwJv3slESbHR4geoA1M2c9kjFBxy
         2lDIL7l50xWvJXQq3F85OitBL0B4n4Oj5l7vrad82qz3K2IH4q2EC/494B1/dJUZ3ivl
         3PShb59AMIJ2CvsafZpT8uQXNYjJRYSVtw9FC063sLCnZwMRCH5Ddb0PCjjcBpNbd6Q7
         NVKd5gAZfc9y7z6T75ARndnsvKgXsN6Qd/Jjzbn7BAkp3lgmXOMhBYDCYRIjnLzh4Prq
         Z0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784098731; x=1784703531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5rLcyyrbG3p5cljmeoN2CF98kBOhnagbjStEAg0Lso=;
        b=sufNrJALttGHOU4oBpL47crRXfZ1/D/SCDi6tDa6KAxG2jyp0DtgoACAxbiU3dSDSy
         FzYFJEEb217OPwF9JVzt/Zdy31miSVgCZ0j4cTPOsiFv0zmq7WmLdoWA1gf2J4Eg187B
         IquaE9C5apxU7efaA/wDg4DgMPO3TftAFMqnPg245Lr8Y6dLWHlS3pydkgiVIC/Vf4mz
         JjYZLwCUL8jmTkFoglLlqDlwjkJVNd+p16ILW9Z2W/6ChsDB+jEkCh0rQ4cwxRpaOGFP
         Tl1InI//QfVOUrA4LFJPulGkpdFadi2PEUEdjL0lzkgOOD8VHF8Tt9rFBOewvC/vzZj6
         LO/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp0wi/qngJ2VnWTGsBGSKQRLq8PVzO2FXCM11NMdRPfG46YAeZz3BKqk8cU/BbkzJsTtuHtCoXrRy98@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7mi4uRx7uXlRNvaCx/uJrCdGbHVFpaWdmlnWxHvENiLtZUPG3
	DrVZI5UOgG6wOT5lGeWMRRtBelQAKQYbai0hVBHTI3wQ111ECGoKD0K5BnwRBmEcgqWSURXP0m+
	/KpUbfyFgiDpnL8J0TAu1VWPB4HFd30LUWkRBXBLSIWZk76vOb6lJQAMxhSNz2psC
X-Gm-Gg: AfdE7cnxMtl/o86XjwYkN700sqjTW3vgyvx/HVmjKZD5FxakY3miBLsCBHLlUj42DBG
	ZTqlZn2MH2NbV+4hHN7NKQMc/0jB6ei4V2MnZnHfUXB2E8Q0+IRIKR/4qNlQ/RTqwiBsM77W2o+
	PqRyTUs935a75AqyjbVVIqF1Ea2DW68/tdj9coBAR4wUL9sgldJ/9uc3DTUoCaDbOVEKqvi7goo
	CRCJXLmD/iLT8xfuGOOn+q8Vq3NLSLJnjVM7peSkk1whnBzqFsL9zDW5sJueb8ik/9kk6ibJHUy
	gc8j6f2/jsmlf/dsay1AcSowvLZLsMFgvi+heqJiCtU/bkST3V5TxZbiCHMUZB8hCS1Da7Vshq9
	X1hnwvqzY69LHi7CHntzVJMalzXzf/d/pmOwpWq6mtFcFeNgUCA==
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr15113952b3a.56.1784098731351;
        Tue, 14 Jul 2026 23:58:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr15113930b3a.56.1784098730880;
        Tue, 14 Jul 2026 23:58:50 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6c158bsm2585765b3a.38.2026.07.14.23.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 23:58:50 -0700 (PDT)
Message-ID: <5612a63b-4052-41af-8676-9d92811dee9d@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:28:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260714145250.2473461-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260715-crafty-cheerful-goat-baba95@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260715-crafty-cheerful-goat-baba95@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2NSBTYWx0ZWRfX2kUsdlClVNR4
 2pi/R7Au2g+bwpHtyZ7nEFF0bWy1emBw0Ai7rg8E572CVqx7auYv7W74ySX/F5Aa2OtaFHky2BU
 lN28FQEdB/pZj3SjHFICuyIm+P1lK2euTBKDYFfgpnRjEk+ppPVPA10K1qjcfoLvZrnoPh8xV9U
 HJD0kDJP6jQ1Q2xY3hS1CmMd3Vp+zjZ81Cf/Wh9vjf3KtsJmMG7FBLn6fuDFfr3GHPaLwJ8O5JQ
 oIUiES+wVBFJT7zXAqtRSTyg7+fMP/AUawJdwlYZ0X/ZzxEKcM+CpBsdn9RPjnPtKzei5tYFOiT
 qxKZvgzZH68LUu2dSDF5Zi/OIjSCgohQJQM319n0U0Brmjv6b8vEHhld8dnrKknbj706M26MB6/
 LGGnMHxOc68yk6POL8DTQUjjn6yXFKuUrx8w9IWOlBYdkPZEw0hnk5xg+eT6pi/csmPupX0/VP3
 HRj2yC/xVPegdf3l+Iw==
X-Proofpoint-ORIG-GUID: HTqK7I8hLOQBasYQ93X754-6v6hw73zL
X-Proofpoint-GUID: HTqK7I8hLOQBasYQ93X754-6v6hw73zL
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a572fac cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LJDSKmyOq5XDa4FDNxEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2NSBTYWx0ZWRfX/K0GEX6aqQTu
 iBXKDDXsAgvK3TLcQgEQkWLv+bZnvZXn6K+1VfeNELohgubPuWpNfEdwlAJ+Hy1Esk1CbniQTtM
 Qppd6cZqOEYye9F+C1r/jX8ty8yRqx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150065



On 7/15/2026 11:35 AM, Krzysztof Kozlowski wrote:
> On Tue, Jul 14, 2026 at 08:22:48PM +0530, Mohammad Rafi Shaik wrote:
>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>> describe Digital Audio Interface (DAI) child nodes.
>>
>> Add #address-cells and #size-cells to allow representation of multiple
>> DAI instances as child nodes, and define a dai@<id> pattern to document
>> per-DAI properties such as the interface ID and associated clocks.
>>
>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>> wired to the SoC and do not always have an in-tree codec driver to manage
>> their clocks. For these designs, clock line enablement must be driven
>> from the platform side, and this series provides the necessary support
>> for that.
>>
>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>> introduces the required device tree binding support to represent and
>> vote for these clocks from the kernel.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> index 2fb95544d..b37c62ccd 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> @@ -21,6 +21,82 @@ properties:
>>     '#sound-dai-cells':
>>       const: 1
>>   
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +# Digital Audio Interfaces
>> +patternProperties:
>> +  '^dai@[0-9a-f]+$':
>> +    type: object
>> +    description:
>> +      Q6DSP Digital Audio Interfaces.
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +        description:
>> +          Digital Audio Interface ID
>> +
>> +      clocks:
>> +        minItems: 1
>> +        maxItems: 2
>> +        description: MI2S clocks (mclk, bclk and/or eclk).
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        maxItems: 2
>> +
>> +    allOf:
>> +      - oneOf:
>> +          - properties:
> 
> Please don't do such stuff. Did you find it somewhere? If yes, then
> where - so we can remove it?
> 

It was not copied from another binding.

It was my attempt to model the valid clock combinations.

> I gave you the close-to-exact syntax I expect. It was nothing like this.

clocks:
   minItems: 1
   maxItems: 3


clock-names:
   minItems: 1
   maxItems: 3
   items:
     enum:
       - mclk
       - bclk
       - eclk

The enum version does not enforce the positional relationship between 
clocks and clock-names,

which is why I tried the oneOf approach.

My concern with the suggested syntax is that mclk is not mandatory for 
all platforms.

For example, HAWI only requires bclk and does not use mclk, so requiring 
mclk as the first clock-name would reject valid DTs.

Is there a preferred binding pattern for expressing optional mclk while 
still preserving the positional mapping between clocks and clock-names?

can you please suggest better approach to fix this if any.

Thanks & regards,
Rafi

> 
> Best regards,
> Krzysztof
> 

