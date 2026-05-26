Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DCD2F7F09
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779768683; cv=none; b=jH8e8eUlbMiNXwAOA581Oq4qqP0sQkDX/oAVJo11sDacLFaMy2DdCAd79IQ2GHdti4sBqkZS78Vw9oGhEmabNngQiqfVeR8ip+005+M7bBBOoK3/yMwR8mCNIonXEcTpd9Ohd62/FC1k0HTx8Rb+7KGJtOJez79T8hfA/93Os4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779768683; c=relaxed/simple;
	bh=zg2+q2fDT0NKL9NZjoGAUuEpoErO3sAmmrz8TWEM2yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+kq/1dDCsTNfpWiCJxzrNV8SpzK26PqdqoMcpWSNQIIE/XIZQQjYgVtzxAZVOTYGiCiRsswJzcncfSQKGD4a1iG9f7MtdDaZxu1JavJJ60kTdl96d2G5lX6Ah/RwPxduAVvNTlTvh95ZyszMti6/1kEteqybPXsY0pKHMu1soQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ol5aOili; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYEfBqe6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ol5aOili";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYEfBqe6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PLCD1S3263552
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sL5l3pfFXSzJMIu2H6ZykjeOR1JERjmI6jvuOGjE9Y=; b=ol5aOiliKX4CIpur
	AvHHSfn8HfkhZjqAyPt/BOPHC2/+w54ByxR1tXZrMK16T6Un+9pfxQHHPiZIAQjJ
	IX5vzq5xFZgZQb/M5KiuN+57N1utMm+DL+sVA74PpyBCiNBVnOcZKuoqgPYYR+gN
	cVW5qyvJnpiSBb6Pj7djyGK1xUU2RNvzssRic3PeHCWoyd9pVv+WvgqBAmPcmSE5
	6JJSm76fkKuoMHEITuL4XdWpaMVGAPR1XArCrUd3vUpQwFVRQk4PF22DufpaWPF4
	Nnct608bVFoJRIYrFvUPTl6j88bOh522/W3qJVRJ/FIuesgZuiq2ihCMXaiOPwRL
	E6b85Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs2j46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:11:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso20489319a91.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 21:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779768659; x=1780373459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sL5l3pfFXSzJMIu2H6ZykjeOR1JERjmI6jvuOGjE9Y=;
        b=cYEfBqe6IghNvXaGKOjTTB+h/jnM93VlcBPvkJ/NGS+cmDOWCv7ZNJKpHExjxLgQpz
         wGRqaV2RKHEiyclRBh8gCKN/319WysLXf3aYwi06f236VNCFCW6sMUMfr0xbgpxzDoIn
         Kubl2Srx0+VzmGOupAe/ojshlGlJeyMKJD+oQsWWfJt5qNXvoXnJZsXGlBSZEabx2f8g
         7+auILrGOGUagxeiG2wbQkAmTCT5E4vRoQwB6W81CGwSROpGP48oz64jbJ6Bjb9GIwPI
         VkMTdC7mMyce2890FJtiWakYcx+UDyIbDcTI1c3PPesLAlJ6pxSdbPeqjqR0rM7ZbT7P
         15EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779768659; x=1780373459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sL5l3pfFXSzJMIu2H6ZykjeOR1JERjmI6jvuOGjE9Y=;
        b=EmGb0LasB0dJMC/sGsJoTj61tId8J4JGzHuuToqKAHHUOAH89qd8BjhdIdo6eVywaH
         mrAIWSIMs3nGYvrSij2c8zZu768+cQxKv10X3T9BP8+UvIo8iW5HOKmuiXVEhkCRvfOw
         OKQVk0jV4NVwRk9q8Sj3KPZa/i8rpwxHKOaKREKMhWApipbdIhsOrrdmE7QThtpkrdia
         vzo6U1NQ0TGt9uj8234HiM5oQiosZ5N34KPO8qW/WgKUvxVX3ff8XVRfYtwxmh7JLUM+
         ZX6LabRZQ2u6dYSvSG3l0U2GT35rCS0vZNA7dAc/5bRs2FqPBckuRwm9plgOVJVq+ZMn
         Ee/w==
X-Forwarded-Encrypted: i=1; AFNElJ+T3Zxpu9PMKAC2nHs8lz2B0w2cqbXvYnP5l8xkdxzu7jxaRGJFnXZwPYFyomgs+jrOjhOyZEykXTKL@vger.kernel.org
X-Gm-Message-State: AOJu0YxBJHYFPY2n+t3u5tNFPJASq+VxpAcUvBsn0YydAM2JaRBvIo+p
	lkKeN/5zZ4kGBb1wJESJw+fl685TkVJk9fWljcWV6ZBJHfIzWemV0zkNuUQJtE1UVYSBXP7aBiK
	j/VLUnS8UZpNh6Afrew1q1gMsJ4+XeqVP1r2vUt58ZvgWuJ8XCgdP5RsWIfZCXpha
