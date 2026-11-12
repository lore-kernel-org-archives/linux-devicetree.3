Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483563;
	b=37geJ9sqiMWdfgsnLtmMXZcrCXL7f7zscx4fRALatuvLW3ftmZ9mQq7q10u82lZJ5V+z
	 fKHl8ytx2PUGJs5SmN8/26j7WAmd9H7t4vPZd8GJF/P5ootSy+HL+WF+gYHe+4DlhgXUN
	 ChS1RbUGAL1sJj3cchsvnf72Vk/0SyIG3ctrjT72+ylQ1lIiemaCKXVaE1tsw4wS8tzDx
	 6RZGxkXHvsUsKRu1/JOSgXC5EotDXxRPQb0RnjscmlN0w7e3qBqh2WHpMpZKxI+mUSnAU
	 14ffq62e8tjjZdw1xePxmAdpXKf2vtv/XCaGH9z399aY0cySXg3eaN5jfOcFwpXUSHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z0idzHJpOPMEmuTZcMJ9SVqFYTY6Bea8g7XD+5xn8cg=;
	b=TxW9LyhF23btJLOC3OMcR0Jj7UWeQeiDij5fACzeCdqUmvNSWFAi0e/UvUW8XCFrDXMU
	 zMIpvQ45HZqUVOuMn8sciJIxa7hMgQPY59Qjo+WPT21PE6LWVNKOKYY75upmeQT7pkZEW
	 MRB1A3iseStqEJ1SqBmzFmAFNDNp7KSPrTDG79BntdHip2yzkxQFBk7SkUATxpP8slI2u
	 0BsopyNllBv1RAt5qaBaDJsocHb8t263gVAKVWZSxo9DuCcgj5r0oQmXQ3qgsXkrEj4nl
	 YXHuO5Ew5+HbBOlILoNIIe47us8d/TnGi4B72uh+adjnO5nL7V1/WKM6x1jz4LYeqvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQiQiMkQ;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49367606A338
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49367606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQiQiMkQ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so8216004eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483562; x=1795088362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0idzHJpOPMEmuTZcMJ9SVqFYTY6Bea8g7XD+5xn8cg=;
        b=ZQiQiMkQOMcVGamNhTE25y4QZhUr1Nzg+7k7wGWjxsMBIIbCY6AS57Y8BdbW9DIxFR
         nYAXRq9XpFzD4MQm7ApOAvu89hlhWk0j5OYGoTJUk/JFw7cmlJyCYcqO7jJ7CGUYajRC
         j7cKFW6RwAJGofo6DngGt7TCaSVIrrqiUAlqHVBRInPkWDzFm3Xv4GFEBuTnpGmGe9my
         mO4ylqh2Eh2UsGyqD8obdHISoPOVBNkDEGHNP/Y/W9N04KEzWHFW+JM5zEd3YOnnRq9D
         tPqAzJ6fORiWnvK1oQqaWm9QMsleWIu7ycLWcTvyNy0GiGQBGo0Y3R3S5MTTxK2UTnHu
         SXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483562; x=1795088362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0idzHJpOPMEmuTZcMJ9SVqFYTY6Bea8g7XD+5xn8cg=;
        b=zxWNKAA+iEXLXl6Sn6YWTksjRm/l07Y2Pa1J9Mbzb9D0NmoqOcnoAv5AEhznhp2BPP
         qHmRcC+LDeJ29kfQqm3ojTani5tN0PGIks+8ijUyEloUFtPmRuQjgT3DXtxwsdguMH7w
         JYIOSAqXWd6iUXMIM7d4Qwyj2SctxS+NV1ENo1gNBJJzxCKiNE3jPRMjlAgiRsYrY1TS
         8mI9z0MzP30xmR1j+PmYbwxKvsMuZAglAuh6VRXeom4lH+oS4r3ggaqyytO8PDNXiUvH
         LZW+YJuxHQG0Gsik01+O2OUTBCf8e9QPVAm4CMgTe4kAAVbhfplDwn8VJHvysAL+lyYi
         /79A==
