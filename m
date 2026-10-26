Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036922;
	b=duC4zcCt25azDRbtyfXy5GHRKQvHhH/Mzu5qdiusIVZVpbojvLWKFtEFAg7pVIjlTelF
	 wS992Dc0WkSdUIAHXfnBsSggFt4H6/KYWYv+Q1KQraQEaYCXW5pMrxzABEreEYad0GlRS
	 kIZksxxDp8PzyPct+BMcqKJbgm7w/OeDQa12reNiu0dEfvtPXFmrRz3zwmvM+52woEK0k
	 yFcjg8BfDk0z0amnhEqc1Q2/Hg/wyeB7yhlgrF1HpwBtRJ3Qxm9gOMyU0qNdQulq7BhEx
	 8tnEl1WOkUkdgEN1F6hPgpMLE8QTIbHtbS51v+x0vBjUPvm4WDViEKvF54ItnAPT02Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6xOB+Y9B7pCNByydgjtkPnm7V5ov68gr0sv6XngJ0mM=;
	b=r1q1rRrmKo5xtSmFP4NAFNckKuvdKsEOsRAnIXsiTnp9Ce8bdJc4hCRkj5g5N9jOkyC/
	 sR6DMONMwv4xDkL+MO6CK4K5emvDd83jU3BVkl0hHTMtKlThqRK8Y2ELWhTHYd7b+EYGm
	 FksIFP9HsUDaF1oZGeUmKys9TegJsDRJkjAdSGYdEDvshfCPSBj0WsjMjVgb4SR9GZhoa
	 Xx4zvvqmc5aYYdJaDZJuB3YvSSVDoxXxc0BkWFtJB4t/bHIznTgcsW+DWEIlGp/mdJozE
	 r/5lAajpQrTJHs95vpMsg35U2KNTsqvaS34oFetfQyXvqAPruhfClbQerSoKvQDO/FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeMkk5Vf;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB73606A331
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 17:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB73606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeMkk5Vf
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4932b13c4ccso1683003fac.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793036921; x=1793641721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xOB+Y9B7pCNByydgjtkPnm7V5ov68gr0sv6XngJ0mM=;
        b=KeMkk5VfkeUE2XnhDcqQ35p+TskFtFpqyrseQUN/k3tLkmKzuvHQnqClgbWUWWpfyr
         tkscSRucixmY/wl2qW3CIu6uooI1G6t+oceZUj9j+T9Zxnr8CwJ3g7c6mtJi8l2F1Xud
         8i12oM1UkCHcqT4c45oAlXFMURYKFcoetMDNB3rB+H0N2Az2PdcCz1MlcVI9RoHXyohb
         aFpfU5oYRqmfQAvpfLmNv/3c/Jihyq7zpyGqBbT1eZ1Uaok+VEct3wJeQedut8YSI/oS
         2q8my30L1UbnHvQGth8mgWyUIFfo9AJJm+McrVtzKQ3ni/HDbS0aREZie7+IKWUrnRcZ
         vpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036921; x=1793641721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xOB+Y9B7pCNByydgjtkPnm7V5ov68gr0sv6XngJ0mM=;
        b=G2tq1kMwBDLm5iPq2hAPC6+dq7+TbosDxWbhbFpZb3voWkUysxO7zQdVwVG2JiLWmS
         UzAUTgSmhDT9sgkkKTPLkZfc0pm/Z/WAZTlbMaaRNQWVqXUPf2R16OM40Yi4qssZk91o
         g3nDrowX+4hzZNhdiZzbPt8UW9Wfaf1WqAjPTzrg8yEcS9eHS10ms1JYEQpG9NXKHYt8
         mG2lSwAxMxarTgnG7Lp05+gb/NMVuf6T0YGxFqaywunJ04kva64QDRVb/iMAIyejIgUM
         z7d8i2/MM1q8Uy/dK8wuygaCCgXOMx05qlKOylzPdNpgLHw8Ylp0pie8XvkOOwmjnIfB
         H8vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTnwAufdzX371szny7/AMbpq03mM9NtW+kYaF7Hvs1tpgqnhkdde0bZqlGZiGKomh49m/SMa5fCwdW@vger.kernel.org
