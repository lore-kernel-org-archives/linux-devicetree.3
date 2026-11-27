Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754055;
	b=yYmAEU8mgC1TNmYEZPDX8v7T4+2mzsWBqXOJO2C2J0J/jNciwT8YLne0vS5aRUtFWoki
	 l/IlBWT3pE7u4Br1anFqefCehU2Wl1GGFGxeZbo1koEeOY90xETPkqTUozCq2+ZzQczrI
	 byVmDiZ9+nHvAPaV0UjfzSys9C1C7ovL3quujzhv5Z8sTtPfVNWtWvJdrBpDfQcpqADv4
	 jv/hCo2FNfKhT5cpW9U2FsR/jPZL8CL3orcn+ZoDFWCiGwndrLCRhKapbcBOYBv4mSUlp
	 WvIxv7CquGOPBIzH4DRB/tj0M2l6IwAWbsN4H9HYcOAwZS95PAvKC0Mz4P0Q8jdqyrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GHL0ggpKEVsQ5ebl4iQmVb6vpivomCfNskc9zRzzUqM=;
	b=HFI1TCgim/dKnfhKpXl9uQmAVTW6p7eIErvc1BAkUfxPMTEPIDr8dA1VIS9faQOkaDQH
	 7yhWA/PfUPomSRdqvl0/SR6sR+Sc+jzRcmT6pwmLTY1vnWM6aaMZpRz0ebdsoN0Qlnk8i
	 23kKgAw7iSA+lIqwykmrAkAT60VzjUsKilJ5LGm8TO6sMb7/Q5x1dnvzVHl/8A8qmchnO
	 jq0TF+qRSyeV6WsCat+tn1P6gqNkhHd8a2pcKuFIHZtc2mlaehh1Bln7XWctzT/N1Kh8s
	 Cllcb0gkCTKpCuNqgC31Z+l/8DHKBrIVoCMhUU4jf5KDJFsSXPIln80TJJ1wj6lKokg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGue6d1m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y5PbYJnU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3162F606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3162F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGue6d1m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y5PbYJnU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvuQH060708
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHL0ggpKEVsQ5ebl4iQmVb6vpivomCfNskc9zRzzUqM=; b=nGue6d1m8DsYwjEj
	4sWcw6MIvmApzfyB9G9mqIfk2o6B/C9LQwTaCwRzWqQVUtN64BqeNFY4NpLNb5Bs
	lcfPTugE92I1XzFOE0xph+lLi+78uKYQPkSkyn/EI/G1M3ISxeYQQ6LrhZ9ctHvt
	jkCCIqPVG/WOCMH0P33h0QvDOdaWRQxklqBk0CL3oU1WbusJRxssxTUO6Du4r4QG
	TeGfFjZlmxhz3Nf35O6XUzttV4/jXlGHBdvuj+fenx9BzF01T4cudNmAhuFtKRhJ
	dHf3mpgV+EaoCNlJrQg6SCd4HeFCDmQsKWIexpiINIqKJI07Hp5IdugX41nme3K4
	qRVfnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hs7q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:34:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b42ebf632cso5525580a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795754053; x=1796358853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHL0ggpKEVsQ5ebl4iQmVb6vpivomCfNskc9zRzzUqM=;
        b=Y5PbYJnUmHx4cZz+DctBrWk8vLPNXZ4o1oQmPkRcW8ScYsCqU3REji5TvQ20koLtFq
         4twIRx4P+aoFbPWc1vUQxJQ8ssrqGlDgLo97yCQZjx1S8nOfFzPoaSDveazOPhxWzeBs
         w3f1RnBAojIwuOijuVYER74u1sYfp8NLEd7c4HBNymsXvk89NantfwG9Vef35CnKerUL
         5HYAlrrdtWRLpjtPuAYQasYW7c31eH9pUPeqbLXyxM7+vNZYv8pHcnkKEGq2PAHXuo6H
         Qu5qXdA43cfzqtXwH4M+xI9jcQu4VLJXxankV71ysCHuAZE6BdDoZY//tcNHSgPBNXXE
         yOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754053; x=1796358853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHL0ggpKEVsQ5ebl4iQmVb6vpivomCfNskc9zRzzUqM=;
        b=m/n7pQ9Og3Ey6uDtjA2we4PTQuDBGUIppzm5Wq+dmlx6fOg5omNRrfHCo77YfXJd+0
         iy1HZjrTZzO/j+w8pDK9FjCLxUs8ZZj4WajMbkywwNCByTHbpOpsdWzB9kFa2iyCkRhD
         8gQYn6/y75evaZ+LVo8OWaSX6GRWIWdcR9bq1yU1igo/vx35Mat1DkdbRCFR8iowshRk
         3oeI8qhEN0kNMbrJR8Z1Xmrp0zJ/MQxrJUGuxTy37R97yYtd3bqgIZfWszwLsTTRc0cc
         V+NaHaqKqSM5jfp2zHck7BJQZUXVnN6MlGUu5mGbKSGKkFITuH8daU4ugmtEFnICUKOa
         L71Q==
