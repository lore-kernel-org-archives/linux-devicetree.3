Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF643B2FCC
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642717; cv=none; b=nHY1ABtqt3uTkSnkSESb9k2M9vFgSkdqqEpj/kFHhkkFHakD2JNOnI18sW1NczOyhK0FexT7kuE94Y3YpGZg3pFA/VV010evQo24F8jvGCGjBkDYqvbLTwyDy8gv8gB0cZuqhqNDOJILSWfWGZeLkDf/4+vTwzwSPnoklAzTNYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642717; c=relaxed/simple;
	bh=KaKYz3pNj1hGcCi7X+D72zEK2m8mNY9N43dNxg9MM8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPlox0Wt2ii/NLw/+HHMcoFBVEG8XXiMBjz0IUZQfxLHQoOZ5FIVD57t4HLQN9wX0gLB/uL0jBm7SRbOhzG03yeOWcPIu+Xr/WG2wyfLG6rx+4snbnLOt/mK78qoJEnXIJ6KgeEJl/9dS6CLJOg9dOvlzAv7acVpwzXwWMJ7Qa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxOrdk9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cErzpo2x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxOrdk9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cErzpo2x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385MR713362755
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 10:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iLq37WPfEGP6RO1vipA4QOAdYaXzJ/quNzFvXtrwp1k=; b=fxOrdk9Ny0cJFTZX
	//sHaqK4VxOLIR/hr0UU5UBu0yLFrY4aA6iHQXSBxL2YbuG72GiqX6xDmew3dlM3
	n0fBuDj3HrnYpv8H8umlianSW/2ijrjx92TFx1Txfqzj3EZV94Y8icjtLAxE7+Kd
	s2z/lr/G9U/myFRRYz1ST/zvzdA5cyEdPm3pavbmy1mBdOuVN1kzrYgWqNwhvzyd
	ETD26Y3LM7WzDaPECq4+ipua4MXSkjskEinAv+kjz3DWSN/nRmVrJ+Q7cMltKBpd
	URXhulAxa3FSKaJkNUEa+O2HuGOE0sHM8I06vEGVwie7UiM49r8B1/bZOZiyDVl6
	P6xsfw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkjr31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 10:05:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aa34663273so10737976d6.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642709; x=1776247509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iLq37WPfEGP6RO1vipA4QOAdYaXzJ/quNzFvXtrwp1k=;
        b=cErzpo2xoj0H/Dc5+ocILwvSCEGDjYUw+hXmOoINOuK/3DDMcwMKITtBoBm42JhNyX
         mij7/1HD0CKTlLUYwg7rdAK4b+4Ag/HaK1iVOD9GqZAJMMV//LRa4ZVGDHHPzfj7lIIs
         jRblT32gWHFax7OFe51syhKTwqUByq2kcBk5Du3lIUodUldBRS76VMmd7hR3mmcB44AT
         ykbwLO61d4mGGOjpiuXo0+h3qsPjR9x9LynkZt4ityo5s5aj4r7AZBIkTXmdbRnYSBCx
         gk9ozXm2KTDz1rlyjRtmw0CzoVmE7FvO+hsO4qMkaPuwlwiUW9My/WdztpT3rV75nezj
         A2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642709; x=1776247509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLq37WPfEGP6RO1vipA4QOAdYaXzJ/quNzFvXtrwp1k=;
        b=sfdyiK+5xq3VX2aAozFwyZgKyXFEE2oIs9USwj8Yqf5ftWZHnNjnxqryQetsARzNCO
         bFkhXwPkEeZ87SyNSGuZcEYueUw2L5ZHoKBI7MYo/dtoEXw80VcUUj4WSUqcdUT6RDEN
         gEIR0VYVjSdhNWecSTjcKVNGEseBnDMhI5nUO9QYHDKMorf7rxIG6hveKutDh3tK+IwA
         IDEUNhYVQKJg+WooE9ABsUoml1yrZ/9wsHqRKjX4Snw8bw4Dii55M6wyMNIfrEUZWf1z
         e9tDo5RqprOEaQUgXdwbgeDBKJyFHv1q08X3XkbLAhOkI90+m4L7yJoE+bXTyq5DJ95T
         F1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVVM5QaJajsE4gR4KAhZcNMKdFZZM4ZErft2MzH2pfzxjNmMlN59qNsQoYG3SB1O3OcjK5lknlvbuCn@vger.kernel.org
