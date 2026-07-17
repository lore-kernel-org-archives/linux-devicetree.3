Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBFD42A158
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306528; cv=none; b=oFrohv9kX6jbdnwvroLEbdQCzUd49Y22rwQogf1GeNob2NsxXPrwAI4GMU1RmhxC1YTekmKwW3wJwNh3sbhOgtnOAHMkkFoldFtO0ZXrtqwAn5gSR0YfMPN7XhqDzmfHbbz0xVh6A6SOiulm6qkC8/3PSene+LiQQFzNple5DIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306528; c=relaxed/simple;
	bh=3f9fi8llMSWN7QxaGs6wFgdfcIwE1sEh+eTmD56RMJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FdRs9Xic2DV+EgR59/JOeWJCv0K/QWJUthEcUF4QIhGnpgz0tOWQVY0clybgfKs0N/nvTFRbIjnSBFjk+tIiU6EH8KaXTG3Get5hhJqNTvLFAZUJx9OeCT+KFqSfU0onLdGpxofSCvd0l00USLtFnKwRtgwfPaFiyXAmTk7nOyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQeGozRQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQeGozRQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15e592da74so991870166b.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306525; x=1784911325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=bQeGozRQo6Gg9e4m48dZ3jUvW6w/Wc6xbLaiLMl1Tqxz2+s/SiZmAv6hsSgzFe78d7
         ibB2JcyHr37VmR37v6+geZJg+WWNyHGdGRxFQ5JwZogFJU0DBU+dFRaBzQNNHrRzyArC
         rpXg1Z02xcik+mCxlXN++DS4JSK5z3/NYEL0212vR67ZZL44HakAn4N8VOJ2BsNfNNPM
         ON4nIEi7+qas2Cp/LlsceRbj6LFTUqVGsNw1Fj2Sfxr0xEpN2XwrgHS9UfjwfIuSjmlA
         jrZ3ypO0zwlw6O/ygkEvTvyQ69Xk3TqEau46EnUczMITQfAzpr1lRGcVZjXpdUAeiINo
         Rqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306525; x=1784911325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=AdlXKpnzLIBoB3MGLzfWEQJy0d36ANaCKrLnB6RZyRCi0XWGQaSOiEd604hooC6HW6
         vEtRVqg2bc4xUe6qRI1G3rPcVaDBjQsxbBCGb5RMee3/EJ+P4WLel2giV9qyRX23nwMK
         iERulorUcZ9UniolL5jlOLU8oxhVfcZ47P0lF4DEEbBIbnQJ32QZLTYsxZdXQbP3NYLv
         2Ra0lKlhJK0WSA8scaUknOaGN9lxh10sU93NargDp+6Qr4zg1+KAmbCcfTofXwVYyKq2
         8tT/J4Y9cCld3Y9bkXRbSJTPRdapf5NhWEx5O4hq9myvyzmi1S/AcMq0IgwsgcMH6JxR
         9Nqw==
X-Forwarded-Encrypted: i=1; AHgh+RrHWt/8SFQGXi+ep2npPY3um8iLqHpPdahS+lQGpaM1vkz2RnPsVgvw2X0IuuPTSWc9vFS0q8nyCotT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuilkmny9+ckq0E+fs/FdGjnIPYkwpcHg7fRpcKxW3z2/jrTFo
	0pm4taauxCKw4spZi/dy7pYQWqlFYHzHwjwkpospbmpvDbIi/+IuBW/U
X-Gm-Gg: AfdE7clDo2q0jaCsrIvlkPVL99RmE3rUQ4xjSD5h8LC7jUxZB8HCvSmZCYrzmfNk4a0
	1b1VkUlcSjqhMODFokjVnNsAUVM/MD1rmDSDSqxuX/ivmAvkfSBRdcfHD6YMQVxE57w/dj9boPe
	byss5DH4AnwmR2/R4iQQU5rh2GmsUy2aY5byZPvUI6mN2eSJcd1c/8+BUZRYbNLcvv5aXOqbtr2
	R0knihotRfUb6SgHh75lhypBocsBdxaqDXVjkg/5a1UdJnhCfCpAV0IWzn/pFSnXt7Lgfm5qH3H
	dxjg5pnKkhVcp8iuJ60u+q8rYEY/aEndgoDjMWtPZ1r42N5oQKMVXWCoi0N0/FpcipnkuK0HQU6
	zeNjgIETjgJzmY7r/U03S/R9CRquEcoe/SjaVv64V2HASJxM+v9/Cb4PgSWc918/8bchca91thQ
	==
X-Received: by 2002:a17:907:a4c:b0:bec:64d4:3872 with SMTP id a640c23a62f3a-c16b46f75f9mr157226166b.24.1784306525446;
        Fri, 17 Jul 2026 09:42:05 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:42:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/7] arm64: dts: mt8167: Properly describe the SoC watchdog
Date: Fri, 17 Jul 2026 18:39:17 +0200
Message-ID: <20260717163959.714561-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..4ebf305c10fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,6 +95,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0

