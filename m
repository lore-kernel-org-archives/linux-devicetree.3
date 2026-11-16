Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828885;
	b=DFJPpu/8SgoBgZ/HWLle9f6M39NtYt6cmUQ3xqKxYtZrI5XunzDekQRS/pXa+ej6CVYf
	 GbNGapkEGErAUQpRuyrsHu7yj1PfLIezcf+0LMAGOxOjrHvpMi5aHt1/IMlU1iPyAQUi7
	 5dOpKB/+ernPppgrVjugWyEJBukzf0FphdUoiZZxmg02C2Fi6jpAcCjYgH2JwQ6VOUOdu
	 yOMgMXrXlw8ZO5nfUasi3wr3jvOHZWQD29J3GOcvzVa7SwRBquSnvLIqBXb7L/DiwBlNh
	 TS9jWMqFPLx+FAL8ORAPDV4tYhJWRnm2cgRtjCPpvat3mXp8G85EFg0pFT5uMA85mgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p0U+0MgseieCY+eZgbxNlAGFpXCIrXZzDYBXpqCiW0I=;
	b=Kbkklj5/cEbABvwzYhnc3rsHa2BSFIt/hJSit4+7F4JMVrxG9Q+r9OOAREloLhVHlR5Q
	 nxkSrqkJHEJ+pTUS64Yg2zw2PpuyFP1TcG439t9agutM9WJNhTbWUD+VPK1s5O1F1c7Tq
	 Al23IR/rlSxeTvKoqZk9yaD76OikKLIXLXq/+MUEOqAW2iZCtZqqKMGCeV1+rYavlgGLS
	 Bde6h06RRUctqKzZhxoxdFHT3lC6X4tm4bzuAlDKnSD9lpBgvbR924CtCsSZaBODQ+0sp
	 G9wZzdXydzZ37ZTjPIfieQrx3D+9Qk0T48dE8Jz6M1GfGp8BcgHXG7li7I112hsRUDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JD6pU3sV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeQVMsCU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1184606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1184606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JD6pU3sV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeQVMsCU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBMInJ3033359
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p0U+0MgseieCY+eZgbxNlA
	GFpXCIrXZzDYBXpqCiW0I=; b=JD6pU3sVv6KXPfTVXYWh2QhBBZR2u7QSDCDHEa
	H9QRMVKQabwfChms+jQ4uE7a6ndYuQG6A5atqfrJY6nUEPmQZOszaPXW7OiqvmtM
	BZ5F1wh8bXDEkDzOXePVtbIZ+aNsxI4N6bym5MFZVS1Drsfvj+rt5nFeHjVNHfug
	gA9+1rHOuy/jA1V+bDncMDiuY8Kndfo9AuvoleKm98H8YG6fvjwIw40hmcG2f9u7
	x73N+4+HVIDBswyH0Bi8mfc8qBnd449Q12DWL1k6nBt93lMpF3pC6BpCUwfCFMYG
	obYGFz9iEw+tBjCmiAd02lD843tvFsUhhqw2fyBRLKyDLoIg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxcf0mrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:34:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde080a93b6so232980a12.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828882; x=1795433682; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p0U+0MgseieCY+eZgbxNlAGFpXCIrXZzDYBXpqCiW0I=;
        b=LeQVMsCU/7CInPV69T6C/PqucRsSUbavnJQtzsISHuLsYLN8DelsxFBiJIt8iXzrLG
         Me7BtmtixQwrrJQQsBWTqeA42O0HhKM/PaWsbiMyUuWLzj+6I1GIoaF4rEy66+Xd3L4R
         eRup1+v4cF4yS8E2n36ExyhX3bIcKmC0o6RpSRYWtKr6kxqYj2k40wYPue2fUx8n9NaK
         h7eEGj3o90Y9cP1AMRwW91SVgGy1nTZGpBbzEsH0+3eBrYs6XefRcR+LXlwsyZ2IA+t/
         3WreKg8TdEgBaARvQq5lIXPbaTUaqHGqoVQCtZnAtfyTZA6wWBINDquvXpUdIWL+K4sX
         0xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828882; x=1795433682;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p0U+0MgseieCY+eZgbxNlAGFpXCIrXZzDYBXpqCiW0I=;
        b=M4FAMt7+rgUvPmWQIbWqLmaKRcZc6YGRuM3ooaj9alx7UA+eSBqbm2CT/RHuO1uCqC
         7jjVFEJwNLPamotE49ECBSToAYj8Zue89a42ccvdVCojaKpvJpaJGcwvlxzWq5uM9Nqj
         q1Qg0W6foMAGh5iJbuPoKDFBlJ03nFfLb4AE1w+ys1dV7ZL2Ds5r90mPky5JbnNKRbaE
         g0T/OEgpiUdZusrktkjwYeGdYDL9RvMMip9k0YBru1KV3VFUKeAwOE9OYgKh7zAO8jKL
         6zgSwThP4Lqw+7H2tIZ7H4Y3uLLIYwkRxGh+zIWr+j7v650iZ3c23IHx77fKSySuz3BQ
         rqYw==
