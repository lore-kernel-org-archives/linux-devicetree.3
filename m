Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402CC3D8123
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085493; cv=none; b=PbCWnJ8wHd23d9qRZKtu/YtCsnwy2JO9EvecQ9Tqnz+TmW0C0xUYLcC4U7ugtc13PMCWf5l4bsJuM19n/yAhP+2XunZaCBQmt9igra8yKo/BSdtc/yeHNwXqVRKxj2Mt1oBXJNO5Prd2AecnYAqjt/FKBqhYwdth8Rj9GvyZyNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085493; c=relaxed/simple;
	bh=vAT1lNSIa/PrMnhwIJYzBDd3jyA6FVn2AwWFXgDKoMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFPO9k/vL94ntBUlSYescLqAiTi+jlx4NWlINmZRaYY5CtgdDs6MC6oAIsut84s+XY0PUDAwCuvw8q3ChB4r622bxvdXZGWd5wijRCLqXgPjSg83rUvGWek6EzirSaq7pqcndJBLpf3B+PpfUjspQ1MfHG24Atw0sQvtzgrkFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AN60XDbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaAOy+3T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AN60XDbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TaAOy+3T"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BqhgJ4091029
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 13:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ffuv1ybSu7eD+tb1QtC3S+4KTVX6BTRlHx0MrDnNEcs=; b=AN60XDbpjhkXSQzi
	ujOiH8Ua/axnEYIpjmylkBhFMJs10MVOJgfpAsvW26HxIm0q6exCqcCbeTQfJjuJ
	KCY5q/6Ws7IUFevmP6oM9a/1widCprfM16S1Dqk0Y2H+ffhz9EcbbsUG49oXVjTI
	LuqxFol3o5PHGoCIT/IhLFXwMr96Xyv/8s/DKfC6iWurEMri9dbmUMKLGNMU5krp
	y2HHYTJqAlKK+E4CT/Xs+ULZIsJTevsDFGo7EFrzeh5X3/wzOleysBgUSej0AJuN
	sMbXT0rckSFjD2u9h8UFrrokXch72TLy24//2PlAPWwgFhtPrdpAP+dyiOeuJvte
	fzDvyg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj0b7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:31:31 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e5fb37ac4bso56847a34.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783085491; x=1783690291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ffuv1ybSu7eD+tb1QtC3S+4KTVX6BTRlHx0MrDnNEcs=;
        b=TaAOy+3Tjj9z4J+VfKJrCHqNoy3uBf3BNV3S0ITUKux4vILg2uMXO5FPdkdrQK6+Q2
         PRp3p3cbTmx7YTS6bdJfwYC1Z5z9kou6UuNiOSIh4+XAZPrjcrgiKZhFV/IHGVyqqVJD
         aCX4GpH3gy3aEHH7mxyMELFrRbmrL7IN+lCpcwNth7iuh2mCNoPvjO113cHdiWY2f6u6
         FVV9mabGRvxNgQYUkty56pcvFtFUZOvKMqy44Htsfzw9MvGIYNCOXdiIpNGU74v+Wjpm
         yYnwwuPm35/5mANdd+fb27F+lUmafT+oIAH87V6gIQwURDYxeDRc3XVDcro9KjNB76V2
         3W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085491; x=1783690291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ffuv1ybSu7eD+tb1QtC3S+4KTVX6BTRlHx0MrDnNEcs=;
        b=JqwoJYxMyVYgSzOaHuvWOTKmi+QQqzg+JkioyGi9lF53VvbkRCCsvega7WPoQ72PCw
         KR/Kk0hlFXqc33uGGXqQloLzEbfnGQV/1MVwZEaJfw9IJhiDVEKb8cJJY+op1a7Y1ckE
         OYUZk4nGxRMLFxvvLKMHyDV5x512nOjlunPpGc9EklYEotpC3PeJAVfhnZ3RPhtVpyU3
         D1mo0CamP4e7iT9prWzLdURbYDChWKOcrtYUeZ1edSX140Xf8jyaclEEhP89Zz0H53oL
         5qdDEUDSExQcmaldE3DHvjGiBcislg/hQqFK3gVK3C1zm8x+28zKlAhTqJVcrPe0ZyTX
         ulUA==
X-Forwarded-Encrypted: i=1; AFNElJ98DvXyPEeMoM6X9d4JF34vDnj3T86eKXvmDC0mwxWIX9hKpKHzqw3KuiSaBX3MrUfFJE4jS8OHwJVM@vger.kernel.org
X-Gm-Message-State: AOJu0YzCTzTdtQy5RGW6GnIMMAZQ8MARtbnvUPu4yjzgLlcP+0hS0gtv
	kldeoB6x9C1QYdkv1DtLz+N7g4lz7EBRA+/Lx4U+W2lyiferTfm+tUexDKOOIQ0SHa/2a/jHsUH
	JXUdz4cILN5dhS7IlwHDqjHSubUent/7fohy1AhKoK+BElQjFJq/yIa09ZgaheXC2
