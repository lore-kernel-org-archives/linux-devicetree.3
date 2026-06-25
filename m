Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C11F382F28
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379551; cv=none; b=cKSDFX2zKlsTspKJSO1OsANDKhr3Vms4AB9JGvfOFs0/CtscpfhgQU4W212DPGzqLEAIEw8zx3g/iInM+gMD6fDow09wls17uKSvNigd9AwtWMAbs3Inauqj5uGdQ+kMTdTDSTUT0YgCmDzwD1xBe4s08veFAzsk8dXYip0ipXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379551; c=relaxed/simple;
	bh=mpqs54Wb5shBS/1MAClimQNQaHc1nhhYLU/Xl3JOkHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XndhTeZ/TjCmKjaqpAlU860vjgHxBg+EcD/hMMNwfPmnSSOTxzpNg3LLgUYiHn8zWw0dYoehKuQPYMlkJ1c3t5pIstJJ+qp8k/dGALMsIbbgrrHtuxmivGV1EJ+vg3QSaANfKKP6UY3hSq3VLRF73Y9g9K/x+fdzd2egoHisMH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxmVHzLV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BP4AcaJH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxmVHzLV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BP4AcaJH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pWk21795845
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3baxmnLBjtU1mZovM/rVv6XO/y+AryV19zGLtPFs+s=; b=cxmVHzLVbVxqv9SR
	pOrcNXMSMu8tEkW7VVjQAV0cvIvv37VromLCMWh6LStSx/pj0xAlVShzuP/wQqJh
	nDTrhMI2EjO2Hy1HVezp+hGA87fwipXtiK5Szx8TZB0/5w/haZvevd9GeWdMf3sS
	BxY1mzVI70cgtu3hcwolVfioew2ZekyarHUtaDL10CTZOtVR1i/93ap2towlLhee
	qDnLY6KK15UumKr9b/8fPtggtoDTEVxC0XZ1WilxvF8C0Jjyw2CwXFeRy932QKdG
	SzoOycVYNqMCbKi/hVHB7Jjk72JGcOBA+6u6TfWxtEKL8s21uzAmatMvhJp5ynhO
	KLKXTg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9gg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:25:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8895156101so1378944a12.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379548; x=1782984348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3baxmnLBjtU1mZovM/rVv6XO/y+AryV19zGLtPFs+s=;
        b=BP4AcaJHPAXNZphiqPzXbG1X5Jd0PMTgLmvbTDKPitGNRsVZxHyZSUujxBs8VezvcC
         fLgV3lCORCW6ej2A0F6D4/uvvnYgNo+RebdVFOl/BtDYzD+OIIgxLtkGYEzv5vZIXecP
         H4ohY4p1CLyEcjnkupuxe2L5tep29QfwCD3T18vvDnIgMV6xp+zH+PECD9+iLbnyVpNa
         Se7eXdRpy8aV3CHPGb3fEpTiCA9lwaLkmOC+qzKhWeTSfMxvNUiF3fIc8BnoaRznhV4k
         gi3CZMamWDgzAEvjiUI6CDJR/O78Pvqk4qE/D5e9qptcc+vtJUja2/GZxNmSge7nKEtV
         3lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379548; x=1782984348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3baxmnLBjtU1mZovM/rVv6XO/y+AryV19zGLtPFs+s=;
        b=dB7fy3OQamzaWY3Gjb8jytwpw+va4TgbA14NmcgW1VJMhlootewODqa2Kb0VMw8+IV
         XQCE0TySQ8a3L5pvLs1eUCsAqoDNxcg9FZXpjiLXf1Bou571pRavB7l2RK2vWHukCWAD
         qUYeFUzzCkxuDSg6/ZKVl3jEckv+Ley1iI/mDjY2vV7CbIMMTmnBIWNYP80zpcTrEOjq
         px5o3lddzcP6O2PNzVYPRKapEVd3DxGZXi419GZ3/kMh/roe6oWDNroRBWj8uxZIe0HV
         ukgFGvHaLboyRfsP0wVgpXBq+rlGWs/s2RnpaYDLx3gxy8cWzmjUkXy6lNkyXxq5aIwl
         gvIA==
