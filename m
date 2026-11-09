Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213809;
	b=5HAmUdPZPv0z0mJ/LDq0beb+iq3odKL8rXeulB3F2qo4exnHCgE6fa01tsJ/LdLAakTV
	 S8rN0XBRYELGeuI+ClnIlmFhhO4RcmoktszDZ5vrUJKpHzfuOgir8BbmHMtVYg2TExXoc
	 sAYqs0AHZsWcuQZ+vJuvZtutqbFimdxUgWZRJIYQdEVUV3Z0BGQPBL9Sldp/MbUc/u9Ys
	 qIQqER1bfH3Sh4ENeRPnNLUEEPlm2T7vnoI7a88Kn7wEhybbgJ92VApl1W0UZS0+yzZah
	 E8WdER66G+C+IeGHYsQoB9uiCZmLpGyIuRoQ4P5p5T4oXlHsyiPMFA9nMWRSOXqx4jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e+emj+6qiNrOat6TM8hv2pRrM0n+mR0YQ4yCLVvt6qk=;
	b=orJ7B0wDfkKUR7vTIcxSpZQDlqJhnADKBeSk8+LIGzBAYtScul0pZMhndYGSHz2NqxSq
	 AOd7IKgRZJMs7Bf9ZSI9cM+chu+Vn6j7oDP5DP8RO9IcvW/uSOsurwh7mpfRIv7EIjRdt
	 kdQCzjarrBl4zAqBQApkivBqzabX72FXLIFW11yZcW5QJXkCTpnrAAyf33g8rmevV3XQE
	 As1xf2BBznbTTU17ckXWQJykXgC9l1DhBgHu2PITCUnTOOkXBDLkTCpnpj69uDOOuxkrB
	 BIDJSpoVXLcRqi571VsNo7BWxbZSH1hV9AUIWmO3Xkm0r/bFeb1i2ZZ37FzZNiaO8Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOfghSB0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrQEXIHt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1F9606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOfghSB0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrQEXIHt
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A98w3634458
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e+emj+6qiNrOat6TM8hv2pRr
	M0n+mR0YQ4yCLVvt6qk=; b=GOfghSB0/R60EzbDLySz6wvf+BFuGwqObvUm/K1B
	jjtXCbBTpoPoGnz4urnxpY4KQPwKrKeNKzzzuhMNFjnRRwIP5fbNJbNUPxsuX0yN
	LbU8HCjYzOUJ1BHRQgeddyUjwCE/GEcCbs/cuUQLJtmrgmbfUSoW6/uUTQfuGJwG
	N9/vjz+8AJQnQP9IrC7toRsMMuUOuEB1kziydvF7UzIJ0SCguBrXgoXSnBW6ODxC
	2E4omYL+JZTEktsv45YeL/oa04f5We2TZXeTfC54cHC8gn7TwtxZ9tgdSjnqrJES
	ySaf11LBx21aUbSKeLmsJkdTVgrUrysoiXlBJWvaHlEFmA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2gumx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:43:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so1164202eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213807; x=1794818607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e+emj+6qiNrOat6TM8hv2pRrM0n+mR0YQ4yCLVvt6qk=;
        b=MrQEXIHtZKClR55jtt83FOeFas7Mkczfn507RQUbBimJc2NHuAIcizsmlYZIv3+Dh0
         5iX44Yk5BbvJfDwrwF2oP9yq+kCcG9zVnoPiUMKKxnPpTBRSvRBHlHfe8LT0TFdUXIls
         tFeb6zDIwBaOtrxms+W42SVqhbYdABuCM8Q5MShUk3FqSWUmIp8+O2ya/wMA2PsrESzx
         anyxjhXyeSoxKb3hno77dNYftdZvmX/6yfoxn0RMwkr85dp5c/EOQr7OcNaliWx0+xrj
         02D9qWq78udH7taFc3pg/iYcj5QlmHfHz+sAU5qgqK8T6qWLQgtBxITUElM4MxEQz0GR
         SiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213807; x=1794818607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+emj+6qiNrOat6TM8hv2pRrM0n+mR0YQ4yCLVvt6qk=;
        b=dB8mwKAy8CtI5zCxwm8e05mxs01n3PYwK+2GhdWBL1zDKxoTjYKRHbrOTaFqvu417p
         TOpIZAKjwzE1qmFTCij8EvvsgnGGmxdHEgsjrUeNoYU/rl8i5qdb+H4njFN7JNXOSxKR
         TQO3V/v3A/trpiN8+FilHFBPZH/22lYLheoZAzZ9+j74rKxA4v5ePkg0ElClsUY5HT+7
         +bzy0BWm0yvgcv/RSXnweVHrxqNCXInccTiMz4QQlwOu4ITXeM8FXH6WLY8ltRQ47l5Y
         Oc6qXf1Z6W0kj9aGWi6YNmiqAgVtG+OET01UyObilNdLxHWKRjHfP7uzC5vkCaNyFpwt
         U3EA==
X-Forwarded-Encrypted: i=1; AL+hErHH3i5RIYFLxohHH1Of6UzGv6+u5sL0RVWNFaXwUL0CVvYoDRZZn91CTWnpwDKOdsChcmXWs45jo+Kp@vger.kernel.org
X-Gm-Message-State: APuU4Z+egB/XPUu4T3ZpRDLBgAu+cNzKS3KaoU9vkjhbDpZXy65Y8iQ+
	45cpzonqJeKfLIg+NPBVsNvCcdmT5MWoaYKaNSCixRYZfE1B5jqxGr+BJvcHnU5TISXhVoNAKGh
	QA9jwfcyxmrRErNKgMDumTVuWHFtfqO+woOPC3s+M0+Lo5oIEgE0Kr4xBdo/JPSJk
