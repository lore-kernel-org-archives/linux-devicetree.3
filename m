Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AB3379982
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986997; cv=none; b=OuKO5D69GA44sx8bWZmB84rmdTYn6pHvq/pcsv0B9e5MeuJjz4v0CZYQmOn6N0yEtmZfdCSIFev9If5U7TpuMHx2BR9OehS73v+G3nL0gLvRBF+55cdh02EBbtdVUsriNZReoOXmEKmI4vXoLY5nxuNrDs6qepiaHfSOFFfmk+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986997; c=relaxed/simple;
	bh=oKeHTCClEnzlDhjKldDN8fmFaL+DbHLDQswkC6zCsg0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t+Ky+YIWVFFPFMCeklvbs1JkkirXh1Y5wrZwNC1zyPk5ZJeRf3UUjNBSjlZAbN5Rnn7J4nSD0vSlNhdgehMvK+vmUtr9o0mz4dSjKrc0+4CORQ1f/ERHDbrtOj5ApIvfOiut8YmstCpdEH3eqkKr2miefx9VeYO2xHTVdIgMoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpnnm/sL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvx4h2Cl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpnnm/sL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvx4h2Cl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wljb945024
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 06:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rwejrAXe9v/O/1lr/ak/rj4FZszxsHovCpkD4lij34=; b=hpnnm/sLyW9cKdl1
	nH7rTWeatKi9LJPam4wU+PejBOmnHwevAOC/iC9La6VA41TkV+40W0EwZGKVPeeg
	rAgAoj26gbaUtvDWfJ9FDe7AdBUOU+8dT7PNlVS4H4FcuWqgLg2qTiTTNkhtGp2r
	+0E3Jvn293VwaIy+5gG1k1D0Nm1cztz2HSr3dBYC0qxW356KARl8Q4yqkluVGeEC
	DjEG34JM2agdCM/clAO5+9homihYlBc1fIHCOSIHxjAAU0J/B7hhvanvDxQcXOdF
	JsHo2H9tE7XfKRTiV/aZDx8gK1V/7m5CIt0CNERGKRgMsSSOC+fMWoPBvbnwXk/H
	0s1gkg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx44hnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:36:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8424aac207eso4790715b3a.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 23:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780986995; x=1781591795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rwejrAXe9v/O/1lr/ak/rj4FZszxsHovCpkD4lij34=;
        b=hvx4h2ClQg3zWo4zXfa5zzyhsavCzOaW8L53VH7BPZqE1XGd9U7QY3vMTk0A2nn0EY
         uxFsdf5XyTfCCOuUucycHcCWqaD0LZHPyi1J6x0g1pf21qol1EfBK4T7zeSS/SBGOS03
         Cw+uKuNCbkxZ2nFBtQO59R3swO4XtLelt62+xvE/OMysM9+ihPf4A0bKrU1AowR64G1g
         1ZFzHgx7WPSWhSqyX3jObP8n9wgWc6grZtMEdwS/9dKYQ/+chR9bHwxwlq8+jJuddlYs
         EGlLVm/KSuLSBkVeis+UC+o6q6T8ZSJhbnXZNrJtOM5jejVzCrVCj/+9cJbnj6yrYefx
         5l5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780986995; x=1781591795;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rwejrAXe9v/O/1lr/ak/rj4FZszxsHovCpkD4lij34=;
        b=PRnKosEXm0ZVtcfIHUQbhNI2kzU7Di6d+YJ7l459YiQ6CLgJgoj6oPf39cV5UdyQ68
         9d35Su/M5crvG8fReEPpfes7RBswHOVox4KG0coNtsQC08YYEDwkK0BJbe4mVHzRARvc
         lza4p3Huv0qcB2T0+LnErdduH8xqhLwq1aoNhFfjwIM9MVRB8j1NVJVQCgutxHomaX4G
         Ec6rOvHIHtDF+ZlOdZ322ZGfg785hkVOi7jvV3BgFgS4Zy4shFBuhV98iJY95zBy1HeT
         rHMx/35DOZeYHi0Sk/iyo2TMLCozEOahxaKTs6QM90lhqnYrx64Tskyx95Jztc7DNnij
         mqDw==
