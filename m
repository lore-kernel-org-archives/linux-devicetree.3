Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB343F8AD
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432487; cv=none; b=K/fcxDiya+ZbUeYYlsti9rpS8nbT2OE4cobc1ETFCgWW6ESImFf8/1RveCnN7/10SAx0aJ6QyH45KUx3kG+tXKRq2SS7P6EJjJiq1XTqoDfpqs2/cpFtPW8MzM2zyfjTtQgwkATn1R6CMNpUJoky6/im2rWnnRNC0wVQ+tmzlds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432487; c=relaxed/simple;
	bh=Osmv4Wap3u0uQzjri8ejGvYfJHjdZLrODCij3mF+Wbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=os1bWn2/Uedm5tQlEmNdOym4oh0oR1wlqbkNatJMjnhNYasJrIEZimDPzMB8DGu9KxzjzAjgTxAjjD0+nbWaA+WCHpVdIrjl+w6YxzilJIEYE52ebL4cf5DZxgfPASzBLPaCeNktUGAAWsytQh0WwcaBuX3qKKluFWLO0RZzZfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HuAI0VjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jejxEckN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HuAI0VjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jejxEckN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXVZq1571688
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMuu0A2zLBLeq5WtkIstXqtuhPjcCBJYuGafSWQPTt8=; b=HuAI0VjZeE4qRX9v
	OLSjQpQEezj4chaQg+0hiRVlj4WYyDKVnY1IOtocMDttG/SlMi0sxagMqLxAmSR0
	4/FLJyNuDFsJTGPENt/B1Y31tP3mcZ7cAj8LHsDBUezOb3C9+BHNlJP70VukRGUv
	1K9Muw8g/Nqni+XuZAdsjXHdv2VZsUF5Omg/w5pv3FrRfI8c3Dt9AOqHu0dXTgno
	pcFk3jKpX9L7RUqaWT69qN1EXgBfZeYMiKIOuQ3Ihlq1jP0wF8yp/7s07gDa+9AF
	2uyESuRxJpttp+YYIuqT/mQc44hr7Kt7VYHBfvn6xtmv47OllCJ6dqkv7RZ4dsdk
	WRohPQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891h248-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:28:05 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf87ca30b3so8274e0c.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785432484; x=1786037284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMuu0A2zLBLeq5WtkIstXqtuhPjcCBJYuGafSWQPTt8=;
        b=jejxEckNLxKj1ilVGSstS+jWtKO/epSkTYV87Y7hwTXbre9EkDG5Q3OyrGO1YjDaCz
         BifKFvEMn6Oi6NN3EYalGT6b7WRNkrRkdr8sNothCofSUD9hQI7yVnETU1FVycGP5nXI
         gQhwB8h0vmpbSNE609nJ00Fp9gEs3IdEpWbeEuE0GkXrRRH/fHuN4cZx04RwcK2l2uy2
         /5kcxTMXtoLHY71ZZ6jtUFA7kw/Yo8SzZxXxqgADTbWX5YKM6mKQ3geyks3ZUn3HZJRp
         xr568rMnaCCKFPJ45MDTaYQpl691gE+O8G1GpwAaOgCqwdLKRltnL7HIOj7Nj9bYw1Nc
         VIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785432484; x=1786037284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMuu0A2zLBLeq5WtkIstXqtuhPjcCBJYuGafSWQPTt8=;
        b=YGqqd1AYFaCT2peyb2WQ7ru/JR/53L8sQZZsWuYMwA+HbHnkfyVLGisJi3v/gBKnMY
         aM+d28F6TFhqhVFEgV1ypSnyrJar0rlW7pdrJ4+ABT+CGVuOqknDVLnu8wZSB5HyO3sN
         1UDqX7ic64ClhVISy85ki4F46W072SBVG0MIBL+wE6fQgLInCMu/2A3GHx7skiQw4iBt
         cF/2sqosVjARjdXXz4oWlQBVx1+epFeqVppS/XA3B6Afp0gB0sFfaGydWXHNYPBnOZ/R
         Lt32k1yYmMFGFp1stgCBYJ8KP9SmQedT4IT7nvTmKz8LgNnhVmi4YiZxYKdJ/yCmDmIR
         lwIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcXtA+QqJ97mIbRfsMzov72Qr+AuK/3Xxtco/oR0SpQTLfaCktRhW/5k5PvxVQGI+pHqY+4nI2QwEH@vger.kernel.org
