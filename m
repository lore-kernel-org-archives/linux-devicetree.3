Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D6E3368A4
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912205; cv=none; b=oKZIyAFYwqW/Rk8I9eI3ZP6BdH57gr9nG8RUPjAt8K9cIaPHqfRL6LMTKlEmwLezBg//nhsr4PrD2JIUzbelflzd6Ek9dEWWoFrTu/xsau58SAk7m2xtZvyEa1qmqYxo90Ne1ppcqVM3w7NfQ/eCuHUlVJW3eX+RdbxPdaF1LKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912205; c=relaxed/simple;
	bh=WdGkYj1iMir25SymT1Zkxa2jedNiiwUmRZyq/YzJTKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thRT4InG+Lebh3keufAEV64GJCTDLwnrMmKuaJbF8dt4zTBy6V93FuOxRbIeSAggXLclk2DthoZVU7Wi3LfIdKAqYY4N/4oK7/hFxWO/q5yS0JL2LE+ONv9wGN//IVui2+MAnnI8H2lM5OgdH+vJ2anQM1hYkUkP/XG8OkiTN8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eP3/BhXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdhOWuPG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eP3/BhXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdhOWuPG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OuTB2832966
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySGMNnjP9XasOhRO0MU4TCjJaviX/cKXx1iwvpCKtck=; b=eP3/BhXlTh1U/2Dk
	VYCfaccSUsrkdgAjLx7JC5cAfFWAn2OAJV9lsz89JAzS1jjpRgXuF+ao0Xb/WLTg
	6FQiW+Z5T2qW6pzayQbEWlNi6nuQxx4j3MyppO1Gw6zMZfplm864aDThMSPO9U9G
	iJGuL1/IZyBli1BOA6oeWR8YVURZQu410MqdmaZ3BulCaDNuKOp1kTLAYJE5LyWN
	mgQRy3Pxnd/2PrjBL5c7+g/jd/LOZ0OeWAnRBpO2b7Qm6/Nyu1nhuQXMaaHVqyQn
	U/KchKf0P/3IBM8xyzjy+hpQ8mH5qXSd4hJ3IUOspqeP58Ephc3chRF/y7orQiUY
	4e48+w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrf8ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:50:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517bdeceb54so1285761cf.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912202; x=1781517002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySGMNnjP9XasOhRO0MU4TCjJaviX/cKXx1iwvpCKtck=;
        b=CdhOWuPGE1z1EGtdG17Y6ersDKdo2CW+op2Se+VJX3fAbXmTTFoHIYf9t4ix03DZ3m
         x3QGaFL2LQ38seaRbxt1SA2j3rhTT+Ke4/X57z8jxnpe/slnENCOOsZyRrPiQy0RIJkK
         fb8JjO8T3QaLnt4dgJ+8V+UR/tlFHM5FoaUf+QSr8WLjWE+rT6r616FhWPeIClWsJZkV
         jw/pHlooUOyj5tbvBerEiKYsbH9hMUCawc/kq1Cc8mZV84XQzRt7nhy3KH4pqn5oZIa5
         VDUJWlQMtY6BGSjqT5NqjA9EhcyBTxKB2zPIuMAUrSHsCupYgCCgqEDv52EvsXZHt2oq
         1Bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912202; x=1781517002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySGMNnjP9XasOhRO0MU4TCjJaviX/cKXx1iwvpCKtck=;
        b=WIbbfK51XvD81hB/N1D9wi6DuIas6O2xzk3exykkbF1sAZs0nkl0/EUY8c9eX15UGD
         7H28UKjcK0NM9kwuuuArY0vl7Ux30GZO0M6WHa1HIbb8kvYEUmFVg2ox31HBrZV13zo3
         OvaPSsZfTA8ImjET5jZ4C/SjifN3zGbMVJsQDdf9DV69t3E+81o+TcIMHf0gBv3EdsJP
         4wkWt8X6HuT1Ta6293wRGP19eVqDgcmJ53NrPTbhwzhRYSvTiCH1EYbAPCnnXvjxps3Q
         JvzGPk01vG/iCWgYJ+kUk78IRC3J9tkHqBz4i64yL2jwbUFiGYdEXd78LU1HPLQWLcUp
         uPuw==
X-Forwarded-Encrypted: i=1; AFNElJ9DrSC/TJJGrWoBqyzDSRBgxWi0uMXN+Z2epObAluQH4jEvNFCQRcw1jETeWp+9msqrXqjVhue+R6h0@vger.kernel.org
X-Gm-Message-State: AOJu0YzjnBbzpiwWfTYvX0g9P7jMDQS+IPPKm9A1skkPHwXzLoROXMXE
	Nr3PWhyo8wEIrXyPmxW4MPX2eBrmTwOGAaW2L5rVoV2MAFYviuBAu9620u9Nu8ALxvA7V9GHq7s
	mhEKGFi5Km6NrB2OKGO769f+2yYGZ+m51sNZPX7/jP7z4cmCMxt5bhDWLxT6xFqh4
