Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866210;
	b=0pYsBJgxtbnN5hBRPw5gzUfMD9YbbbjlUaGN2bBOmnbw+ksT0drP6UXd6vx7PJ9Iqup+
	 x+9W8KkOJTn1yqxt+gPjDwv2+omgpUwnsLRB5g+ceHJk2wK9IMqQmokVyB376jJD/uuQ/
	 ST7SvXGEBBZNbcyoNZREMyyNTYwqUpH8vNcepD5D++kHNQ+RorGLFNhW5cj0NDwu6r3l4
	 OCHZrAY/SIVr8aSPtohYqrGISocNieahY9JLoR+QaciKJBoN0uIHHHAPMRC6TWmBwQIv/
	 Ywe9fhZ6UKgAAP6W8OqZSaK2KkJ70TOC3+AW68sOkJ7UyiNHhDZoG35x5YPi9BF46SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=;
	b=119e2lxt2nFGXRHjLiryBLJ3Eg5wK0u1GO0Sk+e1bz08G+g4SmqvDuRuXvKtXh/2A7mi
	 YsV4E+ijYuxUCEfv2QwPZug4SL7BKFjopyUytfs9yWKfUO79BryCekpp/OaOPhvStA7AK
	 aLOdFBwsZfJrTMFteYCgmjeau4J8wZMcM0Ln1TQDeQCR2RRc4toBZ1of31mo3x9FqlaGG
	 fElOIRtJSkAm0qHh9vPamsx4bn1MPDQ2DkiELE8NjXHfXFHE+bT2Xtkin4hwS9lbFk6Mw
	 qAfrkqg6URUQS0PIhsdOlFBhGI7u4vKUOfLEyMbTaQdDGNcnt7cHEi58XyOpr7pwR5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA6xXSPB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afgVncg2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83366606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83366606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA6xXSPB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afgVncg2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U2o54169549
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 08:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=; b=RA6xXSPB8IgDwEgw
	iFql28FVT3DV3YG/OHZ1WIg6wkOABHxSY+Q0KboQnI0ACfyCI9two7veOTEQZEaX
	U/xi2F92jWc8cMBtsymeLEF73jAAZAmZGdMJ1yKrWDcVanhn1PxrweklJoqjLgbc
	NGsHOtg9B8jMUvm/nPiCZ7FeSMTZ/A8AxLxOpyAfm96rG37txWWWcGUepW/W6vKp
	fFc0/6jxU2YMYTr4z+EIUTZNbsPhyOKu2SDSpuc/Jb8Y2XehR8evDlFB9tZFWPKL
	UgtaQLM79FouqKXLyNXMYn2yEDVzZQfhIqItkbYDAPChAtpb7RRavAQRlYEl78Fu
	Izg74w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8dm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:10:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ca23ede8fso3473436d6.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866203; x=1794471003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=;
        b=afgVncg2ppGg3emTNFc9SrQpbvFA+9cgZWue3TkYdXavA4h/ccjekoV6b/rL4WRq30
         1MasAq6HxpSncWZzGh6tIG1FS0GVPJtLzijN7L4Lo1JJdh8xGHnxsVbYKes4aNY3OUXa
         ldHkT4hnH8F4QRitDvXyeQn2KcdIISlj+x4KkXmLdMzGg7wi8PC/jAA2vNaq8WvqBDI0
         Qi3Mc7qdkj10mPOiLMpoZHmf4RvUJ2usjP8vZxdEHeCSmx99T+RmLMUNHykPTij9ABtS
         Pnviupom3b7CRIVP/XqfXNTp1Eq37h8i6elm2MGP0ubNmC88ipqhStsNc0Dh30VDQNlM
         zmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866203; x=1794471003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=;
        b=TyAgOIxiPOl2bm86crM8wMKBCDY8N5CF4an416EsLhbraBSnztsfNUEiafVzx+cGsR
         aP3DrRkB8S82TPiGth4SqNVX2jzOrTZYinszTlbU3FbH3txu33uMNNlnI/R4BmDEuHJG
         NWYIu4DPHYkubHWt5Xlor6DLZcBjbuwiL7x7+v2jwoIsdoRCr6wayiceE62psEvKGqQx
         ryJnoPxQZmOoA598JdXjepDHdieoGLzm4xqDWLfllex1VK1Er8IRyDWz8f8AAWMDKwEg
         ECMWHfzN0HOYtnGu5TuaO+lwzmQIancdZaYOLaHkCQ6jPqOUy2MshXuybkdLQhKcDXLA
         9xWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3ciKdfgEiUIemuGg4FAk/tgXsd8OoLaQdXqls4myjaHLq4IBK0zctSQTXmfEE+Etfn1pmkXMfpPJn@vger.kernel.org
