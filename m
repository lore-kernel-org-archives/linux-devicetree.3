Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020142FD696
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004362; cv=none; b=d07IAvzvXiy7oZcpL1oi7qTc+9BmwVlhkf9UOYICBZ6P3/iUkvoX5bR3dcUgtsQxsfL4z0+5/BLi/uW0Jjvef9mQZMg+tsAI+JJXiZkYFZpOZISIn7wgMcCgs1rhSfG6BD8cS2nIVmZtzbQXJMB6VBtEcc0IziYa2u8zKM78p2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004362; c=relaxed/simple;
	bh=rdBCEOP8V2ZJqdksQHblZsWuAizHXi1ShkMll+wqDVU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fnUh98CNJTU/1DUSfSuop/12PZk+ua46Id1ur0LSfma4I7yhT77NqGVzPrNAugJ6JIcNAxhwmM811+E+oljGZPNiopjPscQDJqFGBHk0ERJn3EbGjID0+atU2xMkjTuwTEo5j2doI9AuhREiZCfCfvMH43XhES1fD8PkiIFB/sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JW1uH9nL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqIt+aT9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JW1uH9nL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqIt+aT9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA4cW827678
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fqSuN/PyMXN5X/SHL3f+HDi1/AOqN1tDdAj6Y2oQbFM=; b=JW1uH9nL/Snp2ixf
	Okzj3RUHUEFMSf5gk/6dblXSflhPC/Tdy2Waq2LxQEo6Ghqofsq24Cnj61k2w002
	lTl6xsIw8V9cGhdkcRxONl59g52PZZ2WEXHf++tKCVOdPx7kdP4pecpViuHpp1l+
	DgEMZZ7GaZRRLe1nxAZ2Lga/H7kvRGzwxRnZI/ecqU57PTnr+J6B5qJofEkFf4r7
	LPjI0goIbbmiCnIjTnkWzxXuOYpg5wN5tI4mHqTjlAUHCOi0U09pWr3J/zOqwnS4
	OvUo/KremDvJLWHdb3kgIMje87+imnTDI4DH9RGQE/sqfmCnEzBK5W7/o1DinFYf
	FFHStQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gsp18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:26:00 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c83098d1e0so98858e0c.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790004359; x=1790609159; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fqSuN/PyMXN5X/SHL3f+HDi1/AOqN1tDdAj6Y2oQbFM=;
        b=UqIt+aT9iPaXiNgJLaRuy+5p0Tgtq7hJWYihvEmN4N8Vx/gMaZOaZNPw6IchauJM2P
         PlR8Eo9qDg0uzLqTAbH7jNBGQU7ktB34nXE8cZJt+c1P7qHX6ppLjwy9hWWomidSitSc
         wL/j2T48hMDZS/TkLO7gFP7R4m8HP6mojzTqd8umCi3hhUXRWv+4Xsw2PcvG4m6MaUOI
         PbYfSJKooltnapJJz5w3NUEcfXvDEKXb5B+NgzPkJ6hncUEkgrSQlBqjr8K7lr/4eV38
         Yo2P5Be3p75s6Hmpup3bSmwnjNCnV1dLutH9oVmD4mVo14TLlhRjWulh880Fac+KyNjb
         2Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004359; x=1790609159;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqSuN/PyMXN5X/SHL3f+HDi1/AOqN1tDdAj6Y2oQbFM=;
        b=2HrSjZ1Hs+qoxQCl8PXILL8DbnXEy8zLduiXFmGoGIbkdv0fAjDfGDXYOhZmZokmPl
         Pkw4ORRQkIyakReNzlHMQIaz9npb9g6a+YlVHuX52Iky93Y2FwO8ixKyYl51/9Bgr7Nw
         YQSVxMCFoh9dPlA20BocK9bVYYe+yrv2ayiinbo/y3TA/pBJA+xx4+6L8VhiUXY8JzI5
         avtTHYKnG8Q2c5K01Y7LsolEWN27xGUJVzOgxJ42OyUPEkmDn7h2rEpp8RwHOarr6PUf
         7MDY7i9czyZNIVDbJ0cKKVNW2mEUGcybr6LPMCTEh2DU0V+0KO3NigrJyP1mcukXhknS
         OKLg==
X-Forwarded-Encrypted: i=1; AKwUvBxlfeqgLS7rQsE3bF7pJAehlb1rucqUne0kl/ItPhXg6ZCl6E/E3SvuHacsdXOEEIr9V7XKbFjr4L/G@vger.kernel.org
X-Gm-Message-State: AFuF++khOGVX5sodG6T3kEWpPBqmDu5r8kNeni4Fzzk6buOyjlYI+iAt
	w1806kX4NnTWKkkuEZN40E+vDmduywPZHMm+daiC7VcquKg6t1A8/4yaRcpWn9Pa4U86S2KQsfC
	7ogpvyZM5G+Sb6NZOdqIUDEbSHwzHXgeMkH7K3+/kwxO/IZHfL6kDFJWDhmlH0gDutigvC0P5
