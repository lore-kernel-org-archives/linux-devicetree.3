Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874894;
	b=JnJYuTpoQWKL14jbJwbCpviqV4+fB0feY89k8po89DtVA/PfmMQnjAmeNB7jMNdj/j/F
	 qIQLYYjCe7Z0NCxNJfK+eYuQWwDJ8VDU71SvBnXN0BzKwUMJK/BtTibeWkAsQ5a7/hsTb
	 8nG43GTorsx9pKMLXBLRo2fyVG8N4RAl+rvnTlpdpKSjBHGTbn7l3vQglRcRJssgP7sS4
	 doKRZRcRII+iH4TS32KsBsuLzUYljp19c8HYLm/n2S0/d/IwmVsJrNBh7EAnzgJsxe7Wr
	 K/09zaM3RU33/iv3Lk6DenQmpJ3fX7GIwfRAWsgS6/J3lufdO+OHOJ5mYXJK5yGYiLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
	b=Rlz9uee3MEUv/I5Da9I5efbR58FrQc+BUUsRuVA4SugAHlTBJRYyxGXaY5D06Rtw5ZxR
	 kEmqbZ29thtwNkApw9Aj43a0iP8n8bSFlR9+Evz6tEklCHz5oT1/Xeh4kdNfsEdB3b2Cv
	 RXty05o1/BwLSIxvFp4j+WmPAiLyJtiJJAhzP1NEtQfHguKkY4+heTc/v4kNBnI9XanBu
	 BsCXxS9ZWyMV3Xxk5VVK9PhlNOfv7TnvN3Wn7YRsxKUG986yDE7OyCna63fpQiIpfxCxr
	 nMoqQePDQypv7sPhV1S3sKhJDTrzuq56BCsvwOp5B+fFuPwNan9r12igWCg7JUaaPBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kff1vHAP;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B5606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB3B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kff1vHAP
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so15490255e9.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874892; x=1793479692; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
        b=kff1vHAP2Nu0zIpudBmNBHn5KX0VBdzJXu4jvP58vSoo/pHneUWZCK+nIdNMuxPvmd
         MMKZ9fKFKJ598ZVVeOJxR2XhwwlrIi+xTcPZLuLSYi9hw+QWQaRrGxZJX4Jd2/9vvNJ8
         HRnEH0V5yPdn7Bw1r11dowTzcM5iZmlnh2ripLAHidxKlyxKokb6G2qRHcQfDDtnJXcK
         kuA9zRcem1KIObpVQ6cqQJoDckpwyFj/Qxa1oC9rPRaYv5Cr4HjZMdUvWSNdXnWbSkPT
         iw9YPGRPKMg1b/5GtNxGrHqmt+j9A+kbxt69Px7C1m49FxTKJLe6p3aTq+JcNmEIACw8
         qQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874892; x=1793479692;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
        b=ardz9Y1Sab71AaOL/kzW98hGv+EY64WGwkBil63b6/fzsFDhFJObYrO6amUL8VgFF+
         Ke7mgvI1vheGMj2+c0xE0bVbyYXBe0PVTBdaPyNDCt6yZz1uJEj/VRienBweFfO1kmUb
         QqqiWaTrA3RVUcFrsdfLAlP9EIEudyjGL8Dp1PH+R6JFYGroIe/Fv56biMtv6N2VXsxR
         6J9h6oV6sErQ0D8lgT/isjWFmQPkQUhl9vv9FV3o8FwKJmDPzrJ75wq+BffveA2xOuQR
         QoTmOzl7Y3LNC/59oX9bdf433URC385Cps97cCeWtszJT7483qh8om3SWmkFWd1k0iZB
         IVIQ==
X-Gm-Message-State: AFq9FYLasp8Dgs/sF5txVPdJTfFj80N46C05smr27JtlDOsBwWCou28d
	BzOykzZTeXjn2GGxCnYBKy/Bv9FSj1JSQ4/oE8/uPHhRQkFvRhx5thK8