X-Gm-Message-State: APuU4Z9agzkFhAb+eZvGAy/xGQcDLA0FIy2lAqGryAtJcTZ1oWFvj048
	/9sVR/n/gfHILIqbbnesb56DuWSnJs7F8YMi04dMzlqWiZ51mVFF9fiNCnGn2aRfR5DCF4PkkJa
	P6A2OTnqXbYEABBHRVwxm09PXH2aKPB9pPPrjMAvewuDi63XWsFPhb4MkeXU12oulg0rwClsz
X-Gm-Gg: AYBFou0wQ0SGZTW0kZ5k/feO+WVpf5NdnTPcNY0lfkPVR8hSJPEmengj2nt1cQZ3SFP
	BBsMkOgxT0rYZGXqtMRUXEYt2D8jMbggAd/aqB71dvGRZcGgsKtpe+p8CpU2PIssR1j9jW+ctNz
	ufuqwWKZtMdwodProH8cmUYRFfTSmAtR+gIp6EppJ24N4GR0FsYkv097xAP8LRSLYfVJrtnqN9L
	7YTf0y1SILNRqfV54z48aXpucAZPc03EMhrv0VO2jB8BAvLSVAbm29WY5rRV6ZNW7LMfVwXiFFn
	gkt8sfxNYkcq+fSqrlcj23OZkf0COIDrdSCw1pmtU/9AUWE8ovhSsCV3X0idI3mu95sm8jNj1f4
	HA7Dam5CR+32OsAGR4MsbAmpcOAqfa43R5jbRyneA9/zuXdFi7+4epMkYlmGG8bdv068k
X-Received: by 2002:a05:6214:c2d:b0:91c:6e94:3b51 with SMTP id 6a1803df08f44-91ca47aa2f0mr413080856d6.0.1793866202551;
        Thu, 05 Nov 2026 00:10:02 -0800 (PST)
X-Received: by 2002:a05:6214:c2d:b0:91c:6e94:3b51 with SMTP id 6a1803df08f44-91ca47aa2f0mr413080546d6.0.1793866202158;
        Thu, 05 Nov 2026 00:10:02 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d03esm1527170a12.24.2026.11.05.00.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:09:59 -0800 (PST)
Message-ID: <b2498fed-5420-44a3-a215-02438b623ef6@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:09:57 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325: Add Samsung Galaxy M52 5G
To: korryasdlerto@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
 <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec39db cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=Jnuh3jzrMT71hIFIYhcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: o1pJOXpxGTfgXL9l6qyXhGDNzyGpU3Gy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX0MTfhQxbvhYy
 RGFUNt6rJxJLc57uKQctQPMjVJZUA8BtwOkehUXMckt/ENosQDOsGMB7p/Vk87YPeQiqH9d84po
 CFj4Xt1XkSaPghlessd1bPBgwMYsFo0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX9G5Ht/oy2MNn
 7aj9nz4VceF9jFI1PHXjvdzimd2nxRJQXiQ6WY0I7A5JqwEmUP3ATWEH+DN7pwjNXabW7MO2uZy
 hTu6bHDHTrTualzkHoe+NA2WbEME1x3vkEZWqiCdzHeVgVq/Kujr7u5e4VHJSEAtzQxnem9HlE4
 NPcKB7mQkiqJ9jPRe39UqczuNGnyuAXYa7iX8qcPXJsy/o+1D03B6+uAUhq9MIanmOPCrOKXfe7
 LgKUqBwPcrzNwdkDlEcLU/kMJqQskf2D9G48ncfEueKTEDWzpmE+lF7GJgeRS2jIzKwY9yvd5h6
 V7EDBV18dpyA6FdMNHN/0qJN03QMAF9I6AUoXcXZgp/xJeicq3sFdh3RCPuSsuy3YvQQNfXOk3P
 8bSgsTc1Lr+8vAO08ank0iZEyWcnG+r9xKi2G/o/2tUM1xCsZnoYOpuPD1WHPakJ7ZP62PHrDIF
 3Fy0sq79nC9DPb/k3vA==
X-Proofpoint-ORIG-GUID: o1pJOXpxGTfgXL9l6qyXhGDNzyGpU3Gy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 7:59 PM, Asdlerto Korry via B4 Relay wrote:
> From: Asdlerto Korry <korryasdlerto@gmail.com>
> 
> Add the device tree for the Samsung Galaxy M52 5G (samsung,m52xq)
> smartphone, which is based on the SM7325 SoC.

[...]

> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@e1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;

Drop the reg and unit address (numbers after the @ sign), since you
have a memory-region handle

[...]


> +	/* NFC chip power, switched by TLMM 42 (no consumer property in the binding) */

Please fix the binding

[...]

> +&usb_1 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	status = "okay";
> +};

No superspeed / displayport?

Konrad
