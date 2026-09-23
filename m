Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B07B51E438
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168370; cv=none; b=YAHr5HEfGfpWNMiUK/dEwk6PbvkvNk/QBXoyvD0VOfhKzxHIGYGr1XuF3C8tV3+hm5qONs9Oy9UCIl0/tYSp3dvbueOSgabDfIqoIjSy1kSbNqymoALDPlytdwQjD4oCuwd7psyhkUv5iJ5nr+8ssFbJjlOvm/mNwQoMowtOQM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168370; c=relaxed/simple;
	bh=P+xRwyu5nJnmn+m2DvzZjn2DVc6kNbhn1YQF3jx45Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTOnkFV86z9AGadS3kvD75RodUhHH62HC+GVMx1xQf4ifgCQc9X+MXtRFl8Xn7/0f9fMKb6p6MTJur4vKYQ9yGLdTKWVLEcb4Ub5W8ErY4ZWOzDeWvpMkMdhM8o0hx2/JDRdIrgZWRrW1TmLqqAezz4a+CYjA5BOfj7S7yckCT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2PhrOtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAXMg7SG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2PhrOtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAXMg7SG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbdS83414037
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPYcmdd0Sz826AQ6Z0SdBcU3Wt+ZNKdEePXQ3xgTNTQ=; b=W2PhrOtmf7gscniz
	FvHvFiv/ts/LcwuE8tQpvBI02Qh20xopZ/Xoy7ZcMHuAb8WKf3Hd3Mk7JuDtJu+w
	5gEvSYQORa3s+Zhy5XH7zFafnI6VM8dV93YO7PHCyZ+tZk3gnYGn6pepeJ8Tzyb7
	6rHN79IQnT/sE93iQTKEtjecoqQ5apOod15t7AHj3uBhqsDpQHyXMfk9boSZE8Id
	tEaLRWj499UsWjY3O1GrLKNNgl06H4b2CvIgnQuBOxrPvEFi1iVEa2EohL3RakO5
	h0+6lQWz5E4rTotUmuHIQYeu6oehP1ANeel+prE5my/bMdKgeimId0YuWk7IRWMx
	fc156A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n22g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:59:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c9f12c82ceso49390e0c.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168365; x=1790773165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPYcmdd0Sz826AQ6Z0SdBcU3Wt+ZNKdEePXQ3xgTNTQ=;
        b=PAXMg7SGU96RZx5s7a6c8VA5QP4IPGM/RZRlAJRksyRr/RV98GpBsTgnO3amz4q+wM
         uNmisDtvuz0IkzjCY+ymJ2aJDPvqhAxoJAuX71tW1rk9g5LsUxg2R6iAvwc/nFn7FEXi
         O8+RZNBTsSvEg2ho5eCmMDm175+aiwY2zscHvIO8kSACBySFg+6+HlonG4RyZTHUpVoP
         kvNK6Orv54/ATaXTLinBGOFhLCj48XVSWFbR2Z72qz9bVQKDBS8Lkgq7mmjNKw7TdvFH
         HOCuCsqAC5E5tUUk+kUvKon3+eqBOhtwOjcMorgbcstfqfjjaNpQvi1It6NaGBk/vaq1
         ILAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168365; x=1790773165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPYcmdd0Sz826AQ6Z0SdBcU3Wt+ZNKdEePXQ3xgTNTQ=;
        b=oH0Y8VSo+KowewsBxAH+PDXEfUBJXWCRyXXKsEr5GHfBTa60N5LG+JAcqnL2+9V8pn
         jmNDWPusoZ3F+O5CxLcZ126aQIZLidfZymHPb+ES1BuJYKKBBixdbdlixLczJwgKJSgW
         poMx1p/VHUxtJfwgZMMT8YTygCJEzJbzARe1m79YgP1ivMDTvJQISDd9U6rEyg7lyrBD
         WhetbzM3hOarbCkAu68JFmPbHlBG6cATV9zszayPyo4qIsPeI+uE1Ul5XPV/LzR34jyF
         TDGKkfKHzr0zGx2tfr0uzSQBn79UVRqdYGxM99wkj0v1AYhlL9u7GTdJiXzWpMCYWL3H
         RGqw==
X-Forwarded-Encrypted: i=1; AKwUvBzcYLnzt7kZ25muvIGqZoJ20kLAU0VzJQQ8QBM9wDtZlg3uSDBkoJUCFvbb9Xu5cq4BCJ+zptwo2D1Y@vger.kernel.org
X-Gm-Message-State: AFuF++mA33/rSt2Wdvllu+Ui+a2wKZpOV3IKmjulihQmMPMtnxRWrqoK
	J7n4JMav6Z0RjIrfZ59/7erAltfj/ZVmg8v5NEPmfRnQN/dthEhU0AVzvXEY+FVEGUDHKAIoJSI
	sL01C2Q1yZUGb/EijhpgL2CJPF8ewbKJIml1qASE2jiSLnduL7onYrc/dGaJ/2IOx
