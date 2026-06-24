Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3E33AE1AD
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782289267; cv=none; b=KZgEeD9UQ6HP15S5dGw3mNxh3/Y9Ev09LKWhlogl4C5dApnXlYkSiWtj6hiGkSWGHog/0YIkJjUPnd9nV8OKq/z4G700kVSxGt0KZ+ZY8H3OIRRpj5zQiw28x8uCsvdX9dl8H913vzyS4CHu6Wjlee/w4c4NP+20IVUuTlq7aJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782289267; c=relaxed/simple;
	bh=eqxV8ikdAhRlOKnQYkoOSbqnMWTaUUEpj4RuibxQVBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZGigMgxdFRtiPMCNfe5/lcqunXQwkjmbgCgVmLKRm2YZgHjbG1uaDbo1hZN6iTlDOMPvK9+OcIrqMOX0jFdD4XDFVi+Tztp4gBCg9K08zW3wy2UNiKNYX2L1o+P6x4Pu+xFwMhwNVyiC218S+yy90Y6jR+7iwizsG50PBDRzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ8omU2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJoMOwdL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ8omU2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJoMOwdL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tw3U1976529
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7d5+mRjUGGE6pOIVrQtFvgHG26fG/M2q6CZje+VlP6o=; b=XZ8omU2F1nlSabnj
	bCAxzmGa2Kve3Fm467JkVrfNp/88MxcSoX0rWSj7BSsY/syyC1Vc9dS3d+yE449+
	ptwUxqu2BeHaCA/lTxpZTT029SLLWvSGh+eEgfNa0abJZ/HMeQeFW1w679RIW7W1
	LPTjcbYH7KHnqAp1baiL/nQkOJnBBKrcSAJmuDVCfkUFUlqiSB6WuPw/6VlhNFv7
	S45rbxmxXOnI0IR9DC85IqtSHmHROm0bYOxoHe/fgTARg3sZNdAr61w0eWvPpS5S
	4Pe1dlKss+O84benyHEFoonmefcVM44Aqoqm1GjzaGzzKGS4j344kPp+cb6SA3cy
	dnzQsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aq97nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:20:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517bdeceb54so1555791cf.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782289256; x=1782894056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d5+mRjUGGE6pOIVrQtFvgHG26fG/M2q6CZje+VlP6o=;
        b=JJoMOwdLqc486JxoNXb0n95Sl1esMrtot2GJ8poLSWGmrWq5raJQ1DncABM59SXYBX
         GQFqqvoXFawm3wwAl40svu3TYPnDkkzX18wk4mF1raU7uMkJR5vvw4lhhHbhT+8+b2gf
         oect5mMh20p6Pmg+9kYL5hjoyFLloyVGwtMocWhr509a85Gwcee4zDa05WXVAuUlDVT+
         7B7fcTf5BUKO6+uvZpLZl2Nn5XnF7y1Wm+vUcR505UpQ5Y0riEXb+aXlvgVlcZuoS7ta
         7Dt52Vjk97lpuThCRt1c/KWksMQJISutMgs04dTzSTqkWql7wLRb7tfygZh7sbWSMLx5
         E4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782289256; x=1782894056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d5+mRjUGGE6pOIVrQtFvgHG26fG/M2q6CZje+VlP6o=;
        b=hkdKxqi7o4njpFI/t571NtUl3cGV5RqYoA52W0I17Kkh0ouvJ2C/P4JMu9zjrhKsol
         ymVywGGW1dMdwd58XRQetoArQDs3ikKS6UtE/4hlrggOxS6xPFohOYUSf7gbWDWCfD1L
         lmqdjAzs63YNBLU8vp8/sA8i8EqT0VHhKjCNnK+YBSdKbONcIGviQXc1E6rkaI7EmWqr
         jYhBawpbe3v81grV/RrlX1E73Sy14L5GL7OyBLorntI95XRX7pKiZT6Sjy7jeRkr7SbU
         V2z/Z/1G1B9QfOVPOn5DQGf+pKp46XhF4IKaUtdkgfLVj9D2XD3RDdxRcbV9je8essfa
         di6A==
X-Forwarded-Encrypted: i=1; AFNElJ/0663SS8M2YbpU87XR+gzvVnDzD5GdBqUG30VaM50CijF6xGpaB3XnbGQaDe4fzjF/Dqjob3Ru0RVt@vger.kernel.org
X-Gm-Message-State: AOJu0YximDitYMDkTsWa+4afBb8yBj4sYkFf+IVjOPiHvojnAxzK4v4l
	f43G/KvgiP7ctE9HxDIqGW5tNuvtnPMd8AkhXYJdt/OsyWSXluVke9wDw9q5bfo3+zV/dknUrWo
	mPmsM47biU6LykYtHXKGdqMEzqicuvsZB0uLNh6TukDPA8cgUXSX4Vmefob9PEUuD
