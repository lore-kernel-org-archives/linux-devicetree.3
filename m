Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AE71DF74F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601457; cv=none; b=KulK3ncRxcVE548HdBwOQEbYfF+bPzXMdU4DIjzsyaO0ApZF5Cao7G0v25yIUSnhmaiOMOd1wKUzvUVYRGwohJbXQfnbFDOg1Tlw96qnkn+pkKnPPgCGW6ok8Si7DvSvi7oYThgxDu0JCbcXmUhDa6hSWyHLgh0JEVB496IL3Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601457; c=relaxed/simple;
	bh=QYfd74pj1LXyLOWHsR+yDYGM+wigbN39WEGPo4SphxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AD6bMwCzXl5oJTRdaNEyt9CxYt6JL0X6C3txb7/QdIeY6yJm0Aqx70IKVN3zvVAwRdJTy7SOQjtVmGGbYDsxJ/dUiCKSS5K2rh2ecSytPE+ZwCRpBWSHxIr4H+U3V5MezqRMxoCqBUYdZohY2QUwxANNJhuLDGj54XeLuM0GIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L75qy+Kn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9pfSil9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L75qy+Kn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9pfSil9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNMp81626120
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iH/+XPVeMK80Ur/DXU47daDG
	o5FhKhCHRyRqAW6aJiE=; b=L75qy+KnKhDXK+DVeuhnTUaC2YUXq1tGdfTWNQRx
	9y6JaEi3aqv0WaXx5tn+5z6BFD9TsK1YrPeWBi9a7UKXesRt2GGsr/syqknoBHSQ
	gXwsimYsOdyG81XdmmmYnN8c0Mjr6L8UE7zk5VSpMjWvgm/JXpZarwNJNmhZ1bQT
	D0f7crvrWEPuo8Lb8M75l7TYbeTTaW/pp5ITgjMSEHIO50NvU/ijyBXCtU9UoQDt
	Ijyj9L+KAgF3lq8O3wWp5u76aWrgWD4zrWrVhu59phV+UcpPs00gxdmonEPrHuHR
	qB7zXt04hrSwLXq9OfbdUWec2GxJqvhnh8WEmzqNDxvRUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq34mtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:50:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6ed4fe99so381680385a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783601454; x=1784206254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iH/+XPVeMK80Ur/DXU47daDGo5FhKhCHRyRqAW6aJiE=;
        b=O9pfSil9epbww9Ch3ikVGBLOe8lLbdpIGtaA3qBwDyoGA20lKjtrTY/WC4WXCmnbtS
         vkBTMNhSY0gJ/rjEtPcqtTlEC0pOdQ+FMpPsSqF6xKImMqhcmg5t4Umvcnug6TZFJ/lB
         OOH9+0eNRHMaFakdlqhRli4Ma/vEp14pudOjuDz5hxrL2Ba8L03yfZSNI3/dHFUmhEKf
         m8OANaiRgBaJf6Y2ELdvieVs0vsI4dqN3v3RNjFJlxAkKW2Z8+3GdKzO33xF+H3JZPzZ
         BgsJbL6HViEMXBDJfCHFBcYR7hAepWJFmOvt/sNVI1a1QfJVdG83TSrUOUnxqGsKbQ6h
         tQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601454; x=1784206254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iH/+XPVeMK80Ur/DXU47daDGo5FhKhCHRyRqAW6aJiE=;
        b=csdzi+obafF8DwZrTnVNh8nxoYzk6kESwcGt1pemBU4fCjjh1plDFIN40stMqF65Mr
         tZIAldLfeZkvARKaetY8uzNn+TTak9xRGZ3vgwO/3B2bzQYoY2EA+O0Awk/p5iJ5dn9W
         14skoNRK1CGhJW44eH7KxnUEi7aCFUmNoXPYQ6WKbNsIlNJ3lGOMeXElS3uv88RrsmYl
         S45YQV/Nyj6A7Be/PhUuRP5p6IvpC2C6Ku8qvgrqBljNWmDx5DRNXJYeriajU5HIRteQ
         qQqwV1ewqghU3HQH37EqbeD6RF3XQJcI6m167BQSZd7+JrHXNFDjbyDYnOm6jYf+GFr2
         uCsw==
X-Forwarded-Encrypted: i=1; AHgh+RpW65N2/kMfORkS43A8dH3YBXB+zh44fSL67t2LMqVJh/HUh0LtD+U6HB42vjSKcBBn52jmnJUDZeHB@vger.kernel.org
X-Gm-Message-State: AOJu0YwQm+A4/Xc9LvTxjtJySEchG8NMAnkrHhNIkw7RT4Gx8l6yfv9d
	DMeiDE0Btzna/E4AN8qbdbUuepxOIzULIHUmF4PWQRoljP9Nrh3DooKD14N+UEz/HHtPq73zEV/
	84tu6CPCggpNI+EfWYonU6PIPSuTQY15RYtC5U8Z01yoxRS03I5wsj08z/w4wh7fdj6RjqB0o
X-Gm-Gg: AfdE7clHvLxe4Hw3q+uUo8H3f6fKLj10muuOlsFnpKVs1ukIBZIEOEb7E0+nx0Vr+9T
	Hho5nBkVlzDg5HKBql0mzSSJlUapXXpSXuE+UsQt90qhm6/30WqthcmFCdV76k/M4jsuxCGY8lF
	rNWNP7jc4cAzscX/eQ+BiOHp+r46vf/GGuga1vaMfTjReHEddI0iVr4oCi7dfvNANVzCYCR1An5
	nYtHaBK0kk3I++Ow2zk9xQliOhdCPMzV80WvE7SoTmwjaYRE2VUgRPMLn7Do0oZ/gsVImYihnTg
	YCoNeSF+6aWpmut+M84Q3coQvQtHy0G0HA7Zo7xP1eeCchw048vSgckOP9E3iOMo0nBre1d98+A
	q8R69yH8pOta2VfFc0UPYnnumgDFN38zMOvIxZspMWP4ooiYqmUCJxRJpGycQlUSkujfnwGcL7H
	N2T2D63yrwPTeEA93IIRsVY/ul
