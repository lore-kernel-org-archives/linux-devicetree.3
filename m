Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E4A3806C0
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068933; cv=none; b=k/v4FfQ9001SxU4yB+pde9Lig1eUNcz9A88m+2CZnRZ/HBTlMnVYOy4rZu7thY9ykCGmZV0mGXgXuJzTvMYeDRfOTAEdoSgKkJVyIC4vxywHaXDUf7vo96oP8+zvOemsaHqhbHrBvyQNOksqoBgiG8nnZHShA0qoasY5ryS0/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068933; c=relaxed/simple;
	bh=u70DmloeYG9B8atDr14Mh+dhu99umOa48nnxsXQLips=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwiBU1rNGDqqddvqR/8WCDD+iJX+MvTZdYIonmLvDO/DW46LbuIAxTxmub1jHtuUBN4d8u/9V1OSLIQER4SvTmlOUq40VcQpDA37mj7FV1n+vqktSNxNalALw0wUwxM3md4a3DgsSwZPylKiBORAaz0EFkEn+KZgjp58d1BmfNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IelQ4kck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzJsjeN1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IelQ4kck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzJsjeN1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6fVUd014375
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VLMdgLtUvVjpvadR/itTGoqc6ZbV9fFT5xXG0n1J018=; b=IelQ4kcksmPHlwWE
	sRIbHx/MtDfOYCRBVVe/jxNnE45VPMAXyQzYEdBWkNeuhVQyosgvao9m4MIMhCHY
	P34gyf37Knae/mtY/GmWXbkF3jrhFFS1wZ9skyQjzXXxLtOVbFosyzyqZ2xJCPXJ
	H6WGjzoAy19GK7vMG8g2lheuPVVIHakRNRnZRf2caw3eLJ6VJ73wXJY8K78S7nuj
	vg3jGm/av/1xQCLdnNRAgscDMeQVi2tvljYKFfCkS8yhaRtk0YJFx4sntish+Ncj
	4Qy98mhaBtvOnQeRENir8hB/IuGEzpkUA1xnf6CctX7F9B3Cgdij7dhnw9nUaFAh
	XzlYhg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0md9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:28:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-895375da74bso10791586d6.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068930; x=1776673730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLMdgLtUvVjpvadR/itTGoqc6ZbV9fFT5xXG0n1J018=;
        b=HzJsjeN1NsDssVct1bxYtmSQy8lXPt3yvY7vilkrYWOEfesohmaZx7AoYT7QFOY8tY
         Fzz63009mVm1ryMHL98nH/ETX5M+YnETp/cpJjiT0ElS5Cf4aO3xgv/xI1xSb99Ww4UT
         izQSPhP0+mPJauV5r3WTq6oqWanKM+zTK2jubmTKHOVApjL0cvfZbwVYpUz6pmtHM96i
         H/e3XEcxRCKJHUhh3DJP//lzr4W+GCwlj6K9YEd8k8GC2PXemnOggnHEIZrKNg5wkfx0
         KbRyl6LuaE+GiJ7fNvOjbjJ0YOfHrLhmheccnkzht/PJkCtrPnVOoNg1MDRsihuKbisc
         m2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068930; x=1776673730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLMdgLtUvVjpvadR/itTGoqc6ZbV9fFT5xXG0n1J018=;
        b=knFeFrwuKNerl9UjHNnzl5azTolOF40H6DhRnsW2o8tEVqZLnYEA9aEUAG9ZWDdKIb
         JfE2Tc2icHUn1pfdwOu6YgSGynYl9bg4bOofNIexSchefkUxombp4cLzXOfuGpDOg7Ff
         JjRaX1UZaGc4UqE8NgU/I2yzevI3fEEViSPA6l6C5uD3ci9vaDDQ1yOEgKC/tRMt9PGp
         yo7zubbLpVxOZaDv6c0CGPLh7owVnaMp68gZEi+m0NY2lBJjK/8K9XhVlvWrrR8Nj+ZD
         OtIM0LlImyIUI1EyAIC9MP9h26J8FYCRMmg9koIGsqdRRudfbKH/Q93JXGK1GNCtCwTw
         eVmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sCU/1DOHoMxz5mKnh5ktP5G6TsunAg9hFepL6jxkTYt5VpcHDmt8HgP59ePKae2kdhqC6dXLp33Gh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56Ijtn61GuPSq0n8wc3TLKKQEkyivb35EITJIB6aTaVbibQ/S
	3cgFEjWcpYzaQEgojdDiz34RXbFPykmV9pB6ivkdg6eLNalEnCTjtF1wxsDDr+7sSgpZGjXsgLa
	St5JKS5zPddqM422ONLZNR+DmCpDgOz0NFkE0t5eHNgfXO9yDSjZ+n1gdA4PqYW/W
