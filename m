Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515048;
	b=o0eqXASqPxmV4hXrEI4G24J4tQOqtkQJZIObQ0yL6zNCbpBnIHwUqSioV+UX+Y7qkifr
	 VmkqwlO2dRXHEgw7r/wwNgk78BzCKPJNvlbB41yFTS459+Urq32JswoHpKa3r/3PPX/Hn
	 BoCYt56LDLrruwqJ541O+iF+MN8PDNcqDbH25Z45+o79wCFT8583whyrM4TV8xxAxP/NB
	 zDHoGO8ds16CZU3SUseydE1J7Ob9z5zqyi2zViz9XH8wSXHvoUUxh0hvbtbKpsIezurmH
	 9Cw70OtvvCFlIj9VRCFzqEvbka2rFiu8JP4H8XHSsFQIDtO59fEoRtXZ7AY20duRgbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N8fOsILZEnkS42kQGRdkOwT2s6KzeYLd7+z7MxZ/MAU=;
	b=jBwOOIznScR5YGJcK/d6uwtNKTIHl34T/zbkwd8VBkIDAU/tcNHKU0d+gnl6DDYNj2QQ
	 X4p/ohKL19jRsTt0q8WES4kFm43vzQAGvwX+siJTpkrt/XdeiGzgfvRLdk3C+fsmuI1lw
	 rXykO7RDBEcMLR+YW0m/PdSMRowkddpaUMwMAUvMQ7+GpWbk61aXyMUm3SzTUTRXOPWSU
	 z2PDfxXAZ8UDW7IJcjnf1vZ46r7eOf843nQwCZWN3xpviZAs5gOEA3yhRsK+trdpkyj76
	 a8PTpcLhq/+mx5OYDY3PEdWUGBz2MCLRw+yY/+AZVji8MsqooddwW2E9A9ByUioOcrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gGTTAVfh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QjwIpA68;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4811D606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4811D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gGTTAVfh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QjwIpA68
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8VsfD1598316
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8fOsILZEnkS42kQGRdkOwT2s6KzeYLd7+z7MxZ/MAU=; b=gGTTAVfhkE2/7bab
	8/3BbUtguMN50ajxW+idpsmL6mypl+jX6F1Y1G0V5NreQuWatfHQ68Q3yksoFKk4
	j75I4gLvLNiLNLKTinwNFy64pQoTaEHamLYHZHpFuWlYpC9ZiTL/fkTvsARDT0gd
	1f6c0ys7H2ZFAkQjJenu2xWjdyQXXLwXE6ZjUQK8Apmt7n1DPReVMPFzutqYUpUW
	JTJ+en5Z2lzcTXzyPgtkoeaLnxPBTR+7nkf7Ah7FkirShj19JnEQZc0e7DjMaDVe
	so6jEy06uDJJ8x+8iU/6W1oXNW+sil/7it0vQPJkQtXWhlaLuvPbr+Jsm0ArvkB5
	mN/rsQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqk2qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:10:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4b76a2b95so1560658a91.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515045; x=1796119845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8fOsILZEnkS42kQGRdkOwT2s6KzeYLd7+z7MxZ/MAU=;
        b=QjwIpA68jD0hmF2/YkukOiiff/fNZ7VsVb29BW8cCumBViQYhNhHOCmuqhSOM8qS5D
         FQl01JeP/Xi2ogEiCEtMz2af5U83UpRnTMpPgJ+TdvbUcIj05qEqLJ1oknAAYJImJiJD
         3MupA1SvD3jlax4j5FTZnEnEDKzrYvxS4GMzPB5Uf2ebm93LIRKFoXxOcrOVVBZtnTwz
         nxPRFq4tgo0QyEMWMbxtx5byIGORHdVVl1ioiTfYpFhpxI4i2IXSjeDrt57JSJh4NGEH
         aPKrVrizDeUGAC+hnkJUdNAjxuLCrMHPbM0fXasUJJgI1VJ13B1CTPVHIICyE2JsjtVC
         ZZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515045; x=1796119845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8fOsILZEnkS42kQGRdkOwT2s6KzeYLd7+z7MxZ/MAU=;
        b=Ig4JnhcKCBGx1TUvEsGwiOr+0sUJ1BdvxnKtivuqzDMBIzacw05d2O8FRwFFcvzLCg
         eGBa8BO0/pXsRCeESSBSxm/MLfodLrIgAUie8aZQPIUI/YidX6xGUZtZZ2VB1TWr1uwa
         TpxCYK4ndOorCc0nOfJMwza9Q0wbK1MpO25AXmgt8UC9v2+WY1DBmh+tu/qT1VrJ3Bb/
         ft6G92NziYT68kcoOaKfUIVtmuy79W/hSAuyJ5udFksTge2bVIKgL0pY6GNHwcfjVW2a
         ETtvPdxEZphQ/nKe5l9u0+Z05agG1gt9BWtfACuv64v74T7s7RZCfWyufevmijgzpyS0
         MOyw==
