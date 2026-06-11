Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E246341068
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161353; cv=none; b=h98HdBQdb7PllvnFGWtJ0EAgyKfOAHMCN2WlQ+yWv+ks/sb4bqyni77aiER+/DXu6AqXnuYM0qD5WCIZ8ZBSH5FvE3sKL82jNOJk7Z0wthc4iBciNeaDXvVbntdRB3XYDzIkMctVhHk+C5HNFzoAAE+oVPDhF/K4Wc69RInqwCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161353; c=relaxed/simple;
	bh=i/5spa55ORVAwgtSe288M+yFMDXtzBVF28YGRiXAwio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bl8yjglnMVYo1XubTq4pwCwm4Gpg+/h2ChR2JDfz4aBEK8k+SfP0bKtRRUUGtdJmm+vcpW5BeZA6EZZJ57sjU5mP6kmdArE5mKV7VViWtPuUPQPNAsPzfjHd2ms71kZX0hfeTksyzcCxVt56d+zDj4ErgiFOHIhPMVX2v/RuR70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1MvATV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4+ef6BD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1MvATV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4+ef6BD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GG3M3863262
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aiijRgxO6dAKY7p4gLcwYQ2IXl1oTX6rdD6MVw4E7I=; b=e1MvATV8zHNXGErE
	gzPBo7PB1/HBmFjt3j2eJgLGGPQXj9dIG/saFyf6STh+kGAxdMPbMjvx8BBKcTbS
	emr5bEj5KCi4lcw60FcavIRSUVfZc2wM+OJ9zpiObOIEZLw7h4tTpNWcDsXVBoPc
	cada2O8ZFqhWLMusXZwsY4qU8Vcyn5s+K44BnwB8yAq53dWzoerK7rgQMeAMe7PS
	LrJ2JKt8zY3m6rdKoHbo3VF3UC9Cm7rPj1FsrxwlrCn+6ABqZUEt23vnQLBmWEu0
	GA8quvbOUMvL8b2Txz2G6hTshhkiOZmFI3FLR9hlJXoVjPVM5IOsibpBaUCy+Vwc
	x9Grcw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sj5cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:02:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0532a6588so70831555ad.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 00:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781161348; x=1781766148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aiijRgxO6dAKY7p4gLcwYQ2IXl1oTX6rdD6MVw4E7I=;
        b=T4+ef6BDsBsPu1Xm+LwHQEx9xZKCj0ddGbi86qLH6xtOemcYgIDRs4c9Z8rTmYEN4+
         8Fd0jOa3gqTLh/TzrKEgyBQV7VYaoniSqY2oPNvum7AsI8Y5j8QYbStTpTeZ4SVdPzTa
         zpODJkRBnLSuQOHCLYP/COQsNEVABG7VoFaj85LGewvFAfPY+6IW85PPiG8/uellXVoA
         8X3f3FYRHkAYcko8X2CRJUUlncdzwG1GrQL2yYmC/bRFy0Z64IGfeRx7Rq1z65XMv3oe
         I+75KP6o9vic/qYLzkWMwixjqT3Id3kPZHfWZTsOSqV2uCyGnC0+6BBTiI+7hxpLv/nX
         3K/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161348; x=1781766148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aiijRgxO6dAKY7p4gLcwYQ2IXl1oTX6rdD6MVw4E7I=;
        b=SUnfxPovUgwA6V9lMIu/5lIQrTNIoZu8nSMHd97fY7GZqcldpBPe9yHxvOpAE3qFyr
         pyUa2wh43VrPi9UINxqoHYKv9t8jhAvSiUDrlm2h1BX8E94xYdA2gKnBwPeyiWgMdHfb
         72ZthOqIA/VgIGb1Gcuq/bYy9F6OUWZDBNUHmiZihWqEocBrNPvf1B+Y9Dc32oU3XhlA
         E2CKZMMCiKhF2SlEgCFQFoRo+mieY8K5qdZ/D7GxQN5rG5O9O5qhHE/mLqtM7tdys3vA
         D/CsecarI+rv91raJ5bO5f/n1UnxcbZq7tLNA2cyvGYYq8wqLX1K3UcC4BRsu36uy1bc
         bEiw==
X-Forwarded-Encrypted: i=1; AFNElJ/5q34Bz/riYpxKppySG65nNHDvFQfAks4qOII/TZlNXUohD4ts/kve0Em83n9LsPWm2kvrR9d30L3A@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Tos8y7IN3wEkucZqy2GA7cRpMbKC1I1QbkudvI8sHCa64kBJ
	fPN06uxFCQejMoG3lxKMTmRlvEOEr2ztG4DCYW2CjD3BTEslUcUVO7U8cX3R6Poz9csa6OAc3FY
	/pRQevLhHi2kV7s5FGr1shV259491b9gWoWrvlcfee4kCHgOyDP3W7QKmz54J5Q8e
