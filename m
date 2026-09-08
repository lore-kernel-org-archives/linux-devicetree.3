Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102975476EC
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872572; cv=none; b=jElKJGPxoD5qiUH0yxnZAGmKJxRgVDNjB7k8ddPonmnZlUXaT+II/VezAayPovLoyjGm4Ajhnd2spIYrKjdYUTQVKHKX48KemdpwkW9H19q6jtE7Q8KZv4x8zVmWMcrpNXJQ3InuwLA5J6HMOAybjOrgHf4NtIYAqKA7yoZC9E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872572; c=relaxed/simple;
	bh=XX2epvmlLQo0RJnDrbcx87SCzNk+zSmVWGjPaOcT1bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDo4UW/8BXKido3TX4blTmN/7StWEuOQn0F1HusvylCUMcFxPhnbUDlKM7IXfIpLkJslKhTiWRaLQ2Edgwcv5sB0j10xpTE6UxFXYL4HN0ZIkJd7rHVWJPsOHP+O1mIT4zXOxKpb7Dn4jnl+2Nhft8er2k9Zt2Ns4bms3DrHq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R28QCqYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XasFuaGj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R28QCqYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XasFuaGj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Cl84Q3222532
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 13:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9od1/mMLI/E6Yx/CZZ9c+b1q/L+qRxzvRW2AXWCxeQ=; b=R28QCqYHddbxB2eq
	gy9q2fsTl+7J8OqbPuykazYU9/7D9Oau5u+2kfU1rUJk1qHJO9z3R1jEuKrbCiJY
	eAt5ISKZcWOp7GvXRSBrAitpX98MtOHf+YlCsRJjhiX3hbPdoNTOemvUgfhnwlcx
	iCvBo2uHhlgmAgpKX1Rg9slCTmrbObYodstgoa7RA6P+iANLhQoA06F6GTQqgWo9
	RHVEMGrywjj/D5hKtNQFwT0+/8sWnRslPEVWd4A0AwfWwtDDeLl5Pm5rn163/BrR
	mO5Vxis+2ji3uF9n4OjRzHQI9xbGfcKciJmT+A7GSNVOM4GGcC4lbN0xg9P/V9MF
	t3Si7g==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjaguj475-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 13:02:39 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9f583f0abso499990a34.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788872559; x=1789477359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9od1/mMLI/E6Yx/CZZ9c+b1q/L+qRxzvRW2AXWCxeQ=;
        b=XasFuaGjtHl/qVPBZrPdsvjtTA7RAaOPrmvyzLJXJQK9CFspnQvWHPhU5rVj6EjS8N
         tgopwejtNJ/KGTYbgfz7XxKcigiqzodBNb4RlPBV9OyE9wyLShWL0P9t1Kv8IAq4es0M
         cHDv8tdxt38sO4jB/QZ/CHi/BizzM7HQGciX+PxUk2JDG3iXoO2G9yb0P/TqZFrg5MnI
         4Z2kflJd2SuwG42qL0dTSiCkWFFTYjZRCT+nq/E2CdR0KIypzqOUdRx8cvShAJJT4IQY
         FZ/10V9tM2ut4NyY6+fr3/N3m8gSXfdSZa6qDQDZSsOsL70ZfNr2ToYGmxMfPbiilLnv
         0Efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872559; x=1789477359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9od1/mMLI/E6Yx/CZZ9c+b1q/L+qRxzvRW2AXWCxeQ=;
        b=K06xe5XpaOluZllTPtQHffUntEjXBBmrIkmb3/4a8cheQ+eovA6Ly+gHnsmekcX5wK
         xnhqsJ+xqExHGnXH8eA5OE5t3DijMKX1wHNkbqCVCM014ossSRcxKCqdR9Vfh0qiI+Fj
         i9cnGag8PVNzcbEMr2jgKe/Rvh+UbU8pThxmDMpQbdqJ1tel/oxiXSQF4HRWhk7+kdzq
         fWSne8ws22XhfieXcP13Qttf00BQ8noYDiJhycPnYgKQSOwmwZMOWjONVYnTKF3ZUqKV
         5GWkVMbdZh9TJSADDr1I7/QVx9Q25ObwuOvvnH3n/N9MRN6SEgHAYENkJ1+ooar+XV8c
         m89A==
