Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5842746D0B9
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323594; cv=none; b=totHtoCBGkzfaEF9GM++DYWBhOhsR2QenyO78wuvRzbtYfzbr+xI/5V9x/U1v4nvSigu/cQ22Wz29D14vIoW+VR9VXi1WTUiMCcFW+7f0ZlHkZ5TjejveyljQNzK6HxWToJZg5v6CeXFNU6oHkpuW+IEvGXELRlY4rxfN1MluwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323594; c=relaxed/simple;
	bh=eHsIHV1AXVz/XaIJHGb+AZLir6HQToB0jT8g6CR2t4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVzpDxtDITF77ih+cKQbpdFo+7ZRaOFRs1X0yGQouesXJoelEIuUHyZpae9f+SFPCbPa3eaPG1Nv+hMcCJo16UBpeDyNGjDizoGLqC/a04aA6Vr+WKV4n8Av5Y5zZR3oF30Q2DRH3Qf8w68HYC5iHaPTdWfC7zRdb/vi087M6Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwYOxSpv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C45DemVK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwYOxSpv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C45DemVK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TB7Xd61570545
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egQ5Sd4X5i8dWQKe1toEYX+OzKum8SXkE1FoptzVp28=; b=cwYOxSpvqlV+IcaP
	NouPLYqR8vSDHZvx9VDC0MFC6Mg4oqIUQbSiPJ7Id0skxvt4kRP+ZPkVzXJNnuQ5
	yD/DJGQ0eVe1uBq1yzlYWGvs0gMNREqWF8o0L4+BjT+gjSr7s9yh7eE53O+TyK/2
	NdlxLnnAu/L1McBL4Pwgr1ammxgUyAQHzCzhWzebyFA7dIn3ih5ndH31VFbc5kiY
	WZ49ayefgVu8wsAOp0r/XhMjYOFj7zLuGMq+gyn7YGMh6qWlmIvxCkY02ibVptTv
	DNpc9rN9d6Dntm3XerZtfjw//0BucB+8vS/KrBg8LJjMXBBIp/1TXwkKKh5YlFH1
	b61HiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sajhcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:13:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e9d892f0dso2488141cf.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785323586; x=1785928386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egQ5Sd4X5i8dWQKe1toEYX+OzKum8SXkE1FoptzVp28=;
        b=C45DemVKs6Nruhcn0XxVSfeCGOE3XL7W7xoGhFVUif9VjnFj3QJ47fpvAXJZ6XXMVv
         fOMZlWZKlAwOOixUxLnTE1jw4P4YZ9zfDK7bXmmbC2s7aIg7NBb39zpwk3N6o764rug0
         rBzbnLPTFj5zG7aeiqEg8RUPMbiFEpjdHuDcO+I/gTSkNgeDjohrb0idqsOzkPkoKwgo
         wZfzpK4ZHCR6lgcaqxtAFe7s7F52vNmY2g+LoffqHOqA9a40Zi+1RXL4bXfycFwPBlOk
         7ttnOMt6Zz1NQFQTcOCvIgzycw6kYV7DQzBYPCKxw9p49vaVkLFpp3sRsiTyETeiI/y/
         g5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323586; x=1785928386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egQ5Sd4X5i8dWQKe1toEYX+OzKum8SXkE1FoptzVp28=;
        b=VlwJdWpsMP5WL1xhsh4R7OZdPHz3bXVHX47lSkXTFOj9q/4ql+FjD/322gmQLr4pb8
         sxBfqDurF/ZX0QEBgXOFR51i1hH8h7HCMKbigEvSg1QSOts2BZezmD6VzCzWWhH9zPMT
         wY/ul+cvPx8kD2Vgq8q451PAajq0LtXvqb72QKTAwDpb0qZU0eTH/WOoYyDNX2xqIKwv
         cbUgJAIH/pzkVidMtbahpzI2BoJ/ai7Pu/4hdARM3N1hfX7KMjUU7ViJBZUPRZcmPzXX
         MC9XxQdndhAvOJcxdAYiHlQdQ97ApOqVexPzTR+LNB7xCtxDDHgl5jrJQbEarq7w/QmH
         OG/w==
X-Forwarded-Encrypted: i=1; AHgh+RoniQRqUxlNf3j0HeZAOJ8quDni2VhjMYDfqnKCL5hKDETzGbYUCuYQh+uO6yQgDhAW2pErmIIpQ3s2@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDUDO4DaL7WVaLFMgznvNt6jayIHLR2MJ5IYenUsXKqGPnV+3
	2bAUcLM6z+KFxqE2qoV6Tqmj1w9gEC3pMnC15RgX1pdp6/Yr5+94K3laC6QM8EN2iRjapD7Btjl
	y4dyxFx8mUgH9mAEP017peOWHWeFIz+7oj3Vr1htK0SaHlI+VrR+W6xMVXITyjtjuR3TfpgHA
