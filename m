Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645724;
	b=fb8wlGxaYgz5Hv/Yj7PT5p+qrBy202BjAUh4NFZoOxpILfiJFGbVVsxO9gQ1wczW2x/o
	 KiR+0NwftxOAvI7cmT9dvAYUgJgHqhUHfO4Ee1Kpnq+bjMAoh8owR9EDLhSQsmwHf1sjJ
	 2FQ9lTmSh/07+zYNgiNgNFsCIUnAWAwevh7jnHRbjGlSYddJI9tzcGp0NSOZh9FjkwEfa
	 NEYPj0sW8r4FkLdpZYtmjCGU1lWpB28dSjFffSgpumDHlaUVuck3jxXrqkrOESKrEHfQ2
	 kKz7aK/nhMs98biR6AAN7r9l6lH/sW8LNSRA3K2v5Q8pDhYXPDmYXf444jIzNvHNWNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
	b=kRoMePURznMRUp3BKNV49wxkTmZuShpqvonTonUnDXyQuiXmBc9HLVn29YBDCOuiGODN
	 obXrhfGxA+Zw7fHRYrX3DPqbflBWTEjSKQbfUJ735iPFROfZKeRSyaXl1hWro5oq2k6+P
	 z615WRsezbPUOODIqHnh4Xi8V1yLrbVyu4asHBW3Hui8md2FgQBIJfqqOGgeIlJy+yAYX
	 L2euZ1gt+9Yr5R3LC+gqc4iqpTtrz4niZ/OHywy2t3KRatujwNTU6pBXSY3Ro7wFBRUwK
	 NCi2hhKGLUMpQ98x37daSv8VRBQ/oN9mrkMLAuRje+jyIr98jW6s3LA81mhhHjjmHWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJI+zAaK;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA40E606D80B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 18:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA40E606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJI+zAaK
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso21429825e9.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645722; x=1794250522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
        b=iJI+zAaKhU+CrvqaHHMRjHGBbeC1FfSyn+BZbCBk05LHQEXJOSPQgobOc25w32FWoU
         dmhrDemPksBrVHUugONddhyKNor/Qo3yLRyguW66pbN1mgxFxsR31BSx4vHPNaVYgcAF
         9O8hbxTA4NULTrpp7F2OCq7llwIwX6rN3S8JmkFI683WXZrtT7bp9UhO3AyCIa/Txi7U
         c2jJG9ui2O/KlOtBg4tP4pKNKgcJpp3inYnVP0W8IUq+Exa3ywQOhrN5tYZAGNYdZonI
         bTbG7bsHlBIKTV+EvUIMyEWPuWj28Ea8Xhp1EQCg0f90KfkAP+hjkWUJbUA+qksqQilL
         djuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645722; x=1794250522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
        b=P+WIKh2XK3MBsPyg18nb07pUAXSZLUYeBZO1ooRN70fMYkQNBsO0UIq/r2a2SnIv6e
         PY0ZZSTD7vYK8ZEg+XXmv7Lrh0/cec4xtuK8oDFJB2eGZFBmMQWNFhPycBd9qX9zEpqF
         Ub0c6sfynxnOGo0iiVr42BMtvowpF4DZiLWR7sZk9tKUYog2mBz9KnvWrkzxd+n8YAvH
         tM8q4HHNRzPrznUfGE/ggvrGhC/CCGjLJL/jXLMU/aoT+meMP6D0bEAuxBK8+G4Ijauu
         5LUHt4ya5XoYy0UJ/IUAcbFcSE+NUwUAjQkSKl0CaK8jIm0rE6bbAOPzIyN14Z4gEbGq
         +a4A==
X-Forwarded-Encrypted: i=1; AKwUvBxpZXtA3XRjcZGRqbmCPRCxNwAmx67DTy1VLb0Vf2M2sHrvdUz5wgIIF3AT/pkNv+7s/94/upLaNErP@vger.kernel.org
X-Gm-Message-State: AFq9FYLo82Vy1zuEJm+oRHLos/6XS00apF/6I8EwHOrPZ6e/xXpBWmY/
	5BHzojZ4WMGnpSTdqil9PQcGj2B+hn3K/6MaRltZlz6JvicNqlg+qxn7
X-Gm-Gg: AYBFou1rblMXHgT+Fin9fX0fHBvngOcwmFvEjmYy+xflzQxf+SE9or4Syt+BGqIVH4e
	JQfWFGhr/Kw21JuB9nzZsMxrv576T/ek7fRf4ylPoY0aSTCIbZCbyO8Jgeufu/0FVkqHRtNb62N
	HsocyrscRtzLoo1QI6/gwZ2bHmd2rZvazw16TBIA/g5IRa83KfH28RWlglhjBKMGZVYeJlM7tHb
	Sc452iPMN0TumYTADCtIX97HmJ3o1ISR92NxTJNUXKpg7Nvs631mubzt801NBxZoRPcEYh6dSQo
	7yRrfQukjwMOSZn78UspsZRxKFtV0m1ha1coZY5eJXIXk/2AAC330Qm163YX1CUV5UEjgv5juyJ
	fg2pvR6xLkk1p6vOQp2yxQ6EJ3wZ4xRm3XAELjSQE1gfD0cM6MR5YNuywOgNpANiKYz6HrUrOqk
	4uvcZ/b1zmxqStOuvxy0warmW9nJ2PDekInN2I1HjMKDwRVAYYoDGte7YIAC/NeSagw98fqub0c
	UP8DzVpWcd13ltsVlmb3AgnD7UBy5lQzFeWWPVDoplqZf1xJvYvrCt9hC9j+WSaXjXr8YoQWvPd
	AqlqSFpxECJYFBasBiCZpOlvAhPqfAYG3kL3TrDQDSLweitrylCzUuHYIeL8SvduQSuW5EBT+8O
	AArtFiaZXrr+RVUjA9pbmKw6qT0rpMR4EcyPap5iGZuFbj6bOWKGmaA==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr251061815e9.17.1793645721864;
        Mon, 02 Nov 2026 10:55:21 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:21 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alifer Moraes <alifer.m@variscite.com>
Subject: [PATCH v1 2/2] arm64: dts: imx93-var-som-symphony: enable UART wakeup
Date: Mon,  2 Nov 2026 19:55:04 +0100
Message-ID: <5e9ae0cbf0b98898a8020bf3d8889fe87405a3d3.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the LPUART1 serial console as a wakeup source to allow it to wake
the system from suspend.

Co-developed-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..47203811abe9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -302,6 +302,7 @@ typec1_dr_sw: endpoint {
 &lpuart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.47.3

