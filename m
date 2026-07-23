Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5533D7D69
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791592; cv=none; b=YpDHJoVvU6iOPqvkc2je85nMrJQNqYNhlOYXNuHIbjCQOt/J+ugviCIOso338+oAEtCMJDnLPsr0zDzYs9ZLztPiSiKgmaDLbeFLOOlpsxAKD45U2brutVEhuNZMoAoM0oOs6SttOpvuPHfLqJGVEOIV+dvZR4E8nNusLM0MavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791592; c=relaxed/simple;
	bh=AGdZIVFbSq7k5LXJC/Zs3P1KBHxez5Pg3Oe8hxveMBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ex1cpeajNBh+yraQqF7RqIzrTVtCPyngGEjB6HbCw5BDlrAoTIPU1FjAGHlALB++KG0Cp9m8nKdXCoR9Dsi3PwlBW6/irpA8xwrENH/0evIzj2QTpE82bA/paim7arcwP1T5dN+B6Fm1a6/I5EEnGQSOeT3qRiSw6PKGa/xHmXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cg3IdgRP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTJTRDdr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cg3IdgRP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTJTRDdr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BfSQ234742
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuSg+iQ4+3D6K3PZRyvJbPKPj1JuRfwcDG2f9RKNGoI=; b=Cg3IdgRPrUqOwQIV
	uCsypdT5LA8bc++KOuhpLQQWd+Um8IM+wi5aoi65ouC4wNv/fPR3WbBzdIWcKttn
	9Ldprh0YQ4ZVkVolInxbn1eeqvHJ4mF60pWQOZSRHlZr0/bqlRaavmCcU+RAoCOU
	HScna51QztYU/e4/erLrmn21+qUKAN3ql7c5BOmv5tkMdiEMm9AOO/NlX9157DG7
	0XOvnx+3v4nNkTAwrkHXqGixfVRy8onK/cQBYKUAc6jVTlEfcNe06UCmwPFgMlmX
	yyqmhN43vaVKHftayhWzz9gA6oXU4bfkGWVwDitQq6TIxzcY7t8qrtLfDIbJkJZu
	XuJB8w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xtum6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:26:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so1004449a12.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 00:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784791587; x=1785396387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PuSg+iQ4+3D6K3PZRyvJbPKPj1JuRfwcDG2f9RKNGoI=;
        b=CTJTRDdrLw35XC9NgmUd+Bz3/tu9N6qbDYx7ZKvC3s7KiL+cs8SDk8vDHE+zE62cHI
         8p7cUOcdf02pc502TYBqJ7zsCE6eT4yMHMLGDO6DTV7NBakMtqLyDhadp5929048FVr8
         Yl4aRcAA94IOH5AQQDwR3gAWBT8wML7XnOPAPyrLYk7D1jG+YsjByDlgV1j/5sCgKh4N
         xCogd30n08EySlG2xuDbbY++XIFT0oRT8R3H2Y/dJc6I1eOn9P0IS29fTyywAzlCirxk
         gH6Hvc/XKmkRNAxsR5Ym9h7I197wIb0pOjJ8AqKiuXz7OhKB9/WWGqk5vqHr3ZQnxlY3
         7xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784791587; x=1785396387;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PuSg+iQ4+3D6K3PZRyvJbPKPj1JuRfwcDG2f9RKNGoI=;
        b=qblymSsXooGHihjLOhusf474Wtqduaht/9tJ6LOAGSHPgunajmrqk5ii9wrNSI25D3
         PKhah3VPrSQrV7tNQtrcWtgfG2uAWj11mClfTz0MHifeyEl+PIzB9+0qzEc9X0FdRXDX
         1XoEKS8foIGBjeqwf+3XgKy6MpNw5MDTzgOB1zGLJSeSTcghu8PbhpHEasr2/eHE+bgq
         bankXqoqHEBA4Er/UPJwrdpjUUX07V6ExmkbLaBgGA1eSLFmENfXstgPodaUAJrn+2Ru
         FXRi1gWcZegCR3CYrl5yXxB/1fqjJOyum0xJmSEmtAQyPAaTik39yC97Q8E84fSltw75
         cZGA==
