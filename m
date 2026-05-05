Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2062421F06
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976073; cv=none; b=e8mHi1TrDbo3vW4nm6clTcJvTlLfzKNEfh9H2o/6AUrh4gNtDOfM8bN8OwG7JWTv++OxMUbdjvmawYk2PPNEN6JN36OpVy1kGtd2d6CtyX1rUSTLcwilZr6PvSpqwVDa54m1Z1u/jY/rlHQ8jOhOCSHekH7zlOTK2poxqPRAPfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976073; c=relaxed/simple;
	bh=5T3zmwyeX48mOM5x0fj1NnKOMwqOIEDt5S3nWNTpwUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bhvc/zPKvcaJCVEA2VaGxhlyS+h+/2p6Wne2/J+5pzd9ZheLhN9SfIH1yXHAb1NOPw6/AVt6pmulFwudfpaGTBHURIPLcLUaLywP86WelGkN/ARcg5cTid3hIcsqjCjfV666f/DQ+zN7RjSSRhbG7vTyFjQRjQBeVOF2efg46Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V0NTGO9F; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V0NTGO9F"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1119162b3a.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976072; x=1778580872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=;
        b=V0NTGO9FWtatcYPqeW3asr/6SwZcr2PzbUctMih4uIGIUz4duISvJIzfISkF9jZ+9l
         X76h8m4vYtoKTkLOGO72KsHRGQ7OWPt/se3wdKNTyJXxAWIR1VVOyqZAdxPI2AxW1nd0
         AcHTAaktvkVtsFxcvbchnfuX+0KhLeAFvu7U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976072; x=1778580872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=;
        b=mm70+kxDus21TVwKsyVmiu3Ag3NoH34yrx6HhvKbjyzbIT8zhA6lPf7FI5pt8GdKQW
         6XmlCRM/573h/jGypWq+68LqXX1rBf9wk8nA5abqlTbQPZrOuAxtRU1WpM3XhhHsGTIZ
         H3Ljw37mzs2yc1rbXSXEsz4DKvPx3SHBLkfGw25gmLdSCGONs0I8yQBt6ZRfAB8YKFHH
         4JpbuvBrpOr1WBn4761VJeYhvdudyYcAk2nAwtozoQuwcqouw26vSKYRzWgJwy6ekGrC
         08jenzFTNcVyR1BzZ3+eJW6A6mVvXutjXVMsDzkmPte8Gg90LkfmyzGzNBMLeBPOYwOf
         3Dfg==
X-Forwarded-Encrypted: i=1; AFNElJ8JQd/m2shRH+4w6TqEzbWZFxSSJyCMNIm0pvhvfeQt7xHgCowh836kefyw0XqYvy+8AyfHu4u8ewPG@vger.kernel.org
X-Gm-Message-State: AOJu0YySw0pOdkkV2vKfYN1JyfC4ZC2kq6BjMk0GJhXrQDjLALV+q9Nn
	WdoLLeXOpcGkB0OSAXdlcK6SgAYOjr0mqWLxYDoK4VoP/+xI57HFALHh/KAA50kDPg==
X-Gm-Gg: AeBDiev8PYCeKMbFosw6Ak9mkgmwbLdl+Gfl0NWy6JQ/Kt8Q8yr11QJalxF93BspYBM
	eEAo04H9sLUVyaABnHYRPQnTmMkOrwVlA6atQNg9EfpkbZOQc8M0WYHcLvXxwBPYk4wVdzYj94D
	0GdeNS0IpDn1/9uzmhNQwMlPz6HKKWoyoSpmPXSk4W4v3nzgOSpFwtlhVtevBji9RzcWJG8cXq3
	whHZACC+SB2hfve22U+nz1s2IORUBKVcMZ7hYw7C2DS70xxDQ2ikf7mElJkESt7DV3C4aSkVbaS
	5E7079f4UWFOioy456w48imfjNxuAZsH6QY2T7ChWwqnczaFECIsxVF33vhvM1V7OFoVGwpjaj8
	bAo4jUbvkPjcegu+Tn7WdK5TjO1fTg0C/m+kmQYHYS5cMWCdztJX7B627CTFEPH8jYoZPsnubh0
	e7v61OiRNdBxhQi7MmB5/a6xUmp8r9+rVMGth4rh3WzYZhsPP4UHCNxZCezSBuuf2PD85kw5Ka5
	aZm7OU6koxaFPHpTmY=
X-Received: by 2002:a05:6a00:a58a:b0:839:d76e:aa7c with SMTP id d2e1a72fcca58-839d76eae56mr407393b3a.44.1777976072154;
        Tue, 05 May 2026 03:14:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/16] arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC regulators
Date: Tue,  5 May 2026 18:13:55 +0800
Message-ID: <20260505101408.1796563-6-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ChromeOS Embedded Controller exposes two regulators to the system in
the MT8192 Asurada design. Both these regulators also have power inputs.

Add supplies for these two regulators.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 13960d1c8a02..d08ba6aec382 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1529,6 +1529,7 @@ mt6360_ldo3_reg: regulator@0 {
 			reg = <0>;
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		mt6360_ldo5_reg: regulator@1 {
@@ -1536,6 +1537,7 @@ mt6360_ldo5_reg: regulator@1 {
 			reg = <1>;
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		typec {
-- 
2.54.0.545.g6539524ca2-goog

