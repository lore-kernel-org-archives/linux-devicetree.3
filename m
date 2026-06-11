Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD0031D74B
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180423; cv=none; b=kEFC7k0kumY0RcyO7Yoix6aMC/7Ihb/qWuZeREfWTrIHc5F4zFcJf1BnYdww7X1sqHyCPmnxV//YHmjTXu+Ze/RlafRP3NbeVunOQhJwKUgRA50xm5ZOth5GJmxJpKVuzl1XLF6Dqx7VnYuVzWaLDipwHSgCS4ln8BkS5PbFZVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180423; c=relaxed/simple;
	bh=LD5koep+nrii/XuykvR3Msykmd/YE6bxJye9b/iheAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cylv9ZPY+FwJCjVlDLgn6aCX6d3IdzXTv0wzlgmu4kM6Jy5NFKyGrmDQH49QSJw61NHnQmGObUT7F3f0FVo5iiWdJZYl/v8ynrL6xwJ/MZfZ2abY34T24ZBJToWU4J/YFTEroHsSwAUIKpgV3V/x/hwYX2Uh3nrDopaAkZtcKVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6OBpqGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUhNIafw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6OBpqGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUhNIafw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xAI6242613
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvUdbixww6CTGMe6OrNevndOOKL7ZNzp2IY7YAuE0kI=; b=A6OBpqGqmEZMzkZL
	aNeAZ7SbvyzaXDBfI0tUe5+HWCBd68U5xPpN71bLr8J1GQxpNmHQuEzHvdYBcms+
	O0ND70Ndjsba0YqlURI6SmLFLMVvVMNBL/7o1eWkHDqHIdJBJVFBKBAKk3MmPc59
	OEZuANvEsvSK2TRiC1Sd+Gu0CQua2XoGWWavBNe3AnXHFceCu1jDobQDSNPkOpYg
	NYxUJwxmqqngkK5jIelEsIwNcM+HODQveriYrLQ1yedKC464i7wtLwD27RBNKPDN
	c16zsSUeMNttXyZzBCZK05AMvDr35iXKNrPOHrgbMWhDwMw0wYdlL3JA1kRfl1oh
	6xLl6A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe703c9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:20:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8584e3fc96so4068016a12.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781180421; x=1781785221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvUdbixww6CTGMe6OrNevndOOKL7ZNzp2IY7YAuE0kI=;
        b=fUhNIafw/M4Bb6p5Pr2nh+J0f/GdaYGD/uIMh9lZUw73fsiMKJpPm3g3e5I/LxylJg
         G9kC12jLmCKoEJZaJuGWaDLSmdI4z7w7y0UpuegwJ4bw0YceUH/wY6FTUVJvSwG3UpqK
         8EA5SpXdTzlFBODPncV/RrOVhmEzcguo6jFgYTbRVKzrG9Mix4b9e/YqHLT1pQ2F0Zx4
         4zIvCpXgVC4/G+70k/4d7uIDmCI98+CgyYxMf2tKGg9H0cAC4F2wa2pw93PUAttsZ2VZ
         h2o4jmylWRmKYRDPUiBfEvAa/CNJWWEZXEi31fDD7caU0OSsiH80dXje2lSq1BpfRitk
         3wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180421; x=1781785221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvUdbixww6CTGMe6OrNevndOOKL7ZNzp2IY7YAuE0kI=;
        b=KPXENyRnzk/+RfzSw44gXWMzC1glvB0v1YOYosQ2SxKop/T8wEUIZyY74iXOFLbmTw
         8850/CCOMDFRjeCiRIljT8pOSWjHCz3nfejoRzcbp2ZhWabxZErUoIHgnmgaFJ/58F6J
         dRdUfAVo8OgJpmR/dB8zT8XRLoJonscJ/KroBL829pHo62q8+SkFVu/NFKB7Q6c+PmZQ
         hlMzxMKwQhy5Ngz43eF7HxlnlfGim4/pU574F4Z2kjGoQzWr+n1tpeFvOpDz5wJNokg3
         JGI3vplRCBMWQ093uYyDnIAgihnY32UYmKsHmEw5nt6rmLFq/J8c3tkHnX7Vb2yQbIST
         JCLg==
X-Forwarded-Encrypted: i=1; AFNElJ/5iV1tS8xY9OITLUC4GN97oapBfjpoUhyuVNcQzx5UHnGk6VAOYlby6tpEFLjk1EDnyfyqhR+c8uUJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjkF97FOzXjuxPOBF9TvC+9YBXLNWoAOS/ifj58J7kKrPkwM+
	ARHrW9vGy9iAeje2MswNUHp3bi6m12IgLuUhnQJDHpWBfR/ySb0QEnlHW1C4oFexUEgloWsjLKc
	k2R4SZAw1SD6dzr5VD3cPweBe3goAiD+x/A6L0R79b6D8ox+rEyGuroLf7UFysRYe
