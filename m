Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBA847D450
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327242; cv=none; b=oP7wt7pK4IdyvvRq53g/7WM/9sn+kj1FODxMb0wli16CYQ4xEVu7vCbvN6tO4RfW8k+dYqt6UBrlW5F3g+Kw1uEkwmcRFeh7mrZwhh710WwVbYPezMfihPLaJuzpkNhhgHrrfthcpVJJQbmcpRjWvn1dLmVwjCURGoR12YeL6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327242; c=relaxed/simple;
	bh=G2rkEs8akPM2eJzvjsccdszXEL3DREHjcav6WAxVlpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9dwMiU5yGw/AY1G2C/ACnAOzo2HmWZ1eKZcKG9CCuRDnSfk2hddybKegk9cGAkxtS8eJ7XUBHKZZLiQ5lRhO0cUJV6dj9c5Zyo86kmEx2NGSzsnHpTniCGtnNBJiDh5dm4+tuC8+pBY9kxEtoxvv0tpmhcPEnKIEiCCZdRmqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgLNBW7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E87DlA5H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgLNBW7f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E87DlA5H"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBsehB1637723
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=; b=AgLNBW7fwOpRdhYN
	thPVmCuY+/NSDyCtQ+z9KZPZg/55tjnmjuJYW6zcgEgN1oosu2dU/PFnDCymNRBb
	ADca1iwhuqr70L4NJt3+/bNZWcmYXNbK09xHQr8QDs7XMwdgHvn0SYGZtX6ElFLz
	BPawdjjy7Kf2A/moIay0L9hoQa7k8e/ffdYz2iUdxJ4HnG8h+vFRQEqa0JMPKYQg
	V8xZNYvTF8vfS1zduIUpXo9EQi50hdMtsqcuKr6Lrktscic/Bf3S9noR29nCS4hA
	nSuyo/bQO5guSzVkCiE0gYAqI/Uo7z0+b5rQtPx8HSYBQjL0bQ6Qy8MUQ6bwy+Fq
	ilHaZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh2d82hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:13:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c15c77619so796981cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327239; x=1785932039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=;
        b=E87DlA5HMgGCPU9pot8L/oid75nLq/YcHL8HdJL2BpNzXX6uU0m0d9gn7HIXB0EPYz
         WO+ZvpSgnRdyappn0gatMhxxYrxeViBmiAjEQQzRb+cxxWqevmTw0anLNTBkSJoS8qd3
         G4WCtOkarA+8zLrJDsGoXjjwaXM24H/74gQCW8lKytDUX+nMIFcvl+gyW458kFJZ/7jv
         0XlufcTBS2b4wGBgOtM1HpyX0Li4Mk93WHeI5PA7mFj1F99rFRFmkFTT4sGd/zz7EG5l
         omkPoBluX9QnzEU5oyMPDYAn2HcHDMJjhMoJW1XgdDyhkvzqhrhRB4FAiEEO2ZF4IKKn
         RNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327239; x=1785932039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=;
        b=XTQ604qQcVjysyej0cKvtTHNE29LmZbMlQGOd6Ix1iCfj8yBzM6c1rcOXGqptvQ9gM
         NcvG4NwzpcWmsXTSS4VEM1CwLLCZsNZofsSvp27PmLIuLz7JgcDY7tNtjBUMxaaw+aS2
         DPoKePOkObY8ooav27UdWxlApTQlwIt0RSD7HxGWcDH3YlnHCQc2QsQS7aXRlt5HViJy
         ZPrSmlCGVuYq7fe09dZMkvSo3C5I9UtzxDTACv/+9AeT5vHZSLWFL03OBCSIVXfrzxtN
         VB8hWmJJyEZ4sWmuJVuGSeDW03E9Mk8eig7F30g5iRcmJU7Wo6BfY9z2xZRRlHjHnMrI
         eOnw==
X-Forwarded-Encrypted: i=1; AHgh+RrSvcQhBTH7btkcI1yM3Ewkde3TQlm0J5lrje1q/Ntff66Tbhu6cpqjYgK7zPVOKSWpDIP8HFObIOkJ@vger.kernel.org
X-Gm-Message-State: AOJu0YypSmmsH9crAEAYficHmgMnXwYqavOEmfcZQgzwOOAyi1iXqin9
	mN6tvJBKv/0EbW5NEAj5/eLWikMOXKo3f/ee6WLxbluFo8c3ZSiZWTQlWaw902dPkohqCc+K1hn
	R6YX4j6vro+d6HFu27jtO9ZLweCA6XydS3O8fmw7yoOO8bFfQch/PQuo125c4HSlq
