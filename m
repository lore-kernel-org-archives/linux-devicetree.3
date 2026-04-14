Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44636D9EC
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148418; cv=none; b=jtjJdnFfip1DhzHy/4w4e1yMQYFeA5PVseuNeNSXOJJzBFeW0/OVBpYAHX2g/iodw5vg09FkvFfTCGciyszBsApuaAI7VOWxWJfvmINU0XrX+nM0k1B6SrCd+HUaO0IbQpF4fZoXq7IPACVCkmdzeZRV+fhIyxaKkNdefJYZDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148418; c=relaxed/simple;
	bh=y1K+LaRyhz93aZWp+gZtDUUqtVcO3IOvlsscpo93Plo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvfbNANRJ+KiofvQaicWU2Z+uMiYOvUXKjh4gwpW+3nF7O5TuS5GtxejYPIK1SpEXTNjiF3f+pcEnr7vQ4Qkg7bAqw2bdYpFARqWuZd4bKIw8ONjQxeA5Gh36IxNFW16cF0hvOuRRLtuTgezIoporhCALel9hsxtZeX6GIyjmcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhAqGbNh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCxpMacH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhAqGbNh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCxpMacH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XDOr3681487
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kiBHEicgBcwVfHpBg7CCiYin
	nWHa6rAo+LKmoWMOeFo=; b=AhAqGbNhMZ2GwitpEGbeVgi2jnydxT42avO5ZwSS
	7rmpJQZwelKyMxwIYvfAlS3rs+EhBTn0wtmQDGlfofkzNtr2BLiv6ybCCwlWO34b
	gsyh0atIipinzGL45rw728cAlYgCtq3y68tOqDNVJFT2ukTiElgwHktj5FPrC8m2
	5p6HSvoSI2e0C5enq/EZ2kwkFiqBJ4jTV9WNcO5F2ptbkpIpZ9lf29pQDwJ8LtZU
	cp7TUp+w+gYq5H6PemUan4qtXZ8ZdrdGsDTZ7UcbuOagXjBclRRC1qZAXKa096OS
	IkS23r4ig4wpoOrMJc1LLhsPxSgqwevbXRbmo2TcbPtE9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d1bga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 06:33:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f06f16f5bso4444979b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 23:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148415; x=1776753215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kiBHEicgBcwVfHpBg7CCiYinnWHa6rAo+LKmoWMOeFo=;
        b=kCxpMacH/BdDl92DTMvGvrpC3ah9fz52/4ADyZw2YvMfI+vXLD9y6g9pNLs5Kt8gRH
         96nzha9PKN0Rx/2p4wZhGQ1HJUYUY4Wkraz0c2KCO4n+KkAhk+4ydBz6jzdnYXLLqWdQ
         OwH/E/n/McIXSmrVPpY++Ndp+B8rIToBxnSOgK4JA3kCPtKKUJssi0BUwL3hNdK3/EIM
         k7cGD+X68EXpxCdFZQyEN1+InlmDdFcShbb8+P0FUzEXCEZLtZCWpWRvJqeftQxSiKKP
         X2f3oa5t89bL0/vLSIpe2zXJ7AFlBhwfWjALnt5hVJvhk3MmnUdhFQ3B/8neEF8Uwofr
         Gkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148415; x=1776753215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiBHEicgBcwVfHpBg7CCiYinnWHa6rAo+LKmoWMOeFo=;
        b=rwYmA5QeKwEEpLS61xPyTQF3M7lTkp9Lf+h2Z/5/pk6XgASxYMIeQXP3OoiRZQChw8
         0dnYOgI9yG4FsltLPXcDz6+L5FIQd/EyN3b1qeNm67dCEwpp5dVA5DTFKoTSIPnFB8J3
         TLJ5HzrWEAc/DrxBndIrn+ZxSif3/QgZKliG3K9I93nZUUlfbpP2Fv5qlomdYr90KSeQ
         hjhGyf3WXW/OZpRLW73af6F4qATFitBZ4kbCVgaU6WMxB9ahpQT4RPfAuJTaeZrfNDLv
         /jHNQ328IU58fE7n730XAAHvd+RlDCb3aAhoL6ozI65mWsku7B65ixHehuacoq+biDaD
         Y5mQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ntIR6/sJQoBKb+kUhgWh7nrB8niA3L9KWhJTkrTIjyfrTL3QJsGb+IXydQoJQIVEeNHn7yER96j+v@vger.kernel.org
