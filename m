Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B623D25AD
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388609; cv=none; b=Sr5fd5BcvUnIYcIWjMTts/zgYG3Y2ag+YwP68k6GtMHW8Lzm4bcVOdNp7svL7a/vykHWqo0G3EbbizrJB94LZifJ0pDOIrsG8DRioKpQRE1KA2zbBoUmWsVqgYviHVWMBUSJ0iKXEuj3NPVysu14f13FH410q1ZdeyBfNzWeIYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388609; c=relaxed/simple;
	bh=iOVStLhKHnv6aiuKlx4Du16W2rIOp5ORNcollFu6OdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceGCxaxuqoCsOExgAccJU0jxcPZfiD6U6nQLbfNGrrw2Gnj8DSyFwz5+fdDN3Rj4esrJ8w0QO7Cow5nICLhPEssktJ4XkAO5+igAcxI5C/1NuDKYhoc04Z0NK75dNfXp04gsx4JX4O+hqM6WaEahwhSO/RT92VQo2MUOGz2M//8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8luz7dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBJhBtwM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8luz7dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBJhBtwM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxl71460635
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUjOy3a9nW/DIDKF7jzbsGx03F+1F4Hb4J4J/5z3Kd4=; b=k8luz7dzD6dwUTcs
	j/JE20IsRC+l+Pkwz+QRkWJn8mWADNXfZ0RcHiwX/s+7JppEq1wLyCt5I9cZZTFZ
	6xbSjWht+leiTv3MIkGL2bj8q+UaT5OnnJfFKuWaCT6zZ2gx6yylRYe6xbZ/t/v9
	vqAmDdVDWgPRTLzpZMJeIIUMfTXoRy2EmUlrzbRyaSugRmf5noTM6Khyk0g/yYPO
	aW+eNMttJjaarc/NyGBaRE1yVTaXo7ImWnUPTs3d8FmnKyNdit9o9fBIaEPudNcy
	67GlsduIO8Vk4ZudAQ6/idtrth5GZJ8EdhqB11WaK+hO3g4RLsO9qwjsRFzd7X64
	dyh7Ag==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8mhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:23:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so152672e0c.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388605; x=1789993405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUjOy3a9nW/DIDKF7jzbsGx03F+1F4Hb4J4J/5z3Kd4=;
        b=DBJhBtwMxXL+RytYWmSL1jfsPrucHeEmnT9Z3Yum9L92s5BuBDA/+6vUih/byHelH+
         x1RDHou8cxSyAmfTKyQEP71h9NJIi6adWg20uDhOUZY9oWmhxN1BGYPwZrVrOGKys84V
         XTeBAb13ix1Zc7GcZxmXymoAlUzZM4NwUaGLrLuoLHDerV3lLyPv83QjAEHv+EKJ7hap
         ZpScx6C25GR+UlpPCFZaO18Njh8VqaDcJGQDvbd2Odbr2yV1ASERKT2KTfP2tFSlj8Uf
         a3Al/fmJjbyXD3G6Ai+zhZ/MmKP5GN+uwieLrZhXf2EDMh8e1Wj5EDlUhacmTTP0toY4
         JTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388605; x=1789993405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUjOy3a9nW/DIDKF7jzbsGx03F+1F4Hb4J4J/5z3Kd4=;
        b=opmSRk/+WjVNSGoHsUTuoZ+X9wzBubvxC+lbvEnVTGIYIKPw7i4M6mmC3j3xeKH5HT
         3VRtmBLT5Eg2g/uL8F+2ShZeg1AVzXC4UtKnlrUYMBz84Tf+4X/+b06wky1K1HI5YOgA
         IcFOXrmd7BiI/CBzzphtshKh1IsAwaQv67Hm7DVXR77fXvoUJi1QoelA5MtI8hzDKfas
         jYoRAnVxnQArPep3QaAqdBI46cXRmQE9yN7QgrLkGkHW0lc5LUfOPPvgVg5KhnOAsW2z
         zFoFAUkl5vOMHseGxq2zDPHy9IFopwnQoIVZAeKceua8NQL1QIBijCo1W+HQlqN2BDOq
         q+LA==
