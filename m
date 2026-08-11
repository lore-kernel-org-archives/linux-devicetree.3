Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDA3A0B3B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438077; cv=none; b=krZxUfB9Qmo0tWZotvZTAUiQTJo1ZCXRUsl46tHkUBq8yQcPBufv3AcySQBtylrQo/MZ0AwLvuPaustZutjmqMce50uNooJtHUY/Iaiyyt/muBaIrt9YPdR/xzaLJYk2JNVHNM0Ie9qKxRrl/9/AGsLlLUTHp9UB6+jWtaQ6ASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438077; c=relaxed/simple;
	bh=nlZz19XN7awnyEKhzuHi/ODOUtY3fqZfOGUfXjrIAJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJP2IuXdLxNnaWoxNH5W2H7auU+85wHArc6Ea+FNIcWk2i/0v+AOWF9YRhUnW4pPPldC7rOpNvnlHUuZz7F4Q9vmHTrWyEcwelGxjaJEDgNvt4gYXg/RkmXrJwansfpDy4wRWUZKMfFkFhjWPdTTHZefzbeR9NO6u0kcYOxgKGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EViuzpgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzVQtWS4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EViuzpgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzVQtWS4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B75R373047857
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zs6M5x/IJHIz35xrWOfuNuYg
	mtie6/frkxCeKyDzv5g=; b=EViuzpgXN4skFlODOIGKS9vefmwSh5ExUHAQpYbM
	kxJuWLbnzujxZn98hp+bqs9N6IadOTve9x4sUslc5gNfnVGCOlPoMqLngIgl7Mcl
	hJnVwC43POx4FCT+PgRNsqpMpNYP3E3pZsMP0ZQ5Uj8zWfxatDcP+smcF0X1h9wi
	1aF0zLhX+Capw+eA3KW0ClmqLcI6EAIlYNnvEuD8wCXz1bb9eqGeXWQUvRcV6KPF
	zp4lPdgVCsZmSnxkq0JSCA3ye4vm6N64DZ5U1O0eelVcSBQnatR+MKSr6uF7CT8D
	dluoX1SpipN5435pkS+1jR/HgzK9Nl+Xks/UEsWdWp7BUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk23ad2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:47:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso13498176d6.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786438070; x=1787042870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zs6M5x/IJHIz35xrWOfuNuYgmtie6/frkxCeKyDzv5g=;
        b=OzVQtWS45Spj49Vkg6CI2UVpuhCieDxnk2FSDlpYqARQ2fxdbH5/wGe0rOvvJdU0/h
         UnX455bX21LkqsAgDfEIL5xDgX215MVtno5K+TlhbRIB2uP5gADVDLfkoMk1jGXcC1DD
         Fd61Prvlh0j/4x3uYX+3IFdgYHTksA4OZ7yK43yP4IrjkIMg4r+wSR1/itBXeq5MoHye
         MD4vI+wEoMQnneTPcP91rNv6wLe+9bsh8ITbnF+Ksala2fgqYRTYqfQ7B1gqKherxtZl
         hWdjHbrezoHktYsBV+tygZi8VbFCvS3JITEz5hrl7vM89y828ojr9XBIL1sJJCUH45fK
         HHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438070; x=1787042870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zs6M5x/IJHIz35xrWOfuNuYgmtie6/frkxCeKyDzv5g=;
        b=KWT5VeYz9pVBIqHV7gxX4pDtDW+O8xrQmfnltZKJq56MAWLBeeOG+36PiGE4LIy3Bt
         chaU5IVfmxF2WbfkUI5e2MKBWAVXWOHVpcKakSPliiQdqxdhYabfDkyeLidZwvifyPER
         qxNzyx+rCZ7VA7DP0jl32Acm51U5J0lUTE8pNOof/1JjNWedZH6CCF4MGz1YQ17qVcGU
         lQuxM89Mc4/XqXXB/zIOSlMeGrNXE28kHZJK835OrBYHTRRyn6VsC4R2vrb6raPB5RXP
         fMYPuAm8PQbdQ7IPIJ50WFBRML/PK/UgcM2Y/BzAPoJazSY6txWIytGaIW2lrff3GzMv
         KCdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVneQpe9lr0wiRS7DiG77uXdMSwAbWtC4Q2z2vyC4tHvXzWYnzI3UZ4JH9NJJtqewUGwrioQGkRZLV@vger.kernel.org
X-Gm-Message-State: AOJu0Yws1czzY6NxqwwSNIroikedb8I05q1Y59fHPNbJe/29dRdTTnPe
	8DgNjSX7F0nqCT7t45cEWFL7HOyWD3SKU1UsuSHmKwNugBTA92Ygze0y6bGSyltpW25DS7RuG2L
	Tek8LvlgWXPG43TW0scLWoCY1zqd6/jVaFXjvFwgc6lLrSbo2Rs9lsKfLIqe1aW3N
