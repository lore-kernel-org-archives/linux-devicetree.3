Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50539B94D
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498807; cv=none; b=il2Jv40f0t9z5TS+Zuut3XaT/iSWkhOVC0ALU47JVlDk1mBb03jB+VHRwLRjfb4DtbSc41cYpvxouH0sYD02YXPFVJJOmnXJFZ6TJq6q/DOMcdrDTPg4uomFB8LDo69YCpVl679I8zs1bn/6M+3u88PaBQKjgANDVl4ERIurnQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498807; c=relaxed/simple;
	bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtR8kF2au912f1J5NZVE/Oh/sj/tE4c/ULcEeVf5nYQ8zv5aKKmzcwiyUrkCrDUxMAymZM/c/ev8fsMT9ZvA+Y1/oQVfJTRYABfFDVPvyo9GvjoxE6BFX/He2qXwPKCwXr4gXe2Ql2F2L70mnc5EacwrPZj+27QmOSwfmjaQqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGS0WfoC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZOCoiMk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGS0WfoC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZOCoiMk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653C2gnM1200143
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 15:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=; b=GGS0WfoCZgeHzqnl
	hw8vxIT23xX19xU1PnDB2cO6B75LrHO87VXfv1DKd8XjSbhNH0kwKiBv1UoOeo3f
	ssrPtwoOOEBHX1PH+wVbAtGsS/0Xwho7H8jgZGQzE2nCWf3BnujxZOLELrwl+Nz1
	K40mw2BBnmDFTAndAZ4Djp4UpMEoxfDxUdWax/x0YQb8Ie4uxItBIBvY7q/iKMoe
	VFQxQVLAA2eTrOwe2ntQibVK6otdNWkUT+F9/LbvC5lHfmH/lsjfOrw9M+TYhEmp
	90pT85AWiTWdQT5odpQiRn4MvWhSEO+t1sLyr7zwKqaPuMt/X+9xpAu4jNHwtMXM
	W56/Tg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw2ma0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 15:00:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842211d6e48so5681480b3a.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498804; x=1781103604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=TZOCoiMkNam0bANXxSUp9Hu8O1nqEoEUBE5ewkomIOSnL9J3cmMFNsJfBtQaDaI4Hf
         5i4yj4bZhTN3wJtGRHa6qMimUirXJD2VYLMb+Jo7dHjGpy9zOdTNkog2UVTKlknjC/Zq
         fdNxwc5HPtugFhGYQvWMQssRVj8YMlKB9XnfAidpTjBHYxXtijUXaf5b/pHMWInd4ucR
         ipIfI7pfpqGIuPrYUi4/GdUSkcACu+DG8c87hjoOO5HgLupLE/letnpcwWVmIqx5Gha/
         ERowf5740CxFiZetAmq8SxiATOoTslMpgK9vBgwgh3REbGrWAfJBYksOauX85BkSQC9l
         xJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498804; x=1781103604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=d00aovFdLMmKmSycy2/Zv8HPsYf8nmOIg/KdhNqr559y+4Fh9cqEM46yT8LffK2SUS
         rG77Cn2limEG1lBM5hqyvNlWs84FEeU0xKjvdC3ZEcNr7kIQQe/cx9b2LQweil1AQkXK
         nhzoXqrjdXJWBjGgecZCy9QeqYDak6ODBXPFPZvP3/bUQdoYRlYY1sZAziUYQb6lVzyn
         h00OsRml0eya1PV9t6cmFamy8ZLZ2vg6V5ppRnTiYHHHDXWQhjO8Z1a2Pidd7E6dGv1c
         uEuOEHhg04ruqXATOuhfrSofBxWqajV5WI9OUfb/2pDj5ywg7rMQ/pwEbZEtXrMTSk8K
         Q5Pg==
