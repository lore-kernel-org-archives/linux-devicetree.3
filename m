Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEF747DFAB
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848030; cv=none; b=UUqJknfQSeUUNW3rDV4WGMWUXntcpf/UuByasR0wgXuT3bsCyJoRK8qoMPXBvCaFkwhLYX7FXCCl7acuq2H3rogPGEplMTDpdXFPrHy0CgNDT5qqzwQ0ivFG4khMuwwLRg8rTaVvqr2XWnNlocGSuSpQSvrSzjWFsxAMXiJMybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848030; c=relaxed/simple;
	bh=OqwsAITcYpQz/wSqoeywZPQG18Vmp5n67YNxhye2MQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuI2/MYynsYNVdxiCeNKwxfQqFzYoURz1xRLpIk/Ta4SOSSAn/UoAdQDfSUEYzzAXIrwbPWlXclzhwsorv6efpKeQNK18xZfO4XxsPsPIP5f9BWajC86fi/oHpFQrSfU3/4/WoHzaEmMPzEtOqzNTbLA0vWHcV1oOqubLb5pkh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYTSawVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFTww+Zh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYTSawVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFTww+Zh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB6WOY4020724
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwUtDhTfzwCwRc1ghZb7/Ai7zYeJOhR4rLibL31qz70=; b=CYTSawVvqP2Vf0Z4
	y+thgS6QrXkcUlFvb5JLKccreitO4FzzZg8p3VGinCPwJSoCyBpxazAWzf9Ee7Pz
	eetSA6FTD3MEgCU5VACLWutVGfPWgxvFXr1690hTyxSs0Q0uxAaoAgC8hwKli3ui
	OkJluF7LBjeCxly2TltkMZMGZ3MdUhItBkNM8i/FIrCSERaxECx6fDDVjxiTiQLl
	Zw5SSMgZsZaYFk0LiQIbsB6za8GiCgTkzqJAhR//Stuhk8wKUgPmg+HvRIzneYs0
	wimzpRRtW/jPO8wzVbJI3hq2v0LOk4EGmCTZPGVCBt90p8Ik0XquDnJhx94m6XOs
	tyQ0Jw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru7ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:27:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8271fb43d0so4086072a12.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848028; x=1779452828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PwUtDhTfzwCwRc1ghZb7/Ai7zYeJOhR4rLibL31qz70=;
        b=XFTww+Zh9ySCDlsoZaTG9YlzljK1kL5p8WX+Fv0DjiLzPss55FmxVWP+WyAk/meM9G
         NHlLVqIbEAYt3C3L51V5Hd3NKFivWgVIFkzRXiSpsgW80GQYWCYZyR6cRm0nnXMijZmT
         9JGmZidA4Iwp5LhsxgMMf3XruOCRbu+jHHxjdC1yYyVWWEPpDiBSheRJD40w6tZuKujh
         PgT2lPD3txSB5uJvJQ4nP7QLno624IBq1KxwohFE8BreAmTB1EAJiFzLPU3Zp2tb1C82
         kDa0v3sFCaS8TXFzrr+gBqzqNh0Bb9O9C/Thmj7uSXWrTMGWEzbolPyObOyhRRc/ZUE6
         xb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848028; x=1779452828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwUtDhTfzwCwRc1ghZb7/Ai7zYeJOhR4rLibL31qz70=;
        b=CIdh5F66TYK8y/E/al67DoiPonu6I48KsqBDZ+KTa570KJO/1Daj8zW4ETaNyqQXWX
         YWPPr8pGLdNAXzwoa5EldTX/fU1L6D3rPaHGuzkLM9ugP89TGDIyagWQx8i8jvfKmp4G
         YmSkE5Pk6zCepg3a0D6gzD2pIWIHW3punN7lkj3KKEYWESThRo39VIKsSr3ly5OUixqh
         eS7yR5rE+xjQahgA6mYrBp26TsY4PpjlxrGyPdjidinRohr3UPR9arpyTSVPnNClfTxV
         vDOnv7OQvBAZMnQ+Taxc7HXTU0GRdnnFKn2aKYizxJOnBGHafsqJ60glkwELM34hD7rw
         hZtg==
X-Forwarded-Encrypted: i=1; AFNElJ9virfW0mdFspZz/wO/AEouc1ppg+QPc1UYktEpepz68BOFPKmf9kmEAhqMFWKTpdRUv2aGg1c5i1ph@vger.kernel.org
X-Gm-Message-State: AOJu0YzuLpvqp0OtTWP9975ISm/JHeuccDZEH0Qs416B05e3X2dwerks
	qxivTUlu8UsGJmQCpIQb7RTBZFfch3VpCTgnIArAk7NyMVNpOsfD7+yPLlPZfd85tbDvZ6Gb4SH
	aP0j/BFdv8k+BrOWjIVt0Z9oHlcjo2b6tacnCxOJmtBrosj6Lf+GLvAplV02BvErz
