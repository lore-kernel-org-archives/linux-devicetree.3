Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078543;
	b=Pau5W0NAu3WcbOG/MxZVG9Ej4lbsWI8iNWqQROSRhNyU76RirFoVnmYLIEKY/APJX8kH
	 kXn3/UbrC5MFEzaAL9MZ1P7c61oBTbxRrwAc6zjbFFVLDT6dJfPBZzcMBl7J9t6Q26Das
	 iSbntMY4pV3EuvYfiSp334HXgDvaSzQfiy1W78R+xdOHFGqcjNOQFxqiN3csP9Q0jZTz8
	 ujiKwmbypuEqu/KGw0GzssrdcwDExEBRz/iMJ1rI1b0jpPrhNFJ1OeLBcuNZmE4kXJZ/Q
	 fKUTp7O37JBJhp4ox4m4YSjqNWtZ2UqIyjQ5A2AHRIeaSyIGkpO2tnLNAbW/tpddZQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
	b=xBEvihOk5rmVrfmAjZe3cgJj+QkG59QAQbYxiMjOZ3HJtm9v2we5Gfcncvs0uAoK/UMr
	 e33wQmAfyEW4qwFdm3SCY3C+izh7dK8j7+hhMOt4DDo1A0y7BfTu3GGcYQTIqDvH2d+dG
	 diPTaGP04XDN6k3Z/2RLaHZmL9pScfEeubgDyyyaALliY/nZMrsDd8Too35cxs14+NkZQ
	 0mRmjzy+k/GfQ/aoMC8WWhD4GhB9x0l7Z4XIeY9xm7LDixBihTUYanWeuady0BxvC3+LH
	 JmF6MSRgTlsVEkHvMbWI849aF9AyoXbaz+1ANQ4IbESmAvMBkMzQvK7xVQ7svD6EHqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pg3Fsy9P;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889D9606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 889D9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pg3Fsy9P
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5365d725440so19004831cf.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078542; x=1795683342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
        b=Pg3Fsy9PEkCQO5tGFlH2kUXuAzS7W2eJkVtA+5w+EBjcIvt3qkhkT896SOmbTSQuTp
         IOvg0oZkZ8R2YV9Iv34+jqP8KbbjxrToWOnnBSvceLBjyaQuWNZIumB/vP4cZDNgojni
         JsjLeE7GP6CpsSQeUosGpM7OnGyUmNPfwFNXTMuEpokMIVUPlScy/0z+G65mbh8fn6MR
         CTUvwCmJZ7Dnzz/Q4dRj2zt9b/Z3ndVCRR3QFudVCKEGbDBcevi5WrlQOgt1o+C+rJCf
         3xCcVub4yr8pzcgI7tFDUeROYtTxbuD5r99/SVra7nfQmVSP7wqu7AkdqZ3Z3EF0AEYI
         8eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078542; x=1795683342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
        b=O9Q9PGDHAn3sAWeCR9XuHzkwcvEmHXDAwVXfBbQpVlTeaxqF0dMIBVg0VWg32VMpER
         dcUPpUoPaLplkBaCY2Ic3wJwvG2MNZkcQ28d9VsjHoihcbeaGrTyILRgqridPTyJffhV
         5O93q8DxIjfoIQ5fzJCueTrmUOsp+wMkZsXfCW+M6FYEhtZON7gPpy5nqVDb3xaos8hs
         at6fW5+WbJ6QSa72j2s8DdjB4VYHoEwoiUMS1CMHr1QFFXJcXrhmSFfNZGntvoz3KAbH
         ukEU8W7aYDOD2D6lFAGxaAJg/5Ei84qEjeq6ewMhzD01SGNCpp3vJ5+yGXpm0nqha9tl
         IAww==
X-Forwarded-Encrypted: i=1; AL+hErE2XAOmh16dFKs4AOKvu3Lgztcuz5cwDcSQ33Z+ojy2AQ2vzQOcBc4RpafuaOzMyoszpTsOSJTqnLN6@vger.kernel.org
X-Gm-Message-State: APuU4Z/UkgEUGOOU9CaggtvRSs4WCDaHsOEeJb8HRQxldYhl+ewIeZHD
	9aEwd7CkQ3YgioFsWUCR18BbS6DHUNefQUHDQVUvT5xBDw8hiKuZx683rfalXQ==
X-Gm-Gg: AYBFou1ELI2/NeMQUHxgXDQM5WqQH1N4s0ZCttgeLjNDt2XJLTEK4wLlbLS6nIXjCuT
	UZjRO1KiGh/uiaZ9P/CtikNhdLL3lbGy601CDlUn2CTBGtNQcOeB7jIPAy65dJe2z24xG53GyiD
	RKV/AutASyRi5LQ/ro5sEhZ9UieHdgmGAiwAqsHxSxuLl9RxHlhDHJHrEoHd3/DB2SuBtF146rF
	CIlm05xcyzXegdM6YETw0kVY6thN/76MU1I9gVUMl0ZEQpboK3z5nNCWc4o1iebGnzUyrdDzFGc
	E+DrMAb0ByH5DpEhcRxrDSamz668S0elojZODxFZmH1jGRdgMfo7gfUjF+MRgfxACBRzBghYV6d
	K9NvnRiLujC/NzTP8hI+BNqizx/omKY8D4iP9kuG+LMEyu2WNo2HDVsloYii9vAq70SKg4BM6e4
	bBfAhTeDrFrIl+aeWchK3nRbgUZu/XfLr7NTwDaBVbrYYYL5jjewArq5KOoaAHs8X0X4245W4ND
	e0sdhwnx2tuMac8qVdjcHcm+79561GPP/jEBYA7LYkP/XE1otVwu9J637EdEmPl/pqgJ4rCebUS
	wgLF7m4IhGC4JEtRiTzV8mt9H/aYiaP54H+nfZCjlVRxcRsh653eK0JZw2z4Xy5pT7Jbbm7x7Y3
	6oPqyX3CCijY//ZJEaW0bkQA2WSgAuO6aXu5gaN41s2GMbqZm9u5+OY+Ngsub74T6a+wgkPoSlF
	VgiA==
X-Received: by 2002:ac8:5a91:0:b0:55c:7769:9a0a with SMTP id d75a77b69052e-55d5a3224bfmr89023591cf.5.1795078542397;
        Thu, 19 Nov 2026 00:55:42 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:41 -0800 (PST)
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
Subject: [PATCH v2 15/22] ARM: dts: BCM5301X: WZR-900DHP: specify switch
Date: Thu, 19 Nov 2026 00:54:45 -0800
Message-ID: <20261119085452.75708-16-rosenp@gmail.com>
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
 .../broadcom/bcm47081-buffalo-wzr-900dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
index 7655e4ff2d1c..6cb27ea2dd94 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
@@ -107,3 +107,41 @@ button-restart {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
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

