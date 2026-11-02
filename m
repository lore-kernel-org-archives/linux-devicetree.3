Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604712;
	b=SKyIUWHyqXwS7q29jy/6ypyO6p05v0wmLEFDtNzQXqMa3mDpOEV3RCCrZn/nFl6Xk8Bp
	 byIKezyExyp4yTINynW80EVo/hOz4B6FFRi5teLsU4VitxLXZHlePFYLke1bJWF9XmcxH
	 koAfXA0LMhOznWrOvdON4kEX+xAHCCAtolS9gCyAcg5IfwnJzabfS8+0VSGs3gIPJ3pZv
	 ZrssNydgA3Fe+4sro+9Ryo8V++W86bwtUWa7MpGNyPIItjKr9FqDXRfbDGFm1FxtOh2KE
	 9SI3etvKoBpZDh0NQD7K5z0h4J8v15S3aAZuMTAe4C6ynPXf8NkyJFWmzmwuMkSG5Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gYG4XMvbj1ZWlrawZXHMxEdbu1VimdUzwJ1tmM4hs3E=;
	b=gwNtJRszdqkmTVgI2pWkmD33FVOmwtK1jpEESF1lJeIFUaS0biUejIoyuScZq4h1symn
	 CVkBJxnDDdU7Q843ZNyX35eHKx2xSMZzUHg7/oQ2EsKjTq6zIqHtFmoM8UBlA3+xbgfMR
	 HqbVZ/sprm4tmfuZKWq3RMYKkLpXFng1kqsyULggm/9PUkst6DldARUmUNVbe9pJu9Zxq
	 4PcZGgwcIOp3Nc6+kaSxammGeKkabpKn4s21OGi9WTDcK25FBkXj0M7FeapmZFrvbqFG2
	 lxuD0kHRGbwu3/Z/AOzZbIdLZUhMf+Dp6hOm+mjS3EQ04NBJQ5ab29w/a+uM7468TQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=diRYCfoo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAUVfCRD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2851A606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 07:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2851A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=diRYCfoo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAUVfCRD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A25VsZB3924178
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 07:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gYG4XMvbj1ZWlrawZXHMxE
	dbu1VimdUzwJ1tmM4hs3E=; b=diRYCfooBoVtpAs2qY12b7ltUtbQPn7fSCax3u
	Blu3jzb/hThurIkvgQbJ8s2KvJp+yaYq0dciWduGOJok4jPKhx9wTbEmtaw6vc8r
	vp3aVZFZ8dkjZnHdlNYB4BAsLW+FjNcqtLapWiucCLhb5qUfmXL0LLushSYQG1WI
	eQsQv07I/cPryAOqYlB128d3afdJGWJClMxzZxj+7t/oG/6gzOnNj9t1Hnl4Eka+
	ZHCEis2sCglWM7XfeaUfoSuuOtBKf9oFd++7NLiTIUlf7VO1ZwAHQTIX2v8InQW1
	jdinYSNwfXKyaW606soMde4jK6hAFRsA8BUA5c4YNVpuZvYw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rcyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:31:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so2861418a91.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604710; x=1794209510; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gYG4XMvbj1ZWlrawZXHMxEdbu1VimdUzwJ1tmM4hs3E=;
        b=gAUVfCRD3LDlIlpiSNC+gPCjbf3pqBlJe3vgU+uaiJylr+EOiQzJ2kt9pbctBC3TFy
         PvJYsKKOqWrBkI4B9rUt3naybqegf/tgQ+EAi5BXQmq5mUOb2kl0Zu9XbOBc5K/SalvR
         DDxhOi6K24w2wvzyhU/T5dftW+hpz85tLDpHGty7M9l8lealfnn6xXR97M1A/9nSjjlj
         myoU9wN8vfzc7ORIHQINzvQPNMu5v7xN9u1wzxASXcWeR7PjNkWiCosRUxEPul340YTB
         QGl92+JL9MrSAMAvXcYgEb0Tg8+thPfojrbPpg5sLc0hLkznprIxWjeHt/ZZB2RfOLJT
         BLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604710; x=1794209510;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gYG4XMvbj1ZWlrawZXHMxEdbu1VimdUzwJ1tmM4hs3E=;
        b=YlNRJkYAM9VjhKEXZuZFnxJwunGe6wWbDI8a0QZQEya9nqiFNxJoL/YqC/7ymeKt1D
         E8z4sy38ZJv6fL5joyfRRPE9a8E98QlOIQebYGad5q99xR35PXH8bghcdiLpaydH4lXN
         mSd6S6U0UjXNoq11Q6WRhKSOu4l8iiLf2pKfB1lkopTp/5jlY8Ygwy+ceK+gZHpbKx1U
         Fr9t5IEs3P7b2TL2u7UtsBmZ8nAumAN+C9zZwr4keg74bd3imJjzsqy4SAWl0E6Nznem
         QJKRyq+kRI2fq2abHsgTWrcX5fLfWgUM3nTVJvxcsh8pxhyGmJYsBGsZgmF6XnZOX4Ce
         G9vA==
