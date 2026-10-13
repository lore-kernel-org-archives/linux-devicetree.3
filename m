Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87F5013DB
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902535; cv=none; b=skFkJU6+Aal0+PB76zJIXujUr3VfFNCAuT55elAI8khQioy55d++qSURNQ1wvUKhVghQdU9ZuewPwoJArszVady3A0AJjXNb84shhCCNks5bsNLkHX4r1c+7vHRHv12kABNsxLWroEMwBSSak0eA4zZZIwszHVwryF6wxS/0tSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902535; c=relaxed/simple;
	bh=YBYSS2cd/vhZqe7h/46qa/l9XVlkWJDuAu6ViM8rvnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJ8sMw5yPiCpxXyDMgR7RRs5S5OFEI2AVepjuyxGqK8xGUyvqYL5kOUhPq50y6VCvY0qmcoM9h7pafIJj+jFn4Q0WcBbBiMsa7CHpwot2pqMwFIP6r+wMEJ56ozHkN337fzPhBFDMPtRu4y2ahMc3nRZNqYZxZHJ69NMpkTNdBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGqyOr6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfY00kqM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGqyOr6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfY00kqM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4QoE2571171
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3BNPrEtNqmXapnqW1Au8jUfClwKMM3TcPaX6dJBusUA=; b=GGqyOr6DX0K53ryu
	8eVDL9ontaGI5R8PeyTscxhgfLw3JQI0lwc13nTNjAfJ6hLe3xofLy9GMThSlD22
	KXUd8Hva0WYkRKNKreobmVR6ae/MdSc0BorMBRpSYxR5s+UmdBMQEwQR23zPWmXK
	bbmnRTct1/zmEYcgHf7jLOyKX41yX2NI9lTl9X/eqi/wpnNVUJJGWEGssW2EArzI
	WNDi5ivnUnxn8vyxcOWqcY1nMpqLJgzt8THJHxji9jaaK3AWW4EcsUSZ4jFwsFb1
	H6S9tlVqWuAGNwTTB+7wK9w481uE1DQgRB23a+c2w+VPAPIxOUK3zTA99ttN7zY0
	J+58ng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcbfwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:42:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5351b6bd8adso8591561cf.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902532; x=1792507332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BNPrEtNqmXapnqW1Au8jUfClwKMM3TcPaX6dJBusUA=;
        b=hfY00kqM6Qoi3yk87X0rJqqZOvJLLjCX3Th8CGxOAMT3P3ba6iF6GwmmTY+jSRfUPD
         nhF8TC6gpfh5q1YJ6i/vJmo8X9o9IlbilD6JowiZFYqq0IR2XWXcJFGruQP/KM30ysGt
         4Gz/9IordmC0dkU1vozZZTt+6fkffefUB+6MFIaUrHnNVva2PQkefTtQJ9Um+rzaRtoN
         6gmDbPwAOwYO5hwutFPPbMvCK6x4C2TRN39/Mxgi8yI1FK8i66RrJdSyLPKqZSyR6yy/
         CV/Libum+NP6sJxj7pycD+0qJsLOBIgB+LbZjLQC+/rjkNyBRGLv0DNnvfrAl6YK/+jl
         eKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902532; x=1792507332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BNPrEtNqmXapnqW1Au8jUfClwKMM3TcPaX6dJBusUA=;
        b=OsEIY56DxTe7Xp6KB9TPVLlaG4iRgvpxf3W1Az3zOFDod8z+jwY4oCvklYaLqTf3dC
         LuLv5BhoAaUwJxNhL8nJu0FK7Iqhssw2ZpFeI1ASBR5dzQSkd6nmjjsNYmZzJxejWuv1
         pEW9v9VTCWLrrQePRvHZB7ZI28Cr/TbLCSYpeZ2Px2n87TSVvpW/LAGKBjC/f51rqi4h
         5xdNqR4kXbL8IMNu2wzhs1kcKHYX2dGD0BZJNzei5Teo2sefOOqXucfEA3v2HrZqeHwb
         Np8aJd/FXaK8DsLAlXpMjZr+EOr8/40aGxhZxN8S4XoOG98S27TfdJ6DsUStosl72Kos
         kHnA==
