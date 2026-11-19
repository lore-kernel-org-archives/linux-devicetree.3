Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069388;
	b=3ADY8PjX6KoFmviRsCg+0XHipldsnN7golrho6M08P4xkOKWAjE9fDJioxYMJJ9rY3Kt
	 X1FH4YRYNHscjVzKvjoZ1smiUnHfBsBNf1Z858YBo2ieZKC9uhttYMZbsuLHdjUmOcjcv
	 rd82BNtMN7ge1mSYM6c60ar5obCiPiO/y21H/0FjhV6+/wPXQm92Hd/gZky91bx90df3D
	 LEV10N+DL9ewQiVPYB+LGx6dkwl5rjdy2yyrE24gwn4Slg48IGV66TWBmTJHYSZGiH7XB
	 xduGf9nOXhobSd8lE5RCectW0UDTfh3hl7cL+ICmeObe8igfp/4PvPmDdqhpCMIo7Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
	b=c8fdl7GrV/c4QzuwnvFzaDBLB70+qCXrqFXc7m/NtCTOwSZcg4Vj5yl4qFkAGqAdBlGQ
	 bz4bW0w57Caec9quOFfemQCTpsTZQJOk7iGRVUR8xKKPj3BgyjMlT9pObFhNkRl7qyrbe
	 P/DEVdKDxjd7Qz0KBU0nabEOSXrwWIYlJN1PY1JTzKxoe6wgAaT6TYp/O58xldJ5wVowU
	 FPOz7xUX9wjOTgdrJBSCPLz06Sfe12Eo2pRujx5kiHuPYL9vXihPw11NGrp37CV0ujxWQ
	 LVl4R7CTV+y+NfkPmrMOGz1xhs9MfkEPKxezSu6n69J0k81H9VapdqTtNwoNxT+lkoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UyVLaBqk;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89068606A32C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 06:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89068606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UyVLaBqk
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2eb18f4da15so8208175ad.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 22:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795069387; x=1795674187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
        b=UyVLaBqkrV0X2/16uNN8x6WOswDS5t2rgnTki+/9On3Qck3Rs15i9NTQL3f3QcpaCr
         pGAOqpC8cQlxclpKz9r8bgvCyDz9j3skaovLtSjfnhtj3cIm9ocKWCtHSqW7Hi9uRcPm
         FAbWQqs6ey1BcKREJZd386R1YNgEOxpuktbkKBWsAU5RnGMuiPUQKf1w7jQ3jz7BWUE8
         FpjiyNIHb/vch4tQccmtP05urAj+9xAFCR63zXKicpLMR+aGCRja53SXZsl2VVYghtBM
         quPM/Uior9TZdk4asHeXcsuXebgUEoKEFMsWq+LBs61AA2tz+bY9BfZWUL5894T+yQhe
         eLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795069387; x=1795674187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
        b=yDV5YAycsaVptBbh6W0BWMT8qr+BKsP8aPGFsIj0KuWLKo6PgloKMoFPDqCnjg3qrs
         eRU1d8BdvrQ9Hrv5i9Ibi8m811t0nGzmjCJ8mSm3ly3Jnz4FlejMUY6WMjC12XXJXtBl
         hUbs8g1PCb4xjWBkkdRDeAVuKW2vl9J9rle3TDiMbfWN9A6yC8sygLghtiSPCWmzUU+w
         OhcZIstk0pr3PPmzTcWgfOOdiwfUeBlRdk1HNKNt5OJqdgLET29iCMRBNuhsFLo2kPMU
         NLNuKRRms7xu6/qM8TBfNKkSECs1l20Qj452jw0vfmKnrQEiEiGijfkDjgmeYnSJ5hrV
         NugQ==
X-Forwarded-Encrypted: i=1; AL+hErEJ0Ek/fQ/0mRpOJr843kTXHH0o2sxAGXhBkxKFJUHJ83YBNXTWJH5S5zPUxH1W0MOHP/+gOMgFYXGE@vger.kernel.org
X-Gm-Message-State: APuU4Z/iBplpN8dyCeSVJoEkUNTa9rvBFHaDMDDqsGQh/XITd8Ku8h06
	JRARUkGuK0SLqp7O8UXJj2Z29m9gzPWDQDD5euY0CpfmvG60QumBVFlkKL3Y4nwvg82Mand/6JD
	f2IAmlw==