X-Gm-Gg: AYBFou2qe4ydHWPrA+5W/yoTairgy8t7F7Msod/05jj8Enb0Cl+4GIJw6n3bSIIXnV6
	yDlbc4S6DuxqLMZxHPrmkgkfVFj9CYsRleRO+GNILZkLSSdU7M2tQu6uPaLe2YRUWaNSpcJZAHw
	isAAncRTE5VQEjcnBY4hQ1bU7QK3VKe6aOz2OzkH0wZGDEWEbKBJBo2C7PTmWwGRu58vkddqY0y
	XPTnE0PFP/1q0q6uy/Y9myIWWc4UZLt97kFhNSEfDsUtQLoM9yR7KxmBmRzJ/iFC+3R6Tb3HBq8
	W54aXHY66M/f4nQGuluEmWFUY/GJ3NO3hXw9UiJqHWnJGbLatJ0COxsykxoyLfIpg0179UY0QbJ
	hgnNBK1GmSsB2AVzHW3XmP/0QzBV4xl91KMxg/0Gnkf7XJYmYckx+YJHO0ZcgQHtccFq4Y1RaQX
	VVBMtk9Cch4YbIpw==
X-Received: by 2002:a05:693c:864b:10b0:36e:c213:e03a with SMTP id 5a478bee46e88-372573d242amr7233342eec.10.1794213806920;
        Mon, 09 Nov 2026 00:43:26 -0800 (PST)
X-Received: by 2002:a05:693c:864b:10b0:36e:c213:e03a with SMTP id 5a478bee46e88-372573d242amr7233312eec.10.1794213806393;
        Mon, 09 Nov 2026 00:43:26 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265d05514sm11077499eec.15.2026.11.09.00.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:26 -0800 (PST)
Date: Mon, 9 Nov 2026 16:43:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: nord: Add support for TSCSS
 node
Message-ID: <avGHpvYV2Q6T3vwd@QCOM-aGQu4IUr3Y>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af187b0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Fam-3tgAAb8rIOWbl-AA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX3KHbIk5qdT05
 36dWKQs1uJyywpdwaACLdSlxIvgz1sDHnf55QldgQ5V4EABTyVsrcTm+DcChwR+VwaLU6FueJNX
 3qqu4ugWGkRS10FpfbrdVrlXJJ1BrlLMTAUKGeoccPdmC0eZNy1TkomuLhvYqqIozlnUbKS92XE
 A9mLtsZsKUQF8NASZW4k2Cx1UiRjP2VLlilTE/oLsqbG9URWh8N85h2wvzo7I/d+PyR9LJT/osa
 0TgkBC+bqn0nP7dSJAXm0SDKWhkUyRwsD3KCrr+50ZWhr5FCcWqD7Y0cCagSdFY2VWBR+N/tmyl
 fwtAzzJH0g+tI3spn+Uqp/NPssStkN1iorgjB5ykwSDRREEhy2jnseD0tlJBGEyFrnBe483/eDF
 2Ktql5ELJ+i/jIpw/IOf12K+K2uUR9q3Kbj2YqIm9jFHUVe2VB9u/RQ0CSwZiNBgbt45LIsvpSA
 jMohDkBevmfHPXdRCcg==
X-Proofpoint-GUID: m-b_cNyxGzqwRmVdy4idtw0izj9XkzOG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX7Wq1hbUSPtsz
 K46dgN/BPVNxr7GzQMkqxdJUkY4/aS2GLQIxeKnw6jJhLIVWlwdO3eSzwvXT1jZo6olV7fBaZ+b
 C+rTxqLoWkI8GaUn6BvFI6Ve0yfcs20=
X-Proofpoint-ORIG-GUID: m-b_cNyxGzqwRmVdy4idtw0izj9XkzOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On Sun, Nov 08, 2026 at 06:48:31PM +0530, Imran Shaik wrote:
> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Nord
> SoCs.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 1ab7d9bc3cfe..1d5f27336f73 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -736,6 +736,20 @@ pcie_data_inbound: interconnect@1c00000 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	ptp@1c80000 {
> +		compatible = "qcom,nord-tscss";
> +		reg = <0x0 0x01c80000 0x0 0x2000>;
> +		reg-names = "tsc";

The node should probably go to nord.dtsi with nord-embedded.dtsi
supplementing Embedded specific resources like clocks.

Shawn

> +
> +		clocks = <&segcc SE_GCC_TSCSS_AHB_CLK>,
> +			 <&segcc SE_GCC_TSCSS_CNTR_CLK>,
> +			 <&segcc SE_GCC_TSCSS_ETU_CLK>;
> +		clock-names = "ahb", "cntr", "etu";
> +
> +		assigned-clocks = <&segcc SE_GCC_TSCSS_CNTR_CLK>;
> +		assigned-clock-rates = <250000000>;
> +	};
> +
>  	ufs_mem_phy: phy@1d40000 {
>  		compatible = "qcom,nord-qmp-ufs-phy",
>  			     "qcom,sm8650-qmp-ufs-phy";
> 
> -- 
> 2.34.1
> 
> 