X-Gm-Gg: Acq92OGh8FCgxig0b0hWYLbpfXshAzEYBOtSl7EN4Dde5XiNCrNQ/H0CDSo9MnHoZGu
	tMyLweKJpclpBh1F2pz+2HVZM+UkYlMumc4Pnz4xtpShDRNEhziqTpgZotwVg+OVKhrlsjWdrm9
	Lv3lmqRe/xHg7DlQcDlwJLypi2+u4HZWQkj+fKhd6WicT+0lzFptkVHfyKf/Fr+//Tkjw2PKle0
	sqzQBA9hwFqedKxxAprrSA4uB7tapa9pUpofFFQw7shA20HDwJNEyWGQcWkgF4lpCGzTUpB9j99
	6pLR+TBM3Udkk0vSQRzXaS6Sj7S6xP+cdyXqa4Sp2SHbgUWhISp6JcT5ZHwQqLvYxwjzMY4faWZ
	EF+MZVDQlCvUHxrztTPbQnaWypTdg6zNprjWEIG7CXUpFKkzDErA0rOkFcJx3199QBw==
X-Received: by 2002:a17:90b:3791:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-36aa16b66bemr7246990a91.7.1779768659407;
        Mon, 25 May 2026 21:10:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3791:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-36aa16b66bemr7246971a91.7.1779768658884;
        Mon, 25 May 2026 21:10:58 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7b92sm10942268a91.12.2026.05.25.21.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 21:10:58 -0700 (PDT)
Message-ID: <51fb3abd-998c-45a8-a058-ab9185d6fd7f@oss.qualcomm.com>
Date: Tue, 26 May 2026 09:40:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document IPQ5210
 watchdog
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a151d54 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rzHiTKIQvxCi1bN1TVsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: sEGdh7OLDj8oqeGTtDKCdqiV2Ch1Q07r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAzMyBTYWx0ZWRfX/lEMA2Y3WnFV
 uuFLpn3BbL0wMZvJ0+gKNPMWv8RDuYhi2nylyQDTWkstcm3t0GWHhPDLEd+263TDkiMuwxkyQSE
 Aowr1mRHmsxhGWTptP8cExTxSHpM0ifh+SLh/NEF9uDdtAf95UYrema1nP23qEKcPuONroiNafO
 JYmtHrvnFhUHfRwQ3ExUoQaGAVo7RvnF+eJ3FmXDAwPuHuOtgWuwdYqVVIYCMbzL5XjZYFspcuN
 DRhRGjNYZD34EdUE5UIKm/lBKeaYVwAjIATP27Kj+/WLT5k8wExtkwS6tQEvhe7US/puUTmJKcU
 Xcss+vnfxciT7m0oXdJL1dkSHwETwm57sg3QMnZb2Ynm4G0Y2gZGbKj0DsmC5UaBWBBopZBjYdF
 hhbUsKpG8k78Aw2OHO5bHNFH6ZVymQxcI3NpqNORjZBeYE6d6rq/QENPtgHdDTssTTOU++HrKe1
 7j9BvyP9lCocQ4477NQ==
X-Proofpoint-ORIG-GUID: sEGdh7OLDj8oqeGTtDKCdqiV2Ch1Q07r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260033


On 5/11/2026 4:19 PM, Kathiravan Thirumoorthy wrote:
> Document the watchdog device found on the Qualcomm IPQ5210 SoC.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 9f861045b71e..21f6f7db7f96 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -20,6 +20,7 @@ properties:
>                 - qcom,apss-wdt-glymur
>                 - qcom,kpss-wdt-ipq4019
>                 - qcom,apss-wdt-ipq5018
> +              - qcom,apss-wdt-ipq5210
>                 - qcom,apss-wdt-ipq5332
>                 - qcom,apss-wdt-ipq5424
>                 - qcom,apss-wdt-ipq9574


Guenter,

Could you please pick up this change? The watchdog device node addition 
merged in linux-next[1] is triggering the DT binding error below.

   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTC [C] arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb
/local/mnt/workspace/kathirav/upstream/linux-next/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: 
watchdog@b017000 (qcom,apss-wdt-ipq5210): compatible: 'oneOf' 
conditional failed, one must be fixed:
         ['qcom,apss-wdt-ipq5210', 'qcom,kpss-wdt'] is too long
         ['qcom,apss-wdt-ipq5210', 'qcom,kpss-wdt'] is too short
         'qcom,apss-wdt-ipq5210' is not one of ['qcom,apss-wdt-glymur', 
'qcom,apss-wdt-hawi', 'qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 
'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq5424', 
'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-ipq9650', 
'qcom,apss-wdt-kaanapali', 'qcom,apss-wdt-msm8226', 
'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-nord', 
'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-qcs615', 
'qcom,apss-wdt-qcs8300', 'qcom,apss-wdt-sa8255p', 
'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 
'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 
'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 
'qcom,apss-wdt-shikra', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 
'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250', 'qcom,apss-wdt-x1e80100']
         'qcom,kpss-wdt' was expected
         'qcom,scss-timer' was expected
         'qcom,apss-wdt-ipq5210' is not one of ['qcom,kpss-wdt-apq8064', 
'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
         'qcom,msm-timer' was expected
         'qcom,kpss-timer' was expected
         from schema $id: 
http://devicetree.org/schemas/watchdog/qcom-wdt.yaml
arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: /soc@0/watchdog@b017000: 
failed to match any schema with compatible: ['qcom,apss-wdt-ipq5210', 
'qcom,kpss-wdt']

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/qcom/ipq5210.dtsi?id=7a473107f9785700a5c57cee69f60c19a9703f95

>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260511-ipq5210_wdt_binding-9f77d959a28b
>
> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
