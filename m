Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD73348CD5B
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726094; cv=none; b=RzVu6DGyT/AZnf1JJLV0ZV3Ztg1umIorku+Bkct7SDVxJuDddXKI/kl7tyo7SZkj+/NJ3c5IG6aSvJE+KI+SKYfKv45fE3U1L+9oz6tK+Ujcy/xlXJCVhyfLYByB8RtSOb+y9Ql3rF/KeuBuZkEQjYJg1rLNnh2alJrz3H6lmNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726094; c=relaxed/simple;
	bh=eUwC8be3/khvk7K9EDwCC8Xk3hI60FH649SuZD1y0Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEqAxkOPUSsTEpgx8Sp/oSyiUItMlijKV4Bfns1D/VpfMv/xl/ElHvj837MOIAMQlVrnLixfgHJYwJxg0CYGcKLjixddwX8jjip2bYV2akFe51sFBl1ndV1MCO9hVl5F1xNzeEAfKurnBpXe6AhnF9WxJ0F7y3jZuAcZbl3XfQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNtnWxV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFE36Wsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNtnWxV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFE36Wsc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dUYq250880
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rftdyrf6xASPZ8hDpl0qhQWdEVQN+JzzYAKQSW/8DxI=; b=hNtnWxV87HdL8Eh+
	FS18DA5FV/xRE7AttMjMglUDOVnMry6dk4Rofm8YVLa9Jx+JWnCLizAEeC3deAse
	BGpQCyqpIDJHnJl5H/brHRU6N2JN9zESachgxc+kgOvNLAAEjKqLT6aucMT40Wax
	62Kf26e2O5HKUU4p/9YuCc96BLSwBnuSXUfhdkBtKsSZ7uKlpG2qHAlEnslX569n
	St7OeIGKdYxhkOR65jNJDx0Y1AgdQWd9LM/AvGEoFE7w3xWjI/c/3AihUX0swRON
	7nhuifCzt+Hm3paPtkCPFj1F94/pDN69UfFaFQjZ63D450j4dXr380h6l93+NXDt
	8Tc/dQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2390asj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a399a12baso13195485a.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726091; x=1790330891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rftdyrf6xASPZ8hDpl0qhQWdEVQN+JzzYAKQSW/8DxI=;
        b=SFE36WscYTTAVmkesLeaZCWLuOrjjTd0Pd+wtH130Nfuo/WUTn+XQAiBchPw1AvPNr
         qVRvigEfrgcDHWvvRUc9zN0etcDEBWzM3iwwpMDiHtFrsOMHXw61zBR4FUXZEQwnJI7/
         5oURBE0V3JdnD4EQHoMKyZ91Jrl/Fc1btL8KEGhJ0/swY11jLIbw+tyXTHsPDM6Pi/hT
         /LiY1yYCazFUmdGyPRgAx8P1cOMH/3YN7kZhjq4aY2ZGMngIwdS1hY3wEAblRw2wVswO
         dFz3NwIkw3hrwRt4usjxQczRtTRGZb6uhHaAoQ+PpLk0lCYlVyg0cR6sOVo7WVM+bo8Q
         WZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726091; x=1790330891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rftdyrf6xASPZ8hDpl0qhQWdEVQN+JzzYAKQSW/8DxI=;
        b=mAProc4jC+s5+P0s7Da+LtyPGD6qyNNWxQsrweQXJR6wv4DeZnH0yCLyDrpnvNBaLo
         n6irYcTFowGSbvvd6hpxx29L/1lJjhC/GJ9VDJjGyEpo4DFlaGehtNcthYwIYgjUiK1e
         C6A0nZmtJIufVBPARjbUldMMFR6H7fVeqgoNC8PkcLJB/BcEeOYbPrdj7+qXV0MDMf+m
         /XeteOW8bgLeS3juupeinp2/y+zWJJbyk6huyLb1Yh/nlwEHq4DW4tsPA4u1/4oSTfv6
         jhigZc4J36KwYSMVXn5VqMa2r+bGBaCkMR9gFMQjc54UnV8zbMJOmwswfHUTmW+k2cAU
         oAvA==
