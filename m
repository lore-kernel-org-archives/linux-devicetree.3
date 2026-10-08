Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4B3D902D
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444181; cv=none; b=DCiZjCSRXx+B5FIdGzX2BpnjA5yKpvfhXLbyjajyU7/YEtpWWzTXfda7Sir4eQfwnA4QY6yHzWy1bKTyBb9HKCvxxYeCPSnKXqysVeTZte46K3P/YuYiGycyO0N6IGsQp0V71Gyyl3Yh34gD1kGPw+tvMjIY8E8wurBiE4kw4lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444181; c=relaxed/simple;
	bh=i8uF9NLjlipi2g+SaY1Sbhj1L5kPCa+uJ+n1WEcSgbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbV9CKsQFlW9OjuHfLjvyhGoOVbbCJO1q9oSwWbwj+xfa2V4ZJLNHPuBRHaETwY7Q/D8+fpCohmycZ7lXj1bBa6nu2UJR+0Tkqx5FU0isg2i06vE84LUeyX5FFeU9Qt45JE0yp9pyxIMHp0WqJIpbM9923UGrtZ9vSvBKDVokOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEp9zmEk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2YkhCZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEp9zmEk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2YkhCZL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K7LI2189885
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 07:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ppMBDp/pJ4xxrQFK4q3LpnADbn6+L74//XQw3GBFLzM=; b=aEp9zmEkzBjy027b
	3NOlmj9O5D02wFd3a9dizNSmWW3uKE9tsrg6bJkbfQ2+nb9feFwHVCv+RYRVxz3U
	D/B3nkhBXr+hAg8uDnhWmRW7W5rxfnUVPWXwaKhwb/ufF3xSC+KESO6Mc4xIBdX6
	v+mLbHD0FhCExY/CaEbkftAQAYUcsJ2SyVv58i9uQq1UvMIam/nMjU0xwIikN8qR
	RENfY5j5VlewuE8gsIOgP7S/rB6zkBtP2JdDOjfAs1gcMYJ51FV8YdjY6KTXALB5
	7WTgrkI18bA73TTOOiN3YtC6n63vZbgqmr+qgcLrAtwNktTb36qvcnJP4i3M4x8w
	4I4ueQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39n7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:22:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so73674765ad.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791444176; x=1792048976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ppMBDp/pJ4xxrQFK4q3LpnADbn6+L74//XQw3GBFLzM=;
        b=Y2YkhCZLDeQJPoobZCXFJXwL3TsFw89elbfe5rCoc+LFa2yw9s4Oss3p54qZTU1lQm
         wmwDx37B/M8WhPQzxCynFKnSvVoT9gVT6+baSVyGb2Igcar9rsCL5ELIU5USL1yDXNbU
         Kxf32VwT/s6HIbvWtJXYp4hbQL3IOV3Tswj3w2huj1614eDEXeQbqTeOn4t9DOyl7iTf
         t5p48YEOhzYsvtE196eY1Qgaj77wQCTZZKTpKUyDN+4t7B/OIsDNKx1MZX9WYKymSxZX
         4DyZxcqyiSFaVhtWpb+V2f0LxtsqPrCWtBdn3z2D6S7U4kQ2H6nPyFDto0buGg/8hEuC
         90tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444176; x=1792048976;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppMBDp/pJ4xxrQFK4q3LpnADbn6+L74//XQw3GBFLzM=;
        b=sho6Z9ilrsgf4VFvhfrerfnKPmVPOFMb2gFPKsnHKJoDj/+Csoedv2zXYFrKxwN9xU
         tA7W877FOEqAp9WPDr3STzpgtrCJopfz4E/ydO6vhClVbwSPn2aAuR5wE+VN84Kl9HBZ
         +D9B30NcPvap8LXeI8zVRfVK/iW0zOFA8j4b4VRaHoH0CY454eeip5mt98vGJlHsmgPh
         IE/h9KH6xI0VoAAxqw7yUZr0B0uQrZeF1Xfu1APr6vnxoXnz3Dyo3wswyIkrVQyA2mzS
         4X7ccgMm1R13MaeuO428+hcRgFZNYt1NpU37Cu5WwQso9l+uA8OcD2bHPFJOPIEN4ebS
         CtCA==
X-Forwarded-Encrypted: i=1; AKwUvBw0eVogdackdyzewkiGFN3icNYDmb7rwWAQ/uANZ2jHiKmo2iRgKnQWmmHKOHbd79WwcfWKaTCBLCXX@vger.kernel.org
X-Gm-Message-State: AFq9FYI0vlw3EtycjAh/fdL5grxTUrL/b8asJ4uPsCYR+WK6Jdq3bMTq
	mFFJwjJvF3IQltPnvtMiDiZo0dOKvb2R6recRXdz0T9EbONV0xi4CegTi/I+V8AoZzZ6T5tc4mm
	tBz2PeICUy3Da7do+V9Eu2iT6zE7vWvJDjDYUpLrtnLwJ6AakrxR3BDWVuzDU1XoN
