Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB2224BBF4
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784250476; cv=none; b=oe5lrLFIeTRhbu66WBdiO38u531Ul8DGZWG4CFwF1DIxRmbJVZxs+9ZzRxDn/UtkM/sroi6vpXtcUUYxhhcYX93Xii14dzC12wQw3R441r2r5WEAzYtPmh08rPjLqKL4Q2+aje8sysXh/ELjt8e9WXYYKYeWouhU9FSowTXeOeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784250476; c=relaxed/simple;
	bh=yXTiHRK/iVAsnclv9Nny4HUaJZyVB9UyL4CE26xH5Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1Cpz3usgUtdnyWXbaoRkpb4/WzQ+sDrgfSYvhr1i2Gbwh95oZOSgPUKKTpQ7CLR6B7qBgCJsO0mGoyBkahMxARot0R/gKSqNGRsmH3e0HhicvPZ6Zwqsb40Y9V5Vztfp7Kb3FhxWC1A05WRKZoEMkp0GqcTaMIov8HY4U5UzLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AavmCVz/; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AavmCVz/"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81eaf3709b4so48078467b3.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784250474; x=1784855274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWPYffNjafyuAOVGsfoGgw36TjYG2N8QaPcc9w+7yyQ=;
        b=AavmCVz/87L/QA/rVR6kpQG9m31D8ap1tt66cLEhmZ5hC3IrRCBEN7D9s8pd4sRVQo
         zamgNoS/t1eV+3yToZnrdqcYk7ICVcUJRodZ2hP7J/h7sH8obw64G2qtwx+0mysMbLTo
         m4RgauGeIfRwYScIpUAQSlDwHDQs0cSRwykkgjD/YLLndquG2ViJiFJic2BLTGQ3OgxY
         3WOm3UXU1mtTMR1EPXzk/Os4X8DhM1eyXO5xV9oH5bWVshnaHc6/oR/AiZ19TyPbTn3l
         dKkwZFmSHSrPxHSeg+0BUUffQv7LdrAac6h1VrBusOz+mbJAQfqDVBO4SI5rWugypIPA
         L1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784250474; x=1784855274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWPYffNjafyuAOVGsfoGgw36TjYG2N8QaPcc9w+7yyQ=;
        b=owwYkTLenGxT8jfmUDsf8z3gzMXWFouGhDvkVkqsxNNVevg3l+Wpyk89JzFDWd33mZ
         bMN4N0HL/Vfyal+V8LSl7eEX8YiH6jhQrps7c630W0puabk8MvY83jMoNYz1+rQ7kEfc
         4/0l0ucJMRd99vB3Y5F2MI/qw5nqZn/KF7W1LwZHUa8se9qC48n58UR+Mkz4VYEZe6sv
         Mg9u8Ae+1FaLmr1Lvb7U2qzXba6fYq5xYyXEuLgBpDOGlWLCEd3NDkxu5Fs2Ukj6N7QE
         PcmGj1pwbJ+AEuLEPdipMnysFlWEUnUF3Vp5RjayUxLblFVnmdT3TLYc8gbTDsaNKw3L
         KZJw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3N/lCQJW7d+2tHuwZOfm/qSrud+S70NShLJaG3seJo290s4ekgwCf3nKy3PAHKp7QWRiazeE8zPoH@vger.kernel.org
X-Gm-Message-State: AOJu0YyVh+iA8GUc0MZXEgDrXW2FbPhTUAYWfGK2qBi8vm2SHAJG/H8r
	BP6+/G9WNq35d8+ChGOHyTXZMK1SC7d+6rEOHf9l+6xZ7l9OitVu85BS
X-Gm-Gg: AfdE7clf5n1vQ9Lez9x9WP4Q6GGskaU8Z0+JfZy6L6mcyNca8S8/O+RRx5SpIXpcbHa
	Ffvx0RB9zYscp1xlWhWxiDbjWSp4z3KOFGpeQ+CqjCTVWDla4G8WzIymtNY983FwExlDqFsEfrU
	F6yNOXkZcLwhXLW5OJgzcD8ewLUWxuAVhfvMJVY5hXSbpIYNwYzGX+ycismwDBnBjzKilVgtwwb
	nv05LBUfXOEFx4nbYj7E8/GabU+aBawbyMqZs+g91TmWzC4kGwA0VV7BUTMEP51oAJ6J56BxN2n
	NWYoYqNT5KlkbSC9V2JGA29zkladR/YjsEv+zUofN5lzgFKmnkA4w0Mm/ikwfGuVD8UwNwi0x+N
	PfXyIZ2/LvzbOUHEHc/BmB+XVmVOahlk7qSga6VnVtCoJlw4mKiYMBe1CB0SxQskk13LCjt/7rb
	6F+5daNu0v1sWu5VmTPISGHRdLwkzZk4dUfREqKnLPcyxgVE0=
X-Received: by 2002:a05:690c:6e0a:b0:81e:8d95:3d32 with SMTP id 00721157ae682-81ef26cd37dmr324127b3.9.1784250474013;
        Thu, 16 Jul 2026 18:07:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:a24:e2d1:829c:ccde:e84f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e8f4c5d3csm159095057b3.15.2026.07.16.18.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 18:07:53 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Keep rk3399-roc-pc-plus work LED on
Date: Thu, 16 Jul 2026 22:07:36 -0300
Message-ID: <20260717010736.578419-3-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717010736.578419-1-festevam@gmail.com>
References: <20260717010736.578419-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

The rk3399-roc-pc-plus inherits the work LED heartbeat trigger from
the common rk3399-roc-pc.dtsi.

On the rk3399-roc-pc-plus this LED is the prominent blue front-panel
status LED. Blinking it continuously is distracting for a PC-style
board. The usual default is a steady power/status indication while
the system is running.

Use the default-on trigger for this board instead. This keeps the LED
useful as a simple running indicator and still lets userspace select a
different trigger or turn it off after boot.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index f87bc7b6afc1..7e8039b19be7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -93,6 +93,10 @@ leds {
 	};
 };
 
+&work_led {
+	linux,default-trigger = "default-on";
+};
+
 &fusb0 {
 	vbus-supply = <&vcc_vbus_typec1>;
 };
-- 
2.43.0

