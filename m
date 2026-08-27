Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C844237C
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828599; cv=none; b=qtKGgE2d9ZuP15lA3WSsLEE9vS8Fy6s4SxBMXQQhP6RjaLqBKyt3J5UZuLo2TgnBsV441kdDG8A9bKqpOrBfJvrifUeikqcvEcAlhQQlg7yPgOBgOCBf3bP3RhoShbffjsInZ7nQvwieV/7s+bN1W0SGMM+LezdDx5Q/5R6nRik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828599; c=relaxed/simple;
	bh=XTB5xuF5uY/8UybwiMT72tjE0QsyTO6cDMaO3SC6jUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZmKBqFwRpz/6VV8qp2w72FtEGC0mgK3wQZXusnEHZ0esQUs8j+ioXBnXk3hCq99UrDL6yUPbLBvSkUjgj3BS0kByZAY2LBpyCShzumKQFqSfx6i3RlWxMFPl0RXmTmPw6pgrAkSe4or4IaZwKklYzyD2OoaF2zQ5wKHsGGWvWc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=ByUayKZg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="ByUayKZg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d715f4a587so20895885ad.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1787828596; x=1788433396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bfzXAsxwnf/4gzRnr8dq+1MNvADmSphpzw1aSpUIeA=;
        b=ByUayKZgiG1qPK0/VMaTxk7RP9dnv8e368axD1gqNs/ezBTbfumzCGh+VB6vnh8xBa
         uFWpWPjf1/hLXlxpTNw9uyny7u2x2blPwtb53O0/fQb/ZoTruPzpTi9cYL+hFdU/9zpS
         qkNIJ2AFw8ra106mq/cNO4ifByjkdxyvtsyaq2p3EinKiOujOtn4ue74QKZDXOVW+bku
         u6hScyxUbrP9nS9CRzJ/UKuudF/Gz/sHoYkuQtgaJpeaVGy/aCrwNk+vEF6Myr9UZ2W9
         LUBFf97541D0ak/rDtxIHUGiOcxKHuw/4/3YTTkoCFzyclFVuVZGnUmjGUZ1mOCPhizG
         zhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828596; x=1788433396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bfzXAsxwnf/4gzRnr8dq+1MNvADmSphpzw1aSpUIeA=;
        b=UfsSKSs7fprmvvHYXd2yXDbgRI07j74ZTPMPJZDqPaHzwqNy07+MsgVc33QSm0uOx9
         nDM57ghPT7O2w5HdYzTriKhBkykoY2Thl1pKpy0TQ/557700m8MppPBqO/xcInGOS7Ry
         Gxft2w4w9QuFQzt/J+uV0/M5xSWugTk/xIogAZPSUXexz7gKSHhYcdsAlXavyEIfiM4G
         SBHuZjJDCnvW/NTbnzyJ3NOX1h2HbZkc02ZBBA0HH+xRg6jrUpgBsZqvbzfNDf8s1hK2
         pSwcdXgqPnceGEg4QpoYhfJwe7a9r7xkyeiunBhR3dl5zCoqLcW9GAMVO/mXNfQYhNSl
         C5Sw==
X-Forwarded-Encrypted: i=1; AHgh+RpMhzyCS+B/EyBxzNMjIhAS7E3iCloy1vPJ//Hygzv+BZ2WBUykUGIQPCpBPDVxOtv+XurnLn21k0l/@vger.kernel.org
X-Gm-Message-State: AFuF++noQnpfiSMkxJtDbffU0uX4tivvdTyIAZfAp+o7kWFoNdUvJQ2V
	sa4JO775xDw33cGNFtF1x1QFoFUabtSknmzRN3MKDz3oQGQu3CkdAnmlA6ZhihUCZsQ=
X-Gm-Gg: AR+sD13Vg9IY8Wvo4oQkl+Msa4c2Mj/2vJKraToFohGj7nZV+lGPpx+OjIpnd8W/TXL
	ft24a45w41uknPeayoCDGUD2Y0Hxq4IBvIBzVR+Uc+Eek0zy0dMye2ULSk4rul/Ywtx+Njm0uxO
	oPNkwEymc+H3kMgQhRmn2cBleWHqhWECyKynNKEKXPK/o3OpiNyToar1BhZf0Wvhcvoa+lSJ7hy
	zYFQbtaqPShE6J1JO1HvVYWwwxqOWtfYAnc2w6GdGiivShMYy3nJg9IrALOaMfrPqi+IKOZOPPx
	aWgXubJlTbnIlMrCIpRL0tA92tQ6QXMOES/QkubFPWZAhjbdSJAWkYBh+SaOgHEnPx+sI9E+JkA
	CiA4zbrHFIngge7XR13fWEj3hg55d25/WeD3YZic5oa8pF0K5OHdkxLVRbwIVb56QjJJLLAr0kd
	9Ub2FJzofWEE9ShyYxj4BybuMPiKTfIJ5qrdRCcf0gLcG7JFZHlRvOkuioo3vlcdiv37Rkg3pkz
	9oquxiXsAq9Dg7kg6SKZ6/4hLELsh8MtV2TGvZIsxIv5SSC7E5ygdPm1h0/uwZntb5r+BlEBijx
	Uvx+mJM=
X-Received: by 2002:a17:902:d4c7:b0:2ca:6d87:cda0 with SMTP id d9443c01a7336-2d7079fa6d5mr226663585ad.6.1787828596313;
        Thu, 27 Aug 2026 04:03:16 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c4bea8sm15081585ad.82.2026.08.27.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:03:15 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v1 1/2] Bluetooth: dt-bindings: net: bluetooth: add BCM4384
Date: Thu, 27 Aug 2026 19:02:41 +0800
Message-Id: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the brcm,bcm4384-bt compatible string to support the
Synaptics BCM4384 Bluetooth controller.

Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
---
 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index 95501e858e6f..612d21123aaa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -31,6 +31,7 @@ properties:
           - brcm,bcm43540-bt
           - brcm,bcm4335a0
           - brcm,bcm4349-bt
+          - brcm,bcm4384-bt
           - cypress,cyw4373a0-bt
           - infineon,cyw55572-bt
 
-- 
2.25.1

