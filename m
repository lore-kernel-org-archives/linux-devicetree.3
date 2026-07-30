Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F903B1EEE
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393434; cv=none; b=Ny2+cnxNGW9zyP+LEY34Jvyks1XCIJ2sJL3L+GgzAQV0j8u+uMCMNntG+nTfi1Y1ZyjKxJEJy7+WTO9I5oiQlJ0xwBU/5YQp5XXxpP7q2Q/ISh+CZEWIgcR0Wy7cnSIQYMUnKfPjRM8PsyggYpZ35MhqSXk3XRnPlPpyEKuzhLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393434; c=relaxed/simple;
	bh=143qVcfHrDUndtdM+/SnV2vC7F35FUc3Kc9bqs9KHT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkFa2lGVjgup942MvDw7bDasP2ssdGxpMnvVnHsUMANXPMgr+N2rAfBvtE7ktM1DSgPCT7JE0felEbABWtRgvqq5LTPMRu6DdU9Df4uQc25+KwhdqnWahfY/cawZdXw3c/mcXsO12DRw6Utf9z4nvsKTTOv9veRiw4fu21mbS3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvszRTw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiswUGuR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvszRTw2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiswUGuR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6aeat033067
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/UOShqbHnV7Ke1cD00vlv35wu1bLj2I4lxM25OdUZA=; b=TvszRTw2kHk5SD7Y
	m+VGxf/yguCwWTSiZg9FVjbmDotbWjZhNkVEFe3fcYTTSXfJdHX3/xu3h4ad2XiI
	2/+yr4luMgp4VF7ak2Vf7iY+8VYLXrtnFBNZVkX6Mio7pwA8wE3aFDZn4CTEBfpR
	Oa4TsIFZ2ptSBS1cY0P/CpC5j++lZ88DjyxD2zatgrHbSC3GYlxkg601imFOyiMw
	Q9ss/7dDPgao5yigLKHGy8PAAoDSz4KVHSK9YR596OUoIRVx5wOVVtIoG3w+hWrn
	aqCC4IohOteltobyui0Djth6C1ELRZwEALlVCt5hsdQWOIpd1I7kkI74ba+i8+Fz
	OFFwcw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr1d9g181-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:37:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a3514f912so3285402b3a.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 23:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785393430; x=1785998230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/UOShqbHnV7Ke1cD00vlv35wu1bLj2I4lxM25OdUZA=;
        b=EiswUGuRdyfj7K6MDuLf4wmn2uQXu0u5uARka1Q2Ag2IYZzH5L3f4OdJTXEQ3CN8Nz
         Ma+kaLH+i0fW4i5wc5N5WUjZlo8/LYX2CkEItKfheTYjgqeX2jz7Np5r6JDPXf0kl5Lr
         K5zrkG5JeYjfHVIPBNhAiqXNgrAShAQqaWTr0QgdoCAK/wTPbdSFvWIo/LQ9wOcEUWTd
         vyh4OkX9JzS6FUqFtUXhUjf97jJxyCDp2n/4X3QwlHc6OH6hgukcaZh4B2eTnDYlmyAb
         FWFvGIsQT1xYT3XMwu5y33v5vEgLiGz6qocFrq0CxaC//ouYFsjsl/lyUYhkyMeIDpwf
         WDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393430; x=1785998230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/UOShqbHnV7Ke1cD00vlv35wu1bLj2I4lxM25OdUZA=;
        b=bhLp51YxNwViKCXHstzevJaz6a5bv0y5C9KlyVbQPo5jDpnKScanR1PxPEpj03Expc
         g6ypjSF+6BkuPp5PDlbjedMsgMUG+osBBwIJ/pZ0TNJfNZG7S+lWRrb64ToAyMeDYs/2
         gyy79yJnsjuTM9JeDPHVAFWcoPObyS53RLfVaLGg3T6hxlKaBZU01hInOzDvKPHxxIm9
         wAP53+FT/Os4TGmUSPOmPExlPQcb4i059H8ZYgd6u1hA/L4O5INFEXBENS2Rnu934ETA
         jx6uFiB8YVLLqScdk2TPKqdOsWCyp7Se8ze9jsY8sYVForgqbBzgJQcztLKIslWrCRaF
         ttxw==
X-Forwarded-Encrypted: i=1; AHgh+RozqLdk4pNCm06AAW00YqUdd4xqcC3dNRtRmqWYooOPvPecZhFR4gKGMcRMTgRyMus6aqDpPW7wOrtX@vger.kernel.org
X-Gm-Message-State: AOJu0YzRMvEakXtaKE4ZS8cfSHHIkBbh4aQabzTAybyNo4USyEPbmYOO
	D0Qqf+qITdfbaSOXjxWYl65n1rc4GkPORNWYl29+kN1HgPV/Xh2K8tu0C1iM9xKS7DChV+uDX09
	q8wvHIniadCNcg+gVE1RWkBWFbniSXJYBDK6YTSSAKI5WpUE//+7G+JewFIUKyzTi
