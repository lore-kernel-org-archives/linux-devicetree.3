Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B72357A25
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461608; cv=none; b=J8sIH5cuv7bDF309/8/QpGPcGzX21XspM9a7dUWorQmZpXZFA0yC45WBt6K9P6Z73gnXqlbx2z+PzFE0WvDzYefVSaPCnxSKjCY8xIZJFCz3H7o9To/lAkjrlC3hVLlj6tDwW/RLAseFryoGtLlcyqOZ34JViqyj3G2aUU4FwHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461608; c=relaxed/simple;
	bh=HycvfdCnGv/wFbxYr1QdrjLugfIpfHuxGvOoLjUxsuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGuJTsN2d/CEwBFSD2+vVTDaNODf6+psMH6Z8dY2WBK8U54+vw+p4PnK0daC22Ms2GNS5rLLV4THzxUkK80uMRH9lKWcS9phyTKwv518ChvehjgEN/VlTBh0ya2fTAXARKy7lQiOLloGEBENCLWWjjwD7fUBCcwWUZOCGsbrlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kogCp32t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jF5jMVYS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kogCp32t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jF5jMVYS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvZv4001892
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSnqrdTwbXVr0DvCnsiHkAWhdNfmazKdA5tEfbIpEu4=; b=kogCp32tkCuf3wln
	B8qDaexLRVQkRsgO/8WI9aIOGdb2Gz3juE37tXLhTGVw7zOudy9w4Yn4Waqq6sTe
	9ZfhxmoJanAE3unnbbyydo9La4omPts3XUugtxE1dzQGZl3IMO9xsL9pUCoBDVsh
	UhOQRbNueY1nULK0eyoXH9RFEyeErHehBNMa+/CM7aDwshCizcFKkSj3mkn+B1Pb
	BoJl3IdPPN2SfofoH1rQfWy+CpQ3plr/VGLKuF9tkES/YK8p6UYJCl/RUNSvf7MT
	xHH8OlHsVk7cH/u/ZqZuZe6Bn+bY9JhDuO+9zgzy3MlDEosA1Tj/K8GPRwoPm/7I
	/RBlYg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em1wyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:20:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so114356875ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777461606; x=1778066406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSnqrdTwbXVr0DvCnsiHkAWhdNfmazKdA5tEfbIpEu4=;
        b=jF5jMVYSzNUbTlUgsNwdv6il+5qSAt0UknXBtEug4Xe3Z7uLX29lRbbE3C8vkwYHdd
         m0XpecyYIOAFLrjN3ORfu84H6fh8+zwUajgWVj1S66mpJTn8zXSniUy35hZqBFWf2r6I
         OFXv4id3+wiHIQP4qzpjzhO5b4EP5OljBUYVHR2IAkNNH72KlQakNt2k8WuBrYV0xMwy
         vGaSta8D1eVRGAcLDxsjXGoUOEVeKK9Zv29v4jK7hlSv5PlDzh4i0TIhUX5Aa2dETQ0N
         dtgmJ8Y5zHdH4Q7Pc9g7gYokozFxeT66HQUjQzzC6OcsZW/OrqKEm5cHE1PwYZt0AITs
         Qc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461606; x=1778066406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSnqrdTwbXVr0DvCnsiHkAWhdNfmazKdA5tEfbIpEu4=;
        b=a+yy4DtCFJUb8YN2KGIwuenenPbQw3QS7m2My+ZjdlEpyU7v2OZ31zu0TdlXNAYlh4
         C16TDEhwUrHXEA6cxFVN6Xlk17xCBMPLC65FYhk5Q0s0fISCWZUjoEsWJZkeubA+Z5d6
         EpOsdkKU+mxvtJ4OzUZpavVIqZsYzsEf9+xV2HoAc+J0DVfcTA6gRmZfQFzjEfq/Rml0
         ysDqL47F8ksk+MzlQxIuG6AJ+RRr2MFFcdeBmtGib5WyCVUOHI6WTC+km88cM39Nlw5B
         AYIXm3MVe8vi+zlnA+4Bx0WjpbalqoPNcz6OJ/V6UydxR3+7TiXiHiuNu73QdJCtTuDB
         5oLg==
X-Forwarded-Encrypted: i=1; AFNElJ9H/8I7+tiVPhcarBjEbi3QjwPmrYjKZ1abb2oJ/y0epRI6zHdGCQNTquX50w4TZzncMaqwcVhO55vI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0OjXTDX4sQ39YWrFeAKx7qcDG24aeHUYX9HAYsFPZGMRkLF68
	ucFrT2gbl+qB/Fm9rbtLSTHt+o6WdMNHFjLyvJtzzm4VoULpoQxqH7fFsglAjseNbOH8uDyOISo
	lp0oAZZmMRN8gQvoaVUBu9Loc+9iIGziO3OpxonrQswXOXYMeYN/NOm/bOf45J6+e
