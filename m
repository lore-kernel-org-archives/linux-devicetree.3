Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34374BB806
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658309; cv=none; b=fGftNgouIbXbUeiF2s3uGui6D6hHS1oGxVWomSfkQLG4mr8UaxTiCuLYf3p8b6UZYzldpEaLGlSNjcAF0paNxPRf2bdAWKRqzV8WHyTJ2PC7Wsk5d2L2SW5LRz7pmw9Kk+CzS7ocBdTii6jABkcRv0VcwcWTWjpqA7DrGDuMry8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658309; c=relaxed/simple;
	bh=imspMyYY4nhHieMW+i2YWT+PHBtT/L1W+xnPfAEbQV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQWGsTX+nyWo8ISvzG3mrLmvXetvvqlQhvlLURaQ/xqhQyQC47MycjZIGy0XRA8eZNiOysp91T/rTGgotuB/H9t8lkrdrFypAt/ljSd9ot36mRo9tSbzY1YUu+5OnaoLC5OSTeqggG+BK0XmdUG80XVfULm4lVJLsbagX+U3YNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXv5O6Cl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ip+S6n+U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXv5O6Cl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ip+S6n+U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjhmW1307404
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TLtcp0wixH48sKhqM64EmYF4
	YUT8W87TUrM3wZuG6iM=; b=SXv5O6Cl2yYepZ0v8R3j/AMUwUZ8lqh9vpjH3AKa
	NswxsxSv274sO3fYBgpEb6SdHI8WGU+AkObOa8LHMIjihBcRpi/jZnBt6V9y7Flu
	/GTeFeWaNyTVhI36R/6ESMpvjLgKnlmV6lJjdICovPqmkjYaEUIHFFrS/ZatKZmg
	7ZA87+bk/v703x54xXgDdf0Z4EBwVNdyQkdqeLZC97ljrvxFrsL5872EM5+hR4t9
	ed21bzrKIOq6Y01HLhUWk9wluybvvgxCXQYfLBKTqdnaGlrZRCeCuncGPwMHm7Iw
	5d26QeUKxcAqzQbqvXXIKDkYCkMNr7UobsHoBYUCB6bEFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra9uhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:18:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so18409891cf.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658296; x=1790263096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLtcp0wixH48sKhqM64EmYF4YUT8W87TUrM3wZuG6iM=;
        b=Ip+S6n+U9AMHch9POikqM10NcK5AzRsNy+DbmCGdksm0NYV97UL5KY9WJ6bXNzOtT2
         59tFVjBt+qLh7DVj3iASUghdn4hEoP3SfPCIsm29yAM19t96jBayvHDBz08EJbMYJUSQ
         sRQdcBfDzGFAuX21i3KBpCcGJlk6hd2LEiekg+XIrl3jucOFtv7FH/ZbDytF1TC88sRh
         x5HA6FNFNi8bE37GIEKjDKfSAeaC8XbRRJreG4hlDnxPTuyA0JJmnKFDEt9QikrRggo3
         /M9T3G/ty/IuLzs2Xfrz8ow5smURrk2QW+q6XfhLfKeG2P3O83ynZ/JbxEkZiXdjkMI3
         oP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658296; x=1790263096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLtcp0wixH48sKhqM64EmYF4YUT8W87TUrM3wZuG6iM=;
        b=xsE2RySRwF7zuzRjwkeRxHdBxHkuOtJpwEM/bUup7+mZ9eM7IemPxhM+qj+vlcF93s
         aEr54IKgVSfIN7k/MsLDpzuf64JXRXH0m+1JuO3BTZmRE3REvlKe82VDmR5OkVg5fuau
         qnYVieCUjQonzZsWsQi7vS1FWoDTbD4nt/t1M+7GRyBn/s5488oXrMamBdrw1ZM9TaqV
         bF6KaObLRPnJcFdGV6bAj6tDQcwcJ06vw7RPQOwVGepjO3JUxoc7dbMoG/4v6iWpqaWO
         oX6nTO5tJbszfl41KRBNujZ+74OmMn/2aI7ELCu8IkZc0/cLUKLnHskQnSuLECjHegA8
         6YZg==
