Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE82F549F
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827259; cv=none; b=P9JcJXZPo3aG7n2VTzoBGMFz+Pa7KXevTZPZP/UQNLfV2le+Qerq5Bs+tjavDV4SX5YijQfqrpNZfYmng90kyou0oyZ03L8tbGz0hVgWTU21RNw8eIkrONclM0I6hEix4pGXcakUTq4Q9gc61Dbmp81VzDDh/BmfkQctYKtnEmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827259; c=relaxed/simple;
	bh=uQcFgZ5PTdj0fysLbhqM5+3zbS6y2ntd2SFx87lCYuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGi0hRLOITZWDDkSo34iBNGFfVX3FjCZ8qL4cwkjAkuG/Kcj7RuMqkaPZGAx2UluTulx1OEeIbytQFtl7ZXlAbVZPCTfH5gH3kPBEheym+Mac+h2RY8WTcyB4R/d1rjbnnMwd7TPdMAyvykPkR0DxqSrx5gC4mG3un//6hg0vDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klJIHGzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UE14NZ6O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klJIHGzI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UE14NZ6O"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mto61542131
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32rvVfYkUGtiT3VzoEyiVTP+jLoTdGjbv7dR7oDUFGY=; b=klJIHGzI+aaf56xY
	nG5oZcDutRX0s6Gh3v8WoJz/9ES31zfODh0ZxYppQHhQb22Bbwah7EN/0m38uhh3
	rAPCYuz6Cen1DQUS2cmm0CxGDKt3rLcqrj+rhA2ebUBkMMDz368siRaUGOH329p0
	/Q4EBo98Pt8lCYn3r8EUuwX6t1xOoVkcqw2FLTdcbXuP35HScwhkxlm8jTnY2BNk
	JXUs2S3gWYW+3NYwiRA3L/EngiXGRpFWiNYvscHtvOMNVJuDmfrp8z23C3Mn3dav
	K/TOdCr91d1ejX4Pv27WlhbSAbwcqZnxMgA8qef1vBV+BRzRO66XXG8E+HVJYewh
	lz0iYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4jrkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:47:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a07295d67so13647491cf.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827253; x=1783432053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32rvVfYkUGtiT3VzoEyiVTP+jLoTdGjbv7dR7oDUFGY=;
        b=UE14NZ6OzqTDYWpjPY0vShxnQkwldqg9lPKy4OgJKDRmXD6bGaczmaPnZ6jmfzISYy
         JTIcBpEJ/+Gaou5Gs/OUNph3ad1hwzufZ69Frre1LCL/d7pj2j7UmjJj6pUoAfVFLwVS
         B+jl822C6KKwBZ1nsufIZRObkOiy7sBm5D+cAfh21zVxqz2Wg0Zka//2uQrXntR3eMgl
         pPwndYSyIL7jTre0gCag/lKIODCuR+LZfpLjkqpapcmxKQDGuhXcl1IYaXQHliL8tmQ5
         eJRhXjJFqMcF/YX/rl5kV8FY2xLu08opseGZOUNzy3e7zEvEmQn1q3AVbwQHKvXmn0Wy
         aSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827253; x=1783432053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32rvVfYkUGtiT3VzoEyiVTP+jLoTdGjbv7dR7oDUFGY=;
        b=fMSKfttv7ZM7wEw4Y/Wx5MB8p396RVBHRimgI/cMC1WBi6I1pNAr/jADH/tKKmo8lw
         LzFmyCKCbmZsnz02jetstI1XdAsiukv8A55urT/LodV4HBA6FnrdBzudpuSO3daUIa9k
         //IsLQZL41as0t/TGJI07c9tR4IB8NpbH2D0oCp2t1/CxSrdvK573eBLBVDIo1+ItTWZ
         J0iBqSISYkCM5vWoWlm3og6P/OH+onVYNa+2xQs+YkuOTvJ81mxSoMAK3wIedh8O+GQ/
         fzKlSJ69naO9QBiDE8KwkHFKv5btRRdndcnxnxZhSXYhBJjk2lpue7mC4Otmh8CqPkUr
         ivGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KTINJgOoP5SA0G2YTRoEhc6xT/mjfSap1jiPCAlnrWo5ae2ra0QT9DrXYP5QF2uc207vWLQB+/AqS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiso5NdfOwudV/yeKoiEewit6kWuHADkCRe7hOt/d0pPcZbNLS
	VI7nrM/ieV23J9tTPuN4B/v8cDdd0mZQ+uenE0BWI/ymbq+8TBCeRV0bzN4xEzcbSiBfcnIPBMI
	o+NqMqkOj2wGCCc4arqoR/lrNFaEwt/qeIpnnzrXhNomb6GuAw7IYYz2aiChCmNr0
X-Gm-Gg: AfdE7cmGVxTZfHz2ivsoWcvGz7yDP9nCEiP1x4uSMiXIOVbllT+aByrPAipjuxTzcLB
	ShRx81dzpff4ZMcV0E9mm3EadvUizJbwYx6h0/5hX6fPlzJwU1l+oiy+iS1yNZLRzDXw/j8roFr
	Tn2mrAmZd6L5K4GmL8aIdun1ELD8mfG0k1ncdaDbHKvQxh7WSAQBGIlf5FBjZKbNOSQ/m+sKDNA
	1yaE6n089/jwZzEIc6X9G9eF0/+pIN2oQv4OlOnMIP4fIfz20NdBRqGPWg0zysBPo4jYl1y/Qi5
	XN1PXPxE4UF7f7G3AZj/qHmEIvpHdG5HBv7Frax3ohKx+Gs7XsF0Kvbl+22eIIJQ6lhyo+3M/Gf
	XBOR3JNiODp7DY567rMWzVvug/mamBLJMmYU=
