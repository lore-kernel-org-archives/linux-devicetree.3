Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7DF35028C
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030272; cv=none; b=ptmOg8zq/n2DFjqr9Hr8TxCmigF/W4OKhCT1YRl2jQL64LjmRv5HuODgwFtdCArLz2fI4o8aUds7RD13XkQFLv4mQp2lY+KH4UwGG5cxH36EbAKXAahIZi6uc0wudPZ9+HsgffkhGEm0BHiAQSzPsljAHPNciLtQof1l2A4ilbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030272; c=relaxed/simple;
	bh=zgBKqmvo/mlM6FAwfCG0BWWZ2cekk8/EaEDfQ0LGdU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYng8J0Sw2GbvV0pht3eAE2gWcFwbXciQPb+nHuIy6u3HAyKf4smRLTb6prBZftafMxlOzJYkDZSSXAYcBgN38jdIzauAhuXBXuPc5ZVtUM0B6Bkimg7b27OH3FlyQHg8A2lfRrCvdTaXsYUkQD5h4SEXmfh3FMEPBvyFsf4ax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsRl/kW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbARoENZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsRl/kW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbARoENZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H40sCA3845511
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 15:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRg5yfMiLjjVTzLnOmCYkQHh9tXjvKAmbvjX79fDqnw=; b=fsRl/kW21v3lLkoh
	9VrhsFaeAsrCc+JkCzRHQYBBjvwpjzmYDRVCrPCW6Et+3emLS0w/SVSpE6/SU0PO
	i7r9YSHND9rbY8pykQ6jx3IY6HYqq1F3y9gGoqxA8vYxstM4GYeqTbZGe2Hnmp0o
	VR33teDnIYGOgLDk/y8dL0eDnNy8/5XtRO7w4VuTxhJsTHRXahVnoSUoh1RfZ6fi
	1V5fHAloq7VEAMKPzR735D/XCtAp39r/9BCCB1I9PvsUjfHM/a3mS0vuPgvGBz+9
	sbFu5XukUPGGuW+RbGGJmL+ok2jxv323WvlUtga0cn7CafCjfMLMsthbpe1wnfgH
	pp1xdA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gy532yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 15:04:28 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575590529a0so3653936e0c.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779030268; x=1779635068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PRg5yfMiLjjVTzLnOmCYkQHh9tXjvKAmbvjX79fDqnw=;
        b=ZbARoENZL4bwvi6cH4sTprUvy/GmatPZHgfAFEF/iFas14Nv+E2vm2roum7c+cRYmc
         m5BZB/p4trqf2RL80PvSgjuHd0hUu21NvEvo21fDJHIxAC5YAjSq5bM2VBhqycacelx0
         2iHB2NlUyCallajQ3kXeajLx7MDRDaDY4zNfg2qG+smZs7LYnNUYKmlbTEnVrIMHzPfr
         85ORLYMrOAI9nkAJnjaEjFkwXh6qJPl6+5X18uCmS+nMANuCFctQi1K61VwEBuVnV7Pa
         XEWMKgeh1jUxBmqHwtxz20sU6LElES+FrqOMVYKigZQtuNL42Zp2SjQvABWVouGR2qMA
         a05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779030268; x=1779635068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRg5yfMiLjjVTzLnOmCYkQHh9tXjvKAmbvjX79fDqnw=;
        b=n79++l+9TNDplf32is5RNrQBwTKqTIMIa+kfXpL6NU9BBprUP1nSBmrcSMok5QCWvB
         7WuFHtaWGItQTiED1TPWuzI62ev/VTC3NENGEnTimerLcrxpyOATQybHfpDa+cjfxaux
         qyJRHzuHBlq2gaFBZx2lB20TdoWvH7Fi8DV1mXeF5tTr8JRFPvTUoSOSEXXKMh87vrSa
         BR7q56a/66EVk3XdQ4tYrikkhRLJMviwClfSrcFshi7EXvpvhYqJ9WvAreUB7EhCx5EE
         Dp8XRCCs3QNfQ5pTOK8dIfMkfbcXZKBsInAMZav9F5eQOVeSanNs0uUNLEbrw7N5I+I1
         goCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/W7bguFY49ouBN1dLC7E69QQfeN546CltYgMnGQYllS5tGmnkbpFbqRRAH3xjiR/GkyKFxiqT0WJC1@vger.kernel.org
