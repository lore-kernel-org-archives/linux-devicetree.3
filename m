Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1B22D73B8
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965469; cv=none; b=CU6efEsAPStvV2Q8MR5wMGbdbQ8s5tbLRdGmAvWWAB93UI+9elasNZIbZBKfKQBN9F2zHDaMZvGpv6kLrN7YppTqPWlSlM4dyW7cuhcDbmHH0Q3g2tqZetdT+hT346QEbw/vthFwwOKxxdb8myEu6mftMTQjEMdW7aKZ2AEzuZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965469; c=relaxed/simple;
	bh=A3aGdYOvmr1JhLTN/6uBZKFzci+zAci/MMqkgkoBZYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uT7WjVGpEx133b/lEhKOD9gsyDh/uroW5EXzCpOBeN5ba2CooXO7is3now0NNZCz+b1c4iQLF+dlPZQ0BskNtWiDphBpBzBdJ80YBPgUKJguq59KvYfYt+NYOLeoHhq/GP6f7aW3GUU12PoofTfV2SkgOPih0K7No/Q8hndFEok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VB6w3mjU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlnDlpm9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VB6w3mjU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlnDlpm9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUBtG1723426
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=; b=VB6w3mjUHata70mq
	zzqgp30JtxapAP7Ax3glTlIsVT4xa4wNLV3UvA2ZDJEzihZE0jJP9smVBj2Wxs+A
	tYHIFt1uhA41APAsazF5Hmp5iZzPq9c93P8B+A8b32xp10w1RpfMh7c2HAbVyD5i
	ukPgGbABheRyLnett8Gm6Ph5xOFXMB3kEKTrwxLkmuH7DnSqD1XVU2qtL3Eq73Az
	yjxfhF2iAr42vs2Eh+UCO3QnOQpNvCG4rYRiSuBsNI005WTCoj/LW9puav1fhuU3
	ayfgbFPOyvSaeRJ8yAWbb3bZ1vmF5qGOnJCJGwlrC+54/cg92QaSCy/eYjPPF7BX
	hvIe5Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cns5yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:51:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cd9fe6336so15093936d6.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965466; x=1789570266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=;
        b=GlnDlpm9sXQVUTGXiuzyWypss/pYtgnL51A1mtEJUATx9dBUzNpq8rI3zIVvsnHCYw
         EDoSQnpN8gBlK/wosUMaeHQaWLnwHbgNOU2U9jaqDu6rlD/sQnd8sx90vVUBlwKMFQ8B
         lrwvWaL04eOPc9Dwr3yKxy2vchxdVIRuH2kLV8sGhNqBVG/wwZgmkqsMdbAzX7xYOcKa
         dPaOKJ/PREMBupwUGhuIAQViJxVynh6Fc6lbfkQvAGpLteJRzCnHuL6nfN6mwxeEul+5
         C67Dplx7XtBuixaS5PUQqIFw7KKzkYV3MY1v+Jj2PJikr5dkDZGxSQv8AE2QlIelyoIq
         sMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965466; x=1789570266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=;
        b=r1N7tfrXydW12If+r+vHAGc0dVOlAHiIGOT6NJCEl1E4n6RvFc3fXP3jEx5AteA0w0
         T94hRch1Btz95xTWv6eGDbkBbzQnzsKTyAYR5tiz7m19W8vgGy5SyL5+NLkl/IPOV5H3
         3Yt9F4Vn31O9xMynOWQCj4wcPaw6krFAaND4RoK9/nIdGOsuXqgK1C3+1pbW8jf2RoTC
         LSQCZ6PMIzhotCqB2nBzzrNR2QFRp2smdqPUmWCoWu+c92MWluHMxzZfaCuhMrZuAYTK
         OhQTv98fUSN3gHbetO4FuXaJnznIiPuCU7NvAZOfsfNewfhcqbvZIQSw7zxtED1k0sDo
         86sg==
