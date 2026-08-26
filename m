Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715F03B6C1E
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735498; cv=none; b=rIbDHU2iBGN1p4l8Fp4T7kRxFF/mSKUOOLucCc+gjxc6/3QdQhYIVpcwvYWO3X2J4dCJALja+zoe1Ks6uzSmmgmK8/tXywKjSfSpg+r6SlPA1u2G3sTFQfu/vkbPK6Uk3PXLqYanAbre/CSycDWj6WmhrDPdar890jAna5XgqX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735498; c=relaxed/simple;
	bh=ZOGT5dUC6Rnm47HFVLH8CfdqgxNOzrfjBCVUzDrefa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMiRYSSsDXaTp7ociFexmVdAa8Jaobtozq646JBmWQbZf6dqV3Aj4ZsRhYBUdPldgyuu1cqohmrRVvhWwEg/lcjfJ28RWNPjG3zG+caXG1VJcDEC/k9IQnhrCfujIj1iHUqyQr0kzIF+XDqJpFU/lax4ZvOXHr4mtzKiqp99ojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htee3Q/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AN2L4fe1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htee3Q/L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AN2L4fe1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RxZF123006
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVOIFW8wsSxMpU9OuswIxO6oXHfoMmQNkg0fEYStYcQ=; b=htee3Q/Lh3ZJ5lTY
	eyDwJ43kHbBRTOg2Gn7rO0XdSt+r5V7OKMUbweOv9lNqDiDo0LydJ1FI6dhqWr10
	w8T40lF3pXas0mrTb8myetoInhKo3in6wroymTNzHMhAwN77DqpcZ7nHTT8hROGh
	9qRVBmYFuq8jwBId7eqzc9Dr6sRBEbjK3mpuCKSY2Oe3ESbzQ5/ITA9HTbgXlALF
	RTlXydU6zHPILMGNMlw/gPxuru4Mm6cC9fgACc45OFN7ktp4sKpv15fIj+tTcMz8
	t2q5dy9VLA+g9lb6NZiMKcuf4E6IaZZLDu86C9ywnikMh4Vigefjkm9wfezl0/hl
	8PO95w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mtwcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:11:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so16644185a.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735494; x=1788340294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVOIFW8wsSxMpU9OuswIxO6oXHfoMmQNkg0fEYStYcQ=;
        b=AN2L4fe1bDcOI9QrI77YOm2v8HsVVDBkzRh20VmX5HXATWs7jBP7loSjTGMwG4qV1x
         n3umphtIysVqKdSktO7SD+cNKwtjvqKmfvpBOWbZ8BFPEgi1+yAX01OQ24IM8MnVfVTD
         i35pWqF9zS/S1Uy3XTmZQDvmszOuYvIq2Bs7f5Hq1CTXW6BRkLMByVblaL4K/FDad0Ay
         Bf7VoJyi1BCeZgHCeWBJx+dlas0Kc2wK/7/bckLxiqc/h4Ls5ET2CeVgY79Q3JY5luJt
         aRNbEw40bgLircII8lixmIdYXO7xYC5k34pdLcxEvrmCcYzMFGCa9GeB2VIKqPUj1lUw
         O86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735494; x=1788340294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVOIFW8wsSxMpU9OuswIxO6oXHfoMmQNkg0fEYStYcQ=;
        b=g9IFOeFHMwWAs4h6PthqZqH8GVj+OH5fZw/kaI/COzGCm3cLLNmlIYwZK/GT/radeX
         QPiyDjcyIrqk+ZQvjxwHKsmjuEhN+KteqAPaVTyBswwkP9fu3d0WfDR5iPQc/78KhXhw
         UVVWBpNyTGyBnZK2vmNZLRwUuABD3/dFRVtIzMGnkwvxpuptLdc7LZd7dPZzAKKeZnna
         qgtd/8PifO4GIvAIq/2wTmYOxI4Lqm9ekIPh24BtMUee67fUH65RZAFkqW8vCmaDYm6g
         GZLkp3is1D3AFjiikVRFu+FsI0PJeDZJKri2chbuqIcFPQpd7sX5qD030ZQQYUM+vdt5
         d2OA==
