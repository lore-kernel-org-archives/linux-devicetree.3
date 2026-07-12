Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD4A39EB40
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849500; cv=none; b=p/mRJUngoz0TqWYZUz1XMMs7/R+tNfNZi/Q0lkxU2//GdP0yLMheSqeCm00es1e7sUQL62X4/uo19J3/dalc462v3g+/zzXmqlojby0cfI5r2l1rarVBcmiuPXFHEWQRZijupMnk9n7zQUUtvWr1mOvWKqJTblRQDoh4OpJs8gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849500; c=relaxed/simple;
	bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAI2Tresb0ZHcp8p8NPlJhwcEIi6coVS2r9gy2HD4IpF6mh9p1dASSofUEIB7ucA//CIU0hFePPJy28+Aadz6uqqSCP1BpGHjvDFZtzXGmTsqgv0pc1fUD88JFbIzkAGH4fndkItBSvcuvm6mmqyd033N5kAkpz40WuWLaOImY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0RC+7JX; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0RC+7JX"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38df94d4dd8so6557a91.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849499; x=1784454299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=d0RC+7JXSkeBLj6Nbb0zNpWu6rG1oKt1TqNRpka1SjKS+xgSJuFWW38c875TCANAhs
         SGGeo7dBfTh1jQpekcGneZxg7y+fG0RbI1NoR5d+vlm6MYsYEu+oCzbTSAFpw8p3qPWq
         MHW/kBLsTiGOxPFs8bz96i+mTFWMyMCR0aHVTG03jNtnxWbkG0G569vTTF6lCwWmwcA7
         aJ3lsljLjYhRlblQz1A5ZSs+T7a2lG5bNqwpURcsHytfhZl0DhtzilqwsqVJWm8+/33P
         nfjM3CD5t6hMF5/aljoPXSS6wuvWhiYuNXqKMWK1Kr606yM1dYr6GU0ZpcRQryGUlfAd
         JYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849499; x=1784454299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=Uj+8WhpfTpwHS7eUl0TUu0bVOdDDhBBojPx/ryGGHH5iHoAJnUewPWxKcbgppsA+GF
         fEBPVkPQoyGjvYtE6DByzWttieYjPMl2yYI2YAFecNv2/xV8FMKvFHja5oHPjg1jfdoF
         e701fz2NDZn2BvLJiCOmSwVdGyRH7Kfz/4g9/D6xZUj64QBZb52vPyaXmzB8vjanxxPT
         coWYk0653Q73CSH1zQqm0jcxf4Ez65YS2/b86Cz0rSWPPZAfOnjaKFkNxPj9UTJG0yhN
         fksV7a6zB2pfWlI88Bzqo/oL2IbdcXpDj1o/dlGFwcDPAP8mSUL/GVYoSQQqmJLDyHrN
         HYpA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7ZISv4N1dH6nr2xptrZoSJP2ePvwaAHfWxWsOlZihl4Rnl+ocaMVUttE0qZ392jmusnmb0kamSmWq@vger.kernel.org
X-Gm-Message-State: AOJu0YyNbzeR5w+j/cBrxq2bgZ2vVX89TD3U6DJ6h8mTTFyUevqZLQwU
	8Ng1LEogm81Nr/W3qdwNH14IqjzTTvcXB5NkCA311YYfPj+KcJenJikg
X-Gm-Gg: AfdE7cnUBvDKmIZBR1/cb+eZwVlHorM78Zs2jTp2Oy7AmgUxnkw416qIVOi8AuxWzGS
	76W1K2ddI6G7P3vfym89eQRbgkK9blkC+ovdtEpfWQwnr04PK4fHYyV+j6yAFNZu+juuA9o/Sjb
	C+4cZ96rKnPCOdz2QnCsV+tsiJMR42Uz4fFDguPzq34AIab7S2bMwJKfWaFbI/EW3NkHa+ZMnw4
	Xk66FMmdOjlTB0pEV+lXoFpzKCHFDt3VmaNB3TdI7RNzz26wtZOZoWqzbymFdANJq2xE0SeOri7
	ojmapqCQ0JgCfvtBRlTRpxYbRANzAo3Z8riKOsUqB9jKtltXOo9XyJp1upBEQM6EQQQsBX/MJoW
	RlmQ+51naMdfbZOlVCs65MoXRV/V5HK02lQicTzS2rqfYHdzioKE3o0y6vFaZNVKfI36untZY0T
	PfQAg+Ars27olvDhYZHNsdqmZU02xHCi11N590KBq6678xDUycqtJeqJqtyIscp1jFAcgGwxPfk
	62Hh7rDeaBCU8dDPTJfkiLSIqPJeBCpgOuZn0eeIIUMJhU5sW0Uoz+7+06xO28l
X-Received: by 2002:a17:90b:3b89:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-38dc7779d6cmr4445784a91.20.1783849498894;
        Sun, 12 Jul 2026 02:44:58 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:30 +1000
Subject: [PATCH 11/12] arm64: dts: apple: t8112: jxxx: Add device-specific
 SMC hwmon sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-11-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/XXn4VvKanw7kqSsbi77ETk/afz7nt27dXzWhWY
 oRC+teKjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRPj2P4n8l+4XNXcXJ8Do/WB630KceKm8/HHfzCW/nkms2Onbue32T4w3PSjIl
 5gtbbmDn/VzwpK+35cbxOMY6n9mGuiU7l2c9TGAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T8112-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 1a08a41f369b..7ccfceb08093 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index e37c56d9fb4d..fdc3409d2e07 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 438f972546b8..105a9d118980 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -84,3 +84,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Back-right";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index ec116da3e4dd..7cea5c594810 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -146,3 +146,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"

-- 
2.55.0

