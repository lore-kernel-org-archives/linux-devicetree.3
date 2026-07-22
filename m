Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF433ACA5D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718695; cv=none; b=oBL2HvXUUGZtTQX2ferpb80vt0w5GJ4hgKNMxkphh6y6pKf4f8yp/wpFc7xNZwVZv8fYl/Ep0rcEiZOZX4W9pGWuOqIf2uBaIAY/7aO3II3Oal542dtdb2rYadkEPlRhyCDFZd06oqlVaXzAo2VI+JIA550iCjm31v1sIFLqYDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718695; c=relaxed/simple;
	bh=P4AV0NSS3i0lFUZKQLHrwItBL4otfRVjt8sqN9bDhBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKLrMAb3VqNYvTSO5AApA4qCUg/MvIhdqpHOYT940vsyjYV4y29a6//dWjYvoLLI7FsTTmGL05OWOgBn6mqdqODr9fyiUqAw7t1b1YAcVTLoo4ROZdOGkEXlAAHcwoz3m3GdF6geP1BhRWa7es8Q4RJVoa5GacQ2sKKq5xFe5x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGMKN/sh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGduRF2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGMKN/sh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGduRF2W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKdM384512
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LjDkDl6GHjaP2K6Wxf5HBn0m
	3ojJMTS8H6Ztvo6AkU0=; b=OGMKN/sh27MBp8fdMBcNoNxZNySsYJXeUD9IucLz
	+k2a7k3gknZJwzve0wwf+AYl1iLKzSvS3qFggq48ZxyTBLxshMhnrvsDgKBT4LWg
	p4zKAR5ZULcUgmYInwft/VdJKVBdqEmavMr78mTK8PJA97bfzZqvkRX++DDpHte8
	Xq4lmU32EzCzMUeCRg31NJ3utyDhraezGULSfprQvXdg13wjzPfzHQ4qDthy6Ask
	TAIW8m9Is299bbzHMUr2zsVMDd0LMVptCyIFhKK+1772G1VQxOepLhwkw728a18a
	0wsdYmW8elJls+zP3PruwTg3xGJ37fkfFUwF0ej52vFMAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928yfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:11:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so190403761cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784718688; x=1785323488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjDkDl6GHjaP2K6Wxf5HBn0m3ojJMTS8H6Ztvo6AkU0=;
        b=DGduRF2W7/j/PQQzncIpX99tj/mlmFJO9wJk14C8wjTqMMKjodTbJhLm67vgMNM27C
         kq8PwVPuiIGdTddaj5vDIS8wH1VQVevofcnxMCDpq3uas0I+3+F7L2v0jup5RbmpbXLX
         XNH1+Br+ypiLuvEbOngs9r/iEMv0wT0I7RHML4WbO3+ztD/1LZ9R61rZn2eJy3qzaoZo
         YUBDR51G5gZiwt22qfzO+7k4Hqf5Z0TLtjS5cVIA59qO2I37lBoXxCAXfjj59ss5KYj9
         UVCvb4E4uHbynqcVq+LzjIvlOJWkUP08HkKSbKXt125Dpnw1ONiw5/t5RzGe+Y/h/7Yc
         +ClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718688; x=1785323488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjDkDl6GHjaP2K6Wxf5HBn0m3ojJMTS8H6Ztvo6AkU0=;
        b=da62+tFKzIaiDStoKlr0PWzyGn9ZhXW22yuzyrD/LUMmdPax/5yds99GsxZlSZt/f1
         EOMBW41F4Xu0u8dCYdzEqisOf9s9vp3/lg+zIbY5XR7Ku2CJW8l5+x0labKLpe+XIxy9
         W6kPya36cHM5Dzc+BSJQdYAaaFbmEBVbbmFJ6CcT9Ce0MKJ7WS4Y4I6Yt00TO5JQoi0l
         xUdDlUebwzUFbaU+2ObMeqkJyz64UjhD6Wz8G0DRSQmwM0piAihPODK7EkHVpBgOpOzk
         YDR5QufNp3F6eLz71lVxesu/GO/p8oJ7ojZnSVVbFUQDAG2F9h5T3RJornlfFWYtsbr/
         KNVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqUv1d4FJazqdEJ0BDf9x3G0QdaWynjO7ovqdDUsO5lp+gq2MtjUB6jyAuLdQCAS1N/xFud5qIR6io@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9P6DbTQYD6VF1NG+DPKXH45zaN380xZDPColSmoKKpeTNS4jD
	frxNpjpBPjykK8jxuc9cIHeg79RPK1v+KTBccSVtBG/4ykmy61UCmpOJDB74W2CFaXugcE86OQg
	BAPP9AEXN4EJCqw1JzvmEW/MJQXMyfU9VhH4fg/TCZ6nRVS6B1c+n5IBk0JyKKqXn
