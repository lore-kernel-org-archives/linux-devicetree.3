Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576823D565D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388622; cv=none; b=Bdo4dgCB8UXdMCnmUEccK5pXA5tf3Oo8EACI/QHpXErOoogf5Jt/eFIsoNgsLY7zoGPh6cinhh74CfkRVQS0qaczbPFTWyJtIdEnEsSPnHdRHlkBy4/6mcDzrswyGlJklwHQTsSW0LOzd1PYfeLlYOngRhH4cprgq4dmq7GgdKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388622; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfR1h7aVQdhH1RMmUM5wF3ncFsHrW2xJN0N/jeiVSthem9W2Oc72hpn1GhDCjo1d9YbPrlOluj8w/duW6W1pmkYG4mQP41SLE7+IkVdLDE/eyky9LdsQOm6lE6lj/zg4IhH62hvbrKfUk3irkufy+b31NQ3Cm7Labb3LVfuVU5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWiZ+hpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOFoK5c/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWiZ+hpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOFoK5c/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1bi727675
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=EWiZ+hpR34JIqbYp
	IpJZ3212ago+FCdTmeAIMLtmarySHiY+xBoGwciDgfDvdL6PJ0zsRL49ULlpNh05
	kJsCXPgK+UaW4Xo4nz/Tv58Vjkh5cBPhpUPeG5IPsGqcn1ZpZbm0hPYl8/s18Dbm
	O7z6wBDI/oZiOrEOovBVbcNKLS4P6RynzFJNWCWACZDNmlI7Hvz7IfNkKEtWKqlX
	Z3+1firrB0op/RC69+B/cRYdLWpaVR8uj+XXIrOacuPhVbspftd1qomGR0xgBLM9
	XyUlMJzoOWQSXQsV3ssIZACvqe7o8UH+rx2JTgzba0UcUSMJDDbSO641hIsdJ3+Q
	mm2Uww==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rux4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:23:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so56550e0c.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388618; x=1789993418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=HOFoK5c/q84IkBSYU3UWyoF8T59RDXHSAp0whQszo3LSoNi6Mr0i0XHrkesmBPQxM/
         uusO7SO3nmZZi5rPnCyWaShcQLq7uv6TbQ1UyzqC6TvwNiDsS1E0CkxJCvjFJLG6a6+o
         FxRJSjHX6uqJnmihpVcJuC3baT+VqyusjAj1f0CVQ/MLZkIEfnaReJxKvy3/T5VnLYIa
         R/+IlFwnuoMgPi4ez+7U9OC/GElASyNznlZp0jvV0A25ivllepCrgVjuvcMZxXi/H9ej
         hRD5iUQlLOdu3E0fNg3eHTv9F+fLT+lDwS/fIMjfpiwyorBegskzEme58nr0UY+vmzPQ
         WtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388618; x=1789993418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=eL/sYKpLiz72SE0U0OcP/T4inkkjkYlqvFRVoblYIjTY6WUv7ah7m1eb2EfqH2zixA
         tDg6vLjpnaUUVpUCxA+Bq1X3EanmwgQWEqM0uubRDZzzH8ibqGVlE4UciaLPzGxmhIFG
         3/tU3KdAc4eSUKce35k3pCHMjbA/ZCeSVOYRkrZcr9+3Xvp8GaT/phTMZunKTqbcxaNn
         4xNeVSKBiZiu7uLTzDNXP2X4ReCdqnkSwDIg7ZS41D8SYUnbIBndUWl1/klGyU+7nrMS
         x+HBBHBw3eFtSPdEgLZ7B4dilJb0U8IL51t4QUeONfUnSm5/lCiuC7nMPwdp3ulaA578
         9CbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqOidoN3m7x8nb/EUqtk0aDunB5fQSsEmosH11UsS3fF1QvDtH4CVoW7Nl3QHv2eBit4PIHnz1c9hA@vger.kernel.org
X-Gm-Message-State: AFuF++lW7Jhii2qjhH7aANgRznWgbulPgUUx0XJpRhqHCSXGp9NDyU1S
	rl8f8PGj8sLna87vbZoQ7zaN5w1z47wh7/cEmLKJ1uY2rix1DcKsSJpeZ9CvdcgtG9RFzM4gpy8
	I0wS68dbmKNWWZ/f1ib6SufuJ73EMPtBrbW0g745RVBbcemQCL63bBgwEHxAvqXqL
X-Gm-Gg: AYBFou3G5mzAgQ4xKCcZ/rakf+0dIFNQ3ngQ8x/HpO4eGxxApNIh4VOmWNVoqTh4TLc
	uNiVWcKLZ49hbenTkPse4YhuOOcbkVCBsY5XDq7lDgZl8/194Bbzs3RLQMY+N27y6yYg33Rm9ys
	7wbNn9E7wm0uktphc8urz0GuStCrRTJbCZKOu8tkbiWbS8uwhl8WNLD4NkKlgk5VaUstxYj8+bm
	Qg+p7c6Mqn7QKvSFAsxDHYg5twPbXl7FVuNlcyOaGIR8EIt7kfOKEQ1AgkYs8PfNTbimhnY50xv
	aBclmohsopz8Q+MQ0oDeB4dwdZVPVMz/gjEB0ojXflOcnGlY57ieC9u6/e763aAQOwfMho23Jpf
	UAtLgqlNzWVeBkebr5wNLXg==
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283601137.0.1789388618406;
        Mon, 14 Sep 2026 05:23:38 -0700 (PDT)
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283591137.0.1789388617945;
        Mon, 14 Sep 2026 05:23:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm22882931fa.34.2026.09.14.05.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:23:37 -0700 (PDT)
Message-ID: <059601f1-d248-4251-9373-8126c2403470@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:23:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/31] arm64: dts: qcom: sc8180x: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX8TQuqQMDcx3+
 lNj+cO6SAPQrSHXEnMfV3HhAeOYWTJ2jLMOpPCjWgP5mVfFa6VSw41egtD1oxYg2PBg5765Thwh
 yvi70CAMhYILrcrv3uQ8IoOgaD9eHrM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX2jaeiF7EF1zo
 qwjyK/RY7jpMg3NKSDaxZK/piG8CqIGZmmEyM4C1l911h283q0NrT/T1yJHanEQscyg83sBMUpa
 hkcIQjG0vygTaMXo+9GJueS+f593OKtYt5l+uzfdXBO10v0gRmlVzNCrLakgtqeEzTATTJ5EsTJ
 7rpDgMeHqqWrdCz+AganQ8j5yhuU6U0H5VZ5JB4fzcl4VOBdUEKOszSlxLBgTdIjG2qG2EFR/dZ
 YOTX9VIO1DONvH+Sjlgnde5ca23UlGzGVBKt15mOsei9TJershp1Pwyb/LgSlrygKrqySbP4olT
 uRk9+LLI7BVdl1FBtifR49MTUnUBfqtWD0QoSyxC4ewtBZXNsWAGZ6/czbQMhw+n5ZcTo45OeKQ
 jL9vN3uvWsNCzxv9mNzcOBKRb46lK9UYwxNp+4tGHTrypbaau63IvCGQ1RDsOP7Cj8gtyZag056
 CHmH3GLRNj862LXTbgg==
X-Proofpoint-GUID: Y6STuKNN_OelH6xfUQDPbRBJNXPt6bLs
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e74b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: Y6STuKNN_OelH6xfUQDPbRBJNXPt6bLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
