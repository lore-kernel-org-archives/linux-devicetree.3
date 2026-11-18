Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980903;
	b=f37tydQch1lDibxB8Sd8i1xON4whiPl71JK8T1ZyMsG+qKt3KXVneC0SCknPEBhd9LGS
	 0SQ0Q9xZgWir09ESFKvrhdXf6UgbpY1C8CsZ/fl8jjfwJLwUCvJ/XRsyTY4TL6TjwVCW2
	 1Ne9XdxPWkEPqlBFCM+QMhqWkMgByTuDF3ZabI3s17j+LW0MTggi5TctfY2iprXpbtw4j
	 PSipcmjqoVEya69CChK24plFuhJg4EzoodLGNIuQWMCcFfnPn2kdRutJS+LlfjlryTXza
	 7AkGJ1DPh6vGkwD2oCkaMIXKjzFA4UrxLCp11FGtHEGARGRD6EwoX2GTx5R829wrSqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
	b=Cc+icGcOuCRa2/KXdr8x60L1H2Iocypj1py0O5FSvL2tBCpb33CW0+k1WNEvu0pfAyh0
	 VLht6uGrlhWBTYBaUHpd95lSw6Srej0IkfCOEO71fann+A4pRAf0hA006M6Pkt0e4j9pu
	 WZ7muk4SYGiOPw7+ve7BJTHaS7Me2BwZWf/UzBkeBuu+Vc1wsY3pRilzxtApRu35lymev
	 cQkQlyBIxMXSRk2ycxPTwI6raMTyrvGA7bKCVBblAR1gnL+jqfuHlcEXqC/ntKiEWMS7r
	 t1G3nthy8K/nuqeSeN0WH8iT8MkSpIDsdoGm+oGHaqV5AO/vLonYzKNXdEV8jif/l1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G38Lcjch;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E0D606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08E0D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G38Lcjch
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380c28f9e35so1894270eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980902; x=1795585702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=G38Lcjchdv+hVuPgsEtn7yNbA0x9WKZfpc7zTf0KcUxdjL9RrAO+LT5t4KCnXEiImi
         PaM1GckfSTb4TQbCyqQEP44bPVskXCMqRp99nkzcsueJ8pCb351zDU6oLs7lMrT7VJ/n
         28BGNA7GSUY4gr/f94MYkYFA44P0tBgnBbjGg/rH3pwp4ifzxu4psrBLIQtVQT0+cxIM
         s/yoo6nObTPT6D3OLvUKBZ9UtlkU2Pb65dyIlswkhVSbXIBEU1B0C8MyWAHa3wAo1I6v
         jqw3AfsV2d8SoTIvP1Kf8gYZfhjinmx8irog5+NaTmDAw8XNbpJC+gNryeOb/dylAhZq
         vq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980902; x=1795585702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=FzPth0UVsIEKconOQqD3sgfhR6JThqdFRHV0tOZvMoEuLDpI1DKfZm69N1r9uM+WFF
         NdRDO+YB4uRBjAIkDCK+dLqXGVf1Ln5cnQg36v7mNPKTA66jdOmKuKDz/DNpI9/rd+Ug
         yQ0l5mgiPl257j4cRIQLQxBI44qsodh86hqYB4LoXEIajdaIsG2kp7Jgc9/nszi+ggxB
         VEVQSg7vRnRucPF6bRTiZoCo0jcdubPvppnwR1TxivdtWZJTYv2xsScV0Wu0o/ZkbQUa
         l7bSS3MCQBoYQ5/fkpuLW51kRBP4ddkJ0iP8DuIm2i9MaJ1dSA7XWOaw678Qz0dPtkG/
         Tdcw==
X-Forwarded-Encrypted: i=1; AL+hErGJC+IFM0sE090z8f8eb+Phf4qzvW3LjyNvVMKUYYbeTe9uq2kwhWL6iA7glRCi2jf1Fci9dyunn6gd@vger.kernel.org
X-Gm-Message-State: APuU4Z/aBsET/TBukzYD5Q0CqL7OFsd06V9X3aNMIzv2eko+/kE07yVt
	x7Mf4fn8NbGn358k7mWrVvU3DiD8xZOP//ZCT8HcfWN4DnB9xK5Euvxo
X-Gm-Gg: AZFdTZf93/t9/YBzqaJZA1HGMOrXtjVXXZwvRR9y/aKCuzkYL1PeW+0NpTXW9lpdOhi
	uOq52M5KWhoLyLCMzbDtMNxtGRUp6x57w51R3rCOIg2CYdQBQrnYCfldJ/eEZgP0HOLMaZM/LzM
	mi510rCM3J/eE62TqDx0QtgCV4tneQfLyMGxtcrH9ClyHzKoBLzpWLs5D9qEw3Q3HqIYAvaKfXQ
	i7bfuWvO8XjVlbqAZKk7/bpzkrstOtIgVt3YZBxajSuqg4OG6gnvI05q2GLbMmJBrEqxt5TFLrE
	6rJJaJLLZnN2AK0V+ouvpFzhTfwhuC3Q6s6F8a8yq8ewrvs3Hqb/B9aNPrqqLXUONdmHrxkZlua
	B2AlkrJFDNhj3RsL02oJQog1D7LedWbhRZ+D9xthSUhmHOT8ZFh59828N2qnSnt2t0mk/A/KbNU
	+LiufhixQB9zC/pqBXegPpe8TPJNYf+JoEi8i1yWd4otnJl/G3ENicuqFC2BQlM6cRwhU2QZC/z
	OU5F0flUHY6L6YiFGKUKJNxzBUZVHFLqK/DEDsvDDjuUe+pjPbB7Iqq1Hz4RO/Idw+ok+1gAYJ9
	ErLAHEDmn8q/GuD+EzcZ3JLB5vTsv+7/HpmXuv0548jtTiaS11NprxkSw3pynOrqqjnPDGYXXtu
	/pj2M97Mi+wpLtkrwqK8CVBbN6Uc4chPx5+qs6AcsYcxnp5jRbh9VTmexbq67HmmU/tptUVXIWF
	4/oMEyHPsTKxTGSsStH0VPLgY=
X-Received: by 2002:a05:7301:19a9:b0:376:c208:ed7a with SMTP id 5a478bee46e88-3810e41885bmr5387822eec.8.1794980902102;
        Tue, 17 Nov 2026 21:48:22 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:21 -0800 (PST)
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
Subject: [PATCH 03/17] ARM: dts: BCM5301X: N18U: specify switch
Date: Tue, 17 Nov 2026 21:47:44 -0800
Message-ID: <20261118054758.132233-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
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

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 5874e6b606de..4ae4e2d00b7c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -91,3 +91,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
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
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