X-Received: by 2002:a05:622a:250:b0:51a:8c9a:8fb7 with SMTP id d75a77b69052e-51c8b4c7782mr74565201cf.72.1783601453727;
        Thu, 09 Jul 2026 05:50:53 -0700 (PDT)
X-Received: by 2002:a05:622a:250:b0:51a:8c9a:8fb7 with SMTP id d75a77b69052e-51c8b4c7782mr74564761cf.72.1783601453030;
        Thu, 09 Jul 2026 05:50:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c2dsm5167924e87.83.2026.07.09.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:50:50 -0700 (PDT)
Date: Thu, 9 Jul 2026 15:50:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
Message-ID: <h3kbrpbz7naivqv2urba6ai4sd7kpaqz7s7vxuxuktoc5q2ojx@u6zngnmrbenb>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: be-b1CHVKbPn18_AO3QfAD9maEc3b-x4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNSBTYWx0ZWRfX5L6MoJLaXO7e
 VewqgzNb0tGloiTgdIAG/4DS7N6asGEBptuxfUJOpXJUQ5SZYZU7UP/ZAk6P5N/lQhDnlC/g07S
 8u7JJ0+jxMF9qqHwU0l78CpFlry1XzxJ24KZaGTx3R/ewHT8d7UCrJD3sT3+MJ2efMtTnoVRo0j
 VzZLSJDokITzymEN7flgrefXEVfGYXZBCudM4+jJEQZmXKUHGPGdjgRFcMA5TM3xYR3tsxvDsbm
 ZKpusxrkPXezZvXG3eDiPlQux7SI2ASfltNXc3Vpr16bG+rhPNFeVI9r7yGY0vLhd/BAwj8kN+8
 /34bE1hNlrkzs6ql8DiiL6PbmRvhVjwBPORS7/5C3AK9fJ1dWuQeSxpxIge2gbhbv2y4eE7T7+f
 7C3Pq+SlSiriLsgu61DbncXusXoKtZHybgVL0rt3xxYuPgWL55tWfDtabb0FLsl1jV6B9Saz2f8
 rhDHQeeFSxnvHMvUPVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNSBTYWx0ZWRfXzItBRlozBJFG
 Qeovb/hmBCEpLs6TnHHToOghcEtVq3vs+MYnZ5URuXjgnOxtWclGobpphYoR++jc9YOH/+0JAdx
 l2aFaoiu5g1O+nG5aumwD2MeEkiwJTI=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f992e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=EXgZ2FfgEcvmvpt9hkQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: be-b1CHVKbPn18_AO3QfAD9maEc3b-x4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090125

On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
> VPU hardwares have a limitation where VPU streams are associated with
> dedicated addressable address range, as illustrated below
> 
>     +-----------------------------------------------------------+
>     | Stream A reserved region (600 MB)                         |
>     | 0x00000000 - 0x25800000                                   |
>     +-----------------------------------------------------------+
>     | Stream B reserved region (3.5 GB)                         |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | Other reserved regions                                    |
>     +-----------------------------------------------------------+
> 
> Mapping a stream outside its expected range can cause unintended
> behavior, including device crashes, as reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> To address this limitation, the subset of stream/s are now represented as
> sub nodes, so that they can be associated to the respective addressable
> range.
> The limitation could be exposed when running usecase like concurrent
> video sessions. The binding have been validated with higher concurrent
> sessions across the SOCs supported under this schema.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -91,6 +91,51 @@ properties:
>    opp-table:
>      type: object
>  
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  non-pixel:
> +    type: object
> +    description:
> +      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
> +      buffers. Non pixel buffers are compressed and internal buffers.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      memory-region:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - memory-region
> +    additionalProperties: false
> +
> +  pixel:
> +    type: object
> +    description:
> +      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
> +      Pixel buffers are uncompressed buffers.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +
> +  firmware:
> +    type: object
> +    description:
> +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
> +      VPU when no hypervisor is present.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - power-domain-names
> @@ -98,9 +143,15 @@ required:
>    - interconnect-names
>    - resets
>    - reset-names
> -  - iommus
>    - dma-coherent
>  
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - non-pixel
> +      - pixel
> +
>  allOf:
>    - if:
>        properties:
> @@ -177,12 +228,21 @@ examples:
>          resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>          reset-names = "bus";
>  
> -        iommus = <&apps_smmu 0x1940 0x0000>,
> -                 <&apps_smmu 0x1947 0x0000>;
>          dma-coherent;
>  
>          operating-points-v2 = <&iris_opp_table>;
>  
> +        #address-cells = <2>;
> +        #size-cells = <2>;

I think you need "ranges;" here. Also an empty line before the subnodes.

> +        iris_non_pixel: non-pixel {

Drop useless labels.

> +            iommus = <&apps_smmu 0x1940 0x0000>;
> +            memory-region = <&iris_resv>;
> +        };
> +
> +        iris_pixel: pixel {
> +            iommus = <&apps_smmu 0x1947 0x0000>;
> +        };
> +
>          iris_opp_table: opp-table {
>              compatible = "operating-points-v2";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
