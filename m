Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7340843553A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620839; cv=none; b=NTqueFu5S6tFxVSliq9FFOVLydGB/E2V9RpayNrjPK3Ui2SrbnD6N61L3UyUfTys3JSHjX0sFH9wIXewAVIzPu+6hm2zu4gmvBR64+64XU4EQolfA4Mdjvm8Hm/kqZyhsYJsQTrMfk/08R10TS4npgJ5CBnlGHaZXUkhVy6Cizw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620839; c=relaxed/simple;
	bh=J+hvT9djKWEh2KaPq8J1xxPp4lqSyqlDt6JIH48cZng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fgwzkg3V1p3xv6QQK3UrdYBly9EDUAIF/OAQWefiVpn1LCZicdFFb0MLXvdajvWHjUWzGYZV7Swin0s8WYiKafysy/30vZ1YVRTCCYz61pKCd4bkd2Us1JEi14zlWv0K+8i547WyOpB0ZRwJoDTZrZbdSIw8mxSrUgRZUTU4sLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=drzpj9hR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="drzpj9hR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1c24ec9525so29532966b.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784620836; x=1785225636; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=;
        b=drzpj9hR+8LgfzMcu73NhgEfjKzP3gl0tXN58zwGDOTdDGI3CxLqJaTF4N3LL7Ifaj
         15rMR+OXIcBBlGGVrLYFeL7ujfVXfxGf8joJM7o8gSeEWxIeo7hvwXDQAzKL2eZdme7D
         c/mVewkD/03KNDzioH4S0jOTLJXQpidMojI082tnDwCCDkbR32cAN+cSJTs+H4SqDKTW
         R5pw9c74+ebRnU0b2DNEoIEtqbU9zJcx/e4TMQ9Vv5RYOxIe9wmrTrNA1wCW+V2KO5Yx
         js9NoLoBv+Y9MYhQ4ypUXVN33qArSnwZbq45vUiNtRO1krAIaxIo+7vcnOmBB1wuczI7
         ALsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620836; x=1785225636;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=;
        b=n4Gzfz7QSm+M9ErmBI/Cr2WIvnXz7nl9XBJ0K8K8KClMCuJD6/sixL5IUEF6FE/gjo
         /aNbFFxPAyq+5WWLMKpKNeHQumi9PycCkBosqFSPGO2sw6M2APxhFuVEYTSfskE/CH2T
         jllCGwSVk2eGuG49LzRnyz/ZDT0MQP0ktTMTLJM1G46mBK+/uHUpc52PC4SqeZ/gOGbN
         fZ18Jh+kATWCzQaJdtEQlgS/3E3Dh3r+FV717QKNJhJtyOiJTiFcviOmrGXsjD4UGoI1
         Qr8h91aXULp2cW9B9f9MRzJGyw0TLxD0zHW05m248nDyGqGI8aa04Lh8o9D4gOAxIQ4N
         k2+g==
X-Forwarded-Encrypted: i=1; AHgh+RrHib6XI6yXVgutXGZmjuUqeOhsZHN4oe0pn02ejavusiiYHBTbJumL6DqHoLVwrhzitYZIyhLHrKaE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1sXNktn9hdch+dZ1IgpOsz9uKW/7OyWuKX26gk+oGncs8Rm12
	v3yidK0ZM5V9v/bPcLMTnOksBkjFlj8TvqxxUgQgTBodK6BoRe+iNhzDr271tJNV7Ds=
X-Gm-Gg: AfdE7clqikFH6CEncrk16izx4PdzkOZgD94522L5HvS1cYlnFSjF1eOEe7nZ6WRIgkB
	4MJLbKo3vzBuNFduc03dtVaFcHXqVNwFDiYLPrxriqw8wJDbX0CAFCgjVmU0uuhu8qUe+SbKWQS
	kfEhINIkbTFr7XfcbvSt2C7H7v8qNQhZmmmTPUdf+/Gmb8Ra9wo/5S4OGQ1irIWkpANEHmLARvT
	AUONHy428GYzDhlkY4xHcxrOlhiT4QrbhNj2FYERfUmdmVUJ9Q42JJr8PicRvU3z80IpjtYM2xY
	g0GnAdJGrRasAvgza+Y6Un95n4cVhnNt2PW1ozBUdF14zyyL6fcpQTJ5asgE1RL20blJOcQ+c/U
	jU74rlDdF9oqvvX+3Q9z/3jXK/G+QEFmN8SwP/5zi/rXDurv8nUv8T2TDqPuiAcl3x86GlClfU3
	XFmlSGDi8KPp5DSAr0PMwm+rzAd278fnNHDvknU2n0tM0AG58px+/ZbKzaKlq9iLGzlBhfxw==
X-Received: by 2002:a17:907:d09:b0:c15:e04e:aed4 with SMTP id a640c23a62f3a-c16b47e6906mr747823566b.42.1784620835539;
        Tue, 21 Jul 2026 01:00:35 -0700 (PDT)
Received: from [127.0.0.1] (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1734b1918asm541895566b.43.2026.07.21.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:00:35 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 21 Jul 2026 10:00:28 +0200
Subject: [PATCH] dt-bindings: usb: mtu3: Add MT8512
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywqDMBBFf0Vm3YFMSjT0V0oXSRztFEwlDymI/
 960ri4HLufskDkJZ7h1OyTeJMs7NqBLB+Hp4swoY2PQSvdq0IQhuHZhrGsuid2CS7GGdJt6RS9
 xlDijUdQbb4OlgaCp1sSTfP6Z++PkXP2LQ/m54Ti+6Uvzw4gAAAA=
X-Change-ID: 20260721-ccaione-upstream-mt8512-mtu3-binding-50165b8c8171
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2

The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
register layout and is handled by the generic mediatek,mtu3 driver. Add
the SoC-specific compatible so the controller can be described without a
legacy split node.

For now the only user of this is on the U-Boot side but we want to keep
bindings in sync.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..42da2c6dfba1 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -29,6 +29,7 @@ properties:
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
           - mediatek,mt8365-mtu3
+          - mediatek,mt8512-mtu3
       - const: mediatek,mtu3
 
   reg:

---
base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
change-id: 20260721-ccaione-upstream-mt8512-mtu3-binding-50165b8c8171

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

