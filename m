Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356468;
	b=oNzvU78fHABxWTvFm4cTMJ3ZuQtNb0B/yQZEZjjIQg9cIEkfYQmsswzzEVX+rOa4ruit
	 +ZPog7l6kXMVLjBKrnybRi6a+fMU43hfTB/tmIPE769KTwC5uQif3e3Bf514eMJeE/tDS
	 rp2YdCZ5fj4Pt1u8zm2Bz7jNddOGA6bY28WMLbfTgFWQ3Bj46S3SQljHT5jBWFrFq6vGS
	 i4yd7C+UkI8lfxdSBfIfDNZswU1c8rRGvE1CmriA69cfqUA3eAgnJF+fSNLYu+5mAjHJf
	 VBlT8Lg4UDGE444YHkdSIZJu4XhBCHqr45xci/bk2hJzV2H0VYfygJ8KJTnuaveEgVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1aNoVlnvFcsOYz3yDk1hH8WlV460c2AuvXHcDZPvdOA=;
	b=OZQJhZawacNehcOuvlQw7vn3P9YTvb++CEltuKFZk+SY5wDneCLQLSNgXYMuK2VlSMbo
	 3O0BQLal31pKaXeyIA7FsST6m2B96sLU7dFewMZ2rZpCdeRZC4COuh4fXHK0VD5HFKPxn
	 fv265nrKO1d/kN26CaWZC2/qGVwE3W6fhMvWiybNt8r5CC6/wDa2gmWpDofpTDuJMvHah
	 1d5j2D+Kps4YcqjUNp7rbybcu95REGLKNP23dARrUn4zA4hv8oTltPE79qBQkBV/+TPkv
	 gPnxqCi/NF/EY0msg8SV15AGMJMLNaAaBnaYMVeFdlcvz6ODpgbym0OYyugLQo9/fyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=noS3Vf1k;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5C360A2622
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D5C360A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=noS3Vf1k
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso887551eec.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793356467; x=1793961267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aNoVlnvFcsOYz3yDk1hH8WlV460c2AuvXHcDZPvdOA=;
        b=noS3Vf1kr/+GOezZJ9DB1R4TAxZnNL0nA3ywDtpZrGsVu8F5Nw2k2Z6yA9wUKd0Dm4
         EwfdKdP1MDYH1aqpdHJU0JoOTYqh7Uq3B5dkunGKhuJ4OLqLlDfB02svFakSXqANew3l
         FlSXwO4cK3D5coJpKrZYGZqGE0BEsf7R1SeG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356467; x=1793961267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aNoVlnvFcsOYz3yDk1hH8WlV460c2AuvXHcDZPvdOA=;
        b=1Zp0tshrM/JYu11VpGSs3gI6gyiKkYo7Af5ykFiE2xh2A+0Bw//jWRlDIRCxxpI5Dg
         d9nR6lqEktUYJ2qBDqrp31/GiXc4lN0RiWJ5/vdRyunBFXutn+qCwQyw2lNLkqHVYCme
         tJUC78DfojYHK6SEhd4iTJWFfyNyn0CdFJj5CY4iKBvIhLvXId4NQUgPONBdksJ0PWFE
         FKIGiNGkv5Q6CZOnNgBS+6vRzngDoZC/HZ2/8hB3pNUUlk0Cgl3HcDxwq7A1JXHwQtvv
         wZyghk3H0mWMy31GGNuhFrGX1c5IkF4l5LVOMBCYMTxEwyBpIMOwU15It9zAzYYFimE/
         5zeQ==
X-Forwarded-Encrypted: i=1; AKwUvByTtJgAdS2053zhTv3S4GpFgJ6zebgFO8VsS7AJNM/B59w2e9fq6fgXAZlXkDiezYnsSHAL0IQj4PBm@vger.kernel.org
X-Gm-Message-State: AFq9FYL9nlaLn+vYaC3oosKVthT4oWBCRYME0gmj2f5d0PqrDQ0RpmVF
	uAgtduGMkNpCrInuhTsWpSYG+weDEz0X7V0rHpfR4jFr9gHC+rPFyOATDBctM7dfDA==
X-Gm-Gg: AYBFou1hb+uimaX1t5l/ge+KtSyHRaaU2nVBfEQya6LK3kj3j9HT2w+BNZPB2WK4MYw
	S3hfbekUEjloxzOjiHInGHNALDKU54nBLzRzdxV8DDQQf82tNYczQBiMergwNE3g3rhD+PGkyIl
	p+Z3VyCWebwQphMmh/lutpmS5qybI1iWThQDIJZSCO2GwnOlxXrXcNFKn6OMaV9jexc9NsgZzSn
	IQ8qbM8I1Mjl4oUGUJZaHoF4WnHJ8R4II3FFe+O/kzuNayjD2E8AWxHl3ykky1ZeNluNP8+JAwT
	ml2Z7tt+2YbxulaUGAbXFvhY9Nw80AX3r2d0YuYMnqiBRkdw6yGLpYB5AeRmLY7jVErNAxH6p83
	bXJUxh/RsCgpoxlUWpN1VIBhWUFAQczZ6nVg/jQVhv+IGStOUZ9Vely/xx93BtpdShmg3fQOw32
	z5juCfK9se5vkrfuJyaaaSDmkrqQap66CnTxyuh9BD4GakVgPe562WhdbuwNqHFfiRHK50CTN1G
	jnusQ/+KhVVfU+T7LKs7Mr2RGn3bY4XvlEavsJmyoeZiG9qSZa1cItnIqfUMu2b12D5J+UKTxhN
	o9B5dNrgc0PLZnHhMxHaW8+D5hLXvwD5QIVrwwg+2vOulfN7pOYwDN7ghqpwF/NeIv+sobJUUuA
	LX5croLM7n3OgrkKVn1NX0iO1iLdFcFRBeg==
X-Received: by 2002:a05:7300:559e:b0:36a:1846:5c77 with SMTP id 5a478bee46e88-36a42204585mr3068442eec.3.1793356467068;
        Fri, 30 Oct 2026 03:34:27 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:6ef0:e162:ed32:a99f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm7471774eec.22.2026.10.30.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:34:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8195-cherry: Fix ramp-delay for Vgpu
Date: Fri, 30 Oct 2026 18:34:16 +0800
Message-ID: <20261030103418.2355854-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261030103418.2355854-1-wenst@chromium.org>
References: <20261030103418.2355854-1-wenst@chromium.org>
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

On Cherry, the MT6315 PMIC at USID 0x7 powering Vgpu has its slew rate
configured by firmware to 4500 uV/us, rather than the 6250 uV/us
currently specified in the device tree.

Since regulator-ramp-delay is specified in uV/us, specifying a higher
slew rate than what the PMIC actually uses results in an underestimated
voltage ramp time, risking GPU undervoltage when switching to higher
operating points.

Update regulator-ramp-delay on mt6315_7_vbuck1 to 4500 to match the
configured slew rate provided by MediaTek. (Vbcpu on USID 0x6 is
configured to 6250 uV/us and needs no change.)

Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Patch created with LLM. Values were translated from raw register values
by MediaTek.
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f23a0c7aa87e..81628d8a4b0e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1596,7 +1596,7 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
-				regulator-ramp-delay = <6250>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 			};
 		};
-- 
2.56.0.317.g454f8302e1-goog