X-Gm-Gg: AR+sD10pFdODz1MULWFr9vfD5Yf9ZxPza1VeZuXto/oz6CdjPiR5F4Yn8HWy+zQVHWK
	AqXqwnWpv9L9/iEsZgivek04E3pxVuspsuZKIruvR8+CJNzCaNJVUFgpkW9DR+YDnoympPt4qBg
	26a36DDlMFnidGAHw9t00Z1U+6+J54VbgVIINfsEMjH3d6xlDtgY+RVTRtWae/Ml7NJTE935N30
	Hh9ewFnxygYnO2g6eNWwaVyQS2t0slA441VubYQ542ZO2tP8Wh50+UO43zKMCE67CL5/PU+mYyt
	NlR80xapPn3U0KejHUvPQ4AdZOZGRQRbY5rLvOox/u2tqdixk882Vz4Ry2yRdEjXIj3XiT4OPdY
	JhwxIgF+EO7VwklFTKp8gLji8
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr53237091cf.4.1785323585688;
        Wed, 29 Jul 2026 04:13:05 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr53236671cf.4.1785323585291;
        Wed, 29 Jul 2026 04:13:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83ce0eb3sm98924766b.18.2026.07.29.04.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:13:04 -0700 (PDT)
Message-ID: <a46f1394-f006-4a13-b251-e5e2a0494b89@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:13:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TSz3kqFm0zZZBUw37uktEPMKE2pZ6hQk
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a69e042 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ggQ_GJ_R9_w00h1cgFYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: TSz3kqFm0zZZBUw37uktEPMKE2pZ6hQk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfXwYG1X8HJwzem
 06eohlGzutW4xk9ZoP+3DLRN03rSZ19fEWPW5l/U6UY1BUQbFCI0tRGUClCfeysETHCBnODOXWr
 e+WvYPSJz7ciulZLwpM8UcjXbMy4ZdI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfXycsX9emtWQRy
 9sIVk7Kjq+FTwauepgtsddnWeXqzDQGBtfA1awFraXY1tdC3c4/v1edpw+BZO8Y2nusN47QcnB6
 uLYLynHjwgngnX/BqHFfYniFxm3mT2W8ZfqVP7lQ9T6NxenQ/t+8z/ojCM0wclNAYNs981B+iSJ
 bLC6J08GmOpVaNW/92LcoErTX63AQKOwNPnuSGW/xwT2zTI+qVU7qUNPod35/3qQNE94qwWkQG1
 SDC2K+xpj7GBjGlnsTwuCC7SfLHWvDzGTLt8mJ0pJtVW9HSqmnrPwp0F3LXbdTHrZsqk5FstR2d
 cwamlmjmM3aYk97lPe9hQYZoogQbchElDormNV7VI6IMavwnazcxSOY3mOuWqgylITg+8koRF/W
 Mrr0wBSqQAMc1i1Lc/fpixaSmLhgQlhsQRvqLW5gOoHgCrReJL7c91te5bTbhikwHWU7E9puwkP
 MvPVFz5vyxri/mhfsgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290092

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> Add the qcom,tsens property so Hamoa-based boards can list the tsens
> providers, and how many leading sensor IDs on each, whose readings the
> driver averages to compute the SoC junction temperature reported to
> the EC for fan control.
> 
> The generic thermal-sensors property has no standard semantic for
> selecting a range of sensor IDs from a provider without enumerating
> each one, so a vendor-specific phandle-array with an explicit sensor
> count is used instead.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> index c07483aa5937..ec809fcd03ab 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> @@ -33,11 +33,40 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  # A generic "thermal-sensors" phandle only identifies individual sensor
> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
> +  # a devicetree concept the EC cares about. What the driver actually needs
> +  # is raw readings from a contiguous range of leading sensor IDs on each
> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
> +  # phandle with a count instead of enumerating every sensor cell.
> +  qcom,tsens:
> +    description:
> +      List of tsens providers and, for each, the number of leading sensor
> +      IDs on that provider whose readings are averaged to compute the SoC
> +      junction temperature reported to the EC for fan control. Only
> +      applicable for Hamoa based devices.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      items:
> +        - description: phandle to a tsens thermal-sensor provider
> +        - description: number of leading sensor IDs on that provider to average

Why don't we want to look at all of the TSENS sensors?

Konrad
