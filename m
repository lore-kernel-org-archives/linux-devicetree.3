Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ECE456DF6
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141513; cv=none; b=M45HOfTxmOheOILcncEvnkGCFUYiKhY+lSaBzRp7tG5bn3Ivr2x7JwJatXKXZnc75af1l5xuWiAadO6ihX0Hw7oYs4g0XUwNEmDQR+ZNt3wgSxsAlosp946CNwCjKWVZlMUm8UO+lq/Q3bbtfs2kjwX0zaNVAjHaW1PwphSMRcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141513; c=relaxed/simple;
	bh=H5xZ8mFmtLkVBzBQ+LiUzga4F378YARs7W7NpO/xexg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2eww9kBXSkTlTlFdCOkKwXvUtnJJSjqoqZHl6o0ekZuGhnN21a68IkfDze30FXZ+k0OcDBSUdf6Q+M1vE2f1UbarAuSHbeEKkjUHeLYLj+QGY8RMoLMi4A/Al1FEzX0qxeKf/KTqFkaZCEcummZ4RnoHv36/x0cNknN0RW6Fc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyN1LG4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQr82lCF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyN1LG4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQr82lCF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m5J81465344
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ge49gEF8iI1j8v1IuSE0YY6g
	XRwf5wQGaOZV1jpGaYc=; b=KyN1LG4vStI9r8d0GvC9kxXwIBy3ZyFe0NhFO96S
	3wuz3RwOqF7qQgMxc3D//Ba6zw8D0JOhoW18cdNXHJtfr+EPI3U2AnPWTslyaf7b
	A7dQNSXZF+U/CT04mQszi/lN3SBraHuJbjwMvhJTdPkYW6tveFdvisg+LXbFfrMn
	4baymPWqCThIs/YdN8ZvF8NSy/1gzmFTeYj/S7BCCZD78a5jzXd3oWakJ39ea4fk
	UR0n+bsxq6cPyRE1JyXMxWP1DziwV1rTM6O4NliRMKs4Shs9FZoCylQhm4I3GNjJ
	6Y0TkqHwU01qXkrXKih+jTT9AdgOMJzDNxoBTI5CZHsJ6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wufs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:05:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8067974so1453558085a.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141510; x=1792746310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ge49gEF8iI1j8v1IuSE0YY6gXRwf5wQGaOZV1jpGaYc=;
        b=bQr82lCFsDsKzR1hSmSiTizhSY1OFOvRe+2G+9oJztTqNdlbPSXtsUtXYhCw09y+5X
         yezmOTJYrDwl9+47p7z9GW7Alrcw02L2aUXk+enL/Xfje6YF3BQEWjdVvQDeZvs5Z9ap
         xWCLLXZq7wnQKyPNo+OoSn/b2fOrTi/Lk4ui3S4XHkMtdy0dTdGkCxQqlTDX61jmeqZL
         pwPIJMJK0SqnCL/CydcvdAwhJgnb4CejVLmxaY4SSWw2SSwbpJ6UOhbvBsWMQL+6nNIY
         hQb4vZrFa/ERIz4c5AmITuSjkqRafoXhRrgCh3tSoo1/7K6LZ1hJ6j/YwUS1zXcTgIDR
         wbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141510; x=1792746310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ge49gEF8iI1j8v1IuSE0YY6gXRwf5wQGaOZV1jpGaYc=;
        b=tCip5LZpaIwuT37ts/MIYcvDXtAMwGyJEScssOeASHiIpP/lV+z2+I5TecKDHNjheL
         yg1Jul4NfhgaZu9J16yfPHW16mIF3v/sbPcTtuQIUIKletkr5k7Ya+6kbEuNAwTw2Sx3
         ZJwyRH1ka2NPTj/++CUvMxHzkVhAvGJs0roxBWq7bhXqumusM5vvqg9FLN1THJ+nYUtz
         fHYqbhjhUEQMvzzEeBtvmShv5MRLBbfpuh5ZA0w3KKCE1Pg8MWBpEfgkKwdOd7acvCfx
         tzaopmB/m89XQW5vXXAsS3Y6i2rUspOqDfskmP7+ue4RG4Ow894KQUbRJ8adtCdrgZOh
         TlEw==
X-Forwarded-Encrypted: i=1; AKwUvBy6e5yfZwKTWO1BT/nRYRAc1FnOB6lqPfukrTpskE2bCmR7QFIt5/wn1UsQ5oAxB0PoD0zeK4+vu790@vger.kernel.org
X-Gm-Message-State: AFq9FYK8eZhz8WngTamLpJJuCnRlJKhszguGARoIrw5ndp2weua9sH5d
	Pd369lmU2hGYrPAtJDOSL5rULl04C5y2bqjz/rjQtmoE5ur3oedbx34o3z6MMkcVM3kWOeKddiz
	50tajp7mz0sW+Y03NXqeTlCRTsIB9Avqi8ymFVJY75HHWwWNuBa9keRdZwmAM3Mzp
