Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8033F0743
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254044; cv=none; b=iFcFBdVEqwBdi+6tjU0RYaWFRRKpE1DPtkadIKg1WKuR2lJfFHTdAi8HdMMUnFlWhBvUKE9sRuAFY6zlGEhlQqIcz7gAkn+XtRo7o8WMgrFFxYqtj+QkNgW50lpO8rf09mTN6awQFV4JVzO/fzHt63tNgsbPPfsH15/gM//AcBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254044; c=relaxed/simple;
	bh=ow2Pp8Yde2ialN0PVZ+ngSDDkSxMoIzeQ2w8Qc4ooeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1b6/pgk/YopdhSfb6pgUqbGfLDwVNg9/pDyLEODTzqTmInhTcIcnmHak+9TPWB6B9wFK/W1b/IlZPJYhwEtB7qadFJTalhhZWzeTn1tjwQQsATzEgSd+fK5CD2ckaOscSQpWOjBXtjL2C3CrVyCzqQZqZX7UFittH2mDDjcSzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDkIVrsn; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDkIVrsn"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so2331432eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778254041; x=1778858841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=tDkIVrsnhlC7EorEIlVCrt2Bj1tvrpK9AYiS8oRhGDKhQf264ZOJdcMy5paepFISve
         tUaYCn33hCGyi6kVf+A43yljTjDAXyRx99lijdNFavSpKu4ThITeNK0Ixz7oTv0ENsRG
         nU2V1iWdZh6k7mMaTVCsELW0rI5x3eei1Nu5haQkaLHDUahKGdWL5tkLudoGOQ00LMPd
         k/OxJLUgd9hubSTILqi4Q4Li11fpRaanKGr2Ldlbup5MeV8r1Z5x0sHKgjE88pk3nFE/
         FXJ+AZmbwXywIolQNeEguHq75lxwW2fg+FW7xIj33yGhuo+7W7Di4jNXyoGmCuRO8+gu
         +Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778254041; x=1778858841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=nE1naxq/zf2xLBYUcEEeUdMQYFM21tJqtWS7ElJNpoi3SayRXOcGmcJLhXDOWosxje
         VVaEGIaODltsllsIeCFn/eyVKyjZ59l4tItlPtQ7+jOiq8UTJJc7sLjAiGXyyJPYW7lL
         pomJuAYi1xaC/vUsUo201B0VW2MdSuuYCGT0qBP4iW+wAf7xcH1ZlUpBFdhiHiH3FMnH
         HVDrfZIAJxjMBnMN1NRaCFQcnuxFSb2IhmZBb/4lYL2b9BXNGBdy7HGKAKAh2H/lK4Ak
         WBGQ7x4t0XZCDAk0uNG+7J7EMLTKi6nYETxQNzH0b1D4PAXnDnB0dBfMR5yO63HDWYzD
         9NoA==
X-Forwarded-Encrypted: i=1; AFNElJ9w0pFTT6JGkgjI9bTw/di90bnclnv7xUW0a9851QVdNxbEgV8eM8m33NsStI/X76XyiXp1WltKETsv@vger.kernel.org
X-Gm-Message-State: AOJu0YzkTyguTss+fEwxwLHKBwi8+t4Qr5LPTJtqcAqc48bQXFwdXhnZ
	vZbToTKkenIDpkBggirStdhribGJzZ4T+7WHzlthepitmgzi/1oDUnPs
X-Gm-Gg: Acq92OGvvYsmed+jgh2EvYxpfFkzcSdGGy3xHiTgQJhCB5i2VC9WFjKaJ5tTx373tkU
	vvuMyCC6BBtI3R+V+b0jqI4g8WtE0WqliCzPQjKMDqtshrVj5dC9iLPN51K1Z0IREDgIYg5QO+0
	ZuPdd74rrIPfLpzT9X0LrTzzyO5FQBgeDwYN65K/97AP8OSNhW5teU3PSauU3s02bV0HU3P9ug5
	BBv53nuCGs/INKUJe83oHEl1pNu5YpkmVWubrcL5M19Jt0l7F+xCpHOmaXDOzSfbimDlGvs3WTx
	K+lWHigaRfl0WyqM+o9LAodDPnaL2VgOBgtoUFu4XBgyNbWgQ+LOxufzJEwdps29UPlnu/ytOS8
	VTjRpT5VbADFe/V6Z00GRCeBX8zwtSRw5neNHRrjjnCvZbA3P7V0gPXASMSLQvIIYMWlcZbJymA
	dKFk1iP56IUHODyhW6UtwdWpc0ZmhdMk7tFEXdLnjROQ1Kg7M=
X-Received: by 2002:a05:7300:434f:b0:2d1:299f:521a with SMTP id 5a478bee46e88-2f54a38cc95mr7218915eec.26.1778254041341;
        Fri, 08 May 2026 08:27:21 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:27:21 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown GPIO polarity
Date: Fri,  8 May 2026 23:24:22 +0800
Message-ID: <20260508152435.21389-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The is31fl3199 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf

Fixes: 737929191283 ("arm64: dts: marvell: add Globalscale MOCHAbin")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
index 6bdc4f1e6939..cf690a85cc2a 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
@@ -236,7 +236,7 @@ leds@64 {
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&is31_sdb_pins>;
-		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_LOW>;
 		reg = <0x64>;
 
 		led1_red: led@1 {
-- 
2.54.0

