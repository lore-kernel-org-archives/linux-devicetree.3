Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4131F46AA8A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648071; cv=none; b=QH0f0rhr9m4wfskquZAxAV4TFFMqCa2wqhg67eeqFadeeL2uGPZNnDyt5gbfUCpH8ym6khtbuCVqlJ20pFQkWIeaSvhyvjCakwe3WuK6P7bwLyEeX91KpqaHnP/FDFiL8KHzyOtdihy5uSrE317UjYkpe82IHAdYcmSvw27o7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648071; c=relaxed/simple;
	bh=SSDwmoH8aO/T5vcH+Su9lRQk5+0ags4vNm66vIKFtjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPyyTcInpTNhl+YsVXy91ddvpI1uS8fWD9kRNEiU3V1qSScG1mqaxun6DRz/d3sht6T0qP7kjn0rt3/t7FsFSiZUoQTQIaE/nj7FO2QV1Ic/rGCBlk3jiKEniEIhuBZ7zR8fh8G2GngTnG1Ob/Slw+2oR8eVARHRJ03/xSqxxsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNG7ah/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5JsGMXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNG7ah/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5JsGMXH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg2vI1958614
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2A2YN+DkUwl8UO0kVxHBASjeYjrLfZa3Zv4QVyBQOQg=; b=hNG7ah/TaGf9ziEh
	qGVvDCv2rZz6g/bodDa0Xo4NX6tegHA7A56sgpjVHjX6ke+1plQo2zSJKfgY9ogv
	6SzCVytpWULsM2TRqI1wkeIhEAoc7xTZH/r2DTTqBYZLe7gPCcas/3f/zf893+wW
	fb+DV/H1XmcKrE8TGCv6yiHQra1ounN+Baf4hxAEPTJh1BAmV0TVaWxGz9TAZ9AY
	Mb13hwV9fSJpp6OH0mbjVi7EhwS2b/08Ww56C9dQvrHq+0+yjwehvcLjXGsjSn3V
	clwKPO7CeAKvCApLcSx5j7vh1WXfrPwrI4vQ3stiAkj3Hh3v7tmbCtquAX/6hrnR
	c1DG1A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvu8ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:34:27 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-976fc8e5bb5so88955241.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648066; x=1785252866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2A2YN+DkUwl8UO0kVxHBASjeYjrLfZa3Zv4QVyBQOQg=;
        b=V5JsGMXHy0/tf/VSNrFjDBqZ/vEfWvH6aFSxfeVjbpbI/IwIbbkMLdbqELogr25898
         FEhIUM0KM3obFKdc4RIYGeM8UA5Qbl4YxEe4FU+bhqovXmUv7uemdw6oPqskRF0RsDB7
         RVBvotiH56A8Xh4Hp1Ev+Y0ET0gZNSPQrCvY7lyRUTNYa6e71GvnJuxiy90gnElwDBfC
         yBM4+2deubQxHkBp/TNV9UilxnuYLL5nDlfBIwSUzGsvqPBGcXidzEInLE1B4WnRPOAF
         xE0gHSK4P/fkVG+pmEvMK5bOzEiHFtX5XISAu3l2wjRJv3hZNND/HtRqyLYFvtLI22Qa
         MwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648066; x=1785252866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2A2YN+DkUwl8UO0kVxHBASjeYjrLfZa3Zv4QVyBQOQg=;
        b=Xk6OSSf7eJEo3ddpO7b4nx175jFzCZo9YOcNMKNt688GI7Cptk7MpzyF7kgx6tAhrf
         Rrgt7DUpCXqv9IukP+Imq7F74N3hLsY/p8pXGwF+rDYkvRL7DCzqRylhQxDE3/GF5VRn
         5j+UcoCHfdmlempLpI4nfezyIQXTCkDiDVwSSbLX/B8qykz25IpffqZbr6knl58PSpsP
         JKUPd3Hmc+n0p/rxmE793z6TnIHwPYjpyud6PNMqeE7T+rmWIUPThwIhHeiAZdQFk6sU
         YvKLWCaidk1u1n4737xX0mNMOmxGlNCZ9KwTzXJptBA9yz5kUHwlf+ZpYSwjkjoU+qRl
         KOKg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0RoqruxoTY5b7rL4ltjmGsCkpPVNSnoGboD5Lb/kTwj8o0i0UJj1EZBZiBXzdic24lyqVMUWiufHh@vger.kernel.org
X-Gm-Message-State: AOJu0YytXOFQ3OD1F8w3ORnC4woLkBM6NVmf+yo8LlD6V8vUmExtj2MZ
	2Rzvc6Z0LfdHwfcgWeqcT67f6N6zZghELMVszV/dCWkmP1SNslsydrppknB0s3IfPNpAnBYMS5i
	A2gz/7qyzIM6qAM/V9zR7DXElOSpvIC5bzzop+9u/VPE2m4y0CxNdPDhWHD7HJONq
