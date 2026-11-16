Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828909;
	b=q0VEVHSyPRz47u1HOIiE4dBFioTxKvww1R9R/xgLE3Ys8SoKBZ4LP81yFAgt5xY4krYo
	 VkSzN2NrGMWbSSH9VtFmJ3UrYGWBB4bKCe73LsK61l83D3U8QCftFHL3SZgcbDPSfhLow
	 UCwdTD3Gs42vhyqQD+LI5be46Yth7VIWw9tv5OCoECB1xTiQSapf6UFNkLupSupo9WL9I
	 gcgXN5dBCyVyiU+uP9rsfx08vRKN4hOF4XQS8Z71ZivPgR6Kg0tVjRzxS6eLplk9AniI+
	 nir7R/UG2EqsXe6SuJvrv8D3p+oOOKlrJudQsR0nFsX740dh8mC8bv6juChOil/p7SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=;
	b=ViUBtluzPGRsG7TDKiO5S9SY+fWJ8vlebP+pMFYVPVkQjLDdX0a5Ibl5Oz7KkIwi3BBr
	 MQUzJdvtAp2gT7+JH7SwsvZLXFYfwJR17kpSu/Yek2OGTzDCiXqGKkpZwflwhz9oTQC7c
	 nTU/odSTJIidjiPNF/TOl0KLA3PP/AflR1FPpo/WrgDy3oZ9S3+wrnKCZl2jx3Qe8waZl
	 0FDl9dF3r1n5fgNgD72E0v9f2iJHBTEq2WdFx1zFcpK0u5rRlbboLD40fUTCzwVEb4ph5
	 1GHT+uKXhOH+tysmhHug539JsmQTSAurrDm+sKIqfxRAMdTYeAMTPpi8ldRMyYSUISA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyEHU2yf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKwg+zJW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8BC606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8BC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyEHU2yf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKwg+zJW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLa4p1016236
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=; b=eyEHU2yf3na2RhgC
	zBGWYyi1hbO5ftFunLalAMAcb9qmCmqj7nBaYUt7RVVVVa/iytA8A5NEznMYqXJn
	2tV70Qbny2L15v0IXqF2CrwDpJnR3DMBvY+CG7x9vbK+BSKLsfOUMqTW3CpWdjUV
	JK10awuN6MznRdIjoplOYie7mwXG9JbIkMVg0QAq4PCxwFynQjizLEtJUuuw63m6
	CQrysqwfx57/zictEzYYK0tyUk+AKA0DSpggjoN7KnvIlVcoRFf7vLT2jOuC9ZNH
	YSJNkqLhMgk0aW712RFr/NuO9TFzhmXzWrjtIjHWsdbnOw34tPxEQ6LJV0mxWtdS
	1AEnrw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003g8ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:35:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso2907623a91.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828904; x=1795433704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=;
        b=VKwg+zJWjFtd+HmY4FZUOgrkUY/iIiCzUw3Cf6fBnyDPTdYThpn0VXCD4bnv23ZGQL
         UZsnkiPRB+qIvq9iBoOYkCTXMNguiXsJ3u+Ag/nQKMeu2IeRPGp/E7PX1pZeAGZB0jbq
         PIbsci4CmurrJY6w68GucvvObL0gd7KnF0kVRkCLK/VG+vlfx5CJKbDgNPz8cgcrqv1C
         ahicSEtbGfrHF3f6wfS/M41cBcnTqheyzvVoDeQ4oba7YXluNtsza4KxtxD9fFeCeftJ
         70Gh85MsW+j2T5HrHJv8Ced+4PLiGF8IHRXDckx8G0Va1EI1JzqNVk7RWwWjJxkLFeSr
         oz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828904; x=1795433704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=;
        b=rwK9tJic16NjT2zwnAPooFfJlIgqMr4wTorymbR1PJrOSliI1VN6ulyt5dLIs1OiCj
         b96dcJUtfyuMf0gmYje0RjXRKtz7vYnhwLjdDRRNY7vZg4P6H1tQoNjmzSzzGEpErYbW
         /TGUWJJXWM8n90bbVKHGJNFCD5DSh+rbh6bSJ531E2RoYxgdyVpYWlPL2KWUPfObji/r
         VbNEMyPV3kzpxlI2L20ojFDWERoGqra4Y0EEDKQplI/vIwHvHr3cNhk5USGUUv9h2shB
         H46DXDkDPjbAFCLuMiZz10mCo9RlYJB9TBi1w3tvEXLcXKE1xVwR9hvFFzv2txNiS6GF
         SqQg==
X-Forwarded-Encrypted: i=1; AL+hErF63vCDfzlCCmqcSMBywsemVm7L1shZhTCZXgEa/sjUwQtBWIqMPcDWl9dntFkRG4/c6XkbwplwhKg6@vger.kernel.org
X-Gm-Message-State: APuU4Z8P2FJG1c+drJEo4CVuV9KWb0BenUtLNVavxTyBk5QfeMPs+mYy
	g+k6fkprR1ZmObSvK8Xmjwt96KolUsAkZu021bQhTqu0SVoku9Oaj+xFItSQPLMOYan4b2YRhtw
	itGfYLBqURa4jl3w3A1cLAiCMABpr0iCxIDkcgtc3Rextyd+38z6b8kLOHKQyw42/