X-Forwarded-Encrypted: i=1; AL+hErGR41J4AEvxxRcBjY6fnqHjgovh6mEgDlj23WkEp+LXd0Np0TJNxeg5pFhIRYuVoUhZfJUwI9NRiAG5@vger.kernel.org
X-Gm-Message-State: APuU4Z90HXSv2ag54aIsChPR8Fy0vW0+0P92IgSfwfJCwsYX5zGs2oib
	HtlZTZql8/+0rcHK7QDlxpRPCyKeLVX6wCIAY1FRVwsbMSQhXojDUTkQY1/nLw4VSk6D4CvceD4
	+zndRDycUHlZUyAENMQaJ04Hjq3PCK/YBOQP6d5JPTjPAY8IvwtHtPal/bbCCw1yq
X-Gm-Gg: AZFdTZfriM71fp4usbTUiHu9wgYSva8JGzUaOGMsDiM2epizBfhKWFDLffdpPtW3EiM
	YxutD/tPeTtOK/RF21QX19yex2Iz/fP/b9IqHh/tkq6t/+QsfIJfKLX1HrvpULEi5Cxyf2fSQhc
	4mIbcjss6Tk3xZiZcTMBxcpkHxlrGoDJvLXWUf8XvnUEy5Q9NF4qNR5NmZK+W4Rwyb3fAV8DxJt
	4Y9aU4DUiK4/xDkUD7wHFJiYoKsfPzq0PTq1tVv6Yq98ejT3FVU5Y7hGTSjEdvaQm0zy1AbIBwT
	tFMhyP9wH8+OQZOkHU6fDmRVRPGi4lAONmPBzIBXoAFdv6ghoLZPX2nwEO33lpJm+ksffZqu21h
	b+/U6aHY/GX2mMY09HKt8gdXbL9mw+kjUXq4IH9yVR9UNLu3cUdrbwwG2XNr+t/Iu3Uz4l1HiW2
	LE
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6683735a91.39.1794828882413;
        Mon, 16 Nov 2026 03:34:42 -0800 (PST)
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6683708a91.39.1794828881886;
        Mon, 16 Nov 2026 03:34:41 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:34:41 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add Parade PS195 bridge support to enable HDMI on
 Glymur/Mahua/Kalambo CRDs
Date: Mon, 16 Nov 2026 17:04:03 +0530
Message-Id: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACvq+moC/22NwQ6CMBBEf4Xs2RJaEdST/2E4tHSxayzVLhAN4
 d8tePUyyUtm3szAGAkZztkMESdiCn0Ctcugdbq/oSCbGFShKimlEl67UQtnPYkjYn0wZWfVSUM
 aPCN29N5k1+bHPJo7tsNqWBuOeAjxs71Ncu39FU9SFMKU1d7WRlpb4yUw569RP9rgfZ4CmmVZv
 gRT7M69AAAA
