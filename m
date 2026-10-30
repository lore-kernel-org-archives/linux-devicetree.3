Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356470;
	b=O4/ewX8FYIuSFA2Tiz82owCPlqaqLfHZghU4pnt0Hl8ByYjWB0fXvWUpWWd8dG0C7nJz
	 LFWczwDBPCiFrK+OK8ntRhtWQpZQLo309dm1JZos0jVKamqNcWf4awX4wqYvpH5qsebb1
	 E5yWT+7xP8t26+1wCsCcUAr9rYaUiYgBFM+aVZfqfkTb10AWQ2q9ZEWb798khThiQbcMn
	 mVakrJkueG2yP6AGfm81VTtotH8gZC2oT6OkviKx8boo4XTxQu3QlAf27Pl6ZJUL/VMrT
	 HdFQY0Z9YpJYB+z2defUnsRr503AkKoiE9dXhIiFXyVt5rr4swEqBO7vhO0Gfc9YzhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jn3WWUSpxlxzquDqb3HP/nQ4UVG0PTGaWTA+bx/jhoY=;
	b=0zzJ9WvO7Tgzw5D/qZBI2Vm+ZRVARXzDIdJbS4KoXPefBsWabmkBjphkTrFlDBiZGm4m
	 Ru0aknpmXaprwWjABWAC7T1TBPRzHBqVYYOAyDhyiQNpdMaXUgjMkUBZzPI/CQDrXXK23
	 AlZd0AkDpQhpcV9EZWL32sIgysV4YHN1D/l/uym5P3kohcjwBLYyyswxNPR/7/YpVPlF/
	 FPPkvwhkvlYNqbUy5K6JjSxG0lSwv6or2K4PW16YnbD1NM6anjjq7d/oXq3s42nh4K4bq
	 AfdSG4BsYUOC4Cl+Ixs9sgAXWLakdsLYvN5xWrhWW01Pcaa6XFHDAzk0wTjGaeFfFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R7uPye9h;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEBD60A380E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EEBD60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R7uPye9h
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-369f33df08eso1184178eec.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793356469; x=1793961269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn3WWUSpxlxzquDqb3HP/nQ4UVG0PTGaWTA+bx/jhoY=;
        b=R7uPye9hRRylkWD7+S1Qq+9noxbzbRUtgQmloxbZFB0mH93+b/d4x0BPq+mQmQN7dU
         QeP/Vfj45dqmfhySc6+8DLyFFL74SX/z/B2TLJ5x0UwrO50x00Fi9HT6UhOpR6X4Kja6
         YIEQeQxwedq2BW+pWYex5AH8EzyNCfn2squnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356469; x=1793961269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jn3WWUSpxlxzquDqb3HP/nQ4UVG0PTGaWTA+bx/jhoY=;
        b=Hd1UfHHwvwjQtpg1EOyuPuih8JwfosvGT7HzwPaIKBx2yDIh56XG0v7GjpvRn/j1yk
         pawlGoNxaS6Vl93obVS6hRlsfL+JQjsqo2LOFG6sFzjLkgLw12f79IN/7KfoWY0iu4jN
         w6mu6TWhcTmvbD/OxkhUJcFmEwDa3d06UkEku6sQC0S5Aj9unvC6FKuhwMmyjn7I66bq
         UxHvKSdk1T6hmFl6RUMeya5FF/cDmoMHzol4v/QmT7XKvzbBD0EySKqbzH3jUA6HzvDQ
         SyOWsyhz7bCk03xYCgt4LZvU1aZr8OE+hqEt7yBpHxbjlHRcWUtpBQY0mWv0hz02F+eo
         32uA==
X-Forwarded-Encrypted: i=1; AKwUvBwRn3/plcRfafZyt43Waw44x8BwTcB4ozu9MqIFyw2AKRkn039jEJv0Fo8kheqlIMOkUTr0miBH9PYD@vger.kernel.org
X-Gm-Message-State: AFq9FYJlmi9qALKTqiHFspqQu6YhEagqfGyj9RsM81mu4Fg3b+p/Ut4v
	K3aWQm9HjUWCEqOMKCRdEOIwyOgObo7SCnyRssVERnhRRLxCTZwWDLJFuI1Fh3fRazPFbMqM/Jc
	MGzw=
X-Gm-Gg: AYBFou14ZKhj17sojmZQAIQFCFMUX0OeSOweRx57RTUFx607v9EcFar+9s5QRXg7o71
	kcSqFuJTGr634MZFIOSYvZe5BPz+5eX13RIWzafBqH2wG7Xa24TUyj1nmumK+UUhAkivzFML+vD
	Fq7aHpwSroHL58upuNSaiekdPMCdCKIbcsytuXzYOgtQFDTd0MaZOao/l6KE5bKt23IMVa1D/cB
	A/dZqaWuvjLxkTqM7Qdik6r2C4aLDiTov0Qbp53dPFn1mOjmFBHUZYJgfb8cfvVo5M1oAmUFsaL
	7tnozoXNPgooHvnQobkpZzxQPk+6s3dMFXin+1gHsf1HW7/z+N2DGwpPjbwqZRuXuNuKL8Fy4JR
	R1ci6GrvH+bJuQfzwF2wJ0t8KM7ogUlGrbwMs5Ino6zgErFjF0z6uGXyx6JTIbmDRN/m4IPny2j
	Ez9Lrl4M6pSu42mCO6J+b+o+wPjEfL5anPGPQ+ClbRo9/yZGidZYDECv90trYGRA3cUEhekX7YI
	+c+m3sunWtMW4e8WOx8cdhERiNTNKx6ScpAS5nJDYgp7/hQkWgUbQJ/Bxu/nVxPJmrDVwsysAYY
	xYUlFvhE49k/vesVyEkFReUKq5ffnBo8zDoSm/wuqPQNeOxTcAXr2S7qu7R92oGAfxYArLFacZC
	whoploDvsAqSc
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr3100348eec.34.1793356469205;
        Fri, 30 Oct 2026 03:34:29 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:6ef0:e162:ed32:a99f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm7471774eec.22.2026.10.30.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:34:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6319 ramp-delay
Date: Fri, 30 Oct 2026 18:34:17 +0800
Message-ID: <20261030103418.2355854-3-wenst@chromium.org>
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

On Voltorb and Squirtle, the MT6319 buck1 regulator supplying the big
CPU cluster is missing the regulator-ramp-delay property. Without the
slew rate specified, voltage increases may not have settled before
switching the big CPU cluster to higher operating points, risking
undervoltage crashes.

Firmware configures the MT6319 slew rate on these designs to 6250 uV/us,
with the value provided by MediaTek. Add regulator-ramp-delay = <6250>
to mt6319_buck1.

Fixes: 321ad586e607 ("arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Patch created with LLM. Values were translated from raw register values
by MediaTek.
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
index 0250b4eeadd4..2ec343f49da3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
@@ -84,6 +84,7 @@ mt6319_buck1: vbuck1 {
 					regulator-min-microvolt = <600000>;
 					regulator-max-microvolt = <1193750>;
 					regulator-enable-ramp-delay = <256>;
+					regulator-ramp-delay = <6250>;
 					regulator-allowed-modes = <0 1 2>;
 					regulator-always-on;
 			};
-- 
2.56.0.317.g454f8302e1-goog