X-Gm-Message-State: AFq9FYLsdt7q1uijqoR78qDiHoGjTIXDsyQmbhCa95TR6v+1BhJw/PET
	ksysjvANrumcBUfpgXZptRTnkfLFocEtaVs+ObUqQk/OkYOx07zdfL2an1hMEg0Z
X-Gm-Gg: AYBFou2+Qi1+TZZaLFyJC+L2XJDQ7JoeAtWPh8N/dshUGl7p7aWYeNmg43dWMSBrXwn
	vuuixIMMs56iwyHLr21CI49dJPcYTzUH7849g20neccrGEy/I+GD6lN1F1ksGwjSmPM3JptM1xi
	XEA+D53jA0V2bA79Hn8yxrOGFqvpzTLsgojC+ESOEMqPgfeSypyGHoOgJ7oeyPgy/mMOxxZJPEk
	63cOCRUJrKurS5WZMPiqIKMKLFX+aaN+LfWTmtNiXzLU1vefYc/e2941UvY4psbJy03Hv/U7tYL
	6jd5HzjT/Al4ggI3EjrISnIiTOpQ7yQY8dtsP7g0CEDQPxyJvtiRiFLIkKfHu6aRhdUpD1XJZ6o
	LyWlMkQCGpExb2jsvxRv7M+sIjQCodK544gaPRehUdRRvst9VPvPWjj32o7FrbTzNdEHuGTfOCr
	/M1IKspGew6n8Kaqk9HomoBcQu6YkFyG687xJv7cazERnaIaHlDya6HFdQUBFHaqNsKYhNjM2mU
	9L6CVYbgpURid+TENggCdcCEuXDYyO15bQYU0ccA96bKneHCN+gedx3i6qAYV96YlDOhM2FhASr
	926RwR87x5oezHDNivjMoo9c9OB7DBLfeo5afUc/FVxkKepNZ+c=
X-Received: by 2002:a05:6870:2183:b0:48f:e25f:1dcd with SMTP id 586e51a60fabf-4a83f686b7dmr4595707fac.61.1793036921182;
        Mon, 26 Oct 2026 10:48:41 -0700 (PDT)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a842e89e33sm5034753fac.1.2026.10.26.10.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:48:40 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-pm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	maccraft123mc@gmail.com,
	zhangqing@rock-chips.com,
	zyw@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lee@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Zetarancio <zetarancio@users.noreply.github.com>
Subject: [PATCH 4/5] dt-bindings: power: supply: rk817-charger: Add rockchip,gate-function-disable
Date: Mon, 26 Oct 2026 12:48:33 -0500
Message-ID: <20261026174834.1652309-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026174834.1652309-1-macroalpha82@gmail.com>
References: <20261026174834.1652309-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add a boolean attribute for the rk817-charger to control whether or not
the system power is shutdown in battery off mode. The BSP kernel sets
this value unless a device-tree attribute is present, and this attribute
is to replicate that behavior.

Fixes: a592aa3a2a8c ("dt-bindings: mfd: Add Rockchip rk817 battery charger support")
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Suggested-by: Zetarancio <zetarancio@users.noreply.github.com>
---
 Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d176a84c..4cf987fe763b 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -148,6 +148,12 @@ properties:
           Value in microamps of the sleep filter current for the charger.
           Value is used by the driver to derive the sleep sample current.
 
+      rockchip,gate-function-disable:
+        type: boolean
+        description:
+          Boolean value to prevent PMIC from turning off system voltage when
+          battery voltage is shut down.
+
     required:
       - monitored-battery
       - rockchip,resistor-sense-micro-ohms
@@ -381,6 +387,7 @@ examples:
 
             rk817_charger: charger {
                 monitored-battery = <&battery>;
+                rockchip,gate-function-disable;
                 rockchip,resistor-sense-micro-ohms = <10000>;
                 rockchip,sleep-enter-current-microamp = <300000>;
                 rockchip,sleep-filter-current-microamp = <100000>;
-- 
2.53.0

