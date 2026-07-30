Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C210A38F949
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398408; cv=none; b=IJRMAN6XTr3YpCS7/ideK6oWeSJHxk7IGKoHiMVSI5/0K0+Dd/YWEc5jEiNxMAHzxt/bkFr3Uv0+7nDb3CjlQTdJm8zOmLtM/2Q2FNOE7T3osyFSbFj1hT99Mp2X80BOfuoeyAqWICOaxvk5PHgjZ6E3LJIHLzGZnqIJm1CRwek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398408; c=relaxed/simple;
	bh=isRfVqCrTeJuXESVbQDgCHVzjp5mrnfEXx8zcVOOmZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yah4KySMzhzVy6bJYQz/ocTTdf0OtwoMB4TDTTGrxjcReKE8TWc2PodL/NwknkOGtDxOgwYw2rwtNrikleAoVBM+bAiJMRqUuFzGiN2YChe150R+xAF0omKY8hMERTdtsL90KOfQQMs8RQhF+0k8VnGwYaKDEwtzXUgfwzrT2YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rpht+v6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gg0NpSMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rpht+v6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gg0NpSMG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7C6qb113756
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bKfAWqKof+fZNEYGEOBMVQlW4vh6V4id4rJXwvfR8sg=; b=Rpht+v6WlOKG5vyq
	Af36mYCM0yxOOlLbzpFA9cRzdkCNEoxHDavwfASIvgdyY/KFOENSsmWW+hIDL7Nf
	bwJHiq98IvAvLDLyMP+p6sW5UQHwE6DZ2QwrgDbQaA6dOKGPUcumpzP0dd/2tNVQ
	UwMiAdT3B+2Swz4f9KMYeA0sxRNPBIIE3jiwDGRySrNX/Z6ZWeQLVy/0E24Gike3
	T8IPG25xzKPOcBI41QmU6w8Ap5T9C/MH2CFbZ5/75hrQgRTgu8me11YYkSEDiOG9
	d9/s07TF4QxJPy23fHcPR/LoVHMyrOsHdOVe9q4Qpw1MTcYO/JDi+G4OrCh5um46
	MNiV3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr20sr6ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:00:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e57e56ce9so15670885a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398402; x=1786003202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKfAWqKof+fZNEYGEOBMVQlW4vh6V4id4rJXwvfR8sg=;
        b=Gg0NpSMGh7T2a3oWRvoIhvpYo1i0cT2EgWfVw1C+szonME8QhDJLUXgauF7TE3f6XT
         mNnR58k4DlMcwUm/QFgOzxKFVojKIEG6KZnkY6BKkXVYs23oyHFOzSQhtukr7K+1Nres
         C2V8P+4hrRCA/XdUMIgISA5l1GIoxP2Nc+4p8IW9I0V42aLm0JZu8IHGSd49Ep9e480l
         HEs2svmRvOhrBtsnySg0vsp/cJ3U4tBOX4g6DMayelhpSec1bgQnogqA244nmI5D7Kmd
         ukm95bYvQpGxwaIOJvIqpEg6gFV5Nh7kakwf+z8ofDJ0Y7PpATRxrMvqX3DN8ACyvt6F
         oftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398402; x=1786003202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKfAWqKof+fZNEYGEOBMVQlW4vh6V4id4rJXwvfR8sg=;
        b=si2+jpy73bXF5CfCX82ylZbSYrn16NMlE4AiwvwGN1w7mOBHviUP4iY8X92pU1Vplf
         AAPTxIeT4KeJDHmbiIBD8gxD9WZGrNomaySpTjqhDh1tumemDACNVKviM6HzStcL1Aa0
         yD5ALHyWOVQ+ba6cS/7xzDf8CjmykTcPGvJULFT6LJ0xixg9SG1lF3w5X8TD+OL2CR9O
         YmsTUda3jEzpQwYhKYSCZmsNEfHPqrknVClIZEdsEzj/VWA8jS3Ae32z5nzQb3ueNm6I
         8UFxlJTg8BHd2wbP9KmzlBcO31sdh+2nGFMRuGKC4OHWZbgv7z0KfYhfHyeycKK/GyV9
         Lmzg==
X-Forwarded-Encrypted: i=1; AHgh+RrUfjiihw4bYbQ1VLZWZMJWVSJLfhUHJHSgGUVe/GF55Au8DWBLOqvCiBILCgaeW12Ui50LNU263LwB@vger.kernel.org
X-Gm-Message-State: AOJu0YxgJ20Q/CU4zUxs6lFhhlx8c6wnlOJOQy6EcobL26gda9Wd4EjO
	YB3kC3oPvTBjLt5LkMPj5d/2p10E/jx0mVzvILqBdGl/l/8v9aCYQdPntgA6UWaknxdaz5MQORb
	3gDq76aU/FHHNsHd3v61VKjtmW790ORxpGmNlkAyom+rKnjBnA6qyXNS9c391Rle7
