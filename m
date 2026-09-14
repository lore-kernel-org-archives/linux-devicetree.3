Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C1140F758
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375235; cv=none; b=iOvlKD0NyJbeDvBGKCLx6V009T3KPcyGA16NifM8MrizLciVYWuAjL1nkZNSgk6IqwemyUyPMd/GpwQuIZePDfouwHX/5w7jdM6cgWOq8AmrExAxxuBKFUz3lqvJiKRssqN4AkEdmRJVT4/jjsKg0grJUmD0wEAKKZA/8g3nSbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375235; c=relaxed/simple;
	bh=eDhH6FH5oGmxehyCqvjpvgqGLqBfZ3YAWWKST44eo/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6kr6vZET8Zs7vb/f/FK6sXONgcreN3nkTPpMsJW9xL24z+7STV3NR2QoWx4Kwlw0IX3dJIq8zVeeXeY0amXcesYrb0UjIrPHporLjpfK8GWiD5/oPDeSn9Gm6JhP6G465EEGjCdIrvgmz+5QGjBi/tHILSxXq4z8NpjM3lX2PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBlVdxtK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEao6r+d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBlVdxtK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEao6r+d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4n93369833
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amin/Mdn8cRh5whVLqS3TSf1DFvxn1XCy/uV4GsQz8s=; b=aBlVdxtKQY/PTF4R
	QLfH8yeHIKLREEPaF8JV1CaECu/8zgawg0m3q01c+2Go65U+7RJmjk2qG7eTlPdx
	EEKVUYAmS2E9Alt1hJOTFgT4VnZwq+fbRF9mCgHkQeWZW7G9SdZBN2/vsHRGmEka
	wX3jkDq5cs3nf+iU/rKkBex+IfQNSWsz80ac2kUaiJFMH+Fon0rgAS6oONcNQlfD
	EZDxD0WlTO/ObOYvABCNmoTWv65gz0n88O0OGAU6swUhxNV8lcwdTwMV1seSODA0
	HKrV3K0d9RQ3YSZsI7KCboz6A8Hh4MqZKLdquCqdKmj1ldyH1UBoT8J+GeN6TjSl
	30EBTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5sfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:40:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a18b457bcso39557585a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375227; x=1789980027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amin/Mdn8cRh5whVLqS3TSf1DFvxn1XCy/uV4GsQz8s=;
        b=iEao6r+d30atjYnH8cPfH0stf9KIpvvQKD04llVLm9mNzOcKcQEwt9nKgTNEESmtSm
         tLqsRtH4clJawO6KxTUDS6rjR9KiGRKamWc0LXtM64h/3SO44hXAJiVmPItP1X7qV0SH
         hgrQJrnwVVb7SdQl/519NB6S8YWVPTKT2/u6bU+9Gm2ciLLZYN09eSJhE40qdqMtLDWh
         waI971wsFf/SGNBq4LEHbpHbv5XyAxMBRlx3mEYTbpmTB1uTH7Rw5N0aThmfnPw97L5h
         ZsY3mgt0LonMpBpP6z4yPgsMBKNRcJcq7yWMMwTAsG9FPerPGrqghMz29Xa1wRGjdkfb
         wx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375227; x=1789980027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amin/Mdn8cRh5whVLqS3TSf1DFvxn1XCy/uV4GsQz8s=;
        b=I0k6ASIO7ywj3/+0wLb4aPEvlBGnsaVymWh7YoZ03uqc2iD0oNqJmAclONlwJfzLdi
         BDp+CopxAONi6wtwlaOP1DPjziduAbZkJmVEyyk7E1z5CwGbacZprAggVXioXMKRY65J
         LQzqUFGLoCwaETuV2ui0bG7+iLIHCMdOpfC/3orEtmNSiZ4w5lUIokGGCjSCkP8lil8P
         vUFnPyFcKOq0g9PgJPFxMPePb1oztkr2VcAqyuWVSux+NxvIeYuODbW8Taff/q8TluHQ
         l1UVGwy/b4CHBYI3m0An904xmag8EvT9w58zUUaFFLOllYTZuXexJi19LRcO+QRpqCPE
         2uyw==
X-Forwarded-Encrypted: i=1; AKwUvBzSCboJ274TdBqgkKvMaMn7qVAUkx8PFMJWU1rkZUdU3QWTs8uWGITGO4XLIW6os64cCS5f+Pg3rFOP@vger.kernel.org
X-Gm-Message-State: AFuF++mzviqAn7rtsswA2nhp5H5y557GPlokc4nbKh4lRpeHvy0GNmlc
	vcExlWcGWndVyiJWoqAxS4DLxm+bPFl/UVTtvSlxW9ojtp38Ikr4uEMpDcU/od5jI9GFDt47Xbp
	TJo71snyK/Zt7DF2+Rhb2F59I7Xo7fU/89DoPpicYNtR6YYM84Yk9IojDOWN5pN9i
