Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA113CCA02
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406860; cv=none; b=S3tXfHFjdWVuxd5tWDfTo+mT0ovQGDkxpdQv4bC01QOmoXOtuDy0mfvuLGQDig+EZg9tBWimpUvrHKK66lprUasHuHlpqXIinhbFZGM8Xi+dwiDjdgFiABNGZKJtv5erMr92H3xNVX/S7usvADc34E7dohL9yfDYCaHWRcbDPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406860; c=relaxed/simple;
	bh=pccXu/UZ0/UgmYrUTp8RKqR5INDSko9XT3nrfNvRcuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTwjX+4Kp1rVwrjalReDdHoRqCc2yPx5SH9DLJxr4dD817gflglbrxQNec7KgvOCpvstkxnSH7odk8+qoq9/ADnHOIUB+JwRjUT20HMs9nyNpqZxdv1mCtBuwyQaQRtB3hHcc0OHmuP7Jvgfo/8lzdAQUOAFIlVdbh0WFWfrB5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YsZSCazp; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YsZSCazp"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c726f46baso15211948c88.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406858; x=1778011658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=YsZSCazpGJCwN1OHhygeQxjMvJ61gGu+mZ8LXay0+dPCXVw4xGB7j/uyrJVCh97r2D
         FMBgU3xmB49yHnGUh9bDt4ugHcJf1SNdc12w1J3iols17UMOBz1eWS0Vvuf5S8AoTjLW
         74dutQn67ErHSMv126frgLeUagzwt5H7UJ1rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406858; x=1778011658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=PK++bz5mpFxVSu0pq53zynVm1Jbn9F/wS8QWAavw41N/VXbbGmqvrxe7l/vemfJ+FK
         MeTH0MCqRPhkPDf6NhikG7bL62Kf+NBBb83o8h1XS1ko4YKGi01OLsxnkZEBWuiCZXis
         jUG4cgFlC2MoeQqna9baC19x25HhTlui98w2ESgMOC/5Ik5jnCqH6DR88xdLH9kzOCge
         3HL+6F0GrVw8Kakf2zr9jgJ0M8KQNdF3+0YkebomNvy4hUIGrpxayB24WeFQ6S9kU2pM
         5nK6q6XI9nPMGx1qgY0dZihlCtESTeeF32Crp+Vz/98rTfvqcPRj0N082wAbBNN6A6da
         gP2w==
X-Gm-Message-State: AOJu0YykCrSd7PX4SR9+QcO628HN9D2i0irIz+cdvimMe9T9LqvPpfpn
	lUXO6zUK8F5+BJ5Wu702qucPjxKiseR+Ya43uER4K2b9bymDBUAsQ3EtJK67zc7mlA==
X-Gm-Gg: AeBDieunseeVZFm6KYLEmZNW7pHPBHee+OLMKSeZpySnhOaPrkNBbfPi2aQVTi2/08k
	LFo25WpZ7Pa7Ko1BPkcOqbRvd7wRjNJyTYll2VIOlgLMoJBVR29LSPidah/VoGd1+i3HyPo103D
	8B9YXkKwrw9kNJYi/8YusMfgZ9tPzybLF7POH+Jf1ay+s+y51nljJFyHpugFG4kNnIF8BURDWYT
	s2UQ1fZR1l1LzCw4fISpmhGzr6pLEvVyx+GRTf/H+p9IMA1r6B2mUeNeHirnWufGPf+ZgaT/WWg
	Dh2WOyJ9tgJ/9Wd7TlSINHVo0oGsyn0NcfhZjBmzJLU2SL6/EEFK1/6gyWHf0NunRFXoDgd4F1d
	z4uQ/vS6p6yx6qNt5aSN1KvFzMzlOASh899XTrE2hsLDLYh7skX7ccRGrfiPM/UZsHLu1sP3liX
	/ED1cBb+EkwYctWDEJG1rGaYs39T96tcXsjZzsGipr3SpQUr51bywlkT+f/a44/XMve6A4dteo
X-Received: by 2002:a05:701b:2505:b0:12d:e126:b7c7 with SMTP id a92af1059eb24-12de126b941mr735154c88.14.1777406858194;
        Tue, 28 Apr 2026 13:07:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd933044sm2796623c88.5.2026.04.28.13.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:37 -0700 (PDT)
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
Subject: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:55 -0700
Message-ID: <20260428200712.2660635-4-briannorris@chromium.org>
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

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   | 5 +++++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 974c76f007db..89a749cb8933 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -14,6 +14,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	/*
 	 * Note that recent version of the device tree compiler (starting with
 	 * version 1.4.2) warn about this node containing a reg property, but
diff --git a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
index df98dc2a67b8..059ee6c5b13c 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
-- 
2.54.0.545.g6539524ca2-goog

