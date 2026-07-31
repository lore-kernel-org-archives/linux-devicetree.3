Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC44457B1
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516150; cv=none; b=eaG6XgTJzJSq6Tdl7zf+7WQ4WkBKfB595Lhir+mgFhRuRXCg9bmeXGnRsZ1pgIramJm/sJ5H4XbixtCpDmDmpvmjLeqcCsTBZhu8yuKy2/YE4j5/XldzF0rcf32+VQ34tqpXKoqMnGzZN7btvRY/tOfyTJ9NmyTC6lOgxSi5y+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516150; c=relaxed/simple;
	bh=j7oNLmRGMB7G6Bknh5UBWwNbKEi6AzTwDDWtWUuYDxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsAoY8QaHw7baeONmLWBJU9jI7ZnNPh3HHr/hnJHwZ2m5Mrpc7l53rFgvrFb0A2io7OOrRtyjYd0SgJ5wk+ABT0K8eXf7+LYMnCCKcY/DiLI7LCmWSjkNXk/pch1IPz1OTaAjCe4/d8WQ+Vdku3gDyr+z9dmmSMLdieV/7Hc4Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWyCUDqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCJM5n8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWyCUDqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCJM5n8v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOALH3879461
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kl7Z2qOkmquPX69ck+O7i+EQ9JO4vg6bvwMuEcRZXs=; b=iWyCUDqUGRxgqRqB
	soyngGkJSiQdGpu7AqErmbaNNBcysw/bB6MLShY5bKTqsU4cEkZR16GXkC9sOBOK
	fTVxHO0YQ05ExrdftiLGafcaG8ofrf8vS0hGXnCGkLy3e8/DT7H/8P3ynwusJ5VX
	pnnZEKP+dxa5ThpnBSgXesrd25bhil7S83jeSRV6ro8sm9LqSRoEeevJHNPaS4CG
	Vd7GQMzdtyrxWneanaGXQiXxhzoz16KoZVqLj/6qTW08HsH3ijAYI0pbs+MjlV32
	llmGHJqllwbudh3j6591IpekHR0UXi6hByKzjE8Gc3Eq4FXJbIxTiwMgI59UAihG
	k9Vv7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y19ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:42:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so2037241cf.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785516145; x=1786120945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kl7Z2qOkmquPX69ck+O7i+EQ9JO4vg6bvwMuEcRZXs=;
        b=bCJM5n8vUyZY0re/wU4C0VMQ2yv7NSP1JflTB2IC9IL0SyrWFpcxHiEBUbkZ8TD1m9
         KIIobzHzovqpJNsoCYWQ+mEk7nlQuN5qkB479GglwZylRFEETE1vehv2nlkU6n6yw1EV
         FxT8J3zqqNz2gtJMsmSVnHDyPOl/aG5Nwl7ncveZlkBqVH07V/GvROXGEIz30ItHae5J
         OaFtZxsALia2hnjOUQ0uq7nj2H9tqJtzjfM56KuEvlyA5fwcPw6L4HeLSdmE17PnYS33
         1jU/cOXLtGMDiGb8cJRJbFHv/1obIELzkmCIx31DaBRsdhIFln5Lpb6dq9Qz3emfL1Zj
         KNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516145; x=1786120945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kl7Z2qOkmquPX69ck+O7i+EQ9JO4vg6bvwMuEcRZXs=;
        b=tEsdhDnIjXthyZIEUx1ZS2OACvRMQHqo9HonzoHV4k/X1S+5e19TiToSSuNyUA88OH
         iCe5b8eGSVrXM2N+qBO5xXJl40+hYAyvh4SzeeQTgsJyHiHAa4y13Y06vQQf+st/pacq
         x/f5TDkpR2px+uvFjI6YmqqwP0SAZF18g/BHH+v3TD2A2uAIRe6X735Z1i/8l9NGBUMD
         Z0Axf+rnfpVIJ1JLj79ts7wR+qd0kLWqBqGA09n26X9j4FUCNWxRvW23C7kg8CbDL6Xv
         12d5cFD9L2uSa277c7Sw+dZPXaRrSc3m+7OH+riJcTj/WCPdyI6wGyZ1r0Fu6FWPGeHW
         75wg==
X-Forwarded-Encrypted: i=1; AHgh+RrvOceVAGmLHCWBDF86uNvsnmzTpQkdbjdK57nLnl78zEiKX5itnlGaF4YeJuCmWn1inpK4TaTYF5wo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0y+CsUQgvEUcT+SflKwiC+HYB5m+ZoWiq8JghNbXZCY/4mkfi
	tRUjfZV55NHqsio79rzGGYS+DaUQRvt3yESKrfF0vIGwbVCxSIbwWMf6jX421jej7X1syk59D7Y
	KHEcXWCzVbaPHwN3Yy4MRH00Kz71ntFkIJBOIGXWGCkosLm70l9xiol3pLcTml+QC
