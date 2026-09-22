Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576BC53D9C4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096195; cv=none; b=f+PlCQ6Ju4FLVoIJyj1sG4fNnKGPjPZ4y63fgnifgrxcllFcyF7KHn52oRer8Z2XUbiLBRuIfOZApJQGq48xQkPFE5Q1gLyy7D6+2RGpBHaAEteV9hPpY/U+6KGQAH18FlwB6sYhaL8JfqxVh6DFsI36jU/1s3Ac77vUhzIuPx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096195; c=relaxed/simple;
	bh=Ng/5uaFZi9LYWsGb2fCTbvjBI8go5dl00sRS5YXJoso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIWj698kREXwoXFBzIkHlk/pUG+I+PImm0QeZpinXaDetYJEHrtOjK0TqcNeg/5/OuQZ2AIwSXa86wdGeueTKn5k0eL6PTjlGsSIO0UZebXpJRtFUWD5FKB3Qbs4egeCkC95+9Hv5+ffVh1cbfnGqIH6mo2/tsw6J+qWjPTWRug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZA12WAif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVWiJ9Gz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZA12WAif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVWiJ9Gz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjBs14109945
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8wROlQAz+HLKs1Kk2OvPyUzCFdF6E7hi8VD6cVYK6FQ=; b=ZA12WAifBoEcqaU9
	TuoGvjLHsrp5ZGwabJqI/RF8d+pMnmaNZoIivif6kAxLppo/wjKEapCtKUt21u1q
	/507q6WEv9Wa7LwwVnvMZ37ikoBtA+PPH8TXQqFX+xI0zHyA2YWC6wniDuP8TvIX
	lIVVjGU2C6XHE7XFk6Bd+J1J9amTdaH3zL+NTh9uU+H5hj2RfjRuXe36RTsHa8JT
	dNUuO2cH3DDiT6ocK4ErhIPoSuNioA4ZZVuFsDcRcuLyUBKx4t5vth1ebDdFBfxO
	l9l3dw4Tv7iKOfj99UFQecpjxO8j7gcXj7dketjKeGNJpaw8w/nIgVS+ncqVjF6u
	fcMp7g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt9mxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:56:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a6634ef51bso1815137.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790096192; x=1790700992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wROlQAz+HLKs1Kk2OvPyUzCFdF6E7hi8VD6cVYK6FQ=;
        b=MVWiJ9GzzVIjoCORWSEU+TyC43GBPsV1olj003OzDwtvPsR0Lyum6X/ohvmz69rSDg
         SpsIt8nQl7mBno+JZljgDL+uV3tBRGPsptaD8dpBXaF8yp7DLzVhm1MWEotC01tq9lJH
         r70vJmk1ewyIAPHUeJuSx67z15X4nJdbMGzGF9cWPjHJhOyM4Z5IlC2JaNBV3f7gS0bB
         XzS6cKVRtci/1CE1WnInIzxZMHIP50Nar2fFEKh7qFZiuKV0acXcim0usw7hR/4VAhHq
         dGIYGxJCMQC266o/Qkt+tZ5Gi5HlOiuDQ3hNi5xJZUQtZ0AoNJpBwKQmzax5UN+8kp/v
         kKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096192; x=1790700992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wROlQAz+HLKs1Kk2OvPyUzCFdF6E7hi8VD6cVYK6FQ=;
        b=LhyMhh/bCjJFdqkdLoVsKFHGfoJmviCioapwMOthMXHnTcRX9PLgrA/VVKJlIrBoKZ
         xjWECXiOzWoDUyON0JsjE65x8wWMVPKFIVy+jK5kj0rdxAYs1fXP51Q86tVS5BanQ9cu
         KPfCF3JEpXWOAQJX2FB4ynkgEYRzPO7hmHWmeCqIS0k4/Zo6lUo3dMG3JVtwnT3Hu55t
         2VHpSdnrubn9nv3YU7+CU4qDvKIpWV8fQ8QhUCrRx+qheea2MJc0gairFxfY3HxAbS0J
         QR/SJ9frG3R3Cy8WTXafWpCfonMWzKDRec9l0HQZqBuuGaQbiyXNzsHtXcwKp3euvv+u
         PcRA==
X-Forwarded-Encrypted: i=1; AKwUvBwfuEnfv3b4iBOc4zWVDqGVIqYdJPDRQKNe/grpHAaQZEj/GzaoLbYlYNoy2RhjZdo97zxwWpm5HJLu@vger.kernel.org
X-Gm-Message-State: AFuF++myPoGsp/Cf+LBrObN3YV9QAxzJz7peZLF70CO/fcIO8TocH+gH
	PfqONsGA2uGAAgKjY/O7D9ivz/BVI66ucCDl7zxztGKCsruIJ8M8OQVXGY1tqXPJ7ovI53oPtwi
	chYi6krhlcF+9oMhxt9jb3LNElIm8uyE7Yjos68gnFoRYGGQuexP4icP8S6O9Gl3e