X-Forwarded-Encrypted: i=1; AHgh+RrH83sfkEbZoT0nj4A3fIUqi4GRkQxI+Qqrzqi+JIaAXzylNocufeMCVVmQH7RCYnFcr5EHY7dYb/9g@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/wLKT24iR11/Xtup0WDW0/tf8BFiNTuS+Kfw0g4X09LIifOL
	rYFELjvCuGt5c8/h4lx3S6YuL7vx761laiTIlVoZv0fUrwd+d2gkaCrDPheT8fSdoicWuruh6Zp
	6OqVi1rjbTZzRV/4ac9zoT/31B+2cd9w+U88qS27oA0m0Wi5liq71qEUUJEJdqVcj
X-Gm-Gg: AR+sD11A9m6r9dlHUinzmW6kjkXS0JFgNVyCovT4GcQ91e7wA5jW0d+oPXitTEtCed2
	SZxt06ZmtJINiEoOHYaOia85JsJnB2J0o8MOThTcSLi/3JDlEV1XSZmApf/yH5v8h24BBh9WdNc
	a9jtIISS9hQ93ipC6meQFkIgYEuLjQ3BtDwYt36tbdXFkiuHBK9G5ZU7mgJYlwNi6KMiRL8y4/d
	37xJMl7BGyvqJkgnrV7E2n8QF/+3gopbbBwrVtyG2ro/QqnrBNFyh1wv8OZSK/GPtd7MyQzaQFx
	hpgVptcUAy2SBAMsrKBbAn4bQL1/TB1c7LghYoxQCwvyfLVAi1fA95EGZuAN/z/MkxvaMS6rMoE
	atuvCKjxH+7Zyhr16JPsER8XB9mI=
X-Received: by 2002:a05:6a00:854:b0:848:3119:941e with SMTP id d2e1a72fcca58-84e2c181931mr2456291b3a.47.1784791586260;
        Thu, 23 Jul 2026 00:26:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:854:b0:848:3119:941e with SMTP id d2e1a72fcca58-84e2c181931mr2456264b3a.47.1784791585827;
        Thu, 23 Jul 2026 00:26:25 -0700 (PDT)
Received: from [10.92.203.75] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e172862f7sm2506313b3a.21.2026.07.23.00.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:26:25 -0700 (PDT)
Message-ID: <cd5fe7eb-aa9c-41a2-921b-52a88bc1bf3f@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:56:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
 <20260722-devtool-v2-2-d7e609ef7388@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20260722-devtool-v2-2-d7e609ef7388@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Tb9Jd3vjcUXe9Vo0x2LP0O_mz4vrbku
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NCBTYWx0ZWRfX3aLHhGOBxACF
 kakuiuRqzbxTKcC0H5G5SLidQ34A7mS6UbEGZCcXgkGNGbBADiyDy6t69aIAXxTQCzkkfjevvWW
 kVSaVV4lSIcoyIt49eLXBqGH1/nggq0=
X-Proofpoint-GUID: -Tb9Jd3vjcUXe9Vo0x2LP0O_mz4vrbku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NCBTYWx0ZWRfXyPBObKeWb11K
 ZPLBj6AnyCRxtOSINtBJOqlsNcMMtYdmHXT+t4ZF8HTrEHo088o5WR4yjvlqQLyTg+hBfCMSGKU
 O/nvafB/cdYt5RFLAiheS1CcA2FyNKsvDdqwcNkggxIW9DyxdUVn1cIUnvwaglUB+8hDFPbPtGY
 dzpxn8YU7Uhg4N8MK5oIQwjhCyNNiWvxFDs6rfsR9AeZUaOZ7G9xvuy7ZuJT8b+3o/vilRuOdjn
 a/Jr/RQrtOeyHxHauWhZzlKXgB7b+u39w1BR/KUwpYR1C++tCcoClcpktrPk7/9Eq5xV6FA8T2q
 o8x0i4DLc98nRrtDmm+zPrA8CPnYCg8JJCDjhbzgWH+5UZfWMuXH4f+tn5kXRe4hfaQBbB/P1lY
 PCVYXAq2572CuS0dkHXZax1KDSU4R0Ks4SH3oAbd2Bvd6DZXp5+EeBN0hB1G3xoFW5BYGWruxRX
 7vL4gK54DbWdi1cd7Lg==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61c223 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SooqmcQUKh5i17ny3PUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230074



On 22-07-2026 02:56 pm, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Hamoa IoT EVK board (Qualcomm X1E80100 SoC).
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal
