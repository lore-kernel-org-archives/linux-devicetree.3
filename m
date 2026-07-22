Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD52437470
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754865; cv=none; b=lBbvAp0CtRr/+oNrfjkNtUm8vrwyGg/aHED40Brj17stbgtEDsQhb929TOIXqKdRy2T69fs0pSub61jjVn7yap29mUxKLHQ4YKAUrfd8B4IYxUjCrGDCYkORQroxqUgEI/6Mtj9I9qpA/iszsoCzwUVqqrKxwrCtQQUy7UhkCEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754865; c=relaxed/simple;
	bh=vvm9MiiF4qT9D4Qs2ERzb7rUVfglIiNSjcfJaY+TlO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KXjDPIBzGz4ggcSrD+1/Itjfw59gY/o6Yg/m4JuWusupEEltOQH1dGy6/5uzPjHPMeE5San/9o/v41cDaJCsS2zcRFKHZTmvfVEepYQ0OiWKf5FnrlalkYbCnXvx0Xe9lLxXZ2616n2UigHXCi+9qM6FgFpCVFkO1UUOXpbn1dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=I+HA06OS; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="I+HA06OS"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-ca88130e09aso8116678a12.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754863; x=1785359663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79r229Sv14C/d08t9Dy2alwJans9h85H9rzz2r6puFo=;
        b=Grcrk6P7N42ttZ9zZ7g1oazOa4B7QJUBn/H0l5EHHkervdShTm/ahdjAyD/uGkOSn3
         pYgDc4+4kftoYqJbbTXtXSCM2nh0cG2e8DhRRicyDO4a097M+NliS/cDegJemoIjLBvh
         FeLjNuFUb3kWxBBgse7dFFmwwkBsZboo1rlsFoS8qp5lLU2F87bvedqtfMDRQGjnVU21
         1EQHCKqO7Ls4WDir0396x3TUmsSbDrghAgKbkgaIEP0eMyiWretghQBkBgC08mDmhojw
         mOcjvFFZP8+IZqOsaRv3/QH0G3XfGBk/01tzZRw6QlNpPIkyxmotdghR9epG1dwplbJa
         VTBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyovKKPNcbxVk9V3neIjWBJ3hhH6iNaBLEj9l6DssDa/KNfuZtYVKZHzcdx9h/PHPbj/B7wMsjKYF+@vger.kernel.org
X-Gm-Message-State: AOJu0YwaMbmjy1EhF7D15/EcfoedAT6rMATppELknmGVb3V4dPOzp/4F
	nB5rcOYtYFVOe1+vJHQI1PTJe2gPX73ltOxFL30++8FqxzJz38e6nwxfgAnPlWQcbuhQNxAYDAs
	Ym6wy4rHglAn5Pyg/CulMPyuWZJ5dodyEldHC3gMBd2vm2EvXJsdZH8BVL9iynoWtZNUNfK1gyv
	3xYNQdXbeQJYKy9wcy6ndUT2GSrOWFRcl7MWgsaSDwdojBtNt42g/Yos8gfcEKI/j41hHa+sSVS
	jz3Nlhud8qZKw==
X-Gm-Gg: AR+sD12v91f29zWvWd1lqRBYVN5QkPmqnGK6fqnfZMDRhyGKI0TMgjwCT7tbiSIbg91
	QregxXnRNP9MVx+x+fD80xA8sDHYzPsVUXffGAh/rvxAGCmz4ZAJg7nb6FOwFObzH2LixO03l+2
	XFfLXx9YXTkRCfCxXg6SUN4B+HawnepIHRTrA/m+lqaKpKs10RaxS0lq71cYquEmSSyV2IyOg51
	T4Jqwhv9TUt+Og9DCpmidRkNjTi3ngpoZPtOdpa7iibfX3ylmxOF6boIM3luxNJsuSIYcYRGZfh
	LICQhrTudwQRX7U2C9K6z7pXqxyhf7k3Zek1ruhl5tLXl30nRNCyRzkbfivpnNojPiukRfSJybz
	4AgWbPGH1H07JcI0nyABQWP5ZxKX/9So8jnyNp+28cQicU9SRkvSgoYEVnCeDURYzBa53W5jHYY
	uYNjZD9MTyOHFZyR7A0mS9ZRcUAWW6nA9p
X-Received: by 2002:a05:6a21:710f:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3c44afb4ff1mr213922637.1.1784754863347;
        Wed, 22 Jul 2026 14:14:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3147d45c0f1sm225773eec.0.2026.07.22.14.14.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:14:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92d1cae5939so2555841185a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784754862; x=1785359662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79r229Sv14C/d08t9Dy2alwJans9h85H9rzz2r6puFo=;
        b=I+HA06OSjpgVcglOhyL8zRRkEn5h4Yc/tRcOtTPisTasPaS/x4hiO7U2fj2lsnf//+
         4P6gNFrSBm670TLdTamA0rTCbXY3gf7ScknB9HEfHbbjn25lfovBPvegxrYGehEEc5l2
         ivr0ZCpDsSO0Uq1qGHoSAKSOyIkxi2Dk25+uY=
X-Forwarded-Encrypted: i=1; AHgh+RoVLUJVNvc/HfaWH1LJfup0uhDH8mp1+gkOG9t/vimkKzicoSqNP/Gtx40jol6c2UGtPrv/EsMYlmiU@vger.kernel.org
X-Received: by 2002:a05:620a:3911:b0:923:7821:dc0d with SMTP id af79cd13be357-931038938c0mr40973685a.33.1784754861668;
        Wed, 22 Jul 2026 14:14:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3911:b0:923:7821:dc0d with SMTP id af79cd13be357-931038938c0mr40969085a.33.1784754861114;
        Wed, 22 Jul 2026 14:14:21 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68a7fffsm253004785a.11.2026.07.22.14.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:14:20 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Avri Altman <avri.altman@sandisk.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Erick Shepherd <erick.shepherd@ni.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: mmc: Document no-mmc-poweroff-suspend property
Date: Wed, 22 Jul 2026 17:14:16 -0400
Message-Id: <20260722211417.3702709-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722211417.3702709-1-kamal.dasu@broadcom.com>
References: <20260722211417.3702709-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On some platforms, firmware accesses the (e)MMC card directly during
system resume from Suspend-to-DRAM, before the kernel's own resume
path has run, in order to load boot code using hard wired logic that
is not field updatable. This requires the card to remain powered
and responsive throughout suspend: it cannot be put to sleep, sent a
power-off notification, or have its supply removed.

Add a no-mmc-poweroff-suspend flag property so affected boards can
tell the mmc core to keep the card powered across suspend instead of
sleeping or powering it off.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
Changes in v3:
  - Renamed from no-mmc-sleep; dropped S_A_TIMEOUT framing per Ulf.

Changes in v2:
  - New patch, replacing v1's card-level quirk, per Ulf.

 .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 3d7195e9461c..5f7b3f8ef1dd 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -232,6 +232,16 @@ properties:
     description:
       All eMMC HS400 modes are not supported.
 
+  no-mmc-poweroff-suspend:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      On this platform, firmware accesses the attached (e)MMC card
+      directly during system resume, before the kernel's own resume
+      path runs. The card must therefore stay powered throughout
+      suspend, and the controller must not send it a sleep or
+      power-off notification. The kernel re-initializes the card
+      after resume, since firmware may have already reset it.
+
   dsr:
     description:
       Value the card Driver Stage Register (DSR) should be programmed
-- 
2.34.1