X-Forwarded-Encrypted: i=1; AKwUvBwH2BN2o/im+d26EoEACjLe0iLrq954B5LH0/WaIdoM32ELb9k1btdbPuvPH72xTxknNdDvJms/ko9h@vger.kernel.org
X-Gm-Message-State: AFuF++k9y5GHkAUj8DCSU5BtzfPt+eXBfi+LQk27f9YPKgoqmdmHVp54
	6uquNaUvEkB+4OKioZvqvDLq1WGPKkNPxHps1sGp93MfdkWgMm3lVMVlHqtE1cxGnxrdNgNPld8
	AOyupIKcTPKBRbhC6/k3XKcpZymvKBZNdrXLB245IN6nF5mE+26eKpZ07rDYt2O5k
X-Gm-Gg: AYBFou1t2VYt/2+NhdJGEb8vH+vykcrGdkK2gol6SLk+LMOSXdYtnTuyU84X1W/78+X
	8Cvy6qJtRo4QcLJhGznMN40oIyohJLR2j6WVcjSh+vCc/XsfFvB4TyTc1ygAOGC9fXMpIiPDzmb
	Br8BBH39ZTn2Jcci2r4i52LGqsY9+52AzGXK0ntIXYhMFgQpuVObFLubmNsbB1GZt59M5I7OTLT
	oVMOOUqAWuqxFLhoz5tw0aH62pH8ifdFcYo2gtGplCHD1Bx8whIkFf/pWz0jzLUbn50/s60F2IF
	0hlnheWR7DZgIoEpKcsZhYYR8i9oKzg6D7fjhLgZn41dp547kzE3lREWEcjMHxKtaMbTXll0lI9
	qOqoft5MfpmNn27B1i4SbZw==
X-Received: by 2002:a05:6830:3c8e:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7fb77233fb0mr13137940a34.0.1788872559101;
        Tue, 08 Sep 2026 06:02:39 -0700 (PDT)
X-Received: by 2002:a05:6830:3c8e:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7fb77233fb0mr13137846a34.0.1788872558370;
        Tue, 08 Sep 2026 06:02:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a88b7c04edsm726386a12.15.2026.09.08.06.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:02:37 -0700 (PDT)
Message-ID: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:02:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa0076f cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BlYFBzphh5xgekHqNzEA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: TvDKkeX6wbd98ZusN0NOMdJ6UBCpDc6Q
X-Proofpoint-ORIG-GUID: TvDKkeX6wbd98ZusN0NOMdJ6UBCpDc6Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfXzd7q7Zfi8OjM
 Nj4o9nsNf9cnSbqMQ8BhSpgTtIoKpsiuLneY5/QNOdEgcYlpO3Hb9S/qy8S/O+fFQEKXPQHpP+p
 3airhvxrDp3q1kQxK1L6dX6MJcwVPzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX/dHRW1vw/roq
 dJIWuuKqfoRJKdGrBptdtAB/wXCtdp8pUMXmaezoesMzSObbSEleUVb1aSkosWGbv3ow7Lx55/t
 mcCOzq2Pu5WCaUE1exTXDfTAj4ojMUtCAMV5j7E1JRNcWvprdY5Fp+laYgTbvJ0QMnirfCq/ggY
 cy3FlYcm1IV14xIJoyRVYoHtSgSV7e8xzHTUmGDK1YAYMc2XHdLy3tZ+xIAn1d08sjtvtz7Hw4B
 Xb+Ls8u4S3O8rZnHgBeeX8skVaFGwrHfaXhZlsFCFgyeDUUNeUg83WoAOhjCMhhTtbVhBV3oZMR
 c382ow5qTbuqybjWDup9J/6dflb2eVHilgPWv9tayOdbFFXvmqPUKBGdBM0XMRAQTAuPM01MNOT
 zkhABgrTi2+5p/DpKBITFPaSq9/JyiIEnRFoGlkjYtXhVAXeSzxWfnii+K45P/VoYEmP9nlrsS8
 KiHJa+YMW8TCuKcnCbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080140

On 9/8/26 9:58 AM, Karthik S wrote:
> Add pinctrl driver to support pin configuration for LPASS
> (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
> on QCS615.
> 
> This IP is an additional pin control block for Audio Pins on top the
> existing SoC Top level pin-controller.
> 
> This pin controller has some similarities compared to Top level
> msm SoC Pin controller like 'each pin belongs to a single group'
> and so on. However this one is intended to control only audio
> pins in particular, which can not be configured/touched by the
> Top level SoC pin controller except setting them as gpios.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/pinctrl/qcom/Kconfig                  |  10 +
>  drivers/pinctrl/qcom/Makefile                 |   1 +
>  .../pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c   | 185 ++++++++++++++++++

This patch produces dozens of compile warnings and is not split properly per
subsystem.

Also, it looks like the data you provided here is a subset of
pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
copy-pasted between these SoCs? Are the extra functions present on 670 also
present on QCS615?

Konrad
