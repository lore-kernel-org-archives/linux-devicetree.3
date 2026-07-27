Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DBE400987
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163178; cv=none; b=JO/Sya0NBD6xArlSq8mH58/uxGs7pQlNEz8AeNT0cgi/1BZbx+EpA8t62c8mJUfyPZN05KnJ1o13vNhXlBgjlqjTmegVBNIIPZh8mOmU/R9ZDZhwZhAIIo/h5yFByLTf7C7B9HgYgcW9Rs4GvJbNytbvqPyhadcJc8z4wrQc2wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163178; c=relaxed/simple;
	bh=xH9UYE3tKui+PpJ+oJjv266cFUJrFsy6ZjDBpLen2Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPFoPDaDShNfKrN4B4A1ko6i/zgbi/QCgSsl8urjZumA/snbCHfPfIzYBxckQsYhJz6N0akmQ4NTnvj1iX/WDKRK2YUzOTowdFU7buEcS1B0av6fQjJGzj13l4Vg352g7taUBCqflx71P4DJesvhCd+WBlbHgwkFNBvPwIQjyJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVYMFvJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyTGsell; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVYMFvJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyTGsell"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlhjx4061123
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWqul+dcRPvRCnkua2Q9yspTH/JRLTFe01JsmLOFB8Q=; b=WVYMFvJ8/C5SEbO0
	7oNFheF1T4F4m3e1pi8x9EJy5l2jhDquUqOSDJOuLvEnCywyGL8NkdMtQaXaJpZp
	9C9MVFNDQ6UKUGqrHX+zaimpQOZpNXakACySLZ5C7EaVcaaPGf75crBR/WZMvkbi
	SNf1XP8ssFejOFC+0LxwN2/lbs14wtP8Mt///bTteUUxhgzl4/m0TpqI6jt66O2u
	ZhdtfiJaqM1G3jFwYaE1lg2smE4hXVkmKdkkWgR/+P6sjXtXtdwqtSPQgE/D7gSQ
	eHKWAJF/M2XdDNr7rpHIUQYY2iJdZVTzniNjIzUMt+tbyv4nW+mvryUaRhpRsfEs
	+erByQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq173k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:39:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso5453931cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163175; x=1785767975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWqul+dcRPvRCnkua2Q9yspTH/JRLTFe01JsmLOFB8Q=;
        b=VyTGsellARHfNvfSCUzopaUhoTFiZ53hMs6fh/wKtj3A6JLEZ+JnZDjGu4aoxxqDtS
         TohbvWMr//mRzrrkQyqBOLdXZ8XQalSZcHaaeanef09MI8RQOym3ER7W+SZMuIM3viK4
         BZXM4wHqz9ZQAR6riCijmZec/WCmjC5/PxBzwEq1oEZM+NcdRhC5rL6Tqcb4ZIP+y8lH
         vO63z4JLjQYpkqWo29fHiSVJzWj90ojwtiGZSoqt80bZN9OE2fUQvIlgVZ8SHwoRj4Mh
         mDte4UKLC6PMDZduWVYVEUN+zDPXODUYtRtIyIcvZjWgbbI9I4xcqA6ajSW1C4b/VpXu
         yIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163175; x=1785767975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWqul+dcRPvRCnkua2Q9yspTH/JRLTFe01JsmLOFB8Q=;
        b=WNDbkqUn8idaBKSygfLzrO1oyZ4Sg3Co3m7puPlD2Nd9BGCdsazSiZSeqiqNb9Rq72
         44mDpIk3HVEAHxy4UFO/8pv65hbr5QfUrdjnvPtMkkEuF6WUVcMiIl77zyZHbppVvh7j
         KYSk8qIgcRJcY4XAmrc+yjh02vhcYUTSBUvYhNdGA4CxIZ1/qwvs3WZkJOzNiiK5BMqN
         9rf7LYl5SDQhlIjnufegmj1ENkyzMuwvt56dDRcsjRoy0bFwF4t1XIz3SXUJ1rmlMqJZ
         SIjIASugrBs9/B2Ghg5AeK/Lz+nUw/hTe8evyC+bQ5LLrFcNmc3tbzDpwcn3Ke729iLW
         vufw==
X-Forwarded-Encrypted: i=1; AHgh+RpXkYx2TWiupEjQqdRzpJe99JniAjoT7PJeF8NJvMic6Vl82N9/9iidurVhhZlYZd0C74wXXn3v6F92@vger.kernel.org
X-Gm-Message-State: AOJu0YyMwQkmSp0/awRBREwYPi0iwq5QxQUjl8Rgc+De5Kn0X2Mxegpj
	M8ZjTgiA7zURZRHbPneWN5mJoc2hgKhxACAdMU6hIPO5n89lD0Pcwszq1/c6ZVBDc/P+FszzMfu
	ZZdiqGfzzewmnOPv6keSwhx2QSFIz+xcxhe4UYcUxBT04YaKg9Ub9E3EUQMe30iwd