X-Gm-Gg: Acq92OGaytjXBKFguz0zysJONaFw8aFSUT1HMyQ8K0lMDR5gIx0wbm0aE/QkzjCxsb0
	BTQr2r4hk6uzSrmYrPjKJckmjuQYHiUyDXG0NSvH492JMXXbJRGvYp0HJr++gAK7O8R0RFeyqGN
	5k4jUBzX+tWSHIoZl3DDkY0tLRXB0XkPmOmjGjto4x7d2cOYWbZZJk4aQ1CF/C5T7iUnt8vcbhZ
	nYhxrLNI1k4CyvIXXMrM5Up3uokGOWBxRM98eVtmIizhRSSKB/bmXMmBci+yj3633ewNaOyOiee
	3/GO25mpg61/RgjRTK7fOO54TtJHVo1sWZfFNlCMCEWGHKI5S2evHJyqFi4n0xI7KbMLXWpR2lL
	hBUrtCpLffERGqsaVZxxDl9jkPEcurkxBodekzvaWkAQGgNJTfC/v5Wv2IRY=
X-Received: by 2002:a17:903:1b30:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c2f0440700mr18724685ad.1.1781161348514;
        Thu, 11 Jun 2026 00:02:28 -0700 (PDT)
X-Received: by 2002:a17:903:1b30:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c2f0440700mr18724355ad.1.1781161348084;
        Thu, 11 Jun 2026 00:02:28 -0700 (PDT)
Received: from [192.168.1.102] ([49.205.251.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm273232885ad.24.2026.06.11.00.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:02:27 -0700 (PDT)
Message-ID: <f83498e5-3cf2-413f-9ae1-f8136e79422e@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:32:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add passive polling-delay for
 gpu-thermal zone
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com
References: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Content-Language: en-US
From: Haritha S K <haritha.k@oss.qualcomm.com>
In-Reply-To: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2zz6aQ_BfSrpd-0bJMQYnwSNwuBvKkvc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2NyBTYWx0ZWRfX7i9yCGO+d4B6
 gumbPtykgGP0/ZSwpvnxxZLvqUVsFeIdxCZBCqg3uLXe1o6By7PzceWVU1UDwtwN1EhmzhJuMYU
 CB/ORjWdZGC5d6s5Gm1JGyn9ajz3VaY=
X-Proofpoint-ORIG-GUID: 2zz6aQ_BfSrpd-0bJMQYnwSNwuBvKkvc
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a5d85 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=l8H87Aj2eOB6ivgXlsfF7w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=rTJxATxfhN_NfVffrPwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2NyBTYWx0ZWRfX1eHvdNDVgwrF
 l+SHTkptZQLlg2WzLJhDc1BryIPxjF4dHmXhFB/M5mXFq15XcJRhnjqi0m5YV9VdVyqxgHKM/Mm
 izT9PhWuFyzXbFUGHYeopi7M3rePbzVYudPQlRDhQjFqtNTTnYRG1gPn/dJO0xoHYA+B0lVJgF6
 w6ITTJDZveMqbxAInsagHGMB6bkut7cogP1fk3vWZ+mfOdjSuemlBdc7Wsz360RfqwiQz1FHjmx
 KPKr3hm0JZSN/6MvW18vY3JD9HTcP590D5vnsOqUP8d6rpzKqGfn5jumPG38mcMreqabDrD85z1
 xrjdY0lDop0sLCyEgepLhbXfGi3OHczyqpGx7shUqzyBxGxYhWU1BCEJMWufTIzMRV/uq4E8gh7
 E/8gjArGe7XYs2QfGO9W0ho5+GIWGmsNQv9s/00bdxmNBwuHWW/lZGZ4Cs8EAnybQLL0Cb7w5ah
 nAPHhfkCEZyLDxITdeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110067



On 05-05-2026 16:56, Haritha S K via B4 Relay wrote:
> From: Haritha S K <haritha.k@oss.qualcomm.com>
> 
> Introduce a passive polling delay to ensure more than one
> "passive" thermal point is considered when throttling the GPU
> thermal zone.
> 
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated commit message.
> - Link to v1: https://patch.msgid.link/20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com
> ---
>   arch/arm64/boot/dts/qcom/talos.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index ff5afbfce2a4..8a3669b2d062 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -5267,6 +5267,7 @@ cpu-critical {
>   
>   		gpu-thermal {
>   			thermal-sensors = <&tsens0 9>;
> +			polling-delay-passive = <200>;
>   
>   			trips {
>   				gpu_alert0: trip-point0 {
> 
> ---
> base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
> change-id: 20260422-qcs615_gpu_cooling-39650b7ff41d
> 
> Best regards,
> --
> Haritha S K <haritha.k@oss.qualcomm.com>
> 
> 

Gentle reminder to review this change.

-- 
Thanks & Regards
Haritha S K