X-Forwarded-Encrypted: i=1; AFNElJ+HO5Tw3jYjUVnQmpvn/B6wVf7uwLjaySUugB4FwGDN3SlOZvGYQhlmxTZdUQSD2zxnRkspwq0ghYP5@vger.kernel.org
X-Gm-Message-State: AOJu0YxKY4zs95objVJb1b3ApyE9QiBv+UDHUFuQBi9p4HBDLZHYjuGi
	Fm0gkLHYncMvYmuntTzV5jb7mGDpgmWnlhpD/YhpE7zHt8Cz3oul7Isu30CJfMoT9G2IZ/bQHfB
	fkUbkRQedGkdmxOAJHwmkfuOxdEuAJ0m6z96aGHI6xREqa9sdibEmmpNAfp1tzKRb
X-Gm-Gg: Acq92OGJIqFO0qtB9e6R/OCidCtgipc0fgZ28iFJB4nc9Rxg9TpUbqUh4jDvf1LH4gE
	M4W654UjXApmppDHNpewGBYktrRwjOxTtQt955WASRK60OS4vLX0yIAOEcAKCW4n9RUD2YTZWz5
	1DrShAEM0fF1LJ7Bju+kwndm7vPb0qclsao0beMxu+0z89M1NBw461tNzK9cDU15fx1yhdT9+kz
	77L2Z5ccX0P3WWBt0pYhozxhxfeN65yJZa9XrV8N8xb0mQMQlz3XZJydzTfHu0TO6xar2vAV3RA
	+NkTBgFnE41Md8vxoTjFmzBMMeR23KucTJ2J61kK29s4/a3hh3TbmYmWI3Wt8taeRmLjGAkpFXE
	cyEMslBLuES/oYDbDVW3whs2oW0ba9a41T/Sh9iLT+gOgn/uhk5OIh+HvzPeqPA==
X-Received: by 2002:a05:6a00:4acd:b0:837:e9cc:d46d with SMTP id d2e1a72fcca58-842b0ffafe9mr18208604b3a.44.1780986994829;
        Mon, 08 Jun 2026 23:36:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:4acd:b0:837:e9cc:d46d with SMTP id d2e1a72fcca58-842b0ffafe9mr18208554b3a.44.1780986994350;
        Mon, 08 Jun 2026 23:36:34 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282910d1asm20288133b3a.56.2026.06.08.23.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 23:36:33 -0700 (PDT)
Message-ID: <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 12:06:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
 <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27b473 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=AuIPJNTv_tJEKgpUhqcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: qHofkHfQ4Kc71CGT9yh27-kK0ezoqyRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1OSBTYWx0ZWRfXzkRl5Ky13u97
 GjaQwAMkK6yAxdOSwkWh43Jh0mBhMrsabzhMsvuz0uZ5LFUhm4kRFBCxx2AQq0q0k6nfaLzJlNL
 8l3BUhS8Miyakd4BwFlR4sPaoHL1HoXqrbm4kiJinAhfkCynGE/LNzw/4HwE61u2G88jstzquql
 NPLmiqnEHE8u2YXQ0BGIYLw3Sy8mN79d6AwxrbvJ8kgRDg11RhT1EC5D8oszUVI46MqxQAcBuTV
 wQzEhHY7kR7gEriFPIGZ7ibTBAiBDSR1/geHOspf72CtUZeXgbcyqI+EssiSffjq4l1AxczAF4m
 guXtvexOohmnesDrXlwk6zfG24RuB/3s9xj3GhhMpY0sLaYwK4uCvh/vDmq4rHGCmImlpCYlcov
 3VYu7M2CNz2qJB98TMXbIxsk6nNZ4w==
X-Proofpoint-GUID: qHofkHfQ4Kc71CGT9yh27-kK0ezoqyRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090059

Hello Bjorn,

On 5/18/2026 2:06 PM, Harshal Dev wrote:
> Hi Bjorn,
> 
> On 4/24/2026 2:05 PM, Harshal Dev wrote:
>> Glymur has a True Random Number Generator, add the node with the correct
>> compatible set.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..64bbd5691229 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		rng: rng@10c3000 {
>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>> +			reg = <0x0 0x010c3000 0x0 0x1000>;
>> +		};
>> +
>>  		tcsr_mutex: hwlock@1f40000 {
>>  			compatible = "qcom,tcsr-mutex";
>>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>>
> 
> A gentle reminder to pick this patch for the 7.2 merge window.
> 

Another reminder to pick this patch up in-case you've missed it.

Thanks,
Harshal

> Regards,
> Harshal