X-Forwarded-Encrypted: i=1; AL+hErEL2bEIrgkt2HZNud4aY4Q2Wl85Osssw52WORqelbyvn0ndd4YVHB3SL+/beu/fZabT+Xuma33JgwTQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+MwuflCnN+5do2C8LT+s+abmG5iUmtr8hFfrox09/mls7wqz18
	S5tjOi/T/A9Q571uy14ULOpfsWTOWUXIbO/4/2sTYtuIeqPSVxe78U547Ju8kZO45YU=
X-Gm-Gg: AYBFou0OFoMUZ2ajQk9ageeyxP+1kRZujatUt+qn7kWqBoVb9hmoUfVsExbwJPJM0kq
	zjQikZ02p8uWfmXAdmFlIgAuHgfHP7sGc9QdCb4rhtOGTq1PtcuZDLVsP9mGg4lgdgO1uKF+8mU
	fxgHUWFAPclYtgB0xWqBinsgXGe/1N22did7wsSCPrHOXC7inZkREgGMXw5F100jAe7iZ7ACYaE
	9jNSxYbpz3htVg4mbje3py/1lrAbXB85JEhcbXj6rORctR/XqLqobSCEKGhsUIxBGpw+lj1T3Dp
	Z6w4bV0t87M4II24QlqySBvQ2+2AhtF97V6Vxydj1OiD53q4EXRtAcNUVXozF1kLDdExYGnspzl
	vj2tOK8JY9XY/vD6U/hn6Twf3YI26xFXaReGmZdgiwpBTMLPWE8YdCavlQsUWtkBaNR2WJ0i9KT
	pux85oGn0ZtgI7mj8Ii6Dqaev3228MZyIkuEjNCtqqlHq5pEOs7D+Dd6ev1xM4+8mOW83hpDm5g
	Jm3IO+h+XMJj4Rkh6lgcABHk9U66Rojnv02bB+ZaUwkbsaWlDexiPyOcHp769I1WFuRY4OgYNeA
	dxHeEaPIjZL4ev48g3DCP0Gq1r9i0++NXUYh7RelApQLagyaKv06Y/tsYfYtcMc=
X-Received: by 2002:a05:693c:8642:10b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37685c7a32fmr6157941eec.9.1794483562280;
        Thu, 12 Nov 2026 03:39:22 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm28352798eec.17.2026.11.12.03.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:21 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	balaji.kalkonda@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: kaanapali: Add mode-switch to the USB controller
Date: Thu, 12 Nov 2026 20:39:21 +0900
Message-ID: <20261112113921.1143-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Add mode-switch to the USB controller as well, so that it
gets the Type-C mode, moves to the UTMI clock first and keeps its USB
2.0 port working.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Depends on:
- "usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes",
  which adds the binding and registers the mux in dwc3-qcom. Without
  it, pmic_glink_altmode defers its probe indefinitely:
  https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/
- patch 3 of Balaji Kalkonda's Kaanapali DisplayPort series, which
  makes usb_dp_qmpphy a mode switch:
  https://lore.kernel.org/all/20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com/
- with dwc3-qcom built as a module, Yongxing Mou's "drm/bridge:
  aux-hpd-bridge: replay last HPD status on hpd_enable", or a monitor
  attached at boot is not detected:
  https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/

Changes in v3:
- Sent on its own, split from the dwc3 series (Krzysztof)
- Subject and message: the controller gets the mode, it does not switch
  anything
- v2: https://lore.kernel.org/all/20261103135057.1682-4-26rote@gmail.com/

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
prerequisite-patch-id: 0f4b3497a5b65f978f8ee3de20953e111d9a4721
prerequisite-patch-id: c6020a82fa07088ac3e07cc89d3059fff044d39e
-- 
2.43.0

