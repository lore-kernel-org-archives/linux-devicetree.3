Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA939E167
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624356; cv=none; b=Z/FgKYGguIvKqafOui1Qa3AHqPGU+vpBVJWSyvjYi/bxgMoUB5qnTmog7DgzS++z1lxN7iwhBHnFAit3s0AtsYvwd190rHI6xMU27c1uPH7UbZBo4i0PvAsrsVs+sKPyvJ50dY5B2KH7/G0ETBDdmMK30Vn5Ex/FvyWW6KdhEPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624356; c=relaxed/simple;
	bh=7P166A8vdKpbCTvjwJ0c7DTCaR8r6ukvy1kUs71vwQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8LP8X4VNqOlRk+L/OwTbXW1fH8pCeMtolFcvRRH+ftooJdKk1FDGmVUBQd8ne+TFNpdQL83NoVPlnYqGcF2tseakOWFRAyFPwT19iowwXJ7aDKvWMa3wi7G4HQkU18FNp+N8qFlQi3gACCph2CLI/K4ieRuOBWB3CE2NpMfpaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fbfg3b4f; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fbfg3b4f"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-479f7e75a6bso2483278b6e.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778624353; x=1779229153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=Fbfg3b4f7XmrwZB5r2LLGY1pyQAwbg/VDc2bdkYDTOrOzsW9jAreqX1nnVLXMZ/rFl
         rfvuAx72VgjFOuR6pJGPhjmgrxCroX4Ph7FOVvDMhyHp2CwqJDQwI1RI54E/m1ouTy6n
         NxuMmXHpg9uQQL3UGpfbFWU279W89pU1rdC4NbMTmwQVF8y3ZMbiSUqR0f71k1IXvW9e
         gfFGIMe6G5km43f2d2Ruh44bibd0AsmlLASVT4copBCxFeplwhIMOgrzM8m3QaRXlVLi
         wH9Qae/mxFcyJNDFRbexCE8A1oDzHcqnHTUSv7esHDBS+T70+1A5aWWAsE5uw7GUuBlz
         Vjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778624353; x=1779229153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNoA18UrHfHWWifSIaqhsuJYv6mLpyyKyk6HN99Blw8=;
        b=moa6G/ItF6XMfU4RDsoHP6uN+MUZSUZPr89wX/LqyO1J/NYf+Xo6OZbJ7FdSjecQsz
         Bxlg7a71JMzuDvhN1wn+hVH70dtThskwal/o0pUzdGfs1+m7uzpSahw105kS9ASFPexB
         Kmq+Zi0HWFX350A9EUYc2B9hNQZy+xGxdfx9959k7nFwDKe8DSolOLa595iirwEcg0Eh
         kJNlNDMIGbrOfQ4Z8+5ZDgCdV5x4o8w/umRfJZzG4JFVx9LtQwh+JPT0W8a4Cp/ODywG
         3ZuKhKJo91hC+jqg8AkdVmcM1zl3Pnnz73dqo9D/P8SfxQNsGOplZqK+riWRaJhC1PGQ
         Y6QA==
X-Forwarded-Encrypted: i=1; AFNElJ+2J+wib7My9k9voTPkCjZhg0LhKVIUzPE+R4gyU2+H47DgG671fzGp+mFnUGsWoFwV0Y5H8Xtr4c8N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6d4+/t9n0QzUY8hdxWuayJjPkVD86qFkb+7GX1Ds66U2etYdd
	BrvAmWrT/nqBAZnp8BzsLMd8QSD1gTJKKGdTy4iROPhrZlFQ5jFMrPqQ
X-Gm-Gg: Acq92OGfnwrMPSy2Ek0SFb6hsK8HzBupyKSBaCvkY9KSMjISbh+SXiZ+Yn7seLnFg8+
	+3TQJs2KV7dz1nvG/IUKwhR7vka2jHU1+dydqtm79jF/pTuIUlmeCl7RqNuF+HW7yaB6ZUFI04w
	ZRgws5GgnroFM8WLoShLp3W5pxfqvYZ5kLtVTgI3I4ylXxEM1390OTquQsMn0PWOFcx3CQ3Q9AH
	VjCeABQgrK5wLGKcQ+3d5E/vlJda/6ENy3xn3lkfsUxLSzFK7GbN4mimreS8yS/3wowY24I24xy
	9XBkS3E7gUStf49WzPJusy0iuu1sx5Nbvinf6aqYbQGfqpM9fMAxlpA35ccdg8Y370EgbIVdxJQ
	k/B2PqPSTMrq2EmHfMdvzPnX4n6zMecqhS0zGIDxetMrEvo2G9An/HPYL/bfqb6+dTvcCA2l+xA
	L0jBWcbXAaZwA8u/4Ghd2u
X-Received: by 2002:a05:6808:1c0e:b0:47c:3f6f:db97 with SMTP id 5614622812f47-482b2b8a364mr584683b6e.21.1778624353379;
        Tue, 12 May 2026 15:19:13 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76986f87sm23291473b6e.13.2026.05.12.15.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:19:12 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V6 11/11] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Tue, 12 May 2026 17:16:32 -0500
Message-ID: <20260512221634.256747-12-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512221634.256747-1-macroalpha82@gmail.com>
References: <20260512221634.256747-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Invensense ICM42607P IMU for the Anbernic RG-DS. Mount-matrix
was tested with iio-sensor-proxy and reports correct orientation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
index 8d906ab02c5f..875ca884deca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -871,7 +871,18 @@ aw87391_pa_r: audio-codec@5b {
 		sound-name-prefix = "Right Amp";
 	};
 
-	/* invensense,icm42607p at 0x68 */
+	icm42607p: imu@68 {
+		compatible = "invensense,icm42607p";
+		reg = <0x68>;
+		interrupt-names = "INT1";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD6 IRQ_TYPE_EDGE_FALLING>;
+		mount-matrix = "-1", "0", "0",
+			       "0", "1", "0",
+			       "0", "0", "-1";
+		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c3 {
@@ -932,6 +943,13 @@ &i2s1_8ch {
 };
 
 &pinctrl {
+	accel {
+		accel_irq: accel-irq {
+			rockchip,pins =
+				<0 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	gpio-keys {
 		vol_keys_l: vol-keys_l {
 			rockchip,pins =
-- 
2.43.0