X-Gm-Gg: AR+sD13pVbg6DM08IGVuGKyby1dM0nSableAaHy6uFj5jGZAadoJVC8cWyKSU6CIFaf
	nsne2j2PlBJfWRp9/0A8uyP70U09CJeJXm5FCw1ftkdQ9T4mF7Lk0hF+mnPsAuSkMiPrMuAqTHs
	FdIp8KOZpkOppBUq8sCX28A0sNsAY0fniWapWrpWhAzsMVT9LEw0jlpZbbuehol6Myucm5f15ks
	gjZJAFru52qTJxDb94TkE4ilcuHu9/uPCjpXZEmcft1LYiEwwNHexuxnvJt2i8FMdoN2ZE2XSp+
	SoSRYZiZrycZbNogVQBPE+E33xtuNx0D6bV6zSVKNl8VSPZjt9QtOgx9/YpgAgmXmeZXzg4+y9K
	P7hZYEMUN3orh2nJz7aOn726K
X-Received: by 2002:a05:6102:54a2:b0:739:97bf:9180 with SMTP id ada2fe7eead31-7475378d8aemr2311831137.8.1784648066504;
        Tue, 21 Jul 2026 08:34:26 -0700 (PDT)
X-Received: by 2002:a05:6102:54a2:b0:739:97bf:9180 with SMTP id ada2fe7eead31-7475378d8aemr2311819137.8.1784648066074;
        Tue, 21 Jul 2026 08:34:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1735f20279sm595979366b.53.2026.07.21.08.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:34:24 -0700 (PDT)
Message-ID: <e4a7f143-de14-4f8d-b652-3842b7367bf6@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:34:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: ipq5210: Add nodes for multiple
 peripherals
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
 <20260715-08-dts-v2-1-b060b68e0256@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-08-dts-v2-1-b060b68e0256@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1e_-Gdu1esnBxXuX26HzlYCqMf3pfDqI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NCBTYWx0ZWRfX5STp/p0xoG1E
 KsMbXhYecOtkF2HpxLhesy+BOuD/u5zRiBFyn2V01sFVRIhAknX8aL9ynLXdBiJ2Ks5QWdUFRtg
 qPbHpLNyPL9QTSPoaTG+hInsh+VNF54=
X-Proofpoint-GUID: 1e_-Gdu1esnBxXuX26HzlYCqMf3pfDqI
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f9183 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HyoFnBF52fLbQ83PcHYA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NCBTYWx0ZWRfX5TpPH2mWtKga
 FFScPBoT0O2WPXyHokAkDGe5/ZyRBnPt0uoRzXkxAC6FNoAAoJwpeZHbqBGu+2+tlABLlb1sEVY
 UpLBk+FQF/Wh1H5Hf47cMvobRgsSt/eHEFu7HzXWSY/QWvcMQ1+/DCXaZcWDBa1MZFjDg1Ks5tk
 8fhMC1MDAv03/4Spiy7Cxkyjc40ZN7ife1FggSNraEedh6MhFgKi2/XZ0VlJ/JBuV5uXeAkxX4G
 d5RCPE3oj4iYbCE0YCuLtHEGpnbluScHNcM0uRIyYYpKPy2rYyyMjsbpQy78Cdw6zlCvAhNbu0k
 Bf1z20OAd1lzd9x7UO/yOcUfOXLlt1Hb46kJPyfhjKnj4FhrWvQbFAhOzRFozabgmqvHxM8Kr6P
 /n9MoxqKkJHPP80WOdWPG9m2GuR1mC64vYOv2QneROXOj5dGwAMblFeAmKPC6v4Mvt0dPH4U/dd
 AeYKmw12RUa9Ac7HHZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210164

On 7/15/26 9:11 AM, Varadarajan Narayanan wrote:
> Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
> can enable the hardware they use.
> 
> Add nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS and thermal zones.
> Also describe the CPU OPP table and CPU cooling cells needed for CPU
> frequency scaling and thermal throttling.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

> +			phys = <&qusb_phy_0>,
> +			       <&ssphy_0>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +
> +			resets = <&gcc GCC_USB_BCR>;
> +
> +			tx-fifo-resize;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +
> +			dr_mode = "host";

Is it host-only at the platform level?

[...]

> +	thermal_zones: thermal-zones {
> +		ethphy-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;

Drop delays = 0, it's the default value

[...]

> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu0_thermal_alert>;
> +					/* Set maximum frequency as 816 MHz */
> +					cooling-device = <&cpu0 3 3>,
> +							 <&cpu1 3 3>,
> +							 <&cpu2 3 3>,
> +							 <&cpu3 3 3>;

I think THERMAL_NO_LIMIT is generally better.

Konrad
