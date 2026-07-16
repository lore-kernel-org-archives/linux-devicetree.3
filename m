Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF534574B
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219103; cv=none; b=q/B78RipXmWeajpYw006NWtBovvxarIOaZFWDdndnmHZ+WrwuOJkmbE0JKKz7szg77dbimmR/7E6cMQNvdse8kkYi/yxwzMn5uSIc5/MS0N89EZmlwq8VCOnpDscQlLkeiuXYn0zX8DBwv0tpXPzypnZm/XSP7va47T98DdsNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219103; c=relaxed/simple;
	bh=d7dCxcL9JhaAlC63R8HLdTyMTbOhxi2OCb2JNOhGkdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvN+jZ+JToDZw0F1mErJYLfqXPbL+5duXXdZ/zLC1LhUHdmRkEz9KDQ6Cxg406BNsbFm2yvFrJoGV5n6MXpjcULPDw7YxUenKJkxd821jJol+BistTKRGj1sXzB7+jx5OxTT/PnQRXFxAYBgxe5n8EsKPRB2FkxYsf1Z8tovy2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRGrwnk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flBsFKBW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRGrwnk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flBsFKBW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJwtt2735155
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njruQ2oiekgsshQb81UK5X7MsN2R6Ye806z1jkXH6YE=; b=BRGrwnk/PPA6Rqga
	OOT+q2XVm78XVEubKT0wz/tArJilH+0ZcKuepMhqcXvbWccVYhU95vRuF522g75D
	mSDs7fwPgxzozjSgSaxMpZD5QRaxDwjqVBsva0cq9J45KMczih33R1Ezu0NHQJw+
	lI+JwXvhSp7y9FXtSA89acT5fQ8lfl/aGqAL43b6z+rEX/4HkyzqvAMu52S3X1Q6
	gT9ag0c9QPjfVHq4lXPWVwEyajSc3EiHFoKhHfq4fCN5BNjBoenrocpp4NrsjOgj
	ca04MdSKYiJsXnoiw5TkommLDueEmRmD2Mi1P/IMPhSVq+kdOtpklDHW1Qr2+LuT
	TsuGEA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv1ve5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:24:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso16965801cf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219097; x=1784823897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njruQ2oiekgsshQb81UK5X7MsN2R6Ye806z1jkXH6YE=;
        b=flBsFKBWju12y7rPO7pqnhHjVv83geUQqrwZ/asH8PwY+mWq6DYRwV3UOjvN4I0rdn
         H944zTvvb6oUv7u85shiHNMiecS2dYtISAvrkJZMtGJLW30FdtevCrJkj/GlrEZCzdde
         1Mwqi3YUDOZSwTx/IK8pBbaXRo6NlzSRGYb/etShq+AMcmyUGAuwgE7Q26dHLWKVxWl+
         fy6URCoGB56tTWMqdWk3lBTcZv1Htvhc2855Ce6DLebFfYgHZ2OFc1DbaCCg2a7R+9hQ
         Ehb0tAUYovnwb77UHyymmrbQoyOSDQ/2D3OKuN+0xT4m4kY2uF0JGmYDV75lQ3FpcQl0
         pEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219097; x=1784823897;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njruQ2oiekgsshQb81UK5X7MsN2R6Ye806z1jkXH6YE=;
        b=UELUQcLYvWekrHTrCaAl9bc6H/lAOHgluxhW7ytR6/GjIGzDgnRtmNy0tBQ/2xhyEn
         Z3w/FFjMrpJZoEYettc8mNokbtj3wQDAC52DvbEru1+6S2kdnC7rua868zIGlH0GqtVu
         QfD8/O53gJyrNl8WF+hwnRP6KpqdRAQyNQxoEauorntET3QMKAKUfM/N9/AztOTghCPJ
         9NkAtAJiWbHQ1xSH7PKPNFLiA70vISrofCSgpSIV0hssAsVDYzM8WMxmP61ig5oqzUDE
         9XHg2+JWFe2S267gby/ymVTUnqLspapQFBK+N6flRyPLtt93O/rJ8oO7DCeJHS6VlcfZ
         Delw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5h3RirWcv0BcHTci6ajUIZC/gEQ9G/gaQcYFz/Fp+90C02iF8t3QELvtxDgd86LI16N0pTTiiVDNC@vger.kernel.org
X-Gm-Message-State: AOJu0YyNL1qyByJW62shyORuJ4AEAExhfltXjU2N1WNbqh5ywpOkM0Ct
	cCUcwR9r18UH0QFYvRDcWIpehozrqoPhjHctDjtqRYMehco01+CRtvcbkhF9uoW/S0G9fT7cCwt
	XjF+C0pFiQ7iXRc5PStOea99KKbiN3l7qYgbph8xBf5cqmKUDKvRZ0mOvbcFvmufLaaBLIiWb