X-Gm-Gg: AR+sD104pICPWb5QfrZiNF+ERsa4AYpxVc+I7MOl/UUMLeyHlRUUsm1dqx3jU3Dn5pT
	h9F5CMd3JzDPUbm5cQvZU2HN2GqzSMS4mPVyS2lwWpoJY5OwPZCDk3RNRs+n2x9d50izSeG9wBi
	TjQpTYw6oobII3tW5WMRmpWRPXxw/yH6Q55x6Hh2WILdsuuZlTpSxQ8eK7CYL6nMhphE3peBMxQ
	I8bERnhv95t2jyZhOcXGp4/0xsT9clfNan0wkMwQxM36cxvDOmZmUVaUMuILSYBeiuKvfPh7A0D
	eGe0K4fGgaUpm43uXQlWc/Vpv88A2/uJq4iVeVB08Z0o8Da9npoisrWbbuqcWiJUywFJqn4m3TC
	KGD5lonxpaWob/kRMItVRmeiQYLt7rxP4R9Yn3aObWW+RwDsQLnwzE93rE6qIoRNICg5NroEkiY
	mOvBbKhu6zrSmGZA==
X-Received: by 2002:ad4:5aad:0:b0:8ef:b2f4:c686 with SMTP id 6a1803df08f44-90a6694d968mr10941006d6.13.1786438069776;
        Tue, 11 Aug 2026 01:47:49 -0700 (PDT)
X-Received: by 2002:ad4:5aad:0:b0:8ef:b2f4:c686 with SMTP id 6a1803df08f44-90a6694d968mr10940676d6.13.1786438069332;
        Tue, 11 Aug 2026 01:47:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486ca7d4sm152416e87.22.2026.08.11.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:47:48 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:47:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Increase MCP2518FD
 SPI frequency to 17MHz
Message-ID: <jyfbk66lcb6a32oa5qd4qqs2cxsurkqejytdttqa3dayrb3nkz@chub45xlnq2b>
References: <20260811-kodiak-spi-can-17mhz-freq-v1-1-1d99e360a7da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-kodiak-spi-can-17mhz-freq-v1-1-1d99e360a7da@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MiBTYWx0ZWRfX4f0dhw6ZCM0V
 HP2vZGGJZx9OvWNlp7OGNkx+9xnqaETHgkdAcchasVZ9h2QfF3FQKrANKsb3/CldJGa7hQ4DYX8
 yh6uPzuyLWqxF7TLCIcfVp4p+acupzg=
X-Proofpoint-GUID: 87afpSa7u95LbtrNQpL1K_GBDxqjiq4v
X-Proofpoint-ORIG-GUID: 87afpSa7u95LbtrNQpL1K_GBDxqjiq4v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MiBTYWx0ZWRfX3+0ZJz7f2omj
 40GM+peYvSk3N9GaGs19r6XSE5XHHOYh2fWW+yioLQo5LU/DDXSgoW2BvSCbkLemnm3QBE/w+tV
 nL60ENhr3S9WEZjX4bHPsdvScZhQZeX3K6rsShZEAFn3shh6HtS0eRErzAGQ1UVwi8zJSE+aHIK
 GWNmDp5jKQ3fYUaNOev3cOudYBXV4bVo79xeiWrgFjpa02YAFbfCuMkWebXTw/G4i0Ea5vc606e
 jRU6y2wCKUo2Z+ePvgUzY24P1i25jnazrJNRro/UUYRZUzHMR28bsEViZx/pX1Vce5Fa8oifT0S
 GjSDhAVZ4Ujh6RqX20nb/rcAEeN7qTjbl3ojX308k+35hJZc53XHubjg7o3zSzFqN7rUsU+s68j
 2x/1HPu+x2bnFfYk9gZRZEoFADMKqDDG3KSbLhYXvQp5LhYqKW0aV3b5u/M6uFYDWrrQVfW5jdU
 rM0PZDyawD8B7INjDaA==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7ae1bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VqLSbzx888TBW16r_LQA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110072

On Tue, Aug 11, 2026 at 12:00:44AM +0530, Viken Dadhaniya wrote:
> The MCP2518FD CAN controller is limited to 14MHz because higher SPI
> frequencies are unreliable with the current SPI3 pin drive strength.
> 
> Set the SPI3 data, clock and chip-select lines to 8mA drive strength and
> raise spi-max-frequency to 17MHz, the maximum allowed by the MCP2518FD
> errata:
> 
>   0.85 * Fosc / 2 = 0.85 * 40MHz / 2 = 17MHz
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
