Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94E23B4EA5
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189328; cv=none; b=fjTAnzguLlscBbzzNPTNRiTaEYgNNO/N4n/7asvdcdaORcnUNj/RJ0cSDDivt4ouCNKTByvPRw30+dMhptyDncPlfXPpos1B8d+js+NXX1Hink9p5Y6T3kaBPbdtR9yZI/7oFmZd8CXDst58x3urvq0q2TjBLlzaBHyA95b5vuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189328; c=relaxed/simple;
	bh=1mFj75tP19JCTSz9LCKfKGKzRQ/+mhH0FVRnsNZA3rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qt05wU9nHNfDe0H0VG9qL+lFAWl4qKnrX72lrhQYln/bq1etUm94EyNC4zIEj2/WKS6Jt5rv58NKN5E/yABVSZcNZyAI74uN52xpHZiXl0c1VZ62hhb2+ezIFZTvY/gpxzHS3PzGXGPC7sK/LkyWmwDG8hBVa0x6LX5WyAUzhJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi2TwYGo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoqTqRyN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi2TwYGo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoqTqRyN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7lXtC1146406
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1sxB5Z/R+iHtvSLFdizLS+um7iRwekp1ErNrw/16gmY=; b=Qi2TwYGokeK5FFvV
	jbBIAUU+XLk7W51cM5BpoIYmjqgV9STWAc+VtCiRKdQtkFh2Q/18DgIB9qywNWE/
	gpCvcb7PBKsY/lDkAtTtu9B3SpTnHbsLO9RdKbmOuLreKDpXL4AyXPRzo9HgBqv5
	6zQEmSEfFqKTi0h/AYKEMG6LI1X/dGK5z7g8VFeByke0pBAUhC0J4AwAWnJlEsEj
	fOzkvxCX4KRaVQcH8/kRTsIvuTd2Q3N3+o883SNwWI975c6AWL/ss8nMPZUwG+og
	RYqOgRaK4Ih99AWSQemL/DE3cZpn16TgrRxn4tmnu0i4serC+61CvHc5CgLHz9xg
	NcxbmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ej6er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:15:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso7065459a91.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189325; x=1779794125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1sxB5Z/R+iHtvSLFdizLS+um7iRwekp1ErNrw/16gmY=;
        b=JoqTqRyNYjQ5/SdTNUzycspsKei6lfE7GTRO60u88Ul6d9R9bhJBIXg1bydd5ti0Sv
         /TqsM2w/L2H+F73YXsuTcOyDFMrg+EbVYGcFbwcG0HRdqvkOOvojub0PdsikqxWcAC+A
         HCnA4Y2W5TdS6nTr8o81jLzcT8luTdgizlfqBxbZ97ryAWz9p3bkVPJ0bI4eY0/H5C5G
         DzZFgbGwjI5Thgz8Cj9j1RfjX4o/mCwe7Q2XdPcUjyOfiUmx4tRCw/py0LTalMLr6nak
         xti4tKKAuDZCCHjZIQFwq+uCt8Xks0a3uOcCLm5XQcFPwrL5h51NxV2n9qlAzIbg1zME
         EzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189325; x=1779794125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sxB5Z/R+iHtvSLFdizLS+um7iRwekp1ErNrw/16gmY=;
        b=Oi0GMmJK9jn88eCNgx1yauuH6nSAQqxm1+j5MMLPiR4rNvO5stIk+sTLiKJEJLrB5W
         fxfCDDrUYvEiBlX7BT+mG7yU251vB3X3VA03LjcGo4vPaAqzHrhqRiBVrjnLmfgIhcjv
         aVOs1Xj8SHtmDKTp2UrBzuITiRLLfa+uQMLu6Z8nzdffaKiqB/CdnkeZH3ctytynyFT4
         VW/6Xot3uPP3EY0agti7zH/bknmlYa20NZH34X2ZIE5+rRpU+dfCexsjdEb3LZ9mFRcD
         Xo2bLT9e7z/+vAj4zMeaERZcU1E7IiSCgaz1FKBanQ4ob3XeXrPmbsY+d0R5qPyIYNzI
         64ig==
