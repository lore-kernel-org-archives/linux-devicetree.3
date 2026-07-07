Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F62B320CD9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411030; cv=none; b=UYJv/zSUWJR7NLdYlk0XsEgEye6acP35KzMPovG4wJw1Xjs0e0yREGUIs3hHgV6BgbKjUW9MLy4XUov1DyqY6086pvhYYsqVekR+qUTbgruYfSqWiCcNRaoZsB0MVjvxcIIzUHF8vq3wHUh+HZYd1+biMuQzuPeQASn51NRnzbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411030; c=relaxed/simple;
	bh=7c8SCLDxz1//Ut0q3RLGJjkmqLqxbMz3thHlFN0cw98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tC2SFRsrovPjkbuqoqVP8sN4NH2SUQ4oCd+886V2U9l8EKvWu+Y1Fklw/HP5LgThWv1Cix9zlQ2anObR149FL+Z6CMQWShGbOXDOjv4VklJNbpllZD5kGPbo8kX8fd9sYE6jLfiRPSR/A07zt/g+Zf/qx8cQugUmLe3ae+zDk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcckQYcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwr3+LCQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcckQYcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwr3+LCQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748mCE2649159
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 07:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=; b=fcckQYcR8YaWsCne
	8OMkkL6BP/ynJXTTEAsp4qAeFWCCSjtyss+7TFUrogT8Wim7hJYNpi6snApgBjUS
	TKjFsDx7XkHgKeZK9JiMftH9grco5VxkAWTNiTqHxZWEj/V/oxN0dfTwapDvVIWT
	6bePbgvZVPdMCveLWJJfaMIlrvyLikhUIiTSt/fsGYitYyYoUna2vUuaPvez1i0n
	/3jqUl9vCs2hdmUit562G2/k6yzexF1+ZLjJnm5PTbhUMXmejpIIW1bSTc/kxYf1
	EkBuvtu5Sku3r6Y8ZoITOOI0bomB3zl1EUtfCs/cVdSxe+O2z4PmKrN46N5ra0a+
	idONjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw384e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:57:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c267931ebso23641371cf.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 00:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411028; x=1784015828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=;
        b=kwr3+LCQQwO9mutqvygdfGQQx8txZaCEe3uHidIl7ZDwM+z/C2VeDcpGzc2oRB5Lo8
         ZeE3po2kPJeplXmjLzf/FyBxsa0I094B9Tpd4dDLIzkCfzRscy2UDXOLy27XiEjVyv1a
         aN/9wE2ICQCXfP+wHDEwZSPhYvTnetbM6ZXx3EBOC+IsstrdNLUPueAXILtPrG57lmH4
         8N+va0rqFBXjCSBictphl1lLpVIfB8MSYRHHMJs7qiLZJPVwJzBD1iikQEYhDdveDBMj
         Z1YnmFjfFaVFFUUv9UaK4NjtQA7B5BohcisiONU8sVG48Wjo+pTKtdOLwSu2wCp64fEV
         AdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411028; x=1784015828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=;
        b=han0r+1VvCtpbz/CmyYEJlUIoTMkFxGkiWHaGL9FqBuv/VoFFn/p7PwVcysGxDn33A
         8IQRvDMPRuucdaeiSQtuAV6zTkB+uJc80yzY3mY8FNqAh2A+T+gLn/iaondFLs6ZfRF2
         zGQyql8rsVrTgSJtldfaagaG2cEktgHi7qKu/oybsEHJRM0cOiwUNkbHmTTXHXENNcg1
         NdHOZBuWI+E52flqKLWl/u19I6dtTlRfGNP9Lf6mVSFrM71JjuOW3HaNQ4UO+iYXDR6b
         yPFS6CHpN99NAS0ptmpNR2iZGYsuQ7zV4cskwRLPt7aoYADWi+hW/dcVKsVsxG4tj/RN
         YYHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnQH/TK+2ieT6hwDAwqhOvZcSncufTMw0djuo7ER3/9pbWJ+g49f+ogKFa1o5Scwo33t44V6xqyMB3@vger.kernel.org
X-Gm-Message-State: AOJu0YwoB+bPKdr3jy5/QJLbV+rJoFqQFwwM9YZrUmJpV08jQz7zTTsz
	j1xPuZVCsbJl6nxerqbfMfX0ek/78mffcC0QQDIJWckBqjlmSoaAROf0LQMF3U9tfj7uu3lffrq
	muL5FAORPdsQNOgNWK1CFlknjJBHBuSlJLyzvyuUmcOwyXjjAlcauuSXcTJFdq97n
