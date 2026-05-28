Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7403CF02B
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969816; cv=none; b=AkenEei83cJMFf8OCyskvPBnKBSWi1utZQag9g4x1mqBlw4HbGJbD0QqnSecV3j8DjROwkqX7Z9bIrcn605/87A/QnYJFpWAN0P6DW8QyLHfJbctJQ57Jpbg7uGl3ctaBFgp3QPLYN5SVNBPL8TI7B0QRZmFmjLkyiC3b6PZfr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969816; c=relaxed/simple;
	bh=4BOlVvg3iRSP1swvQ5XO1a679OzNH/v+9k3kUrkeOsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyWA7702iOrquPTv1oeSavyt90l7RgozUiNQFs3fbRW5PdoSwBe5Ev0g4hH5R7pU0st+Jxo55kYXbKr/wGnvWY98WjpGC38FHuT/69oIHlr+EwMdQmMCMiKV8IMS4txv5zmqkUm/fND7RXmpXzZGFn4Re/tewelJD6QeiOA2ZS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKxdT2Zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fglysgf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKxdT2Zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fglysgf0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vbom566526
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpC
	PwzY9U1A=; b=XKxdT2ZxyET/kRwmmco/ZMp5hTn96amBXkrujkbW72W0YNHe1EH
	nhOIM4bMhT2NGdVjwGz8l1Zj4duffd6plFgnjM0xkxySoiTFfgA6370wKZmL09ek
	FM3H/vg8mpW2weJGjJkAPHVgB9rL29RyKUgAZCh6JjJne0sR4MyZGpzjVDupZT4q
	d7wRvPmP11H4rE7YJSJJAXP3G1qPrBlsnZwTh6EPjj8xlvrqRqkW7MeQlj/ESQRj
	IJnIUqn213P+7sxrpgB4xUX1Hhy01BqKVsbQA0EBQruY3v5XtNr/DSEK3r5wv6VD
	KNLXROP2k7l93zKFSoHrEs3VAbbV8anImbQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjkt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:03:33 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69d6c45e2aeso2367904eaf.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779969812; x=1780574612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpCPwzY9U1A=;
        b=Fglysgf0uliv5JFWpVHfuWtsooU1raJT9hxfRnQd1MGfDBTE0TGVlafLVZejbv1YAn
         KyRFoncnY0/nuJDlcZMkYTavWm+VwfEi7WZPkACoCuDqEN+VSglnOVdXYcnRbv8vCj0A
         QyCBXPX48zWHUtAQMUkGOvHbDfOwTyEKsKRnw07YlWkrCT6o/l1C9RM7MJD+hsmGjZQC
         nFZyslItCK5ET/rXKBuzwyhI9siAMldFuauddjDwxdTaJFUJ62/Uz37DUIyVQKl5oYQ1
         oQIKGyimiw+JBaMygW1lFRE6ybzsXz4ybO7ibtBKL515ZAV5fj5gVKdzvu4FLjoZVyuU
         BtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779969812; x=1780574612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpCPwzY9U1A=;
        b=gXfC8nfSF3ppgujGSOuAacQH7y8ig/ieW7JMacTUnV57cvczFdd0zkVsV5gSP7myZv
         TL99FOIW4oz9RrcPw6eHhJ3V9lsGoN6reN/PF6Z/7DXJfJtOH5+ff91WWTKzZ5Z9piwE
         ysNjdlKvO1KJdDIOYDwWVA9cZD1goBzBs4nEwdMTDllUx53/Q4hcpfcEOXSUWKSk3vO8
         qu7LHN/kWDjTJU9ctyCQP8WTVydJEhi6KPtd+VThYFyGhOeA6VHE4Mw4a3MU/AG+mkna
         JLYq9hZvgy8wTDiLZEKa8LUsEGTT0+ThsYCx6G52D0w2lga4gOaZYPEQiX7mQTs6F3Sc
         h8tw==
X-Forwarded-Encrypted: i=1; AFNElJ+pTJ1Eecnvdcp2NuLyQhI8gGwfGaBQoPMetd3jdsNm/GWAyiXNEz2qL8hueh9wALbfkHIs4m22P0SK@vger.kernel.org
X-Gm-Message-State: AOJu0YylnGtM8ujngdLqQ4MvkxVOjSZyHzChMpqtZMtSqEr7Nk8U0IOV
	pZ6h9Dq+6RrjYgUzVmUohbucyssdt3UZHjfMkMLMGLuhLvJ6TFP46ni0sAxLPpP8d5lhA2+N/uL
	/LE2yxEyH985ZlwhJsK0pgD9YzqZ+nX1TVMG4bzsmsD0n93yysE+eakOD56zZKbwz
