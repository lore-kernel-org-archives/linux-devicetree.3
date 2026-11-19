Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078550;
	b=YbNwJKK781IXqV96p2xEc+hxjisABTA2oWvcoVLw/19e3TDJ3XZcUfyKps3WcEQMT/Fe
	 37kmfDuH/GkSJRp+9BLGtIDZFwsSUjkliobAzmpqHQvr1SgiOlOF7sPTlV0j+GbeKdOKy
	 n7Thk+3KNYP93ep8frQQTJ/2g2gi6qBwXdv20MrGyOqrZlqV7EX6T1ws2r3jXMbD4GXjw
	 KrBpeCxbuQxpyHpQjjMO/d5XdL3Iv9LJCvdQxXu943YN4mxHmTM9BmaiqkLfySGoWl9WB
	 pei0AJ3YGjY7WIL26OtqJIDspgRep7o84ZQvR+fWW+OnBkJjBk4wEtoEmCwJZfsO7sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
	b=kagjF3EAhzEQUtbZs/0psFdomxZDwKwSMF5g9+WRBEKXzoGCMSJKvY7M18rpuraTQ8HK
	 j+TxLyEaQmQqrHQedMmbVla0ZfufDLnMEQObhTzhUMn7N/3EotT02SyGlaTWnpX5aY4O4
	 eHN3UXGU36dMJLVwkmbemVInWQRD1H8j1behnzjVT2PEa2WBp3YtfPZzUSu9nrngJy2wn
	 +tedEkwTpxn4GIxLgiM4r10aEEoYx5n1hg+CQQ7FwnFXVwe3+mkDtPrF633SrW6J0T6kO
	 Zwjuc6pFYd8/0Z9UPAAH1bf6X0+IFRPw5O26Se7qNL3+FJS0isO+Hw85fOD6OVAgI5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPKVbwKG;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B543606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B543606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPKVbwKG
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5364042eecfso24238351cf.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078549; x=1795683349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
        b=BPKVbwKG53wQZHwi8h+ckBJXbwAoSOY5htZDRk1qKW96yj2VUWYqMV5bZB8c28C3gA
         8D8lnB88UvS8KlyMm2qzqWmm3VNTSGZmmEsBxfnr2BZLw+P1ffdD1VytBqhskbiOCi10
         rGoIIlnFQ5K7a3G0/4hai4plJ2WOpvlCpfSGpG0Vg70/JY/y991nBrRiL3+NB83wuzej
         krs+5rDFmBm8CZbf9tguSsfaQ8Fmfstdda9WipyldFrfl56KzT6+ugD8UMzJPtUZqRKX
         zUIYv/b7CPVjuaMnVGn5mkZmFT7iHbpORLDwhZVwhG36/Yz6mZE6tSQXhKbp2rzrNvOS
         mJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078549; x=1795683349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
        b=q8+o7XdJ3sU0nrdSa8p2blmyz5U3dt+QbTSEAMFhi3kItwlfzPfB5eWfjSMw5juLrA
         xc8FyY2aVrPfHw27gm0rYr4eIzRrfvy6DqOdIyAmi0Jo+Vx0W1wougdZLR1+QYN5oOUb
         A7v2cUPTDEGH8eexlvRSEpB2vK80aycqvUfagGQLm67xlImLIBmMIRThM200rFrJ+B4V
         mlLOJCNxqD7gOCsfbXAZlRFOkhGLSs2rUuU7nCjkt6yj9E24OnavtceNSEjtQhOEm6+F
         hg6e0sPCOUEoSYsZ1BipGON30NRgfeVm5IH3ybbl9wvzNkSXRQ50NbHH6Lh5YN7MKVN+
         nPBw==
X-Forwarded-Encrypted: i=1; AL+hErEfg8XtwIuDsmlM/J7oFYWffxv4eVg6WgigoOFa7alcMcfQ1UgIdmAYGcmEnfJdOdYg0Q6/nA32TEqI@vger.kernel.org
X-Gm-Message-State: APuU4Z8AzdN8DOOdP8dlt5kJ0Zj/Mo3/BdMbmRowB4k9JKnnl1W2Dp3K
	fnxftpzlDOStJPssiHfM15K8b6DndUv7sg3DRnaoGXXeGsN6h5BvfFJb
X-Gm-Gg: AYBFou244bbVZBF3XCaTp94gxO0ZOW2wXHU0eXGVPd+Rc6Mq23L+oaP92qnKWZacjls
	oJhSCsLpYgXjJpxTCkYJXjLvTsqefmylTFXW+B52jFdFpSscXjehkSUsgG5We7055aXOSiuafGO
	TmbYkpnsGoqKOlivmzGfShWkkotr2SFJbfAyFH2KdVrS+YIulcZTHj8q+sr/HrHmIzZi+ItUVeU
	MkwsVdT4b9JtgYfWxn0DzZna3lTlhOMl2MFnnvJLjwOulRkNAKCjURBxnfVGSdDIdYg7xIGJXmL
	20AK9jnNlPlAFXjGHmOyoKYGBrq8Q4oUR+buyw6yrEokwZ4mTbNKByfC7B931nO3beWWM5noRzr
	7bLSTR/MVXIFoRVjUNpEkkuQl/Fzl9iQwvmApL1u38cXzuoFFcDw2HyfRdOKtxT8W6IXrQ/IOVL
	kSwrdG0Nhqjl8FzZ2alBznS+8//pP+LOepRu5MQbHL+sbMc3Vq35TTjFicQa2p+bvDZ3fb4Gg20
	FpSA9vfeJ1jwdzHaXssJZLSUKAH6WzXFmU92L50YtopnxtpEheV9Rf68FKwHCP26WgjPnv5QkW/
	Oh6mBg5Q1fo0qbND0SOoQOJrzEjTzbsCoUvTPoDksLYrh0yaFRBjxhpBqgZrfYWVWDPdoKk5eLj
	HATkry4X+NiAfnbdNM1EMyb2NMs1g7wHNwYSffhffVMozt232FOIJAswqY6cQdkupSYg8zXqsqw
	gbz0w=
X-Received: by 2002:a05:622a:418a:b0:536:72b4:b84a with SMTP id d75a77b69052e-55d5a5d835bmr88430311cf.42.1795078549291;
        Thu, 19 Nov 2026 00:55:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:48 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 18/22] ARM: dts: BCM5301X: Archer C5 v2: specify switch
Date: Thu, 19 Nov 2026 00:54:48 -0800
Message-ID: <20261119085452.75708-19-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
index b6a5886698b2..54898849b87f 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
@@ -111,3 +111,41 @@ partition-file-system {
 &usb2 {
 	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

