Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683B37E5DA
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441985; cv=pass; b=iqCXHu10N8/Epca+C7vkHCwk+di6RLp4cQdxGt2IsitYL0wQ4a5jPTwvGDRRJj+IMAzSMkR7v1F2iTNR6pwA6wNshjIvYYCwQcQUw9Vt0CZP5ygq7bA63XdZs6+L7F1pe+XPQOx+p1x2+vXrZ/+ehB7X+dczJwktz8O8c6iRo/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441985; c=relaxed/simple;
	bh=5QtGSacmsoONB87IdoPl0Fn+Eom9ihnvfpDZQqc0fEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYwInDQju53oAx8jSgaMXd4w5tRyAsn516YaEalFJthz3L90zcslLGDfa5UUc6dLuf+BRA8/3YMl0J9zR0xGGw62KiQIB/7QgUNYHnGDWed2XpwCyL9ykRc0UEV1bFvZRF/JLui5sjKYtkUAyu058GmZxkthqpIl7TBwoOiJHlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nro0vkm5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wks17jq/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nro0vkm5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wks17jq/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUbO1775334
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 06:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynir5UKDYCHKsIV/SiEktgpoNpmpfZkJi8BxEZtVkn0=; b=Nro0vkm5wMnB3qtP
	+4w2I/Fyky8W2z1/nU7SV8mP+TXgGrsM2pSj55S4cKFo/ftJqddEZcRYWfkVOSaD
	VZV9Cuu4v1XAvIls3hC2ZfCVrvR8YKSp/DEJhsPnZOcoY9UWEefVy572jTGOK4a6
	UkSnVOtkVVpwqnx2+boFXZHyok+t3FSC4VPALXjC6SumxoiH8JZ+ktoIIlONkhXr
	o0+BNnDECXDJDTFGTT72UNdje9kVss2wlkfu4Iu6xw0FvFFyWhnrEJ1V1xEBhIyu
	qsGdfU0aVS87GIzlWu+jv0r0WynzNWsKzNYs2y14p2kH/QGIiGlPf5VXcxWoa6dj
	PkKk2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39fk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 06:46:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df375fb9b2so52502825ad.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791441983; cv=none;
        d=google.com; s=arc-20260327;
        b=Km+ZYMeeHPFAiCrcWeCvW/1rC4QjiIrRWNfcR+GUWYykUnO7Pf8psfb7WPZI2Miq/k
         YtNQqNwd8IFvjBo6Sfv8OqieFEhucAqVuD3XX7E126ZXXtL3r3Nc6N1BIOdc+bd56KnX
         t5s1Lu4HdK/Nc/vaNqKyDVr6no0S5IG5vuuLTH3azYeSEBX2lgg5B87Peq6npY607ucg
         khpf/iSQ0Ohe9bp8Ar/p8aqp3JpSuJSg2h3I+AdhgkxG26788qQ95MYMAeJxkX32/t5N
         poBecO+NVUbO2Ky/d31wesrD5ASjJXdvcgXocuYl7HVolFlNACg17aZ6E0Tm8Fqf/skG
         8U1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ynir5UKDYCHKsIV/SiEktgpoNpmpfZkJi8BxEZtVkn0=;
        fh=fxX1C1giHbhLKWKDkI9bP/UNB467NWq+5SO4VKLLEEY=;
        b=Otx29ZKPe+u8k3FkdU4UvU//uL8qpgKe1r0e9HRXdZBigHDk6Px0IlXkmgCoMUjcQG
         VmFxvwSyJsAgh0KbyM0hkHlPl2LPdrA9z3gT0A2PcmH8feHfQ4hMkX2mWi4TXRwUMlfq
         XRKNpsCVb+gwFlkuG2TOObY6qzQQa1VkfJbZm2kPfhaM09/BVfMoN2jPv157n+SZbcDx
         3wX/XjGE8nd8AGDeK6v8HWNWJz3I9IvXrzBnW8ERqQc9O6v3TDHt6EtgVeRztyfI7/Tf
         ItqLQjJ5lntx6ocIU69LJez6XrCIKNdHOQNCYcHHKoHgis4zQuEfRmRYt9wwxonoGTpn
         beTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791441983; x=1792046783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ynir5UKDYCHKsIV/SiEktgpoNpmpfZkJi8BxEZtVkn0=;
        b=Wks17jq/1We4dHWo+ilow0nBgB2yfAX+G2FAJkzJOI355YBkVJ4tRg5kW+E0XtlMCm
         49B3S5aOtn12p4lBuJpZY778RL19TMdKAsfnJR6KboeBmrmihSv5Oa9J5zVcZBFPFSYg
         2fxglq0XJUb7ix4w84D93iRvQhY5WuYhpKkPQvaUyV4C4Tv87IYEpfLESXdk2l9i9wZR
         Udgjwk5VJGdcLNP+CQT5Gg+7VUeua52iOKCxG5kfpZEi80PKxI7VVKa6bCPN9xqpZj1B
         kzTQCOKk84fmx43uK3dWMfO0qgVNHqsIoH2jz8HMZ7wxOyfjF6z6TB9sQG4kJKCSYtCO
         Zd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441983; x=1792046783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ynir5UKDYCHKsIV/SiEktgpoNpmpfZkJi8BxEZtVkn0=;
        b=SqxwYBM1eKtXAJPw3kEofjg2ig05uIIvYLB5A/SbIUGS8YE5CRbaJtSColcFtE+aGm
         Nj9m9j1tS44yk6z7U56Y5CQG5xAnsJ0fWkutTAC0irH/RfaV7bfrPl+PAlytM1iNpdW/
         gTGJD9Wf9E+uV8KedEOxANgMdue2xI6HlWBSdEyXCudvvFAoQvpjicBcHew3y62pVHsP
         BevV6OLknaw22mdGKUZT6akpIOr43/6ffKTWZgDN0++HplBQ4hdj++29Nz+HhiKnlkYE
         9b1zhBveCCtLRwEdHHNB9fUgaRM+NrNgsywuG1CPMeXSpjubUy9jSo68xi5r/JInO8MK
         nGEQ==