X-Gm-Gg: AYBFou2gtVJ3USUtTOa/Ut1jkbbqBRH/IwwLlxnql0+M4sFuCvxxLR3jGKESkAmbxpr
	fVkFXxZSA60r0YJ7ua7aVE1FaVKuuM/1B9zEXoRxabYtie+ax1ozEsnXD88/XNZKednsAj/rhCr
	+Lw4uGWgPcG4WbqsYV72T+8U/0dK/8bWlW5NdtttG8U3Ku77CA9cT4ACVYC/imahiYpfWXEDQhw
	H3+HgEibcqDDwnPh2NRTLI5WgUkGqW35/nVC9fKJkvGxGvQ7m2jWJdnRyLgwPryUT2/BOBpisaL
	0QRIBzgRZYbBOscl/eQlmFAFwv8vYgVTAj1UQIIyeavjjZ7llo0e6TfXXpDsaHj8zpV9JqZTQei
	aOq7wChfKY3Ya+2R/TrcYlA==
X-Received: by 2002:a05:620a:ac09:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93a2bc868d2mr134061885a.1.1789375226915;
        Mon, 14 Sep 2026 01:40:26 -0700 (PDT)
X-Received: by 2002:a05:620a:ac09:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93a2bc868d2mr134059785a.1.1789375226498;
        Mon, 14 Sep 2026 01:40:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296613ae93sm384411866b.58.2026.09.14.01.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:40:25 -0700 (PDT)
Message-ID: <0f46fed5-57d5-4b54-9740-c7415a03fb78@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:40:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8917-xiaomi-wingtech: enable flash
 LED
To: Martin <hemisputnik@proton.me>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konradybcio@kernel.org" <konradybcio@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260912134056.3347741-1-hemisputnik@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912134056.3347741-1-hemisputnik@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7b2fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=4HIykC1xQpmIHoiGnS4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX2tTYBaQ7j/17
 dhKVA0xRbOctNqlfxji0uOamw84/daqbLbrCfk3uCKqkZd5gvoKRmPBHTZs8cqHJs380Y67J7Tl
 tUy+03uZLtGqt1a9VOyrHDNerHlU5wkrKKRmgKdfGgrL71ImuFttQYmzESb2yFFNzrrOzmhkvj6
 j3TYFZLQNGV4ngR+0p8FVC5bs1baUa5kpnBTpLkFc5BFTnVainCVVxNT4eD2N9SMDMBaxdvS/mV
 zE6Y5j8vlIWZPsp8gtKczusZTrBFJfwbse3W4H3oIKvVIXnOD1DFozOu7+2XS0C+YnLi8vBU85J
 MilTtMP5IqgW91HI5cdDVHnk4faB9L3Rg8ERUidUA7UskOHM97tOyJZuIukPxbfQneicqnjwfbn
 01QzRLgjRO4lgaMIKABYtVYUM0UF2KGIUxWU5CslTIgjbP9ajlfVa/9/uYzEBQd7AS7iMBB3Cao
 ilTH5hjEOneQxzOuFRA==
X-Proofpoint-ORIG-GUID: 7RlCfVIff-QuyTub83BeE-C4bhiRxXzL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX0uG2Ydy7UPF3
 qhBLb5lzJJkrmc787fknY5UoKvXoGcJm3cmTU0TozcdGJReJeGKpzPupN2colydgSfX5+Ea9Ou1
 PaqtSqZD3boJ4jCN5PxzQtJHZQHYLU8=
X-Proofpoint-GUID: 7RlCfVIff-QuyTub83BeE-C4bhiRxXzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140121

On 9/12/26 3:41 PM, Martin wrote:
> From: hemisputnik <hemisputnik@proton.me>
> 
> Add SGM3780 flash LED controller to msm8917-xiaomi-wingtech device tree.

[...]

> +	flash-led-controller {

Please sort this entry alphabetically vs other nodes in the same scope

> +		compatible = "sgmicro,sgm3780", "sgmicro,sgm3140";
> +		enable-gpios = <&tlmm 93 GPIO_ACTIVE_HIGH>;
> +		flash-gpios = <&tlmm 90 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&flash_led_default>;
> +		pinctrl-names = "default";
> +
> +		led {
> +			function = LED_FUNCTION_FLASH;
> +			color = <LED_COLOR_ID_WHITE>;
> +		};
> +	};
> +
>  	chosen {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -306,6 +321,14 @@ tsp_int_rst_default: tsp-int-rst-default-state {
>  		drive-strength = <8>;
>  		bias-pull-up;
>  	};
> +
> +	flash_led_default: flash-led-default-state {
> +		pins = "gpio90", "gpio93";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This essentially says "by default, if the OS doesn't do anything
with these pins via drivers, I want the flash to shine", which I
believe is rather undesirable.. let's drop the `output-high` line

Konrad