X-Gm-Gg: AeBDieu1ZG5knXuW8M72ZrlQEn8DHcdJUHVqz5RbFUbOSPDHDYwqABOc3W77mB4BmBA
	LrsClsxVq39IqmSbtAw48uJuGMtLnVT4To2H98bPEH+Gyh+m45swUrL1WbRu+GWpfNOxyGeIGgQ
	/AYuev3ocfwf6jS6bwDz4g08kz/jYaUCux2h2dGHPSBAADopwYZoQGe/0qX2Dm+eeOD9kJuVxFu
	aaEIq+D1HHcB975Rew++/LFoQDpnYnOLL8IwqUFK/ZDsR6fLldTiIRN4cudsTlJ7SwujQs6TiiZ
	Syg1en0veSd34HjHW4mKOEcfEQfKvbTNdXRTuYGHOUMTf+YVF2qD+StXKSZbLJeQsTf8hhqbGEj
	oUltJ8Uu9fBWWe0CzjOnsDSg+LyzWHa3xGuYovZ9Hlwbv/obbphJCbrYVsGmaK7BZVMszK6Kvi2
	WPEAHbV6I1Iq5Mb/q6m0r5Tdg1/N+kZf8HD4hUypn7ogBi1qF94fc=
X-Received: by 2002:a17:903:3848:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2b97c03f4d7mr69948955ad.0.1777461605940;
        Wed, 29 Apr 2026 04:20:05 -0700 (PDT)
X-Received: by 2002:a17:903:3848:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2b97c03f4d7mr69948585ad.0.1777461605458;
        Wed, 29 Apr 2026 04:20:05 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f209sm18554265ad.52.2026.04.29.04.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:20:05 -0700 (PDT)
Message-ID: <02b672be-d721-46b1-bf40-02d0c6cd0870@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:49:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] arm64: defconfig: Enable Qualcomm reference device
 EC driver
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f1e966 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8EeM0g2abuOJCfGMYRMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LF9-Zvao43s0hZ0wiqlOi_hxHxMcjA5J
X-Proofpoint-GUID: LF9-Zvao43s0hZ0wiqlOi_hxHxMcjA5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExNCBTYWx0ZWRfX7EVEJ8EI+LlI
 09gfPK+c3Y0XYlO/b72Haripac6RESDjPzdTz/n+rq7CFOSTv7DHj3UOyTlOwGskngybWT6nHhG
 8jFlY0FQX+Bx4D1Jek23tBlp4lk2+oydwJdw1tF04jtXq8HtxdMJxzs4KDpTAwGBX5bPgG8i3a2
 vKt56UqRs8weauF1MdSRzCAL0VlzCI4m1RjxkGACxCTknK13od2wz7OI/ZXcbvkozDREMjftJzZ
 1Pm9eJ1b8ZtzupAsDSRj/dgTpMhlF6OBD9WrLcRIG6KMpbnLs9fHAb8PnncyNP6W1rv4aOMFahl
 AtcM/0ekYa8ZLDZPhCjrPYuuUMCvCEch0SyozDkJ5YUatR/57DCwBxA/2eNt5dzEXj+W4m4vqI4
 +vlawbCmjudixtb8Qfyqd74ONiFSga72QNVyc8sBAQYSqNxPbmGCsEYq9Xm637zk7whL5g3S6ID
 MqnVij+N+ILOFcE5xXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290114

On 4/27/2026 3:34 PM, Anvesh Jain P wrote:
> Enable EC_QCOM_HAMOA as a module to support the embedded controller
> found on Qualcomm CRD reference devices such as Hamoa and Glymur.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dd1ac01ee29b..c48fce61d738 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1440,6 +1440,7 @@ CONFIG_EC_ACER_ASPIRE1=m
>  CONFIG_EC_HUAWEI_GAOKUN=m
>  CONFIG_EC_LENOVO_YOGA_C630=m
>  CONFIG_EC_LENOVO_THINKPAD_T14S=m
> +CONFIG_EC_QCOM_HAMOA=m
>  CONFIG_COMMON_CLK_RK808=y
>  CONFIG_COMMON_CLK_SCMI=y
>  CONFIG_COMMON_CLK_SCPI=y
> 

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