X-Gm-Gg: AR+sD12R9ovlGAzo5VMHzPSwSpFiw2hwqvyTe7qiZ+VxdX61KvOI/lMLHSVR/AWhUjh
	YPfdMlNRFw6gn3dc239EnU5HX4XQVYnJTMpIYXooIZ4PdIOtnPTtA8ZP/+tZe3ARqW56wX/8Dnr
	sU3lEFSxPpevTaMJBLRTZWUpH899ietYpQeO8h27GUDj03QPJogrtbsv7olx4EhkCQfvHruCwkk
	vzf6cICVOpcS60+ue8+rjFbIDKeNk5u5Qrh3cjpKhvNb8v3Q0qU1jaNhPP1fkkrFGbN24EmgWru
	5a+rzNfLVYesbEMK8RzbRXaTr+hk3G1GFqnSdYyqywO0W2tIl/pPEHu/NmxJU9EzxinAyGdFV8D
	dqh2Ei3UOLeUSe0QvEkTbKjtk
X-Received: by 2002:a05:622a:1b8d:b0:51b:e991:92bd with SMTP id d75a77b69052e-529cfe17679mr3478851cf.7.1785163175091;
        Mon, 27 Jul 2026 07:39:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8d:b0:51b:e991:92bd with SMTP id d75a77b69052e-529cfe17679mr3478451cf.7.1785163174501;
        Mon, 27 Jul 2026 07:39:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f2224cadbsm14056031fa.28.2026.07.27.07.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:39:33 -0700 (PDT)
Message-ID: <1dbdd44d-070b-4abc-a79f-3cde09de7d74@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:39:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
 <20260723-usb-shikra-dt-v4-v5-2-5b69d9eb0888@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-2-5b69d9eb0888@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfXwvQUwWMFhhDm
 OVWZZLVxcq8zy6/74FsULFJAZqiAOnDl77ZbYGDJmCHjJa+HOkbiU5+Ihcya4HU6bWNo2aaY27z
 GoaoJ9JFgTf+j+krALGHqSppnGByIS4=
X-Proofpoint-ORIG-GUID: GCDUbLZnDrjd9M-9MR4u69F3ICuue3od
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfXyTTDNZ/3wSHd
 zY/Y+QLN+4YyoBlESLvhoVTiC1bruRKqHmgrsH7zcHFGXep/L5zSv2DOPvt2+Vi9saO52bAUdCc
 cukQIHyUD2ofQSvrtCEnxQ1A83jidN0itIsw4vY3yM263phHnhT/sDU+NRAoEk2qufhdnQWgbCp
 DZ1Y7xxm+kNZeGmsw7Y2WpIhwHEek813HXWKKf8KaLdOYmvfgqjBO+Ey3gpUhl8iaGce3fAftGY
 mE2N1PWKqSoiz0nYEHYBDJMg+l4gjiP7SqzewawpZ4M/aWir/tyvO6xlLUJSswcXS2kecx/CMwb
 XotdE1rerz/WVnWPkktNaWK5QXqtIzIOSGogE3erP6dEBIGXUj2MWWMYqVv3eBgq1S0WXw9K1ji
 H549hXpTnoFAQZdKjmyURpzqMTZ1EacDkk0H3WOkflyRV67c5CKlyyAfxPMD34ztgG4lEdxSmE2
 Sn/OE4gyMCK27qQ7z8A==
X-Proofpoint-GUID: GCDUbLZnDrjd9M-9MR4u69F3ICuue3od
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a676da7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=h09ikyFUrcXnkDd3N-sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270138

On 7/23/26 12:33 PM, Krishna Kurapati wrote:
> On Shikra CQS platform, usb-role-switch is handled by PM4125 on primary
> Type-C port and Cypress PD controller CYPD6129 on second Type-C port.
> 
> Since those changes are not yet present, enabling both USB controllers
> in device mode.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7ae..006e24a62f5c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -38,3 +38,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";
> +
> +	status = "okay";
> +};

$ rg shikra-evk.dtsi arch
arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
9:#include "shikra-evk.dtsi"

arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
9:#include "shikra-evk.dtsi"

arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
9:#include "shikra-evk.dtsi"

I think I asked either in private or in public, don't remember at this
point, just enable these controller once. They are all the same board
with the chip and PMICs swapped. Override just the supplies in the final
DTS files.

Konrad
