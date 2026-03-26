Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2250C36B045
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517396; cv=none; b=jKYBwlSL5S0/ks3WOii4Cezk94ixDu0EXCFr9AIiCZ2yAzJxADws6+7b3HMHgiUp7nAxWsdnKmicbXbPlsto7uCBkvGMlwR52FXDCnm/ZVTxydEF0HtnuHGnNQnGSrrdKznB2iSNv90pYSUXMNA093gf2GSGurj0WroooZ9xvkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517396; c=relaxed/simple;
	bh=OEtA4jyMZvL9PeaZrYIy2+s4yVitbGhdxbY2yo6rOmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfiRbJYedEr/ukKpXTzCbIclPeEI3wx2CYFnPIfSolZMln6xOZ8YC8eXwh4u2H6XCabDBtjDENnzx7kX726Id9zKIPzjqCuY/rzY/F25zi2/Der0fNzomxUZgSPIm0nvcvx/tBfYao+S7uD6wT/ctTK6ClTrS3iaBYcO+1sDmLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeudyJRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIgU0J0z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeudyJRk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIgU0J0z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6seSg1062113
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=; b=jeudyJRkSOQY19x2
	scimtqrtUx79HPyLXNhLQaaP5m93jInrdrxg300dv0at+Og6AeKLaDOWe64O/WXA
	6uJER2RJkChjIRxTHyN8t5D7xgagPTBW4JpeA8Xvfc/qaHUeiNcXqd4jyeZ8tRoW
	eHS7E4hKgFUCXVAjZoO66sZRwu2zjZ9RuJ0F8YAZiY2kXMsz1MlzyTurBkOcVkHo
	yfXxLmRzweQiOyyz4nkTmIMg+27ej6Bx62ku8sFQ3ECnLFjXrCt2oDIgc3UkEKHP
	WQzp+tUGABYHDxAlNWxab/9eVMHEtPFbArsUHsKB5BDgZWfisC7d67h0EO/l/EKd
	wg5jQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkst1r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:29:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2955cc1eso2235901cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517394; x=1775122194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=;
        b=gIgU0J0zNR8mLHe8JNAtkGsNBsap+jIFS1d8u0Lijg94X/h6qtmb/Be8OH7bOi+jHV
         kSfDKZ2XDeMDrFYazVR5ueK8oSLWgDxCD8tQIPai5s4I9dRld6Usmfu/RZg3qjXy/6yq
         B0jjXjk1hoXDq6BDKpRLdsHbjGLlgfcb3+iwaRXfnvaqHkr7C1FVZaIukb8b0YjmoEtD
         NdgPPq9KwUZA19iF+SXPUblhost9f76kbU7+3BBxihNdsAH6q4IGPTiPdT+5TNXwU7zN
         Vrtbq749jUzB7WmXeTuRSU/VWLaJW9HgzuFz/RGo6qAq/9r8SX/r2DTKvQ3osZmXwYjZ
         pjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517394; x=1775122194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=;
        b=qMT/5wRvJueOoy6PoEwc/r8lryHKVCQUBD9hCI88b/biXI6oifk3eiJ6tCCh37sp3s
         O63+H2S8/7uHaI1gaXqmoF9YvGVg3Sdq6tMiLwnYF4KFx6bvmR300dtNfZSltDPCmuBm
         7MdEvv1hZ9JZyouHovZuRJYiTsXV2Ms0kdjaCUCkUmbJLxrkd9a7jFa1Eu2Uc4RgG1h0
         AGgeE1O3Ty5+vxfdIwtutZ8XKL7XvBsEjjF3CWVsYJzAcnTTy7oQ06ifGEWlzlQGGse5
         XV8OjGWMtLD7QxcFnQ/WWG06RZjsjpMJ+N1qzanUbJ/yE3kRZ9+O4L82mN8j+iB0r8Lf
         YqVw==
