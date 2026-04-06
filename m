Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1147A361DC8
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 06:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775457505; cv=none; b=q7YLG0zujeK9T4yLGfST6JlBA08gmTI2SSSyvAx+BFqD+2raialoFgcZDGB46QS+vyEYgBW7AdW2PDxos+Vcc/evJWev5NFeOaFVfQoTwTA6HolMqS7dKzL/d1UqvTnaEqe2TCImbLe5qeXDzXyb5JRGb/JfrScTRB2AFuMZShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775457505; c=relaxed/simple;
	bh=NKTG5+SHcXAW1JXdbaucnX+WCRebKnrDUyFIgU8QTw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZvrFb1hZ5Wt+KTzHfNp/z71rKJMwTdDnn2L1qD7S/QFM3YoorbjSKZzvfwIF1PM+8ooq8IZ1xyAzeHtl/vf81fGeI8+8RQ7XEZ2f43vg2DysrEH/5fsiEj6QCjiqZ47RVz8PiKzw77Y27DbZg1LVGZm8OxOmigBWLT8oCeVwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXpHbvDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/OYVRPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXpHbvDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/OYVRPg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Hi0YI3543138
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 06:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tkqsgi/b9ZE
	29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=; b=eXpHbvDRt+Y+4uf0JmAFhVgxo6J
	13AsdqvlzVC6JgMSIcmZYjha2BPP+MIDX05acgQo764s9WR78/Ci4KTN2f6bL8dQ
	9fRW3259HTig6E5sno7GbNVbQpDrYUYsEk7x0IDf5Ke4CgRMhHSfIhxlusjj+apA
	TyWhk6OEqfAU8Y1jas8SgYNIE+nlQtJYQZm5mME1a7q/8ZesukB3hvr5b7DrYGnS
	5mmTyOhNoc4/QCLOKdVh+PvRorA4+rGVlItVuxMGrhO4kUFTMjHsuxP80DQafaOd
	VKlCwM1itQfh4BGOpsJdfbMgA6Gh0fnI27YmGBT2KluA37lb39slk/8nSTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1c59n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:38:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so103615141cf.3
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 23:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775457501; x=1776062301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkqsgi/b9ZE29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=;
        b=O/OYVRPgKMvJj4lQ720mUdzSK1Nm4QIcuiwCYyngGJOAxWrjYPjLSYP7V9FGODNp08
         koVbiEsJfo8cUFXWfcACHT3PB5ABkBSIFau5abQK9C62avz73DlhX+lpt8SXDu1O1DY+
         th9QQzu+3Xk8a4DvTU/JXsr3SDfC4N/4HckG8GNIyJgSWQg1rK8rK605/A7YM6nGBYUV
         vl3Bqv+1uRWWJhwAyjB+AwO05HF2Bxt+w7li2gzIJhGn6b6WS+H/T6cgCyG/U/XSTj5J
         yywGHrSXcplCBM8pOAwUJ6gQ5w4bfN0Kcs5hA6jOqxRneMLvFOU25khSpkiPVYc6z3Xj
         vt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775457501; x=1776062301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkqsgi/b9ZE29EDYbWjY0RehHrUxOeDAeSueJ7mUCYs=;
        b=XhpdYp1lqLeE1Bxcj/KH0x0ol3jpB7WAuw1GqTxFi4zjbqxnxXpslRGHfhuJcypjn3
         6EtpqyA8uCBL8akV5W7QrzA3Hb282TrC/YzNuvY0T5IOLyWp/b2+bA4fvYwPfTzY7LIY
         ekEM8nTJHi2TakuWV7JK9+Rxma3jFUdsf/Rz4hjk0ltxeMR/6fguPMDGVsxh5dJHCGE/
         6KRoxBliboE+G3CrRxq/JcCzbUB0pcXsMz3nVLw2djZSU8V2jgKV0IJhz78qTT9XqN0Y
         Cz9qNLiwPbd04K6pguZ5fnMCaJk/E+tdLM8IYBNBB+wimZiv8FsSYFJd+ZY/WcDnP7BL
         q9OA==
X-Forwarded-Encrypted: i=1; AJvYcCU7+0Wm4CRY5ayMcM6MIQ+OML0oxWnHa52UxPfrjo5eEjo1q4bqhuD6Qh6upa6FXjZZv/sHZ8bxBmjv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8OiybhvTMadPS9MSjyElyR2KLVBnQ3KleK6q5yDG0qUbz22GE
	LSmFyyVJjYAL3LlPPQzfpGMcl/hXJ2dKyDTuegVXv/+dp92lnpYh6Z5xyGH+r17wAr33zo7gWmD
	KWaS4U3SxjLll6nzb5JEKdDFWCima8afPfmLuAkVYkayq0aQ0OIs6mv3DRzW2aIwx