X-Gm-Gg: AfdE7cm7EHW8H32kVYRy9aE9Z+Vmd5VU2uQMlXBc0V3nCBWjb3DIb3sMtwbjNNmseKz
	1l2+BsUbV9Qv80HkfXZr6b2GQ5DxSaGTJR8QrefWWjNtrMn7sOGvyjWtVj5/rHfYX62zsDKeX4Y
	g/hABQohvEHKLc9Yl6QQMsmcLTANlCbOtPKAYUIXTHtVdemPdATz7D8kLHVfXTrLFH9Mw9e45bZ
	jYrYq833LsB8HQGsLaU0HglTCFDpvY+ER9nrx7LzLIW4MayzdwK4CU66zud2HO8G/4+rDixQBSF
	QR8NMlo2lr/ae/yERajLGDh5mtt3AIdCrSD0R88TNeMA0shlU5iAJ2U0rccytFFlb88BqEEmMLp
	HRTWNrMV4c0YigLRldnNYi5nu
X-Received: by 2002:a05:622a:e14c:20b0:51f:d4b:2116 with SMTP id d75a77b69052e-51f0d4b2ce9mr35737561cf.10.1784219096929;
        Thu, 16 Jul 2026 09:24:56 -0700 (PDT)
X-Received: by 2002:a05:622a:e14c:20b0:51f:d4b:2116 with SMTP id d75a77b69052e-51f0d4b2ce9mr35737391cf.10.1784219096470;
        Thu, 16 Jul 2026 09:24:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2878e74sm5128627a12.4.2026.07.16.09.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 09:24:55 -0700 (PDT)
Message-ID: <e3dc38a8-b2a3-437a-819b-924ab13136c6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:24:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: lemans: enable audio ML offload
 memory and SMMU mappings
To: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
 <20260716151854.3041914-2-pratyush.meduri@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716151854.3041914-2-pratyush.meduri@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OCBTYWx0ZWRfX8TtzUkI3rJas
 nOvCoM6kyPnjAUVnZS0GBI3eNQXnwViA1U4xh2mBoycveUfbMK0mH5IvDDyMm2ettpeMaXtZSkK
 1aUyYPrk+JyiuAMtBitK7qlDEYkbVPlNaBl8mhfxRCke44aqYT8m0rD9x6Y2/NAnIE9tBi1ztwQ
 68sUWb7PX83X2EhNrXxfOj2PBZVr0fYSQi29EWgsl5WtMelnIbNx5vNWmuaFZ2n2IH++9/YlFwq
 mFvWyNnV6KBDIF8LvHBKSb/wyXqWpsF7eTNCjpeEpHTwqcni/E6OUuMZGfpYXCjWxanyn7hTfLu
 j3siBBY4lzyJjjJlrlo6IKgQlqEVSIDn2JtWrvZ3FUEpZvzOKpnSCR96Ed5wTGt5nhNvOKzDOf5
 BN7fWLuPyoIDsNrcO3TfF4Rw6sdEr3CZIMMu3y4MKe21dfL/ST0dlYkAC6nq6GIr5z5myESP5sa
 tdC803VcNsbZvHMixmw==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a5905d9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=IqayfNGWEjniyl6KuZYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Onicnvc3ZHg76kp-Zn9D2Le2HEXocUEw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OCBTYWx0ZWRfX9izQ384sHYRQ
 7BYI8aDlztgslNwex/zTT5q9FjZcAcz0ecRh0kthBURBSjuPXmG+43Gj7cox4m9fiq0BHAmPAK5
 h0iBycjxQoCkVxS4KRQs4h+ZNAVl4sg=
X-Proofpoint-ORIG-GUID: Onicnvc3ZHg76kp-Zn9D2Le2HEXocUEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160168

On 7/16/26 5:18 PM, Pratyush Meduri wrote:
> The audio ML (machine-learning) offload use case requires a contiguous,
> physically addressable buffer shared with the audio DSP/SPF, and issues
> DMA transactions through additional SMMU stream IDs that are not
> covered by the existing ADSP mapping.

[...]

>  arch/arm64/boot/dts/qcom/lemans-el2.dtso | 4 +++-
>  arch/arm64/boot/dts/qcom/lemans.dtsi     | 9 +++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> index 621ad930cf54..5b477346ef90 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> @@ -19,7 +19,9 @@ &iris {
>  };
>  
>  &remoteproc_adsp {
> -	iommus = <&apps_smmu 0x3000 0x0>;
> +	iommus = <&apps_smmu 0x3000 0x0>,
> +		<&apps_smmu 0x3060 0x9>,
> +		<&apps_smmu 0x3062 0x1>;

1. Does the Gunyah setup need any updates?
2. Are the existing SIDs wrong? Aren't they just used for other offloads
   usecases?
>  };
>  
>  &remoteproc_cdsp0 {
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 3b0539e27b51..060565113784 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -624,6 +624,14 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		audio_cma_mem: qcom,audio-ml {

Node names *must not* contain commas and should be generic

> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

Is the last byte forbidden on purpose?

Konrad