X-Gm-Gg: AeBDieur2hed/4tf7R5ae65dpMAoDrxH7XJBAEq3SE5TRAHfUoeNeSCFIpUeimZC+4T
	a8dL4oOV8PJQFEiml6PxF2cLqnnxkIOeDN7zFDRRgB8dKVq6Xov0953XmFOSEDaDMES+lqp36l9
	IULwPylIpMaC5zRA1AECztNLN2Vni8zJxWoUSnl5aCRScLdXvY9FyYGZHzgfnSm/8B5vsM0x231
	AnEnUDO77q0HIwG0EIDKwjbfJBqoQlVRinhJXochlrY0oaa6eqlYI+5EkjWs2u5u+gvAfkrNP3j
	CAuSHJr9P6XfvsuH2okEpT7Vb1m0Y6DQUdP2ohp/I7nKpusVyugxiX6D8kk21Wft961OZQ6IgZz
	ZHRU7IXTY3QEljeaW7ueJlpzdvDGpLWJhzMTkEMNfPvE4SVGX0P6+29OEcO2oNXwf66i9Dsm0IE
	STpxY=
X-Received: by 2002:a05:6214:1d02:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8acb4d55df5mr10040896d6.7.1776068930570;
        Mon, 13 Apr 2026 01:28:50 -0700 (PDT)
X-Received: by 2002:a05:6214:1d02:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8acb4d55df5mr10040646d6.7.1776068930083;
        Mon, 13 Apr 2026 01:28:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5af1sm283525766b.39.2026.04.13.01.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:28:49 -0700 (PDT)
Message-ID: <338935d9-055a-4f0f-a591-0ed07c471e7b@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:28:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/35] irqchip/qcom-pdc: Split __pdc_enable_intr() into
 per-version helpers
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dca943 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7VHkyeIEd6B37TvAa9YA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfX+jhmFzC7Rbqc
 RO6d68tHeOB8Y1/G/wa3S20dJ1vZpNg4IOZ0Ot8FaEQFgNK7Xs5Ahr2gczdNX3HEFFQmAsbGsl/
 1IUD+jurRTg+yxMkXN+jJNJoWLebzbzgyTkG3Bw5HnACbQJ25L9ysJq2Q8y/432Ei2k6Vr4ZaNy
 u05s4Dl14x7+YTZ0K5HlglPsbqfpO/yzGxCoOAnOxp83wa/i7Pi19ma2QDNKS5/MiBw8UamQXVI
 Brl4dFxtA/QZPKM4jcneLxIWxs7ldkM9zGnn9fmTtEdW63A6wjXOzkijboLy04VOoNiLBNKhcYe
 Px1wvLh5UtsDfe/3PIVBxVTFzLlANUnBrJB0ld89cS1u0+CjRSMAafbkHKsAucw0YM8na07QRrN
 Af40DNlgRgSXCPO5TrAw0+T6WwA9uivmFP9aa1HTY/PvcmpKO4OolZQCbwKnF+9qZ/Lq68xcYLr
 VV7CtIao9gn0uoMd3AQ==
X-Proofpoint-ORIG-GUID: 53ESpxgI9Frsb3b3lQmJk-n_ZwGT_I5t
X-Proofpoint-GUID: 53ESpxgI9Frsb3b3lQmJk-n_ZwGT_I5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081

On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> The __pdc_enable_intr() function contains a version branch that selects
> between two distinct enable mechanisms: a bank-based IRQ_ENABLE_BANK
> register for HW < 3.2, and a per-pin enable bit in IRQ_i_CFG for
> HW >= 3.2. These two paths share no code and serve different hardware.
> 
> Split them into two focused static functions: pdc_enable_intr_bank()
> for HW < 3.2 and pdc_enable_intr_cfg() for HW >= 3.2. No functional
> change.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
