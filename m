Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC983D5225
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406876; cv=none; b=Z+kKE/uW4r2DsvieGWNy9cRb5NCjmJt7sEdcmGdWQaAD6WkeUEZJU7N/1bfQENsjWU2f5LZGKxH6M1YmWm0Ig8ATgC/mgpv9T0tVcG89PCUyVWJ6fENIz339F2H5GbXma6O5G0as6cbiEDZagN9+A9VLbJaT8CMdY6aqV4CVSM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406876; c=relaxed/simple;
	bh=U4+LflP710DVR4kB1UOr2zgqsKpE/7u4FQUoCfyFE04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFIv9mxO/aE/+pbzCO+CMs55ykiT0TTmSYeldkFfEdt5xJc05NcxrtcJDhtwPmwORB0R6lWhcuS37zcPijnGcPZ84/ZmQd+qIZptu6BugtXPl/cnn11nVvJbH1kTIUrLP2bsByLmftOBMArCwS59xVGIhat7SpFQ1V1IhqKP1SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dGM3kAzT; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dGM3kAzT"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12dcdcd54adso2004886c88.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406873; x=1778011673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK+EAT4GmZMdYdv/TPcw5cMAUzBnAuCqdYs+Qlpxwc0=;
        b=dGM3kAzTdCwfpk8x/dsiLIULQBN0/rsvWnK9tWm5qb+YMetfKHeARagEVQClBucyDT
         kxCxr1k0k8XFmT0pIXfH6zW13/lEGH1P4tpAgZkK1wk4qJ08LvN2M7ZL5PjJizcRZHHJ
         Lq+JcbuWLeRAV11E7Qu3muOuMKTPmIhmwHgw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406873; x=1778011673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gK+EAT4GmZMdYdv/TPcw5cMAUzBnAuCqdYs+Qlpxwc0=;
        b=R6/Ul58DlGGgSlh56USNSkDHoRkZamA48kn7almzWfiVI+qWZiemql5CFVybVdDCBr
         wFUuGe5Zy3xffr9oaDSLhBcWZ+l8fJiyuY8WdOMaJ6L1LkCh2/JCl2Dac3I3E4sSVEja
         ZWJDykfXQ5h6uLh43SmmVTPUFn9zjL8kyasTJDx4+4PRdOrglfmpVFnd/4xHiLUw4y7A
         4SVfeYnQEemF3hghZHl61Yc5a5wiH680dzTnQjnvOdRQ5NmpOMPP4duaotiWo1tpqnjQ
         97aR2kfB3KfC9Z7nHmTajoawXiyEri0VkxXt/XRLPkBQU2NEZJq7vORbWMmT6khhrlTz
         mi9A==
X-Gm-Message-State: AOJu0YwbF9wKpGh2mwqoRctKhdSERbW4BhURG11mzEfoHGc+KM0cdVRo
	hdeIdIscIaEUQvknsjua4Qhvq5A2emAlmQuEuRp/AEBcIUzWqL6zjh8F9eWKu8iGfQ==
X-Gm-Gg: AeBDievtyimtP7Y/jHWx1KF0iyr6G7eTxgmR0hwB4j8CQ4d6O6hPC+hEXgZtMwa47D7
	m1GSYgQKKcLbPHozfJ3eUhZRuxhv7XZf3CxIW0nqpxW44rfFAu3Tb5H9gAaFlKr9scO3nw8Kh2W
	oyy0ybWV4Ik/VxSX2ZeGOMl6SZY/n2h/skcBs8aqBvaX7REQZ8cgejTG7neQsIjp8DkSQQvHVEX
	mWCOPUqHbu0zoDjiO38TdZPtL96ZXtip8idgdds8g75D78KVdNbKUOteyRBhhDg97I9Fy2ZxS52
	M6x2SxT8qA3p/xg5Ydtx6A+dSRIblfc5NU5kQJdVz9tJ2TnWZMT1oCuUKY9k3d+kjRwVsPIkZu7
	htbpilQlqXSaFbuomNX3SBJlNM6FUQ9I97OyNfRrVIyKIS2HsZlHJVG29ovXpXAaBAJ00NaMa2Q
	3+PHTRPJNETS01xSbAaBAXbiL9ibQ3ZYM+1NKefyIQc5fGmwM4PvblHmCKNVn8h8NEpYsQ5R5p
X-Received: by 2002:a05:7022:b96:b0:128:ccaf:85d5 with SMTP id a92af1059eb24-12ddd959d36mr2219620c88.15.1777406872635;
        Tue, 28 Apr 2026 13:07:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a10678csm3167991eec.24.2026.04.28.13.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:52 -0700 (PDT)
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
Subject: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:59 -0700
Message-ID: <20260428200712.2660635-8-briannorris@chromium.org>
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

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index b398f69917f0..cd4a0e281cf8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -99,6 +99,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	/* FIXED REGULATORS - parents above children */
 
 	/* This is the top level supply and variable voltage */
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 5c5e4f1dd221..58ea0532c0fb 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	/*
 	 * FIXED REGULATORS
 	 *
-- 
2.54.0.545.g6539524ca2-goog