X-Received: by 2002:a05:622a:180f:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c105fd5eamr33252631cf.2.1782827252140;
        Tue, 30 Jun 2026 06:47:32 -0700 (PDT)
X-Received: by 2002:a05:622a:180f:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c105fd5eamr33252211cf.2.1782827251549;
        Tue, 30 Jun 2026 06:47:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc89sm131546966b.36.2026.06.30.06.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:47:30 -0700 (PDT)
Message-ID: <70a3631f-c687-4bdc-a1b1-7fb123e073c8@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:47:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-2-f6d15d7dbbe8@oss.qualcomm.com>
 <7b47ca4e-dc20-4155-881a-b1849cc000c7@oss.qualcomm.com>
 <20260520112159.o2p7gyfnwowhxgfp@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520112159.o2p7gyfnwowhxgfp@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3u7T9U2q9X2rF0h7wzL8IWDeSd_XgVDc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfX7Lg4QB/fag7Q
 xt2cxTA1QanU06Tix/6D2tyn/QPL0UCmPVDzXnUYFVdqBcHevUMfEMLjuU5MnwRSFGSe9YLKSvl
 oZ53iJH6xjdvlAubU5+pu5vx4kSPh84=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43c8f6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Iub-jLrIGNqVuaaK_7QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3u7T9U2q9X2rF0h7wzL8IWDeSd_XgVDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfX0HIJY6KfWtp1
 7fRAwbjof34PrOdN31FsE6c7X2WozVzr+N3HbTdPJ6jAJEOwm/kDm/oKiLm3UQVl0vq0SlyV2GL
 r/MnGDmFC1DrYaEkKjoH2C2hF59NzqnrtQ6FLVhBCR4O3rlVIl8BNT8RN50lacp0SPm7uxfvcZ4
 JQQcp+WgKa8kVHkcAirKAvOaGprGdLzHEi5jqHCKsqBtFDzBUMuAzOOIGY/NaLxgcYbuEl3gkSC
 rZ1g76BxebJtaeO+1pRjFHW5kByYATI3khszwwf5rwazO109l/FNiE3a4v97JczrZymo76nlvGC
 iKb0zr7TZ6NuhcQeVXEPhrSOTjqnVTu8qJ7J7MZjb/Nf/dy9wtWyfY39YW03VIDvifMkcYb/TPq
 UciF+SElY4c7gTXx4tgLOvy3XVDyLWUs+1pgsi/NCaOG8BzH2JhxzVBoY2UuWOLpG1oqmBMiu9c
 va/mpn1/TbWLnYTX0Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300127

On 5/20/26 1:21 PM, Rakesh Kota wrote:
> On Wed, May 20, 2026 at 11:51:49AM +0200, Konrad Dybcio wrote:
>> On 5/20/26 11:07 AM, Rakesh Kota wrote:
>>> The PM4125 PMIC uses a different register layout for USB VBUS control
>>> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
>>> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
>>> a current-limit selector.
>>>
>>> Introduce per-compatible regulator descriptor data to accommodate these
>>> differences. This keeps the existing PM8150B current-limit logic intact
>>> while adding a dedicated voltage-selector path for PM4125.
>>>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> ---
>>>  drivers/regulator/qcom_usb_vbus-regulator.c | 102 ++++++++++++++++++++++++----
>>>  1 file changed, 88 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
>>> index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..3d425452a0b35b35c4b454f84eb28e87cc8ba4f8 100644
>>> --- a/drivers/regulator/qcom_usb_vbus-regulator.c
>>> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
>>> @@ -20,10 +20,35 @@
>>>  #define OTG_CFG				0x53
>>>  #define OTG_EN_SRC_CFG			BIT(1)
>>>  
>>> +#define PM4125_CMD_OTG			0x50
>>
>> This register is named differently
> Ok, i will update name to PM4125_VBOOST_EN in next version.
>>
>>> +#define PM4125_VBOOST_CFG		0x52
>>> +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
>>> +#define PM4125_OTG_CFG			0x56
>>
>> And so is this one
> update name to PM4125_VBOOST_CFG in next version
>>
>>
>>> +#define PM4125_OTG_EN_SRC_CFG          BIT(0)
>>> +
>>> +struct qcom_usb_vbus_reg_data {
>>> +	u16 cmd_otg;
>>> +	u16 otg_cfg;
>>> +	u8  otg_en_src_cfg;
>>> +	u16 csel_reg;
>>> +	u8 csel_mask;
>>> +	const unsigned int *curr_table;
>>> +	unsigned int n_current_limits;
>>> +	u16 vsel_reg;
>>> +	u8 vsel_mask;
>>> +	const unsigned int *volt_table;
>>> +	unsigned int n_voltages;
>>> +	const struct regulator_ops *ops;
>>> +};
>>
>> And because they're so different, keeping them in a single driver starts to
>> look a little odd
> 
> You are right, they differ in control mechanism — one uses current
> control and the other uses voltage control for VBUS in host mode.
> Since the functional purpose is the same (VBUS regulation in host
> mode), I felt a single driver made sense to avoid code duplication.
> 
> But open to suggestions — should I split this into separate drivers
> or is there a better way to handle this cleanly?
>>
>>> +
>>>  static const unsigned int curr_table[] = {
>>>  	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
>>>  };
>>
>> And I think there's current-limiting on this PMIC too, except in a differnt
>> peripheral (@1300)
>>
> The @1300 peripheral is for ICL (Input Current Limit) in device mode
> charging — not for host mode VBUS regulation.
> 
> Could you share the register you're referring to for further clarity?

I think I looked at ICL_OPTIONS (+0x50) and ICL_CFG (+0x52), but yeah,
it seems like I mistook the two kinds of currents at play.

Konrad