X-Gm-Message-State: APuU4Z/rdS0sNkUxMo3fi5+gi51pC3pDzJwJBQUi2E3Q2Wzk9a+YRj8j
	KcOXsTZoWfx14XibOISYChs9bKfosbdbrsjh3KZOO+zxo2kkO6h5Jz4b0cetm4bDNUm5iQuxAG8
	iJM1qc1A9ARufM2jK0cBdXBMLhc6CMqAsqexNGI1wHignjLjraAW1KAUsKD9uYtLh0AUSVEj2MD
	Q=
X-Gm-Gg: AZFdTZd+2sQZTs0hvZ7HnyhKWCaaAyvIh2ZB0HCCwsyKvLbGWDTzgpFQGNuIWF0GrW/
	fQ4p58gNhpy//ho6vhTUsoIhkxtODpziMhHUlSoT3AsbuIxePyVboLaJJ3myy9RRNLgTXhde2Ky
	jKXDA23UDRZwuPQxNI3NApYXm3a9W1dAqZ62rLNyX/fVpNjjUd/wrPA9Cnp64UaaEg4P68aZC6L
	p0dgeQe9gTAvsVMzJUiwIeAneLUqZLVRxlrL7RdM1zp7xkgkkIhx+KJc4DXr9Jnpe3ti8pXlUBS
	0tqCPWCo8BmjJl75UEFviySOeZ2P/lniUK3+iFkw0Bg/KdrFpxAIacO7UI9HNy0JRRyNuNp4ppx
	8vb+MnN8K6LrVrI6i3b98u1xlplReTXtob1kDqqLNk4H0UCRNBFIKOzrJeT6GVqTrSX5ysmupcd
	ma3WejLvN47TBe/AaWb2KmcGAcSzF6HlhP0QgPgM8=
X-Received: by 2002:a17:90b:17cd:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b41c9032bfmr12380535a91.26.1795515044875;
        Tue, 24 Nov 2026 02:10:44 -0800 (PST)
X-Received: by 2002:a17:90b:17cd:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b41c9032bfmr12380515a91.26.1795515044360;
        Tue, 24 Nov 2026 02:10:44 -0800 (PST)
Received: from [10.133.33.142] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc6130sm6882899a12.7.2026.11.24.02.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:10:43 -0800 (PST)
Message-ID: <1c9786f0-913c-4f89-bf46-b51e1b6cc69b@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:10:41 +0800
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add CoreSight debug nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
 <20261124-add-coresight-nodes-for-eliza-v1-2-e1679ce78547@oss.qualcomm.com>
 <sashiko-outbox-230893@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-230893@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b0562a5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NOqMHipF7Z7UA0BjjVMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX6m8rmavQOP3b
 Ug2t1quG9h6V8FWoLQVgBCE1eOJTjszK7Cw2HkQLFQiDIO8beMooZ63pkZmBgE/yL1CxK1y6qsJ
 SRdyR/uIQlA/PtcHOJmXcK6ZbnGPK1BqHeH3g/j8KyR2haFLW4J0UvecFYVGzfQNsjx9RwN/qDD
 mxg0hvHpNS3DRgOOjW0HkTsv1vWaN2VlfXi7XLtN4jP38likgzROQ6C/ffpMLiDHrYBbpqGfuER
 l2Pi0VVcXjoIMnSAl5fMUQ+2Y9ca2JMkgHobnywnvr+icoc6L7UrIXXzjnA3VJLVZc4rm2Zt8k9
 QBu1aVzmKscAl8dInor+QbNucjSZDZH0DmCs4Z82mLnFFqWfbjVgbvhjmmd90j4xjTzA/Gdjnw8
 G0dJMqKEabyk/MDltiaonfUEN27hvXS8q+QHYoQVxJlGu9WWzFukOD8YhTm6a5DqvZhf6qMWXfc
 7x+OBejvmE5tFaQscwg==
