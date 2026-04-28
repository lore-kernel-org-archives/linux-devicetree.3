Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212603D75A6
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406874; cv=none; b=fy/zUqLPb2vHIidhV3zS15X9amTSHpnO/OUGiIgVUxbfkeaVZhN3Vqga9y/mYxX4FDhnJleUtNz98NAIHoqVtYbo0iK50MP/Yz+ZCKbuBzg2bmT/NXGsNAK4iUhwKLWluJblIWizYgUz1hzZi9Ds+8U6OM+PvRmHfXk191zZoCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406874; c=relaxed/simple;
	bh=5qSEGoSFEbZ9Aw2s104tTg8FW55x+SU2f7LQRnzdTp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jF83luhdJMz8reCVmded3uEQ+qwPEUYpxmswPC4OFHLsT1E7m23Ej6zz5ZtlX+b1/D9RUhhBeDFaaCoBhVerWBrtvu/Sl/aZ7J6Qhz0LNV/j9zqJ8aYtwMxxqG4xJUoNqS4utu0AKwncwj3sP58VU2z8wBskRXSSX8ZZHwGfiDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EkLyTgPA; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EkLyTgPA"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2eadb000b8cso3156672eec.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406869; x=1778011669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=EkLyTgPAJVV8g7Dhrp0Xta6ycX7glzqwHLsIyM6rYiAoTSnxQkf84NcjPg1g8ZAYGB
         02u+JNwGAhNaeLrHDLXiCx4LKuKoEMGzXKh2lkj9FS0A2Xbb2HcuWWJVt0ROLOzGswlr
         DF24gepVJO8mgt5r7T8MULcNYgs65wQMv1h94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406869; x=1778011669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=BTn3gZZsUmpptv9j4K1npgn+sxAoUYaosdDDWECU92Lgl5Bcaweja6FTTbHE3qLYlL
         K1XPh0mSz12Zc4p9DEF1FctxvCbXH6aLx8CRee7iU5cisAcbPvknujSrG3Ot8yC62/rZ
         k7eKc3sIMsjqQedly6r2HpquhF/A6ehAOqSmlfbINs0y+doM5wwoSw7ZOMs7XTlHBvM4
         kJztGqaSNCTZW2HLk7VLgjvApCZLa8ERec4wBV54hmrXhMl7JY+rwQjg0gOSLXpqjqMH
         dTrNmuP2je3Rdg6nIu1I3UTCIgOTc4/y7ltlNPmFE6drcAEAX5pQq/Oq1WYg+B+nknEi
         L1TQ==
X-Gm-Message-State: AOJu0YyV1USs/838CAN6QBRYc+vrhxb5KCCxQTP4UO5IV5wgxZGSS2p5
	D6wputmy11ZKL7tTWCN5gr+XnIUYJayB9lm0XUZBSFu4AuDJLXD5hBW/UggFaRzDVg==
X-Gm-Gg: AeBDietDWmzEgjE3Cjd1klYr3SIzYliMqH2G806Z3EPa8y2ODzoc5xtGo2bZv6OuYaU
	qxLsW3epw8PzVihaoiIvYho3tem8CbFZzBWn4X1qpau6v8wSuylEThQjIWQw8zxpjtmjxc7j1mb
	5pkZvA9uJWMG4B1CS0AhJ42b55SNTo6kS+/EO+Sl1rxoEbMaF5YVZNub2YP7nbsOauNrH3oqV1y
	XiQvkFIrmHtZ2VIbyDtrvtHtVFb9JmiC4oJw8u0lyJGPXczC1dLWKht2hMKHGYJvQYGGxRckDlF
	AR2MlHWPCQLaBj9xsda/AhBNnlabcUZCUyNF99Ri7ya3K7Q6L80tLLshH0ANsjcdCCwiE68LDSr
	iWaK7Vaf9FnQUozQTC8ltU53o5XgaiHxSJCT5BW5XEz22JBgtyswXSi3ZqoQuaUSopmcoy5lSrZ
	fy41aok1XKjAQvIr9P3tAN+Qdc3iDFtB/7j4DrhBFh++ZVE7Gue3FRoPqhS6bVkTwDeSeOPPKx
X-Received: by 2002:a05:7300:7255:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2ed1991b2a9mr467588eec.33.1777406869213;
        Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a0ce761sm3064459eec.15.2026.04.28.13.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:48 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:58 -0700
Message-ID: <20260428200712.2660635-7-briannorris@chromium.org>
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

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 683ac124523b..1f5222d43e62 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f0b8c2c80aa5..a6d31650245d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
-- 
2.54.0.545.g6539524ca2-goog

