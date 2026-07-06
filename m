Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEA9431481
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330519; cv=none; b=JsRK08QWkuz75uiPSlSXwSZzSHcvr2t3t3kEVth54ad6Vr7uNZF/+dMzO1HCHaO7Rs4e58XeZLvcdiogsgpzgmaG4dg1aMgXuX/USSxDKVrwE1niGQmJJxapeF3KvilkA5aoD7pLPy0c5lliJDoobxxtNPHkxESokIoM8xQZgVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330519; c=relaxed/simple;
	bh=A140vhVhwLWFIpylbXh+C5wwcDhFTvGbJ9/nsUqSi7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amF6qeakYBtD2pCfTXux9lOtLCiLffTEAdoLbt8CcSm/QbpV2+ys9wQVOH0rWg6ydUMSpjWaVulusE2KEhNM2tQsbxjOxe4AJ3+h1pqyQFJO09b3DUOKc37M+8QoQG8Lw0mE2nKpcYC47kfe4HmLBPf4AdcH6wnjyM8zg9Ac7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4dCTH4W; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4dCTH4W"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bab44440so14491535e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330509; x=1783935309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWOn87f8FIIe4C+aLOBOUWqe7yflMdB9mmXK3KEpF0Y=;
        b=e4dCTH4WCQvn6ESd9Rgo/c6nMnjO4MAWBjwaCmLV9uub0m46hvezPQhvwVkKxmzMTl
         bUllw04JSK2U8QKcUn7TplrsVMp15hs55h/inekerp1Rw2BlAthjXy/kw6W5KKB6Ee5E
         ok7C9zkL04LXIFOJM78QG8eeD+tMBO6jjTT0EbTXWbbyZF9KVdc/GQRZ5RLOUmA9qbak
         ILdce9+VxXQuH8aPSB9gXdS6wZgXC+dloPTIOj0XqARGSecINCSrH8updyA4DX+KsYZq
         vXU/bRk+dq6bY233U0kOK6KxTZoLwS/QO+wqYUTi8d3aFJTUHTBO2axL93mkx9rHuY93
         VxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330509; x=1783935309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWOn87f8FIIe4C+aLOBOUWqe7yflMdB9mmXK3KEpF0Y=;
        b=pazKStk7m2djbwiefj7WXC88QJFsxrSqUWvz0LlKsz5rxqJRi98VirKl572gmMkL5C
         V5Do/vXeJ9PiRIsYuV6iTVpNR0Vl5JE8htRhK8Ee6Zub/BRJR4Pvyrd+j2rSZiNdoN6d
         fD617dRusRk/19TNnDzFpLv1rAX67xdV3tby9sZf1wUcbS+h5L1mQBkB0QCSSyz1Hx8Z
         0wGw8oEJl7ntW6gfMmPmFndVOPLAMVDWZgpFAjU8adJqWausWXaYRmxL7qKdXq89EKVc
         aFE9hpUnPGJws+O4XE4fEf4xM6B/ht0gboJOcsP35BAIRX3SgnVVXEIWQiQF7ekCdJpY
         fSAw==
X-Forwarded-Encrypted: i=1; AHgh+Rrqaad8qwCzNfxc5n4bLzW1JqYZx+P98lo3RGl1VHIZEyKkKX7fmdkI4AMrkApEOZTUCLPQEvw4Wwhk@vger.kernel.org
X-Gm-Message-State: AOJu0YzUf0OmBwIW+HcunKw7G7sdNZc+LZLfSHl5fayxIHKRfEJIctCj
	4PxtSSXPwI3W6vVkZGnyLZRhRWf5LtxOntxlHeJZIoVi5isMitwU92lI
X-Gm-Gg: AfdE7cnqgaDGMNBhz0dJi7FaYmjWXWOiKL/U2HS65USpz+moqvBoFP3EYZRVoXHxdxT
	0DL/YHuNRtukV9yqCIg/owxv+KqMODsJBsGomJ3NtwzDwJ58Nk9TgKG6JV2Zy4yeQylNdiQ3A6a
	+WupkltDk6GVtWW4R1WkSENcWqiovC5UZEDyjPXO/6YMPPNAkYGg1dwmJ9Fd6XbSYc3XPnZorpa
	Ou8KhXPcdQOZ3RJ5y81IvcXYzn/HiB3qxi+QN+yn4zbeJYlyjjaG/k/pz5fyvi8U7NRufX6A+qH
	45+gWk3oPBQHPbBXZF5+89/vJZDYo0TYt9zZEAzriI/4vIZ4GNw3TmA64iRrhWi/vY8fwKNw82Z
	Svuwu5gckXCX8ufw/rJ0QLYoibBh0kKaST0KIDYHD0FhxRol4O0RSZAmvf87JeDulgSVimwXWbK
	cLuTdR0yh7bKPw53QnScj92VhIN6JSVHPUGM1Ozy4z9LyrwT5pUAWflyP8v1AJ0frD/gA+PQ2ZW
	EgesYbXLNC2FFNkEQDLP1Sx3g==
X-Received: by 2002:a05:600c:8b33:b0:493:c2ac:58f with SMTP id 5b1f17b1804b1-493d128b68cmr99027495e9.8.1783330508009;
        Mon, 06 Jul 2026 02:35:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 15/15] arm64: dts: imx8mn-var-som-symphony: Disable internal RTC
Date: Mon,  6 Jul 2026 11:34:45 +0200
Message-ID: <7a31f7ecc4fbe9ea009dc7c5f611105daa989c7f.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Disable the internal SNVS RTC on the Symphony carrier board and use the
external DS1337 RTC instead.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 2afb5b438b68..364127257309 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -223,6 +223,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3

