Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980904;
	b=lJd7HOisLFK1e7is1HHw+QmwSPXcZsQs4czHsfsui09Rav6GwnDiy4YPeN6Ev5+yDXra
	 +wPRUN9zUoVSUT292WbnBPyP6sVExGTma3rKijwmRzowymB5aZxEXpedq3hVNF7fMAlQ2
	 lmr6fFJ4V1aZQJIhhUYaJMB1XCHZ8Ax8guNFrfHNtbZ8Wibw7AJCjWDV2/nVLqEkspBx2
	 at05EiO4g6umz055sESYF73848jSOzF38WaP8YL4X2vNyLk/KyjR9WmqLVP8Uax34l1wN
	 hkNeKNkt9kZ/h7rFOCWwDAeNWOt8O6sVYO03X142tRzm8q8+enPBiZrzlkKY28Oeung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
	b=AJHHjTkgcheqn4syjPMSNdewCN3i1K/+5awvse1/+ton51TxL+G4DGvl4jQyfTXur0YF
	 fgAGHVNGjA6iLgVnyY9OBLSEDqQt/1cVsc8J2ntitX9ipLpX04R1TvWippTNUd9jeR4vd
	 Ny1iOyHl3QrVLBDFB9DXN6g2X6lgToY8IkhF0kXP9DI5gN4vxLI9vmq9j9SPwYrmthIF3
	 B3n0MsaGGnClHkfB2vsUoaqhBFPvSDxswUp1pZbAEby+7T1vq/90Ah8SbdEeA6rFpvgSC
	 wuwUK1wpD8jmMiN4bp9mY1wQMPM69jvMGrF/9aqERTcwzuLTxR6xsHlbQ0A2IttMRGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1sllod1;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574A9606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574A9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1sllod1
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so924779eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980903; x=1795585703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=w1sllod1PSFJous6Z7vBzZPaNOhZcOc0950xl8H25Z1tDo+3Ibhwb1bOw2Mo3eC1zM
         N759Xmp50kBbLbvty5yaCvxF/7ivXX0KZHCIZVfxZ4lXCHJl3evYRzijkzRKqAV7xudh
         ZuusLmrsfz4DF2t1hAX4MMYXBtBzxC4OBMHZfhzjFjL6H09cUZx3PxWMACY9h6LBHjL9
         /VOavCy/8Kc6EADNXojPBT2JUXumQn3gv2E90MPfsSERO4Yj4UDvVVSw6AXqMEZLalJi
         slqUXiZMFpataPIcJpMKhJwbubv53Njmq/mifhSGK7KaXNrqvwjU2mmMKakLPCtzh+ZQ
         x0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980903; x=1795585703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=Ho8kbM37kzy6UXKDae2GxAGOdmm6d23Y2kNyea5ZoLuHAzZ8Xj59Gpbsj3dXHXzPzj
         oqp8fHTFPkmXbylxDjUNPjZGdmWZmEQYnOKPrJlCJHOZYCaXFWGqTby4/zhyaNFjvFoy
         HYDebkH+HWXMazmsRAzj3RBw3pKiJGxCS1L3QI7hIlOTphR800hPh2fOCZGnUxCUTsLR
         5cboQd1SEBRKgLydb29ykEDHB9eCKbGVH5adIJaiAaEeA6DW0UsOEm/mwh2nNkePkR2B
         1hd8dnQahiLzPXYhSgjQCKoiFXiOOoxTWlYbG4mV7hmo5Vc0Sw5pnQVZVo1ixqPa/Eih
         a5HA==
X-Forwarded-Encrypted: i=1; AL+hErHWiVFIX6QPIV5GpXzRxFQWS4zmlxVP3RYC5Y2iT8lH0BdPCnpOXrCAscBqrTMjjl4DClvPT0IgeBXU@vger.kernel.org
X-Gm-Message-State: APuU4Z9djrT4cokRbGfom4+1fXwNQAtaC5+vA/z8N6PULnj7wP76vwwX
	IK/tsIh2QTD96HztK876fy5Iu2Q1pdljeJ6p9dq6wCb/tC+SwzCT2j63
X-Gm-Gg: AZFdTZfGg+yEUM16OJPpsrBTqRdznEIaSjEtMUcjXOx3ZclnzkC1hH2ycNEt553/YYj
	5zouRfqo+TFl8DNukr2bpjcUChFf5loKqVMgiSPD9B2sXTeNDB0wY15kE5wFF714vdLUz9UEf7D
	q8cmGgHCq6Xzua1QF7iPAs5hj2j8p6gCf2GU7gkVy+ll4JPckT4FAwmdv0Dgtdm711UAXOGckJk
	57NrTs6zksM8TSoesULS5kJLtFSd/gPbkZa87ESGZLq6BfENUYaJsEIrKAx9vFMRDg8LV3IlQ+8
	6H5jOdPKTfu2ThczQgfTWtYfd1FyUMAZjQQ1/nLonZW9Rl9CJ/6pOUxmO4Zgdv5GIHdf5Y4gfKj
	gifwkoWaCCR3RQmElmF1m9snmDcrEp57ysHNYp+xtR5KlgSjL8++q9TxHb5dzPMs04EMHkJroNU
	wnfLgEA6OXM/t9J/KnR1LH/IU8xS+jg+OrB4Sb22MSBJAruWJudVtd7YmkyttDTPZ6dqT+igpK2
	sjb1xuV5yo3U338rxrrOjLrK+aCz3EFiJ4cdiKTdiUOOGecA/wKSDeDwXg/NNEyiPSlBK4yv/8g
	Rk3CamqdmUkQETIlRTZ1CHnnUZiwbcZwkSVGItsOYn3IXXvOxXpDyMkpdFa4swFaZOSxNljyydn
	Qg9FxYu3wV0r2wS9QJMlZD1n9ksVPLJsgut+NN/VlgEUfJNdo8bN9cDQd/6nTVbpj5eXZy+FOt0
	OxXXg=
X-Received: by 2002:a05:7300:824a:b0:381:6b5:56e6 with SMTP id 5a478bee46e88-38281810085mr1623743eec.16.1794980903407;
        Tue, 17 Nov 2026 21:48:23 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:22 -0800 (PST)
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
Subject: [PATCH 04/17] ARM: dts: BCM5301X: R7000: specify switch
Date: Tue, 17 Nov 2026 21:47:45 -0800
Message-ID: <20261118054758.132233-5-rosenp@gmail.com>
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

