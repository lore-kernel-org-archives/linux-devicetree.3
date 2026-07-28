Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF153DE45C
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225234; cv=none; b=tUIbVja+erJZOd243gYgIAtx3MpPrz90jFuAjkF8wVeLn2GisJNKGxP7f5vqhsfD2SY2DZBKTMiCDDHwZ57i447SyHE7JfRVanfKILksg+FXEjnHRavmngU1xcksHPjB1ooY659c2obHu1lc6PJ41VnKXO899mFtfbmMxC0gN1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225234; c=relaxed/simple;
	bh=OtD1wBdBAGt5o8LyIVEQ/StYqmup1okLzQrHXXtukSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZszD6yjYrFTwVlxLy6KPu+WJ5yDTLflUQJPy/Zw/L5kzPG0CQKLupT4bCUomGbTleqHH23mvkLeyqsz1Ko0kbI+6pCjPH32tLmPECoGRwN0zSlrgjxpV/Q481FPgybnFZFXlW1GIKEcR4Ba1PgKj7FWDWXVL6FqiVKHIfWXAgmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmMxxwtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFkyET+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmMxxwtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFkyET+U"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3bB5l1701895
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utuyuAxHY1PaIfD6AjLDIYVdeOwFDZ64oCdWRPB/Vnw=; b=AmMxxwtmquKYOJMP
	dbiEZwDECfBxqWfjFzvvuvQzFFs+YqaEtjFIgF2Q5jYoo1fp6U8FYA3PqlJb0qmf
	kNJdYUSI5QuupRx9DVhIoWhg5s0Wa38SerzSnFPTQ/mDDLmk+rM+voaoV7qpM/xq
	1CU8mRJven8a24Weot7TO3Kg4POMNWNgk4O4/aY1P7mIMnblGsDn+ZZ2FaLkKxbT
	9mw5gl3oqJAYzzepQWxXciXHNzu9CVJFKsoj5BKFbAvnC/gOHSE6yrozh4ELobn3
	O9hmrxe7z4PszBazKInYlYEUclJ/huBUW9xS0xPp0Pj9ApLZSPvxkp4Ma0gsV1Xj
	LRap2Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7hmq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:53:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso4276755a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785225230; x=1785830030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utuyuAxHY1PaIfD6AjLDIYVdeOwFDZ64oCdWRPB/Vnw=;
        b=VFkyET+UNQ3U5yk7bPV6m1T206tz8raNoM6K/Cvtgg584TA01dPhJWG0KCIblaGyMW
         ipQBvGng9Ze41mKAIC3z4TozJsYMGqyhcyHobCjiv308M/JJSRWM8B1QR+V3ieU/PeqA
         So+ybGaeLQk+Ld5+Dg2dzt87MWXmW1MeWVUVrqB5ZRiFeJPjO7nQ5egd2sGdgnlR7uG0
         6SOMaynF5zFfzHRzKQinU09z+aRY7zWCEMHENdxp3aRu/fEYCg5JsxDWHFqWprhj5A6R
         C7TD1ydr1A+BWYNWPnnuM4XLeRsMHEwaEdHs3ud8DPXm3cEkQGwjRPJn5Wx7x3YHF7jF
         wfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225230; x=1785830030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utuyuAxHY1PaIfD6AjLDIYVdeOwFDZ64oCdWRPB/Vnw=;
        b=qQxYo8wGHn/3EDsqRLOa/b9daJX/mPlUNKY3+x0q51dYmzsI5RfQY5+M9YAO3PfYM1
         CyzjFGu6tu6IJ9wsrcM10Ie+IkU0jppNSB7ps9VOD5juX1Jt2r+UpZ+DFmvYDLMexbcj
         736yU/a1/odjl/tGgI14z8FRww5G2w2UtKj+61n+Ffwy7UbhmMoGBovf/8rrZMAIwepk
         rZZ64Skgsk36TNnagHj9mh+N3RvPJ4RWIVzAVL4dgsjMkysIOS42WAx9XocUSSLGsunS
         og++9aDMJav018pbJaNW3nHH4tWNq/ZbjBfB6+D/EYx3vsiyuzVo1XuOv7H8cdA6aLII
         FSIw==
X-Forwarded-Encrypted: i=1; AHgh+RpdSs8ytScKVFqLqfhtGfTJOksF02cjjARVeCxVSoFxxmaLsWYmTfTaJrRAhUBRdwhAHRQ64lsND6oq@vger.kernel.org
X-Gm-Message-State: AOJu0YxLZ9NHV3CIK2fEHxClP9VhT4Rl/sIwsYj7foEhbWiWfSCMVNWO
	SUfzm0ZurbEhqcKKXRGzw4IfWG/SeuIvOHckTpGoSSiwwMvUz+LISNWaOjKxNj5f411dN91PNUJ
	6Fd25W8MkITAPnPOUetL3mEGjRzyFL7uun3ExJemEqosh/Q99mZx0m/7nazrATx8b
