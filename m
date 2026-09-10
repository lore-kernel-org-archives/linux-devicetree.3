Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205312737FC
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788999171; cv=none; b=ST8IWwBzrTo6urCbUjmJ5HptzIW0MP5+t/XQT0c/Lfjdy3EADJaHa88yXI/Nahu8hMvoi4hfZLm27U+svZ7NGGxqVHtqsR0oL7o7bBalwb4sWxRfEEVr5MvjLNAyWRrlrbbsafPWWFUdM0rGEMFDJJ9zSZ8rGpRr9MyAP44BLrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788999171; c=relaxed/simple;
	bh=4/+FgrDMVhQs1sOv5YhKEz6pdUR6l6NGsbz3wEAFfU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T1uEgMO6q2e2YSQboe0AHn2z1mJ83tqfvMvDZZdKGk4lfmYp++6jPUpPM2YbvK7OmrSMNYp9wuQnTwVA6El5V/78fd3hEhSL4V9FWixM1bTjxJACkBrmBYzv5in++1aaS9zjiI+IlzOYjnx3LZtgu/4ycIsmIv6bkvl94rKCcu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfVuqB+N; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfVuqB+N"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso5012075a91.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 17:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788999169; x=1789603969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pU/m9vvbGa2axfz6RcaE2ZySRx/aotu9RVJ6XHh13XQ=;
        b=FfVuqB+NFat+0ddMYgThejlxb+ph+7YdrWKzN1kWxTAB7B1TeOCdvIE7qAWrwuDKEP
         brFnNyOKfywRHtsEUEy8O60iIkIinCInNlmskve4czcnqzewpBKTILSC3p1nfryBvwOv
         M4k3rFFS62nTzgu8LKWZThedzQ+OkCd/MRhoMV6KSBre4PRdOzVTVgZADttqedUmfylB
         dpWODVL2TmueBc6gTLN6t2qs3fY7DW4rkP8sd5Odu4olDvNgNf1XpS6WKxkEu6JjUkWp
         hWQPq7uo8aH4+XCLlWZE21eFe4bewpJYzxaPapqLV8BIGilZw8FR24t+1mRT6g1MiqOi
         T7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788999169; x=1789603969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pU/m9vvbGa2axfz6RcaE2ZySRx/aotu9RVJ6XHh13XQ=;
        b=n3l9Ot1IfMZfosVGYmpa/+wGA60IcyXalo5szNDLxqW4G8fI6Kui3FnsyDg/6gtkXU
         YrFSSC7Uop8iJk+ZT65nf+P6l+5a/fleaJFSRpvWNTxuJpq6Nq8v1l6w9OuWy9acHfsC
         DZYBOn4vOymFg2jWqjooJR/3uVDMBJvoQh7nj7juyl4Ods/gt4f1FGnk/r2MbRCLpGGU
         9FlzNMpgvVWQr2K3uc0DrrjLQNhkSlS5Z1mRIU/Rvw3ao0JB2s9liDiNbq+/yqMjukbM
         CV1YTBy834FKZeeTxroJXyROIuqJd7D5e+ekUKhjXyq+lgsbsKS7hqH2xOQkXfheWHqv
         ICcQ==
X-Gm-Message-State: AFuF++nMe5pKOxJ1lr62gc7D5j/oi58+lXTfQ5rBy9SqYj/onVPfYPyT
	OSoDclfgODnButD1PhcqT9bLqwUK5JYoaAWKTWhXmUHvpLCuGb76tB/FN838FA==
X-Gm-Gg: AYBFou1Mvg5W9cnbi/57/wcPV7KVrvhYOkIX2+E+5SC/7obrkSgj5uJBMdR02opXNLe
	fqHA+kxdHX80rZTuCsn5RCpRQbPfAiFMy+yS8dHHjlFbgs4C/koQs8Ql+9Mg9Ks6rUh+z2cUcna
	a6cK6pS5VR5cI970yMIkJrtjT3bYZXqJ45qbLKv7Mx+B6B4HAzlalzNetam7yDjMMWdoHDKFNuT
	m10rPzeDVMWIqt/QSqwmEVqeksXP+MsL/95F1rBQoemwrjx1hF/pUzlE1CeExqc65LPL1ZIxJWj
	mMizp4jcMwVmTK0lYB5HoBG4Ai2Weyfoc0CgahGapfCi9yRzoOChslGmt3OydCSNSIr+U72Hmuq
	iPt9X7EIrSaASFnDEzOCUnncfVE8FvJshxSqMMKPx/v80p+CI0LD/CT6NBrjy07q410RwrcPGe/
	3aws2asY0JC4C5WLqLPfwO0y9x6pRifTBg38h0VuPyINHz0M67vTbK1ljkUDAwMGc4MieS92TVp
	vGMEtdaegAcOo2RWUO79xQcrtmj+me6ksUCHxzD+hjjPnONI7iaBP5y/h7rYCNTIkLfpGkUnpJG
	jOTQGveHDCVOzMDSbQGMoGglWGkdkVoRFaFoKRMkxs1ANJD8
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39b262ab182mr54698067a91.18.1788999169434;
        Wed, 09 Sep 2026 17:12:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d76aba5d6sm2104566a91.0.2026.09.09.17.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:12:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: N18U: add nvram node
Date: Wed,  9 Sep 2026 17:12:47 -0700
Message-ID: <20260910001247.116893-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47081-asus-rt-n18u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 3854db0118a9..82f9fb431a92 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -77,3 +86,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

