Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45B34250E
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169335; cv=none; b=mzFNd5nNYvph6xPzFnJeXfRZOmooHm2cLmvHZm2Jtt2MU9+0X8k9tPgqLtlotk+/5ZfcvFzQBLfmSGBvUV5DW5619DSugR0HQnCiP9f+TdPXSjT377vSRJK5e4B+PnZHA4kJffrhN6yEM51VpQ+ieSFf3l20tqE3tC10Gwzwvxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169335; c=relaxed/simple;
	bh=mhrCdxChMDhgWAFmMENxO/e4VJvigUl6IXPQgg0NzXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjSiWbjQYnuZ3EHfNCsPnEZO+sEp9AZwNFLo0rXBq8YziEH360+QEdhZgc5D6BJh0OVWJdaITYuCbBAKl8C9A8xnCKf1uFcunPYZ5JEr49/FB3To2vocIvjhn+cpsMHTG4JFfo1+LgB4MF3Huq7dEK2X81ZGreSLgG5TK/Vk27k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7ya6lOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zv158bbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7ya6lOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zv158bbu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5WP3o4131353
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JX0XOqExg1ihyFZghsG8Hspr
	FOqaGOW6mXNGniz8yLo=; b=C7ya6lOmK9ZAhXkm9zkhGbwtO/SVrezgOwuUwSqr
	85HrocrK045GtKIwNcYaq/nD57C9h6W0I1pgNxlZwhAblrqQ32/d6gUEtIQ/3oyO
	86y0sv7/Y2gy95VD5EPjRudajR5da9XtIisJXLabF1mLoL8ljqp1cE3Eii1UvX1N
	70ZUnI86bzTCom+f28MVbAeuCa4v0zE9SxoeSvB4V0c0Kv7yTACGlDINhx0f1vL0
	hjmWwUIN00n++YAROG+SHomchvgrKGkHhq8n82P9q56xCvO/SJarmyF4MZX/OT/n
	rN+gjJH1kxhZB6PeLdZkVAcoJ++AOVmgzUqfMnQaBPBVeg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1g174-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:42:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-130aab78a09so3291218c88.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169332; x=1779774132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JX0XOqExg1ihyFZghsG8HsprFOqaGOW6mXNGniz8yLo=;
        b=Zv158bbu4UO8aIvSbidfsdGDTUg/sna3xwEXYt6xrvmOGJWynpbZKEir6KjuCf9m75
         sH1YlbvkpIV2w1UYGF8ztTIhLvyGfP9uWw3BJ6O6bu70QY9zFE6HUxuDYAGeucWzRW/n
         J/ZqN40h0l74jvTDYlQILkUtpTPDeZZ3Ri9dyuKzhsNb+kW1lMGjyF/TyPKsZ8ucaYUo
         v7/nB3NoNzFxL8q+woOSZxDpUMwLjMvW+dFHYD3s/fc0NbzxIZPMGI5AhvvW+DBLNtS5
         pPp5lHNbHlWaeh/GrSBy8XtJZT4wzcsSPLcCdV0xKoVsky0hG9QCLVmbQBvKQl8xqero
         Y8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169332; x=1779774132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JX0XOqExg1ihyFZghsG8HsprFOqaGOW6mXNGniz8yLo=;
        b=YMYpfg4YMwsLy7h2GphQ0abh+MUBoNzLH+9L7Yi15rby3AKIIFxMVL5Av8DIVFciKv
         FJSU7qrOcU4OC5BUXicnEC2TIGH2V21KJfl4bZSdWsplg6BOvIke79rA198BS6XhLzqI
         EN+Wve9AKhGxa9XOKUiEObf2a+78oE23PDTeqc6fTMfXeLkb/PaEoMOSiISG203ETFGM
         McSuGv3RBavHA2t6uvs6EYhmRnbi1EFKYVUat4lBjU796UTjxX30PwfmqNGXOxMlX7ko
         RuTHR0mcs0UXksD/iFvBULgFVnJvEJz8aeO3ox+udf2Rs3Olnk+tHkhb9BkpDrIPB+ps
         00bA==
X-Forwarded-Encrypted: i=1; AFNElJ/yWJYZ8II1i+qomlN2g32sXIp5fLhJUQLd62lH36ni9mtGKcERwdskeSEWqnKyXtf8ph1L8QE6O6c+@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUeNlmXaY1xa3XJfl+F+AUj4SQt0K0huO7+Mk4lzSR7xi4QRk
	CeW/aTwky/aWMr5E5YrzFrCdfkZ9P/ZHOILCBDNKToAizYo3fK+4QeS+Iyjb7qpFiU5BVs+V+vt
	RMZNZu4pUzWYz4vkiO26rC0nZWup9VgQOmue4RaXXg2827zSy9Xyir82CMB+cqII1
