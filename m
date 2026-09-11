Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B223D45D90A
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113559; cv=none; b=nC753kqpK3xcCqMoqBuQi7ehF2MyCQXwP8x6md0nx+sp0nGLf2ZxBXM7KZIyYhxursdXO6dV7qcTmocmfJ09OB/eFY/PlgVXqKC4oGQH/WrsyGNLEtkYbqAjaxqeImsKOi/nYNp7EFOvSo0rBAN2PZ7AokDpiBp2WZKCkRBU1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113559; c=relaxed/simple;
	bh=wS+UZgMsfZshYLMMeKsNqXdGiAbQ2UhFZFFve51dv4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHZwkVq/Ri8DhwSlixCe1q1X0p+c0RHcNgtMjvez7XVVwEJdJrR6qfCN4ZAYHY0srPqhmWyzgiyZ/eGzov1PFTaOS0z+tzyIaxCGi0QnvFiWpKIdkQPC4EyF3kJlV0zEB/n+QHhSmy5WmRJueAQOMUyDKxe2O2MzI5j+Oe2/cw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KggMcM+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9ju7RUM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KggMcM+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9ju7RUM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kkT63366331
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ev/gSonR3enDh7oNOrxayRO0
	dQ7G3IRgYUf6IT1P+vc=; b=KggMcM+QYPgQmdVELOJAHyfwY8HdlXCXNd8IeRaz
	yogAQfN+1FoRF80rf7ZN7XR+qxQqndoENveRX0jtkPiBoxBag0/4T54FP3ERWJpU
	wdbZXVPltW8WQHd4JkkrxsHXw8WE7pYrXpNkFsFJ7fcpEexczoMXVl9QHqcpa4wl
	Gxo6IsZfQV7hlVGXN8vwwFzaFLXyzeZe7uVhBx7+b26hvJCF46yeoEv89nv+5Mgq
	eV0Up1iaOFvvo3/bO8Azz0QmfemSDHQPFR5tFrC+LpjprPLOLWfKKAzL3IaR9YjK
	dJ8JxTRr9GodTWGIf22AQYka2Lr7GySSl5Maf/tDQ7TE4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2arkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:59:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso85902985a.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 00:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113556; x=1789718356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ev/gSonR3enDh7oNOrxayRO0dQ7G3IRgYUf6IT1P+vc=;
        b=P9ju7RUM9WlrLAcI2+igDLYDS2hq4uGHip4kb3nnzuQlhyTq2URkHLzqqu+H9LfTvo
         0uNY/ELLfWIViXbo0kfH8f4FysyHgh89YJD1L289OLzN+HVN7s2pI/Cp3gLQd48SobTv
         KW2p8cud/vciqbXnR/IWT0dB14kr11ZGnfjeIHX+FUmB1jI/yfPzHAKU9A64YU8sCjVU
         vd1V9FX8Mlg8N2tbVM2AETaXqeku2J+6tv5yL6AI3HajBU9yLqukbdWxnNx7Eiu+AKKi
         wUyFvYd5nUbxEvI6F1+rDELFQSIvYgkwcN9GK620Q03o9yKVh8eg3VwEc7ujoluDA49G
         aiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113556; x=1789718356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ev/gSonR3enDh7oNOrxayRO0dQ7G3IRgYUf6IT1P+vc=;
        b=an/RzdRD54bWCDxFEp9nAPEt2TfHCUuGWAaOcTOjON0Xn+hHP8Uw8HjylWoDyoXHfC
         trsC7FXTATTV1+XpgBfk+++SSOIl4vOBJbysIz03Jj5KGVqfKpvUpyhYS7qxqMlHzw7G
         TAmVdv34o6PKwzVIG2dJ+RiZOuJD+rbrxicO/xiVcAn20Vr+GI/mfKmPTHImhnwBEFU9
         3VhMKtmRQqw2mTuyNR8VYwLBlKhoEFP8GLIvfjFyAT2SnCDYH7zK+McGl6FELseLWFOd
         MplsK3Rb3EIuwE2zy+kSrBqR8JH174KcA4digq94ciyrpu+yp6X7ZTaccLI5rjR5g5MR
         w7GQ==
X-Forwarded-Encrypted: i=1; AKwUvBztL7RENO9V65VBCynMmQoAoAiOf6zOKIfRJA7lqOx0pTPX0RWgGmL877FFFKZ50rsSsnnVNUqaza+m@vger.kernel.org
X-Gm-Message-State: AFuF++mJBtFt08zTai40/DVmYtfITN2ZhmWYweXz1L3dQ+pt+XStui6b
	sMGBMt9DFEW+bIWCoEC9WiIpfw3magXBmQGXxerKnbZO2TwtpImMQDodMJQDP8ef8bXu97PJGy2
	u6xQA0tj219oMULRbLBxDJbMGATElPJFyqAV8S4MkeKy2zv3XU+LdT/l6eGSzR0iP