X-Gm-Gg: AfdE7cl4OL6XOYYjLF5FCYbb7ZC6ttfqAqeDAUPBKgHt9wkvK7FkcNpI2273fJFHOTW
	fLNVe6R6+NsscHUQ/SV8HTcDFI6yTDMQv4ZAB6DhZpL2HC65QJf4CRGR0l51Sv1DxRoWElTXZiv
	kMMSbFzAInXzkFps5SQ7nC2fsKBXBVA8z6k1XAbBQUWExikiEp7hFlTaOIOyj/GyWCd6aSFmaA7
	LMI5AFMCqfScSBsSPQBBU8wCtj2u3LGZz1zUVFca+a140ezb5R42jHMc7cvs+h8Tam+vHaKAD23
	PwGLHwcLYx0JiXucy5yuzFYvRmmSdKsmQBBQea2YzqKeYQyzlI6ewTowEZMK1e9R59HufkWuU0G
	04dWZ2F0H7ODw6gpdqs3Bw8HvtiIwUhPMLec=
X-Received: by 2002:a05:6830:2696:b0:7e9:d089:d7bf with SMTP id 46e09a7af769-7eb4cc1678dmr4643685a34.4.1783085490520;
        Fri, 03 Jul 2026 06:31:30 -0700 (PDT)
X-Received: by 2002:a05:6830:2696:b0:7e9:d089:d7bf with SMTP id 46e09a7af769-7eb4cc1678dmr4643659a34.4.1783085490043;
        Fri, 03 Jul 2026 06:31:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c134sm277001666b.36.2026.07.03.06.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 06:31:29 -0700 (PDT)
Message-ID: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:31:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzMiBTYWx0ZWRfX0Y+ujO/EQIqd
 hH/rc6/Xme3/r96etRCI/gs2Tf9f1focykSypPepMhlF+JLDrVI1+zgtZGce4WVzuVPF+8LQveS
 mnbgqHy1tGsDcN+RnGvQK4aQ5zclETc=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a47b9b3 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=h45PUBSeg-F0hSU9p9MA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: JpbJtkwf5ODj2gWrHeTde8VeMAbx5Pqy
X-Proofpoint-GUID: JpbJtkwf5ODj2gWrHeTde8VeMAbx5Pqy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzMiBTYWx0ZWRfX9EAkjXNA31UG
 nH9s7bUgcKKixB312h32MPYPszB2BRicD+LUgFyyxlRCNYL6aYraeqJ+uxGledQioYAuNiAqqUJ
 frP5PRgGPl2qQhgKqibfmTrNlqkCFKzEZSaj4UZu42YbfwtfPci8hU+K9a3Iz/ATFCLPjks0T5h
 yPZmx0H7JWHUw7WhOx8ELDDmr+DWypaxUG2JUB+M8dDsX04qnwXopyAhhk1D7m012qwfKFl8JTu
 Ujnj2Bu10AkkTdrFGbpmqEs5KaoFYU5ozUGnq6ySM295pHjv/D4My9Mt7gfCh0rMmWY3ojo/pGJ
 TyPsefWwiQCBvy3ripljcquX+0TjiU0EhqH9lV5v0NsEhzQAN8KyAQFTsYmpml3T28AzWYkIbAP
 xY4wTl6ZGXkgpYw7bEIS8uOl7a2Ol5jKBQ4CpH0YsiLBdQFLispYSmMGqtl3h4gsln6h+ZgxTfV
 M23dK0v84kSES9vAxig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030132

On 7/3/26 9:59 AM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with
> support for:

[...]

hello, mainly just style nits

> +		rmtfs_mem: memory@f4f01000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xf4f01000 0 0x200000>;

0 -> 0x0 (also in all similar cases)

[...]


> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_vol_up_default>, <&hall_sensor_default>;

property-n
property-names

[...]

> +&apps_rsc {
> +	pm6150-rpmh-regulators {
> +		compatible = "qcom,pm6150-rpmh-regulators";
> +		qcom,pmic-id = "a";

have vou verified your reg settings? incorrect ones may lead to
hw damage

[...]


> +&pm6150_pon {
> +	/* LinuxLoader fastboot implementation has most of it's commands removed
> +	 * by Samsung, making it useless. So reboot to Odin download mode instead.
> +	 */

/*
 * foo
 */


> +	mode-bootloader = <0x15>;
> +};
> +
> +&pm6150_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

let's keep an \n before 'status'

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <59 4>;

Do we know what they're connected to? If so, please add a comment, like
in glymur-crd.dtsi

[...]

> +&usb_1 {
> +	qcom,select-utmi-as-pipe-clk;
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";

Does super-speed not work (if you also remove the qcom,select... above)?

Konrad
