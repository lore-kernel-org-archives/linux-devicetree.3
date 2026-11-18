Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980919;
	b=IXcTUThLfjJBF7FkGx3CCOwiu2/VSY2p8q6xlifJhmvvfAo+vnFk5S4Cx2xES9e83w7G
	 JGyzdbAqxHyhOmB8kYWyZIcsBD9S83edHxfHvLWVVe76Rs1BPQFrc6MFnnkd7ybWK7Sw7
	 b21FZfMu2B1s57LdkbYwBcRJBuUnnb5Fb35ztVW1VJ/GRwEAPUUBLvwtcUJT1qNbKxCjf
	 hcLzcENQq3HizONMyH3hdjR4R5AyX6QMoXAGRC33FO3dtcMOl1H3JUJVKsposImdcJRhn
	 dpPDcYg2+0TmL2nzvuprquACCsK7dkOSPn8TAvVsqb9Wxi2dyNiBYDSkCU4pYrSsstw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eIFevFDGAP/WEwAEGTiR4DGoC6c6i0A/XzAhuHxSskI=;
	b=Xavg/Ud2q6FK2NEEK0cNdCfGA22Q4ufhSVvlYjTz49aoZO5Gd4clw+pIL1I/HcLjRAb+
	 B7R8GItQUKaTS8Wau7+AmtB7nAVvkcE94usiIklwZuEgwXcuF2XzhWhAtOQtLgtWDxJQb
	 PDba9tQuO54oU851vWxBzqq2Iy1PQg7NbSt0eog1BqqpkV7VsJLH/cObw9gcgrjs0Lqgm
	 y9kXAKgT6oAf7TQIoKsD9hSES9yGJyr8a2OsHni7bJakYVwa6Bs1tZh5bSzWL7QLKHh4Y
	 yRyJlD5ym4c8r7P+LRLgkF//D8B4l+GIi0v+oSVDVNA3H04OArB3yQ8k4LMtNuIXfGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKWZWQ7s;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4906606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4906606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKWZWQ7s
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-381f65e4e4bso1081075eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980918; x=1795585718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIFevFDGAP/WEwAEGTiR4DGoC6c6i0A/XzAhuHxSskI=;
        b=FKWZWQ7sStetqAFEd73RFTxoMDIssXQhB5aNyFTUWPvK/KlQIXmbO8PWwn995GuwLv
         4XXOmYaJ262mJW6ns1ekSmOwiZxcHXW0QulSnZj3fbJ4x6Mt09or/RcAXY/wedExavMF
         M61QWmojfppjqF/YaiYYMFSpxwSr48rosWdxnM98jI4oDSCJVHsfHlhRymNmXtz9UE5E
         bPx1Zbwk+HMeP/CBjQ6HsHVcAgCwGNrNyPqssPiRfMFACEUxHj0CAjOWQ+u83OJ4oXoW
         pK2qeu8i60BnitplCu36eQXUxw52bO4aB+9OiyeOQpYQ7rNYLiSi0yy1irzKL4Bv9eVg
         mlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980918; x=1795585718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIFevFDGAP/WEwAEGTiR4DGoC6c6i0A/XzAhuHxSskI=;
        b=A+PDcD+V5nhu1NSfbdlb4/QBBHv4gaAHlXa3FXnu/5knbL3n5Nr8ZbHJuYZqaQ1/ZN
         2GmtCp1TCxeMLe2MHNgigl8B0nXNku90X9bZl0uYZllYFa/GUD2bA2FbLLpGuD8pJz3T
         GtV1NYSODk910LmH7iXKepyAVFP6sfp4JNbkS8upKJUKfgpEw++BWtQsD+r8SGU02y1q
         PuT+Xjs0mJ1McLwz8AXThSyCVucmDvWN0Z91Q+AgMLFecFHV5P16C9xTB6pdSGGinHMW
         OYkBSaszySiK2heGrwLpINgztSNy50PtfEwqmNzrtnJJZINnf1xZqJvjManFCCbGFsnq
         denA==
