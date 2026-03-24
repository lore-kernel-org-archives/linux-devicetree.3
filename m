Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168E22798EA
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328710; cv=none; b=aIiWxX5O3qc1SAZv+excRlP4AWx5VJprmrk8K7raAFAPj2PpRn30nBLNsOSr+14Ubcno9a+kFNnTgnOzra34UaGiphlmGUaSnxWgx/pSZBHuj/8dlabL5JUmLDPXD/zCUnS6FreD/u2mBV9JN4gq7+64w2NBTwWrvs3Cd83nmyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328710; c=relaxed/simple;
	bh=zUwFFRo6geXN8Ov4xaFctP4dDiEmRc+oABVzzvyL9iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J27tdADMk0qQff+EIcx9F2jbHHnvtCT8UHHWhTVLx40HNBd+vkiZ8QvL8j80xsyvGsvWJt5mYlLn6kQThMHiUZy0daUfRbQS342AA4g1CMIO124YgKFMY5+rzMiX6+k3pxs7GcCKnJ3xAg1tzKJWVYE0j1lRde1MKqpm53q2LuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fruGyfzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNFJBc9j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fruGyfzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNFJBc9j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O42jZJ1762120
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTeMF/ACpsQkCMro0pibigi1s38+6dwcwFlwar3P+Es=; b=fruGyfzZf29dairQ
	2M0XVtjYu8JPt/kw/74vDB+PDI3MSQO4pouZgxlVf+Zqg9gAJfqtMAdDEELQeMh0
	hkaw08yiOPW+5y041u8dnBzaHdtjt7zkLom8hrFC4Y/6YJsfRVJPjahd2Mi/Mhen
	eYjfIvqgeIEtAtCNB+o8dhmzNOB3EVasOdZM9CaZf/wfCRJYFkIwdm39Smch3J0f
	7nWJI/IUeF5BYNV0m53SBmTX9FgqDcI6mJ4yJelWOqn3Y3j8yJ7qH2ehdj3AoUZw
	ORkPiDqbE9zLLolfwyDCK3KUBstQL3S0ixz9lL5Yp/7ucH4tdvrUK7H/tqNEYvHE
	brOemw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0avty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:05:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c245a88a5so1364923b3a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774328707; x=1774933507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTeMF/ACpsQkCMro0pibigi1s38+6dwcwFlwar3P+Es=;
        b=HNFJBc9jZHxUHTkZhYruZJMe8uv7uG9FpkK7hN1I4KXVPrX5ZgnHdIl8+TuVtzdnej
         /DxEnnEEw4zNvarrI5Hdo0Abw8lw4vs9iuTI5/YPjD7jPnABQl1Vrr+0/e85k7zz74IG
         pHMQub3teOFeOmJkfaJ8iJN+/n2KYP77+u53Y5BP25Ytm3L/8CPTjI9xB+FXjDK7K1w2
         KEDDiH+vmgfeVc1jUyjx4/ugMvYst9gei351tEemWL465K9ebutCkCXbpEZsQ/RJ44T7
         rHQroqfS0xjejzcmujMhWlPxJ9QBQdGOTpPgcPF3/NL1WC2bB/vOrcoxC2os3qtun0pV
         3DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774328707; x=1774933507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTeMF/ACpsQkCMro0pibigi1s38+6dwcwFlwar3P+Es=;
        b=Aw4wH6RQx2Q2CKXDSUlF4PS+2DesqRnacLrFfp+QOh+CojufGbJYi/aOsLKCdcGZX/
         3GnMs03ASxUKVy8wCq8tLg0c3qwlcrG7k0Wv3b0nPK9RmXnxTh02Tlo9NMKXmBp4r4A6
         vUYVr/QWZCiSjPVeMHBe5v/geOPTkgSrrPqO3/kB9lyPsbr+I4SiuazYt2GDTM/iIiLS
         U1whqi7HJeKyt2IWFNE487/WN8XtcBJoKv/Fzi0u0lxtOZP2qLQE1NZowT263t88GfE2
         5mGu0s+eaM2yuHbuPCP3CsqB39uaQ3RvLWvyNncZGS/8i1IkS+W1GrTIUQ1YtskmWOZk
         lg1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWued+D46ZRmAZmI2wAPFJzFUHf4Uzzk05OHwd0KWNai2JJlEGwIneysF6eZ7vNM8zwy2bJqjAGQ4Jc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk51UTg0wazi+53bm7wbcpQFtOrG7PWXsULnu8htJdXkdGXZzq
	h5RqxJ0fAP6K/baB2CHqN5zRMt5x1A3rtB+NoZw1rD6HhjK9Y01Tg4uIzUn1GqOlal4GOZkejas
	QT9yzuoxXRsIiq4V0AW0LZRoC1a+h7lVEGT3EMGV2xRVVBBaeQo5U0somJ1MHU4UA