X-Forwarded-Encrypted: i=1; AJvYcCUlIQVm7E7iTwB816JK5aGQiERMAR3ByBdtcbHo8NctlriIvU+xD25WaUMSirI4IAQ7q17MtwOXqAbs@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxCTxDjp9dGPn6lB88JWw5XbXrUS5UqL0ctJDiJtsZHCS/wuR
	hQ7D2NEFfLK8fMGYpaFDMR2eU5SxP6UAO756fMYFe3Z0oelsMKZMkQO754mPPRsqlhsM5GQ/cgR
	cRozrYSC1QUctHkJBAjwh2IpOl66j5h0PyddmHmd3xjQHZcx+te44vueoepeeXzsR
X-Gm-Gg: ATEYQzxKfqL5iTGFemVBXFEmXAnwT/O+K+UL/OFjm4v3LMlKjeVr+kVCFNt7T9s2SSa
	58Df4WXbUcmpfgMxNC79QkyZ8UnX73FiKQf6jkwqvxkVw41yHuZbsw5yrLKG/zILS8gzL17zZKX
	ruoxVaVPZdrQtkzmfqObvBrvxbio7zMRzvxkTx2u1R7H5I61ZGU6wXPCREIS09qgk/zpi5aXrvg
	4bbfeSAfzSg+iC++ferdAo0vumt3XF8QcMBd1xjKkg8MO2XmvXu32Jcue+wj5JGYRycmzJOwTeB
	x/8HkZ6f+alSjpeBQ+1gLl3y4HZbO5oMYre/q7OQylVSAg4D3H/zI8zA2SrdpFMBMmR3IjBbjIs
	3Q+1TjN8nA2r+og7odvLTCs3d/CrI6+I5H3+kRV/NI3PJDIak0IwPlEtKwjaxG3mw8v09LvEiKE
	iuB+I=
X-Received: by 2002:a05:622a:848f:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b80f42a88mr55691461cf.9.1774517393517;
        Thu, 26 Mar 2026 02:29:53 -0700 (PDT)
X-Received: by 2002:a05:622a:848f:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b80f42a88mr55691281cf.9.1774517393028;
        Thu, 26 Mar 2026 02:29:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef86csm92027866b.49.2026.03.26.02.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:29:52 -0700 (PDT)
Message-ID: <dd71e35d-5dd1-4341-bcdb-d082dba41d3a@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:29:49 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX6U0xskOJtkA4
 CWNGgXPlHeTTpA7sHXJs/VdrgU2rxsdPHSgfsPdE/jLsOq3+XYkMhS9S5ufeoOIqijQHCYMGVFC
 2m1+D+FK7dEmydCEZ0NawnC9SNBZL9T6QJ6vyR3FoVdj+bV2a8g9wH5A86qsNXgMOElQtkndrjO
 Cph1ojo+cRY34oVm695QWNgQK7B1Dl4neEu/qbERT5M385YDEPN5OSIqXRkyAPke/jM8vk+1noh
 /pD2qZ0AYIXsq9+R0oCrgo6Ef20XB0/ZyZ0rwQUBt1OcZQ5iq1h0jEbye7LjD6y0mHAMu8g3VBz
 C1/V8aOGEBFrEL2muLfISf/wPEa6ICXZYmSEe5Q5fgYxbKUOSsHXcscQnwMu9R/GHaaaDoTldwH
 fRmgPx9zsMOrOv1ySYSkBV4Ku0hcFHSSob3VftsutDxeiPJoEoMGGKb1zyjIyywW2MqlmcD0D/O
 ThkINK8yeQ8XpZF9NWw==
X-Proofpoint-ORIG-GUID: UfrciudwTSaFuUFf_ZWKYNV71Oesdikh
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4fc92 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=RfqWXZ9bYgCeT7nH-EAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UfrciudwTSaFuUFf_ZWKYNV71Oesdikh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> The IR transmitting LED is connected to SPI8 controller.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

[...]

> +&spi8 {
> +	status = "okay";
> +
> +	irled@1 {
> +		compatible = "ir-spi-led";
> +		reg = <1>;
> +
> +		duty-cycle = /bits/ 8 <30>;
> +		spi-max-frequency = <1000000>;

I see the binding allows a power-supply handle - do you need one?

Konrad
