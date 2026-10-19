Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255FB38A717
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391694; cv=none; b=KVvchlZRrUNraGIjB1vDYNuf6jZva3SLR/ycnnd4RPCurf1LIrYffwQnCACaPQb4KYeG+/ju1okyMV7SNDRDE+fE3sxepbDYrEGooi/4PbaZ8CK0n8G5Xm9wZrOUf9cMd/cvZNucn7XPMfCupYp4PPr9+BLDYpxJmk4lzC3kYvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391694; c=relaxed/simple;
	bh=1IJqdGAT5GAmB7UZNuX5AxLdMeysnzLzok6aMDAAsWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbyaTUtFmaEFMc+iow8kvgmmYF0Gsm0swgnzY8UZjq+Cx7LGLzGqh/6lBg82LoQbcbrQadne9cqJt41cyWwoNOeDMuM2PG4nzvFfGSPUMpfvDYxvBDIPdWHw8mLGgCQH9+lzkhd/3XDfDkWwX8LpvCtF6thmS0fir0UaLa/qWoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iv7DbND0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eeaZBcmM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iv7DbND0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eeaZBcmM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j2eR1702371
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2T1EQUQSc0u5nsya0qZmBiox
	ywueDant7kGXbt0m/3A=; b=iv7DbND0nR4xxddVNB4e0tG0mXiYEWbYogY7LmBg
	kdi0MNTsOSCO7jmiySTiajsXW40LYxa/MJDd1l6rvn9Mq/6YKZprLzuXjw7j/ff6
	YsNxhuMU9TMtuvHVtQgnmJA1AdRcFiXPDbHgtsPOvpsLbKO088TNqxaWWlyofqwj
	WS6aJHusDlG32eQqX7dTpIFehdDozLs+M86cfglxkktn1u1lMVqOIaXs7atL8KW5
	P4aljZb5sj7agy0T2odaehoP3R/WjHqk8wkZDzpm/hw3Zh5r10o+2zU9aldnNShz
	x6K8kDD46StLcGUoQZSb97l0hEobF5DxG6rtsbIXye9ElA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w19b4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:34:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso4052605eec.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792391691; x=1792996491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T1EQUQSc0u5nsya0qZmBioxywueDant7kGXbt0m/3A=;
        b=eeaZBcmMHGKbJnzmwuMMmrzbOdgv4PoCW2yAmcH7Vstat5T2SaTiV7NmgxiwjwEAK7
         e2ZzUI6Px6DD2gD4yCHJcMwUG24V3x/EmX8huP38jk+0uhPyj8Ysin5NWdMqVEfl4lfB
         9Zc+CCHTh7Gefs3i8LcpUpx5YKpcBLJPKvHvX57vDfILMYSEMnrXFNykbhkUNbGz8a/K
         VeV8MsxrTPljp7GTAeGG4FmFGWzm16ByAFAVwKiH3gosCoMRnKwG5bXiRv5nh6wJKwke
         mpvlxnWqQAlZ5ymAtrto7apoaD/J+IxU5L1jwQmANYkZq+U/wTx3XSBm68BbYazOv+y8
         VMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391691; x=1792996491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T1EQUQSc0u5nsya0qZmBioxywueDant7kGXbt0m/3A=;
        b=NQV6jyiDZp62YOX4YX4p7eKDX+BGkI02P6AHCTAyMbZzPtEltUoCL7dTgm4wEM3a84
         5XLO0y4roURKKUlI8kJnPEpwNgvFvdZowimDyJVLeQTKK66umYNrDVj+lmnxUQ4F6FqE
         3KgsHgrp2sRmi+/ZQ993eHTr7SLYNmiMpcMA71zXfP4tQ8OEXDVxQu4L+R9Dw4TFSu85
         NwqncxfxBn+/igOzELIEVWPFQIOL9JmQjlPHGsMb1sobeOr6YclTmlaSbVF7cS3UgXPt
         s4xM/QENdRJasEWrJdYgHTad7EAxosfH76x4Pv6xrovsVH9Kwj13iWnurua/v+rapDi6
         o7FA==
X-Forwarded-Encrypted: i=1; AKwUvByUdD1kN/wUu8Av7+JNvsXsgH15bCizPb1kMACzCExKWL1rx0BE5KzA7I6rQF5wEFjWEJmNvEtomBr3@vger.kernel.org
X-Gm-Message-State: AFq9FYKZYZXmDPKOqBcajmoLJnqL+hp0Sym+BfNmI9ZAx9nzwKQ0xD7d
	nO63hH6JLSRJ2a8fzC2lIaxzXz3jp7J2Luz2JGRkSdj5TKBTlRJjqy5/HRZHsA3vtwSlGwIRuFR
	lY2mEYbq9eUaPRnuMX6dW3RHoKEDTrG9g3GuRkwQDTNbxjyObSlwZ+3j/ZDxpsI3c
X-Gm-Gg: AYBFou1PT3MZf/QgHx7FyV9alv/wG1aCIMez5KngMutxdaRu+fJVRgQgEcmtBK8qngl
	GglejNRwwXTNnewenqUATVhFPvaJ2apYfHKOMmGSfXJjzPN4f1UtYiM5cJJnIhKQY23ttdcgxlG
	n/6+0BYrl3tdnSF4jflOtq7PA4X3Is6bNDt6qmTHWcLdl8Gg24zgHP9+WKZ2bj/ujQJneo5F7a5
	Lf22s2fFhF8OwAkNxjthOT7heT9nUyX/LD8A74qNroIinh7N4Ve0KS3HDFOgnna9QRnIzu2u+TQ
	4NriyX9SrkqAdWzXx5dh4Nr/5TT6WmrfOhgfG6kY+ezDSlvV5CkgTxTTMd8Uf/eUqaTNn5cx58R
	uyqV/MtACvQvDjx8uBno7N8HBS3Gu7EMvmISkQwUVlg==