X-Gm-Gg: ATEYQzycvdYU6KQJNMuv8XhuWhyIbapQdIq/7wklRp3Eb9mXGgjGxVq2VJ4nE+zhUTW
	6G9orQQ8T5QmuO99S/jaZdzwSpSrze0CD9lgLdRnvWWWlYgqXh38b5MjI9SfG6JDWR3w6LmO31v
	fQeCpHWB1qcVUVJ5bgu3WLciLBaasHRyQO+jxv5miRHtL96kLBm6Ar24M6bGVOxLtE5nP49uaxR
	5cIhf8U+BlcV+9Ba6YPDpsyRe7g2EkA/YgbNuhmksBe1WL0mDOnCXWd7v/PkIP/4KlXHQBdPkzN
	w0PAZlzctF+UiLOzWvD0Egp+tH4EesbtoNB2JDdwicPf6IPQOnrk+zyE7zyTc+sAYcW5oUpyIrH
	xnY91ugEjSAekeddE9O2YVnh1osxVSYPliCAZGn4p6bJ44GdMKBoE
X-Received: by 2002:a05:6a00:94db:b0:81c:717b:9d31 with SMTP id d2e1a72fcca58-82c5bd50708mr1805156b3a.2.1774328706904;
        Mon, 23 Mar 2026 22:05:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:94db:b0:81c:717b:9d31 with SMTP id d2e1a72fcca58-82c5bd50708mr1805139b3a.2.1774328706372;
        Mon, 23 Mar 2026 22:05:06 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa9fc6sm11517543b3a.7.2026.03.23.22.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:05:05 -0700 (PDT)
Message-ID: <328e25c9-0bee-48c0-bfdd-3161ff9ecc4f@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:34:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] arm64: dts: qcom: kaanapali: Add power-domain
 and iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-3-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-3-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c21b84 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WCIbC2r976qWEa8sWNEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: FbpDfsSZXQOTOpOjjx6OBhlfwW6G4Oeb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAzOSBTYWx0ZWRfX/8GaWSKiXFOj
 hM/NCzy1uBTcoaiP+cRX47CYeyRflsAxRXngknyrLTS87Jkjg0BK+xiBmRP0wqa0o0oUMFvUAuk
 TlgzTeqzBZHUn6KYs6hBIz3ck0j35oEAMIb1u7r7cofsPnBxAblndb4Cv02CK4zp5rkPSniLAM5
 s3WpOMO1r5XPBNmfPLOi/P7awZ1EgFa9TPGevEiMwQLHqtfW//K81JlbX6tDFhqVBDW+zRiyaE5
 7ZZWebA3eUC4UHkS0D1cEKH04CsJHfmV15ZGQ+AY+NxZpbVhJecmuW7V8HCve7Q6DBMvqZw/0Ye
 qzhLalX81X54rJf3Y4J90JiDAgzMaPxRvZ5Punukrp+RO5XxK5Iit1sLLhXSQoBUASzFn7d220c
 nKNyBdJHGvqPOoiWp7gj/bs2R8hrisgrrH8od8LcgSlYEg/q13U19Ow6Bpc/tU4YccsbqTGwEvs
 P7ycQfxe4OFfqe/P6XQ==
X-Proofpoint-GUID: FbpDfsSZXQOTOpOjjx6OBhlfwW6G4Oeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240039



On 3/23/2026 2:47 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> kaanapali.
> 
> Fixes: 2eeb5767d53f4 ("arm64: dts: qcom: Introduce Kaanapali SoC")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 9ef57ad0ca71..52af56e09168 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -868,7 +868,11 @@ ice: crypto@1d88000 {
>  				     "qcom,inline-crypto-engine";
>  			reg = <0x0 0x01d88000 0x0 0x18000>;
>  
> -			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>;
> +			clock-names = "core",
> +				      "iface";
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>  		};
>  
>  		tcsr_mutex: hwlock@1f40000 {
> 

-- 
Regards
Kuldeep