X-Gm-Gg: AZFdTZfAnFwdr+GjH93uAhHgnl4cHJJzmOzmCBqTcy7zDwkvfv6eH1UHs9YCg6y0+Bm
	yv9k3+ItUfM6qC5ECKrMF/siGNtRdj64IPSk2BHorMftkSoHBcM31pasHM6Ar86LKuW4uyGIZXP
	Cw7myvS6F3tIwMWAwo1Np8Wn08J62HyU4WFkEY82qkNIrPkkcMr0fqfa1R4to6f6NK4xV+0llHM
	zMLH+pfnbzZSDCm8B6p2gGhuZf/sE2ungWwQvWN2vxbbEzDjcsFhBBu5CRlzitFQn4KWmVE1Lff
	Idw8DHRYc5yyjZ1h4MivABTPHQhYyq2Zrzo4JfdV5F5G6illMx/g0kD3qsEvCakyaQ4prUo+wTu
	07dlIY33UYi02oZ9hF5rE0mtxpyD2wWRe/Cp97AVXxH6McxDG9T3gBLknt/p3UlED8cSdauk75m
	vG
X-Received: by 2002:a17:90a:fe15:b0:3b3:7759:d2da with SMTP id 98e67ed59e1d1-3b37759ddeemr3746680a91.5.1794828904504;
        Mon, 16 Nov 2026 03:35:04 -0800 (PST)
X-Received: by 2002:a17:90a:fe15:b0:3b3:7759:d2da with SMTP id 98e67ed59e1d1-3b37759ddeemr3746664a91.5.1794828904067;
        Mon, 16 Nov 2026 03:35:04 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:35:03 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:04:06 +0530
Subject: [PATCH v2 3/4] arm64: defconfig: Enable the Parade PS195 bridge
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-mahua-hdmi-v2-3-0b5af6bf9e70@oss.qualcomm.com>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
In-Reply-To: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=763;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=fqWr8Q//GUQkrbwoURGIWeM2InxPizQ4dIjubj7qBVY=;
 b=8QPxyxQOJYULHOVcD2ARScmoOhA2lkvadsuW5o6InSmPFE/Ak0Us1rCaI3dQCZ5MRY3f47FNF
 wQnwbBYgAJ4D84Fin48a13qJzMly0DIUOekaXQdAKrSeTsWDdmesn/i
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: HgXHAR2n6QvjQaxVcCswVawgj4USsMo-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX4BDRoQMkA2pt
 PmmpBZgVGmF52Z9/t7f7W1bcipQv0AssXXT7B3qRkONLCAvpc//GpLWArXDYpxluQmBud4ehkm6
 Q0nvhoyJA6c9FvJMxJ9/n5QbVLW/xZ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX+vY/gOSniklk
 4IyyfNjBxxbsY/+izja6MEs/F8rT41s1oBf2p5ij0CkIEjG0X4NBVJHWdnyPWe6Nijv8/Jl+W6G
 HCXoWS+ZCrhMjyT8cu5x5G3fqVLVB8bC93LEVC5tNwS492HbeAMAaI/6Pzg3pDSvGOSobejc5zI
 o96DAGMa5SC9JOkL1SjNqTa4CI8/j+nd7lSaXwgU+pRGCsSPRmVlTUaMgJzIVTvqPh00pRCqfkh
 VETDJz91fS2hUQ71oVr2LO8AT3qNfa4/LhfIiY9gOuAoOYOEAisHZMOVT7zmGMeej95/ePKLxMX
 dwT+2ZWqhfIGBQQ45KtJSx+cTdT+uDjICnwzZfsH2QKfxovNZYnB9iPAQgxB0jM4/5ol9cvMLWr
 sn608B/DPx8Tfv78Uwv1cRQ1/Twc3MGu4tp63w5HSXbI6sl9J88HmOU8Ae8Vl7iCRzv1tjnVSbG
 zMDy/wuiNyFSk4o4x7A==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afaea69 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9THlnupo0N1hDek0eNUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: HgXHAR2n6QvjQaxVcCswVawgj4USsMo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160045

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable the PS195 bridge driver as a module for HDMI output on
Qualcomm Glymur CRDs family (Glymur/Mahua/Kalambo).

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..69db247447c4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -984,6 +984,7 @@ CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m
 CONFIG_DRM_NWL_MIPI_DSI=m
+CONFIG_DRM_PARADE_PS195=m
 CONFIG_DRM_PARADE_PS8640=m
 CONFIG_DRM_SII902X=m
 CONFIG_DRM_SIMPLE_BRIDGE=m

-- 
2.34.1

