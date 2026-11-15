Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762214;
	b=oMCqEaJ5L1mFMw3XQWgMXkAPzGtv1dPPQ67PotfVYoSOC6oq5r/dOr3VnZoaVseIrBbW
	 33Xd7J1Qyofb2jhZ/bdK4f8VWynEhpaHylYGyy40IXaUy1U1S1HV+2voYxen3JOvsTpf0
	 dPguU8WweeYkfXkbEJ+85FD7oI2bggcSimE73fvrrSUJOadEcQO/a8uQ3LAeualHgittp
	 xuFzAb9TzjX9vNeLZt6rBe90CP8n+cdxehpC/a304EpoZffWu5ItWsPRkNCtMNGA21YTc
	 bRl6zN1DbTNxm0SvreCBc3+QlcdxzGQ/pS7FhIc1XNql02J85LmF4QmBBAvdB3WZ2Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
	b=G9rWtkIU0FT0eSUQhlbZ4ZsBobmc9VgvsyXYJXIWFyoeDEmBcVsyM2NrObO8lwLqgd3u
	 1H6FWlvvT31GwP3084rbTww8aF2GQskpTyd7Ea93+5RvWR5x34DBlZGmMrCvHvcUVhOOS
	 64FGHFCEOgB9vP6/6DQk71uglL7o+C5fFdhwij62ystQnoj2WGRigkFdyRNdE5aA63UfC
	 +JcSfarZXoD3brV8NJolu6lMXpXVjlv2YCWwh3N5DJRYErT12h/7G1Q/y3ULFUdmjyv9h
	 bGM8/ngcq4T/7IX1Z2mZ/viyzJCO6Mu45Y4hU1M9NLKJAOEx05EwcETCwUxNVm5P0iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oizgNY78;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9DD606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9DD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oizgNY78
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso2419946f8f.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762212; x=1795367012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
        b=oizgNY7878BwZm+U0h8sOob1guY49n3RVB20KSYj6dPXqJeRJhR85uClzRcy/tUzHT
         62VT5nnjIDJCzdzBXr7OSH9uW73hbIO8EVB75KACSc0LUskYIj875+ge2p9zIwv/LXjl
         ctKNiECx7OT9g3XWyAPFuqGtVHsi6l9QrPH9VzWXTWfPl82WGfbEEuuKb/26eolgztc8
         5hpmi6DWajktt/YcA404YIG407FWzsGF40yKopYuVr1GGOn0LV/YbxA9rZHdNsrrxzvW
         b88hl9z0JXGFXzzjf9zEhsfaoqsV5aBHJGMh5vuNnGh7PlLl7Qb0mgrVXuh4k/207lhW
         pR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762212; x=1795367012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
        b=0VzMJW70TdmpMTiFcpdTgXj0WPPUrfSxGmhngf46tTJXCerYlCAQc5Y67MCpJlCChn
         eT8YsbiZhDQMCmJs//SYiOHtbwccIeYx1/J2TXfwnCNlvkBTKEkUoTIQAT9VvtPMgMLX
         hYPL+0eZyFSkL302FllUFVtLNXYuQln2mDBU1Ncp/HrKqyN7++cP2t4qEYRV+7c9Nd/B
         C719QT8to5o9jz6wnQ4VDmmaRZ7D12qXhluOxAu6GGGpC5GXuuy8Q0Dc5wpW+8h5ReIT
         aCRsGFjoG2qBgBKXJwta1G8jWDQqAVz/kZQ7WnL3In9Nw81Ak80gniD1QM1Wb3yGNeE/
         9G6Q==
X-Gm-Message-State: APuU4Z88MIqIX+v+zB+ljTqnxg5FGm2WqUpQ77hZi6plPJO5nzAr4Kvl
	v8i1obMb6+bwBsuOtBLqWoWHxq2VoW6//ZpT+C7nompEFOZKh/qkvMez
X-Gm-Gg: AYBFou00QzVuKsVLjYaK/3YIX2sUmJqqKuH8IhX5WR84TzBjX7YEreyl26X8xmwwp24
	bUukC5gx0gP9XimsYF3zrwg2wRqZ0LzJrBH1Fn1RGaonKYTQnnvJYyCFFMEONV73qI4aOpS7WO0
	uB+EcunBsFubaQCr6punppowgnkvJ3TzlnWtMvP7qEI7eKl3ZeAXbqc+cAjBvgX16ynQ+e/jQHO
	/lSzdGfu/Vl2Xc93tdkyloMsogNe39yD16fl7MLXC3yi9LvRgRRt7CJmVcLhvtckG3M3DkJ5wgt
	LJ1XyqCJuUxh7ua//Cgcr7LEC7B7CXMqI8EdriDmbY1t32ov2Dv9HPpnHvfJxBHx3NJ6YgGRMfY
	TY66WXSsV0m6GJQaluq+3QSRozjEzI72mLGMt3VN2iY3EkGDLHNQ9Fw5zywZ14xdxce8msyfd7H
	8sXap8lvt6h8R0/APibmzeTRmudqKkyyenyAP75g8DF7GluWqrWJfVEslvdJUfafe72q8Te+iK6
	vUyox6joR+e/q1z841FWeZyRAEWaaQftxFEnI/8ftCYE74fpfKVY4i6LYWyCMcR2GWo5M6tNGaq
	k7VnLwHlicDsBLED1TCKNab3mNs44n4xi1oSPCwT5rtKub7mPixa7tKKuj3Fs6fWFTudQXM23J0
	AxjUENLfeHUVsUwQx/oF32K2AyAT9zpjx2Q3wSbq/2CndIuvIOAbSJHzIf28N7CSd0ww97ABaOE
	WcxqwEOJRCLiWOufQj3CU2UbHLWGwY+OwPz7GzyHbC8I0shJq+8vr24hCxL/6wj77c6sg7E4FVQ
	vSL5/hhHx9eqMvhwNTNsiZkMazntzi0z8w=
X-Received: by 2002:a05:6000:2084:b0:498:be72:6371 with SMTP id ffacd0b85a97d-49c713aa624mr18863165f8f.21.1794762211674;
        Sun, 15 Nov 2026 09:03:31 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm16719512f8f.18.2026.11.15.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:03:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h6: orangepi: Raise CPU regulator max voltage
Date: Sun, 15 Nov 2026 18:03:28 +0100
Message-ID: <20261115170328.34338-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdd-cpu regulator on the Orange Pi One Plus and Lite2 is limited to
1.08 V, so the OPP core drops all CPU OPPs that need more. Depending on
the speed bin, that caps the CPU at 1488 or 1704 MHz instead of
1800 MHz.

The limit dates back to the initial board support and isn't a hardware
constraint. Raise it to 1.16 V, the highest voltage in the H6 CPU OPP
table, as was done on the Orange Pi 3 and Pine H64 when they gained
CPU DVFS. The actual voltage still comes from the OPP for the chip's
speed bin.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index a2a2e4cb0256..57b137755227 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -207,7 +207,7 @@ reg_cldo3: cldo3 {
 			reg_dcdca: dcdca {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
-				regulator-max-microvolt = <1080000>;
+				regulator-max-microvolt = <1160000>;
 				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-cpu";
 			};

base-commit: c3b0d2bd3ba62c39c131e80d940cabbb8441bbf2
-- 
2.43.0