X-Gm-Gg: AfdE7ck/h22fyNdCzXcEteibUzeURwRT3dwKvk0bTOKbPJZVEPTpT83yL3DEfWWzDf3
	raIMZN64DEBTWVh1cTWN1KrMiNhiJYXccmNob1BQ01Q23GPv+AqMI3/bWx4ekwEmNKH42wui29c
	U35DFF/FOphpYesiOxjINOPysZDoDWQPCh6fxv+PCMACjderoWRqksA9B/oQ3CCAg9hMEJ+V9jp
	iCzbENrcydWyyXqGBKxRTPzEmDgkVXFU36e0BCxemxDZ2jLaoxf6wbM9hEjlNWVtbctWihcwhVn
	ncTeCq1b0z5q8bqmphZfXtkJR/Z7FXUMRbrwWAZfFSt9LK6eFoLm1yB9cRKDoLSWhQ2FhZKstCm
	8DMChbT/837bOa5Rf0kWU2k206XwJmDUF71g=
X-Received: by 2002:a05:622a:9c3:10b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c4bd5a87bmr80136151cf.1.1783411027788;
        Tue, 07 Jul 2026 00:57:07 -0700 (PDT)
X-Received: by 2002:a05:622a:9c3:10b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c4bd5a87bmr80135851cf.1.1783411027315;
        Tue, 07 Jul 2026 00:57:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82311fsm75880366b.8.2026.07.07.00.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:57:06 -0700 (PDT)
Message-ID: <c9fc2770-d436-407e-998b-b7ca49ee344b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 09:57:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
 <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
 <b11cdc41-e88b-4815-9349-453f1bd5f14c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b11cdc41-e88b-4815-9349-453f1bd5f14c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NSBTYWx0ZWRfX1Nou1GPBAid8
 iPKlgrVMgSfUuxdzGCZAi8YIyC8wQuGIpZqmVfiHkZ6h0oIe7IM4xNUIYKfxAprdvE6fWcG7Z3h
 0ERTsWt7r8SfMfe3TPlS+fWNwbhypE0=
X-Proofpoint-ORIG-GUID: QESQ6-5AXKDmwmf63V8U7Q0Uz3Pz_AAd
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cb154 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=w5vk1yBYWc5d-UbTd4AA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NSBTYWx0ZWRfX4qWADWMMQSUA
 RbMmePVC4p27cismpQjo6wurxdMJMtiZRjFbItLfKJJtjaoEZcaZZHCU7wg76Kz0ZXl6V/+xilT
 6LZTF6ZaatuoZcagoJu5weLCzo+x9w7hkI4dvm3gciAMjd/jo17GDolS/seFamnmMMOT1lX0z9q
 sq6ckAm2TE7NTWg/CcM8JVeVGl3cVV9bCDloHNPjxG6hPMhooWQxxRbJ23Pnc+7q1W8nBqqbCw/
 kPj/qQoa8n8uA6xLHN1zLZSR9hv4yon4GmGf0pTrbwoROn19PDikDroqxn/MxOU6XMJa6bsC4e6
 vIct2SJHkisDg5x4j8cytQR8pzDw902TgRokrLURGl/7OV0wT6wM9ngoS/whQIWE2DjrqiSw4g8
 lmJpMvAowfunFffbn24X70pOeGE3+md4x/kC6qSQ9tno/E9jjV4MYUkxHuUjR8Knl4Br71K9LTE
 7gfurBaBC4vjiWokGIQ==
X-Proofpoint-GUID: QESQ6-5AXKDmwmf63V8U7Q0Uz3Pz_AAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070075

On 7/6/26 10:06 PM, Akhil P Oommen wrote:
> On 7/6/2026 3:07 PM, Konrad Dybcio wrote:
>> On 7/5/26 10:00 AM, Akhil P Oommen wrote:
>>> Adreno 840 present in Kaanapali SoC is the second generation GPU in
>>> A8x family. It is based on the new slice architecture with 3 slices,
>>> higher GMEM/caches etc.
>>>
>>> There is some re-arrangement in the reglist to properly cover maximum
>>> register region. Other than this, the DT description is mostly similar
>>> to the existing chipsets except the OPP tables.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +			qcom,gmu = <&gmu>;
>>> +			#cooling-cells = <2>;
>>> +
>>> +			nvmem-cells = <&gpu_speed_bin>;
>>> +			nvmem-cell-names = "speed_bin";
>>
>> This looks good to me, but I thought that on a8x, we're supposed to use
>> the freq limiting register in CX_MISC - is either of them preferred?
>> Or are they just hardwired to the same thing by chance
> 
> I believe the other register would work, but I don't have a fused hw to
> test. OTOH, this is what is commercialized.

This is the answer then

Konrad
