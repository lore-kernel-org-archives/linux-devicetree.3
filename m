Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B8843E4BA
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576296; cv=none; b=KUS58Asv1etSTCdH5DM3xdwkE4nhVmV005wU/SfEK3ib9NQ3OOwcX+Ed/nNXlqjXgwtPAi149fzHxo8OxOwg81zs8BtXYdvR2ucnKp9VRkpbB/NZUi+aNvmDhmSt2gKKzFNaxNuy+0niqKVj4iZShBmOTN7wRh/LFjpAifDYinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576296; c=relaxed/simple;
	bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIMuKxbdJO01hd7zjcGlRjslFn6NZLznOnpkPqQd1EWU1sXJMpb5Wm2jKjMxj2Wd12w/L965N6tfsgiDMWJktw9GVNSA76wa8G98f2cWOdfqa7Z6xwCIvxdWD/QTMxLc6R/jNwcnndpJE6RLHBoDzO7V3d7/YHQpmsSdGkJ51Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfoqlJm3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fz/LEivr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfoqlJm3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fz/LEivr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BKPtb011764
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 12:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=; b=MfoqlJm33MHz1RXo
	VaPPkj7+9L6dYSMphzMDlXqrUxYF/tjEoIaBQsTAwlti6OLji+gN+nAsJGO/pgOr
	e4NpL7icnywOddrjOc7u8ASzihLlaBh2FYSz0ImFmOBxThr2oVP4m4sD5PfCv02i
	FaX5dBYRefGXGmnzO0Tnz02AdXhHQlZl/Kk/9Iki20jVBtV4drzu5xcwRx8/YbVo
	edZGNzE9MGTpwvdaI3whUS+bByWFPVr6stI3/QNNzPNBbn/tFvxrkF+186FmDCGO
	fzIVCAyvweoGEd7bJ1AyvG8AINWJrj9Vyb1oMQtgIs+3kYleQcfTYXtadv24EWTa
	YiUnww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8dc08d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 12:31:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c850ff84ddfso880318a12.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576289; x=1781181089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=fz/LEivrS/gDcCT3dT1SXy/VqLFFk8hguPzw8RRe7Y5d15otXWe1AQii3wI6ZYE1zg
         LhptjqwhW3hWVEXz5sc0nWnw2vXEyBVqFQYScm0pAdqgb9bt3BDBSMRqKWyHC5c8a3uz
         c1VFWrQ6RzL2eVAGbeOV1IxORh8bnz96tXIlD1TvcppFoq8Z6sxksNnKVNp4eqsCaHlB
         pKc0egyrNJuinEVYb4UXCIIX2/vwN1GbCfPV7R8fqMuEESkF5/x/sqXn3tzmWit8H506
         CGHnUYlZxp7xozWJUAH7LHWRtMYC9j1nj/7dciLviWlG69Fk0vDHMh0nzpmjxV/xxTpV
         NxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576289; x=1781181089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=QI28qo4Dx0EhYxgMk1HMEY+tvJoeegEjM4EPhZE5+tVKPW4OcVIq8EaW5E9Omvnnt2
         lOiJpDrsGIlCEHhcEWa0+NDVPEhT0GRKzlym8e6xi1rC6967rK17rZfHuSrGeoSVdQIQ
         lBX9nPgi2kZ2XNvxdXm0x9bGeq6/OwjbGNxd9KHmGR7MH8/7Z5cfxj0k8IM367QtdIEA
         bn4jN0jvDzP4I8gNo9WtWHABuARDIUxREO/Ga/TwGBNIryJpm8/ZIBpCd/LHAzUHqvlx
         FNGfD+E/16b3ibFmguQN61j5RhTbjBTdZzoDUG402omyzcgSCPihIE3Z7S9rXQRqHC43
         ShUw==
