Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432743;
	b=2IPWFnNUhsiesSCze++L17DIbkD4pIqqbrEJwmhJrLymboTfNgKXaR2B5TEHNHbvu9zJ
	 3RJKuQaD09WAkLgHYOIT6FAkoZfppu8n9iMEOS/6/1UinyUnFAUjp/XHyuWic9V933mBA
	 GkAiv+dq1liKxSR034LOraZ5GZT6aURMlWg+XdeQC1QQGGEJqoGrOr+fuCEUjHIIqcvcV
	 ITmfYYwvyoJtWo5O0yX+CMeUEC1pnRqgAmS335vAqkUoR8F50WrEOObV0mxZSQ9l9vmL5
	 tkYxwhP0tNTitbUP6HMudHroyVItLTuwPDsBPhTqhxGVHN/bupb0OhDeN9ubB4zg0Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
	b=L2PgMODh26nWZPfudBi1rMisHMXeHCI2xT2L3IPfw2DusHdD1lRSWW1EuEAriLfxsQz9
	 /8dZeJeW5aLH757Wsrid0UjEz9XTBiT8Meow8o+dKWdtjC6T27h9hCsFdhg2qpt+kksGd
	 iqQ0jnhNzl3+tNX7yhvDNGhnvDLL+INul4duvHaioYslTCkqnR9jNArWPNVGn26WnjJFe
	 d09eamS+w1urc4Tq/mKTBG1eyBZg+q+4SzcnpoGOrjC5sP/Wg4OOK/mDzyw5cV8ON0KBp
	 0VXBRGVq4p6eZ+UwyvfN6pFlxa5o0lLDMgJHl85bCwjEsVdEThv4Kresc4UxGQL1rgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JK7SjlHS;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5D4606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JK7SjlHS
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d581da0aaso411971966b.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432741; x=1796037541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=JK7SjlHShqGKrK0MfBGja0a0+74eIVz0GikP/sp5w8+YnuWmehFbl5uiXQUjtJ5tiv
         tW2CXRUpyk7pKWHsifd/MUE+XHb49uhymcmyVz5d7wqN06KCa8HiFfLD+tRWDGplid5J
         lnDwwrCR3VsKX3Yxc16haWUr1L//I9LYp4XX/wkMBgZGlsyBf84J4pwNww6hnyGnd+Hu
         zMOgQk4NgPVyI85Hy+cZCo3R8HqtGjI+EoM7xtjaSUqiTDPi9nbBeaWxE02L6A8QQC2S
         ZYtQ36mx0ABEdHAAUuiQiYaBuO5AlXK+BFvFoojQxooRVUvAtKnl13KkH7qn6sxgkzAT
         jJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432741; x=1796037541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ8N9lrkCBm6g5O+8A22MhXclICDJr3w2WLdfhFanRo=;
        b=XUtqGEy6sFEveWhD6UoOn95wpc0s2bR2Kxaivs9Qgf+F/ZS9l+gDBF5X4myc7nBxXe
         e20Q4dz9CaSC0BkgcDPLFA0dYufxBAKmkjvjVvdJrHh2Q2PailkA6tDKzTZyndMw8jMI
         nIj5udTJx/F1QzZhQEspv3kAf8bjl+Y8eVk5AkkCoqAsWSxTZtylHqLTi0Qty+N8Hnm5
         OQ70ND3AvkMLt5hQV0tGIprRpVMI77Btoy9dpv4qST2JYmQu/YKuAcNIOPKXBTNg5Mep
         +JvWuK3qsc8QhKda18v7+TYUSiexEKnnQnEyWkthXmmf6AVO+HCoNIK8ZOnD3kmzjaP+
         Bo9A==
X-Gm-Message-State: APuU4Z9u8AQE4UrEmGFBFbLTTJCZ5yfPI5NamJKSR1WZbA9qQHvFeYTs
	5B4nzilVTLa8S3qp/YoLqe1+jHATPF1whN6Cc6CVx4aF3ovI0ANPuq8p
X-Gm-Gg: AZFdTZcgdouXxkzE4FbeKGlX8YnfvloecnW9juSTVoHbpSbFogl2y89+7v4FpfRT6fT
	tbf5hJartb+JbAyYvLY95gWw/t07r1eqqf3q1gCXmlCCBqG1tJMgYtfYxt05No9qX+c3VH5CreB
	E0L1tnmF1ZLGeGjp+aFNTkBmCTckqgtjkbg1xFGpM4XyF6apKkLjXZvagIaHN/S2qlm9mfDXoYk
	BPM28CdwHiZoX4DVareNqtXNgPfz8Y7YELmt3K45K53JhS4GZKAfcuQk/wFyEr/xFYI2y+9qLoI
	2jdNj5Di/dpaH0DYMJ5xsl6011gUfbxKf8BSJ9vAl9HgcinvtUloa+tljEApoKXAtITwmxjZF30
	sgX488pq0Myir61cbUBadj5AblO+wxMy51bm8VMXLogUB6IlKuknsSPtXS2/bPQF7uzmk1DgurX
	HNNU7pq2vdVIMwPM3qm0cRKpx4lqpp2uOLFBIDXFalunVcgojCXylLklq5MgUTZQ4ghuTWLXo8t
	fjlB/dF+Bmpm81yHv4JYUxkfUUarzwIY0MKQkuRhoL4KGZe+dU4/2aSog2n+k/usaM5mRCTvOa/
	Tsv5ReRxhrZrhYX5Z9JJf+LNxWMA1qF7rCpSLXWymIZ0I5o9twQPE/JEnTfDzQEs+g==
X-Received: by 2002:a17:907:3e1c:b0:c51:53bb:8d70 with SMTP id a640c23a62f3a-c5153bb8ed8mr586385266b.16.1795432740595;
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:34 +0300
Subject: [PATCH v3 1/7] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
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
Message-Id: <20261123-initial-mt6895-v3-1-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 26f096587631..13e5c31cecba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0