X-Forwarded-Encrypted: i=1; AKwUvBw9Ny9xKdnMi20O+9xaX1KSSW/dbbHWyI1FxTJ5EXkCSmFCrloJRIkfcVhyC4/z1x20ktv/rDY9vfN4@vger.kernel.org
X-Gm-Message-State: APuU4Z+e7BhkB7jO//W9sN/IJh8b1Lf3M6U/KSZVaHeTTyvX3FLUHQ7M
	bwOkLNq7wPggEiSHeAkKHbhUmaPG926fUzP3I5hVuEk5/FIXo5Bxe+DmlxahTBfXtDpkZ3g4u9Y
	y3PWudqWJ6AhcMXPn96X9FTDTvOLCafrZtCo2BVvVR2Bo9LztLWydwlvgZpSz+X6n
X-Gm-Gg: AYBFou3MJtruMA8ARr2MVH1BlzZynXGqS+gSILknUXqX+k4GvDbfkCWaPCM5UzGeu9h
	KbRZ0/VCXCHUstbxOLaZHeURYGI2/DnMWBXm3toOHo9ixvjvu9z3MFiHNXoZIBzUuLS+U9iuBlD
	9d02ZKaabD850E908smWQElorRWXUxgvpJ5ta0A2F5DvR3RxpKy+JU55bbxRYisfJ7vHYgmbNc2
	3HS8ZPCpoBZSHgs8ZQ4SIiUETALpDX801tKUJJW0Zd3NFYdzlg6mvTej2hvIFQlU9+TvXvp7VE+
	7M0vu7yC+YsWhGX2fTHSoye3Lk+D0QMc5l6UlD648VefFnG6JzyEEYWtiJVLLKmZVHLTKkbW157
	AbWEJZcy7mKzerdE0SnC6Nl0hJ52J09dlvTydVeZu+ZwS8ukZ8eVGso3gE2ac1ofDx7bD0jVFCL
	sINh/z
X-Received: by 2002:a17:90b:4b09:b0:3ac:8354:3920 with SMTP id 98e67ed59e1d1-3ae6f054f7fmr8783977a91.56.1793604710235;
        Sun, 01 Nov 2026 23:31:50 -0800 (PST)
X-Received: by 2002:a17:90b:4b09:b0:3ac:8354:3920 with SMTP id 98e67ed59e1d1-3ae6f054f7fmr8783962a91.56.1793604709712;
        Sun, 01 Nov 2026 23:31:49 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:31:49 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH v3 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Date: Mon, 02 Nov 2026 13:01:30 +0530
Message-Id: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFQ86GoC/32Ry2rDMBBFfyVoXQU9rFcopf9RshhLcqrGjh1LN
 g0h/14pzqJQNwgEI4ZzZq6uKPox+Ih2mysa/Rxi6E+54C8bZD/hdPA4uFwjRpikhBrcXkbALsS
 hhQuehphGDx0e+pgwq6SQTGowhKEMGEbfhO87/GO/1HGqv7xNhVg6PkNM/Xi522da+h4iRp+JZ
 ooJFlpYAG6sU/a9j3F7nqC1fddt84WKb2a/iJw8JbJMNETybBaGG7ZCvC0rjP485ZjSshfqfIx
 wj2m3eX0Mr3CCto+L0M/Hgp95NkihGydAeWvMH8NbSWQNl7NIRlJq8azy7jqDKqN0bSptZEPXQ
 TVEj8tLSLtN5WsmtKxdRVzNlFPKWlErVlkwXEvviFXUCf7PBFQ+FjoM2LZH3OQMYk7QQfLlM/J
 R1gAxIidoV+bZ324/azJchWoCAAA=