X-Gm-Gg: Acq92OGcLDZ0/TKE7jv7JcQs1E0Kg43Zdl9ejTBodNZ0IRPCYJTumJOmgm8hGTaSZLm
	SLnMf+qaoeUE/Hhsy008vqnDTdG/Y5Wjw0n96HlgZ6X+RRehSpgnoopWZxLioohL+ok7WpgMdCN
	+cg3b5TbcZLj/YNDCmitK1OxOAuXIhBezXnndHxNgzbxdaaByNm10JTJqpjJd0PsznCWv9EOsBx
	Lldepgr4K43CVWIjiTTrTFkE77seLl/k6ljx6cuzJ4gCdCMQDozgah6lUdR3UWF9RISdZkv/la3
	lR48Y7Yd2I7EFp/Bfg2WDxuQEcBCWGAwtlGHgw0vyQ0//PsgVFcHN/U5BLteaxGa4NsrDbC431/
	f1SwNfqPDbIGNNb1TpocPtoI7qS1B0wRcNG5n8N1SzNhc5LhxWzarVeIuYputoAUf
X-Received: by 2002:a05:7022:7a2:b0:130:ab68:2b5e with SMTP id a92af1059eb24-13504312dddmr7789202c88.4.1779169331731;
        Mon, 18 May 2026 22:42:11 -0700 (PDT)
X-Received: by 2002:a05:7022:7a2:b0:130:ab68:2b5e with SMTP id a92af1059eb24-13504312dddmr7789187c88.4.1779169331113;
        Mon, 18 May 2026 22:42:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2352f2sm22075659c88.10.2026.05.18.22.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:42:10 -0700 (PDT)
Date: Tue, 19 May 2026 13:42:04 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add SoC ID for Nord SA8797P
Message-ID: <agv4LFqoFGYpSaav@QCOM-aGQu4IUr3Y>
References: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0bf834 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2EGthrf1TTqiorYWe6MA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: aAdZWHNRzVfzCeihbD3r5tx0To170wYQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX1WkF7rJ+bneZ
 StjVDfVtfax7thTPTDsXazPIneyWTft2ZYp0WOTkbBkAp73sRzfJGMlmUEzVcxF10CCWevs+WQw
 vsVeXAan2nszZcPA1YkMw99+GiJVyOQ98dwxfMO11Nz3aWu3Zy6HXZuLOguvBzxFPhI3FryXJ9Z
 Fsjp7q91UGLL9K2LdM81tanWnC7L9X+F1BQ6x0+A/WTOz+hDhxoSW0IXt+QzCkf01FcRy9yUuDI
 kuUseb0VZ44+eooYmK78J3yAlo6K9ZSlywTSX5OqSozc+R7XJi8tlPOTrwh068Qtwt+9CusdIvR
 HnPjdAeTJhBj8ySmAGhCp7gpvqV0g9zDfuISlS2HOJRWrEEs0FOcvWIQN90+s4OFETnecA3cRIY
 ttWP8nl9YyyJSVhKpuhGoPw8YtWe0V73pfggenJ3x994axvkUPoTpodWksSluQa+xP0JTNwsNcK
 l/WAP9qQSNC39jcwXog==
X-Proofpoint-ORIG-GUID: aAdZWHNRzVfzCeihbD3r5tx0To170wYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053

On Mon, Apr 27, 2026 at 08:35:29AM +0800, Shawn Guo wrote:
> Nord is a SoC family from Qualcomm designed as the next generation of
> Lemans series. SA8797P is the automotive variant of Nord, where the
> platform resources such as clocks, regulators, interconnects, etc. are
> managed by firmware through SCMI.
> 
> This series adds Nord SA8797P SoC ID to dt-bindngs header and socinfo
> driver.
> 
> The SoC ID of Nord IoT variant will be added separately later.
> 
> Changes in v2:
>  - Drop the Nord SA8797P introduction from driver patch as binding
>    one already has it
>  - Change typing style to use "single space" instead of "double space"
>  - Link to v1: https://lore.kernel.org/all/20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com/
> 
> Deepti Jaggi (2):
>   dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
>   soc: qcom: socinfo: Add SoC ID for Nord SA8797P
> 
>  drivers/soc/qcom/socinfo.c         | 1 +
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  2 files changed, 2 insertions(+)

Bjorn,

Just want to let you know that I'm including these changes into Nord DTS
series.

Shawn