X-Forwarded-Encrypted: i=1; AFNElJ8BVE3quW3FEXWdmBr39fVxRK2jEtjsssm/tZIAKogLy+/wXt1I1L3CoPOULUqWj5D8ZPWOSe0YHcQb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ab5E+nPJTvLRJ7BQQLZSYZWSBFeLpkg3SwfLFh5eu+gkfJWA
	h6h7HHge+5wuQhZ9FhBZXGnuENbWWKZ64PGCj3UgTJMLDhtuOGnXUs9JWee9z2+K1n19vMEx2S2
	FjYpF+WMaKvXyrswrd3AxsC8zFHsw+W8WM4VlYPNs7XgsgfozfhrZceim8mg7yRkG
X-Gm-Gg: Acq92OFIblKztd1jyQY084Ob89gplD8OmHo6vP9Nc/DGH8VCfr0pUwk9oQKLux/dUso
	lBqLmC+ANC5PbMUsp+TVeLhbPLAqZwnYyIvo6tk/rEqNuBPEwTw43XeQAe52JvrOqL/CxGwvKvu
	YEtA6HXQWt7+QiysB9qnf1rN71pjm6Pjl6AhhBe/AU5JcrfGcx1YH6MJJr5Y372gzjYSxyM7BLl
	GN0YjYz8lD7nQJoorfq0vzIStTvLWglmTiolBNpN5AhPjHlPPAE/fiybJ58ko62+EvpvQ6tc8iJ
	YkcK3o5Ffpb7n4pZNPaKt2f/uqeJyhSmT/oLtz3Z2CZBn3lo4peSgANEG6mOhnNKZPYReX3rqvn
	Z+Cc3+akqcrN74zJ9hPAbC1fJjn53HSVOwkujEAnRZqKBajEnCTXyGJCkU6o=
X-Received: by 2002:a05:6a00:6c87:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-84284e8e557mr7258382b3a.32.1780576288665;
        Thu, 04 Jun 2026 05:31:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c87:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-84284e8e557mr7258325b3a.32.1780576288185;
        Thu, 04 Jun 2026 05:31:28 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:27 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 18:00:48 +0530
Subject: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=708;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
 b=m9yIbYKaT8kCKl/fs9wocRmDzoj1uNJswWvdoxbvdIWYfP842Sv1SMBB1G9LaTbU0FTO9Vdyl
 QvUjcv/T4EUC2yeF7PvcAc73PU1HzUvdE6d8SwFee05DqQT2ZjtUuHp
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: 0-Mo8Ag7mUNBALeosAC3iadrOZcNcHuo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMiBTYWx0ZWRfX1ggzU2GiCz3z
 o0C41rSLFEFoRNBJa/4wa2CN3KMqTYki8hykAwX/JRVDVmtiIxzmPTyBEq6s9wvW2qtv9TkjmjQ
 GqacH18ZMGk2Wm5hyl2VboMvdiodhlDlmJIi+kKepp5k88FkDBnkOVFtoOvraLTV2P9S/2e6pPZ
 sFlL0XsxkNiucR3ZwkRwxidT1ybyNSTcRRNvgbJIxd0U01NXjT0UMK6tUnQhVCUsVIpm8P/MtD+
 M2hollsa4Xy8Iyt+YXMi0JxaKuZTxTmOWJORHOI+kQjDCMbReDfCRYm8itzrf6RQEWxNmiUIyEB
 X7m3cgvV8B4uRsVR3MfZZUBXSH0LMntt5mgEdCgU75rTnft4uXlDaHj/XJWSLnLAlc4+OGZwnyC
 fDdjgTBUXAs+gHa3041sOw0I7B5XVGLeYco1s8jEdgNjHYkS6KNAv9vhuzG0wHs+WQI0umKKykZ
 oPlhzt9RFk8SCdJphlw==
X-Authority-Analysis: v=2.4 cv=eJwjSnp1 c=1 sm=1 tr=0 ts=6a217021 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 0-Mo8Ag7mUNBALeosAC3iadrOZcNcHuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040122

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

