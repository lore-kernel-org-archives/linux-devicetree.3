Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26E2C1594
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762611; cv=none; b=E9ZxCYWHQViPbjlKYgVLCa2FK5ZbB0Tz0YsziaaMIyuME5Ek/281/RlrIo0JqH1YBE0HBWX7YjmVSNRvQ/SCy+hOQOglLJJKCNguj3a1xsTj7XEn5rvBuGgeOMAhTWd5BnInUGUwWi5ofe56ZVOyTe/4C8ke3/uR5EQDMj7919Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762611; c=relaxed/simple;
	bh=5WxmdUO3QYYjWtLbTWfcSXQWZpK2u4YbsYkn6Q0Qv8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/olDB7l3B/ROYsU/E1P2KQtlMV68Yh6RnNMVAn/KWVb/S7usJYzqSltqjLYTgjp7sGfb6wmWVUxo3MtEpTVh7xmFpaViulrkrbs3U3V2XXcdH5mvTQkqUPEv8pOe1e4jP56tAnwtoMrfjQuPJLgRcbzDvOVTyL47i2FNQJZhZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTnpVJrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PEOX0MGH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTnpVJrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PEOX0MGH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBelS02261815
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=; b=WTnpVJrSxdmUwNhd
	6OnwELisSHFfwHwNb57jJAIMiM4R/w+Zisp/JAhJgSHJbksSZTLcRgXos6ymekCV
	La1pdg7stJ8GSN+wKtWR+ONa1eqf41tiNg9suNWeI3Uiio0ugBKLoNWtKrsbKd0m
	2Jo0wJIcXcF0gyr84Kgag3qloKqLV21+lJX1aRSXCAAL1MrD+tPYG1o6FgIfkwP5
	qyQxQ0zEp0oyN4Spc2hI+41KgIfKOhWcueMKjNDbHDIZGx/APouCxSZNz0sRmAgM
	y//yKVb5qRZYteVpEg0upBvCbObqpcYr3X/8QZqzFatGZSKgHBix5fgHzCNJ/vQ5
	hRJvYw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hhtws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:43:29 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751eff95d6so464088e0c.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762608; x=1779367408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=;
        b=PEOX0MGHOZh1XSB3kdEGD9izPtpu2TxzGVFnWFNr6B/XfbKldV6QOpi25V8W9k0xFz
         dGb6vPzzSOmTcJV+mzoCJbvZ38+IQGm61z/MhJqwTkf0HfyQmI0Ln5RM//EUbPx8pURo
         Yb4aMMHdFK2eCbR2iDMXWNwtitzeB8IXF3upzZBHTD5sWFTLrruvy39neuOoi/08iqlv
         it1OzVkznFA98K9p9nUiwviZ26TZnAXMnM3ZceLhmS1oQjTjgYvHx9qDb9IrBB04gRj0
         f9ltIJ/hqUamiJ+/3xIONtpBO83OGPnr6h73GdaN2OABTG1W/US2Rur8Po6eUEJGYaz0
         vItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762608; x=1779367408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=;
        b=Aspj0v5aMnwIRFBWekimaOH6KEHlw7sc49M5psG9MQgBPDUxk4fM8FT8HaAtaIMp1j
         LuMDST5rjhYi3gmcn4anTwd3RUMXdwq1FWPDl21vQdFEYcrYgF6n9+e5NZ1suenzt4Zg
         FTWuMRGECKJMkeZCLH/4xrF+KMnqMaBOwTXDf1Hkx+Jxa25UHWQ7rkpyAZLQJL31TjFF
         iq3uN3buCu6pNlKq5PChugWmfJ0649jqqMhP4KIc12q5JcbP1nwNS+ukP/9y/reRXpo4
         RQtkDnuSArq9YJlHy+35+VA56T1yucNCXFo0VA3h0Enbs3vRpybfYfgW3dp+1/k54OKz
         wEUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AUle8+EZSRiT5WaqJ82t+6Hi5p6PbzkKaEIIC9D50lmUPxgrqZG5zyT3zaSQaEtDQSyNu1298aE3A@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJpxlq8nvVc2IVU90ep7ybSKwJbXog8RbIZMvnOEjNlSwd1Vo
	UavKyx8oIzldHh58dkXqTGv7AyjhYA+zDnnHb7gv2VdEyKDrOpLPPBLGwfDa+VDt2Gi7t0CNpf1
	j/H0RfAopHw25zGYr2fwlV0r5FFqpK/H2mdiQ/h3eEC4sDAwM1fEei5g8rHZesfSH