X-Gm-Message-State: AOJu0YyWUC7co6D9QHQC45fbwARosTrNfupb+RPPeDDse5cOBqIcg80R
	GLQh+UPb/EikO1k97ePddfuN9y0JTJr7XaE6pAkrx01h661IUrt5IoHUEsx1cX7Dd2/GneJNDVy
	x/EC0ZzyaBH9Z+LI4mbIQGzzgIT8eZ01kSwbeVu+ZTdLzti2QbXr2JoOlOfsbWQA0
X-Gm-Gg: AR+sD13Np2hQWc6PCRzehbkpSKXVqSCVBVRAjlY1DSrAP0h08iaK1efFmmHYtS/jHrL
	7iE+BGtqN5hehyT9XSqYm0hE6FUCx0Um1n7PWf0MVeUQFo5dHG974ynmQtUQtNiI/u5Nd4vQ7J7
	YrUUAMtF7UaTCRPc1uR+bItK9cwf8ut9GNdWeFaV7UNJ7JjD7S1bYfUm64BCp7ur7thwOSSOA4F
	K/B/2VST+BZoEAnvDrxLKGt0fzZtMcmIPCZUYR6QbThCtUHHlDGIxNYK7NAxDBSoRjS60Le7Ea7
	2IIQdl/gL6FozmnaCvZto2h6Rj+jC6aNda2z0XAZLXSJXOkpmDC6SYkOB2dXjWZ3Cb2pRq5I2ZE
	DUV/+f2fG4F7vX414dhsC+Bt8
X-Received: by 2002:a05:6102:8090:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-758407c7a45mr690809137.2.1785432484393;
        Thu, 30 Jul 2026 10:28:04 -0700 (PDT)
X-Received: by 2002:a05:6102:8090:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-758407c7a45mr690775137.2.1785432483984;
        Thu, 30 Jul 2026 10:28:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07c7682bfsm930232a12.1.2026.07.30.10.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:28:03 -0700 (PDT)
Message-ID: <d8e189a3-a6ed-4f49-a1c0-74eff444a2f0@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:27:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
 <20260729-b4-monaco-evk-m2-v1-v2-3-0548e1dab760@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-b4-monaco-evk-m2-v1-v2-3-0548e1dab760@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMCBTYWx0ZWRfXwg8IWU0u6mb5
 +x4aDuBU4hKhL11JkPnN0jpxxgHmN1I20MhE+meTw189bsIuOaDsdJ/aqgoszWnFZso2/gGdzZb
 vQyGUodTZCxp7/Y3RCE2ydjgxC4/5QhLuhQGL3aA8O22iIdnv1+VeBPN+FP4Cgie2jY2Llvr0vO
 ZOK2TkKOQwAnYR2cPYvjeV9OgfFWozQTkIt9wQGGsU2ZZ9+V0aDzzoqtx/4rkAz+EN7aFcPa2vc
 IIsino6iNKjGUDWGNAGzW+nR0avezLmQL2PFadg9mBzRFR1bzBiwUPW1hJlm1W8htUCbY2+D1Co
 QF562/fPAA/WqjrFoY58nGMtKopXDSf9oz+RRYURdk/PNQ0E7nn75YP1Iu0zTpq7EHmmneXaZ5n
 g4jKKkpsfs+Q1CdJ2BuCAyYhQunPwtBiH1bApiB501idCfZbtc9xV97h/XuRgqbhBzXIMh+dBbc
 5r/eYVXq5zGWSpkoJmg==
X-Proofpoint-ORIG-GUID: iRvDmIyMQEArnYq-qNe3qOSJCVmi1KEz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMCBTYWx0ZWRfXzYWxPZz1eMG6
 PrcUicLdH41w9G4KiY6FDJxDbHWohUPMWrM8y2cYMFs5L229yPN6RdbEO89XLgMY3PR35pBBz2+
 0SapkCMXUSL0FhSJzrD2TY9OsOBqpqQ=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b89a5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=o6hxxGuBoCr4vFw-Q0cA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: iRvDmIyMQEArnYq-qNe3qOSJCVmi1KEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300130

On 7/29/26 4:40 AM, Wei Deng wrote:
> The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART2 nodes through graph port/endpoint.
> 
> The M.2 Key E connector is powered by a 3.3V fixed regulator
> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> (vreg_dcin_12v). Both regulators are always-on and are required by the
> pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart2 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART2 interface.
> 
> The graph endpoint anchors (pcieport0_ep, uart2_ep) referenced here are
> defined in monaco.dtsi (see "arm64: dts: qcom: monaco: Add graph
> port/endpoint anchors to pcieport0 and uart2").
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

[...]

> +	vreg_dcin_12v: regulator-dcin-12v {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_DCIN_12V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		vin-supply = <&vreg_dcin_12v>;

The 12v supply is not controllable, so we may drop it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
