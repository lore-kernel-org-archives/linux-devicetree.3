Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078520;
	b=ndW/0mwWomSRYRSPxWq2y+Gq+w+82rKeMWuhbGKKqvHkoCzbIPeXb/xcL2GewAR945ix
	 Jobhjw4ZXlby5DcZY3Z1TwAGl4aOv1z52W0TIVCFed/QKrSOCgzjnT69EdwMLyleC3OHi
	 PZAercRHxwdjpHdXgfv8/QsCkA3/O9o2Cqhnc3BF3s2JiELah/jMrgDFIKwrrTl8ZDJJr
	 m2Y1/y0XN62USA79+IPj6+WGpQYIM1+p2nudAHynMVY/h+YFidQ02VDs3PdJqAqXj0rwi
	 zZ2zAElDHjwi2g/i/ZyGwJlK6NpK8UWq96zHIlsA+krAYSul/xC9M4Ye1r5tot65Vrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
	b=gnDvVEK/0GEsFf4q4qRaHbQXHgIsHfGib0rOTPNC0KHLUILzH1d/UdwNgPoFQu9/Yxa9
	 +xnw8CEAz+f/CKRkv9Utcd0DM/+phwuJots8FC8WmX6Xden03xTIJzMCBgDtlRqPD5fC2
	 0pKpN6azSO3JFsbG8URaFJ1Hsj9IahpF5ODy1Owb+gyDBQYcoFTuVhB+kKHBPni9vJKaL
	 WlY75qkvqSqkb47P//pMkBqsS4r4btk8BPBBPTJaJnwaXLmmB92hEIbx79Rao2I6ui2Iw
	 X6LxUsaricIu17EQD2G6G9R1oth1/kBCCnGNxkOwFP0hKREW4Sl1puStL3J+Q/mAhjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jj/4h0ba";
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0CE606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0CE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jj/4h0ba
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f2dd5dddaso18453856d6.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078519; x=1795683319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=jj/4h0ba2GI7PBf08fUaVw83oZ99sKjo4QJKlNsof2oVwrQWhdpsJnaqZ1Jcb0jBNv
         71x4KGFq8P3kzrQi/+tbRMcy8a1KZ1AuB85M23MYvY0TgmotNImCKCukd2RqNOWQvZqf
         PwpVlR0fqCiWgV7NwVOzVopk6OtcrbkKEdKWsN4QB7It6j1qCKA5kTBdTVwCRdzZTN0j
         kHCZgSw1xq80Gi/33+BLps8lYkCbxS4GzXhEsnVBYld6D3jP0fIq07j2EjPbjysHpnx5
         SPdS4+o+CaH0ZJZZAFg5IHcISmoMoLqLjl8ogtOSWjVkdz321Nm3eOJY6uUmV2nUjaff
         r1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078519; x=1795683319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=xHGYl0Sfx7yk8L9YKQS9bn5jp9dZgXfo2jNbN62QzeVNe8p/9lhCRCCC2jBQZMEd53
         Ml57+2CfsDXdoRcAJeFzJ1xUvJUzn34ipNvl693KURLO0ElrZyHjbsMnbxzpv0xTzz9b
         0J67j2pli1CwW3pxDOXLZ2gXdvuwVyhbiAue22Yic6b5qwE1HIC3yy+uhaguqF49cR7C
         LYdJyPUJAoXVf8d8oi8fTcCiy+Ron+6X0BDit6wJPych3+L26WvYoNx2aJ/9/TRON96B
         RyRwG9YdyrGaYwvJIBExKHarGB83Tx8pNt32NORHN+Lr3OxMRss9EarmrRfoXQOdM7xM
         EYDA==
X-Forwarded-Encrypted: i=1; AL+hErFC9Sp1ZDdOh5FBO6xyUA3MPn0XXpsL6VZ9GtB5nPlwD/LHEQ40vo56spV5Z6MiJs97PGMp4mvuWNYf@vger.kernel.org
X-Gm-Message-State: APuU4Z/nTXJBjEjeyHBCZgUGPLWlieGf13KBHnmmpuJXSVmFh6dDIgbl
	FkoHIdxL4cedzZ7h2tQmbFPU3Dr4AMl0qLC92GoFgFARceNy5YwQf6dCQNDtmA==
X-Gm-Gg: AYBFou2r6u2wk/uLO6iihevHf7J87ixWoQUDsxe9OtvK8phhYv+UYduYRUIVaFFlJtb
	T2W5RqHHfHV8+jl+BY9f6yBKk7sQj0nWB12MwO1x6H9Jrfjtr1dlfvOGoxRwYWY0CBB3zkkEljO
	/vtRbmaE9QU7djsKIPg2D4uDUXyNS7QJCbxd7x401FewHhaKr3EAU0egotbzFoWh1y8ZVmqS6KC
	6kMolrTJpoZ9ZhYAK/1kjNqj8nClWfNxbpeNWGRKWnTdmx0xCvG9UkQlMR/2GGNHnVDAAEJlEZk
	H0Zl7eEc0lbRGOiWeYbtQPrxrMTZXespwq2pzE+kixcHzBQvUQ2ZDTLO/Q9BE3o9hwYDy/uX3rD
	4pevdveYvP2OzXma3Iuf0A7p1TNFG0lzg4ge9BCO8ehRvTysWm4RO4TS6JBkQaxYGFLDvCLddjQ
	yy+MICvUzK/j34pMe9Gmo5pqeEC/XmRfkmX1WCUNL5knbTLC3ZAunWxwp/aCOzez5w6dACULitk
	B8C99XEb4p6KQQUNTepTjrrFTDFFjl0kIyc1+eCcMlKNGoO/MOs6ON0vUbI7gmehirzCAS9umh/
	oqs7c2JIsyly38MLYITlDX/pKgItjGcesMXwjySCwQXGEU+E+0rzSigplYFUJcVlLYSEI8K2I9T
	pC8/lxwLrxf4BVvQ6ELxRVQ7wtr5TGcl9cXVXoGWJ4mSTkW7vnbRIgczLK9FVsbZxaZtSEMfN/p
	WBoA==
X-Received: by 2002:ac8:5d8a:0:b0:537:af9b:c73 with SMTP id d75a77b69052e-55d5a77052cmr82666381cf.55.1795078519274;
        Thu, 19 Nov 2026 00:55:19 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:18 -0800 (PST)
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
Subject: [PATCH v2 04/22] ARM: dts: BCM5301X: R7000: specify switch
Date: Thu, 19 Nov 2026 00:54:34 -0800
Message-ID: <20261119085452.75708-5-rosenp@gmail.com>
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

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 6ea845f3ac1d..65affe615bb8 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -118,3 +118,40 @@ &gmac2 {
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