X-Gm-Message-State: AOJu0YybyjxyrYDJizwinPGFVeiwQSrwLpRDO8FA+ZwvNT1YVQC4IYhf
	jc9/lq6FB2p7nU9oSc7e2H5tUy5/E2LX37DgwSuqpt+NlaExBK+o4lqlfQP4XxfAmUZS8OX2RNu
	cbMUxNJVXBBV77U2csBARjYgTM07+Xt70fWHtJE9iy/HjOoYTBH5Vv9BAheghDf8P
X-Gm-Gg: Acq92OF9npUx8LP6cgWID3d7RCAy9baswCG4s0SwXfmNWJyGoXR/K68N6P0WW7HiC07
	wtYAKDR7I9SGxOI+jpfPCig4b3alxqAv0xEXlSpgdO2ae5Djdg7ak+St3baxpBd2Bt1RS7s0BFh
	uLZ/4XuhXqfHVHNBG5DXFQCQ+3uRooxJxDNLoB2If9SW1IseuxVRPkqNTjLBs3BzswxxogPhBoY
	VtRfFc75UGVE/1TK6k30z4HGEsSFsrJbnQoWRGZ2Oz8XG49MYrqZA/9md+ngzvAlnVcSpaBEZ9G
	cnPsvQxj/1i7GGpLMlcgdYY6UVFDjZpBlYqKsBijq9mJn1Lwoid2UdI+BlydDyw/BR3Y8CFwcri
	P9Mw+ytSvwLZFlisHNn4S1VZZUytsPETumj7jjgQ02g45AU9b0S+Tqlj/JamVMC3p/ppJ6+Ny6C
	/SM+oQydy21jl38ATLNqA=
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr1488671e0c.11.1779030267685;
        Sun, 17 May 2026 08:04:27 -0700 (PDT)
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr1488648e0c.11.1779030267339;
        Sun, 17 May 2026 08:04:27 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3e20:6c07:e6b8:6153? ([2a05:6e02:1041:c10:3e20:6c07:e6b8:6153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88e5asm207620125e9.6.2026.05.17.08.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 08:04:26 -0700 (PDT)
Message-ID: <3aaa5d3a-4aca-4c16-81a1-5afa17fd49d1@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:04:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document the Hawi
 Temperature Sensor
To: dipa.mantre@oss.qualcomm.com, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com
References: <20260512-dtbinding-hawi-v1-1-96149d06cccf@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260512-dtbinding-hawi-v1-1-96149d06cccf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wusb99fv c=1 sm=1 tr=0 ts=6a09d8fc cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0pnJn9-L8U1tA-XNDBQA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Qe2yGeiYjA4dXgGmORmRFTVKClZ7C_vt
X-Proofpoint-ORIG-GUID: Qe2yGeiYjA4dXgGmORmRFTVKClZ7C_vt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MiBTYWx0ZWRfX9JEjM7yT2et8
 M8gRt3NL5xO+E9p+og71zDYvENgsiobWQ+gyZjc2BYwqIOMCbo3777mZEflBMUHo1AB1Ikm8EcO
 xcz9njpdI2w8OPu9yJgAHX7Y1M0FhACbDZT42RLYtPkp/izdzo8IAx2NZgTC1BzYfIj+sefXcn4
 r3Z3G8h4T3BnE1SM3dFm1ebGdPHwvsBXvSfmsaO7PTPMiLhZZGTj4oK6ojcl3QbFhe2u+e7+LVN
 uH1YctwCyhlN7SqBdh1OZ0pgIlDOP3rINIeLCRtl8bBkbeMWg65XpeaSNKcIxSlECMputOtHmWh
 GIOqYsBEUJBzlCmQa9z+HFXCP+W7GbbtmgNB0IgyeN0TEIWU/ckuaYJ3Yp+re++WZOZH54/SUPz
 SrhiJ1S9yRvITkqzl0hF0C4M/yhz84UYWDHo/+wSpjCJ0J7LNAmcdTWCUvULN1OxPvPT31GQ+Iy
 O2m+PYcyl2yh0+8P6IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170162

On 5/12/26 13:13, Dipa Ramesh Mantre via B4 Relay wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Document the Temperature Sensor (TSENS) on the Qualcomm Hawi SoC.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---

Applied, thanks
