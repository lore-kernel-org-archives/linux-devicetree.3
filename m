Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849486;
	b=IcKR29W/XCitChs8VxK6YRD/OJ/up+F2EnDqqWXYGw1B+UdtJ0ulOZ5zP1QlodIF2nPi
	 vLpW+N8hr2WuaViwEKDsCSIHA+5jE34GjRPgMaTWxm1mTlVZcY8KMHmww5dfRveJazJP5
	 WMb6V88SXuGAFHwx4Nf4MY7OBuGBOZHV+H8GAbmZYY32/06ATeJX8D2RjPj7MRqTHsoBr
	 ImHjb0LuVAU5jeAV7WO+uqORJNNllAQHAcGpaWZ0MaaVrVOGadAtkWi6YWCcBbr6om4qc
	 /YQWlfpDFrjyT5LspnwpZcWTVd0iqBjbjg8vyNDlYbfvVEx/g/eqBYHBJvJm4RdFlKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TNUG7rH7/qSKafTA5lrT/55Jq8bN6QIZQW36YHjhTGQ=;
	b=xrcYPwa400MLHiQQl9436/VzKzaPVLsx1bFhQgNIij4tWGcE75ZsOjK7IREQBkoBFrk8
	 xrYLB8tckqGWn5yyrnHchB1O0Lzp/NjB3EylWkH0yNN3QtVGJC9zlX9SX6Zt5LQqtOUFN
	 OVMQ6hL+mUSUrb9OdAGJ+h47jImDYfn1/M/QYN3bFwJe1hUCkYOsrG6fWloD4eHjhEH/m
	 tJpVLjcgPNjC4vkQcDOWVzTvIMePljYCLpiAVypo8E9WQAgeA26UVzG8Yu/19gL46OYUD
	 KWJ5vE+MYkiLbpM8CdvQyYjVXcqmVSO+nMNWQfLgyUhHT7rfSQ10pKYigk7CfBX6Kfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrXJ4T9r;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B475B606A33B
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 17:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B475B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrXJ4T9r
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso42334165e9.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 09:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794849484; x=1795454284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNUG7rH7/qSKafTA5lrT/55Jq8bN6QIZQW36YHjhTGQ=;
        b=QrXJ4T9r/Ao3tHH/MkzuaO3Tp136m0vb9GaSkUhytslHpV80es0UA1nNfKyycEpsWI
         5yxeF0GWHXUosnXga8Dgsc4n4ldzMzs1jTD3FBP0ZftrywCfp+/KNGPqexCpJ+/BYYET
         gCxQMLhiaM6btvruFm/M47UWAAwJU77PFxnA9jhwqxj7i13Dc5eai2zpXjfOLJkaxRVx
         49chWLg6CaAbO4xYumoUvxRJvYvEToGq68H7RwkqLpTy7+lB0LraJ1cWHAeUwJiGbc81
         dpvtG257O2u/WqVcwpN5nicOlrDDkDiDRBvCR80L00QkcjccxpqwLa1U0rMFcW4DrQVE
         UkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849484; x=1795454284;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TNUG7rH7/qSKafTA5lrT/55Jq8bN6QIZQW36YHjhTGQ=;
        b=TXYwusPYOLGpnVtLh8hosjHjp0tj1CFBK7tx0EkpywkGpchRXlpllUYUCXFcXrBzH+
         u6+ddWcyaj7xWTINo2por4//QNCSoiwe1ru1r3BuKyuKGORdt7Y0eyM7ZbF1vOlrGW8V
         SpzNn/hL2ZBkWfvN6419ziatiVwoEPshKqJT1YiZwIsSGvot2OYITCFKgNam9efl0WYG
         Zz7T6r9Hlf0eXZi+JgmpR2pdKIIGp66evxHsktoRSD1AsHUZjxD1uGcX+RAcp4eWdK8e
         Fl39hW0LHfDr4nmRjfEuiWAsUFkehRGqf9Weggv6dGJ0ipNNqeKjXCQ41xGN9a/sPgmm
         DuqA==
X-Forwarded-Encrypted: i=1; AL+hErE28aJT9YQfEO5f6R96eBP33f+scY0aw2IPF/wHN9taeDrDnT47XhCoCb73GmyH7+v35ey71e3frRDn@vger.kernel.org
X-Gm-Message-State: APuU4Z9zEJcc6dFEQwNlcUjjP5CJYDW35os9YVOVe60n1UH2k7xB4OhZ
	W5am9POpJZjfCpv/8dNzqlz6W92KlCHVNM1AVZxLZBImVZT6++nIEqo4xHjyOldBMAY=
X-Gm-Gg: AYBFou0icH9Uog1cVtrt9agtDXbP/wGHUi4m7CpUFFitDLeywocOzGOhIwmPw9zWTLE
	LHNGUPmzkKauP5ZYmFsCmMiola6OzCR5MR/+AGymuUj8gX/c3fYOsznThr6wdKxBjJpN3Ul65JI
	0fEjI7HgAVR1MtTMdu1Xk9oB2BQPqNj/1ZBYp6PUAe4f5u/5dWGtU8V+4+G6178Pplte6K3QIDJ
	T0xhvdLK+ywzMGWPxeNV9JNmEtshn3Zb3iqPWpqOwGh9PothbKbandHONFwsXBUBnbIGR1KSKR3
	C4K30PAsB7NfhIsynikgpq7shBNC5svMrtuG/t2emFZ74MIv1XfXnGL+intbh5nbqNA3OQxOvX1
	msuwO6BrydhQibnkdCnlp3R/tnFh7iyK10pFNJLxslxRrrkdtVV7gzAtZO5WLtImHPxEc9Pvb28
	3qyhTvuvHolt37/kn9dRv28SY+CIoWZYCQ6hVF4ncdX61JOzgnKpKvSCcsfZZ1S9339ZuqhgikK
	1xuKEYGMnFbh3mBXkMXrbN4OA9gP0Vn+J8O88x9+0nLqNDSpiyjYJsjXa93uW+ngX79MGMaOrmM
	8nmei0tBGYuXUoNuThK/0VCgrMptYo95RUrJGpt0tN+mINTnJI+qVoSE4fT2fRqk
X-Received: by 2002:a05:600c:3507:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb68c4240fmr134923375e9.11.1794849484047;
        Mon, 16 Nov 2026 09:18:04 -0800 (PST)
Received: from localhost ([2001:861:80:deb0:b65e:146c:107f:26ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783c255asm2418175e9.13.2026.11.16.09.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:18:03 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Jiri Slaby
 <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, =?utf-8?Q?N=C3=ADcolas?= F. R.
 A. Prado
 <nfraprado@collabora.com>
Subject: [PATCH RESEND] dt-bindings: serial: mediatek,uart: Add compatible for
 MT8196
Date: Mon, 16 Nov 2026 18:18:03 +0100
Message-ID: <87zev8wv90.fsf@baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add a compatible string for the MediaTek MT8196 Chromebook SoC,
which UART IPs are fully compatible with MT6577.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Julien Masson <jmasson@baylibre.com>
---
This patch was posted in June 2025 as part of the "Add MT8196
compatibles to bindings" series [1]. The timer and i2c patches of that
series have been applied, but this one got lost and was never picked
up. Resending it unchanged, rebased on v7.4-rc1.

[1] https://lore.kernel.org/r/20250611110800.458164-1-angelogioacchino.delr=
egno@collabora.com

 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/=
Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..bf0b1df449ee 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -49,6 +49,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8196-uart
               - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
--=20
2.56.0

