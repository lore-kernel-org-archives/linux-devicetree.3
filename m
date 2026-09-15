Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34229390CAE
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459762; cv=none; b=HEA10AgFnQqbpxb7ZXRxJHokOVAwhOgens0iDze7GJU9MsmXMfJSbTk8fIJrzf0Oiry9b+BNRd95/ctmtvKcAz0mZYoBwd4BvEjpNy67ZfDjPrR7rbtfLEgV0fc/4bVpD1wDtyV/NY2ApwQ4+16AFgNYYdFCca8PiT7QIqfvUKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459762; c=relaxed/simple;
	bh=rAAdHLym2FN+o7S3RNpBgLFr76WhG/xObeJLRgMQXwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StFhtrIvv9qI7J7v/5LuDdlXnh+ifZ8xJ5PJyEsnd+q+t3ibl9fUrvg7PaSuYzmiBDBTdx/NGFiEcRrgbreS6Fo7TTjIpygatsEdc8tjBQXVFfhEPqjeAjipMrfRQtUuTHfehgrG72RR3wgjw70FDTiGnCxVraRsIgajExmyCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYXQNjIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c00FTr/Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYXQNjIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c00FTr/Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zbex3824010
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpaVpZ9TMQ7KxT/IdqbwJ3eUb6+wAqR88lGfCuc/y14=; b=VYXQNjIf84mbQFeK
	NLnU51p4T3rJmVDgbFAURO3gpopMH+5Ik3gvd0BIND3o5+vJXbky1DB7BiqY7IJw
	Ja83cySsFPD+RT6zFfP9ZWD6HBDtN4+++bQMn5YKUmO/oxX/zcfQ2ox8Wr/sE1fL
	UDZeCDo5NLeUnqWLuEshZyFYUFos5MRMjd/M2mXG5ZKncMYa1/zZGPiQefMupCXG
	vanNZrubLnB8dXBIZWKhxcFBDcbO73ZSkHnOoXJuFcp9zhUALFWY/JQQOmhXQtKR
	kv92AfdHA3xWG5l7+oyHp+5tKLZdgVi4GnJCV2akrMISbOZAbY97smjjsAG1YmLO
	6l/kXQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41u9ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:09:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so55561195ad.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459758; x=1790064558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpaVpZ9TMQ7KxT/IdqbwJ3eUb6+wAqR88lGfCuc/y14=;
        b=c00FTr/QqaS+e8KadsxaPr27BW6UG6iF+eKCpMaQZ1cjeT4kbuzrRXykqKeKmF3Z6i
         QuAoIsDy0GG3lBr/90bOEvRU1mFx6GANDO0dKr8UXo4YoCmEnGTRF8KxbBbXUCMECKgo
         CSd6oaG8BfNt7VPUFy5m3qF2Q4yiWK8w1tr8HB/b94C9QSCkcXXLlroFiWLrIJLm8APt
         xAJKJlQZOfNbCdV3BqoK56asit+q7EdHJr2zfB+kIKp7UqwNzzxGS9bwV4X8v60ZfjkB
         Pl6ZdiFdhnpYeLeHb7TomxCeVht3pW7sDF37YOiPLHOBkKaZjBiGHNj0PUHDXloNuY8I
         9kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459758; x=1790064558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpaVpZ9TMQ7KxT/IdqbwJ3eUb6+wAqR88lGfCuc/y14=;
        b=vzHijelGfiA9TZrlG/TOef5My8o7vZHdXLn/Le8+tu/OoJtYsXKn++6Ay5ru8oQiqa
         mQQFiXLtqxrBiBEafZffwBVILwmTmNcsfW6BO/DlOZ9YSxSO9zDk+j8TMeuWc91TJ6o7
         czWPC/VAHj2KbCfojVQdTAzEXMflxl1wVFqQUeISAAJWX0iYP2+EwNFBO++fADhN0bI4
         OF8m+V6PeGomYCI/8w/2CB7BNHvjkgYBSYK+jgdz+AiQ46TTlj1dgi7tC06aPdX0huDh
         96DxTirvQGd+O7v2VwBZwImtN6hR7N2aFliQbrN2VbrafIaEjIQDqWP/niynXOpOnIBx
         2n6Q==
X-Forwarded-Encrypted: i=1; AKwUvBw03n6hipKXJO0mQdKVK2iGowsVL+bP7dqfRLxeKA/6LAMEQhunkgKDoMmwUa+DQpFRMkxHfmjgTC+M@vger.kernel.org
X-Gm-Message-State: AFuF++k6G8Nc0X/IPBPk48BgMOUszw35oEJQRjxLAPqnrIBDDIAcQt6o
	BVD/hBWzCaJ3A2HdQMPdIcqAUeizLw+FY97rZ/Z4aPy4/sGtGCbyw66JCgKTplCD6fM8Mius+wz
	yA7J+MgQEtrI2VrzUSojWaIN27NBqC1cLLwJ4ZFLu+73HfxJE0zbbpcrUBq+fQsWK
X-Gm-Gg: AYBFou2qcZURPXStTMRTdbX8fPlmOj7g0wcT6Ru+wifJWGaJf12bkma0ARBGQViS9g4
	cBB2Mcspr9gnGvbzGBQNuzjmOziB5T9wK8oXb7/cxo8R4D6A+Mzs6ql2LQMG4kJIjdrmGcLyg9O
	723gwQrndyGTIXhKKemGi3rFqwK1uicqutcm4szUHHrimWayo0v18cuNntCJD4wo1fj4WWL5wE9
	gPxbt4Ffz0h+I3aVP2qtt0MkFo1vQSODB3TRRfCweWYpJZyHVb2aloWiivze0daj1YjSVQpV88r
	PfHNNtTC63j1CRy3NYGboEXLdkcD573fM/uJdbh5cOR+CExchH7NYKLDkEj9/D1S5yAkxruDSST
	OkmVUPyHMA7jYLCYhHu1ThUriNZL899l2wT+DIXoKhiyN4oHs2BJE4qouRDdPSYi0Ig==