X-Gm-Gg: AR+sD12RbYCZ09CGpDNJl+Faio3m32iZP8/FP18cH2hTJ55/1XB4Y30hpt1WEIYgIah
	m/V3/Y+ayleAe74FDdjRniaWM7o32ALifkPGadBB5MTo2FWILajigknPkJd0v9ZcWefisGQihiv
	KNiZRvijMc7H0v+tdRUCxRK7KoeZXIHj/ZIykmEFkbUf++8DwDXJgWd2K/Cssf/cGvDN/Wu/TCX
	gJ2iVBrLkLIthOtSEio8xokuHxdaHZcTy2x2Edi8a+cJNw7Fc9oyx8UPVZjSV63kB6gCtWQerjK
	AsLM+Q+as0v6bZ+Ld3uRT2PnFP2WmuKCNpqBNN/P4HOoxQehvKzvh1ld8fbW2a48xqd/AP/V6Hs
	1xy0IP1EUL2L25q20qyZ7xBVU
X-Received: by 2002:a05:622a:aa46:20b0:51b:8543:cbbd with SMTP id d75a77b69052e-529d6f6db71mr44778481cf.1.1785327238979;
        Wed, 29 Jul 2026 05:13:58 -0700 (PDT)
X-Received: by 2002:a05:622a:aa46:20b0:51b:8543:cbbd with SMTP id d75a77b69052e-529d6f6db71mr44778141cf.1.1785327238610;
        Wed, 29 Jul 2026 05:13:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cdf452sm106406166b.14.2026.07.29.05.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:13:57 -0700 (PDT)
Message-ID: <df03eb18-6928-453e-971b-681875e9cb0d@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:13:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
 <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T9m8ifKQ c=1 sm=1 tr=0 ts=6a69ee87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Wdb1h0LgAAAA:8 a=cV_IwbTCVfHGfDX6aFIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX4JNFOcw9tEBk
 CXdJ3ozlOMti/S9lQP/V1wtUvZ9Vchq3PbTvJmni14toFl92nKf3+a6+s8TylgAG4exgX1SrWB5
 DsAfUQcG+W9vfZDcEYYyDDc8it0rQKMQFEms5MxYJnHb5H+/+x0GE9VZs69tipC+oZUFt6WxCF1
 fcnJ05MWbh030ILsl90GHU4Fd7DU1DEQ8oLvwwvqsXwbqxIzPsmhWanmWU5178ap7qRhPB/1jFu
 QA8WLBNmgR7kk6phzOBwPRlQ9ySpIY3hQNlICNunucAzzuwj5N4JGSb74Wej8lIQCjR37pCLnre
 R7SyMr6L1a+NVAu66zqoFrDCVEnjrmBBIDr982Z6FQLrCiukDLe96DONoboEN8Dph0QJkAzNpw5
 w2qrMuJHaW9++Lahx7BvCvXEV2pqEgbCECrsoAOrmy1seiiDuoQcMm5owLH27zvvz/Q7qOJVAEt
 HqhxLhEFP/k/61AXYQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX3GWHlRl5iyvZ
 gAF3JviUIJD8CBlCVE1PCZW94r3rofPb/r1vE0JnKG3p14fB2GUnP6dTLd087Ce5+cmAil4QexM
 1KPPQ2VEzq7fOnl4iBNkwJy3gmZgzYA=
X-Proofpoint-ORIG-GUID: NRwDgmaq0dUpNtCxsZpQ6K4ONppOtYmO
X-Proofpoint-GUID: NRwDgmaq0dUpNtCxsZpQ6K4ONppOtYmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290101

On 7/22/26 6:12 PM, Hongyang Zhao wrote:
> RUBIK Pi 3 ships without camera sensors, and its two connectors support
> multiple modules. Keep module-specific nodes out of the base board DTS
> and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> sensors.
> 
> CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> overlay describes the 24 MHz sensor input clock and the three sensor
> rails derived from the switched 3.3 V connector supply.
> 
> Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> and associate it with the corresponding sensor. This lets the V4L2 core
> control the LED while the sensor is streaming.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	/* The module enables its three sensor rails together through PWR_EN. */
> +	vreg_cam2_pwr: regulator-camera2-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera2_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;

Is this (and the other) regulator on the SBC, or on the module (with
the PWR_EN pin just being an output to the module connector)?

Konrad