X-Forwarded-Encrypted: i=1; AHgh+RpVXD1GKyKHrcf8LiX+S6/8pcopylM4FST21q2nhI9kzV/2ToPTZ0aQtAZ5R84UBM52gTQT/NTxmG4M@vger.kernel.org
X-Gm-Message-State: AFuF++lBAVHJjuaKC/cwm8VLRwRwkqJ2nEAh7Bbc1Bk+docDJTnO4fZF
	I93u4LYdrSxWM9qLqlAyRUUUFMmVS5rP74rL6xzqZephkfHT2WoIyJGoCZao2WaO1Czead+gV7S
	Hurx5GZ8Xv9petKVrMOYqgH+oJzwrYgD4A3HT+IldkiB8XSnLnQtiGqnB3lF5u7j7
X-Gm-Gg: AR+sD13qimPxJsFfTt3lQ06ZUJwCNebCK00k6RZAr0IP83TqM8rUMgwADHoZPXqX2bK
	flJjM6eLOqkbjT/xcCDnXRp26odsJEA59g0pvOO3U+d0SqQIcC4v+rt25a2pdDQ5AmZepXQUfNO
	GW7WrIiXmP5RkGVGWey6RTGv0K6YZSR44okO5kubieK5lh+h0qfJPEZpZmgG8DrGrSLGbF4Kd9I
	AXMUfq0YULZrxD69ipKNveNjt3LfPOGk4uzUwHy8FkP0KKpteELv7sBtydqRoJjmtRDm9WdIfKs
	/wAO7ARTdUv38dsjS9PDGR3EAfmn1Bt6Ej3NvXAWKSyRFQUkbvXpUuSXpjJHV1H5yE2X+jt2rAP
	3pDuGuQRoLdigRxbrX4U4jJAD
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10644821cf.1.1787735493744;
        Wed, 26 Aug 2026 02:11:33 -0700 (PDT)
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10644551cf.1.1787735493309;
        Wed, 26 Aug 2026 02:11:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5e0701sm401036566b.12.2026.08.26.02.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:11:32 -0700 (PDT)
Message-ID: <72be72cc-57c0-4b17-ae7d-0b28752bc708@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:11:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-2-8476223184de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-2-8476223184de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NCBTYWx0ZWRfX+Rr6jsoZ9/gk
 16xKe5uLPSZU1/4WNeYv7w8Bdypgf+aBmZPgOaaMkQeeFRr41dkNf9gZ2UQp8Xe/MlY/X3jpG7s
 bgRN/Fc636APAifsdqj5uWNDjKha/2I=
X-Proofpoint-ORIG-GUID: JoRX1-SNxkOGBByUGdeJj5VlbVrLxrQH
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8eadc6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yLgYBEAqgqfNvTdY-4EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NCBTYWx0ZWRfX1myeB7n/L33N
 U589Ss/QFJL7ul78Z/o/t0sMjmIncEE+vWPtCZos5YiQxC0olyglrypjmYahCNBHDy5U3HURn7R
 FD4KWPag8vTZUDDsS2v/by09T36bVkXw1G+kzXDCEKIMTQXRABjIVhrhZbRunVKt3pVTdnoSYDM
 0ULDdTaTTUqcSxest/BsYgnqh9Q6hQpanC6NScUdJVbOC5fTzsR9WVcGyY4RfM4eKkbc6H9s3Yq
 O3veDzH35KGgwDNY/TnakpU9nTBGmcZXyfMVjVPhAbYx4I+6kSISBQBX7C3oqCphh63ioDGhYQe
 Mv440bMnX8/y20MzcwNN13JNewYT95kHlI0N7LGAiWhfyyVs1cnzyp+348Ji4Zdcw3g9xFejQLt
 X+ynLKKgPHViCw2LI07h02ZZfFerxMwN68DscOTw2uO7+Zn24m/vzaK/fANn+KJKqoV8C3BylD5
 kfSPK23+eoMhLNzv1BA==
X-Proofpoint-GUID: JoRX1-SNxkOGBByUGdeJj5VlbVrLxrQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260074

On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> index 6eb4184f7642..9f3a880e95e6 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -12,3 +12,13 @@ &qupv3_0 {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&spi5 {

Please keep the alphabetical order of node references

Konrad

