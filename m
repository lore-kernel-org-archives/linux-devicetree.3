Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CF0341AB8
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790653; cv=none; b=DJLuRuP+EFRUpKmZlw94DbyggE+JEk6pNAHefzbV3Tj0xvGb7rZypzwQb84FRCakSAFfjXnoKOwkC+bk4eKySrKCsnC9HL4g9V0+PTdxQoyAIZRZXuCaKBbEduso3M2FT6w9EiK32TkYumllAGHI3L/k26U+QmM9Os2+jK70y04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790653; c=relaxed/simple;
	bh=GZwA/MKtBxY3W7mT2sPBR1+zgdTlkURScZ02+uOP0RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GB5P6wWenpplFemEI99+6009bA88NF4hVqHk/4F29RPTSHJ7WP9QZIrgA1G45tVOdKB4ny3sAjPzt2+qy1GhWjIguCSeM0tkbqEMlXRcNMKp516i9iNxWHx563SZ2q84t+09oVZ9PGZU8CBzxdO82+YrF9thZ0PeiPowq1C4fWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osSy7y8g; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osSy7y8g"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b965570d7so42805645e9.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788790646; x=1789395446; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vQtLGaBEb+xd41WLDmqvQf+F9Q3EMz9NEqhORQulUCo=;
        b=osSy7y8gmz/N7beGGn39hDQPSWY5+bFtyExIZpDXzkwBRDbbgcMA1Mwad0rF7HWYLb
         OxJ7plobHs/GQEQTFFKKHudnfN03Fj+Plc1HyXmbwPGSlXDucepsY9FBXxWZqQ7TxigU
         6jrrv39IVmOKjRW73DJZAoO3qVnwhbnysNFKYnYlyPYfqAp3C2/mGSoN511sqRyRKMNc
         Nm3/LlUNJuthqOqdjY/v1MR9uHvM93CGrnmk544iHrNb5vFkfjKg+TgfsVrYWejzhMMs
         +RWZWAhfFvq8/ws25bP0riJPEhJzQRMBnv5MlnOh3ggXoaveX3y1Qw4kBb0aMFDvlDWg
         cv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790646; x=1789395446;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vQtLGaBEb+xd41WLDmqvQf+F9Q3EMz9NEqhORQulUCo=;
        b=e3KTwyPFOuaEqCKXHDBISBT2XYVKst65Ex4GEOkkhrpxoRLbLDcruRGHSjr1sCguU7
         +YjjXJG6jmGot/Yj/s8aqa3trmdq26HzEoW1uGgGqs11fjbXKKRmuhL88qYGRoDFwUV7
         vBECQsFRAtSE37n686QXEJexpkwqN0p1ExHcGDkgl/XJg0AquAeJ66fKhN5TsBEvDBxi
         7+VMb/EeH3o+00TUKGvVW8pAt6oD+y5lpuBU1TMFe3iIbhcCuI/vzmWsH+XgitKhpILJ
         Y73ruv63d+LSAWkMjJpF65uwydlVN/1YKTSNZnbC3IWpgSIXJGhe9acvVjCLftmHIWRF
         x7Xg==
X-Forwarded-Encrypted: i=1; AKwUvBy52wjHR2U8pYD8qb5KRFd6l/wyteCA1qWCXJtLQrb16x+3oXsRfmowcxxz8Dy2uP86RST/XHImLyn2@vger.kernel.org
X-Gm-Message-State: AFuF++mtI9dyLmXyUX/kbQWZjN6iYYhqZ4FUrZi3d7+iCWv9RWPGl0sH
	eQ1ReD7fRR2yFOjJnoTBa9NH9cktpFwv6yKUk6667i+R77t+TGcqD+ux
X-Gm-Gg: AYBFou0Qlpury8Yc9b4S4sDtl9LKA/A9EIEd2dpE4N9Cin61UMVZ/mEJqqPZHfW1gvd
	mVRN1c9J2amhQdRxJlXrWFFXCXWevQysNg+p27ESsaTZ5qiPfeTjP2bktRURXwuxe1TG+41HgPo
	aPoQSjGeSA2BbPheE/bMz2zZKs/Vi5JVjg/eXOtY6L7kyPXiVtQUcu79jHwGr5P74TjpT0c9+T4
	bzD+7po5Gwyhqq99VO2tAEkA7f3mF/fc7z8dWBRtTwW4D6UJ5NZE/tx0bualPQZ+NSoOW4Cnm+L
	RxeHbsASYVDz82J7Jz6yUL6u7COIr2dc9PxHpRbjzQzRfOXzVLeyYl3uT+gpxW/a+i2+Ic8KvTR
	q1Z++vFtVoVrQ22UkJeQVO5naLRCy1RXwLnxRKtEYUmHhBLdZ/IeGq9De/lrwfImesr7PrMS5tJ
	kQeCLKisICAtNKOaezi/Sfi3e+WNIimyinKxVQPpgrd6fcc32shUaOUZnGFAvDhxp1fmtana2QT
	inTqSPLTNrZ5vcso6zZDc8cdFMw4OSRGcFG4GkdemwWBAJu8ErbIvPaRw9dYpEJlLp3r5U/Yg==
X-Received: by 2002:a05:600c:1c29:b0:49d:15f8:2bdb with SMTP id 5b1f17b1804b1-49d15f82becmr22689355e9.7.1788790645027;
        Mon, 07 Sep 2026 07:17:25 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm270473075e9.3.2026.09.07.07.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:17:24 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 16:17:20 +0200
Subject: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
X-B4-Tracking: v=1; b=H4sIAG/HnmoC/42NQQ7CIBBFr9LM2jGAUYwr72G6GGCwE7U1QEhN0
 7uLPYHL9/P/+wtkTsIZLt0CiatkmcYGZteBH2i8M0poDEaZk7JKI5VBmwd6eopLVFodKyWhsaC
 z56OKNsZgPTTBO3GUeZPf+saD5DKlz/ZV9S/9S1s1agwHDoHIxTa4NgsFnvd+ekG/rusX6bvm0
 8YAAAA=
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Andrew LaMarche <andrewjlamarche@gmail.com>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
selecting board-specific calibration data when the device identity alone
is ambiguous.

Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
device tree") implemented support for this property in the ath12k
driver.

WCN7850 can be used in systems where the PCI device ID and machine
compatible are identical across product variants, or across regions with
different regulations. For regulatory changes, the hardware description
does not change, but the vendor-provided calibration data can differ. In
that case neither the PCI identity nor the machine compatible can
identify the required data, so DT needs an explicit calibration variant.

The ath10k, ath11k and ath12k WSI bindings already allow this generic
property for the same class of board-data selection. Allow it for
WCN7850 PCIe devices as well.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Rebased
- Updated commit message
- Link to v1: https://lore.kernel.org/r/20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index dc68dd59988f..cf3e1fd99c12 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -54,6 +54,12 @@ properties:
   vddpcie1p8-supply:
     description: VDD_PCIE_1P8 supply regulator handle
 
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      String to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
 required:
   - compatible
   - reg

---
base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
change-id: 20260701-ath12k-calibration-variant-b7850f7ffd7c

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

