Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172054CF5E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955496; cv=none; b=eEQDJP+LSev8jC3UUKIAxeN3RE0k0CdTHOofnM7aNcJGgqjV/+vRJZx5YWwiygi88kTzkQs40C62DDUfPX4QgjZtEGa2zC0v5J7IAk3A/X6FDojj6GGjaFAZBGuiPOYKElFQjsEkwumbXowkf9EYJuCOrSd3WfiTpK4VxFM+lPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955496; c=relaxed/simple;
	bh=WoXuufQJwpVROeBOuha7BT/MEfCYL7U8esxuxwmmdN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzyU5OBa0qMrHI6r5Yucsod9HCCyUTRjCyDzTRjT5LfAMQZj2LziE+BrGeFJX3q8AlAO8RUK+U4HwcXdZ1930vvP51b7Yz1dmhLPpkb1hTC1kL6M9AR/M+1GN4IWm8wblg+z+ow5dMHSx7jsTS1EPFKGFJ+aZebj9MqWySoOgxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXbl6cvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkzsbaN2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXbl6cvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkzsbaN2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoX492698594
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rf2tOzccJy3K6MOPyNQLeWG/fvHtBlbcatFQ+mfUs/Q=; b=PXbl6cvGNavKubQJ
	c4VnYRAWsmmvPrHSLmAw0fki6H095cmYWz8SJTzpGNMr5kKfaNGmVx+YnAfp+JsM
	hIQ1jPH7IQYKxELp6akbl/ndotvOkUKeyl7Vm5vdYujrrjOuBNSnJn0DzMROcML9
	7L9CUzVidjfnWXtGYYnwdOv6rgMEmv6X1pPz/aXnZQju08O7cxYK0QJWbdEm4UCP
	eLTxw+2JQhtrOaLiBGMifaiwbmINoJ5ZoK768VgAlOPfC0PgIXZ2mjHKmuv7h/MB
	AuGzQR0DNxVIgwSk5iA+01Kt9903gmqJnnXEBhecALJRBBrfnlOLfvfLGgMNlSDy
	RrZfBg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh01ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:04:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c6e562b059so132284e0c.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955487; x=1789560287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rf2tOzccJy3K6MOPyNQLeWG/fvHtBlbcatFQ+mfUs/Q=;
        b=LkzsbaN22hCPVP4VbwUjbs2TvpBnN7IA/j9NMmK1ryJ43t/2MKUH39oK0FU7Jcuapv
         741JI2ojxzwa4ubrR7+pvhCdKhvGsIhYAGbts9eh+UCmlSGrc30/TsOBHNSDQmi0wP/5
         mC5/lRm553X7IxUvUR1VSeaauo+qSbdD/Q08Mh7ZI9eCbY2Z6a2MFczQdvTBDK00OuGj
         MqRVZnCziJKd5IO318dNurphNgSjn0/RXpRiZ7lC5bccJ1U30qzaTsrO/8zr8/nBtBEi
         ZdKVzcHnI5qG8ueP7aSYYBj7nXT7yQiIDD/zoYpaGYvwQaCg5KIAyVqYiSuKL1PxP3yp
         hF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955487; x=1789560287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rf2tOzccJy3K6MOPyNQLeWG/fvHtBlbcatFQ+mfUs/Q=;
        b=B5f4WZE4KNYm/VJHFhxORDEGSF+MTIrwqp+MG3ZoBQr2QIhk0I+AtNr41lGLc6mxnz
         7N4ozFu1kA3ApfYI8DxBeEQtg2Qz5YaLQVYfGD5Lhj32cIsBWM7XSw3QXS2LDdW8OflP
         Ko8KlvnPo2EEDbqTOztysmu9zoMQaCMilBceMBiHZ8k23UCWDQxJhLlpF6MQYGs8YU6r
         g/nVb0SKOpMvq9fAylC0HD61VUjWNSyutDsLfl4dOSO9WeOZCjNstYBPKko489A100Os
         QpAYZj63gAmZkYeNvNzcGYNkDVFLF3RxJtH9c8waW2bzNp8x9HFTAqDGJmzvyy31OV9H
         Y9TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxq6qt39metOTalIZRvZQdPfWoQGbpQzij0snN/P5rfp6Llh9+VU3K40DcKVJTJ1v3OQhKVRLqZaryV@vger.kernel.org