X-Forwarded-Encrypted: i=1; AL+hErELXjeCFrH1+PTzBr2q7mLGzRFJcFH44tKKe3ytIuXskPUnAPmLA1t/VeCsvwy0eHoFrzjefM572kVY@vger.kernel.org
X-Gm-Message-State: APuU4Z+rEsZamWe6ELvWuXqw5SutPR/4mcEq1yqjlJkthzddAojv91bc
	3S1A3D8Ki62XHjUo4+Yo1jDFu3fhreybho+Wb4ZGsGr98hJ9boerVT81U33uGZIsAzFOTQCmUDX
	SqTXuJqLbixbTr63MwRX+eXL6fb6hzO6MweStVLs364jTN6Ya1xZ3wLHsrQpd9bv7
X-Gm-Gg: AZFdTZcCCliCQ1XhVUvHOymdAq0sGMhylXQkYBPFyy3ibg+vuD4J424IgpWTdMs3egC
	ZI9qoKIV3N4kD6y6VuJcyrXmiPYGd2nDualIxHTkcAFaEMRjPbkvAl80VieXPYn8m8NFph0rBU1
	hXhlPQWYVxAtK/LOi2uPN9zDiziQmTP7COad/c7LYTakFGqMe4zFyz+aWLdIZS61w5a0mtnQVod
	UyjpqUOwWcjYr0admSxzDl9pxOHZc5IdonPOK/zx6w0IrUCIay5Z5iJgFajmr72d2/KRBamj3YS
	hlee4kDlnrC7rEsd0YYBzoKhT3S6fm6J6HnsGfYJ3eiprRdUstjjQ2en73OtYgCmlNdmQiU3VUb
	QpB18xwueyTi0NA9WYin6Nj4uOA83FNbYl//D7veasxvxWq1++Vg/1/YjFwm6efJdrTBgGDGLwh
	FbVoXuGnDDl0ME3BsTISZPYrJViyzef0ysOQY4uQ==
X-Received: by 2002:a17:90b:5350:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b41c98bcf9mr20195705a91.13.1795754053381;
        Thu, 26 Nov 2026 20:34:13 -0800 (PST)
X-Received: by 2002:a17:90b:5350:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b41c98bcf9mr20195683a91.13.1795754052777;
        Thu, 26 Nov 2026 20:34:12 -0800 (PST)
Received: from [10.133.33.188] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm36653001a91.6.2026.11.26.20.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 20:34:12 -0800 (PST)
Message-ID: <8d0150ef-a8f2-41ac-9128-9d887cbae6b8@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:34:08 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add CoreSight nodes for
 APSS debug block
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
 <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-4-42d47474a67a@qti.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-4-42d47474a67a@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxNyBTYWx0ZWRfX7cMq4zfJPFrl
 QcB2K6e5HjBgiSwYZLTHyHUybHtMLN5M9rXCxe6j/eSJXPGZ4UIUyIGmUFnCKqD3WayDoUl8iyJ
 psM38ysrHGXHtvWInvF4U4uApHxcTqU=