X-Proofpoint-GUID: aP7G1lj4P0bIVzkBYuk0n58uC6uqUUBj
X-Proofpoint-ORIG-GUID: aP7G1lj4P0bIVzkBYuk0n58uC6uqUUBj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX3dEEdZuCigh9
 PAAAwvIN4R2PO79Xf2SLu3duCFMhP0dq5ZoLgMtJnsNPzlnjiRztBtCG7hn2IJiIKhXrtDIid6A
 1w1LfHs7V69qSJL1Q9S4MFE7029Jwts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039



On 11/24/2026 5:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: eliza: missing element-bits on static TPDM
>    nodes
> - [Low] arm64: dts: qcom: eliza: wpss-replicator port@2 violates DT
>    binding schema
> --
> 
> commit 54f1938fd654d770e58cbcb66d2760184479af8c
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza: Add CoreSight debug nodes
> 
> This commit adds Devicetree nodes for the CoreSight debug and trace
> subsystem on the Qualcomm Eliza SoC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index 4a125ef386c02..7bf58daace9c9 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> 
> [ ... ]
> 
>> @@ -5430,4 +7484,127 @@ timer {
>>   			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>>   			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>>   	};
>> +
>> +	tpdm-ddr-lpicc {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "tpdm_ddr_lpicc";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_ddr_lpicc_out: endpoint {
>> +					remote-endpoint = <&funnel_aoss_in3>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-lpass-lpi {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "tpdm_lpass_lpi";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_lpass_lpi_out: endpoint {
>> +					remote-endpoint = <&funnel_lpass_lpi_1_in1>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-lpass-rscc {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "tpdm_lpass_rscc";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_lpass_rscc_out: endpoint {
>> +					remote-endpoint = <&funnel_lpass_lpi_1_in4>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-modem-rscc {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_modem_rscc";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_modem_rscc_out: endpoint {
>> +					remote-endpoint = <&tpda_modem_crm_in0>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-modem1 {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_modem_1";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_modem_1_out: endpoint {
>> +					remote-endpoint = <&tpda_modem_in1>;
>> +				};
>> +			};
>> +		};
>> +	};
> 
> [Severity: Medium]
> Should tpdm-modem-rscc and tpdm-modem1 specify qcom,dsb-element-bits or
> qcom,cmb-element-bits?
> 
> In static_tpdm_datasets_setup(), drvdata->dsb and drvdata->cmb are only
> allocated when the corresponding element-bits property is present.  Without
> either property, enabling a trace path through their connected TPDAs
> (tpda@1080e000 and tpda@10803000) fails with -EINVAL in tpda_enable_port()
> -> tpda_get_element_size() -> tpdm_read_element_size().

Valid comment, needs to be addressed.

Thanks,
Jie

> 
>> +
>> +	wpss_etm0: wpss-etm0 {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "wpss_etm0";
>> +		arm,static-trace-id = <44>;
>> +
>> +		out-ports {
>> +			port {
>> +				wpss_etm0_out: endpoint {
>> +					remote-endpoint = <&funnel_wpss_in2>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	wpss-replicator {
>> +		compatible = "arm,coresight-static-replicator";
>> +
>> +		in-ports {
>> +			port {
>> +				rep_wpss_in: endpoint {
>> +					remote-endpoint = <&funnel_wpss_out>;
>> +				};
>> +			};
>> +		};
>> +
>> +		out-ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				rep_wpss_out0: endpoint {
>> +					remote-endpoint = <&tpda_dlct_in5>;
>> +					filter-source = <&tpdm_wpss_dsb>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				rep_wpss_out1: endpoint {
>> +					remote-endpoint = <&tpda_dlct_in6>;
>> +					filter-source = <&tpdm_wpss_cmb>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				rep_wpss_out2: endpoint {
>> +					remote-endpoint = <&funnel_dlct_in4>;
>> +					filter-source = <&wpss_etm0>;
>> +				};
>> +			};
>> +		};
>> +	};
> 
> [Severity: Low]
> Does port@2 in wpss-replicator pass dtbs_check?
> 
> Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> only matches '^port@[01]$' under out-ports for endpoints that carry
> filter-source, so port@2 falls back to the base graph schema where
> unevaluatedProperties: false rejects filter-source.
> 

