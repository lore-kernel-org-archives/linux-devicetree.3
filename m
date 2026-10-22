Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673491;
	b=Hgt5GdISGvKVy4LnMJux0hvb2a2y2fwduq1sGR8zhQsROJdmAsSHLMuQiggMl/i5RbTN
	 KhJGMF8U/Jd8S6ZvOdSqeFIUyyUJ1fSS1+mtAMjJMDHir+fcgvjeTYrmUtxK+reMp0L8N
	 lBaDNLqOUvgZk3oZzhiWrdVXy2FA/6iedENQWeS5dBKxc/1874S88aJOeN/I13hKbtqIa
	 /2uJQj7lqCTkiAgC4ZxlOKbiBm952nHo05ito4/McGiZHjvjrEfJ7uKBGe/+948pY4aWe
	 3n8pLjCSXAwTYt/5zJJusajUDuH/ZU2vRTC7WxRHZsF9sgSVumonW0wWPuvV3OTpEMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
	b=K+06o4dyz9DTAaANdt1CpmKjOgc0gcD3vkiJp5wc7J7KNc4vEN42gVUpDpZPdOEraVaY
	 f/QtXofDv8gUhlMIfJZMOCKHCqWaxDGRWf1VzOBKPht3gAk3RL6tqYFjdlKxiOUopgrXW
	 n3oLHZEJ/5meMIc/Ok/9rv95a1Jz24o5OJLG39sEic+0et0WJEEBLmgAxlCgDoA7zMjaV
	 acXQo5UHuZDBS1D5ptRGQCqdq9q8YXtAURT5JfrR5rEyh5n+dZPpiEYFojOGOiPxnBdrb
	 1hm41hNhP1ine13TRedTHiJj3QNQAWjbSUZAqUfZR5/AaAChs65J5wVsthHQI5iy/Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dj11otAh;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5D4606A31F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5D4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dj11otAh
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so11023135e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673490; x=1793278290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
        b=Dj11otAhQFCoZX/THaaTfsyjDmoSJV/Mp/WGzQfTM7Ey2mHLr+bAMzZ7bFVSsqoS5l
         YtGXD9uhu1+pzJTgeUKvtY/lFuN16bNpWTGIdj6lXJAzsTdGdGnDVEMSJGuWQ5mcCMEl
         VRj865cuFNMSIykTtNh9NfaesjKrobKDlyBBQyEKMAkmmmM18DyeTpfw7XKhyVtMfCFn
         9GhTdq7i0uB6qgr0/4FckYrrimqTvpHiuJB8NGKDx+fTphwZO1Grce0CkUw0/xG2rcna
         NpmEI9yCF6Vy5NFx4X3M/VegjwBV5dn1N/XUmNi9IAEgh0ksLoiF4UKAXX4CsMNfbT2h
         ThHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673490; x=1793278290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
        b=CCVCu4s/v4hXg8qLG6yNS79FhemrDlxMl9FU/bAAWnUH1/GFuLnnqOPF7Ho4ZR58AS
         tzo0pmHl08fxPcbeHxQY9nf02yvolf6Ujl7Cf59h8PoBJ+mRR9abSNx+UQCqritvEWtp
         WOKemFsaY1RGkbLCRBUJ7AcCvTQpvH8ZY7hkCO+RfLGgk0WSSRU+X9uvJyAG03AbOnBp
         ycRZ2E/8UYti6o0S0wicO/odFFQiYyiOjXWJ8YpOooAO6dMIfMdyu/9BxCPBG1J39QAM
         l9/vOQ2fIAYTliVUJP5oLbXrZCFE73jTOY9qt1BF6+A1Ym3u+rdTxd3ke/OwPZ1gjdNE
         Nmwg==
X-Forwarded-Encrypted: i=1; AKwUvBx8Cw9k7u3HeRxFN27q6IRikRNPQQ2pQ9YaCo7NMNMEzt7a9aBmMMAMuQBBMrjFKVCMSrJRgNabaAgv@vger.kernel.org
X-Gm-Message-State: AFq9FYIq9XiAFm94mLWQZSCRGO2D/KIPVzvE6wfM21xPrax9vb7R3Z98
	wqsO2reayrf/e/av/7wFADNBeBy6X5LDqczc59XhCzzkcYNoLFx3DC+3
X-Gm-Gg: AYBFou1G/kEV3X/2bCyKix6x2ZqECMd7jxDC8B9+RFTHW8VhGMjxaGxBbBCIn2n5c4R
	/dtoihRmdtN5fLY+nhUWPZgCd3o0znU8aKydT2qH7PypHMzSNCVjAkfY2Tac6k0zuUgrrpe6Q/P
	AhGoCiROj92rzTUv3TmAEFad6NA31EkvTHlJGls3HlOK0FvAvtWBvNXJrEJqtNcQMMQOW01F4gW
	Evh5H5e5snPe8hDmigtt7CSU/k08n21iRqWFki0YTkaiXk7viZ/qaGRqHcCLyP4nUksL6HdQ5FK
	OlYvhukYJbFf//vCUwhDyetiFWb8pXdv8OAU/mcFS2FuNqj3jy08ib/V0VoNKyZPE6vPr7AvNBj
	QLn3Qp9QWaao4IhqeHNzmWizoa/iP+Z9wps/y6XWGYEBsR3JEG+++vVwpNb+Aht9KrwtXb4NjhP
	7ESZIJL898ISaQsWGLxpHZWO8V8pk3IeI5sZ8x8FVqG78/IYa0C9WCBIYVTYsiSexLYHHGIka/u
	xdejeoHoK8FEncoW3frBedOpOCa7dRhs+zOW293D7c9/3uHpa7sAOd/d8M/fd3pWoPkiDApQFNe
	6ZU0qEWWM3I9EszDpC9aQXfq9EkWbfUyU9bgiJcJaI3D16tGmeSz5HM=
X-Received: by 2002:a05:600c:1f88:b0:4a1:f90d:6f4c with SMTP id 5b1f17b1804b1-4a1fdd09ef4mr107714775e9.7.1792673489828;
        Thu, 22 Oct 2026 05:51:29 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:29 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:05 +0200
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 NAU8822 BTL overlay
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
Message-Id: <20261022-imx-nau8822-btl-v2-1-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The NAU8822 audio codec on the Verdin Development Board can combine its
two loudspeaker outputs into a Bridge Tied Load output. Selecting this
mode only sets a property on the codec node, labelled nau8822_1a
independent of the module.

Rename the Verdin iMX8M Mini overlay to imx-tdx-nau8822-btl.dtso so the
same overlay can be used with other modules on the board. The combined
Verdin iMX8M Mini DTB keeps its name.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                               | 5 +++--
 .../{imx8mm-verdin-dev-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} | 0
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..a4f26aef77fc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -107,6 +107,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-11-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-8-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-7-x.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx-tdx-nau8822-btl.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
@@ -253,7 +255,6 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
@@ -295,7 +296,7 @@ imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
-imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
rename to arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso

-- 
2.43.0

