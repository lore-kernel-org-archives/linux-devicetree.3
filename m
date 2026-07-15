Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CBA2EEE92
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122876; cv=none; b=lQcyEbSj6O/nERlncLnbco6U9tEvlR83zbkJ8CnyV/pkOF2DTgNDrALnwgW3WrEHrY9Uj3rEhox/pI8po7bKhbGrOc3J3LjqSyl5VX4Isi+yeNQBy3OGjUv4AV8arZeElojYtYxO9b7C1FJP0Yh6HASkY+2ZSoFqPo2xLiF73Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122876; c=relaxed/simple;
	bh=pz2SYwnFXEo45x3poxgyvBRBbqKCYUxUb17sAp4CMLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8Bd3y9OJdE1C2tXjz4bkfOvEyFW+3sTdftK7aYCDImB2Pj9tvgEkEMj7HnY0jHZD0LKjk4UKaer6MJnH6Q1IKAC/yTK+c3EZD6Rz80DQ5fq5hTNBdbW6QRfrlkQvo3dTUkRW2jLd68iNGb3XWif/BxXOaKUUllXQzout92TCUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aY+PmiaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4E4R846; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aY+PmiaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4E4R846"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcl1j3678369
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pz2SYwnFXEo45x3poxgyvBRBbqKCYUxUb17sAp4CMLU=; b=aY+PmiaRg48/HlSe
	vRnBgSuzHMhSstyNa8a/9mrzriUVMu+7ckJvNBKVeZMoppt64ss9KhWTesJPe9Ur
	Qrkm1F580Zqe5AHf47PbGDjrAr16DJC3M0uTSSw8wpjCr5uteZemAYFTOyMvxZK9
	1f4C8zsyQx7i+mV8GVwBmI/dBYnvO9laS7zMMng9v+LF+hgtLhexOP8EVkfBj5bC
	KmVbqQnVyciR1ACCgYhd2K2U5T75ZgrNDY0zbgudulXPhDjWsv/1urnOCRoCzGNS
	FwIhohpIrcDI2qLby7C3O4pUOf+OMdW2htV2w+WQwqkDgFWSoZL+MLEicfNPK2l/
	nS4llg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe6529c31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:41:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so82494776d6.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122874; x=1784727674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pz2SYwnFXEo45x3poxgyvBRBbqKCYUxUb17sAp4CMLU=;
        b=K4E4R846Uhr0Plywh1igSz6qVhwy4vJ49lI+C1kLgyQNpZUbLh+dsLhE47jFHiJw3v
         DNrEO220byKyiJOxBFXqpjNFzLhuYtqnsLFnl0ks4FoNhlFaQ/WjVBY7z3yRZiB3xxac
         6c0a8/59uUkPlnCPMYZDDUrTmTDZp7cAfB6XQuGVF9scv7ulPuEszJykjPJDwz4xGzyv
         kUMyPBo7pkqpZr1oo24DaihnUdfaEc63bjaryE8McOLYkgNBn4s7E9euHnaIKWNIYOJR
         6Vah++oRTnn73SlVAGyVpP3mFdUSdNPzuiJ0PZgs9p3NubK+ldSoP3AO8Q/eROfpEEb3
         DqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122874; x=1784727674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pz2SYwnFXEo45x3poxgyvBRBbqKCYUxUb17sAp4CMLU=;
        b=FZjeoLgADABcdNquFGs83IlKw5wPWDg6kwz9ojXiA0NfQOvRBbenWDaEjbUO4/Giyr
         LGw6G+Uw9Im7RP2X6m6WFAYM8gQLQdRaRxvE5ra3EF5A5vinQNok2LfJY2R+tPh3iqJB
         b7JaVeHo/8x0SpNj2jzGny68jNNcSjdZR4MedwjoF+aXXMykjBvY6cl92FeppDUyIcHE
         cMaVqI2DPZyfdeN5bhwz3G+PTMU+WOcKLHWBdQzy/RjAqpVH7uiq/tSklaw3HetcdOF5
         +qrv+jUrpLochfSF74XjtyUV0GXFEaV+GxRFtIT8NZc1CkGlbf++ezGOiSJ+96yS6prF
         b3BQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr78IIkZk3wRE2pnk8V/aJxmHk90IltwTH4UTvIAhb6DJJxcrse7oUoLHFgN48hy5A5MQOlpbF13HNT@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSU97c2J52wGgbxKx0Gl+y7PCDAuE9cxCImzLFEXb+28Wc9Yb
	4na4D/8z2IqbP4jqUbaF4B/k2jXnMoaJXkyQ2OLbebvCwFtsVEDFZmnC3ho9xbgqXnOaEG1LJDm
	f4GorYGgtBf6tDTHxwrdf2V+fG7ESHSniwt4bkDh8+fgR0U8zboTkwGyJ6/cKbNj1