X-Gm-Message-State: AOJu0YwttSL9P4CFWSBcO162EriA72Rqg8S3nvJaKpHs/QyHlbwnVsEN
	vmA4lqx/vydrrbv3aDa9m2LONCm0938XCj12ttmM5rHI+7J0+BTW6SD89w1sQ8UYhxSM9uTnPAd
	/bQWHsBXUX9/wdpIsAr+tXCVEj38+Wk1htFssn0ETko/MNjOPYFJjek+aFsu6kMbY
X-Gm-Gg: AeBDievJXYVT2SXV7fC1TYGaSVOjnfbICVq4WkGoFCnbUqbMV5636eQ3aN9Z+BDGy36
	Z936zjzt6s8ZZYA2P+CQyxyx1ECXISpZSCSuhjNMUoBOMbkyqKxBs0F4j0Aoyvru4TSSDv6zqUL
	2xnppNCwoLyI/aks5wgGdfU+bLVtd+rOMkRZUF2yS0CJda+rDMqAYcuZjH4GUBeXC8Cbwia2uz8
	YojevRgu1kFN/BEM8/D4ak+TmmjYtaOSd4qNG09uMvcr7IF/Bwi5ZleAeNvjyt2b33hxDTM0ACI
	3YACExQOg7L8AdTt0L1ea0ZuJh95/jNzRL6L/rdt6eTIBKzDXHec8Q6GuN5EpY4UHIYaxf60zvR
	OAnUcmXgZtiU3yCtbZETzIZ1iaeAf/U2htSB/JnCYvht42RGkYRbM4+tD2F+Q5O3q7WpMQBvULJ
	gg7kw=
X-Received: by 2002:a05:6214:da2:b0:8a4:c5:1b23 with SMTP id 6a1803df08f44-8a704f9ebafmr238113726d6.5.1775642709570;
        Wed, 08 Apr 2026 03:05:09 -0700 (PDT)
X-Received: by 2002:a05:6214:da2:b0:8a4:c5:1b23 with SMTP id 6a1803df08f44-8a704f9ebafmr238113386d6.5.1775642709106;
        Wed, 08 Apr 2026 03:05:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3a6a493dsm11087066b.62.2026.04.08.03.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:05:08 -0700 (PDT)
Message-ID: <b9b71f7a-ca8f-47ea-899e-61e1f431b246@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:05:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add QCrypto nodes
To: Alexander Koskovich <akoskovich@pm.me>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260405-milos-qce-v1-0-6996fb0b8a9c@pm.me>
 <20260405-milos-qce-v1-2-6996fb0b8a9c@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-milos-qce-v1-2-6996fb0b8a9c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d62856 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TCpjqbDHjloqY1tG7BYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: aU3WYVR0tF7qpscBmeJllYevgKYr4riz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MSBTYWx0ZWRfX885/Gw8w0/vf
 UuFdS9giMKFlSRfEipZKTj6ubtue50vRCVZwT+2GExj8Jr0UtJmpXRQTlj6WSbr7vfmcCye3SsL
 FuyLdscSOVuMsy2SUj9FEcJvJ0S5xoQvzKlqfJRDER/fN2lmUMS7jQ3niYx3GFyNR+8unYJ71Cy
 XUJUupXx/3eSMup9sERrGR4YNdDrnNlZ023xE0/5oSpbIeyCDI7kCtqvD8fgXoiEv+2q4jnHZlD
 jEn1TRlt0heXVmtM7hf10zzA82lwvp2/QJ77HevZHG7j/ZLbIPrqcxNgCVgqt1HaIJGxtSOoSED
 DIcLhI4J3OgoK1Yl9vCbonl7YUYLbozADr8j3ThG5McUUevn7EvWmx8LaWf9MBHFm/SdBDjS3zi
 ITcZDoXwmHIRBdADAqn3TtuFv/w/S9IRH17IpZRBjH13+8BjpfNksXDlwIH6+qGViKOHRERKzL9
 he+jCK3nf1xn5UwWJhQ==
X-Proofpoint-GUID: aU3WYVR0tF7qpscBmeJllYevgKYr4riz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080091

On 4/6/26 4:10 AM, Alexander Koskovich wrote:
> Add the QCE and Crypto BAM DMA nodes.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