X-Gm-Gg: AYBFou3mp4cBTvdLZRs61Aq/sTTPf5NwqCHENXUONZoLr3j09Y1557qpVM7B761OFGW
	ws/3HRdko7DdH1z710vDlwXcvOW2upNY1qdFY9A7gIrUAHNz+K/Gp3SHU1nG7Sizpfl0988HUJE
	YlajjwtNgQPhtpGJWLCIfESrQhEcOtWRFYGim0MmdWVGdvsTqWJwL127l4bz6k6CatBmUb7Yzax
	nlFNtMZaZM5UOOhqWHlx2Zkx1g0Z6EK1GVemO5gBoa5WUVKiphHQPTaQZQeqy+h+zT7Uoz0Mqs0
	dUBLChU2f4dgFyg96PZ61x1uVibjWKVhNflZGLyOa9n9f72SUaKr+dOsrpqVZI4k7W/bHMJrXvz
	XK55DnN2+VXRwQcdl
X-Received: by 2002:a05:620a:28c9:b0:93c:b721:b10d with SMTP id af79cd13be357-93ebd0bf9edmr3530529485a.8.1792141509784;
        Fri, 16 Oct 2026 02:05:09 -0700 (PDT)
X-Received: by 2002:a05:620a:28c9:b0:93c:b721:b10d with SMTP id af79cd13be357-93ebd0bf9edmr3530523385a.8.1792141509081;
        Fri, 16 Oct 2026 02:05:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm3660155f8f.46.2026.10.16.02.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:05:08 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:05:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
Message-ID: <sgqypoylrjwl7da6vsd5bkxxyfziv2ajxc77p6qgn6ted5bwnf@mctm5rfwsn26>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-1-ee13aef55d8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-nord-soccp-dt-v1-1-ee13aef55d8b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lAiic0BVU7oSTmjAZu6E3p99fW3VaaTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXzp7aOrOJ1Nf+
 0UmEKXSKnjthzQe+lhhGRLaB12tCotyrMMCEPXba/GCXD3YtEV8iOSXxnelW4A569WgUomYcitK
 MIQgkTf9D3PDtoi37+PiB8GJAaaoR2G4l27ZkxSyb5hHiFSquUkBbcBs2uxCIX5+d+AsrmQrLZ2
 Clax51diVRLx2UkSzV5/MBe8BDiPK/tntpue8eeLj2LPoLa+4YV0q0bmUJLuVtxt4FVpB4JQFlp
 MA/7K/LxMF8tuiQ17mrZdPk/LRN0AAh2Olrmxenxyd3X4T4hHqT2BbtMu5ZaFgd41ADKC2jDU/S
 dSRVqJ/jQziH68ZZT8ZBYyAaf/IdJIpQglvpGlpl0Y8S369ZyIlftwnqW60ZD/XbIpfV2bI2IQI
 2TVQ9kex2EUQpXu+BICCVsd85Fa7yEwx+AdUM1pPWiwut9GSNeL/d5VLfY+OcKeBFvOz7bHlrhO
 3X3xUxm/QE+Z9SA9sow==
X-Proofpoint-GUID: lAiic0BVU7oSTmjAZu6E3p99fW3VaaTh
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1e8c6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jKaMUBhZuuUR3B7YIIQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX2E7Gti+rz+Ee
 ET9mAifS9dPPCucxbRhCL22d0E6De5+m0pzWLUlsl3Bba4bHqX63a1c3oseh9ftg8Azx/1sAyNc
 rFuTFUpKrLUd3K92G1DUI+bUGvIln04=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160036

On 26-10-16 11:09:54, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi |   9 ++
>  arch/arm64/boot/dts/qcom/nord.dtsi          | 126 ++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
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
> index dfbbaf94a7ae..53c594281f6b 100644
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
> @@ -1587,6 +1609,110 @@ uart13: serial@a98000 {
>  			};
>  		};
>  
> +		remoteproc_soccp: remoteproc@d00000 {
> +			compatible = "qcom,nord-soccp-pas";
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
> +			status = "disabled";
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
> +		bwmon_cluster2: pmu@1014400 {
> +			reg = <0x0 0x01014400 0x0 0x600>;
> +			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
> +		};

This isn't supposed to be part of this patch, right?

Same for the ones below.

> +
> +		bwmon_cluster1: pmu@1015400 {
> +			reg = <0x0 0x01015400 0x0 0x600>;
> +			interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
> +		};
> +
> +		bwmon_cluster0: pmu@1016400 {
> +			reg = <0x0 0x01016400 0x0 0x600>;
> +			interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
> +
> +			bwmon_cluster_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-0 {
> +					opp-peak-kBps = <800000>;
> +				};
> +
> +				opp-1 {
> +					opp-peak-kBps = <2188800>;
> +				};
> +
> +				opp-2 {
> +					opp-peak-kBps = <5414400>;
> +				};
> +
> +				opp-3 {
> +					opp-peak-kBps = <6220800>;
> +				};
> +
> +				opp-4 {
> +					opp-peak-kBps = <6835200>;
> +				};
> +
> +				opp-5 {
> +					opp-peak-kBps = <7603200>;
> +				};
> +
> +				opp-6 {
> +					opp-peak-kBps = <8371200>;
> +				};
> +
> +				opp-7 {
> +					opp-peak-kBps = <9657600>;
> +				};
> +
> +				opp-8 {
> +					opp-peak-kBps = <10944000>;
> +				};
> +
> +				opp-9 {
> +					opp-peak-kBps = <12748800>;
> +				};
> +
> +				opp-10 {
> +					opp-peak-kBps = <14745600>;
> +				};
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