X-Received: by 2002:a05:693c:638e:20b0:351:7416:5f28 with SMTP id 5a478bee46e88-361a2b3823cmr10286396eec.27.1792391690851;
        Sun, 18 Oct 2026 23:34:50 -0700 (PDT)
X-Received: by 2002:a05:693c:638e:20b0:351:7416:5f28 with SMTP id 5a478bee46e88-361a2b3823cmr10286360eec.27.1792391690286;
        Sun, 18 Oct 2026 23:34:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm31965017eec.17.2026.10.18.23.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:34:49 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:34:44 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
Message-ID: <atW6BKKehHJTbGOn@QCOM-aGQu4IUr3Y>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
 <20261018-nord-soccp-dt-v2-1-4d713d316e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018-nord-soccp-dt-v2-1-4d713d316e9d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNSBTYWx0ZWRfX+6SbUk9shnWs
 TkjMXLqg//9u67pYW2W5MlGa77HvJ1rtK6D0INGsF/cYn8DADpvD149eSbqPCyQAsbVxCQ1yrZa
 7wfKsMHX+gwyJCRZkxJqai9Gtv7Hz0M=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5ba0c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xj_BYBr4Vzi4k05siB4A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNSBTYWx0ZWRfX/28ZTghmX5Jz
 YN38T5e2kMoCrgrD9Qa0JX7/hRT6hkvkvP6PeWds+++5dlONCTy0t2C4rcoPo37UxpkJYfyvfuc
 Bp4NyjbVnpH4Cdtyns4RRDITpZ18D+7m+kYdJolAycfuB9WxuHdrcU5swJVAZ9+hNUgnFBe/kWB
 kZQ/J6YoVyJZIlb5w+H8Oot9vxWsFUOm5i96x6G6pypt6Fo3OcVJQwXH4SVLNAbhZB/uV5rOxhP
 2PHMF093Tg//mSb+LkrLzn2sBIHt1XSV3itE12C5DS604i8dScYakL9rBlID3XT0gNa7ZN0cOlK
 IHQ7aNYVBhrbynYxeqS+YqTqaqnpeFeSFnNN+/JhS3LKarlysFd/f/GfDcAngMw7z9gvLGX4Us6
 nkUvVM5pUnM1HC22lDbmZJUy1/HMi43AaUY1xldsiIQm995+vc2TkTdR4g3Fg/X6jNp4rWXcQPU
 6NelOyKe7UkTyOUxPoA==
X-Proofpoint-ORIG-GUID: PREM76UeW6TB-8dJ6r8TKk9JGgA5a_BK
X-Proofpoint-GUID: PREM76UeW6TB-8dJ6r8TKk9JGgA5a_BK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190025

On Sun, Oct 18, 2026 at 12:46:46PM +0530, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  9 +++++
>  arch/arm64/boot/dts/qcom/nord.dtsi          | 57 +++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 6dc4c871f41e..e21b9ba480f5 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -430,6 +430,15 @@ &remoteproc_cdsp3 {
>  			     "nsp";
>  };
>  
> +&remoteproc_soccp {
> +	clocks = <&rpmhcc RPMH_CXO_CLK>;
> +	clock-names = "xo";
> +	power-domains = <&rpmhpd RPMHPD_CX>,
> +			<&rpmhpd RPMHPD_MX>;
> +	power-domain-names = "cx",
> +			     "mx";
> +};
> +
>  &spi0 {
>  	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
>  	clock-names = "se";
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index dfbbaf94a7ae..827531fc1276 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
>  		};
>  	};
>  
> +	smp2p-soccp {
> +		compatible = "qcom,smp2p";
> +		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
> +					      IPCC_MPROC_SIGNAL_SMP2P
> +					      IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
> +		qcom,smem = <617>, <616>;
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <19>;
> +
> +		smp2p_soccp_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_soccp_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -1587,6 +1609,41 @@ uart13: serial@a98000 {
>  			};
>  		};
>  
> +		remoteproc_soccp: remoteproc@d00000 {
> +			compatible = "qcom,nord-soccp-pas";

It causes CHECK_DTBS complaints for nord-ride.dtb, so we may want to move
the compatible to nord-embedded.dtsi.

Shawn

> +			reg = <0x0 0x00d00000 0x0 0x200000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack",
> +					  "pong";
> +
> +			memory-region = <&soccp_mem>;
> +
> +			qcom,smem-states = <&smp2p_soccp_out 0>,
> +					   <&smp2p_soccp_out 8>;
> +			qcom,smem-state-names = "stop",
> +						"ping";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
> +							      IPCC_MPROC_SIGNAL_GLINK_QMP
> +							      IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
> +						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +				qcom,remote-pid = <19>;
> +				label = "soccp";
> +			};
> +		};
> +
>  		rng: rng@10c3000 {
>  			compatible = "qcom,nord-trng",
>  				     "qcom,trng";
> 
> -- 
> 2.43.0
> 