X-Gm-Gg: Acq92OFqoe9AgzBWZ51zBPOAo4cfr8KgSpdL1ib/Rt3VagvQuxdgNQSa0WgStZpbIlU
	TD8nziu6M7b795bYqd+0ofABsZqx4S7WphdQgCZrRO+FTnP9DM4p08N4vx3kAxTTil+eFECOMJd
	XBy7wAQmAXvDE6Hs+huZHy5AVee7VIImYyQDtVYhRiumulb+qqAiYc9Wh2GeW3nFN9OoIZfOaT0
	Nw8+VCoFHFRDBSLdAfVFV9TVPYHLVwNbwn8GEhMGlP/95vZOvLVp7bb+JGW9E+S+qhWX3m9lvb3
	NEw2Fjpeu89VaY1C7SGlMn77wiypzpE1qGDxqLro3T/7eZecUfTVKMnWvc5xBzfpWCIkSnVreC2
	FiZWPfZK8qryK5tFI8D31pblRLHygxs6/VJYbkHuJezMjKWvTDAnIq+o5pfv/qbg=
X-Received: by 2002:a05:6a20:7fa1:b0:3b3:fce3:a7f8 with SMTP id adf61e73a8af0-3b5e31f33efmr3104322637.15.1781180420567;
        Thu, 11 Jun 2026 05:20:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa1:b0:3b3:fce3:a7f8 with SMTP id adf61e73a8af0-3b5e31f33efmr3104280637.15.1781180420116;
        Thu, 11 Jun 2026 05:20:20 -0700 (PDT)
Received: from [10.92.167.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865880cc87sm1827061a12.23.2026.06.11.05.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:20:19 -0700 (PDT)
Message-ID: <7c94758c-1100-43d9-a0a4-2cb7df947cc9@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 17:50:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNCBTYWx0ZWRfX8sVEqMhIIZHu
 Mvp3vYzNqeplEeAuLbTQUnFNOshxIfLZ1MG+mfIbz/Ro+1bhamMpP+nqi1N/Wh2WvfiUHpwKWBH
 9jNEI27LemhdIadT95/zcz2Kcx3+S1OhyBK58maLt0npppT8hY3qheeq/WVn0uHEq6OMwoRzwis
 t8LFQ8RI+uxtznadrzSXnVwFd2BdDhztPDKAR1ivuyAB2lxEO1uQyKFpyOfOW+vI6iCMJ9pjAJh
 uPfru31YiEm1LYD6nM8ff75Mfa6pi9YX9OVoXMzVu3VBx2eh/bcWqmkf4wR7Mr4bpD6TPAeAp/k
 IuOKvCU05IwyJhdH8wWMz3MpT4KjtCpc3caMhQU0MVC/sKu0bIqWHv8vqiNvUwNKTVvcgZIrLN0
 AyueN02zJAZrKQq22yvFXtO9AaHnoMpli9DMi/lSfyyFuxwLnT3m9uQ20uDbwK4XmyBxgsta/+Z
 No+Hpwlp78x93li3dXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNCBTYWx0ZWRfX0ZEsJNXtLB40
 Bdon92WILZGq71eTF4yab3EiEFxCicMeZSQAkbtRrbr45zR9IAJwxVSDNAtGqiUXn8YNkCHH+Ay
 sQYQli2i5mk+9oYm+aD8GBQND4UZ2p0=
X-Proofpoint-GUID: 8jnZsSyJXgIeij0oSwallDqbRMN3qItM
X-Proofpoint-ORIG-GUID: 8jnZsSyJXgIeij0oSwallDqbRMN3qItM
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2aa805 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QRdWpJMrku1fmPn5X40A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110124

On 09-06-2026 03:17, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			operating-points-v2 = <&ice_opp_table>;
> +
> +			ice_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-75000000 {
> +					opp-hz = /bits/ 64 <75000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-201600000 {
> +					opp-hz = /bits/ 64 <201600000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-403200000 {
> +					opp-hz = /bits/ 64 <403200000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +			};
>  		};
>  
>  		crypto: crypto@1dfa000 {
> @@ -4878,6 +4899,22 @@ sdhc_ice: crypto@87c8000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&rpmhpd RPMHPD_CX>;
> +
> +			operating-points-v2 = <&ice_mmc_opp_table>;

s/ice_mmc_opp_table/sdhc_ice_opp_table?

-- 
Regards
Kuldeep