X-Gm-Gg: AYBFou0e5+xUTYGS4aiQeIFV6Yai7siTptFEAcmpRPsRaA1zGmzF1HQUnsIRFMuBZvK
	AlgPPZ+XbOBC7kHhTjyYh0Eu0MxTQE6pml4DoEWkkwu5NJ2cFDcDrFhlBoG2uzuNY+qj3lwy3Xo
	1bNHI6Fr/Yec1xYCxXZ448zJJyvHhEcav75bfBFnz0aks5ouUpDxXVgEtdMOKVk91ZYZ4nMPWLk
	hCp9haPjLSypsse/3d3ugu8evCJb9tlezcvfZcpdyMdf7PzstRlk2jFafJ4P6zU3UF3iFNM7tG4
	Wsj8uEiwu4ffpiKQ3bB/Gzg71KgqV8EuF8cSISg/FqpMjXINI+fXRsZwz3tKKz2ZMjRxRHPMwNc
	KADFzNO0CKY5zhNGEZxKgSABrS5702eyYKg==
X-Received: by 2002:a05:6122:105a:b0:5c9:d4ff:39bd with SMTP id 71dfb90a1353d-5c9d4ff3d4dmr1718454e0c.3.1790004359128;
        Mon, 21 Sep 2026 08:25:59 -0700 (PDT)
X-Received: by 2002:a05:6122:105a:b0:5c9:d4ff:39bd with SMTP id 71dfb90a1353d-5c9d4ff3d4dmr1718412e0c.3.1790004358715;
        Mon, 21 Sep 2026 08:25:58 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a47f:1f4e:75ce:a149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244229e0sm22300755f8f.4.2026.09.21.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen
 7
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20260918120515.595782-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918120515.595782-4-srinivas.kandagatla@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:25:55 +0200
Message-Id: <179000435568.7157.14608098257878940623.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004355; l=1041;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=rdBCEOP8V2ZJqdksQHblZsWuAizHXi1ShkMll+wqDVU=;
 b=JeIVKJ//A5TfGSvPVfzuVt3j5lRhSU/+/mzdVAHLo2Eg5rxnvBKIX/dRR71ePwWK1Sb/DbIaW
 MtXMsvc7gCRAIppNaGFW9HzkUIzwG3Z9vx8QLSENP9TqPFK/SfUL55P
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: q-kTqBCbbRWuii6J9qa6NfprOVdlCnTV
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab14c88 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kb4dfXkFt2E3B8CIUOkA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNSBTYWx0ZWRfXwPkGwOrDjEVz
 mjNuYq/MlRkwJHq4638YudPhegkRZ+NsAM2Z9pxrB4uGk7chK8P4bQQSo4sjwCnsQnXiaaJ9j3A
 L9HJ1VszhoYE0dL3Ofxr/I871pvWPmzGJKs5cF8GOK6rJAhpdjCQQjLT8RRUBlZmBVPwaya/gMs
 gZvlSNYmJjRxsBDaxXIstWK1lPCJ2FyedsZonjp9bniD9ILNlsMbau2R/ubXKl6nD1fozlLVG8g
 ElYjzEGXHghLRJtdqiJUtmaYOrUs9k1QAGgSAcvaOgPnkjDIfa7kaDqD4KDZNG/hlXAkO02jtLq
 gcdAiNLPlaxQa6KYP+aq5AAZcpNpBHrv0hmBcJQtkmrddISk2Cpc9M23wFIPoBXMjGOa4Ihm84g
 DqodaiMdMOSgs6kXwdPvOHp9WGPoC/sL9G1y9AHJts9XIvlGYKlXu1F4NO2K1DdzQuP0IJUuslq
 HnTcOFO/qICfCBFMKaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNSBTYWx0ZWRfX5x9T4rWwcLsS
 kOWOOS7OsbFwRUZO8/O762hlUo+4aDvoiBF8HHnsI9Xzkdr5fwbiKGimPCxuxEnJeLfA/pH9/Di
 iPgrTxeGkZKy1Y5Azsp1bfuk7LQROOM=
X-Proofpoint-ORIG-GUID: q-kTqBCbbRWuii6J9qa6NfprOVdlCnTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210225

On 2026-09-18 13:05 +0100, Srinivas Kandagatla wrote:
> Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
> a Snapdragon X2 Elite laptop.  It follows the Qualcomm Glymur reference
> design used by mahua-crd.
> 
> Currently working:
> - Display (internal eDP panel)
> - Audio playback and capture (2x WSA8845 speakers on swr0, DMICs via
>   the VA macro)
> - DisplayPort audio on the two USB-C DP outputs (DP0/DP1)
> - USB-C (host + charging on both ports)
> - Wi-Fi (WCN7850 on PCIe4), Bluetooth (over uart14)
> - NVMe on PCIe5
> - HID-over-I2C touchpad, keyboard and TrackPoint on i2c0
> - Lid switch
> - WWAN wiring is included but remains untested due to lack of access
>   to such a SKU.
> 
> Assisted-by: Claude:claude-opus-4-7
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
