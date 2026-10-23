Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758742;
	b=vouxgC85i2RPs924DaCWIuZJgYa6+saD2V7cWcNYSNFbYFIG9lejHa4a4puLmX9AXvJf
	 6oF8MgfbWaKmAuaz/nGdYwdClNyFlgMhIhxO+5BFiXv+OPBZV+Cq9ExxIvNBURbVSwFeh
	 PWsRZC92CsFm8y7vuYQKMLsW5byMm2d1aM3EwRSL/n9+eQqhfCnHpkZngN+HmrPg0tJVd
	 MR3JBpmbYTC9e2JfSnaPgu2GE+hUojJluTszxZXmIS2C2W7lJwSx8SDjapNoZWGGPiR7E
	 fYdFMQO6oo9APnjtEu8rDWSkV87HPDudywTgsIwQ9ymbhTeF94TRgW3NPmQ9gDYm/hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=;
	b=GyMf+jy4UB+qcmNo11VUvABsbAgtCh6HFyVt47qIonXeXt1LFMQx0c0k6wfwXUBFDthD
	 Yx/83JdGDCW0P1OtIQxadWvDxkKcSspVFjr6dqAmFOM2EIkR20dkuwOSP8ClcFdyXddZr
	 wss8TdF3/RNiTMqPTjNT+tn5j5bYlCFNOvT3AE/9GUlctfUmADxHV08tWQ9QkVF+Fa60W
	 IF1wFWJ/aLWf8N2MgrWmLXO/UcAROnoo/OvkgCRn94PTvhS5swkFo/3kxcI5GVDBLob6t
	 lb1+/c1a08fJkwE3+L71jXWUQIFknyW4KttiHJ9//aX47vO9vMMfn8xwqNaF0wCrexA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbJDyKUM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxIPaKvA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B8A606A324
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B8A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbJDyKUM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxIPaKvA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAR373550447
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=; b=mbJDyKUMbsKBTfpd
	VF8oUL6B3cbqcpONko5rLSZwiSypf+0PUBrTO4nFXhk33eYHiLHJf91mAN5NGP9/
	GaK6wo6T2ZYGK2XZR3r48ri9/cIHnqCcCspymTQJ5S8LEzxxkyNCm/1kcyRLO4tk
	2MKFiABwUAcj37rK5cP3+Z3TFPNw0SVlkJE7IQusX3/AhjlfZkOf5GfRz8lLNF9P
	8MjQPBINN0TchVngglUI4Yew4p10ig5GU1ysk/TuPqvF/JvIB/4vRh4syoDGiqis
	i/ux/RWC6TTU0N9FDlSxbRiVUnrvs2dlBw34F/DA3pO2zyRDkCULRUxuIj49pv9q
	f3iRMg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbmxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:32:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988c723394dso17644241.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792758740; x=1793363540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=;
        b=UxIPaKvAEPb/sMLdf8Tq6WKEQIdqsrsNT0os5hPL4o9/aFNMl7FtuAlRey7fuenRsl
         +zaAN3Z6se16fIuAtkjm0n0noNXLsgKfC0mLTXyt+FH9Ylf+ysqGteh7jl4G08DdE7EP
         2v3GdwCSsHWorfysTDscin6EcG4Rj4rJKDleYQxgjNo2gEC+VEeJCGg5Ouahq8JexvkW
         dETKCHXL2f7pyAQ1gUqxVGUbaj+07EOWU+nHtcL35owaptkvifYX/mpNYwH3EUsc22gP
         e/6wd5VfSFiNURDK8RnWKLBTzQMYcg9356eB9vUhLDBGpyQiQ8WZElGGBGYr/Rsw9zON
         0p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758740; x=1793363540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=;
        b=MnIGnzYaqQN4VVyj9UycW2lSikh8tQzFNwiIp1Ne8mXfBrNTSodLDwHqXLS3i5I08U
         4QkMLnxpZSsYoUrFI+mKk0uvAYeQDJB4KG2/I3XTx8/RBM7jgknSsmtYz6uUt/ggVbim
         LIG9RHbSXMswkb4xT4OoPUD364cwz3J7wW/OMkVzWwWA+Ai2bVoXf+8NVS+qO3j56ZLb
         BvRcFe5qxQHaaV4plxDqfSg3bmNVJ40NEAv1+cE8EzWujt/w5ELeV3wdOQD8+4dDuqxd
         4Wq4W7ckKlurf9PGXTP2MjCxb28NeRXQfxAH8q5zlb5hICGC1Pip2cTTO2nVohOYkEhm
         bf6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAlCJ7mU/uImeItNBw8CnelGOx0fz46JfZCep+caxEN2ZagECFaEy1aATzJmS3hNioBT3umYvxx/5d@vger.kernel.org