X-Forwarded-Encrypted: i=1; AKwUvByzR+qyzTY7SRGkShSFaD1GXdp2piUFXOMDtoCQguThesLBKjm/C1hLJbkVAJw5CW6Swjgn95zzfIyQ@vger.kernel.org
X-Gm-Message-State: AFuF++nNQr2wL6leOXIDyqE3hjUgAYV6P0ocvGKr0V+XHtizR9xcudgR
	BHiJS9SLGJmkVoodXX7x8qX/XSm2Nw/FVt2xECydWxTAlUDRtD+wcNxQBCMEfU+BphVvCP1AlFe
	VB0Zrdz9waUQDucguS7/EW8ClP+I2XYfGB8eCJlIb/AHd7PjPuNBemvnRtmHuhzwhnLZsmW6ivC
	SmtcBACpoF2+pQQuUlgqa7dF604kGvhfmPFZois18=
X-Gm-Gg: AYBFou0X5qOBBSiPx6cxVGWce1EhdjjfGeXzh4ysrJhqRBRj5FOmzHI0dIml15s2cct
	ebEJKHthtsAzdSFhDxzZz7MSlttQeD9y+WqcqTKTOgFCWGp1bk950WMpm1yI5Pm8z9ys+a6s660
	Z5/qzL1aCMrdRZEYYt1eVRDBK3iG6jlReyB59kEdsiJCgLpCiT8yqRIlQJOA==
X-Received: by 2002:a05:6a21:62c2:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3e13403e252mr3919067637.22.1791441982462;
        Wed, 07 Oct 2026 23:46:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c2:b0:3d3:adbf:7781 with SMTP id
 adf61e73a8af0-3e13403e252mr3919033637.22.1791441981779; Wed, 07 Oct 2026
 23:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:46:10 +0800
X-Gm-Features: AclHuK9cxR2Z8imM67b3vN_Ew1tvSO6gdzHAd9wpAvyBxUcgGM14SQWbw8GocXc
Message-ID: <CAFkd8hujKYhXveemgPCbsUk5DFB=fQSxqK_-69fP5aPzoWSzbQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac73c3f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=INH18kujmAq1onTB90cA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX7kWWYt6kht4z
 tElxDysQS1WZ0UznF66MbxlkFdzV+AJ6gh3CBeGqBOAMvnmjNFyZ+d4MOFISrSY7JnU0juyYpPo
 nOWC/xxgWXLTZmWh/ODvOYooM95Mst0=