X-Forwarded-Encrypted: i=1; AFNElJ8+SX+lurUzYzCwx1GE8K6KQSEuxptXnmmz2PQ02ZUTwf7tU4WyJKmfykE1v4jAT0Xx709AyUb6zi2C@vger.kernel.org
X-Gm-Message-State: AOJu0YzvvKAzItS6FiEUGqimKpQuQn8S3Lcww+0WKVePdNVVK23SZEJU
	R46VeVyYfLSxm14revVKLyuE4vYHgAD30BMHSqJgS4t0TLV5Zc0Hw5/CPa3E70cnL/nro7t8vho
	BRrBYNmZnQVwRb8+uTrvFJC2/s+lWwj/DFErkZDNnX4ELWR1ztnVRnYY/BK/Skila
X-Gm-Gg: Acq92OGBR5d+M8AU4w+T1ew/w544XEJb+6GgN/T1VGc+gPUop71IYspvLS5W3Fdioge
	ikzWyVAqhfm6jqCXFjqVwk2QlTrfHlkiX14J2Syf30v3NWRMFqer0a/9ZRTUzn9Iq7C/FsQoncI
	drIO0DmsXnaGgCQX4+SU7j92rp68OkOnk9lYjjPFvcwzCKRWcmKGMy9k8VbXjc7rXH4Z1b4AKTq
	2I8sxcPuIdnIHHgV/cpbPfhKgViv9T5jia0v3EyXC6vU7IHh6ducHPCyKkcij4mErPZLimlUze9
	/yiEC/dAJQAD2w/4f7NEN+kM4H6kjiLDcRucHD8LxwpkRI7c1/NAdOis4rb+Tq+RvHNnz0tLv9v
	B7O5Pm3i/F6sT0ffXnmxgdWe5Gx6HXRC5Y9e0Xs37xrWE/+1sGkQ1ADbraNU=
X-Received: by 2002:a05:6a00:3695:b0:842:48ae:1d43 with SMTP id d2e1a72fcca58-84284ee8c92mr3870627b3a.23.1780498804265;
        Wed, 03 Jun 2026 08:00:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3695:b0:842:48ae:1d43 with SMTP id d2e1a72fcca58-84284ee8c92mr3870595b3a.23.1780498803819;
        Wed, 03 Jun 2026 08:00:03 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:03 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:28 +0530
Subject: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-3-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=708;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
 b=gUg6b8DX/BHqfCi1J5KoY5oWrnsM+HG3We+0qp76rEwPG/U5JUeiHQ71ZupKip7+1WYpddQA2
 CnY839GbgoyCf7ysCC7p9za7OOQ7Q8Ys5N6TLLl+YlfMU9KTqS7JKzv
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: RCYdeoRcHDapna5gjOWE04RyX4Z0jX6a
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a204175 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfXwNHcoKrdYnvN
 dVGoKICqG95AYnOXEuvuOaNRp4n1LJeQw3qNFnQ+lCxg6xDelyFxeMzpyz0N/ZtHr100F1lpede
 pzo6qNDLhaWEHF2pg7knaesxU7j137W5JR+3h36vAat6WyCvpArM94p1wtuD1MPkNFHRX9ZIeaB
 Poyqyw1MUxgsMsCZZNNRpMQnzuBAAq/+PfNV292JlzqGsFZ7JUUniJeW1ehmyAXBS3izXzyFLdP
 VK0yLhSu3l75WTlYFbFVo8UvqLl4ipyxJrdrDaNWHhtmfgNVjSb6pcNnjw6sjbK5C4cgw7Sb9kJ
 mOomcJ0BfTf3hKgu92JNBbZiGExJR1c2WS9iYjx2h2IUqmZky5tkWJw452JM90aD+HAbgaIZipy
 +kZ7gF5hxobl6T3i84Itd68jUN1xyOfFt2VWyXiw20tTX8ZnUM5iiAF+WY8ZWEVG+SGRZRl5VyM
 Dv8IZ58HsZKZ3hXLxhw==
X-Proofpoint-GUID: RCYdeoRcHDapna5gjOWE04RyX4Z0jX6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 909f3c188e75..a6d72ff63e57 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m

-- 
2.34.1

