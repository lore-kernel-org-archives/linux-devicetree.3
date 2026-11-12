Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478570;
	b=GroSgE87a5ngX9wJuwfJUuxDpUIk5lngq7h8oxX9c8LL9QoCPlR/QW6DBNrKOTkWjO+7
	 HUFEArTcQxTxTeny+EN4WAymWLTYu3B152tnCMLcLdOUJI8gVIQ6iMtVQeV3RkLAOGOcS
	 NJ4OgH2QFMWZEtuaI0JLskMFgGuF+aSQZJBOA3AoZ2txY5IzzpH1AqcdYwkLsa6TRteni
	 tVd6696TQT8zTtDokX6adbDXVssjSwJyN7g+Ub2KJNBP6BOp86d9JURkvcoQDhR8haDfV
	 CELvk7p+ZPwm10aBErWx/toVrSBDurPm/sdrjoV+8sOqHYoWimirw0jRHPhQkZ/tJHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=;
	b=gXhm8OhqDk/5RFhYBhz/Qw1XgoGGX8jK2s55y921c/HZt7q/otyb0nmhHHDGd3OWRTay
	 Ux94XF1HtxSMHHnYl01sJKjsSaE6IwQrkeQo1mI3jBi6QnFURZh0dQQUY5zun3YeR2oX3
	 WVEGiwpv8WvxMzG9+/ahfwHYXQ+AhY80WHhsPh8gyKyK29oNV6bHMxCEQlP2UeIkCpqm+
	 KpTo2GBT5qUSQz5zX+uek19oNsvOOb96tdylUvmF3v32tTIblUJH0pr8DgPUpt36VZVcF
	 X6a/QTwniNwLUKn6+kc7VeEKRTN9fXs8qqCVKP+vFDXdeSS/KIi6BwlgOy6wqDhLEbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpVQj+cU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmm5dtuj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A152606A889
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A152606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpVQj+cU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmm5dtuj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9GMDB597378
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=; b=MpVQj+cUWHnQLRRB
	M7ODXwD5/iVwvCTq+2+cdi+Wmk7DMSDlL3m9t38XikfXP7kUWvkvmRW9Du56HaJU
	ThyPlxdQ2/Zz7tdzJLVKOAFy9sQzUrHp0ogk9v8gRUGTMw1676lIqAxyHHiPUouh
	qKKNu0W4c9MmiGuu/10RSvaH1EAsH+DYOGBCJ4pQqRVHf36CgO1MghQ9HwQHa/o3
	vZ/cMHJHNeo+TX2rkt0kOv4tWVF0SihjHUYC5aPDdqULA1mBqQV7aBUqxK62Aq9Z
	o8yKX4s0H5IrhrRQiLqCtvGaL0Tqo3npZuuaZWWZE4vHrLGCOA9DUXLwEdF9+bfr
	xUkcSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1547yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:16:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a073778890so3486293b3a.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 02:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478568; x=1795083368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=;
        b=Mmm5dtujVq1k/Moh/Ow7AvNjbYwzh+OuEbopoYgXsCoBaAUzDlRergg4eg4//lYQz3
         N7/MNvoA8FenqJrZodVxbjZbJ9dmaaWtEaYOTCTpJonu38Ua7XfKbxCY8k3CP6afejFC
         9x4Vfq/u7ulHNQvrJ6N0Dci/XlYaPtbOO4v5t+MpO6suod0j7xVXwkd+kPoVoufDtv9k
         UC1IP8DapPd8wcj22GtyEAhSDphDh+M+aDwsue5yk0Gb/ptHfqX7EG8BkJK+TRzGFvO7
         AfxGPv2CJjPScAOvQJb20UEpD+qTOV6ce0lCJoiMZajxx9NVd8VUHg0aJN6YIc/WCe3P
         TW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478568; x=1795083368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=;
        b=pftr0zu4YLMqsAV7EJtK2E/qhcyRJXm7CbbmMVqJZk+JXAHLABMU+VSOqUyghg9Gja
         JcRFCyMo/oJ2J2iU8gqFyvI3i4zdeZobxsU31ucjFfHmyE9tzPa4xCTaMD8afmXHf9qb
         R3y+uQBhXPyUFMoA3hiCTtWCOeAZSJWq+U39u8eKQCAPmcyLvzlnHgXd74YlOrIcx0FR
         BgUXXELwwq/qGA10QFqYqAGQAd53QiV2mBPf98TIpVw49vah6ejEs35+JjEYoQScM/4B
         D9fYcIr/ILIcCwqulfDP+0V7qmGB0aP9sh84c6jOzDQ7baG/2G9wtWGgbxvDJaIjjlj1
         ClEw==