X-Gm-Gg: AR+sD10Kgs8o/YmZ6r/ziswoBQ7MeAtphi6OUkaIloMi18NuRnnxg0k9fK3NxqSZqSp
	jaJRWDbTjYJJY5/tR1x4SMRIfNiUu7Y+hnF4KrTMd1eib+++Pqsdz9pK+XO226MHVPy20Ci27N5
	MMUIgyccpfPG+dzxrOy8GdPl/1/w/kEkFkYHTC0tBqi4ttK5bE5DvkCwLb8dED1sFpLbrN3DPhN
	tYTepgWW4A8n128Fqd/I/e/cXnYt7Fl8edFy93GDvLSbNvvEy84/E6t9YpL+GUUtB9G/4bYPKU3
	qTtWKVyiprHfXt5Iy26whuZE7sZhUkURzJrQNybVQViqacsVsnRu/TYJGyj3CNy+RIwA5Rb9GPQ
	U2kC1V9QuydrAByBA/IgueV3/
X-Received: by 2002:a05:620a:a501:b0:92e:5ef1:9072 with SMTP id af79cd13be357-934861506efmr199727185a.2.1785398402538;
        Thu, 30 Jul 2026 01:00:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a501:b0:92e:5ef1:9072 with SMTP id af79cd13be357-934861506efmr199725285a.2.1785398402121;
        Thu, 30 Jul 2026 01:00:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07c77bbcfsm278261a12.7.2026.07.30.00.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 01:00:01 -0700 (PDT)
Message-ID: <bf99f15b-da1f-40aa-b1cf-d33d0fffefd2@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 09:59:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com>
 <20260730-eliza_evk-v6-3-40ece2d33114@oss.qualcomm.com>
 <ofkvwrvfpyhjflrmbyi43gd4mltrqdmf3pzdvxwitrqshtttvo@r3xpfq3m42ha>
 <9a042817-3a3d-4637-8df7-466ffa380403@oss.qualcomm.com>
 <en6sfnjfh2anntkvwojt23xexkpjov4oiapcgcd4e7sexhdya5@xcohhiftv5b6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <en6sfnjfh2anntkvwojt23xexkpjov4oiapcgcd4e7sexhdya5@xcohhiftv5b6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX99YNE1QGrtI7
 AKc5IbnyblJ5aro39qFVz/HGaBFywMq7lpcl16f3UiSg523huInaW2iX0ZwH4KZkedgV358m6Za
 17fGoOdjfKR7t7mCZpXZQOMiT2bPVag=
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a6b0483 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=8zT0Z9mGZitViAjM5KwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RgzvU-xQuW67OwoaE3fW5jguCtw674A2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX0dPe5j2HkiIk
 CI3lOPx2XS4fWkrCvdbbaiSdqFq7kpkXD+u41FdmfBBuElLk4yhsrR1tbgYBZFP0HtfbhABHKHs
 ujhJKVWvcLkfTCtsjkWdCEEqj6bOmNpMdlcscb1+t/woCWV+iiwlPCfDpIlpgJUeJQ7MwgBm758
 dZ5k92PrbmJU8rrtX/M4hAQ0qCMG8V3LN7RLFcMlmHfGZGCh00QgQBxIzNn4YdoQ+HCYZuMF++r
 gER2qbb+0KNLq3h2xNLpReXr+9ANYV6k1W5CJNZhwTBvf9SdTTfJQ6xtG/eTzl4BGjye3sSe+Ki
 9edyRZwQFR0N1g8wECMYrifS+x8RRccWt4gYUBk1FZsLsbM9vfgQze9un1YX4NyVkhnK7rcgL96
 tRVZFniT3fme3SiJVh9nZrvCgii7d/lvoX4bSF2w8vBNj0QZWJsYWJZ6bRNyFVqAiFhjL+UFrKR
 NXV3o+Qdu18CdzvVamg==
X-Proofpoint-ORIG-GUID: RgzvU-xQuW67OwoaE3fW5jguCtw674A2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300056

On 7/30/26 9:52 AM, Manivannan Sadhasivam wrote:
> On Thu, Jul 30, 2026 at 09:42:29AM +0200, Konrad Dybcio wrote:
>> On 7/30/26 7:25 AM, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 30, 2026 at 10:18:55AM +0530, Krishna Chaitanya Chundru wrote:
>>>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>>>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>>>
>>>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
>>
>> [...]
>>
>>>> +		pcie@3,0 {
>>>> +			reg = <0x21800 0x0 0x0 0x0 0x0>;
>>>> +			#address-cells = <3>;
>>>> +			#size-cells = <2>;
>>>> +			device_type = "pci";
>>>> +			ranges;
>>>> +			bus-range = <0x5 0xff>;
>>>> +
>>>> +			pcie@0,0 {
>>>> +				reg = <0x50000 0x0 0x0 0x0 0x0>;
>>>> +				#address-cells = <3>;
>>>> +				#size-cells = <2>;
>>>> +				device_type = "pci";
>>>> +				ranges;
>>>
>>> Sashiko pointed out that you are using bridge specific properties in EP node:
>>> https://lore.kernel.org/linux-pci/20260730051031.20D8E1F000E9@smtp.kernel.org
>>
>> Can we harden the bindings here?
>>
> 
> Possible, but overkill IMO. The base dtschema for PCI bridge includes both
> 'pci-device' and 'pci-bus-common'. So for the Endpoints, we need to restrict
> them to use only 'pci-device' schema and that would require adding
> 'patternProperties' to cover the Endpoint nodes in each binding.
> 
> Since this is not a recurring issue, I don't think we really need to go that
> far.

OK

Konrad