X-Gm-Gg: AYBFou1kFMn39s4z7ogNoPiI3n+DSgAuOAg8Z/rGhoB5UUZSl32PA6EX/wprHlxCBDD
	4G381yQkqMs7ntx6GkYIYfF3FEQDHA+++4SNd0ayM3ury+eIg19D1ULZxspPkrIZEZWOkAQxWCr
	qa/jjo0gGvRZUoNyiusXmuVCFuR9gqAu4eU/J2HQhe0EkCuJ9h8iQNWlS2eIfILx1RyRVquBiyA
	THFOhJn4hywc7fEto7md156VmlT66NiO1N605qlhVpYtkx9tE8t4wGDDVh3gu2hbiCNAnd52ucf
	2WJWllm4Amoa6f8grS1Wt9+xxhpt1ux8ibd4u4i0ApFBvjcJVSxiToovgCwzeaTG9dAkW/ki/Tk
	+Y5gm51fXyliPyGM=
X-Received: by 2002:a05:620a:4546:b0:939:57ca:7e08 with SMTP id af79cd13be357-939ea037874mr369307685a.2.1789113555571;
        Fri, 11 Sep 2026 00:59:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:939:57ca:7e08 with SMTP id af79cd13be357-939ea037874mr369304685a.2.1789113555010;
        Fri, 11 Sep 2026 00:59:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm3681657f8f.35.2026.09.11.00.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:59:13 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:59:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: shikra: Enable USB controllers
 and primary Type-C support
Message-ID: <x2kka6ouwalb54bv4hxszoq2qdbctp3gx7qholeerxvbicrxwb@ww5rf7tnjaog>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
 <20260911-usb-shikra-v7-v8-3-851ee4bc0eec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-usb-shikra-v7-v8-3-851ee4bc0eec@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3b4d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pLJJDYdFoZai2w-5wMIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ksFl3QWVIT2YXYuN3HcRYQwGd1C_XpMn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfX24xZ5m2Osu98
 V92SZGXb0amO28qPy3HgqFDy0Zsb2VoWL+8/x/nE/qlXYvBn9uV21vuF0UI7NkVonVkLVM5j8a0
 ZCUF6YjtUJmtV/piV5JTMetpZ4i+pjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfX9EzFjMT4xSTB
 LoaJ96LPT9sPLLXN+7hRaZ/kZZ/sZgUCsx0oTbdT1HvqFHN9EVWEE9bbo17uDPWl39iWhwBIHEj
 voQmgLXaZXLUPTqvj8IJoPahx1p3dw8ia2wA3rj5hNXGWiefmGfuh3Hd7UcGflCGYAwSccE9hMK
 jUXwMO2oj4IXb9E3BXQ3sFB2CBrY97EmwNU7dWqDGyVUsIpGm4nEcnQXpxXOAZTjU4TDDpUGvGU
 mrJmJhi2lMF6so1Nlzd8HWiKe8Id0pZggRQq/PyQA5vcm1eOKjweoLzPMS1epd4vdFpcSwVXsFz
 pFJ6m8tUSJgDNFe1x20xjlGVYz0Zl0JIrsBZJpwgVMyW37SdCp4twq2Lo7Fbh/0ukdihDcvUaCB
 abwO+yyo5IWL/CdVUiXjfF6JVPIkwbnC18BHJy13BnT9JTuRF6/9I/nG0niDRBiZ3E/zWztHXgL
 i5vV7MoehP10z/jaGuA==
X-Proofpoint-ORIG-GUID: ksFl3QWVIT2YXYuN3HcRYQwGd1C_XpMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110110

On 26-09-11 11:37:20, Komal Bajaj wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Enable USB controller nodes across Shikra platform device trees and add
> primary Type-C controller wiring for CQM/CQS variants.
> 
> - Enable USB controller blocks for shikra-cqm-evk, shikra-cqs-evk
>   and shikra-iqs-evk
> - Add Type-C support on the primary controller for CQM/CQS boards,
>   including role-switch and connector integration
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 43 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 41 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 43 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 12 ++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 23 +++++++++++++++
>  5 files changed, 162 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index b112b21b1d79..286ea46d0c36 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,14 @@ chosen {
>  	};
>  };
>  
> +&pm4125_hs_in {
> +	remote-endpoint = <&usb_1_dwc3_hs>;
> +};
> +
> +&pm4125_ss_in {
> +	remote-endpoint = <&usb_qmpphy_out>;
> +};
> +
>  &remoteproc_cdsp {
>  	firmware-name = "qcom/shikra/cdsp.mbn";
>  
> @@ -57,3 +65,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "otg";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pm4125_hs_in>;
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&pm4125_l12>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&pm4125_l8>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy_out {
> +	remote-endpoint = <&pm4125_ss_in>;
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&pm4125_l12>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
> +
> +	status = "okay";
> +};

To keep alphabetical order, please move usb_2_hsphy above usb_qmpphy.

Same comment applies to other files.