X-Forwarded-Encrypted: i=1; AKwUvByDOe80MBaRnbJkf8QBdm3BvpHmGCHq/Gp9+r1QvLYo+elKhNGgqS2rnJ3OgmMtYD7L5RcvigsG7Vh9@vger.kernel.org
X-Gm-Message-State: AFuF++n6mTCNv0zjrX7R+8gd0X8Ms9QbPKSiw2s4I76LlW74V/6+cSPc
	d+D0r24wHPaI2XfJ2muq3NW4AKaLfIJr7fmqWKUY8ICeayyY37B0Wq6fRC7WE0B3P3Y/XuZItql
	/8McnKYmctPE+KaiqObD6Fi/E2+kF++efug7JaFzPYGRCKjEwMQiabiv7mwRjg1LM
X-Gm-Gg: AYBFou0z7bjnGz/8Ae7l2QfgJ0M4Izzk8nxgbgFI0t4vhDs3D47Fy3YcH5sIjH3Qs5D
	3RHGC48gXDNfz5kOGYq6DrOP3+9eYZVyAI/CCOudCUlzGwCn9cgaPTIrZj6UUgGByyrnsgca5rb
	RixJW3plXpVO0KFM1hnKzIMBrqmE545WlLnML815AB6Nv5LPYR/cB9eHJfu9PzgtNRhqGnQH1UH
	AUScS3Ipr0kBdA44bWXWXQ2Buk2pi+AMhlb8WnSOPk8u5bwrL99Bqex5oqmPyyrN5wPRkvJjzDW
	ByZJBChsz7/PwcnDX9Xrp4XKqkN/FXqCeLUsFtyxhxqsprasfkHzBj1As7h7q2b2B7LcB35sCJ8
	n4E/J5oMUJS1zxw==
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12692786d6.57.1789658295751;
        Thu, 17 Sep 2026 08:18:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12691686d6.57.1789658295146;
        Thu, 17 Sep 2026 08:18:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1ce79csm95692495e9.0.2026.09.17.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:18:14 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:18:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 10/15] arm64: dts: qcom: sm8450: Move PCIe phy and
 GPIOs to root port node
Message-ID: <ixtoau7tae5ee73m4zspgbmjlairlfkw3amirufvkrvq4wbitw@yhbpk73z43he>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-10-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-10-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX2Z2AGciO3Xvv
 pFr4Bw9G8HbffzsfZHt8Bs1Skj8TGU8oD1wuzri/Zsobi7c6NRGtkXcyQqdoyMwWglmaadZjYJA
 y0mxoGOh52PzdXJSPW+MvZcFusseM7A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX9EHoakftY+P9
 52vmfcHE3QrqJfgF83RXsrRcztLhNx9fsy6JWBFP/s5kO0CNtjtUoYOojw26qYLPp9jXuIlHDYL
 Wodx7VR/Be8EcAiaTl3c1FsWiSMSNWjLnP4EgHd8llBBPEnlTYToaE0MFtwYaSxx/a35E1VPa/L
 YaREY+Ia9pFFzzdtFAZFu0z+YfR1G1u2+Aq1hQN7WYPkHCO4aWBVik/78LalE/yeSQsdDgNL8Db
 YvabqH5EdxbA2B/hJ8c/5HsL/rolmi0/cTfJn4W9QKScfsnur/27nFyloH57oqz6LLBeImDQsh+
 fEineC8b1YesiGcj5NbhRAPnO7MDUBHSsMooJo4bmLFxtEQmkjvIqScZ4hot7FuB0OBI/KsBrqE
 mxrmc2rfT1So+/3sATUqY7ryREyM9e+m/MV7O57nAovWbubl5snSaOowN7mC971HgAU2m7o2VKE
 FG5zOXwX47mFX2P14sQ==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac04b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tc6zKZNveC6fAoCGgUwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3qMwiN9wV4RgBTgLjurDahtBZcmA4IVB
X-Proofpoint-ORIG-GUID: 3qMwiN9wV4RgBTgLjurDahtBZcmA4IVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:24, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0, allowing board-level overrides. Rename perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

One nit below, the rest looks good:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 7bc5f85e7ebc..05e852ed7995 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2017,12 +2017,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  
>  			power-domains = <&gcc PCIE_0_GDSC>;
>  
> -			phys = <&pcie0_phy>;
> -			phy-names = "pciephy";
> -
> -			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> -			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
> -
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pcie0_default_state>;
>  
> @@ -2063,6 +2057,10 @@ pcieport0: pcie@0 {
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
>  
> +				phys = <&pcie0_phy>;

Nit: If you respin, put a blank line here. Same for other places in this
patchset.

> +				reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +				wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
> +
