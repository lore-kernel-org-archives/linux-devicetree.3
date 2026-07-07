Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A13E559B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420538; cv=none; b=UElG/6hyw83nHiuG7ZvMga/hvUjXYmAEEkY7C4eZDH4IDvd8n39T5431zFniGBThb9KOxDzw/QuAYaXLkNpA+WXyjzge1wLrtdHW5787y9GREL5i5Lefm9PIy37viC1WVLBvIQkM4dwzPzJzLV47lAO0Iem+WN7sDfwLoPXm1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420538; c=relaxed/simple;
	bh=e+jx1Olfb73OVRo/4OTCtq8bSlJfSrGtv8Y7yUC7jgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zkf50uCMYjD1/PeofReLUzF3AcEgiM5acvftcjQWRXujZ+MP/rlwG2H6AHq0MFbBLXDt/W3pRLDDuoEFhMykAoshcLk8LO/mBbVxfHBkh/UKSaxUCGvooav1BFM8JrzR1D+bVhwR9WnPMrmxy8mnuQYmUPhIFRkcamURT2wWU14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7+je8WR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtoIgwwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7+je8WR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtoIgwwz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EIdN3203778
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZZXOlcWQScQLLTqcRXN9MyJOLc7Vq6eYSI7gxmCWkk=; b=E7+je8WRR7JqTH/b
	o6QnzVPjEmM+cgpfCOXGu49SxxN7222NGTrjLIaFxUXVAJZoNaWf4qpb8+AGGTiP
	hD81CsO+PGMilx2cdu7vG3fK6/G45mdmjEyMqeCYuzMaVk4T08j1cMyEWTHV3OMs
	ecaLqDiqvioircj+ElLrGum36CzWvInjT92pCcS5KdlKm03zq4cOhHsnb9xTX2k/
	p0yLkJLPRO1h4aQ8TwpVgiHlFu+wGhNfbqR+F+SpEwHVN5AVFRrw4c3G1zd3Ml4l
	IuR9352/OvmjG3yY9s5Qd4iMCwmF/NOipmYGV8fotkrzGmn1ll2/KhtQnGhCVdBr
	ODNrHA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a90c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:35:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c267931ebso24369811cf.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783420535; x=1784025335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZZXOlcWQScQLLTqcRXN9MyJOLc7Vq6eYSI7gxmCWkk=;
        b=KtoIgwwzhy9ptd5MoHjZprvHq/fM0W8WLEEnbp+zmqbB/o+nPGHBqc+E+0V8xmcK4i
         gKfyyE0zBJkWJZHCMSlgLyUAEraAesOc38MuxofIOxnNzFr0h7esGaguzPzm1d/ieFYJ
         nQSuoPyeD8/4g5g1Ka4YBXXknremyqvPnyFiNA+fO8IWfyhfQsq0ybC8c0UO1BFSskv5
         mL5Fikhe8O3Nv+hEDEEXRwPn5P2wGahnBgQFuqxCFGyCGjo2GO621vSgjF9QNw4eL5Xo
         OsbOGuGDVnNJlsQdnZVyjbuFKFN3eVrbjxPRntifxuNgggJ6BKRJaIFrFki01qXDcdbc
         13MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420535; x=1784025335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZZXOlcWQScQLLTqcRXN9MyJOLc7Vq6eYSI7gxmCWkk=;
        b=FSnlADuZmvJvV9LbL162uklYjW50585DX+JiHypp0HeI611DKXQMgdsLCf15293ZgR
         vqmcpn8mz+6SbuAukCQ52sNPxVcA3HvT3LzhPrZePzGsFRRm2ESr1+MctCNXqocv6Rpr
         Tctc9mhQQ0gF1wcoy4LhW7x74QXcJfxG42BMlGRhVnpQXhtSuFLj2+Pwyc9vT1U2CuQW
         miCPL4QXMNFbbPY8LCqVLFly4UkXYyD0W8az5UtLDT5kcTkGgOj9q+rAtbWgKZqtpJxP
         in+B7AC8frAWgoVIMTmewlL2NJY7+B5tC4yxeQjHs8K9muN0d73xbJ0tpswclWOGf4zK
         yClA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg4zOEbhIYSPHruDeBApeC91dPHz4syo7TpfE5RFAbx3ymPFNOtbQEtpGvgdAQlBSM3T6mn5vdPyl0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu4fUZUKblB1IE7j7uvYGQqjsFFPDcCvfFOGIg6reDC1w44pem
	W5I5P+JfdKNo+5mvQtOZrNeSLgxfbmbud1ihuXKIJbwoy7g8mPZSfjsoIygXfYwCxxXVBZG56OX
	H35b5954dffenZzd16PRaQCnvKvoGqkZUTR56uplUN28/CW0PYUQAt/3JPL6Y35BZ