X-Forwarded-Encrypted: i=1; AKwUvBy6VbGshMvWqbnJn+ShKJSR+KGsmx5GjcN2pk/YQMpg/xKxOQFHIt89SunwEeJpaw5BUzaOsN1asFzX@vger.kernel.org
X-Gm-Message-State: AFuF++nX7np15iGQLGVlPbzkdiCDiRpVK55lDUeKEgGILcfWhLsipwJB
	p5PPnKEiI5+V64fG6HeoGbQveoIxRMhqOXFobfZKIx8ySvjVEoIJ4q39eXl+H/x8kVJsmsdJF0p
	w9aLDPfpmdDWMKNXosywCy5zVd5fs+XKB4DZUhFQhvQMQ6DaJ190hhj8CKgDT3kju
X-Gm-Gg: AYBFou01zQc3ju1H6feecCGm9ltQVgmrzvve6FvGgnK/TyateQwc7XXTuFUcmnSPqyS
	oIADv6hNO0kEKtP5EJvgiBAADV1Z0KZhIzquG9Yta6OTgxlpZL5pXwQ7Gd+DbMlAMBEgDyTgY0+
	cFFm1aVpfCijt5AutHE5R6D3ihhal2HuEks2C9uBjFHlLZJB5LH9/FqEGy8yWm4U0X3/D8KmWwM
	MSJzL/zy6riBb0eT8ZLl67A/Pm6Xk0w0PG8l7kAi6WtbLRGl+2t//xVPj0cStj8zd4UOvhUKmE2
	ZazzXT4M1ypKzVFUboC4JC7BmgZuOT3pRIbz1EhzEyGDlLRj7W65iF9gbLoreu5KVofmoDTcNUT
	40GJXgt2KcAnfhCgGlnVw2g==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr374653137.1.1789388605380;
        Mon, 14 Sep 2026 05:23:25 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr374634137.1.1789388604938;
        Mon, 14 Sep 2026 05:23:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm27798501fa.6.2026.09.14.05.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:23:24 -0700 (PDT)
Message-ID: <8a79c948-dbeb-4adf-affd-1fae64dbf736@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:23:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/31] arm64: dts: qcom: sdm845: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX4XIVPWpNIC9g
 tFSCsX4Mgs/atSSdaHKFLTDn4vf4dRZl1iVZpC/TqJIjVSa7+LosTygGqaw4ko+bCYVGDSt2iuR
 RFK04ove99WaMyV8TH97VaQsTd7M4WAScBYDDMkxrqNcBdijcZY/j97x7Squk2pT5oKC0IusvsI
 GvmW8gyXaHDmXS+zWV0zSLJKaq9n64x2ZH3PoWhd1NxehjONospQ3vdLL+6qOw4EkDynsfC1oIc
 IdK2Jtl/HOTPDKphwpor4f5x1AMkufCmn22qHV7iuB9UDTf2Sr8WUElQw15rUwza2OSy8tAypj8
 q7rBRSOGlnSW6ZW4TIXnYHnv0vBf+vxdNQjZF3qrfqiRcYWSk7itk8QRq95Fcl6coXiC/fJSjOJ
 xJBj/uHfZ8+dqzHap+nUPpF2U7rhClAYAA2otBXzqnNxzOw6dG2qgahp7GZlSzYbsW+xTgbNlZZ
 Mjn+0AKX8E+RkJzEzmQ==
X-Proofpoint-GUID: 6ENqe216L2poASnVtqVypfGQTzG5zoE5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXwxTPjtWpBl6u
 zoTx4dR+ggH+5D/XUQGTL0ksmOp84MIWD7lMZtiQKClkwEbPXYLd5cOHqFg7keoW2siLjSz5L3J
 q0kCvyZ6PJVAaA4Gr9LHc9ADuAe9W9I=
X-Proofpoint-ORIG-GUID: 6ENqe216L2poASnVtqVypfGQTzG5zoE5
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7e73e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b1f6782a3ad9..a5693bc72636 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -330,7 +330,7 @@ cpu_idle_states: idle-states {
>  
>  			little_cpu_sleep_0: cpu-sleep-0-0 {
>  				compatible = "arm,idle-state";
> -				idle-state-name = "little-rail-power-collapse";
> +				idle-state-name = "silver-pll-pc";

This patch makes it less informative than the current state

Konrad