X-Forwarded-Encrypted: i=1; AFNElJ+igFxbFfU+J7E3Y4nj4MIyWT6/aFyT+nY9HrQMHqy0AGpqafay5scE2bGIYYj/tgOz7UQm66++1o2A@vger.kernel.org
X-Gm-Message-State: AOJu0YwAoQl2CocfvxgU+xviwzp4s7MmzfHyG2KN/XiEQV4JW09qZ6U7
	5zw11fxgg4xAKvx3laEKPisrnoJ1OxqvRDocI9HHZLvvTAn+v7pODm+032xmE0qhZ/mTOZuECxH
	uK7aZp8eKA8JhAyIszlWQfRLNauopO8mHrmDprESA/N5c5QIpQm+ZKYxPhReIIhG5
X-Gm-Gg: Acq92OGRcd0wHkicqIeVGracI5JR7K/iyX1gtgR5QIB8h2b0udFBws91gU22ydof03C
	bJDE/EixYZo8zIuHNIMFOG7b7+JIwBjXXEuOCUR9M58MsdRb+9OwH0ZLlRsmsc+14H+y9xrx/VQ
	pKkn68G7f02FZIDB/DmtYXKJn0I/Mae7XVMXtp44ghYYXsPnhuzFzGA9T/KG+nsMBpu42FTyDdl
	TmZPRw8YJx2sVmt5UIjFw0zPsKBqNW3cuY74BantCwGf9leEWhyQ73JtOL5I5e5Hlw/zPtH8U8O
	tdF123CtqVVmvfIqp8PVUAJHq/vJ74pi0Ul/cSTcjdjvZIXoEpQbE5FkuM9CNf1ec4vhCSyQgvv
	1ci1Eil1tbmTEW9F2T8oyWPyk2JMOaMHVL2IuMJtuOGeDhnBNozrrtb9IxbhYNQ3jELEV4IZH5m
	uA8Qmc//1D1n0=
X-Received: by 2002:a17:90a:e7c8:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-369518bad8bmr18310945a91.6.1779189325075;
        Tue, 19 May 2026 04:15:25 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c8:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-369518bad8bmr18310907a91.6.1779189324505;
        Tue, 19 May 2026 04:15:24 -0700 (PDT)
Received: from [10.133.33.118] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951059f4dsm13348541a91.0.2026.05.19.04.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:15:24 -0700 (PDT)
Message-ID: <b0093c7b-e079-4bc0-b5e3-61a47aef7e18@oss.qualcomm.com>
Date: Tue, 19 May 2026 19:15:20 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: glymur: add coresight nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-add-coresight-nodes-for-glymur-v4-1-45f54f441899@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260518-add-coresight-nodes-for-glymur-v4-1-45f54f441899@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c464d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sxtEvhXGaLqlDIbFQVIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ARldHSmzB9oJadWdVAPofyDkJpyllKNk
X-Proofpoint-GUID: ARldHSmzB9oJadWdVAPofyDkJpyllKNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMCBTYWx0ZWRfX8i3Zg/i+/s74
 oT/DBs6ClR3tDNtezZanHU36xqNspYaQGLEq6+lzoXlx5nadRY6yggmXGNtZHFdA7ILTn50Wc9n
 PjZvFBdu3coveOy8SSvSOdssuCEjAVPZ0CrtT0VQiIv+sGCYPGzop0iZMg+9jnxWOniXIvsMLaE
 1LDNuwd7oHzKfqQwefxkDmeHL6XzpL3ZpV37GNAxk2pdsgUnSxPn4tg75/YYttldqxa0GrhB3Lz
 m6AipFd+Ep6uei92Ckw0qgo2zx6jSviHaHTDMjuOQu61aZ+wugxKrtArhrYOouelJr9lTHSw5jN
 UZYabolehxoGaixkNz5wgYQ57uoe3Ga9OZGqZ6AKgYlv193tPG45bNXGXW8VAVjOnahLHVafRwR
 ouhbI/wQKJoOOTSpcjy/SYIw7r+rZEAtJHlRiPNVgMgUYmJgzV0PiLSXXHVeiN2h4wKM3RN+Y8d
 8euo0tiyHXZGQubU3IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190110