X-Gm-Gg: AfdE7cl3lFr85FqPCUU29z1TdxCaq7f56LZr5xFXjAkapUMRZoadNQGKg7Y2PZ8oN7M
	Kp0XWp8klwb7K3enrK08a/Sey3PppW/9EAiKTceF8+ImK29gdFWfdO5Tze+FS5SV0CpKPNDtH5t
	Yd3wzQryV+/liu1nYyeBP76mb0oh2JvwHai6jjOa3U3CBnNlERBq1RvtHazid8R5ViCSzNYPijz
	Pa1vzm7GGCSXo6UlsrRjXYaGaQHM2XiFMxOpfM4SAg0P63AwfeePaZ+LDtE6Xs+QI2MAJdoyRa8
	enLY5NfROH715X58/DgadU8wK0gDb0Ub1p4hKCOlBgPHIspOs3DfobCmGO6YLGnrd63eGkTb3+a
	+JQ6YuIiKUznfjfoECK/RXwq0CT1vYjU0rWY=
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr126558801cf.10.1783420535119;
        Tue, 07 Jul 2026 03:35:35 -0700 (PDT)
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr126558601cf.10.1783420534637;
        Tue, 07 Jul 2026 03:35:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada04d04sm102848566b.47.2026.07.07.03.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:35:33 -0700 (PDT)
Message-ID: <4afa8797-1cb1-4cf1-bdbd-9cb5725377b8@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:35:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
 <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com>
 <b1f872f5-66cc-45fc-ad42-c308f8970691@proton.me>
 <66330ed6-826a-431e-9e8e-f2998af55168@oss.qualcomm.com>
 <1e151b08-5d3b-4b75-8d71-635617868285@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e151b08-5d3b-4b75-8d71-635617868285@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AjxUWg1rjYxQn4J16pGd--qiqphIhzc_
X-Proofpoint-ORIG-GUID: AjxUWg1rjYxQn4J16pGd--qiqphIhzc_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMiBTYWx0ZWRfXxAzMtuc0QgLg
 meoGbmJez5bD9H7Gy5L2bg54TO0mzbvnhykE5RJe1KqWh5d4YoJIpM1dWvsDQU6D6Vx7v4z+sTU
 RwNQ/zkH+4x/5+imPYqj0k7G1XTmV8k=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cd677 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=l5FYNS5t4BCBesUsx-IA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMiBTYWx0ZWRfXzCqBQJd5EBqk
 mu7zVe0n8JZqSCimRPnnL7qQ7yckTGmnrSin1XsLsw0UpFmZQF7wF11xmbVkHoRwfcun38Aa9L6
 NppBJ4ePujjZwfpYwKXQfhD0w7oSyW2yh0pNCXhG22+piElzwQQX/dOeQ+DgQyl9fy0rcJpZssK
 QQTyGPKVyV/kIM3nRC2XK/SNFpJWYlZDZu6e71Tm0kTw0tU3DMaTOy+WV0cP6uM+MZEh6u5Pe3R
 z6eRNx7dhLj5ZfqYSFDjO4Jx8GoTBP3ibfk5gewFBRbvHZIeldU+Jbi6YC83+j5x+nw9KXUeoAc
 IVtuaTZXMm+cq2WqNfhaalgKJ8pr7Y33IeYGlP2Rl6Pfgzr9Zy9j3b2ickYv16zasLVtH+owIQO
 BVnavh3fen8DMdqGfvod9OjhSbX8Cmxa6itNttjG/q7vkcEFvIBma35d0uz2dl7iCtPSLncShx4
 BlruVhpTk7IHW518r4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070102

On 6/30/26 3:57 AM, Esteban Urrutia wrote:
> On 6/29/26 10:18 AM, Konrad Dybcio wrote:
>> Please alter the size of the register range that I mentioned this under,
>> as the range is wider than what you specified - the driver takes a big
>> offset from this base and accesses far outside the bounds of that range
> Just to make sure:
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index dd151a2c48ec..100daf8120ce 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2643,7 +2643,7 @@ ipa: ipa@3f40000 {
>                         compatible = "qcom,sm8450-ipa";
>  
>                         reg = <0 0x3f40000 0 0x10000>,
> -                             <0 0x3f50000 0 0x5000>,
> +                             <0 0x3f50000 0 0xb0000>,
>                               <0 0x3e04000 0 0xfc000>;
>                         reg-names = "ipa-reg",
>                                     "ipa-shared",
> 
> Is this what you're referring to?

Yes

Konrad