X-Change-ID: 20261019-lyra-display-upstream-post-24656268a902
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=5137;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=GMe2uwE7NM1n2Zpjzvl6iZ1PqmO1uEJHc9EkSAQxCso=;
 b=AtNy9jTEPlt0ZECo0G1l/73bQ9myKQpqhrq5hzh3Z1Y535V6i+Gb6kLY9MIl3HJMH7H40fIB7
 wHr8RWyWUjeDEfFHk3CwlyrqBQwjl2zhdKDDiRhPSoOTiKzelT6u/nk
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: YHUu9KXKYYyyO4fJAcEpiGr0lsntddOq
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae83c67 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=BLctq3pD1h73di9K4sgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX2bfgP9hw+vkc
 EyK5mjLkPnkfH9cQSRnKAtFxZlTUXGSyqY12YRCzvamqn7hJL9zEXqgTxxoTUcRL7q6BDsyRuwf
 Qb1plx1X+fJlnr5o8MJQZAF9JCsOLWYgEqeUbt7ks7v8af25pbCvzMOFurQtThEjX+xlI+XHztF
 oABBafnIgAAWbMu9abeE+2a27J9ZWtF0DlhFQgdLbeN5fEeNdNLkCUB8PZjqID4tcek1PE6b6M9
 oyctaDqhJvMlbr+oMoGE7FPIV0kU/VwJh5fEiVv1vEdAwyDhxmUBOp/eULJG9BKC4WtZom9E6yM
 UxJw49Pdp1rk3JwGW+v0T/z2Ky+lM1M/DWaUT3ucA1XPa+X+fP2eehYxm6Knoo+wtfjLwLLG3OC
 5ce955f37EOgFvFhsQbWq1fFX1Zt2+qCf/UxjytydQ/il3TI4pMUPfZZst5bWCThjysjAT1Hejt
 7AuJUQQBCHffFIMUqfA==
X-Proofpoint-GUID: YHUu9KXKYYyyO4fJAcEpiGr0lsntddOq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXx9UMm5c/t2na
 k7BQQDYnyZXKH9ulUGVbyf9CqW7hF0u2XSruSYmTCyTQsr901mBcUdsn75T8PY4GE2wyc7XCzcJ
 dZIf/m8n8bL9pqoatAYLyrG7/u9lhEc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

Qualcomm Talos Lyra EVK SoC card are mounted on the Lyra carrier card.
The DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
connector, through a MUX which can be selected by a hardware DIP
switch. There are multiple daughter cards designed that can be
connected to this B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

Below overlay DTs are added for additional display configurations:
  - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
    daughter card
  - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
    Lyra with LVDS daughter card

These overlays are applied on top of the corresponding base board
DTBs.
Link: https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com/

Dependencies:
https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
https://lore.kernel.org/all/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com/
https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/

DT bindings:
https://lore.kernel.org/all/20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com/

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Changes in v3:
- Added GP CLK Frequency Dependencies
- Reorder the &tlmm pinctrl nodes in the LT9611UXD HDMI bridge patch
to ascending GPIO number.
- Link to v2: https://patch.msgid.link/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com

Changes in v2:
- Fold in the hdmi_connector port remote-endpoint indentation fix.
- Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
  patch; the dt-bindings dependency is now declared as a series
  prerequisite (see base-commit/prerequisite info below).
- Drop default-on from the DLC0697 backlight node.
- Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
  panel overlay to fix a dtbs_check "too short" binding failure.
- Reword the PWM_CLK defconfig commit message to name Qualcomm as
  the SoC vendor.
- Remove a stray blank line and non-ASCII characters from the AUO
  LVDS panel overlay.
- Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Anand Tiwari (2):
      arm64: defconfig: Enable PWM_CLK for backlight PWM support
      arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support

Shashank Maurya (3):
      arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 101 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 493 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261019-lyra-display-upstream-post-24656268a902
prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c
prerequisite-message-id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
prerequisite-patch-id: 37995c88387ff54737dc82eb7c3b4600901ce061

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

