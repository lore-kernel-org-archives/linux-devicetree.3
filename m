Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5667447A0AE
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643408; cv=none; b=DMGil+n5Abs+HJBij6NIZnsXriAk0JEnNGh/jzYzzMXaQff8eYH0Mcd9ltpg4Hz13fS/Va+vCEVwhV03SwFKFn6blFCkqmlmeruHaWoHcz4Eb5KA81rh9B1rVEf7SX1JcJ/yTU1FpiZjbthswxzTgroiasbdKbKqyMaUvB2uf7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643408; c=relaxed/simple;
	bh=GBzyizyPv+xra61B+Vq9gjaajVwxBgMvkwqgSZplbY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3pRGJ+G2Pv8rHocZZJDwQCp7MbSgApYAjFPAk0YwSo1/MVyR7/9q3zRJn8OHQkqGUNtmAzIMiIOGlVOIh33VG0wuCGwx8GXqbTsibziuqkrJkWEDp1FOz3z9q414HpG9eWRSfFuomjnS9cB4y9Etm8JEKd9buSSh1LONVF3lqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vuo5E6EA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vuo5E6EA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46019b190b6so1187186f8f.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643405; x=1781248205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMKMXYkNxydSpTz7ZRDCxG2wY5Cxqn9vnpLFwt0ezvo=;
        b=Vuo5E6EAK4v38a+swgTIT8rImIXJrw4+wTnDO4sNWHk/lowq8xMvONyE2fZ5SIhUU9
         v/Sqky2Q3NPamCt/kLRXBWbRTihr9m8AO7KtqYFCskOnCbBGQ1CGZTNFhHWqUuPnckqm
         iPUwLWPJB3xBTFGN1k0gafsj98Rd5iTAvJsRC2w+t/VGgVOyPphSxKQK0OaSHEV/8Jyu
         NtOYvbLxTpi/ugtaJd1Mpa2PZNnxGqfMJZO2mPhlzuNMb66nWP2CHwBeBBBKXtRQ+z25
         tF196E4TECl82t5WsgmBWMVJmtLbeSLG1st7A5fxSwp+fZY/cJuemCx3L4UBvvt0s76w
         orxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643405; x=1781248205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMKMXYkNxydSpTz7ZRDCxG2wY5Cxqn9vnpLFwt0ezvo=;
        b=rO4hTv27+LxBXR3VIeafMRgv7H9Foj0HaGkFzoqBqCdwnslI3IWLbPuSs/ZFfU687u
         /UkglAj7TT9f8qGVPyqEw1jTQLS0GcRXSx7jR89C1L7IERRbpENV2QO2vT8qlj/gx/C3
         ln3vs2hL8uAnLFKWLCQ6Pxdy+vOEnfc1+ySlgNz5Opiq55sRy4pydan1VZsAQCgJYntQ
         OyU8OmWOx0IH33ANOc1WQ6kzWsMLA3KMgmzLM1BEhdLLk4AqhjBSJCV+bIoJbsJqp8aS
         hSfKLbBI+CsK0b7QKmrw3GigpWDEdkplZxO0ri0Z2uTiNSoOJwSOo3dok4Qn7DwFJ8K3
         KEAg==
X-Forwarded-Encrypted: i=1; AFNElJ/MbOvruznmMMeGM7AHdR+EqZkASoRJC3fpUzp3c8+Wpl2LHk76LFf1crxaXcYrisws3QW8RjEgrlBt@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLK+3RiLlkfQxSXJ5XwMXgxES4U/+Pech4CF+QRPwSQ8UBIHp
	+SLWtw7T2VN/uFLM/JKnXlO+nvw+E5VMzgR5YcKm0AjtmROiscNxyFZ1
X-Gm-Gg: Acq92OF0InXR/yJlEgy+aWjlVCRVqvy8GQOLVn+gpmXGz/a41LaMoQlKMq9RVc6T8dU
	8sYlgJj9h4fKIMbsALhvNeF0wany/55gbpzHR84R6vj05SzRO9adIQoY4dGyhUPg/oty2WFCfxo
	r3LGZSXKOJYnoUlt2rvwYkaRQicGVLSmPb0mabPVLyr0fm8SktMJGeYIcrB/+SsdNNwz6mXWToo
	tJa4jr0iH3saxEZJzMH+F0tbnKIij9lOs0ALnTy44uLXVDICgz2DoGrZh2zAjtdABlKLLJxCWs7
	X21oRluCJy0ZW6fre1+HLRYKF/aCvzvr4X8nu5QaSJ7jTEBx33Th0DZ+DNMwvSoVATHaaaKzpUZ
	LEfJ0jlJH+/u4no5C+g/fnJLpZthppRPcNnGWz4PdUDUfKp4FgiiVBBlc6NdsJ8Ds1UxLln+qlF
	yNz4RmvtWxz69e/DhDAtqzhLl7RA2HDUBzFbrV1NEFYijBnz1E2FGqqlNPgF79DugVNJkoiPE3G
	o0fI+YPB/i8OyxIQ7hBNw==
X-Received: by 2002:a5d:40c8:0:b0:45e:eec6:5020 with SMTP id ffacd0b85a97d-4603063ff2dmr2697534f8f.38.1780643404687;
        Fri, 05 Jun 2026 00:10:04 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:04 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
Date: Fri,  5 Jun 2026 09:09:20 +0200
Message-ID: <20260605070923.3045073-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reserved-memory node carving out Trusted Firmware-A region spanning
fixed 256K from physical address 0x40000000. Even though Allwinner ATF
itself passes the address range in the fdt to U-Boot, U-Boot currently
only reserves this memory internally, but doesn't carve out the region
in the fdt passed to Linux.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 7cb06b19b5a5..d8391663fd1d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -87,6 +87,22 @@ osc32k: osc32k-clk {
 		#clock-cells = <0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * 256 KiB reserved for Trusted Firmware-A (BL31).
+		 * This is added by BL31 itself, but some bootloaders fail
+		 * to propagate this into the DTB handed to kernels.
+		 */
+		secmon@40000000 {
+			reg = <0x0 0x40000000 0x0 0x40000>;
+			no-map;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
2.54.0

