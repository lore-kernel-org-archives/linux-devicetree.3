Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B6F3CB55D
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 22:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785193200; cv=none; b=GweByMSVVGSdm8faSHeSIZGQ9gafKaKeJ1b2LD1gnmqKeUgJ1PNvym7EmnNzn+4xp3oEJBLONLIEh8b3zZiY+iq6fP6DOwme+T73RfCIZEe10AN1NRVP4MOT73ErTpMae4GI+E23oIjJUFgJ+bhbmyLIRauJzTvCKDf1e9PmRRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785193200; c=relaxed/simple;
	bh=lDxt54NzDpQopsiwC+On5VgDANE85sgZaDgOCed8Kk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=na2vROQqjL8J6Sdtzh9rfGMBvvxlTcnYTsaCYyH/wDuoUsUW9TDYMRai0EYqBdUMkVilaUZCc3x7zoHpu0Cl4BUyqDwd5fDN7s8i0O2NuCtbfupzCKDca9u6meJrA7AF9z870OY69HBWZXBUO3QLmdk+gX1XnJMLMs/VkAZ52aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oVJKz2J+; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oVJKz2J+"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e5d6f35c1so267836485a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785193198; x=1785797998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAXeyuUpUBJGi5ANL/++tSq9bwO41CdynEC3Uob6++w=;
        b=oVJKz2J+iMu/PCfOHFEWjqmmshl/FW4Jr9dU3u6x88YKCaPl3WSxpnFmKhFptG6fbO
         1RgNqk1n5ufRGt2h7K3+DqlZyfNwotLsb0EL0jv1wFM5D3QxL5co7tJWI4mj1UL5tke0
         fxXTxUW9gH/myF2ei/D1yWW0t4nTRwA4xULiM7wGx1sZ87+oKb9uTeBBbVqftDXPj7sd
         f8qUaIPBv3h7sX2Xba2eaMOe7zFtTku/CwRxN8ejX6DtI/BwxrUAMZkeXY6wRry/1NO2
         zCgE9dG9+w9s4oxV9Vr2mXOos7yhLUfGFGQ8XCfj0k8qP2fTyX95FBa8FOJ2lTQ9isLt
         SPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193198; x=1785797998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAXeyuUpUBJGi5ANL/++tSq9bwO41CdynEC3Uob6++w=;
        b=ZvW9L8f3ENB7m1k5B/lDmkh6k/U0LSYaP3icCRq7slcbyCpa906HYUq6eTnEbN4zVE
         JjFehHWPb244MWWH/qfP5GnkGl0Cb43duSXbjIHcmA3mq1nwQliNDv56aVq04dlt0Azw
         kOu+cZNhOHMSJgcVYqca6FoEBraaYi9FopSAtD5sEZyAwAtTGTpOQJBB0IutQXzRfsLa
         B6i8QZYhW8U+UmFvjFbMfPTdZ9dJaTkaVic38HAlTusXZYTDiRufHr5E/gc516+PqbM2
         31i08qbtoANxi4yUYSKiWxGCyiWlL0zTUonM6EsmvKXstusFK74XzRlP+ddqaoEXBQ3K
         +nXQ==
X-Gm-Message-State: AOJu0Yxjc6RbvIPSnz/EP6DulOO1+W+O6CxpxRX5h5sJWlTnWLcz9ZGc
	B3Gj00HT7b9ZtE41yBV1/9f3Qmxd/2seNJJmZpp1EIS6x8yMldkaysGqtteeSfvQ
X-Gm-Gg: AR+sD118KgftyTNYJfBcdn9tnipGNwFtbZuQcqAIKSHQrT2RB2qPVyvR2D26HRe1Vn3
	vP4v3YArqpPwtlVD8zjaFOomHHaVvTCgUT5w7YvaFQAicstiCIHh4IbLtYeyj0JDnRJ6LH7qCBa
	TcLr41Ywt+IbFue79xC/JyCI9bhIO+phvU0MYwkG89fZaVY6KyYqDL8/XPElPIt0hx5OD0LXDvk
	xKohDv3ei95HKxJ5aO8t6ZObAn8I4f/JYa3c5YLlC4iDp+LXMMHBz4MyPl6so91mxxDEx2kvkCv
	tEmh+XF1XzUZeC3hViX8z+8W+X0q9emIKI6L8/suSEby6V1TXD6YUtTiqpK5CsdkQr2jnDA3CNt
	04a/rL3YTkQKUwnmAQY3Z9b8pXYqwRwRB9be7jfVbDF+CFogG0TYzk8HB7LQdo0dUj4JOiKGf22
	S0eUWKmvtclvqc9zxAxy0RaTLAjdhgEKW1BHNNL9sp4W5kNRu5sGiq/2NCV2lQfUdAYVQuExqfK
	Da0BrU5Nku9/FKpHM5sfVhpV5nix9uNZz+a3sfBcPm+75r1VmUiJI68RLJpr/mhaw==
X-Received: by 2002:a05:620a:4109:b0:922:d336:1990 with SMTP id af79cd13be357-93301f45ab0mr2372685a.18.1785193198479;
        Mon, 27 Jul 2026 15:59:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de54b3f6sm711220885a.18.2026.07.27.15.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:59:57 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: panamera: add phy-mode to switch
Date: Mon, 27 Jul 2026 15:59:54 -0700
Message-ID: <20260727225954.268155-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy-mode is needed for CPU ports based on the documentation.

Fixes dtbs_checks warning:

switch@0 (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index e02a7a902f72..372601f0d56d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -183,6 +183,7 @@ port@4 {
 					sw1_p8: port@8 {
 						reg = <8>;
 						ethernet = <&sw0_p0>;
+						phy-mode = "internal";
 						label = "cpu";
 
 						fixed-link {
-- 
2.55.0

