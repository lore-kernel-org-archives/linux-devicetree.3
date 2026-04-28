Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36613CD8C9
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406867; cv=none; b=UmpeKQRPXbkom+s8nrhxsE0ZZda3dxfV4BJ/hM4Ah5xRP99rGtcTxZerFOW5Vh/ADePYFkaFUEWC08EpcFbMnFrHz70KCC2ZbUrK/ZnNIsuCcTBYgMcbLNoboPAGYPS/NW3BQiMMQkMeyVRj1S9vWdnEz1NAoyNZ095yZw5NZk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406867; c=relaxed/simple;
	bh=70ZUw+XXwGiBv0Z/9jZE4a1D1ZLPbnBPjY6fYI2V8PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GsasW62kZh3lBwx8eUul3SYyhkcbtj9jfhJ8iT/s5r/wHKd6oOP+ftA3kyhhYYQodBXpLGAokkn88HFSofUxt/2+9u3PvbOI5D1N4V8lq0Oa2pjhg+FzoxV1TMjD6uvicPEonmmuF0Vmc5b/DMY0utSwRgAtlu78yir0Qr5AWes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qn13UAMR; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qn13UAMR"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2dec803f9f0so164105eec.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406862; x=1778011662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwWtduOWgbcJH/5sVxzLGAMHPFkXvP7oJuezZGoggcs=;
        b=Qn13UAMRZfoao+u239MgZ436ALKacTJNllhkXBwljUxtYAkf/4H3vIX6BKD2lt/mgv
         zED4/iQ/9UWhwcPmPzDKusfBCmnUXGK3KBS/O9y7UXApKUh+us/WLbzrO4VZC3SEEEph
         IFPVUuLPF5S15/zztgmOGbJ7qULLzCwtpoN9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406862; x=1778011662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwWtduOWgbcJH/5sVxzLGAMHPFkXvP7oJuezZGoggcs=;
        b=MiwYCju+WKqmAqgxJjr6viygX/gWsZrB275niCJGPUdvk3jjdyXtrkk1PBc/Qt+t+e
         FIY/2ZO+udiHxxus8Xx06Yiea6l/jtmlyS1Ggczi2z/LHZ7jU3RRsxmzkjMowu94iY16
         FwzIFi1MQ6Cz7zyoJ+Ti62iAVDlggRTWawW/wjJotrlZJeQkrrXPpaWQGCkv78pZTHD3
         N4ugwbRoNG7p0xp81YnTh11Oo0lyeDOA+aaGHG2jNFiaFkpZEq3ZUvu5/a2e32diJPep
         KRFK7lQX7QrDbGgo8YTsBrj5nBZRwAjAA2h1kAtplKsZJG+8c0kdD2DSGDln+tPw/nP2
         EIMg==
X-Gm-Message-State: AOJu0YzV1Zdwf8aQXeUdS+LQ0/9eROabvaDUyIUl002HtwWmChjPLXhP
	KwwIXQe/lxXJh/XjBlyIopuwoshItH3kJ3A6Y1ChHuGIMHS0HnqEPNKZYDKfEd5how==
X-Gm-Gg: AeBDiesIFxtXUSY0i5eJcr3yFeC3xwn7wTRxBPAVdV4BxxV+ntadij9pVfGneM3U0nv
	y5W0F696I3PMPkn44bPUk30kv82ycoMJReF4w3zY6uP3j/uEZq9XCOQ6aI1c7UNakmBUBOsXEK+
	yUgY8vov5sFCD8Y3phnlzvcCTbysONuoq130XO7Y0OXR++ZEv1zBSriMTmIHGs5jCAJKxvrzZV2
	uIMqGjLAvSR2wN9vHe0a/Px31DtX5yU5Dfz/Pr+mU4EmnJ0a+Sd3gG/2L7Xu8K8jCAOhlQw1er6
	qrYA3WHII2KkMBbXJRYMoTf1gd+H/b4SGTE6Ka4Ofndhpn98y0vQJHol/u4zxBnrxyUaKChbTYR
	guudzPmfjGOoQGYSaCPbc63VbsLPnokRsGsTi/j8ReoMxLZ0ePDjJW0ZOxLw4whfrQS63/5h1ae
	QJ4aJE4w/uI98EGtSYGv0xbRIXV9mmn6BL8MNUFG4lqBFUM73+WN2N+JGl0DtkmudEpZxZwp65
X-Received: by 2002:a05:7301:3d17:b0:2be:ca4:e114 with SMTP id 5a478bee46e88-2ed1b4057a0mr129402eec.9.1777406861689;
        Tue, 28 Apr 2026 13:07:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed09fb712bsm3068754eec.12.2026.04.28.13.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:41 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:56 -0700
Message-ID: <20260428200712.2660635-5-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
 arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
 arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
index 65b000df176e..a64cdec3a2ef 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
@@ -30,6 +30,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/samsung/exynos5250-spring.dts b/arch/arm/boot/dts/samsung/exynos5250-spring.dts
index d126fccdcaf3..a337fd9e3473 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-spring.dts
@@ -33,6 +33,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
index 3759742d38ca..f24356784492 100644
--- a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
@@ -50,6 +50,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	fixed-rate-clocks {
 		oscclk {
 			compatible = "samsung,exynos5420-oscclk";
diff --git a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
index bb019868b996..3df27eddba15 100644
--- a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
@@ -49,6 +49,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	fixed-rate-clocks {
 		oscclk {
 			compatible = "samsung,exynos5420-oscclk";
-- 
2.54.0.545.g6539524ca2-goog