X-Proofpoint-GUID: KkQnP3MJt1KHOimWHtLDa5jTjbF5yHEy
X-Proofpoint-ORIG-GUID: KkQnP3MJt1KHOimWHtLDa5jTjbF5yHEy
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b090846 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5P6q2tN5KZ0Jhqwe1_8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxNyBTYWx0ZWRfX1pGNjEUN4hK8
 BSJ4EcavjeN3hnOjF7JJo9BOS/qlYmlSGvNJ0LIb8bgahhz/vQQhfy2qfSFnd2BsfrplDhZm8CQ
 cSwIOASE5yNRg0Z7VAPlbXbAK0RWGMCYJ94nfbonuHzunSsQ2zeLFouT84YojTcU910py8splNt
 afEnH7F3mxkbLDpsufk9cPiCK7cAzb+sV17wWA69PmGGQbBpbcDTLxqJGVrgHVR5l9qJzH/COFy
 JBzvuq4HqyUOBNx+6kNIY49wZ72oHQbhct23Pccf74gFYvi4l3+3cP2Jg2GelOLbW7/ZHkc3mNV
 rlioTzz+wB2kn1tJhuTkA7bJ2DRzJJAZRvKOL+oSLXHwfdWeFRXSS/0gYkyc37i3mbWWo+Y20S+
 aZxshLchKsL0UrgDOwMrD7kXPXVF8wmrah8PW8llXXED9/qKkoNYTFpAcTZyiETWxxqhPK7hs66
 0BXx3xXZkZqdamfDXMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270017



On 11/27/2026 11:10 AM, Jie Gan wrote:
> The APSS debug block is built with CoreSight devices like ETM,
> replicator, funnel and TMC ETF. Add dt nodes for these devices to
> enable ETM trace.
> 
> The replicator, funnel and TMC ETF nodes in this block are physically
> powered by the CPU cluster power rail rather than by a dedicated
> always-on rail. Add a power-domains property referencing the
> corresponding cluster_pdN domain to each of these nodes, so their
> power state is tied to the CPU cluster domain and the runtime PM core
> can power the domain on before the devices are accessed and let it be
> powered off otherwise.
> 
> Mahua is based on glymur but only has 12 CPUs across two clusters
> instead of 18 across three, so delete the ETM and cluster2 CoreSight
> nodes that have no corresponding CPUs on that platform.
> 
> Kalambo is based on Mahua with the first CPU cluster removed, so also
> delete the ETM and cluster0 CoreSight nodes there.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi  | 1184 +++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/kalambo.dtsi |   16 +
>   arch/arm64/boot/dts/qcom/mahua.dtsi   |   16 +
>   3 files changed, 1216 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 165dfa11f17f..9dd23a52fb2b 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -397,6 +397,312 @@ eud_in: endpoint {
>   		};
>   	};
>   

[...]

>   
> @@ -7837,6 +8151,51 @@ pcie_rscc_tpda_out: endpoint {
>   			};
>   		};
>   
> +		funnel@12080000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x12080000 0x0 0x1000>;
> +

Sashiko reported this node is out of order and I confirmed its valid.

Will fix it with new version.

Thanks,
Jie

> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				apss_funnel_port0: port@0 {
> +					reg = <0>;
> +
> +					apss_funnel_in0: endpoint {
> +						remote-endpoint = <&ncc0_etf_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					apss_funnel_in1: endpoint {
> +						remote-endpoint = <&ncc1_etf_out>;
> +					};
> +				};
> +
> +				apss_funnel_port2: port@2 {
> +					reg = <2>;
> +
> +					apss_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc2_etf_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					apss_funnel_out: endpoint {
> +						remote-endpoint = <&tn_ag_in54>;
> +					};
> +				};
> +			};
> +		};
> +
>   		tpdm@11c03000 {
>   			compatible = "qcom,coresight-tpdm", "arm,primecell";
>   			reg = <0x0 0x11c03000 0x0 0x1000>;
> @@ -8514,6 +8873,831 @@ rpmhpd_opp_turbo_l1: opp-416 {
>   			};
>   		};
>   
> +		cluster0_funnel_l2: funnel@1d021000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d021000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc0_2_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_2_funnel_out: endpoint {
> +						remote-endpoint = <&ncc0_etf_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_etf: tmc@1d029000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1d029000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_etf_in: endpoint {
> +						remote-endpoint = <&ncc0_2_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_etf_out: endpoint {
> +						remote-endpoint = <&apss_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_funnel_l1: funnel@1d081000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d081000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ncc0_1_funnel_in0: endpoint {
> +						remote-endpoint = <&ncc0_0_rep_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ncc0_1_funnel_in1: endpoint {
> +						remote-endpoint = <&ncc0_1_rep_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc0_1_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc0_2_rep_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					ncc0_1_funnel_in3: endpoint {
> +						remote-endpoint = <&ncc0_3_rep_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					ncc0_1_funnel_in4: endpoint {
> +						remote-endpoint = <&ncc0_4_rep_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					ncc0_1_funnel_in5: endpoint {
> +						remote-endpoint = <&ncc0_5_rep_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_1_funnel_out: endpoint {
> +						remote-endpoint = <&ncc0_2_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_0: replicator@1d090000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d090000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_0_rep_in: endpoint {
> +						remote-endpoint = <&etm0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_0_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_1: replicator@1d0a0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0a0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_1_rep_in: endpoint {
> +						remote-endpoint = <&etm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_1_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_2: replicator@1d0b0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0b0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_2_rep_in: endpoint {
> +						remote-endpoint = <&etm2_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_2_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_3: replicator@1d0c0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0c0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_3_rep_in: endpoint {
> +						remote-endpoint = <&etm3_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_3_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_4: replicator@1d0d0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0d0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_4_rep_in: endpoint {
> +						remote-endpoint = <&etm4_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_4_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster0_rep_0_5: replicator@1d0e0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d0e0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster0_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc0_5_rep_in: endpoint {
> +						remote-endpoint = <&etm5_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc0_5_rep_out: endpoint {
> +						remote-endpoint = <&ncc0_1_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@1d121000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d121000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc1_2_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_2_funnel_out: endpoint {
> +						remote-endpoint = <&ncc1_etf_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@1d129000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1d129000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_etf_in: endpoint {
> +						remote-endpoint = <&ncc1_2_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_etf_out: endpoint {
> +						remote-endpoint = <&apss_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@1d181000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d181000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ncc1_1_funnel_in0: endpoint {
> +						remote-endpoint = <&ncc1_0_rep_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ncc1_1_funnel_in1: endpoint {
> +						remote-endpoint = <&ncc1_1_rep_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc1_1_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc1_2_rep_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					ncc1_1_funnel_in3: endpoint {
> +						remote-endpoint = <&ncc1_3_rep_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					ncc1_1_funnel_in4: endpoint {
> +						remote-endpoint = <&ncc1_4_rep_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					ncc1_1_funnel_in5: endpoint {
> +						remote-endpoint = <&ncc1_5_rep_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_1_funnel_out: endpoint {
> +						remote-endpoint = <&ncc1_2_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d190000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d190000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_0_rep_in: endpoint {
> +						remote-endpoint = <&etm6_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_0_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1a0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1a0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_1_rep_in: endpoint {
> +						remote-endpoint = <&etm7_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_1_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1b0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1b0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_2_rep_in: endpoint {
> +						remote-endpoint = <&etm8_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_2_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1c0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1c0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_3_rep_in: endpoint {
> +						remote-endpoint = <&etm9_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_3_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1d0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1d0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_4_rep_in: endpoint {
> +						remote-endpoint = <&etm10_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_4_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1d1e0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d1e0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster1_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc1_5_rep_in: endpoint {
> +						remote-endpoint = <&etm11_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc1_5_rep_out: endpoint {
> +						remote-endpoint = <&ncc1_1_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_funnel_l2: funnel@1d221000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d221000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc2_2_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_2_funnel_out: endpoint {
> +						remote-endpoint = <&ncc2_etf_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_etf: tmc@1d229000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1d229000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_etf_in: endpoint {
> +						remote-endpoint = <&ncc2_2_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_etf_out: endpoint {
> +						remote-endpoint = <&apss_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_funnel_l1: funnel@1d281000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x1d281000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ncc2_1_funnel_in0: endpoint {
> +						remote-endpoint = <&ncc2_0_rep_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ncc2_1_funnel_in1: endpoint {
> +						remote-endpoint = <&ncc2_1_rep_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					ncc2_1_funnel_in2: endpoint {
> +						remote-endpoint = <&ncc2_2_rep_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					ncc2_1_funnel_in3: endpoint {
> +						remote-endpoint = <&ncc2_3_rep_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					ncc2_1_funnel_in4: endpoint {
> +						remote-endpoint = <&ncc2_4_rep_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					ncc2_1_funnel_in5: endpoint {
> +						remote-endpoint = <&ncc2_5_rep_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_1_funnel_out: endpoint {
> +						remote-endpoint = <&ncc2_2_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_0: replicator@1d290000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d290000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_0_rep_in: endpoint {
> +						remote-endpoint = <&etm12_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_0_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_1: replicator@1d2a0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2a0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_1_rep_in: endpoint {
> +						remote-endpoint = <&etm13_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_1_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_2: replicator@1d2b0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2b0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_2_rep_in: endpoint {
> +						remote-endpoint = <&etm14_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_2_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_3: replicator@1d2c0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2c0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_3_rep_in: endpoint {
> +						remote-endpoint = <&etm15_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_3_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_4: replicator@1d2d0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2d0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_4_rep_in: endpoint {
> +						remote-endpoint = <&etm16_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_4_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cluster2_rep_2_5: replicator@1d2e0000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1d2e0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster2_pd>;
> +
> +			in-ports {
> +				port {
> +					ncc2_5_rep_in: endpoint {
> +						remote-endpoint = <&etm17_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					ncc2_5_rep_out: endpoint {
> +						remote-endpoint = <&ncc2_1_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
>   		nsi_noc: interconnect@1d600000 {
>   			compatible = "qcom,glymur-nsinoc";
>   			reg = <0x0 0x1d600000 0x0 0x14080>;
> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
> index 868b924c4734..41218577777b 100644
> --- a/arch/arm64/boot/dts/qcom/kalambo.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
> @@ -5,7 +5,17 @@
>   
>   #include "mahua.dtsi"
>   
> +/delete-node/ &apss_funnel_port0;
> +/delete-node/ &cluster0_etf;
> +/delete-node/ &cluster0_funnel_l1;
> +/delete-node/ &cluster0_funnel_l2;
>   /delete-node/ &cluster0_pd;
> +/delete-node/ &cluster0_rep_0_0;
> +/delete-node/ &cluster0_rep_0_1;
> +/delete-node/ &cluster0_rep_0_2;
> +/delete-node/ &cluster0_rep_0_3;
> +/delete-node/ &cluster0_rep_0_4;
> +/delete-node/ &cluster0_rep_0_5;
>   /delete-node/ &cpu_map;
>   /delete-node/ &cpu0;
>   /delete-node/ &cpu1;
> @@ -20,6 +30,12 @@
>   /delete-node/ &cpu_pd4;
>   /delete-node/ &cpu_pd5;
>   /delete-node/ &cpu_scp_lpri1;
> +/delete-node/ &etm0;
> +/delete-node/ &etm1;
> +/delete-node/ &etm2;
> +/delete-node/ &etm3;
> +/delete-node/ &etm4;
> +/delete-node/ &etm5;
>   
>   &bwmon_cluster0 {
>   	status = "disabled";
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
> index e7141f8c9e0d..d2ac3e632ec0 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -9,8 +9,18 @@
>    */
>   #include "glymur-cob.dtsi"
>   
> +/delete-node/ &apss_funnel_port2;
>   /delete-node/ &bwmon_cluster2;
> +/delete-node/ &cluster2_etf;
> +/delete-node/ &cluster2_funnel_l1;
> +/delete-node/ &cluster2_funnel_l2;
>   /delete-node/ &cluster2_pd;
> +/delete-node/ &cluster2_rep_2_0;
> +/delete-node/ &cluster2_rep_2_1;
> +/delete-node/ &cluster2_rep_2_2;
> +/delete-node/ &cluster2_rep_2_3;
> +/delete-node/ &cluster2_rep_2_4;
> +/delete-node/ &cluster2_rep_2_5;
>   /delete-node/ &cpu_map_cluster2;
>   /delete-node/ &cpu12;
>   /delete-node/ &cpu13;
> @@ -25,6 +35,12 @@
>   /delete-node/ &cpu_pd16;
>   /delete-node/ &cpu_pd17;
>   /delete-node/ &cti_wpss;
> +/delete-node/ &etm12;
> +/delete-node/ &etm13;
> +/delete-node/ &etm14;
> +/delete-node/ &etm15;
> +/delete-node/ &etm16;
> +/delete-node/ &etm17;
>   /delete-node/ &pcie3_phy;
>   /delete-node/ &pcie3a;
>   /delete-node/ &thermal_aoss_6;
> 