X-Gm-Gg: Acq92OHWDil5mR6LyiDGaIneu9bTt3slgmwV/LC3ebZk5wcGfaqTkPMSvys66rUjD+L
	jKFnJvxorbr01uPnCSDs7++yqP46Eyx5/EgJpqA0jFOuq/+wYK5cCdjmoQsEvY8+IksxQBAdEC6
	llz3Q0niZE1uSW25qmq0jDpAyKyPCBfa9wDWBy6tUt38K/FEZ1Bs2F8zmA2laUL6COZU+LZygev
	4YtaT5DK5siQwoCK6Lr3kbbJkJ9mbhQ+gRtibICZZcyzd5CjNALOEKwc1AF39mHiDzoKF3jGqBV
	HIVJaoo/J8sX456Kfgw7L2Y9PmpM6QB6ANf29b2YTMNC3zE1H4OvgfS66VmzOb8Y19IJrcLuYTZ
	Ok4luIyRBpb7Vd/MbhwzsYg8d1U3Tsit9LPilECTIZZPqxz2BLZnCf+Qy7vXp/GKZRTFiugqIAX
	iZaiCIJPQx7TLebaDxMmomXYepQNAYoqjxqjGNshUP
X-Received: by 2002:a05:6a20:7491:b0:39b:f026:6f8d with SMTP id adf61e73a8af0-3b22edb93damr4340159637.43.1778848027733;
        Fri, 15 May 2026 05:27:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:7491:b0:39b:f026:6f8d with SMTP id adf61e73a8af0-3b22edb93damr4340127637.43.1778848027241;
        Fri, 15 May 2026 05:27:07 -0700 (PDT)
Received: from [10.190.200.212] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb121ccasm5188482a12.29.2026.05.15.05.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:27:06 -0700 (PDT)
Message-ID: <d5ecede4-a5fb-4721-ab5e-53950ee5f822@oss.qualcomm.com>
Date: Fri, 15 May 2026 17:57:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,gpi: Document the Eliza GPI DMA
 engine
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f_kq3JmcWo66sC-L2CGHTDV8-XLdq7Ak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNiBTYWx0ZWRfXxNPml/TOfsnq
 vLC4th7a2rQkCWKZrwtH265TOw/U7GurI+e3IWATqkQ4sFy0OJH12w3leOZds3OMMx+Iq0V84R1
 EBRQd5x+x/PmLDx1YyH/VijUzExfTbH2OcxsqBrHA6HZGNNOtaO9cvS7ATowRoZDN+9H33Mzcve
 tcEoHIdxCmSH5CwjpyBVD7AzMhQcT5ElArhN3VDdwTeId1mXRZnQ3d5xW5Hfa9k50bxw6va7mQz
 RR2dby/IfJm9qQbxZdM+dlzTaZB3Xx6WZSaTo7NISV6K8C6aC8VyeEOmK8Ik/CMr9zLgaPfMv/W
 Wty2fWEkSRAzbrAIYEi0PDL89QxEvenoXAcqAtpaQs1FxssLqSQLHUX/7jH37jg9Q5pMRE8DPld
 L18HqwTCImYcaONaDcWtIlBk17ScBO79kXQp1q7BdsDjEU++wVlRqskNptbhZ8trNkmQzz+tlUB
 hKdInDUaTebONPN2nZg==
X-Proofpoint-ORIG-GUID: f_kq3JmcWo66sC-L2CGHTDV8-XLdq7Ak
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a07111c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=JINMlsxC23q2cYMMw6sA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150126

On 5/15/2026 5:09 PM, Abel Vesa wrote:
> Document the GPI DMA engine found on the Eliza SoC.
> 
> It is fully compatible with the GPI DMA engine found on SM6350,
> thus using qcom,sm6350-gpi-dma as fallback compatible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Re-worded the commit message to mention the compatibility with SM6350.
> - Picked up Krzysztof's A-b tag.
> - Link to v1: https://patch.msgid.link/20260513-eliza-gpi-dma-v1-1-d8e37f026c36@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index fde1df035ad1..d40b0a8dc9e8 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -24,6 +24,7 @@ properties:
>            - qcom,sm6350-gpi-dma
>        - items:
>            - enum:
> +              - qcom,eliza-gpi-dma
>                - qcom,glymur-gpi-dma
>                - qcom,kaanapali-gpi-dma
>                - qcom,milos-gpi-dma
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260513-eliza-gpi-dma-6b5341271f09
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> 

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