X-Received: by 2002:a17:902:e746:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd6c6dae8emr125563335ad.13.1789459758539;
        Tue, 15 Sep 2026 01:09:18 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd6c6dae8emr125562705ad.13.1789459758136;
        Tue, 15 Sep 2026 01:09:18 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff297esm61574725ad.73.2026.09.15.01.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:09:16 -0700 (PDT)
Message-ID: <4dc33440-133b-4b81-b460-4484d9829aee@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 16:09:12 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX3mtkNmDJw2oA
 1zEpwy3SmgSpuPg0LHtCiwVhx9p85w/Li5Qs8b9LaG5NzX5UMoD7IJYk4Xw0/PRQinvCzWgtsUP
 g6ckm2vKM6kT96NZeM7S8X+nCRUgr/QWb+lSPhdhlceZxadgaITgdG0Fd5YzGuA/nFMyBzHE2XI
 RLtjFah6o+56Vm2+HzkPNrwRbZMKmR+GfT4hO6u1JugmfcB8gIjC87VQ6nULfKp78XLKn0CW/OZ
 8mZEXyb9R8Eu+tuqfmv7j5yKt+vFVysSuzgJxSFzMDv4CYpMGKMF4+TbiwgY+HS8qEQ9FREcxLp
 3nLSFMcpr902CKgyvT1Bahn+zp2PxG2NUTjtVV5phZXKs9yR7oCeOXhqCHXenwJ09K9hIVbFgw2
 eNCQCq9MRsJs+od+JuJeeWVUHf2V4NV/hywrVJwhltQcwW2qZEa5GGQYNYcXKFiZMn0PNQ/n9Qr
 HBue02MlxDMJhzHU5FQ==
X-Proofpoint-GUID: Z0WT55qhzgMWk87ztdJxFhBPXjgdwfD5
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8fd2f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YSVC6_zYCsoJ3GjGXcEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Z0WT55qhzgMWk87ztdJxFhBPXjgdwfD5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX4c/X02WHOrTY
 VHPYp5j1+m8qN4FjPxl1YTbjWCgTywE3IZlgOIo1PlF7WomUWANbHamx4aWENsaClQCCjMK8uSv
 3lzTeu5312C56j1RxtnG/TnVoZLDkec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116



On 7/14/2026 4:05 PM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 

Gentle ping.

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 176 ++++++++++++++++++++++++++++++++
>   1 file changed, 176 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 0bf664cd4b40..07a0b00dfb62 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -4984,6 +4984,35 @@ card-detect-pins {
>   			};
>   		};
>   
> +		ctcu@10001000 {
> +			compatible = "qcom,kaanapali-ctcu", "qcom,sa8775p-ctcu";
> +			reg = <0x0 0x10001000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ctcu_in0: endpoint {
> +						remote-endpoint = <&tmc_etr_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ctcu_in1: endpoint {
> +						remote-endpoint = <&tmc_etr1_out>;
> +					};
> +				};
> +			};
> +		};
> +
>   		stm@10002000 {
>   			compatible = "arm,coresight-stm", "arm,primecell";
>   			reg = <0x0 0x10002000 0x0 0x1000>,
> @@ -5123,6 +5152,121 @@ funnel_in0_out: endpoint {
>   			};
>   		};
>   
> +		replicator@10046000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x10046000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_qdss_in: endpoint {
> +						remote-endpoint = <&replicator_swao_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					replicator_qdss_out: endpoint {
> +						remote-endpoint = <&replicator_etr_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@10048000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x10048000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			iommus = <&apps_smmu 0x04e0 0x0>;
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					tmc_etr_in: endpoint {
> +						remote-endpoint = <&replicator_etr_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tmc_etr_out: endpoint {
> +						remote-endpoint = <&ctcu_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1004e000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1004e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_etr_in: endpoint {
> +						remote-endpoint = <&replicator_qdss_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					replicator_etr_out0: endpoint {
> +						remote-endpoint = <&tmc_etr_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					replicator_etr_out1: endpoint {
> +						remote-endpoint = <&tmc_etr1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@1004f000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1004f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			iommus = <&apps_smmu 0x0500 0x0>;
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					tmc_etr1_in: endpoint {
> +						remote-endpoint = <&replicator_etr_out1>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tmc_etr1_out: endpoint {
> +						remote-endpoint = <&ctcu_in1>;
> +					};
> +				};
> +			};
> +		};
> +
>   		tpdm@11000000 {
>   			compatible = "qcom,coresight-tpdm", "arm,primecell";
>   			reg = <0x0 0x11000000 0x0 0x1000>;
> @@ -5937,6 +6081,38 @@ tmc_etf_in: endpoint {
>   					};
>   				};
>   			};
> +
> +			out-ports {
> +				port {
> +					tmc_etf_out: endpoint {
> +						remote-endpoint = <&replicator_swao_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@11306000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x11306000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_swao_in: endpoint {
> +						remote-endpoint = <&tmc_etf_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					replicator_swao_out0: endpoint {
> +						remote-endpoint = <&replicator_qdss_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		tpda@11308000 {
> 
> ---
> base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
> change-id: 20260714-add-etr-ctcu-for-kaanapali-9aa6b297778c
> 
> Best regards,