X-Proofpoint-GUID: tn-a7oxpl83DANDHOIqKj-Yh148shTWu
X-Proofpoint-ORIG-GUID: tn-a7oxpl83DANDHOIqKj-Yh148shTWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX0qOzLkBvVLsm
 5FbYgrRdo1zXsdy3O2PQ9oTqHq0r0NzkMYw6p6VaRcd7Zz7bWV4aK2ufsNqu3Qvp8+EVUxorFsl
 1whaySEjXHl46q1NAAncALLeABhUUeudfn2sEA/opeX4P1+t+3QIVbm/XTXWqqMbDDF2uwM6rI9
 dEe+5ljeJgbX7AcNh/8B/B4BvEW0bZ50fxMBan/D2jJUBFwpz/kISAiTlNTbCAw9jcd9BAcy47l
 GZqOom3jzn2kiJfzlQPzc4UEcxvD14q9r/TTV82cPb1mK+F24QkmpRaJ3JzuIaD+70+fmWKGNz6
 7RuBzs2mZkyv1Gf7jKV/STIRh1A4P2Dt8dUtS2vIVUwJIJybQ9jCMMNapaa+Oqt+R2T9iccZ19z
 +ME/YD6oRigBtZuVuNYNL3WYP9fNlxiT9rUqYQeGVLew1opsk+8y/XyNEKmO4XRxzmyCL7mgNlo
 oJPp8/IdY2bRJfc0SPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

On Sat, Sep 26, 2026 at 2:38=E2=80=AFPM Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was
> discussed and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.o=
rg
>
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach was
> later concluded to be a hack to avoid having subnodes, and was NAKed by
> the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.o=
rg/
>
> "iommu-ranges" on the subnode describes the *allowed* IOVA range that
> stream is allowed to use, so the IOVA is allocated from the specified
> range only. Define all the possible subnodes so as to describe all the
> VPU hardware iommu interfaces, both secure as well as non secure.
>
> address-cells, size-cells and dma-ranges declares the 1:1 DMA
> translation into the parent.
>
> The parent "iommus" is kept as an alternative via "oneOf", so platforms
> that have not been converted to subnodes still validate. New platforms
> should use the subnode form.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
>  .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++=
++++++
>  2 files changed, 97 insertions(+), 15 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce8463=
9cb0aff59d8c2cc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> @@ -91,21 +91,6 @@ properties:
>      deprecated: true
>      additionalProperties: false
>
> -  video-firmware:
> -    type: object
> -    additionalProperties: false
> -
> -    description: |
> -      Firmware subnode is needed when the platform does not
> -      have TrustZone.
> -
> -    properties:
> -      iommus:
> -        maxItems: 1
> -
> -    required:
> -      - iommus
> -
>  required:
>    - compatible
>    - power-domain-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.ya=
ml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04ce72=
cd5ae6815ba5c82 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> @@ -47,6 +47,93 @@ properties:
>      minItems: 1
>      maxItems: 4
>
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  dma-ranges:
> +    maxItems: 1
> +
> +  non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU non-pixel buffers, including compressed and i=
nternal buffers.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      iommu-ranges:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - iommu-ranges
> +
> +  pixel:
> +    type: object
> +    description:
> +      Context bank for VPU pixel buffers containing uncompressed video d=
ata.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  video-firmware:
> +    type: object
> +    description:
> +      Context bank for the VPU firmware processing domain.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  secure-non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU secure non-pixel buffers.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      iommu-ranges:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - iommu-ranges
> +
> +  secure-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU secure pixel buffers containing uncompressed =
video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  secure-bitstream:
> +    type: object
> +    description:
> +      Context bank for VPU secure bitstream buffers containing compresse=
d video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
>  required:
>    - reg
>    - clocks
> @@ -55,4 +142,14 @@ required:
>    - memory-region
>    - power-domains
>
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - '#address-cells'
> +      - '#size-cells'
> +      - dma-ranges
> +      - non-pixel
> +      - pixel
> +
>  additionalProperties: true
>
Got this warning:
arch/arm64/boot/dts/qcom/nord-rrd.dtb: non-pixel: iommu-ranges:
b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object', 'integer',
'array', 'boolean', 'null'
arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: non-pixel:
iommu-ranges: b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object',
'integer', 'array', 'boolean', 'null'

Need
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -67,7 +67,9 @@ properties:
         minItems: 1
         maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges
@@ -106,7 +108,9 @@ properties:
       iommus:
         maxItems: 1
       iommu-ranges:
-        maxItems: 1
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

Thanks