X-Forwarded-Encrypted: i=1; AL+hErGgIcVgtSkGWTb0a9GxYCrLRLqgyL4XSGb9xvTFhLgJTjMaRQiXXCRBmcZ+u06t5rBNq3xFlFsvuE7y@vger.kernel.org
X-Gm-Message-State: APuU4Z8gk4ZAhm8UuV8OOtDqpRFrs0U4PG+yFXn5Oymnwiwfy22GcVTX
	aBj0orvIUctxachj9bfi9A2zEzUP01mEd4Fq4haUgQfmwwFzdgth90dw6ZeNjWBVWNcP6AScPPU
	NhbwgHazWUX8scn3dRUTYZdNWFqD9nAaipJTbaYsBufv1E+m1iIfAPBy5g2MTR2QP
X-Gm-Gg: AYBFou3KIoNh9LIarYLhdG5JghujmmlpNZwc2z0/MbxU4+RSsdc6CvyMttaRtnQvgYR
	h43qWxWjvbwX/XAS+WshXsD7mPU8LdyxyYNUBLd6KGZQXaFqcT7sL4fUMG8FG6Sx3LnwCKYUY4e
	lEMLZ+otvd9VicS/PvoH/SHBapoeMSnIRrkKDWC0ztOdX2+4eDioAdpWEjm7yQmEFKKhzd9V/8a
	zQiB76yUxvlqnUVujJgZf7kej8ou33NtmTjYi+7CQe60ML6H+HhqDBts76l53wICQN1NqzHRGsV
	sjbpBmVSMENtTLuugYoErbx2SUorLRQpDVDbSaS8Bn7nCH8x4Zr7ylBKcYqvRyKdjyKR/P5hTPJ
	gek819LnR3IFQ6kUgJCu123c+w8NnihEt63Y3BuPtFynS6niy/El5OLL1E6Pah4de/eDr2t6GHH
	M1
X-Received: by 2002:a05:6a00:18a1:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-8bc1ec7bd3dmr5363815b3a.59.1794478568176;
        Thu, 12 Nov 2026 02:16:08 -0800 (PST)
X-Received: by 2002:a05:6a00:18a1:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-8bc1ec7bd3dmr5363785b3a.59.1794478567683;
        Thu, 12 Nov 2026 02:16:07 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:16:07 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:36 +0530
Subject: [PATCH 3/4] arm64: defconfig: Enable the Parade PS195 bridge
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
Message-Id: <20261112-mahua-hdmi-v1-3-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=743;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Op3gUFINVffD/rIMQugm4ViW6Z9HUJGr5mZ8N4cmk/0=;
 b=VFt2bDLQa1znRWwkyQjTJ6Itr1GLQr2wmVOMbafYoqo5llfO2tZtAICGK0DZFNw8vH2heK6Pt
 R1UPFH4ofI9C02vubBJ+HpSSnAxHk2NN/535QlUjIeWOuq0iWQ6SRXw
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXwsM+JvajvNSX
 UMxAIqBxD+jmpeymPTcIUwttppr0ISyjmXQ/GPlFZoQDMG9ZDCdBzcaBBrFQbBf/pyW6Vrx0ONG
 3kC2TzULwGrZZCA9c/XVAkGS1xM2HvY=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af591e9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9THlnupo0N1hDek0eNUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 0jnaJjPDeG0-cd9xlBM8Ceig0-M6lCTH
X-Proofpoint-ORIG-GUID: 0jnaJjPDeG0-cd9xlBM8Ceig0-M6lCTH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX3lfaRZ2akuab
 7wEaOi9ZC0dDj37cajAtwMNY9kbFezOZuGNMC1YQjhO0RVfVM5uyb0DDFV2bfMJAWtaesycYZix
 3tJm1MPtestgg+Q/SP0fyeu0Y2ZHm6kk21pM/OgC4hNYrWA6yCUhqGII6ZwluRv01HnxRkOr/vt
 p/p9c3pwCNPCrzOO1hkm17CUMgl6A/3LXynrnDM/QyBnnyIr0KN1xKTjE+y/JroJR/tmSP2fnOa
 NC18Jx44v99/afG3Kig/BE2OCHCZnuajrsfgfImddHg7zKvckVa1Uwzuvn/tg5ODH6rfqmf9nbL
 dC2PU33UHdfTXhZu37Xns8RHNTK2zpgrdW4gg6JyvOza/GE2VGysLS3d0xRu/hWPOQvyrRbQqVa
 Oip7UkXqocrNN4dWZ/zLxdiPKkElE7aWCbiC5bvnzPwPEUrI4L0tv16z3n0s8O2wVtiEpq/beBf
 UZi+KQw2CqRHt7q9dbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable the PS195 bridge driver as a module for HDMI output on Glymur,
Mahua and Kalambo CRDs.

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