X-Gm-Message-State: AOJu0YxWo0TnjUTyCdgifVIur5L3b1X7IcaCLk7DUFSjrJuFvh7zdZFR
	CC11RYYH1eaHvYfyjCL91+TWM8tHqWs8/BGd75RQXny5vr07lgwic4dxhLf8YEGNpO2qbYPHeO2
	2OAZK8rUE1ro1BpzzeRMt3M4P3ocjxTa2UqdXgbygNNNeiJYNmx+0L1oqV68Z5Mw7
X-Gm-Gg: AeBDietZ652m3bxWo32dc3wYpvsGPL9F+U8b6eEudRcyJXApyS/EqsO02YjRwCZ1y2e
	0dJNRH7ULEjcZiMjBD3mfylP3rt68K74KPSobgj7kWVP+Tls+Xg5rmDGsxrThGHMm1htU4JSamr
	b5jUDxcLcumoMU+SqcoWT7SxO/TJh4JYjKqDC9+YoFDAiL47uovEVDIobjH4kiHLuE91BZ3v32c
	7T2qdCYaHhM6PAwfViVN/DR8ZXOaI+9382b6DJF2VPlwMusXgFo8bg/rteT6Lo2E9FmoXT2dHgo
	zLHk06V7NQUaIc+PQJYT8jrr7umMty47MbFXGmnfucXF5ZsU+Z2xmC9pHQXOStDwtKlfwxIy7nq
	iGVXMlc/MYGrABKCcCYNS4kDGIjOLSRKFcTY6cz6bMRXdZtJ/
X-Received: by 2002:a05:6a00:2985:b0:827:4372:dd15 with SMTP id d2e1a72fcca58-82f0c2c2096mr15363516b3a.40.1776148414793;
        Mon, 13 Apr 2026 23:33:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:2985:b0:827:4372:dd15 with SMTP id d2e1a72fcca58-82f0c2c2096mr15363469b3a.40.1776148414225;
        Mon, 13 Apr 2026 23:33:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c377318sm12699558b3a.26.2026.04.13.23.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:33:33 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:03:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
Message-ID: <20260414063325.f3yag6gnmaysddkp@hu-mojha-hyd.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OSBTYWx0ZWRfX1x4/YEjajtj3
 YyMJVP0Qu8MP31rBo+T11CPbxXc6IlT75gxQWRsoFsS87kxtJsG0ImL8cZZykmokuAaQvp2ZFxw
 RFKPRqlc7mIA1dPhDz2iDOr6K1B/7uiHGTxXfcuO6P2eTJOlg4TfLM5OqzE4tgf7/iH/izlvK/s
 ADeKIDCGnw3KYYN5bK80twPo1XN954ND1MshaFg61mGiGghQdY5w8RR/JDhTqgRRz5PnuctbW5U
 FBUEAKknao56QAitcx3GJqoIxvoQLWOwO3SiOLk+h0pf/d0MJ/D4MLIIUl6vbgUBFK9MGcFGxK9
 sD9UV7Rt6OJc0ADqbwb1KmF5fKNyPFEpg3ZfyQeS8XZKqbUVBG3aQPpSJArwFbNP8p8RGxpGWN4
 6rfBgOulNSZFLFkkiV6jDs+VaN3cSOBv+JusYl8f/dXyXB/LyGyTU2oQTR73jsb5046andOMNNz
 LLE0CeOU/REEC+4Gkzw==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69dddfbf cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oTq01oph0ifE-MoszjAA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Ziw8O92HuFyuIGp_2GYRCSFLl4fMEfyE
X-Proofpoint-ORIG-GUID: Ziw8O92HuFyuIGp_2GYRCSFLl4fMEfyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140059

On Tue, Apr 14, 2026 at 10:30:02AM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.
> 
> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

If this is a fix, should be the first patch in the series., so that it
can be applied independently.

> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fd..bfd1e762c38e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	iris_vpu_setup_ucregion_memory_map(core);
>  
>  	writel(ctrl_init, core->reg_base + CTRL_INIT);
> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>  
>  	while (!ctrl_status && count < max_tries) {
>  		ctrl_status = readl(core->reg_base + CTRL_STATUS);
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