X-Gm-Message-State: AFq9FYKMURw1+doWe0/3+YnRs9B7qPSSQaFqAYjgCeAtUlevQWPfHuud
	MemX8onkwz8OmSPdAvl3oUkonNhLF+/sSFuorlRpRsg0OBgmezoSIe/khCX4N/x6DVPzWsENQfg
	RliY4FSlnG4FLzCdo6aha8aYZoVWWF8YvIqdTJRGIWHie5s7NjaHosIsWZUDqugFx
X-Gm-Gg: AYBFou3I/bMyNzjuwfMgxaYe/EfuOE/8LLGGxOXw1a2nnUXD+PX9AdZ+IQouCHJyx8H
	h/guyAhKT3RT8L+Hh+HWMh7cXwCL9qePOl55ok9QfvJLLJYf1bREHqYyTuHkIoj3EXKDsXgRENF
	5OKLrfHJ3NQ0+etBY8NmWioB0LdUCDfE0mf3YXLS4Q9U9tTjM+Htm7C4e7xD0+vYI1XlcSl+dra
	TXoPZQThP7Znh/YqECnMZEKM0/ZuGafewHFtBgRsXDYYJ1uLjYTx1zsCmJwaAXqFErTAztNBeRN
	zcninIft9sigx9PLryO6i9/KrSs8dBtGPpaPs1JjTJQZXP56KcPq4oyv8/jG9B9/XiFUg0YfQAR
	JujJWNHttfldJFB4iyJpTQA==
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr775016137.0.1792758740170;
        Fri, 23 Oct 2026 05:32:20 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr774968137.0.1792758739637;
        Fri, 23 Oct 2026 05:32:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432cc83d3sm993728a12.27.2026.10.23.05.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:32:18 -0700 (PDT)
Message-ID: <5114bca8-91bf-4db0-ae12-442d21ebad84@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:32:16 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans-sa8255p: add ethernet nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-3-a34d778ce9ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-3-a34d778ce9ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EmTrPKC8VQJozPWIcDVNZ9tX-GvBsNap
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX9w664C6L3MHz
 NuqO2elmJ2crc0EIcEF1/1LTc6fm0a52rl9/o/HjuCqe62oCfOU7PvxKqJymuPhfelZk97jZGdh
 qYOeJMLNxZpMGetG+v+J6lmYb+03GZs=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb53d5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TV7SFOc1Y2i57lEA1eIA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX8yh8P3bfBF3Y
 NpwIKgEvCKCIYGQZeUxqmcDPIvlGDed+QPzFVZEB/ifuewcdf3uQ1Cesc42411AvMUDAlhWmD3t
 JEVsVeD68BUMsn//2A7C/RgJEkGOatuVHePD9EjW0+vmKzg1xepPKp+phKaZbFhLvVcOtHaDRYP
 LqfQ0N161Mzd8NGCIe1Vuvg0ae+r+3hGZqH3r1BttEGBzPfqtQM3cdQlm2qHNH+H0ApfeymezqB
 0zlFbDGdDAhBKsNW0ckiFy0lKIkEaCelgjNYTjYyjudUyRKT68Y6UxYQZAQGr10GHbrbaFlCEcb
 XDUgLkRtl3/mHBqWgBLc4z9WW+/062AeOJ655ArukChUz1i3JwSkTKTvoh6Ll946U5izayu1Z80
 +pfswJ+LAf3HkKOOT61NJEMDQ02+so9N4T30BBjhI38zZyAX9IC3Kmu2xNzCqpBJd97gz0KaYea
 dtSm/ClS8vFCjrqPfvA==
X-Proofpoint-ORIG-GUID: EmTrPKC8VQJozPWIcDVNZ9tX-GvBsNap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230048

On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
> Add the ethernet nodes along with their serdes PHY nodes for the gearvm
> variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
> EMACs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  28 +++
>  arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 213 +++++++++++++++++++++++
>  2 files changed, 241 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> index 4c155cbc79754af632848cd55b738e3ef0511cb5..c64cfd279af458e24fb48083ae549c96cfc07485 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -58,6 +58,14 @@ &cpufreq_hw {
>  	clock-names = "xo", "alternate";
>  };
>  
> +&ethernet1 {
> +	compatible = "qcom,sa8255p-ethqos";
> +};
> +
> +&ethernet0 {
> +	compatible = "qcom,sa8255p-ethqos";
> +};

'0' < '1'


> +
>  &firmware {
>  	scm {
>  		memory-region = <&tz_ffi_mem>;
> @@ -3226,6 +3234,26 @@ cma: linux,cma {
>  	};
>  };
>  
> +&soc {
> +	serdes0: phy@8901000 {
> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";

Hmm.. I was hoping Shawn's DT reshuffling would land first

Are the PHYs hardwired? If so, you can move the phys= reference
here

Konrad