X-Change-ID: 20261112-mahua-hdmi-8ee75b4fd29a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=3388;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=CEPQAfrfoOVFKYiKvfmvgizAwumAv2PlKkCejyLCjNo=;
 b=hRbs9o7wPDhSjnLNtvA8ciYcRV/oTQJ5GNv/Dp0qV2W+e2dBnKRX5ILctpkifimanUrxvlgK7
 fd0Cr5MqwiqDh5isEcGgP9jOMNL3mcNewIPNYORuLQgcszfQa0fx7zw
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX+dqHGAXXnl/z
 3uw3dCuGuS5F+/qkwBNFl1iyj9cWZHWQxiP/A8lWuaFdYuQzefxBYrdqdmTNGCikR8IUAnQNghT
 hi6NZ4fpmEtm5Eb+36dTb9/7m984JxVBUHu5vhPIGlrFgrHeSRvcxAr2bcJ/3vey8ceovacrYYg
 LGn5xdO/QFk9fHlLkUNl41VcuxLXTIQf677Pbfz0MB9yLWJO6PlGbF/l4ePHFbjN32Lc5YqJdGU
 Ow1iYNwYCGtmJjaLgCP7fMh36Y760P3YbClCmEC73g/2K2pqKAKv8BAKEx7u8wjEzDkG+SqOqZb
 cs7jC/CUXbdeqFvrR64FcOdPQHX0/5xaYnOgU1T0nTMQgnwP2ChEVfq2DrSedllXAXJI8rxhRZx
 foBkh7fKpX0ahpLNmDpq3/7z1PKTDf8E5Zn6OFRADxfVnNnvIo/x9VOAPuFKOL8XVfsIeEFTfOV
 g26nEg2+cyZYBOJtojg==
X-Authority-Analysis: v=2.4 cv=RtZQvymK c=1 sm=1 tr=0 ts=6afaea53 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=Vl28STUz-e5Og-itK1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfXyYhMfUAKVJNq
 4Rfb8RNj/EiMhJEezB8szZfxb+sSTX5wV3/C8FgQEHnMs3D73FGC/Ci6AtLUZG1Jy+r4Pr73fS5
 9+0rG7eGfg+h9IA1TZoEvnGdNlv8qso=
X-Proofpoint-ORIG-GUID: 5DaqkCpT7AAYBZoKrsL489l6gaj3WL40
X-Proofpoint-GUID: 5DaqkCpT7AAYBZoKrsL489l6gaj3WL40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160045

This series adds initial Linux support for the Parade PS195 DP-to-HDMI
bridge and uses it to enable HDMI on the Qualcomm Glymur CRD family
(Glymur CoB/SiP, Mahua, and Kalambo).

The PS195 operates autonomously using firmware loaded from external
SPI flash — it handles link training, EDID access, and hotplug detection
without host register intervention at runtime, so no existing bridge
driver fits its power-sequencing and reset model.

It introduces:

- a DT binding for PS195 (supplies, optional reset GPIO, and port graph),
- a DRM bridge driver that implements PS195 power sequencing and PM handling, and
- arm64 integration (defconfig + shared glymur-crd.dtsi wiring) so all three
  variants can route DP over USB2 QMP combo PHY to HDMI through PS195.

Deps:
PHY PLL change: https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
Glymur commonize change for regulator: https://lore.kernel.org/all/20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com/

---
Changes in v2:
- Converted the driver from a platform driver to an I2C driver
- Replaced the platform hdmi-bridge root node with a proper I2C child node under &i2c13
- Chane the order of power on and reset action in the driver (Krzysztof)
- Link to v1: https://patch.msgid.link/20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com

To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

---
Mahadevan P (4):
      dt-bindings: display: bridge: Add Parade PS195
      drm/bridge: Add a driver for the Parade PS195
      arm64: defconfig: Enable the Parade PS195 bridge
      arm64: dts: qcom: glymur-crd: Enable HDMI output via PS195

 .../bindings/display/bridge/parade,ps195.yaml      | 111 +++++++++++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 147 +++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   6 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/bridge/Kconfig                     |  10 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/parade-ps195.c              | 204 +++++++++++++++++++++
 8 files changed, 487 insertions(+)
---
base-commit: 944e974742c54a1d8236fe16897644c35ffd6433
change-id: 20261112-mahua-hdmi-8ee75b4fd29a

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