X-Gm-Gg: Acq92OGAgWeresNom6qLe3KS6vc33UzyNwcXDfMapxvw5hnVUwTKQnn1TmWqbIbaAB8
	cSp5+t9J4JF1AHKHGStDNHuATU2G4gyJ32UkRDEQFKadBRLki2Y/5bYB0Iu4TG39jXTK9b8Pg+8
	lAUO+svNvmgLW/OVAyiSe+2412esLYg1wKs9UyleCpjreE8FCYBsx61iyZRpFLKr7SIuyh6L4DG
	XokIG93ZsKNtpRfd+kJRbhfZ7vfdXgcwkTMpEJHBSi1p0UtK8ttZPl74s0/NzWmCvU90zIA0a/y
	iJaGZD8/40+rh/wcuXvg1mDJyJWlNn0vma8M/gUQIE1q/CSkkqKw648wvLFbxTOYVPJapnPDCmH
	Ad84YOYc7L9vcxTXEj3oRfNnZfeDh+LVr2Htd8BwBSzhNJEwfV2WRSOkh7uCPi6wJq/0mzamzYp
	CW++g=
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr1205253137.3.1778762608390;
        Thu, 14 May 2026 05:43:28 -0700 (PDT)
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr1205248137.3.1778762607958;
        Thu, 14 May 2026 05:43:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4de6f1dsm86629066b.31.2026.05.14.05.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:43:26 -0700 (PDT)
Message-ID: <14a2fbfd-97c1-4ba7-aa51-a07134102d3b@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:43:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aXWlpRF67SSGA4OrPd7WY7SmQTqVIEKl
X-Proofpoint-ORIG-GUID: aXWlpRF67SSGA4OrPd7WY7SmQTqVIEKl
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a05c371 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pN7wo_Rnn8_v9tKSZuAA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNyBTYWx0ZWRfX3de2xrKOvUEa
 NmF0QF2DcfiVWJeX+NAZcbDGz9X9q3Xv2Hfijj0WSi5tKHWtts9fEhvXsUL2gAMZTdqHSg5EoRf
 oOQpop8cKEWDoh27b6ssvByqd0e31UdfuORlwzypoxuLvSftBbZWHmkGNDXyUE5ZVXE6ARcuGw/
 SlsRx/0w0eYePzGRzlJtYMvax5cDTJXfDGYJFT0awbzgrvWgDiGB+XQXsVWKBTBD/OFKZGvc6Zk
 7L/jHnx1nrpAKRjs3zvfznFIsGyPIVSPuyBkO516G4cadKXjwOnUyQKVuJIUvG1TAe1RJlLGEke
 jJof8kE0Be6EeqA3nJNYEipEwZkWtenzDk+vZPQKAh7LT47Hnj1ptjnIzvnWTGO2dLFXhBSUqa/
 egBhSjtDjRRLOAHsnKv0Sjd/JD2qBFBcZZCKOeNvxtjsXnimsS434oNz+9GoigJ2WiwUSi0yCCw
 3UCEHyR/yDEI4/MW6yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140127

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2-adreno",
> +					     "operating-points-v2";
> +
> +				opp-222000000 {
> +					opp-hz = /bits/ 64 <222000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
> +					opp-peak-kBps = <2136718>;
> +					opp-supported-hw = <0x0f>;
> +					/* ACD is disabled */
> +				};

The clock plan also has a 160 MHz OPP @ LOWSVS_D3 and there's a couple of
interim OPPs that you have that aren't part of it (but maybe you have
better docs)

Otherwise lgtm but the size of the GPU region and the GMU base look
slightly confusing when I'm comparing them against the reg map

Konrad