X-Gm-Gg: AR+sD12L32NcJ9RSFTyLseZMUtqHPVRvDzPOcx3BJ7Vjer2JC11wRDf1WoUQbwGz4d4
	gSNg2TAy77YR08MwmYja65O7KfkT1SiEj2qEjF8lyA9xAl2OpUFWwWyT6QuiIlzTWS2/G70flpZ
	VO+5DUpuxP3yNcD4dmSc/EoZmG8ahZJ2e9bKnEob99udFMywz2DqRE3jGAiEU0B6bquAyfShtpE
	LV4qfMUrwbHFS4zA15BCx5GCBr1P3jwATe72buRkRx6TsBBiOwGTWOm1v9254W08BwGJvbp5Bml
	DoZBkX+5eamgZLoV+mRHHRt8Jjq1FEm7PRfV5KQvp6Y2DQAefL/yC90omGmJ+CQNjSeOtNBC/V7
	CHsBvwBXCm7AlUIkp6ptdTVMb
X-Received: by 2002:a05:622a:aa42:20b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52b56737710mr9634221cf.2.1785516145145;
        Fri, 31 Jul 2026 09:42:25 -0700 (PDT)
X-Received: by 2002:a05:622a:aa42:20b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52b56737710mr9633851cf.2.1785516144687;
        Fri, 31 Jul 2026 09:42:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd450d731sm218741466b.47.2026.07.31.09.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:42:23 -0700 (PDT)
Message-ID: <b300cfc5-b6be-4227-905d-d69200fcf857@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:42:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
To: Esteban Urrutia <esteuwu@proton.me>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
 <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>
 <20260731-savvy-piquant-chowchow-f516f2@quoll>
 <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me>
 <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com>
 <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me>
 <2ace2703-79cb-4046-a2b3-8fdeb9b2c99e@oss.qualcomm.com>
 <f3324409-8e07-478b-a0e3-da5b41d31e7c@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f3324409-8e07-478b-a0e3-da5b41d31e7c@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfXzO6PVAUwrM5j
 Wjpule1SMDnr3/UhsjUfacrIWcyA8XSj5OOMLmOuTvHaWe/lhwztp1UMwxwyw+ahmoKiy/g5Xmo
 UYtgeLYS3hCWTOkeDuTIQnuAGX6MFl0=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6cd072 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=x51eZAOGJv5k9Dsnt6IA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfX43E5sUhRCark
 v78bg6VkNx6cvWGZe5rfVneZerXzNQ4cdZ3293tYQnPVRMN9Yh6rY91JaQP6jJGeBKafFzASIQx
 ElL+FHyVW/Gtu7jmA+GIM0wW89v/HxR2Yb596uuOmvvqqGnlBq2EVaLzy4tHLKBU8d7gFap/sEo
 i1xBLcqi4eOlNowXvLu0FxL4xcDVpM9QDgyUktBrWf7MJP57Gkh5p6eFq3HGVb9k/p/tLc/2n3k
 idMP4QQt37eaQtXa7k4FDmAL1fZt7N7EZRnK3mCcEN7lZ6B73f/O2o1IWnNdcTZ5QgbcmpzcSvi
 n8lSC0X2kWhpBHGmLwDlIQj6j+5guDh93tLquYSEabjXHIo0NIv5WszRXKN+hV80zxbVuJdZPMF
 4QgvkMf5xkfoDBl/5pDfCbqYueAfB0SGKgzA3Dg4R2kjOuBb0Q9fQfDmkszqpAL1OuEk97ncduy
 cGMC1dCbavvJ6iZx+8A==
X-Proofpoint-ORIG-GUID: oQ_8Q2Bt1Sf9BIdEkj76pVXFx09faz-P
X-Proofpoint-GUID: oQ_8Q2Bt1Sf9BIdEkj76pVXFx09faz-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310127

On 7/31/26 6:40 PM, Esteban Urrutia wrote:
> On 7/31/26 12:28 PM, Konrad Dybcio wrote:
>> Somehow I confabulated the generic compatible being present in the
>> driver... I was trying to explain that
>>
>> And yes I didn't notice the 8350/8450 difference. But anyway, the
>> resolution will be one of:
>>
>> // 8450 is fully compatible
>> "qcom,sm8475-pmic-glink",
>> "qcom,sm8450-pmic-glink",
>> "qcom,pmic-glink"
>>
>> or
>>
>> // 8475 is special
>> "qcom,sm8475-pmic-glink",
>> "qcom,pmic-glink"
>>
>> depending on what you believe is more correct. I think the first
>> one fits better.
> 
> Yes, I agree the first case fits better, but I believe there is also a
> possible third case:
> 
> // 8550 is fully compatible
> "qcom,sm8475-pmic-glink",
> "qcom,sm8550-pmic-glink",
> "qcom,pmic-glink"
> 
> The reason why I believe this is that I've found SM8475 to include some
> elements such as eUSB or PHY sequences found in more recent SoCs such as
> SM8550.
> I guess that's the case since SM8475 is a respin, but I'm not sure.

pmic-glink provides three main services:

- UCSI (Type-C)
- altmode pin assignment notifications (also Type-C)
- battmgr (battery/power supply)

In that scope, I believe it's no different to 8450

Konrad
