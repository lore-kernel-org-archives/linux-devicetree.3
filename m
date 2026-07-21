Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD16419FDA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616096; cv=none; b=Vzkds1WgfZLQkPTxq/X29TV9Y4aeoFqUUu9v/Qup+lNDWq2KBwQOpzB4WPLAYoRo5AeWItydHCag/7XNpcj5jN2C0y2BA8vlL/YFzDXfknSdwMNTgJegbVo6pI61y0rh5EJrBPEtCK/eEitDg5z++/aA/XyAwP9ifHOIQzEyon8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616096; c=relaxed/simple;
	bh=YA4t/FQ4Wsu7AcE6Lw32+kLJsSTSk39Et8195aKjZpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRiQ7Zg0claTTg7XMInyDq9/KEiURgKsXAmNuwfC9BojPRY9wV4k0bfYymI7b7WDp+8qp9OCt0sUb0QFq6KqFggRwXW6IvRggnZWiUUdZ2gB90vLxvbbrvmIjG6Q012cfVA/NuutrrRJAqD20ka3LCNzPflB/xMfQldyvQSgxE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMB+JZvH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMB+JZvH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49552f516beso992985e9.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616093; x=1785220893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxBcoaYqqWn7DDfCE+l3ErfQKRET5iv1Y4ILak6MpwQ=;
        b=fMB+JZvHQlmDCFJsuDxpEZovCxbEogIqc6CLwtb/zwyg1IwLktD099wczHkODxeeaL
         YyFMJ8sFnotIguDqz4KimdSEPpVG4/10SW4x6Wd4R9nLxoUQwORcMx4FkGTYc6i32DXB
         siK3YUluyKNrYQl3gMLJzsUwz3pX7Hjs/YSq4Kt+vrW8hpdKYpMgh5dZMZjdffDMWNja
         JP0KBOBHjyqIWIJoMcF94sLanW959hvRHQUJKuhyUfnR8Xir1wYIzKjZcchn/SIMN/Pe
         X6xAtDr4vIEto6v6T7PC+m2Gmp/oqhN/RylmnNQ+1W98w6OaqzzgH1bew909q4b2eEft
         LC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616093; x=1785220893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxBcoaYqqWn7DDfCE+l3ErfQKRET5iv1Y4ILak6MpwQ=;
        b=WfWmS9XPdgmtwPJ/ui50/qw9FJmmoO5IULfR+HnzqN82OlEI1NIGo1rC3f19u2FIOx
         UY7Om0L6zKPfve0JK6/Kta8G3RLy37KAih1AP9EyDKMxgj9L3CeQoDr5oCqhH/cNDDcm
         7eVcNQ8K8kuTvpTkf8IcK7DrbwX5SWUEmub5oj5LzLL9HDG+3JLjX05l2I4MCY5ZPSel
         JwzmECtW2n5TGfiD5cAvCxyBfLSShsk+EAezk6k4bzl9IHl/XxfpukU1jyS07xftXwuq
         svewLXVzu1c1RKD7H4gcbAx7a0eoAdnqAnjkVka1mQHZjARsWRSlF4LJGAhJgjHMYAeS
         YcXg==
X-Forwarded-Encrypted: i=1; AHgh+Rrc6Ns4O1AWUHT0/2sDAjJ65/LFGt6jwSMNdB/ITVFKyPHwJSvhW+M0b25MDApA/K+VgaL5zR5VTW86@vger.kernel.org
X-Gm-Message-State: AOJu0YwQNSPNLeTnUql9wCa/wVRtC4yt86i+s/jW1moKLbBZaRCIsDIx
	bJsPejommCXdI7qwYcePK4OK1F6Vsmq/4kF2M7h3ixoNNzGGnjKGaYCr
X-Gm-Gg: AfdE7clVmw47vEOqSTXo6HSaPsMxymPv9whDDkCWKtq29fF0i0ZJeU/QrWa0i84OmQx
	NUr0PO5ljpnwrOUZBr8OzxP4m7r07ZyIFzuD5WN+6uMETVVOcyMIgfWYCK3P0S9GlEBal8sjhJM
	rsxSLs+/43OBEygWOxogjqIsshpVw0U2y9fnsjVnkyNBAEC74V7bxuxznSNnoLY0Rn+lS7gPCnV
	TQbp2OfHB5FlRHhvp18QMs5R9mbeJ83WUtIiRUy1joJAbmFri3Ylid7+1yj2NJnbzHJcCZiINvj
	7k3PQ6/0x+omyGJPNK7BQ7Tv1uOyTfUL6KibHS7WRl6K/SQ9fJqTLtCztgdSE5YSO+AVivB3BcW
	98uH9RN8m3VhHl/bO1qncGbvH/eo6yLcItKBw3Z0xo9oVnzhm6xUvLaJRKlWc3IWnD45QNWAOhi
	Fw+8qnMxVW/20fXjMWlQ6NerU2y6dsswcpMmJ3MlEbLv3eunTvTDirhaLSWtXXwJsN4GMSkCvMU
	b4hDD4+Vc0=
X-Received: by 2002:a05:600c:4584:b0:495:6713:9a62 with SMTP id 5b1f17b1804b1-49567139f63mr6189235e9.1.1784616092535;
        Mon, 20 Jul 2026 23:41:32 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:32 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v4 3/4] arm64: dts: rockchip: add HDMI RX audio on RK3588
Date: Tue, 21 Jul 2026 08:41:14 +0200
Message-ID: <20260721064115.64809-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synopsys HDMI RX controller exposes two digital audio interfaces,
one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
property so audio cards can reference them as a codec, as documented
by the snps,dw-hdmi-rx binding.

Add a shared simple-audio-card routing the receiver I2S DAI to
i2s7_8ch, the receive-only I2S interface dedicated to HDMI RX, with
the receiver as bitclock and frame master. The card is named
"RK3588 HDMI-IN", which is what users see in alsamixer and what ALSA
UCM matches on. It mirrors the existing HDMI TX sound cards in this
file and is disabled by default, since not every RK3588 board routes
HDMI RX audio; boards that do only need to flip its status.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v4 (both suggested by Sebastian Reichel):
- define the whole sound card here as a shared, disabled-by-default
  node mirroring the HDMI TX cards, instead of per board
- name the card "RK3588 HDMI-IN": the name is user-visible in
  alsamixer and matched by ALSA UCM

New in v3 (as "add #sound-dai-cells to the RK3588 HDMI receiver").
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index a264001..e0dce15 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -23,6 +23,23 @@
 		};
 	};
 
+	hdmi_receiver_sound: hdmi-receiver-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "RK3588 HDMI-IN";
+		simple-audio-card,bitclock-master = <&hdmiin_codec>;
+		simple-audio-card,frame-master = <&hdmiin_codec>;
+		status = "disabled";
+
+		hdmiin_codec: simple-audio-card,codec {
+			sound-dai = <&hdmi_receiver 0>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s7_8ch>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -338,6 +355,7 @@
 		reset-names = "axi", "apb", "ref", "biu";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vo1-grf = <&vo1_grf>;
+		#sound-dai-cells = <1>;
 		status = "disabled";
 	};
 
-- 
2.53.0