X-Gm-Gg: AfdE7cmimlGkelI0aYujqDGDxTRFHwttzknLGqHMA9fvxoNNoIbS/UUUbtvV0ARzucC
	Cm4prmm9VnROfOa4F1us+xSgl37TA3BKsgWdXX0JJlyr5hUjlA5q+fSJ2V6cbXhiuCiDAeHAGlb
	ZXg01vIMyHLF1vwgvQYp9aZw1RbN/5smMeMqG7W7w22EpMdKLbqY/cHdGY9kSqgvGpUN+MTcIJF
	zFM9bYurYY+8Wk0pSyHNDVOufo/AcKs05sWCT00i/C2a0c3oORpaiQ2qPykxlNRlkTcrEnfgw3/
	HCF8euqN5Nl5oz4MzpYnGZfvZoScFS/fIKr0dgmkzFUhI0bW7uywz/Zl6J9AZn/8mfNRKFw+A5h
	657BeNOr03bTPtqCnsyz07pxU2iMmqsIqDvI=
X-Received: by 2002:a05:622a:85:b0:50d:ec32:b84f with SMTP id d75a77b69052e-519fede4b59mr184248051cf.3.1782289256602;
        Wed, 24 Jun 2026 01:20:56 -0700 (PDT)
X-Received: by 2002:a05:622a:85:b0:50d:ec32:b84f with SMTP id d75a77b69052e-519fede4b59mr184247811cf.3.1782289255987;
        Wed, 24 Jun 2026 01:20:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0ff4c9610bsm279261466b.42.2026.06.24.01.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:20:55 -0700 (PDT)
Message-ID: <41118d35-2b3a-4f49-8add-bf501bb93040@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 10:20:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2OCBTYWx0ZWRfX8PAVjUwkuDmF
 /TNbx3KMNvkcLERQxNQWuM0JzJe++UdpD8018nAgy+ci6t41VAACfqaG9Gnnm40sL6DDjsLXEAd
 aMNtWyQMpgjFnRipRfTv9VUcOM/ncfHR6TnhXCHr1iQsKcr5319VfQrDn6AhFEjQ2cKCqDfLGU1
 3I5f+yBbkCPV2Y2PamhgS5msbIdMqB/oTQ7Wb5zjdWfdQC95TD6xrkzOPJktC1+b2KM+IV5uqUR
 57vQuyHfu9iuM2mHgnx6Py5thn7bPW9KJDat2Owo+uZ9P65jTviZQGHl/XO2I6CeG3fy5NvvtCe
 gwxGNvm63A18ILvNgqzeFpfagGFLZnGeOtBd7yUmNfKYA198mqpe64exD65yAxBpr2Ys9+i7pIM
 rXPNqVk0eSJMfLtLrYj/bWD9zPmVPE5EpRC92V1UrNOqWXla0PVWu8AErWKXjnyTrND3gL3oUg0
 cnYg2S5Ow17I4kf/Swg==
X-Proofpoint-GUID: uswA3T4cKQc9uP_yMveHgqFaaYLRNcgg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2OCBTYWx0ZWRfXzo5UN+p0y34V
 VPlhg6soCe2uJQiNlgHMw+NMV7I8RFy/6Lok1QKnljqS3H0+DX9EeIU0OtaUbMZGpqFUEZg4S5o
 /h/UfhI/q0woV2dHsC4/WJDoF5b0Eyo=
X-Proofpoint-ORIG-GUID: uswA3T4cKQc9uP_yMveHgqFaaYLRNcgg
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3b9369 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-pUKfWG1Qq1qEUPvZNAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240068

On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
> front-end links to backend codecs.
> 
> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
> the QAIF block. Keep the node disabled at SoC level; board dts files enable
> and consume it in subsequent patches.
> 
> Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 46 ++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index bc4ad2bcbbec..e58c87fc8cb0 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2017,6 +2017,52 @@ dispcc: clock-controller@5f00000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		qaif_cpu: audio@a000000 {
> +			compatible = "qcom,shikra-qaif-cpu";
> +			reg = <0x0 0x0a000000 0x0 0x20000>;
> +
> +			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
> +				<&gcc GCC_LPASS_CORE_AXIM_CLK>,

Please align the <s and "s

Konrad