X-Forwarded-Encrypted: i=1; AKwUvByLhJVu6IbtTEhTSNYJ3fu9bV6Ox1ghupIxN4huE6pbTIp7VXfYW0ebyw2VdFzSr0JV2dxC7DqaAlz4@vger.kernel.org
X-Gm-Message-State: AFq9FYJNxYKGDZT/C1M2BmMkyXYCt93Cy3XLrbyhXmEX+LkXwdzH7z0T
	x0Qkja3PjN2sY1znvoLWBckfuw21iCbHHCIgyEMUBRk7QIKx4bIktAHGoq2AF5ldMt/OcLKCKBp
	4QETPTlV3ZgwRftXZopgl7C5TjPUGY1kl0zARY43cF77z4C2U0MLukrWv5R1T7fTy
X-Gm-Gg: AYBFou2W3o1RpKjRcJ5+BnA1Z4qd9FCVLbYSKxLs3NgZXbmMl4lXxbsXtOwZeCEOmG/
	rzHNKuYE97S4YuDz0xmgTNe057jve32TNAdhNTDTiBQn90vHktRTQ9xKHBOGknED60VhL7n/bu9
	wEDVVsbzDsiG/m7f5L/jvHoADWha6avb0kdpSvZ/68EN7OmuaGAlxof3/meZ9uY0Cbx767MgfyF
	7Of0hILGXmoDMlONwCgtbUv2mxgq2wxZly1WvtTg0iTbpD3Uz+LsuDEK3pN75GhUyg5r17IdjQg
	Ie6Iz5k13Q0fF6LA2IXuSxgXM0T/i6CeqWBgWBkGZ/uQrBOHVdibQrzu6oiVzoB2peGpXRk6tEp
	mcdGKsAdKb5S1A5LneSNvtg==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2402374585a.4.1791902532402;
        Tue, 13 Oct 2026 07:42:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2402371685a.4.1791902532015;
        Tue, 13 Oct 2026 07:42:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74c48sm600297766b.43.2026.10.13.07.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:42:10 -0700 (PDT)
Message-ID: <3201a0e8-1d48-4db9-af64-50f61827cc54@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:42:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-4-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-4-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX5epkIhTKbvDe
 /wdqfIkxD2OZz6otoqq0gJ+PMCABuKNJSu2OF4RlNVStGVO/GUA/xBxDqv9jBRf10BxhY/Uspca
 kTtNGZfZ3mXFXECs2yPSABYCcsvYboPS6OiT8gvFFtWizKHPR3dWXYbz4tmgNSx1Qr28rsaCQOx
 ymijK78CdWuxeLBLaGLiQGNM1SWFctFG2mTV+K+KE8OhyZrMNUJxNv6EKimCRbcOTBe6BZIVHyX
 IerwrKC7IOLLnoB4Nq420s0JuVjFEc9JvprcZqZ2Q7yayQq/myj1pffW4z8Fa4NChbv3XZJvfcY
 DUkdoZ89Pw4s/G/611Fy2GPJXI6lJf7+n8nUy4D9lMZiQm/wSEi0vpasmkDT87/DCMrZxcUfWYv
 4Tfk015q7kINZQv/OvnSVBg11iADqiXctkotyAtA54rUta9sHnEiuZLwFqdNTdB7cbyLtOCEc85
 guX3cvkh7yHYbsO0LYA==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace4345 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Zxf1fr6QNQWzRTqytMkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: v6k1JFp9FD0dnOy3KMhWkURI3FJPcIuG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX2hwZIW7Vpq64
 gAyBCljpXenNyZQzGAPgWWYmzuj6yhSiVY1paTKi+EYE5oCsHOECYjQGWtom/QX/vqEEpNNLT7M
 uxKEJjTNTUvXmzZvFfKHmJRwOhYM4mA=
X-Proofpoint-GUID: v6k1JFp9FD0dnOy3KMhWkURI3FJPcIuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
> based RDPs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> index 67f62c1acddb..7f90a2632b07 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include "ipq5210.dtsi"
>  
>  / {
> @@ -17,6 +18,19 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&gpio_keys_default>;
> +		pinctrl-names = "default";
> +
> +		button-wps {
> +			label = "wps";

"WPS", capital letters please

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