On 5/18/2026 1:47 PM, Jie Gan wrote:
> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
> some small subsystems, such as GCC, IPCC, PMU and so on.
> 
> Delete cti_wpss DT node on Mahua since this device will cause NoC issue
> on Mahua device.
> 

[...]

> +
> +		tn@11200000  {
> +			compatible = "qcom,coresight-tnoc", "arm,primecell";

TraceNoc is an amba device, but it has issue to probe through amba bus 
on Glymur platform. Its didnt report an error on the probe process, just 
deferred the probe process forevert because cannot vote clk in amba_probe.

Need update the compatible to force the device to probe with platform 
driver. Will send a new patch to address this issue.

Sorry for skipped this issue in previous versions.

Thanks,
Jie

> +			reg = <0x0 0x11200000 0x0 0x3c00>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					tn_ag_in6: endpoint {
> +						remote-endpoint = <&mm_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@10 {
> +					reg = <0x10>;
> +
> +					tn_ag_in16: endpoint {
> +						remote-endpoint = <&east_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@21 {
> +					reg = <0x21>;
> +
> +					tn_ag_in33: endpoint {
> +						remote-endpoint = <&west_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@23 {
> +					reg = <0x23>;
> +
> +					tn_ag_in35: endpoint {
> +						remote-endpoint = <&qm_tpdm_out>;
> +					};
> +				};
> +
> +				port@24 {
> +					reg = <0x24>;
> +
> +					tn_ag_in36: endpoint {
> +						remote-endpoint = <&gcc_tpdm_out>;
> +					};
> +				};
> +
> +				port@32 {
> +					reg = <0x32>;
> +
> +					tn_ag_in50: endpoint {
> +						remote-endpoint = <&pcie_rscc_tpda_out>;
> +					};
> +				};
> +
> +				port@35 {
> +					reg = <0x35>;
> +
> +					tn_ag_in53: endpoint {
> +						remote-endpoint = <&cdsp_funnel_out>;
> +					};
> +				};
> +
> +				port@3f {
> +					reg = <0x3f>;
> +
> +					tn_ag_in63: endpoint {
> +						remote-endpoint = <&center_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@40 {
> +					reg = <0x40>;
> +
> +					tn_ag_in64: endpoint {
> +						remote-endpoint = <&ipcc_cmb_tpdm_out>;
> +					};
> +				};
> +
> +				port@41 {
> +					reg = <0x41>;
> +
> +					tn_ag_in65: endpoint {
> +						remote-endpoint = <&qrng_tpdm_out>;
> +					};
> +				};
> +
> +				port@42 {
> +					reg = <0x42>;
> +
> +					tn_ag_in66: endpoint {
> +						remote-endpoint = <&pmu_tpdm_out>;
> +					};
> +				};
> +
> +				port@43 {
> +					reg = <0x43>;
> +
> +					tn_ag_in67: endpoint {
> +						remote-endpoint = <&rdpm_west_cmb0_tpdm_out>;
> +					};
> +				};
> +
> +				port@44 {
> +					reg = <0x44>;
> +
> +					tn_ag_in68: endpoint {
> +						remote-endpoint = <&rdpm_west_cmb1_tpdm_out>;
> +					};
> +				};
> +
> +				port@45 {
> +					reg = <0x45>;
> +
> +					tn_ag_in69: endpoint {
> +						remote-endpoint = <&rdpm_west_cmb2_tpdm_out>;
> +					};
> +				};
> +
> +				port@4b {
> +					reg = <0x4b>;
> +
> +					tn_ag_in75: endpoint {
> +						remote-endpoint = <&south_dsb2_tpdm_out>;
> +					};
> +				};
> +
> +				port@52 {
> +					reg = <0x52>;
> +
> +					tn_ag_in82: endpoint {
> +						remote-endpoint = <&south_dsb_tpdm_out>;
> +					};
> +				};
> +
> +				port@53 {
> +					reg = <0x53>;
> +
> +					tn_ag_in83: endpoint {
> +						remote-endpoint = <&center_dsb1_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tn_ag_out: endpoint {
> +						remote-endpoint = <&funnel0_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11207000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11207000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					mm_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1120b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1120b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					east_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in16>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11213000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11213000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					west_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in33>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11219000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11219000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					center_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in63>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ipcc_cmb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in64>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					qrng_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in65>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					pmu_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in66>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121d000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					rdpm_west_cmb0_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in67>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121e000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					rdpm_west_cmb1_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in68>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1121f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1121f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					rdpm_west_cmb2_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in69>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11220000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11220000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					center_dsb1_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in83>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11224000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11224000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					south_dsb2_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in75>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11228000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11228000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					south_dsb_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in82>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11470000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11470000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					pcie_rscc_tpdm_out: endpoint {
> +						remote-endpoint = <&pcie_rscc_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@11471000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x11471000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					pcie_rscc_tpda_in0: endpoint {
> +						remote-endpoint = <&pcie_rscc_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					pcie_rscc_tpda_out: endpoint {
> +						remote-endpoint = <&tn_ag_in50>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c03000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c03000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio4_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@11c04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x11c04000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					aoss_funnel_in5: endpoint {
> +						remote-endpoint = <&aoss_tpda_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					aoss_funnel_in6: endpoint {
> +						remote-endpoint = <&funnel0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_funnel_out: endpoint {
> +						remote-endpoint = <&etf0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc_etf: tmc@11c05000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x11c05000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					etf0_in: endpoint {
> +						remote-endpoint = <&aoss_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					etf0_out: endpoint {
> +						remote-endpoint = <&swao_rep_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@11c06000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x11c06000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					swao_rep_in: endpoint {
> +						remote-endpoint = <&etf0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					swao_rep_out1: endpoint {
> +						remote-endpoint = <&eud_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@11c08000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x11c08000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					aoss_tpda_in0: endpoint {
> +						remote-endpoint = <&swao_prio0_tpdm_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					aoss_tpda_in1: endpoint {
> +						remote-endpoint = <&swao_prio1_tpdm_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					aoss_tpda_in2: endpoint {
> +						remote-endpoint = <&swao_prio2_tpdm_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					aoss_tpda_in3: endpoint {
> +						remote-endpoint = <&swao_prio3_tpdm_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					aoss_tpda_in4: endpoint {
> +						remote-endpoint = <&swao_prio4_tpdm_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					aoss_tpda_in5: endpoint {
> +						remote-endpoint = <&swao_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_tpda_out: endpoint {
> +						remote-endpoint = <&aoss_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c09000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c09000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio0_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c0a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c0a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio1_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c0b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c0b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio2_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c0c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c0c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_prio3_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11c0d000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11c0d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					swao_tpdm_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in5>;
> +					};
> +				};
> +			};
> +		};
> +
>   		apps_smmu: iommu@15000000 {
>   			compatible = "qcom,glymur-smmu-500",
>   				     "qcom,smmu-500",
> @@ -7132,4 +8173,60 @@ gpuss-1-critical {
>   			};
>   		};
>   	};
> +
> +	tpdm-cdsp-llm {
> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_llm_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-llm2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_llm2_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-cmsr {
> +		compatible = "qcom,coresight-static-tpdm";
> +
> +		qcom,cmb-element-bits = <32>;
> +		qcom,dsb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_cmsr_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-cmsr2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +
> +		qcom,cmb-element-bits = <32>;
> +		qcom,dsb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_cmsr2_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in4>;
> +				};
> +			};
> +		};
> +	};
>   };
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
> index 990a02c6afc1..22822b6b2e8b 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -21,6 +21,7 @@
>   /delete-node/ &cpu_pd15;
>   /delete-node/ &cpu_pd16;
>   /delete-node/ &cpu_pd17;
> +/delete-node/ &cti_wpss;
>   /delete-node/ &thermal_aoss_6;
>   /delete-node/ &thermal_aoss_7;
>   /delete-node/ &thermal_cpu_2_0_0;
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260515-add-coresight-nodes-for-glymur-49045aa9ede8
> 
> Best regards,