X-Gm-Gg: AYBFou1Fh7wXjvzbEZp5IXD9cyfQkX5nf1RjXycjCnCpK5uMX0oEep0RxotNQywyC5H
	dTnh5b6Jjls67D40s9kIKp/GToUD+DOwjELtJRA/fj5sPaOY6j8M2Hq5vID8rOisNIiZcCY3n6J
	tlv6L1uvP5q4/UVky25AunkadF0Sr/U1/KgPPsrH2e5K/uN8T3TaI8HgqUyjOdg9rB8P6HWOOl9
	g/6M6hg9zlFlZyFZcI3xR5a7OGTGIDeltDhFCc/0mjL4wPg8PhxtMw+0qyAQ+DLYkXWF7BcCPZU
	9b81gsxbqFRHCKbFITagrl62rMJPb39Yu21fWyWyAWkN094PQBN9usBygthIhBF/jGKBYjlrMCo
	REMUctyBCFLzkbh1ognD1jG+/YwPp63roQgq49i416/2wRHSiyYd+1XsowoZ3NCHk6c/QcsjTzG
	om4RQs1r0jdR+bfaWTY/U4VsusUSczMPpY+iWx+Lv/QwrVY1kiq3LtrwfmSAQQ15Kj6b0r5YuD4
	ig3s5cIMykhJSx8D8Vb04drasUFysJitlMJm5vH35Aw4t/33hLKskm+74aK7sjD2OWGObgXSoAL
	MShdL+v4
X-Received: by 2002:a05:600c:5397:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a35ac99b8fmr44041955e9.8.1792874892206;
        Sat, 24 Oct 2026 13:48:12 -0700 (PDT)
Received: from theSameSurfase.localdomain ([193.222.98.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd49afsm6221793f8f.35.2026.10.24.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:48:11 -0700 (PDT)
From: thesame-personal <thesame.personal@gmail.com>
Date: Sat, 24 Oct 2026 22:48:04 +0200
Subject: [PATCH] ARM: dts: samsung: exynos4412-p4note: allow powering off
 the wifi card
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIMZ3WoC/x3MSw5AMBAA0KvIrE2iNT5xFbGgpsxCK60IEXfXW
 L7NeyByEI7QZQ8EPiWKdwkqz8Cso1sYZU4GXehaFZqQr9v5SKQ07uT8wTgFs9ltNFi33BhVlhV
 NFlKwB7Zy/Xk/vO8HJtVRYGwAAAA=
X-Change-ID: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Artem Utkin <thesame.personal@gmail.com>
X-Mailer: b4 0.16.0

sdhci_3 serving BCM4334 was missing cap-power-off-card.
On my N8000 this resulted in the following messages after sleeping:
[305.759883] PM: suspend entry (deep)
[306.514698] brcmfmac: brcmf_ops_sdio_suspend: Failed to set pm_flags 1
[306.671504] brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
[307.127267] PM: suspend exit

The regression was triggered by commit 8c3170628a9c
("wifi: brcmfmac: keep power during suspend if board requires it").
Midas already has a fix in commit 2ff147fdfa99
("ARM: dts: samsung: exynos4412-midas:
turn off SDIO WLAN chip during system suspend").
exynos4412-p4note.dtsi does not include exynos4412-midas.dtsi,
so p4note did not automatically inherit the Midas fix.

Another affected board was fixed in commit 863d69923bdb ("ARM: dts:
samsung: exynos4210-i9100: turn off SDIO WLAN chip during system
suspend").

Signed-off-by: Artem Utkin <thesame.personal@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 8d52aa13b8..03b514a82b 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -1232,6 +1232,7 @@ &sdhci_3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 	mmc-pwrseq = <&wlan_pwrseq>;
 

---
base-commit: b47faa6004d86ade16b90d24fa1e1f179e6f7230
change-id: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf

Best regards,
--  
Artem Utkin <thesame.personal@gmail.com>