X-Gm-Gg: AR+sD12YRMNc73iW0ina3WAby0qOL0glyCeCut+WVgqZYk/ZM0hKi0lagTOG1M19psQ
	665zoEDQHU6z5QwBfbnFoO9L7SGyUjiDkEUkKIPIeHOCLNbsK6PEXaqY30iuqvO2B8B4SakKu7x
	s5yYouURboeIUKGWOCe2irV4gNUwaH01DZSwLp2xRK6hvux+XFr4TIFZYEp/zoJdIziNjXItxW9
	t7vzZrI2MBEaZbltiWwM9yEkuZU9GNdDuXCooWjwofpnB6ou/XrhqhqhvRStt4WxFk7ni42WGOW
	iCUYhdhRNRHUHqNhZa09LuigVDBozYLfjK5OjrCGgKCzXZzxrOHkHyD+aOTAHTu8OphoORVEhCc
	/fGliibU0/bjLhF+zef29XyZMmuvxJRGcM0gn/834DSTsFjIJkjn42g2cg8BxYbvfuCEVnQ==
X-Received: by 2002:a17:90b:4a0f:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38f6a310c5emr1802054a91.7.1785225230293;
        Tue, 28 Jul 2026 00:53:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0f:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38f6a310c5emr1802005a91.7.1785225229738;
        Tue, 28 Jul 2026 00:53:49 -0700 (PDT)
Received: from [10.133.33.15] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f090619f4sm3509401a91.3.2026.07.28.00.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 00:53:49 -0700 (PDT)
Message-ID: <51bf3573-adcf-41fc-905d-471dfce8111f@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 15:53:45 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX19ZxJ/UrwY+I
 zj0eE3K4ts+n96BsTyUbJq2se/BOI5RzEx/vWG2FrT6CRMK/o7m0vAv7vFYvlX6hjDelH+525O5
 Y5lFXtdJQIFtQImsz4sruT6xTcHMctOUv6aYNgUTxL185mruWJ/7r7VUiJT0Ghl2LkD5AZQW+Oi
 ozx9wTrcYBAJoBd0ZFDXedfpvrtNREL+tjgvZ7qoUGPF5qcTUIt3jLA9iqlhrn04mz7aSFx9VaR
 LJdPVvAbeMFlAr0LbEDqgwWLCpAk0DP/ZxH+SkXFcpgp2l/1q6mxo2aHlW6tR21Vt2Raq6YIHa0
 nluNhriYn2KBLNc2ySGodzqAZSXcq3TwNMqMsyihbLUcCqiNiQ6hDcxP2BFciBbxzRS6RRgSHls
 ZpCWnRI1MoSJucKj8ca+9iJ8hqM9dJ2os2aJQ2NdfXxmjFJN1U14360S/Mwk3QPxyrDHGBbW0Jv
 Wp7wwrChwUAfhSCaz0Q==
X-Proofpoint-ORIG-GUID: kZPsggIFG54Neg-YD101B9buT7nRRlq6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX6/WVPtwR1thI
 pYb78w6MwXeMwK2+DIgsA7VMRCAkoLuUxrm67n43T8j7896Spxw63w4PpnuHhqWuh7bBwliwEgq
 eb+7d8W+D8oE7fffPy+Di/vLz8XVPEk=
X-Proofpoint-GUID: kZPsggIFG54Neg-YD101B9buT7nRRlq6
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a68600f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sNGwWByCUGpZoCTVRkwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280066

Hi Vinod,

Gentle remind the pick up the patch.
just checked that it can apply cleanly on the latest linux-next tag.

Thanks,
Jingyi

On 7/8/2026 3:05 PM, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 54dca623223d..dfc4a3054b5d 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,glymur-gpi-dma
>                 - qcom,hawi-gpi-dma
>                 - qcom,kaanapali-gpi-dma
> +              - qcom,maili-gpi-dma
>                 - qcom,milos-gpi-dma
>                 - qcom,qcm2290-gpi-dma
>                 - qcom,qcs8300-gpi-dma
> 
> ---
> base-commit: 598c7067dd8b65b93f3ccada47e9014a13137f1b
> change-id: 20260708-maili_upstream_gpi_binding-da1d2af41b78
> 
> Best regards,
> --
> Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> 
> 

