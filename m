Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814806;
	b=p19UXqS1CJJY8MPlSYD/ZnKHEjDJObkrL+YHi2KRCAvAiLq4sJ2OFFZVucCjNOH0JK1i
	 josmyZHzKaGMrTNm4MNkQAE8YfU2IM5SKM3JUigHdT/kPOAISBSeJqruYOJljUqj2eMeF
	 v6nff9KHGraSxNMSXqY39IX8mwLTqLDqhN/H3AXX5O9xHboeBstQkwNkKizu2IP5OjJOc
	 DQ48Y4miNGjr4X1Lc/s7C/cHXt0MnHmwiOC+5/mANrkaRWkHMH0tU5wqU1M9nVGyRF4Cu
	 zMI0TgPUAivoe5uhpVNVtiS7i3CXKb4Hyhcg9jgXxoIakJZNLefhYS93rX1JE8kZQfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7HwD/9cyl5yU69DIEKa52hPN8DCHL8GdVhIFYuxqFrc=;
	b=E5d6G2gg4HmguW3QAS4a+ZTNaAYIbbzxUGGsvlpPn1nGqH7HeodcWFsE3p1Z+IJ3GIIG
	 oKgcmpNcamYvEaR1T+0nNY3mszw1HQ0zyjAHojnL9pGzl0uF4RcKxPierIn/bIYp3xKp4
	 ZH/MXMtIbMQOe16apUwDrfdi9AcGDoYIJIcxtWnO/OpQ/6LQ4VyDN5kcJKcNfqmsYpLSH
	 Mw9RaLW8Q4LSbBCkzLPQJLkC5XNz0jN4ddBZK3l6c/o3tp++rFFRWTgyRqD5W+HgpFNUM
	 GPF9sGsGf7NnLlyUBt4TRpZIYqz4FECfx1+vDZ45rN1jmmkdgrAGM/g7AFjp+PDzlZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6LdmkbQ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483B60A3833
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E483B60A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6LdmkbQ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49318428d98so1199229f8f.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814804; x=1795419604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7HwD/9cyl5yU69DIEKa52hPN8DCHL8GdVhIFYuxqFrc=;
        b=S6LdmkbQVA541jEVdicLwZOEbw2MGB5A6Cr+05flbgQjzuZkxsmnZrhjTKDEa9Zs9L
         r+eLO8DS/9pPo3yU4ZUGL+J1Uqm8LB4KRn3Hi00Upp3AKhs7ARcEQcrSlv6tnTYocw7d
         6EtSnQSBTXMJmUOcuWSNz32eYMVEZcOTq+qs5Oek/WJoeas9kePEPria3pXpOzaWy1Z6
         alfBNg22E/VfuCkUMvYNVnWKIsA939GGnQl75JbUBFwuog54IVABVFi7Kq0j8BxwR+2D
         ZvuIjx9nv9Jp3G8FFGHLyYvumznDoN2tgYKty8ER9u8BO9QZ9C2wOV6o6uo88Ts0EUA4
         6gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814804; x=1795419604;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HwD/9cyl5yU69DIEKa52hPN8DCHL8GdVhIFYuxqFrc=;
        b=EmdfWtJUOL53L5ajFFucuO/CUJbtfIwAB/pijHy6xpnb24m26jAynT2cmf53AR9LRa
         FH0xn2N5T5UNBmqlxi2CsJmeDWqTnIZ9rj+kCsxCt3LLYdh59emR5GQ7//ta8rYzgChO
         qWAMRXn33b/7I1nOZcD7J0e6mmj+a4Y+tu1Olw8qLLvQNlR2p7ZCgTsHtLPJ1qRK/Wwd
         M/eVHoIIbagzbInB5wAiWSOtUcmt37BGivr2MqZXDbWf6uhaSCfgzHH28kINsJ2Ein/+
         hzwQRNL+Q3tXA8yMm7f4FEpWdYbP2XUTID6rU88qMSgqPdN8j+uYR9RgDPGvfIKP71NV
         oEug==
X-Forwarded-Encrypted: i=1; AL+hErE15gFTvnynlH40XhuWVL/Bs1Nkk5JPnQnvvLylAk+R6pKTgu7VQfaUdc669OV+kuYdXvmlZYssrvBD@vger.kernel.org
X-Gm-Message-State: APuU4Z/v221w/W6R1nDdv/1hLbOcNiBazwtNQiu7Q/5unSK4nVjJSi4I
	Li4P3Ip5ZpHyqYn/Ek90ywzFc9d0P87Q5k6rkQiI2pR0dSwV/PbybhYDax86IWrm+PYMtg==
X-Gm-Gg: AYBFou2q0RBH74Ed0IMq+CJbULuU/YGmeaRX0iKpryXYW8MvUfqmgLASvQq+VQ9kAsc
	11EmOvbV0TZlTQ4ol3EPWFHMnBwS2AQmtET2XP6FwCZPOtz2MZncg/r7p5DsHBHzv0LZIcCbtvN
	64NfIX1nRUlrzXXR/JnGcZvJtJXVAZWPrvxDzU/u2SIOwKFh9hVtozipszSoTfpzMTtybYP+a+z
	UrcxTrkxEd3ON9O2hDW50tILNoMvdgBkLNdNfm6usoNahhy5TKdvRtHS0xpWd5WwNGAXOzaiBSN
	/eArbFjnemOnekoRlV9qOcBbud62UGiKun+HO0nnR79kmM5B1QERO6fSiiR1DTf3kj8nNqObwLE
	TPd24T0XFyIiL7g1jRmDkiougUNXKzrZOIEPc0pZPKTT1I0oyx5XLFMCzf5G/7+/S+w43awZEgx
	B66Q1BaKMbQxol78PH/TXAtw7NDS3Ufm7T6wnC2N5ntJ34PGJYnZkRQsnhjPTnX5Il8LfSf09xj
	0DAqcoaFiK1HyoxxjryD3Jb0V1AAyoPvdT/xmioFmETB6WSgQXWD5u/4T0CylhAOpNe8JQ0BydQ
	6bxeK7w0og68620Bn3wg4o6gkJw1Fn8=
X-Received: by 2002:a05:6000:46c4:b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-49c70ed910dmr12914294f8f.10.1794814804277;
        Sun, 15 Nov 2026 23:40:04 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm20354115f8f.35.2026.11.15.23.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:03 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: power: supply: samsung,s2mu005-fuel-gauge: add S2MU106
Date: Mon, 16 Nov 2026 10:39:58 +0300
Message-ID: <20261116074000.355176-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074000.355176-1-tadilhusrev@gmail.com>
References: <20261116074000.355176-1-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The fuel gauge in the Samsung S2MU106 PMIC shares the S2MU005 fuel
gauge's register layout and scaling for the direct voltage, current and
state-of-charge registers. Add a "samsung,s2mu106-fuel-gauge" compatible
with the existing "samsung,s2mu005-fuel-gauge" as a fallback.

This was verified on a Samsung Galaxy XCover5 (Exynos850): the s2mu005
fuel-gauge driver, bound to the S2MU106 fuel gauge, reports voltage,
state of charge and the sign of the charge current correctly.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml  | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
index 05e420316..7b9d56d38 100644
--- a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
+++ b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
@@ -14,8 +14,11 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - samsung,s2mu005-fuel-gauge
+    oneOf:
+      - const: samsung,s2mu005-fuel-gauge
+      - items:
+          - const: samsung,s2mu106-fuel-gauge
+          - const: samsung,s2mu005-fuel-gauge
 
   reg:
     maxItems: 1
-- 
2.53.0