X-Gm-Gg: Acq92OGWeH0WaYguT1W7SRIHzvl+qprCDTBBARR5ESBhyy3mPhOIXfJpS2mFgrjny3b
	rSWQ4Hn1QE7t76O6Isqq/BptA+J0f9JpAYrwhCc6aF3q++fp7Ms//lOuMUOqDPngv+ENppy0usr
	CgfDpF8QRhW/DWS0X4EVB7Ckeh9R8GqcIlzSNK+xS5FzqDgOsDGG36G/0AZ2vo5tiiXxRdwdc9E
	kPbgRlDu0jNWoDEgp4vfSf+IL4YPxqNx8mCj+Nj5KMxDWXUV7I4+OGq2njBF6Gcmn+OL/pWkP52
	hn92dguNnxflQgoOtie1nOaEwxKZd3memcxsUnOcXD0ip96FPP3p7PlNxw8DAmXpRprMDAhk9v6
	lr3qnjdWDtWSW6YhOLQS6vyHldRT4DMUmRbpPjCZE5p5IMPqh0mDeutbg
X-Received: by 2002:a05:620a:45a4:b0:915:2b2b:fbdc with SMTP id af79cd13be357-915a9c41cbemr1418290485a.2.1780912201592;
        Mon, 08 Jun 2026 02:50:01 -0700 (PDT)
X-Received: by 2002:a05:620a:45a4:b0:915:2b2b:fbdc with SMTP id af79cd13be357-915a9c41cbemr1418288385a.2.1780912201114;
        Mon, 08 Jun 2026 02:50:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e0280asm839231466b.33.2026.06.08.02.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:50:00 -0700 (PDT)
Message-ID: <cad0f559-8c1c-43ac-a923-e4d26143b572@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:49:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
 <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MSBTYWx0ZWRfX9M2TtabxSvBA
 iZys3/VTUrXheUb332dxvzOPsX2Fj+qA3spq/HE2l5Vld8/UGOVarCIZcHHhhXpRuxSb6/yjtLH
 vCma7spS5oIBuWl7zWcIQ3wNZQ9EqUo+TN9a/rq6Vuj/fkpCBhflw/dEmwLnudvPijcaLLcfA4y
 zWJU6emYaIR+7c3ZMtjn4XVpZfdiZk9qRawfIfHdQylOIV+wkayisV+QPmkjZ5a1oJtA2iPd/w2
 Q3Y2uwQz4gNtaNPNo1kwSk+1hgY7Hw2NAMdtNBRHi42C0zcFZmDM52Owpc9xMxRI7NOs7K2kcuA
 JFsdSXDV9CJscIFLHEKaNV0qHGBM02tWDMKGcKX9ExNggHoySY743xsSlWwcaOTq0tR7mpPCZcs
 Rr/x/1tZK6DY4U2KJRZT0flFzvXy4nX1pZmI+mRp8FVYhB5Ls8LM0+GIdNzvovHJO67jiSG/SKS
 5dEuWrvSMOPYWaZBHaw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a26904a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CQAop9hJs7bg5q8h2RUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Dcvj5sZ0a5w5EfMTY5mEjsMyEaVUjJ0Z
X-Proofpoint-ORIG-GUID: Dcvj5sZ0a5w5EfMTY5mEjsMyEaVUjJ0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080091

On 6/3/26 5:48 PM, Erikas Bitovtas wrote:
> Add device tree for Sony Xperia M2 (sony-eagle) smartphone
> based on the Qualcomm MSM8926 SoC.
> 
> Initial features:
> - Framebuffer
> - GPIO buttons (Volume Down and Camera)
> - Regulators
> - Internal storage
> - SD card
> - Accelerometer
> - Magnetometer
> - Ambient Light/Proximity sensor
> - NFC
> - pm8226_resin (Volume Up)
> - USB/Charger
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

[...]

> +	gpio-keys {

You should define a pinctrl state for each button, to presumably
configure pull-ups as necessary

[...]


> +	accelerometer@f {
> +		compatible = "kionix,kxtj21009";
> +		reg = <0x0f>;
> +
> +		interrupts-extended = <&tlmm 49 IRQ_TYPE_EDGE_RISING>;
> +
> +		vdd-supply = <&pm8226_l19>;
> +		vddio-supply = <&pm8226_lvs1>;
> +
> +		mount-matrix = "0", "1", "0",
> +			      "-1", "0", "0",
> +			      "0", "0", "1";

nit: please align the "s

other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