X-Forwarded-Encrypted: i=1; AKwUvByayTjC5PCEgSQQISt5HAxVinfaVxSBOk6mwHHWl3c0d0yd352Pq/kwjVf730hSpmWpEDSWa0/Ayz5K@vger.kernel.org
X-Gm-Message-State: AFuF++mwqsZbf72i37bb//Dju0v1qRIwoyZY6cpeH5HvNyGUHLZqvcDy
	UAi4HtBBMp61BD9aY55HkRWpd4HhknmxQNvdBCRSJ7U2g2yUOfOGXbQI4B+Wd2RhuhkAGdxYtdF
	Swik8fS2EPACdSrXI/J3GE3rNCCjkFnFUc9bKBEZ1IDc2ikdfXnuLZFxa/8L+Kv/n
X-Gm-Gg: AYBFou1DyTZIA7c8nrG47Z+Hw+YYo/qYW3lKq+HAhdT/qG+UoGZU+ehDhVI4iU8ywfL
	anZ7KiV+heTU/24gdiVt59K5G+qvs7BaQFNUgKH4NW43otNWXUQ8aD/KAH0PpUr1+ZIPkePt3co
	W9WKf3UjEod3FJXFee25R2TmURqevOLesD42wlegfJqdlhOQcEt8fioktUmkAXTsFibJ1cgVPzJ
	Bs8qeTQQT8nMR3qzINIFiMbmt/Twbo6uOsl6pmwQmAuSx1L9AH+wnU5ZVM5z/QGI2Km08vSdh96
	oaOPisjKtLcnS3m0ZB+rMg/O+5pIC+9+chytmMX/TiNfpl50RTDAgvyx5RPF0Z8SX9REEWrH23+
	Sr0RANCU19LH54a8+kwfL/A==
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr74579486d6.3.1788965466393;
        Wed, 09 Sep 2026 07:51:06 -0700 (PDT)
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr74579016d6.3.1788965465810;
        Wed, 09 Sep 2026 07:51:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm630980566b.18.2026.09.09.07.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:51:04 -0700 (PDT)
Message-ID: <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:51:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7kHYqI1Nq3jfRmeOSYwxmYchDfZ1Iapy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXxBUHQi3ivkI5
 CKW3I56XGYmsfhouwowcicCArQRH8LbzTOHb0GI8vh28W90eOqjrJ5wMEGAJ8d8HY3ac5j3iGDG
 iObnf/S6Ekm2y5eICzwTn6s8bIOwnAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXysl8nDhsUSn8
 o1umxF7NmI6qq17dX4RFu0FGHv7yhEBp9eK/FHY6shqoaitbTHWVoPx7mLbw8Zukm+aItJei57+
 laDsvSRlVsWIveQLHRVNCSy5ib79dHQBbiQR3UhlBDGvLdO9NATeRTWt+tLX2mA76PDu8rUDUp7
 aQdFdgR87CKMEgbWYAm+EiMokfs4lvGRH0I1Q41hyf3YSxXKINFX/EnUHU4RDPwsDZ4ZF6hq4ih
 FIkdNE5wcYrtM2jiYFsQCCfKHK4CohAs3MiVmtnfcSvqh/HPbHKaRXXbYqbnCw6ccDnbUt69/Wf
 gzW3K7M3Yd4tDk/iqcX67IbZXFgc4raBQ0YOKkEDuKk1mHmakMJd1NCP1GDhLhlpXOCcG25lYeO
 dy5NBFP+Fr+PF6peHXB/mf/Ce7xZWYlT8MXHLPUUYGVPscVjtBqFW4WTwJesWDDcYDbqP6QTf1l
 Pq2pBiSbmacSJ9SCM9A==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa1725b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hExI_PBlCTJWeLBofxcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 7kHYqI1Nq3jfRmeOSYwxmYchDfZ1Iapy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On 9/7/26 8:33 AM, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---

[...]

> +	reg_dsi_touch: regulator-touch {
> +		compatible = "regulator-fixed";
> +		regulator-name = "rpi-touch";
> +		regulator-min-microvolt = <5500000>;
> +		regulator-max-microvolt = <5500000>;
> +		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

Does this need to be always-on? There's clearly a consumer for it

Konrad