X-Forwarded-Encrypted: i=1; AL+hErERGpC05PIvR+R7enJdvBYwZKUjYJgmXnM2oVZPhsMKrLPkCO3MP1YLHDLiU9yHh55OOaGI51RjwokZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9KUpbcmJzkQ2f42aCHdFU6awIWjhkS+mTp+3MVgPBD/fVOO0wS
	NFooq5ZspD1T1KlQpzDXKRIrAhzdE0NIwJCLftKLrVPr9o/Nrg1dfFXu
X-Gm-Gg: AZFdTZfD7IW7KRlWafrgWkLCYiOBQrNKzSzBSyj/VApgbmSN2IXpjKwlOoJ/pYlWrUq
	dubbJ92EaY2mxiHyvdrUjo+6U7gN5gP7TGaDkylsN2d+Jn+lpnihRHdXvVgw7cf9Qketr2Sm7ra
	7/MvU7DFOM1FVcuMWPO8GggutoMMxjtUXZX9rIeJXCHkNnTdozJP9KSfEQSoQz7ym+kwG4qsDts
	8scta9pRDFYB2kHrFKGoog8jtYG56YgkvdESqHnokiq/nGh68atZjHAPOK5su3JXWI2xAccWRLr
	jv/MPFxjZdj6I4DS/YsJB4PEtDqq3JRpxq0196MwbCcTpZV+CQsIgUQ1hfq0EO/BA7ibOBPMHQo
	nO3ElHUtOJQjr7s/IouYnqnDjCJw9mzYZxUBi/d4IJmuZm/Oj9aalrwUbTyyGZQ1acFsMKBgSpB
	aXU24HlfTDhreziGlSIpyXBwDcqYGI90d+UUv23L4jmcS4nrwlyEjkNyKJk8S5sfM+yr4r2oQbQ
	guLvbWcCWYNrUvtNO/BMidH4hKaQHrvOOm6oHkCSRVjJb2cLL66JVY3htTtTrXJXqjUie5nc8m+
	n31Cek46nlUQSbF69Xcs0hewNyWvF+pj6pC/FZZKGW0XipzVFNsrrZsGsqNcazoutby7G2BDapy
	84JxZLTU6pz6NcYjeWlgvxfcFnXLMFVuwrPDtSoSO+CTJX7azi1SriGvNthB+bhia621wBi6jGs
	DIcwkueiCwPhVHrMxIHXNvAWU=
X-Received: by 2002:a05:7301:da17:b0:378:314:402c with SMTP id 5a478bee46e88-382814260bamr1567467eec.28.1794980917821;
        Tue, 17 Nov 2026 21:48:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:37 -0800 (PST)
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
Subject: [PATCH 15/17] ARM: dts: BCM5301X: Meraki MR26/MR32: use gmac2
Date: Tue, 17 Nov 2026 21:47:56 -0800
Message-ID: <20261118054758.132233-16-rosenp@gmail.com>
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

Use switch port 8 as the CPU port instead of port 5. Port 8 is the
switch's IMP port and connects to gmac2, which is present on all
Northstar SoCs. Move the MAC address from gmac0 to gmac2 to match.

The port 5 fixed-link only repeated the bcm-ns.dtsi default, and
bcm-ns.dtsi already describes the port 8 fixed-link.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm53015-meraki-mr26.dts     | 19 +++++++------------
 .../dts/broadcom/bcm53016-meraki-mr32.dts     | 15 +++++----------
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
index 08abfdc63d18..890945a5690b 100644
--- a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
@@ -58,17 +58,17 @@ &uart1 {
 };
 
 &gmac0 {
-	status = "okay";
-
-	nvmem-cells = <&macaddr_board_config_66>;
-	nvmem-cell-names = "mac-address";
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	status = "okay";
+
+	nvmem-cells = <&macaddr_board_config_66>;
+	nvmem-cell-names = "mac-address";
 };
 &gmac3 {
 	status = "disabled";
@@ -137,12 +137,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -150,7 +145,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
index 45bd27906f29..d6dc448b2849 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
@@ -104,15 +104,15 @@ &uart2 {
 };
 
 &gmac0 {
-	nvmem-cell-names = "mac-address";
-	nvmem-cells = <&mac_address>;
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	nvmem-cell-names = "mac-address";
+	nvmem-cells = <&mac_address>;
 };
 &gmac3 {
 	status = "disabled";
@@ -178,12 +178,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -191,7 +186,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1