X-Gm-Gg: AYBFou25U9NAlquXkAQyCpNKIjjnSsk5NoHOgck5nlcDPlaxbDa8wnkoPNXmahBoV7+
	qeA0wfk0kXyvC9znMVAdAIlhygSCnk92vA3dzagGx3QB4u6+270oHXcSs2Yt6AsmWsE+Sv6h9tI
	sj0lmjduew09T2gd8sOZ2zvoSoWh8W5795BTUBDTkOSqRU/cSfPp77J2EIoDfVira20Bt0hxcwK
	3h2SDLPVi0rlprj9TrkTjLjvs262rTahSzWDWniJzr2v11PRmPn1sbH10t03jQQVpBF4sDHP/ct
	H6A2JL9zw8+FrFX6623X/+/iTKSOch9DlHDcmx4Rh7M1FbrVfjotVNLaEXUgkgpmVdf0EPqzgmx
	fq0IUpcNg7pcXFaxSWwY9cXhw0oM=
X-Received: by 2002:a17:902:f786:b0:2e8:b4a:43a4 with SMTP id d9443c01a7336-2e80b4a45cfmr10534335ad.34.1791444176223;
        Thu, 08 Oct 2026 00:22:56 -0700 (PDT)
X-Received: by 2002:a17:902:f786:b0:2e8:b4a:43a4 with SMTP id d9443c01a7336-2e80b4a45cfmr10534125ad.34.1791444175481;
        Thu, 08 Oct 2026 00:22:55 -0700 (PDT)
Received: from [10.64.68.122] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604b53294sm20934665ad.83.2026.10.08.00.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:22:55 -0700 (PDT)
Message-ID: <894b56d6-ab39-4920-ba37-94a5bd0cad5d@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 15:22:50 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
 <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac744d0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HdoDP85nwEVMDcDmVcQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOSBTYWx0ZWRfXxp4irbilB27I
 WpbLicmyU8Dbs8NLVnn5vBZhQ2JhAmrWugnrhyCpq0Oz91fR6h7lnTmnrbZc4HnbLdbdAZOtH33
 Gm89jDPq4susRnk0HFopYaP22/9p+Cs=
X-Proofpoint-GUID: zYyUCYBZc2dCllWQUeYLLrafxr2XcSuR
X-Proofpoint-ORIG-GUID: zYyUCYBZc2dCllWQUeYLLrafxr2XcSuR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOSBTYWx0ZWRfX/9BfLBLtO0Id
 5Li9HicgsPbgbskLaugdZLJi2Li0yCL599DsAm9xjPuuIsjLTJfNovDas5SMhDfw9+MWAGoreV8
 UpLVGGrNclnVD5DaZNhP6VduveGlWunMuNHdY660IcYNN+MWeLN+1J8suf5jmQcyBCIwVu6t0sv
 vuNBJr1uHNFqaNXmROsOCmVwWmi9nh6LH4AG+ZQd8z+TgEE7Z4gjBAO12YZeyj3lkTPTJP2AEKf
 6yYUS2OOMgfBSNso8mVDZYCF2aMR9AZ3M8gELcVY9/jwWgbQToKxt/CsQg3GZkHayTdSo3kH2a9
 4ifVNP59TQB3ZY9GqbYQBPhdI6YYeImDKOmH5GjNPl7Js0h/kZqDEcGjadOlkbgMbqNeU80AKbL
 nPHVG81irzUK//UhYAkMpK5scLX67ibRQ7DJVyV1YYyh3m93/hJnHKMArHCpRNVGhJlUAD6vcLP
 LoSeN55pfcaSftubtog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080029


On 7/28/2026 5:53 PM, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Hamoa IoT EVK board (Qualcomm X1E80100 SoC).
>
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 09527dcf957672b4b9658988359e79d8a432fd93..abec577c062d53952528f3bd0330638ea53b83b3 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -3894,6 +3894,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			phys = <&ufs_mem_phy>;
>   			phy-names = "ufsphy";
>   
> +			qcom,ice = <&ice>;
> +
>   			#reset-cells = <1>;
>   
>   			status = "disabled";
> @@ -3939,6 +3941,17 @@ opp-300000000 {
>   			};
>   		};
>   
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,x1e80100-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0x0 0x01d88000 0x0 0x18000>;
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>;
> +			clock-names = "core",
> +				      "iface";
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +		};
> +
>   		cryptobam: dma-controller@1dc4000 {
>   			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>   			reg = <0x0 0x01dc4000 0x0 0x28000>;

Hi Bjorn,

could you pls help to pick this DT change?

Thanks,

Wenjia Zhang

