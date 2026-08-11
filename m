Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FDD4457AE
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450878; cv=none; b=K70GWVkikgxhifpVVsJaWk+wOBCNpE1hRDSiVF7z06pWIpWSqxjBsKtwKtA/V5mS12llGus3faGvwLdbt4h1I0brSg0QPvpT3RL6MK0iEZIP9DLuIwn4CydMFK3NxqFlEZZnPi0NdX5lWvaqcSgVGv+GtsLIcXlv1G0hfLtRLJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450878; c=relaxed/simple;
	bh=zw9K5bulR5RCbQzcch5UFQFm1ClqUI2Eu5cBqRJdZYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGALX0YA8Nx+ySTZYY9Kx4b4VLKL1l711nTs4SultSU2rkxQt/V1TxPJkSMYiPen6wgUq8EG1jbbby82LIze13G5Ck1e1BKPLfZ89VgglhOgsguvo3f23vTrQyDKjtn2fUpn/jNNBzECbLEtjHvuTfJ9SZHd0kr/UO910t3vOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R55gbYpG; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R55gbYpG"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca957432c7fso2911611a12.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450876; x=1787055676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=;
        b=R55gbYpGy9ivCS9D6o20yhuvitL8znHDWJg9vGlJX7pc61gdH+juU7lECmzUNwxalZ
         X7ngyHVEG78QYf/gDywHghwSBg6snPASWUBoMkrYSh01D7Hv5ar7wcoKThZtwcVMNCeN
         WCOuw0GFCnRP/BYWSrGlNbLUfBiebsCV63CsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450876; x=1787055676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=;
        b=m0h/vEXQxLLzL0KHcy+U6wsT+Zww7Ljmosztl3WV3YHHND6ThG+jv7gICpHs1EW17e
         62CgGSovQOcTLixZleTsdYXjtDdHkE5uAYNwKbV40apojiHoQC3+TYKDozhYAflA+ZKB
         6bALn+EQpksNpeQ6niKnFCECmZjKyS8IRDY0Qt/YCI7rci8turLsa6B1dfxguwkLeSO5
         79SWADUibuMZfo7+i8JJJQwRMe2y4EhMvbSujxivUqcQ24IoA5Wzx/MxA11s+RuhBYuV
         Qzy9dAURLbIWlehBRmdO6TwUsmKVgOmStX+l+w2GXSDYAgIVylPCeuM1Lyq5CR4xhhCP
         CI5w==
X-Forwarded-Encrypted: i=1; AHgh+RoQjM8IzFnGVjVw5EaLwbNzYn+BRByHfzOLxUmihk49aFoTAM/51tIBu6E9MTyhTQ9o5yollV+ZPirl@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRJphAN0sq7uWkTJdJ1w4MMHzGbjUt7VSKpnLtct15rVf33vW
	aChXZL2zYVGzQBWHPG0Uw4EHMWf7ZeVtDqzJ79sEo5inMElv8T5C5qt0Y9y7IZdbrg==
X-Gm-Gg: AR+sD13QYXViUK/OI0AASU7nNVZa+Q1casXUS4UWPMd9RhxuZjUApMrmWJMatjeBiKY
	ffpE+IK9x1/bq0+z3gjpvEnUNvOTf0v2vzQ2LcXp2tn7EpyNYuIDiWOJOgkhhd0s8I9i3kFYHhO
	bM7O80CG1IrfU0tkonPHmFa0+6T667e2X06Ll4NL+yknhfF5l0zLsv+QgKrMCNPFj1pisSAN4Re
	o18UlooUnXdT5v2EYtPVInG775cITcRjEyga6f9A7al2BkhlHtDIZpJWx1AaJAoo6rktUUC05X1
	vzJfBbNHdaqiZSsd3j7N68dWMnE/b4NSEHZ1SmWHdkzg0tn4WANuJG3PY17OMuu8He85IFbXX8S
	IqHpdKlaBd55al6hgyoGU8x2OUmBrMa3fQGtYuoeiOJ0ra27fsBtOV/NCzJKG6PNivsGaedCmih
	fMFvIGdgiROAyU2geATYgoeNEl3nzzF+A/p203ao7qT9W86MBYhhlYZU7QU4T3E0gQ4Ns+E8ZE+
	3ILzT3yvD/RXDF337UoF5LOZ1cieU4vadcUUsm8NFMjOQ==
X-Received: by 2002:a05:6a00:234a:b0:84e:915:d7eb with SMTP id d2e1a72fcca58-84fa8889f0amr2532844b3a.37.1786450876479;
        Tue, 11 Aug 2026 05:21:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v4 9/9] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 11 Aug 2026 20:20:09 +0800
Message-ID: <20260811122011.3539250-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.679.g6767b8d81c-goog