X-Gm-Gg: AR+sD10DxNW8Ydjzb6Hfd4nPpDrculVpIDyRj8t2Xowce951mlB7leOz4mSqfe1RcW8
	Cu5l/h9LOkrWOog8mzfSMABP7tAy4K2ERA91Od8dH0egVnIncPDU3vn9vo6QmcBxBvyMfrmZ44F
	UKQ/sj28rDXeWjVUkeFcNDOEyvMzj+prNXe5dL5Hr51TVcTnzjaGcimWZuhWG+kGphX4wt4O5c5
	KG7gvLOvH3YSNypNfeEXIH+m9RX9qPgxAVqzIXNYx81VtFALTVeAjoowduR+rj0Wx5lqYk4/G7v
	nR4HNDONgO2TcQkXA/sb2a510hs64VyzgaKXHudP/2Z5fmLE/pv0R/FxwYqVTBtWc1H4QbyfdI5
	WiOTUA4tExRyMhAY/H8WUCbltBbqZlg4mUSIowY2yo8jWfUDKTEYDzYAGl6FQiPeMcoCq4n85hn
	WBE6R1e+sBxgkngQ==
X-Received: by 2002:aa7:88c9:0:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-84ebc4247cfmr1485945b3a.75.1785393430528;
        Wed, 29 Jul 2026 23:37:10 -0700 (PDT)
X-Received: by 2002:aa7:88c9:0:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-84ebc4247cfmr1485930b3a.75.1785393430157;
        Wed, 29 Jul 2026 23:37:10 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373cd3sm2457635b3a.42.2026.07.29.23.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 23:37:09 -0700 (PDT)
Message-ID: <6f2fc314-9e39-4bf7-b1ce-b51dd564daf7@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 12:07:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
 <b451e31a-cc1d-4e0a-9686-c04ba33720e2@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b451e31a-cc1d-4e0a-9686-c04ba33720e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CgI6FCbuShBfJb1vwGE2YISfoBSgc_de
X-Authority-Analysis: v=2.4 cv=OZ2oyBTY c=1 sm=1 tr=0 ts=6a6af117 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EJZTz2ZzxWxwHnGGTj8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: CgI6FCbuShBfJb1vwGE2YISfoBSgc_de
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfXxTzRof4Nhgb0
 qAAu2OMPkvPOaXsJzAWbQQNEvNYSGO1DLzrqdvUtELQWJ0qioV9imUuSD2DRd9fCVJDY5jjNeP/
 Uboy7/R3EXsrUy9E/4X0qiNFtiUSipy8sQPuaYNUTfzIVhqYJvUvQaICRKzMoj0MXreiYEFpCCx
 VSZTCIL3bKWu9m3Mn4pnZ7xYelr6lKpARlU2aJXQT5fc7mkJ/ExYBeGz86Lg7Rly0pUz3svZFGs
 lVTGjeUtnZkJ16UTnUy9lhNWnexC/KPhv+gBt8elQ9Sl3esP3hXx489IJ9bi5rtgW31/lakFOwg
 0gu2sD01fumLzghnaNq6ZHzf+1VtAWaOf0Gh2ZUVqZPLA96SAZm9xlIPaHqyGe5v7+fzlsf96QY
 SwRPVmDH9oqiBF7mA965SntX4Yy8YwwKUqslkZtDdgkpx8E7eR0PqAKlUwoHAKrLhDzDcRGKsiZ
 ciYXHV8wJj4xEWHIMjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfXx+32gujMX9Cz
 siE89k9FGLwREGGLGu7Iqw4uJ2jSLRzVnqiKfWAh6JiUcyjKoQ/q22W/DlaZWj0ISSP5td1Gxh8
 Lbeq2/hjjGqxp+5v/dgFf0glcTFXCY0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300045



On 7/29/2026 4:38 PM, Konrad Dybcio wrote:
>> +	if (!i2c_check_functionality(client->adapter,
>> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
>> +				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
>> +		return -EOPNOTSUPP;
> return dev_err_probe(dev, -EOPNOTSUPP, "I2C adapter missing required functionality\n")

Ack, will switch to dev_err_probe() there so a probe failure due to
missing adapter functionality actually shows up in dmesg.

-- 
Best Regards,
Anvesh