X-Gm-Gg: AYBFou0bm3MqB0lOG11VLvWgj5N9GwXFHs1130uysBcIzVKk0XC0uRuzEYscpaTXsMx
	T6faWlIQUlkWS9DzejEU3RG3xVXOiRhSczRIIL+vZGF/uvem2tUGHoxLVilGA82e7K6ubErSaae
	Beo1DfPEgg6mkKL+FPEOjIGldqkpn+4t5abZCTnV0DRiuflrDfxIVaPQUWR1yMBGo4s+xaUM+6V
	TrhKQfYHDDCvPsPhV7/+3zgOlAh2ff6lzvr+iM9IFaOb4ekmLMjblVIQ1i3bAw9zcRSMwtDWUkR
	Wyj0qpY4Mk1T7Lx31CadItYTYjCujtQ5suK6ZhNzmXJT/4J/y2ILTN7k+lVkXc2WgIYerQ7XzN1
	Dq1yFSH2HnY9g7vzALC4hfeaO51YkeGw0
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr355609137.3.1790168365273;
        Wed, 23 Sep 2026 05:59:25 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr355588137.3.1790168364828;
        Wed, 23 Sep 2026 05:59:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3897a6fsm1627496a12.17.2026.09.23.05.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:59:23 -0700 (PDT)
Message-ID: <4acd4d53-a444-4282-9bdd-1f2f2a487239@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:59:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage
 subtypes and rework generic parts
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX6l4pxrFRs4R1
 S/uiW8GgCmmbk+GVca/V5fWo8cRuUQkGxnwLJyROJF8BvG047mxBD5665bmu/taDDREYlcBOggD
 SELOHL20GxE++4Svzx3cs+V6dOVcNtM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX8AEtcQTExIYI
 Wc8/4OYJMRfKdDUM1PL71qdElYqW2RWvFNgIfFDjYrDpc6H5HIt204RPwIkzvXgL4sZmnmj9Fh8
 QZzEJo0ZaBXLIcKNSyYAxDLOu3aEsAcQQVh/C30T+AWXJD6p3EjU+INLYbpI1SqYWNKMVraHP0/
 8bVq8XG37CYrSMZWHrVnBoRZ1MKFtCH4sf03b0jAcvx5bh/1ZdYQO5mL5xNovCY+n8KUlPu3xZh
 EXk7+gWZYyeRuDkw6fZgS+EMi2Pj0OTsDsP8XzvSncgHUcMRHcYTn24TwczfFpMybDl5nnLwh0s
 GD0ACAQAAcUbozUGJqQQxj1kYcSN8BmZHRUhx3AP4qPkPIcZRvD4Q/RjpLu6mgbrpaLQV6ttdvs
 wZy6TU/8CbCnOa1FHdqEKwfx75DKnxmbCurGKhZ0s5aKkSQV8HtCt+Y7DsyGWaCMNym7nrGYmTf
 lYbDL1A1PNVJu4IRNfw==
X-Proofpoint-ORIG-GUID: lklhj7Wv-mVNMCYZhp29xOyJrULkrDhk
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3cd2e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HnpcLAXKzKr4wbjNK_wA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: lklhj7Wv-mVNMCYZhp29xOyJrULkrDhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/15/26 2:03 PM, Abel Vesa wrote:
> It turns out there is a UFS variant of the Eliza CQS SoM as well. So lets
> differentiate between them with -emmc and -ufs suffixes for DTBs and
> compatible strings.
> 
> Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
> files will not affect any current users as these boards have not reached
> public use yet.
> 
> Also, move the sound card support from the eliza-cqs-evk to the generic
> eliza-evk, which will allow it to be reused not only by the UFS variant,
> but also by the Eliza CQM EVK later on.
> 
> Changes in v2:
> - Actually replace (and remove) the eliza-cqs-evk.dtsi when the
>   eliza-cqs-evk-emmc.dtsi is added.
> - Collect Krzysztof's R-b tag.
> - Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Abel Vesa (5):
>       dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
>       arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
>       arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
>       arm64: dts: qcom: eliza: Add CQS SoM UFS variant
>       arm64: dts: qcom: eliza: Add CQS EVK UFS variant

I was hoping there would be a bit less duplication here..

$ diff arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi

281,282c281,282
<                       regulator-min-microvolt = <1800000>;
<                       regulator-max-microvolt = <1800000>;
---
>                       regulator-min-microvolt = <1140000>;
>                       regulator-max-microvolt = <1260000>;
399,414d398
< &sdhc_1 {
<       vmmc-supply = <&vreg_l12b>;
<       vqmmc-supply = <&vreg_l1d>;
<       pinctrl-0 = <&sdc1_default>;
<       pinctrl-1 = <&sdc1_sleep>;
<       pinctrl-names = "default", "sleep";
<       mmc-hs400-1_8v;
<       mmc-hs200-1_8v;
<       non-removable;
<       supports-cqe;
<       no-sdio;
<       no-sd;
< 
<       status = "okay";
< };
< 
418a403,420
> };
> 
> &ufs_mem_hc {
>       reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
> 
>       vcc-supply = <&vreg_l12b>;
>       vcc-max-microamp = <1300000>;
>       vccq-supply = <&vreg_l1d>;
>       vccq-max-microamp = <1200000>;
> 
>       status = "okay";
> };
> 
> &ufs_mem_phy {
>       vdda-phy-supply = <&vreg_l6b>;
>       vdda-pll-supply = <&vreg_l4b>;
> 
>       status = "okay";

Konrad