X-Gm-Gg: AZFdTZfTqlrt/xG6QiCjpxC7qwUe9mW6mvLGMsMWj+M5RqfGmlIgu7H+Q2OxfWeOK9D
	jCoXhp1h+IFAavp7iQ8Yyr9NcGjPXcWzQ8kp01O/6SF/5VCuvXMxbn8UGtnpjmIqxG5PUjUBZri
	AIh88Xqjm6oBpOh8trJjZ9WypirvGvUvzvZUl0d7O24bTaakqxCZhO6kX6hSP1KQkACy09CTF1T
	XkclXQoE8k6kOx1qeAuM15Xa4eHmGy1QGGda5bBQkbiTf71iWpjy6YYeJVlz8TrYMzB9wSR2xXO
	pWeGes53A1VWdPagpaS4sKxIFiXyX1g1hP+PWrLBkAHI35xXVE6e29KbmnOzjWUxdB6ku4vXEbC
	qV6MPupfQPlNEA/c7Ros0fb+QnMNgyIpMhthvF3Rfne066fjAwbjOufhgoCjq2IniuV8YR5pPSJ
	DXyeWCjoBdXRYeMPfGmXq6B0UivjaUtcS4+D76YYuE+6zUioMWut6/2NYRP1x/D8HztcvZkVaJI
	KyL4i22mQfnTltO/V9X2AXk/aDpf+PvWjBsj7c62AP1mG2leDYB82YaEZxYOOC069R72+p4tMy1
	uWV9N5lU1I3+S/ByoETssFSTFGXNf5r687dhkRcaOevFQX80Iuv0McIvxY77yAx2/zFSMzCraei
	XRc5ik3qXJfDi/6IV5Yn+RPQEg0Zk9M4F/u72hQ==
X-Received: by 2002:a17:902:d48e:b0:2f0:20cc:32fd with SMTP id d9443c01a7336-2f020cc33e9mr13953395ad.51.1795069386749;
        Wed, 18 Nov 2026 22:23:06 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff627f421sm24292605ad.57.2026.11.18.22.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:23:06 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-frdm: Add overlay for EQOS PTP event pins
Date: Thu, 19 Nov 2026 13:23:01 +0700
Message-ID: <20261119062301.1778558-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

On the FRDM-IMX8MPLUS, pins 13 and 28 of the J18 expansion header are
wired to the SoC pads GPIO1_IO08 and GPIO1_IO09. Very few boards
bring PTP event signals out to a header, so this is a valuable feature
for PTP work. Add an overlay that connects the two pads to PTP event
channel 0 of the EQOS Ethernet controller:

  J18 pin 13 (GPIO1_IO08): ENET_QOS_1588_EVENT0_AUX_IN, external
                           timestamp input
  J18 pin 28 (GPIO1_IO09): ENET_QOS_1588_EVENT0_OUT, periodic output

The input must be EVENT0_AUX_IN, not EVENT0_IN: the stmmac driver
timestamps external events with the auxiliary snapshot; with EVENT0_IN
no timestamps are captured.

Tested with pin 28 wired to pin 13: a 1 Hz periodic output on channel
0 was timestamped on external timestamp channel 0.

Signed-off-by: James Clark <jjc@jclark.com>
---
I used an LLM coding assistant to help prepare this patch.

 arch/arm64/boot/dts/freescale/Makefile        |  5 ++++
 .../dts/freescale/imx8mp-frdm-eqos-ptp.dtso   | 26 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..5cdad9dbda8c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -633,6 +633,11 @@ imx8mp-evk-flexcan2-dtbs += imx8mp-evk.dtb imx8mp-evk-flexcan2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-flexcan2.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm-eqos-ptp.dtbo
+imx8mp-frdm-eqos-ptp-dtbs += imx8mp-frdm.dtb imx8mp-frdm-eqos-ptp.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm-eqos-ptp.dtb
+
 DTC_FLAGS_imx8mp-hummingboard-iiot := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso b/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso
new file mode 100644
index 000000000000..15d0efc30243
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Overlay for the NXP FRDM-IMX8MPLUS board: connect PTP event channel 0
+ * of the EQOS Ethernet controller to the J18 expansion header.
+ *
+ *   J18 pin 13 (GPIO1_IO08): external timestamp input (EXTTS 0)
+ *   J18 pin 28 (GPIO1_IO09): periodic output (PEROUT 0)
+ */
+
+#include "imx8mp-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&eqos {
+	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_1588_event>;
+};
+
+&iomuxc {
+	pinctrl_eqos_1588_event: eqos1588eventgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO08__ENET_QOS_1588_EVENT0_AUX_IN	(MX8MP_PULL_ENABLE | MX8MP_HYS_SCHMITT)
+			MX8MP_IOMUXC_GPIO1_IO09__ENET_QOS_1588_EVENT0_OUT	(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+		>;
+	};
+};
-- 
2.56.0