X-Gm-Gg: AR+sD109t/BLlEHw+lBrfH0QWB++9/ICs1Og49xVn9smupvHaHSEx9mUrTbdmKW9OhR
	tBMiolU1KXJpliW/ARVqhUejlx/QfUW7SAcvcCudeiVe5jQDrqGlXnftG7NYKjMt/eA1Zs/sHPB
	vimMqITxIIKb+XtfcS4Z+S686y4XEu7O0TNt8/mSdIm3dRFh8xGr+Ew8CVOlunyCgbZ+j0+99la
	LsljRZwDVRIvmGMIC8H506iKbfZaDqQJpluW9Y8IHACZ8RHioYCK+kpWHEvUqJhmYIxKrenmAzz
	Z9MWuSm0VbbKsEPThEIjBF1UCvcB1yFExJ5JX1pgfHQCp7R5RW/QfnKHBrxLPr+QeT4pHeCDXiB
	Kk3Kc2PwTxAXQ9go=
X-Received: by 2002:a05:622a:5a17:b0:515:189c:e0f8 with SMTP id d75a77b69052e-5213bf11467mr192454361cf.17.1784718688024;
        Wed, 22 Jul 2026 04:11:28 -0700 (PDT)
X-Received: by 2002:a05:622a:5a17:b0:515:189c:e0f8 with SMTP id d75a77b69052e-5213bf11467mr192453971cf.17.1784718687361;
        Wed, 22 Jul 2026 04:11:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653731b2sm140441475e9.4.2026.07.22.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:11:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:11:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Glymur QCB
Message-ID: <2d6l6id5dkuncuhwp5q7626pncclnnvo6un2byjy4ugsayheaw@teybqbkxhixr>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwOCBTYWx0ZWRfX+kpv59tKTu3j
 SMKwyB+8wBuZnXxsHLkGsVz6ixIPFXsanUTLfzS2zzEZrdogXBuSuuxyEvWxiZLsE0kRozbSrAm
 qFerBQ2Q9CZ6mnZR658Mczw7vXyC/R0=
X-Proofpoint-ORIG-GUID: zVUGS8XBfAxmhzDTHxlSxtcl7LVIpyth
X-Proofpoint-GUID: zVUGS8XBfAxmhzDTHxlSxtcl7LVIpyth
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwOCBTYWx0ZWRfX7xCIfiPZcnVN
 IRj0GlInSns6Ej+roceN0dXiMcCmzEb5X1OonrHjdBWL8METkHWirfIw2NsfMtZ1jl8RAZedJ3q
 A65ibdYxsPpUzy7NlanZioSs9/F6XiaTT8XTM/tZfA4kmOC3S4WT7gUcmG+5LLJD8fPd7LcTmnH
 Eh8WoV2vR2k2ejpgZ9qhheFCN2o7gPlxvhE9jLFpt3CCoYm/TMu+3N/t+fx3GMiJQtM8JKJzF25
 +AfjkDFKNHOgAOhA0ZoUFgIQc0cb80HNzeslGLnK940jJJx90HJO2oyV9tHCcNmETeFq0oZl77m
 ETK1CzBlsTVLROuQVmwLCfbSv79Ql52rPqA7nR9Gokk7Czys0TFgjG5ApP0mf4I546lHdieAdqU
 ZpjbeohnTtiYgFGsgDmyepKsZmj43m9WP5fQO4vGH8X1JwCRopXA9bxPhAVsKuW4ucOvNYg0+Z8
 7hR0hxtL5+QR9gWUKFQ==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60a561 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dXkGG8lSNh7L0qOfzMQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220108

On 26-07-17 04:54:12, Gopikrishna Garmidi wrote:
> The Glymur QCB (Qualcomm Compute Board) is a Glymur-based board in an
> open form factor, aimed at compute bring-up and power/signal measurement
> rather than the closed enclosure of the CRD.
> 
> Add its device tree. The board boots to a shell over the uart21 console
> with its root filesystem on NVMe. Enabled so far:
> 
> - Board and sleep clocks
> - Volume up/down keys
> - PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
> - PCIe4/5/6 controllers and PHYs, with their PERST/WAKE/CLKREQ lines
> - WCN7850 WiFi on PCIe4 and Bluetooth on UART14
> - Embedded controller on I2C9
> - ADSP,CDSP and SoCCP remote processors
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