X-Gm-Gg: AeBDievZleQ5Oq8DtOU4ukAOHkCSalEkEiHPZsRWWHrq+IMk2F0/08UFX1kBRWfSflx
	J3QUXzqboDRJjHQsb1O5iyUwp8nqX9iqpKMsb8WUZquR6dNn7S+ymoep/zrNtfG0L2NTWRdoAxH
	3Qbqvq6Ry5WOWi2gQp9tVqbY7Qd6A5cL3zfqI9IH76apXuBjsbW/iR3OFFIQHLBatH6Jk/n7ndC
	2qAenO3xusXLO30ux70AkAD0QTjZEfGRDvd5dM9Wls0Evs8q0mdPf/SgwZBpafPk8RoJDr8MkmU
	5nohi45kPX3JSMvWAeW0AC8sF9tqu9PLOKF3t4hwNx8bEmIytJtYivJpuz92P9YaLaVNGqLeraJ
	90nJU46CuhpVWvbfB/y0WCU3v/7s5rt5gc6g3
X-Received: by 2002:a05:622a:14c8:b0:509:1d4b:f860 with SMTP id d75a77b69052e-50d62b34a43mr169714871cf.58.1775457501166;
        Sun, 05 Apr 2026 23:38:21 -0700 (PDT)
X-Received: by 2002:a05:622a:14c8:b0:509:1d4b:f860 with SMTP id d75a77b69052e-50d62b34a43mr169714581cf.58.1775457500656;
        Sun, 05 Apr 2026 23:38:20 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm36724509f8f.30.2026.04.05.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:38:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
        Peng Fan <peng.fan@nxp.com>, Fedor Ross <fedor.ross@ifm.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: imx8mn-vhip4-evalboard-v2: Correct interrupt flags
Date: Mon,  6 Apr 2026 08:38:12 +0200
Message-ID: <20260406063810.25531-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NKTG5+SHcXAW1JXdbaucnX+WCRebKnrDUyFIgU8QTw8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGnTVNWiBDD++YBNGt5UAEaKATYJxmG/RLk5maCk21XeAIvfO
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJp01TVAAoJEME3ZuaGi4PXlMUQAI/u
 1IdB4Nmf2WXgCBhdFqpqbMpzPe9C09bOK+tFnYAmkWReWHVW1JjyneoNYzCEO6ip1VXva7jbC2j
 tKzCffLLXJda1Jyt+x23g0QKUQjE1hU092/7//R8e5mivTU6JjD4V+HAi3MF99z+iborvYGmUtx
 QOiPDFBwg88/5DDBiqgtFi7vQ0PY3O6UVfxix+kkaAeWZB5CaDUDNYcST6yMRZbKv3Q5IQyEJy8
 BEfAfny0udjyM0AkP3/aIPh1X1UbqRuGYVusV4BgVzSMnMOYJ+G/0eUdb5wjMZ3ZFnqQpR8xWdd
 lpPHuI2KGVJA4Nyquu4aIqo/Rm8VKm6+sfogP6iq4qXFN/nzPvV+r2IQ/st1tR01iUNNnLG/kTP
 Rl1vByDF7vJCeft5MkBwMbzcNdULXbKvd055EsQ9HqhrWcQwQsRLnd6AdKzM63VFGbztLvH28Cp
 0tiMmB8z/Rg4vuAXDJ4QtHzvZL9pigTWjAjvR+WsWWBXxuZwWUW6iA7TeTQIVPuB+zxkTzRa9uO
 8bGwn7zhxHr5ju91o6IJn3autdOVuEj6JGq59bbwPdoDHbu2BrqpIkbWGOx5xXJl8QphVzeoJdF
 REwy/HU6a+jdahbQcjGFdsXECC4MGwLgY0E2UhVWI8cTkOvIbsBsc3G0c+P5reh+JZRS1cB2mqx LJfY2
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F53Ho1OG0JeWVRSaDSkze9ZcZNXKqthd
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d354de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: F53Ho1OG0JeWVRSaDSkze9ZcZNXKqthd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MCBTYWx0ZWRfX7p5kF6te2LOK
 ze7mAS9BzGcHqoJFPq6tE6EzWJ2aWgFqH9mECI0+bOdWu+UlLEP3PmNitR732XBfXFyZnYmmnQc
 Z1W1oIF1h0xJveMPban+7eyVH9q/z+F1TwkmJGVGkpt9iAwtXCRGMCBkzP9H1m1VJIy/PowBoe8
 wjayt8DNbHqpGKj+cEdW05cI7vpfT1ncN4pTBJOQWjMqgzEc1IJExyZ3nBoFuMHe4xfiRpkr0Tk
 OofHaNfj8LyZT0pA1xYEGKj66cPKR2utT8GEDiSVB6d7p9hhTkrsiIZS3OXBashcjUxtLqC9qTu
 K9S4Uu/wgDqTMANEZ45zBevm6WGMzau+LQL3eqPkscEp7u+YXb5YanQ08exwt92cCEcFodaWxC2
 MHDPb0McXoTVJUt1fNX1rWuixwjUc+ltQAjreqJPP2qVr6r6sFNMgj8glaiSiCtGftvKwCdmPwA
 aCDwcOLrMY/bq9eS/6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060060

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Correct the interrupt flags, assuming the author of the code wanted the
same logical behavior behind the name "ACTIVE_xxx", this is:
ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW

Fixes: 5eb7405db99b ("arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
index 4dadfb7f78de..43fd4d0041ef 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
@@ -99,7 +99,7 @@ &i2c3 {
 
 &ifm_pmic {
 	interrupt-parent = <&gpio5>;
-	interrupts = <17 GPIO_ACTIVE_LOW>;
+	interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &iomuxc {
-- 
2.51.0