X-Forwarded-Encrypted: i=1; AFNElJ/OzOANH9+EVskHgHeUTr9FRNVbrRapTTfhb/a+aTW+2UfBrSoXrJ8L2wQvn8df02W6C9RskoKbAGmV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3RvQ+XlL80a/c0NUf/lhL8V+U0H5wC3LSK+Uk+iULYaHxQ+3k
	dfDDWFNo6z6yEZVvJbUV8h2q4gRxsbU5i2SCRLAo6vb+B2CLbfcm6REckKsbynMwY9s6JxQk6of
	wc2yB0wHQOVRwWV+bNDiMwJrvoMQIqB8+V6ETAYEnb0gcEm6DIpHnqctxHOdYnnPt
X-Gm-Gg: AfdE7cm8HYJRUr3S+awKdJX9d2jjtZ6Wexsi2WYKyRsponnTVLJBA8b2fgo9U7srhht
	Id8P3BbecsnR4/M6H/pX9VMyrMaS8ZVlQIMdAN4YL3qhrTlzDzq/f7l3MMk3ZQ09AWYk8MGCcgV
	nrvbtyZ4nUpu25VFJugZVZL87aqoskGH2BNqNqZO4pJQLqzcoB8XEQRMRI7tL5NFGa7XRXGW/ww
	hAS33j/rxriKodKLtw44JLmYvMJwtjjIv8FT9uJRXMn5jX3MF2VJEatrD9RUB+CrCnwH+qTTSLO
	y+XMi/z1CxIFWXlTqMd7hy3AJ5yiqsg2+t+3Q+NZGmoqEr4e+UQSnAVz5A5Fxbld8nbvUV45wrc
	XSkH97Nb+9sngeeVx7NgoQlj0x88T6f2/jPg+ZA==
X-Received: by 2002:a05:6a21:700c:b0:3b5:6b5a:4f30 with SMTP id adf61e73a8af0-3bd4aee74acmr2233244637.6.1782379547889;
        Thu, 25 Jun 2026 02:25:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:700c:b0:3b5:6b5a:4f30 with SMTP id adf61e73a8af0-3bd4aee74acmr2233205637.6.1782379547449;
        Thu, 25 Jun 2026 02:25:47 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b96eccf8sm1374242a12.3.2026.06.25.02.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:25:47 -0700 (PDT)
Message-ID: <ca904fc2-ed59-46bb-bf33-931868af0a9a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:55:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
 <c90884fd-a354-45f3-bbfa-77c58d8d3b1b@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <c90884fd-a354-45f3-bbfa-77c58d8d3b1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JXhybgjAeIyM2pnN5lal_RetpeOAimQh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfX2z9Wq71t03di
 lOy6BQMfSTXGu3OowA75hP/cGhbLpVXL5gvJpBc0NxMvHaXAlsILlCDyq0s1fkE2eOcUgmb0Ktk
 pjyJZfDMu/1TBSbt6hBgvRrwQ0uSQj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfXxl9NDBwuO8Ro
 bOgann0MBjxbKC6LYrhiZN9zBSoQFYe4vNJ1TEGTZ305kIY3vKBOhu/jV8V7wEBZT3XHYK8dARd
 AVFrIr/JKVZkCY5PDh3h/zCVeNvx2jqqcBM8mrwQesow3TvX+IrDIHuLAJG09+DDggkVLC8vMLd
 VP0j7yGmddviYHb2BAACQv5xUTazoohf7mA2/5deo25Y6j2uFHN4ppZ2ADenUizNCLRqx5zXDph
 kL7etCb3jP9w26lpOUCnpuimLn3B0w5ftSiDDrc+gPH8v62sriOI3f6vT8Nq/7e3Bj3hVUeoecc
 sYBtYoeSqqsKVd5kqgJo+AnzpNC+KjeT9CjK0ZkG3wMIJYSHUknLxbBNCFlO3CWQJYoM3wFg8h7
 p+Fwa0L8HTcSP9sBhqpKo5Ed8WP+n9Zh7OtskNMDzrjuf8IMd7UZm7viHuTMotTzJB/y/zlBnW9
 bToFAHqwklkfEu36SgQ==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3cf41c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=i0GMp8VCEzuJnllDaPQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: JXhybgjAeIyM2pnN5lal_RetpeOAimQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250080



On 6/18/2026 1:49 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:

[...]

>> +
>> +	if (pdc->version < PDC_VERSION_3_0)
>> +		return;
> 
> These version checks should be unnecessary now, given the function pointer
> is only assigned for hamoa
> 
> Konrad

Yes, they are now unnecessary. I will remove in v4.

Thanks,
Maulik