X-Forwarded-Encrypted: i=1; AKwUvBzrJb2Z3gNYkQswlkOWe7TdUtZYxSwDhqzqAb0EbKeFsxnHATTlQiI4pVCWFLTNzxrwQl5K4jSCbnPH@vger.kernel.org
X-Gm-Message-State: AFuF++ntKHu9yqpM8Nf7a2eAnYVyNTIKtFryz9xE6I7eIYTHdWnT+dk3
	+9Y+4DyIabBtCnXkg92cpHAv369oj5LIDDaU4NdS63bxJVwBgUEBYx3tuz9olmweTFzyR3D3rXj
	NoP8JJdrdvfjpbSJBa3W1MRMOQvx8ZZIa2+Eq+bwws8Y7Xo89E2gqhvF1SCoFZaoG0KYHz6os
X-Gm-Gg: AYBFou1TIFBCDhsOyM3GkR5/ro7ei2NRYl4VAYzE93yVkzJq04uKju4jSz75WN1K1Of
	fFqE1LIwCJrmuX7tIGsTU15a3HMuzeNXM924oy+DK6eKtCQKe3EctWQs+Y1Q4sjmcqEAy/G+7wo
	pkfcFV/z0/uyYpn2t/mVLyaQrUuEBHsOu38hksyy/Tfypux7E+PsWmaEi+IFD9CQjlDTZEqFQlf
	piwPXMTtcw3xPXTQYLpJl8MvwaFiXSHO2+s4W4o0ygbgyE7NdnL/z6IaAwJYItOgfOlJxRgFVoh
	uRF4zKZprr3qnRcmzE/gvk+YBua3xLFilNO2JtuPRFpPXBE9FDSnUj8782ymXl5+W2FFdbAvRwm
	nPYjawCsWWBIxVoUxAE1eBQ==
X-Received: by 2002:a05:620a:2788:b0:939:eb09:4458 with SMTP id af79cd13be357-93be0583d65mr176542985a.3.1789726090963;
        Fri, 18 Sep 2026 03:08:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:939:eb09:4458 with SMTP id af79cd13be357-93be0583d65mr176538085a.3.1789726090524;
        Fri, 18 Sep 2026 03:08:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb46f0csm40611066b.32.2026.09.18.03.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:08:09 -0700 (PDT)
Message-ID: <35210bea-98e8-46f7-8b55-aafb7ad43eb8@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:08:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] arm64: dts: qcom: talos: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX/iiiPBhCR5vw
 TZbIEHLZDT2rfFJdS/DP0Ddbvb0uDq03LJ7iVCNK31uwI6noDN5RRv1DmvT4Pzvbvymq+yACILu
 puFu9EKwROwUAi7N6+NQW/LEgcFQDNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX5tGgJJmvD4TG
 ERCwlQUPC0+1in+FaZBd6qtsCU38RRtGeO4j3eYLFrOmP9vaowjVQsPCH4hndQk6FbqsPkBYxkI
 QTNoJsHWwrOvtZr+badLZu5cm6+8Ylv/Rro7B79EEwy2DsZ9/wKXK4S8YlFWh19qKHQyrrNAFfy
 NEdQP/Z2TW9eqTynvFCEPDoYmmvGXS3jCRkIL1MmauVO4ttUuo4cnw1oyY7SoydB/S+/gIN5IGA
 cete5S3IUpovtJMVk/7xXNZkG9UM/uoTeiF+l+Jn4PpTq+97rvw1jhCsF1+n4AyKTy9WiGZ+9+X
 HXpZ5cHJLWf/eeoZ3j5RC8ktUbSmbEj2cIHB6JzAm55rmsTITI3by5Ks3lL4khYmdJENscQbuih
 OrfbHP/6/iJTfQkQzU2AdyjSBiLAQInwNudxqjTzHqvll4HBBkeMf8344IcVu4IPUs3g5gC4TII
 gHs7p1LPqNoKvJMmsUQ==
X-Proofpoint-ORIG-GUID: -nsrKE4r1fAf1d8hUJ5D0cKEMlr3K2tj
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0d8b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fmVD6mvdgdatrdQPAe4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -nsrKE4r1fAf1d8hUJ5D0cKEMlr3K2tj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcie_port0, and
> move perst-gpios/wake-gpios from the &pcie controller overrides to the
> &pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 5 ++---
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 5 ++---
>  arch/arm64/boot/dts/qcom/talos.dtsi         | 8 ++++----
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 43f110ba3a7c..142dafb04324 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -444,9 +444,6 @@ &mdss_dsi0_phy {
>  };
>  
>  &pcie {
> -	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie_default_state>;
>  	pinctrl-names = "default";
>  
> @@ -461,6 +458,8 @@ &pcie_phy {
>  };
>  
>  &pcie_port0 {
> +	reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
>  	wifi@0 {

Please retain a \n between properties and subnodes 

Konrad
