Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F298B3C108A
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128742; cv=none; b=NAQ8ZaM0HD/JpMeK/u98gjrDDxWO9JU9gLOWZLdmrDX/2w2r7fnr7YsBFeoWO13MnfuVOBAAg/Cxv1JL+6S5sZ/9mkELwkPfCkSpRm0zxEKKGS9+22Mu1qTsgpEsMfwzqLifrTTiCjAnrEzdL2XbHr5VRCcEgTG8+1aSZVwomeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128742; c=relaxed/simple;
	bh=3MD4BSaEiNQZKARuhDvrcFucO1MvazbLvmRPiKQJgFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxa00KXpK4LL0rMubwjzR0tgelGyGae3ovz2TKAJ7ahmRbpYLpyYSxLcPkYf9DkNpCGOTlnSM93vCUXnsKTdsKruWR0kv4u5gJMyz9qiqRAILX2ntO7hxzV6bgaAT0WoYMI9wbzUtiOYxOzew6ZjGzGfLwk0q6mNhWwYnpf0RwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtR/SdK8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtR/SdK8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so515305e9.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128736; x=1791733536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KRV3JoJ0uG0GcrMZQfb8S9vdxRD0/aDEvY1h+kt+gE=;
        b=PtR/SdK8edAKi9mDw9kz6xTMXQ8Kt4UsoUsiuKiUY3J0+B9IM3YS4VM68QVHUmm5Ba
         zvxIxQxqxGNMaQk1kC1qYkpz9oWdNayEdqBpFzlI3AUHTZeSI1baD2xcWIwSq5j9Uy6+
         1+jT+ZcEfydz5nFuxwZ4YsVc7h4o9z5Zg6pxrkwOCszP6qzG5vYnLl31pJZhROy06I7P
         NJEnqQMVrOy3y10mWN0MohhszsCYHSwJWirfoyLOV2BUagxIMvi1E3zotpTW1qWPX4aY
         obf5XhqSzlop5KT8Z58CHdZsMBoAjAyTg3haKbXjpCxZxQEo0sZFViu1E0t2bW2jZO+c
         fCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128736; x=1791733536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KRV3JoJ0uG0GcrMZQfb8S9vdxRD0/aDEvY1h+kt+gE=;
        b=BWD4e7+gLwhZ6BNVDyjoFOZsroxE/UT7edtsBQj6wLUa/P9VqEGDBSXm6MzBwvMQod
         fam8tBWC4dLo0eIMXQUxYaD+gvtQwKMjCo+Gx80y/3utceIvfXRyAFXq9s6O5xu0ESiN
         oHN1uFzyeg6LTYlaRae+WnVeWj23WJyWs2hCa4sv/Zb5x2ePs/2tvz1ymkIujC2unIWB
         edUQ+OSTuiP7L3GCf5lOBZi4ugCmgEgHyWeHK0/QEhK4owL7njjKnVErqtDrgMD3hhmY
         sHB+LGqki7gSRXQEVUOYs/UV5alRSfs6jAbIpakjAdN7AxRRW7KS4M6+fE8fBJCas2eq
         AEIQ==
X-Gm-Message-State: AFuF++nRZ5ZLM4aN6sxkE+/g4Y6oZ5FfDn+0DY1zCU0UPma+o/MrZhRX
	KLfOzb172bOHZI9nta6sNU0Y86urXMoeNS1amor1SPFhk4e8ZexKi1hl
X-Gm-Gg: AYBFou2wRdmbIl9sIZXJ0crzODkRwhRm2FMpY3Fo3iCycE1vfxxd65gSGgiuh3eUbws
	jLEvz7/G7+xC+bvqbBbS+3W8zM9XW70XIvxHpLBejks8aRaaN+6OwhtjHGSlSiTivHB8DmgyWzn
	SKbVd76MhGpE9HPpaCKTFs1xrJu8NGBxgCAQehRhH8/CJe1U6v3osYRlNEUG7iTh+RqpvMVxOHf
	G/LhWXmRROVy66o3kbL9fXCQhcF56OnhEQbOLh22Flb5qekKJVg/2kbQyiPVJQmbOHBADClRGdN
	18GPM29wcdsb3T7APmW+EecV52Wn2HuRmrWfj+x5X8X60HN0uLMXzaO7dZdxW3nOnuNlvOPYfI0
	E0Qv/AL3ITFaaWQGEwiimBbWbnous8TOM/7OhiG8gDJr0bySl+2DtTbtjcTew/e2TLo80PSajpg
	ORRFfiY2GNKtPjg6WBqH2Aob5OIpYEHXCzadNChORrVv3IrJgX3vfJtPIcp5nWbpjI4rs8or+OI
	X8ZBGh49pco9MzXqac=
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a0274565e1mr160503765e9.0.1791128736181;
        Sun, 04 Oct 2026 08:45:36 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
Date: Sun,  4 Oct 2026 18:44:49 +0300
Message-ID: <20261004154456.145362-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinctrl-names and pinctrl-0 are defined in the common device tree,
having them in the individual trees is redundant. Remove them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 3 ---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index 6b30e17459ac9..f888987ce1340 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -25,9 +25,6 @@ ports {
 	};
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* WLAN SDIO pinmux */
 			host-wlan-wake {
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 896639599c126..bb20197bcdfff 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -8,9 +8,6 @@ / {
 	compatible = "lg,p895", "nvidia,tegra30";
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* GNSS UART-B pinmux */
 			uartb-cts-rxd {
-- 
2.53.0