X-Gm-Message-State: AFuF++mn38CNzDgtIEE1ItplwCnP+TuKShA4koxTi5lI0iwi5Fmqf3KA
	J1bLWE9qI/cMqJYfzHz3r+Aedq0HGL1t0k3KgpJZUR31t0Ozbb8QiiZy3cJtvbGGxazVX9BPyHs
	8alIE1qf7D0Q1IWlSmnddkY9blPmZb7sBmahrndVtlR6GNw8/se7o6vH+WeBBjwGd
X-Gm-Gg: AYBFou0h63a+r6IadhKlo3uhxDvjOt9sxwrY4wJs4O604JzCr9BVTbImuDZC9hQePMn
	yPsEK/Tbyunv0GovnRUNNqhAkpNBfogc5/eYcdS3RRN/4TryPXhUpMkXlfl8tqf67yLbhpUZKFC
	NOzqIreUDk8dqd8h+OUtL2cev/rYLEZcGW2x0VO09GDj8BMq8/04y+MZfOnBP1V2nPYc6MjAAqv
	ky4rsykBcqDj/oHKEV6/ZianGhogLPSydngkzn6bUOM3PhRVA2ghN9Pex/CBuLguTSvF+bRaru1
	kCzB5yE16Z5SwqoClQ5sqZZHuun8vC1v7RKB05QsNxG3GlCAbwUd2g843+D77Ic52f8kD8zLgZb
	vsiKvuDNs6G0eIOP+vmTfJQ==
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr289492137.0.1788955487415;
        Wed, 09 Sep 2026 05:04:47 -0700 (PDT)
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr289479137.0.1788955486951;
        Wed, 09 Sep 2026 05:04:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c398sm745510466b.31.2026.09.09.05.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:04:45 -0700 (PDT)
Message-ID: <24e9c518-fcab-4743-8f17-e0f3d10ea64e@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:04:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-sony-tama: enable SLPI and
 IPA
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMyBTYWx0ZWRfX08k0peU54MLx
 6Ep5KPsofejgpTc9NES/jlrlbpoZeY4NmTQFQYGlhnKpU0yD8B/qH3rCLKeRuYbJ3KVvc/mvb8B
 JQZ3Cm/ij3hOrSuagAMzgKTkM1QsaMmniAVk3ZTw4h7hTwBaSL1AOkOC7ZP6H6FK5itmBv3xet8
 CvgDpkRGJRQgHOAlYPk9r97i6VWOLAzsR/DvX5qGtSfkQ4fXBf6l/qbFJfvktuG7QDzheTJAK1N
 w/Eq8clqjsOj2ME4K9Wgf0D6awGPniFu50pOYR9QZkB8Hii/iBY1h5bJ/zFl0sQNUkGqhpTTLAz
 hb76IoAvhNxDQBDDlhhD19K/7/v4N2SKNJtmNVhxxaC91FFY+QLuKFNICaZ7XnbbFTncnxUGwoh
 zYPakI76ICdAbP6LSmt3K/ktA3MquqZsnwzz90HVNonNHSz53lSbtuz5catjSlRcTVYPSjGh6fe
 y0VeZdmmD33bae46Xzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMyBTYWx0ZWRfX/8aNbnWKaCLG
 TS4Yx+2RoHeM7ceR9cD/r8lKz064Zt/dGN+VgXuJRGIFEbfCa50qD806JLAkUlZJSkJpMWcZmH5
 sYme1d023XfDsFZgYGeRK7KPJuyUfXo=
X-Proofpoint-GUID: 6u_bUMi1H3MisBpYhJJfGiZRfngjK05s
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa14b65 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=9qnw-8MMG8a7AGiJb7cA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 6u_bUMi1H3MisBpYhJJfGiZRfngjK05s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090133

On 9/8/26 3:16 AM, Shujath Mohd wrote:
> Enable the SLPI and IPA subsystems on Sony Xperia TAMA devices and
> provide their firmware paths.
> 
> Configure IPA to use the self GSI loader and the existing IPA firmware
> reserved-memory region.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---
>  .../arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index e34c1dc35a05..1c61a274604f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -403,6 +403,18 @@ vreg_s3c_0p6: smps3 {
>  	};
>  };
>  
> +&slpi_pas {
> +	firmware-name = "qcom/sdm845/Sony/tama/slpi.mbn";
> +	status = "okay";
> +};

Please keep the label references sorted alphabetically

> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;

These two properties are there in sdm845.dtsi already

I think patches 1 and 2 make more sense when squashed together,
especially since IPA without modem is not particularly useful

Konrad