X-Gm-Gg: AYBFou1y0xWRCWuZeyu+gU4nM5ZGCzteF4X+L1jYuPfVVTcHQwbL7qRGMPEEUE9GfwO
	ixs5Lk67DSnKVwW5AseogIdXIEuNAfx5R53OivEf0o+AsnU9nE6g1Tw6/XCEQ0s/DRfLqXyiNtd
	u1/BCxS9Qb/QsZEyzVWnuLCObnwrurpB8Kssiqh77e9cNJkyZl0u6mS7dX+LFUB6eaXEnq0Vjj+
	i5KlO2ljVDOgiWlDinrPYUoEjIUPShLhL3sq6gqmalE0GexuwGQMv3zDoeGqf1LNEPny7u2I671
	bJhTNnGvlRb4oA2/UHxX+wtAdLmrxBHysN+VdWaV2bKz7ch1dfdKUr3kCvK15LdbvLUJnicHGeF
	UUqmCI8GTHXJdTg1EdCL4Rw==
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6830223137.2.1790096191453;
        Tue, 22 Sep 2026 09:56:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6830165137.2.1790096190901;
        Tue, 22 Sep 2026 09:56:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c6241a3sm115662466b.52.2026.09.22.09.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:56:30 -0700 (PDT)
Message-ID: <22b6ac66-a29d-4e9f-a02e-f0d38e0aaee9@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:56:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: shikra-cqm-evk: Enable sound
 card support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-7-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-7-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZECCQvjxakXp3knUkvXDC5oNaMdfVEfX
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2b340 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RMMXu7680as21xinOGwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfX7/ju7+JrBWXl
 dG6XT5atpNIDW1LSsAqTeyDfvcKbnhdfvhgs7vC4wbGLcTLw8M1LTDiGy4/NOWyGO80xfLN+v+R
 FZhJSb0RAMGGRCO81fvXH60asPU7tMrP9ikjAwgcUOlNN9TK80nC72N2tDxOL+R6cDOA2qLISKB
 0ho5szhjNdud/3QmofEmAgRae/uIlH9tdPFeN7/ecFSbqr44ankytRO50Mz/nqemIt+NEcBDpQb
 NpbQ1tDapMnWVUiVdVP8FkBMoEovUrv9re2ShZiPg8MlyvN30o7DvnB1OqBrkmxlSj6WT79988V
 sobLu0PUi4D6m/jF47nkd+RzQG0yhS7vZPE5yTLMb4c03jLlOhFqtfTk1Oh9OmI0zwUhN4SDGuN
 gN2jlo/daowYbwzVisExdht+3Eq9A1nm9Gu6h/zoD3VCCLi1viR5x0G+F+ol1JUCGcT6mgakVlt
 7sPXzvb0mVxZxZpX9Tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfX2guBhmvyWkZD
 B//QbMHumcu/CEqpxsMGf5sGbTXT+LsF91u1CmzdsOpTKubn97ad0o/nzB7odQlAYzwez889fwU
 Sa9nPj7+8NT0/BxwzsTYLGh99Ku+cbw=
X-Proofpoint-GUID: ZECCQvjxakXp3knUkvXDC5oNaMdfVEfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220247

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Enable the sound card on the shikra-cqm-evk platform, including
> the PM4125 (Rouleur) headset codec, WSA885x external speaker path,
> and QAIF backend links.
> 
> Also enable the required LPASS macro and SoundWire nodes, along with
> the necessary pinctrl configurations for DMIC and I2S interfaces.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]
> +&gpr {
> +	status = "disabled";
> +};

Why?

> +
> +&i2c3 {
> +	status = "okay";
> +
> +	wsa8855: speaker@c {
> +		compatible = "qcom,wsa8855";
> +		reg = <0x0c>;
> +
> +		pinctrl-0 = <&wsa8855_spkr_sd_n>;
> +		pinctrl-names = "default";
> +
> +		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-1p8-supply = <&pm4125_l15>;
> +		vdd-io-supply = <&pm4125_l15>;
> +		qcom,battery-config = "1s";

[...]

> +&vamacro {
> +	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&tx_swr_active>;
> +	pinctrl-names = "default";
> +
> +	qcom,dmic-sample-rate = <4800000>;
> +	status = "okay";
> +};

nit: please keep a \n before 'status' consistently

Konrad