X-Gm-Gg: Acq92OE64Ixvx1xbDmaE4HJnXJYUhxpYblnSDDJzp1G6eHz8GeNDaFjtkRjxHNLcVTx
	dMBiN+frrSsJp/CMVKP4nDbmEjo48nhTVlRf6fhUnbdnDkEunEXGZDC3nM/wUj+/f+1w5oxbx+c
	cnHD+s8P3NaLwSQci9s4NJNYSpND+4Jttlfm0YU2vYTG5BoD0sSBL689Dk4BtCDGjziheK0QP7Y
	hhYRJnSTiv6CIHW9TnPTYkGZd/3Mx2vzAayB6jrD6hsveqHtf5SfKMySOVtmswLwd6+H81o3Jpm
	PsyIYxtIJs9vRCuLKfcM0nPCM/l+4WTvZeW1b4YbdLn6uTp1hBi8bCJFp3BL+RGfdRA8YlR+O5/
	+SVBndFKtm0/LV3dZie8kXD9LLmhu7rWK79FIN071XzELoA==
X-Received: by 2002:a05:6820:2222:b0:69d:e8de:7578 with SMTP id 006d021491bc7-69de8de7d2bmr3066719eaf.17.1779969812140;
        Thu, 28 May 2026 05:03:32 -0700 (PDT)
X-Received: by 2002:a05:6820:2222:b0:69d:e8de:7578 with SMTP id 006d021491bc7-69de8de7d2bmr3066668eaf.17.1779969811575;
        Thu, 28 May 2026 05:03:31 -0700 (PDT)
Received: from quoll ([83.144.38.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908dcf850fsm21035695e9.4.2026.05.28.05.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:03:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] arm64: dts: s32g3: Fix SWT8 watchdog address
Date: Thu, 28 May 2026 14:03:24 +0200
Message-ID: <20260528120323.46287-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IjkaP39YhRZWFZ5J0997FW5op9dniYkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyMiBTYWx0ZWRfXwSiMLQ7woefo
 Wsh1rpV0fOV33lJwK340qjW/7sjObqASwxuQyoyP/u2B8g/l05urGLhhUPlGNkWjdFATcMYpnro
 3auIyj3CmTDTNxXdut6vYDP0Ob3Lz3hJpJkV+G4QWK+38yk+F6KXdkzuO0OTcUy0n6veGwj3ygG
 HxsQTcWuIhEP7SVc4kQnXewc0PtLtPraMwmrRJB12d+gK1Ajr33A5+bp9GmLyDNtenyRc++L7Rf
 VoJa2pBy3ON5FLul19Xe5BdXJknR78XybhD1yicHSIn9NwbTL8MgvOXRzNygDVpElaIagFfNw/j
 4732ye5sMJt8uorVD+XAuppg72x1AGnAJy1l7mgfgv6blwTsEB2XhV4tPhmgggsaYq+4ERHLfB+
 APnXQaxCOg2U1hhCGU9sjpJKh41MgO3lmU80BwP7mf6zF8Aki+B8QviWu44bSqf1KApd+S8ZM9u
 cz8SZWkske4XMB+Ul9A==
X-Proofpoint-ORIG-GUID: IjkaP39YhRZWFZ5J0997FW5op9dniYkr
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a182f15 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=gYaODGAG9naNOzoQWaDNdQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W4yJvGHheH2QdBhsH34A:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280122

Add missing hex annotation to fix the SWT8 watchdog address in 'reg'
property, as reported by dtc W=1:

  s32g3.dtsi:863.27-869.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"

Lack of hex '0x' meant address would be interpreted as decimal thus
completely different value used as this device MMIO.  If device was
enabled this could lead to corruption of other device address space and
broken boot.

Cc: <stable@vger.kernel.org>
Fixes: 6db84f042745 ("arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..7e28dff53a86 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -862,7 +862,7 @@ gmac0mdio: mdio {
 
 		swt8: watchdog@40500000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
-			reg = <40500000 0x1000>;
+			reg = <0x40500000 0x1000>;
 			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
 			clock-names = "counter", "module", "register";
 			status = "disabled";
-- 
2.53.0