X-Gm-Gg: AfdE7ck6WK2v6gz5Y+ctaBhIX2XSx7ae75F0naLluduYfgVYs1l+/UMkBJoUcRKtglR
	2SjrrCH1JDYhaWOJZ+nJi8Sq2Zqw6yRgEMOfvnDqHdXNvLam3hwnpnlNWQr6JFZxM2CwxveDp5B
	4Zxu+UFjdmyj2EVBZNOq/2ewrB5YfWRNouRWHpmZxp3DbAQnHAhk45mF5sX2sbPSuMxDVH7gt5C
	C+CPVQp0FghD2m7VDb/4rjUoP1tlAjSN3Mmg71k7jLSyc4Nf3ocXyzJX30hjoc1pV+in15yd24T
	0cK4dg/H7Dq2CdpW+FaaDTL5BEDQrnXFO0glHDhlpxAGCm+RZBNhra++kshM/dL+raVQs3fue3o
	FVZKzWl4JnG62jFtt7rwLI+n2OrlxzdNpDs03mQ==
X-Received: by 2002:a05:6214:488f:b0:902:be55:9f2 with SMTP id 6a1803df08f44-9074c826a7emr78195056d6.32.1784122873635;
        Wed, 15 Jul 2026 06:41:13 -0700 (PDT)
X-Received: by 2002:a05:6214:488f:b0:902:be55:9f2 with SMTP id 6a1803df08f44-9074c826a7emr78194556d6.32.1784122873043;
        Wed, 15 Jul 2026 06:41:13 -0700 (PDT)
Received: from [10.218.18.44] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c9500sm193023346d6.46.2026.07.15.06.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:41:12 -0700 (PDT)
Message-ID: <4f641f13-a278-4465-8033-670c7279a7e3@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:11:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
 <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
 <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
 <986da1da-db2e-4d4a-b9d0-70482adaf4bd@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <986da1da-db2e-4d4a-b9d0-70482adaf4bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX1NfwRDnKKQ6B
 D/IDof+QAp7M9QaHDE2+7TZQN9ubNe8cHGaMvYZdaq3/aWbVKVk8LZjz9BkyMNIFaKTH23wqOn7
 IgxiWFT8P2avgac8beqdgExMasIlPmXQ04HSB5GDOBvGOufSfu0JNChdTGifZoKeVc964sbEOdz
 q9iVpCFylJ4jVeUAtJ1pN1dg1B5g/J11ancu1OdGhEvJX60/W33ueDCGtRd5O/smm/w/wvUhhQ/
 ibyNhpMCAlbia3+s5SxU4qnuNMxWmUzmrHJPMctqyTW31t73eGEfk6OSp3hQLFVbVxOAJl7mwCP
 j87xudw+3Q+moc0UDyyPnB5Pm9GZcLUs827GoJGVAr8QfvdUVfODZogMCqQlRYstPwF/okD8FEo
 b9jfCs5a017Ek14JS9+TBh0y6To5ZWmn1qps833OFaxKcpaAzDEGmD5dwNb/QBztOYPfzrxQU5K
 r+xcFY+g/DVjffo/RWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX/vAYIzoRGiN2
 Y0EMZMpqVrSYbfjVvRF35J/+lIfSVx2vR4/zqzbDyK5PIB9hKwVCJdrJD28/d+5L1/M/GriUghe
 zTLgRhcCSzmyKap+Kwjt6jvDpWBbT3A=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a578dfa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=29Tt0ABisfwxuJ5Aca0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: wLPD-C27YYEjyfAic6_kzawg5bw52UlQ
X-Proofpoint-GUID: wLPD-C27YYEjyfAic6_kzawg5bw52UlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136




On 7/15/2026 3:57 PM, Konrad Dybcio wrote:
> On 7/7/26 6:36 PM, Komal Bajaj wrote:
>> On 7/2/2026 4:25 PM, Konrad Dybcio wrote:
>>> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>>>> Add gpio-reserved-ranges property to the tlmm node for all three
>>>> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
>>>> SoC internally and not available for general use.
>>> These are generally added to prevent non-secure access upon TLMM
>>> probe, i.e. the board won't boot if some of them are not protected.
>>>
>>> I assume the proposed set contains both ones that are _absolutely
>>> forbidden_ for Linux to touch, but also ones that are dedicated to
>>> some specific purpose that Linux _shouldn't_ touch.
>> Yes, some GPIOs are reserved for secure-world use and are therefore not accessible from the non-secure world.
>> I will update the commit message accordingly.
> I'm not sure how to read your response. In other words - is this
> patch boot-critical?

Yes, with Access Policy enabled, it becomes boot-critical.

Thanks
Komal
