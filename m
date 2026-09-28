Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FC4497391
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593196; cv=none; b=uexNgZo3xI5Dm7EZAfOGK6ohnS0lbdWVNDxzwgmFeHBox+TWvw05T6tvEnZnYwnN0KTPWp+e+qhYY6Byw8Ah4ku0J5LVOK3rioLRqdSGo+JZT8ORpiZK27MUDd3OJCEU83NglRKoMfm9xXGJt1fBq07IPEAIkGeS149bO5Bbp2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593196; c=relaxed/simple;
	bh=zhYyrgaCdsHwHx9tSY08VzeWWRK4MrICqXQJIvb+XH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYDaXil3R/JL+1V99RH3D3BkLFEkS61yGrJ5yMK1MUiZFyFkPcW0jq31LnU05QtbmK0nk+SOiLsJbVt2jzSRtOFD5Y3A5dmXZlNKXzIUuiXH4JFXYoDM6vrgLSqGMyvT5Bt50d+nIZtvVKVb7PTQWDyHJOjtU/JOoQlB0hnnpzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQXd8BHp; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQXd8BHp"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881a3a28e72so482074b3a.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790593195; x=1791197995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NghKAoQdlDiDwBUML2FFpL3Vd/c0/+keoWZbqsjl7dM=;
        b=YQXd8BHpX2DEXTWWxXz3aycv8mAnuCmDU3b3A21Uj1ccUerr1s6QybD83bzVWRqN0P
         H0hjM683khpDbEO/5VUm+4o2TePOxrh0Q+Ml+MufZVtnRK9U6YZIdclAasLEftx8K7qp
         ixKA6jx/CrDwOeoV/2cJVnu9lEkeljrTK00kX9lkVaK2/ydyk51rtUBb5mdyuUDLBhnR
         0g5d4Jd3faoG+y88PFGV3HVri5yRnJfLrG+4UBcnCKf9mKrU4+ec1IfJWGywlVqUFpgq
         vImQY1BQL+iYypfBiTXuteSJNocx17lVReefmLZuT9SKQ1MVkyCD9HwTKx560oSDu34L
         Hpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593195; x=1791197995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NghKAoQdlDiDwBUML2FFpL3Vd/c0/+keoWZbqsjl7dM=;
        b=FaNtw5teiCM135OrVxCmtzGU+TnFRgPABq0kAQMpBNMmRQ4pin0scptQkpT/+TffNG
         BJZCxK+dw+wpBPyCioajTbQ/6s46aBxmODbGN0LkBHFhnu2qwUPtDQphRBaG7J73pN1A
         mw7TIhJ0lqpkQpVO66ZvWMTwDdeFfi/IaU92cm3uMR7DiMXHa/jAi1I5yqqfos+u0iNt
         eAu3igYDbV+5dTGCizVTYCMT6qcOlhiGiagva2O1SwhXLWNfO98Ko17d1MX5KRBOWZsP
         QUoRQIqDjNLZPY7nN4m0uVktDKCLbbG0UCHMnK3fCO+hOId9DObWbiYvm/iyaA+jyd76
         HoLA==
X-Gm-Message-State: AFuF++k3WeMGAnpOYnThub+OG4mBdLBWzkLZd74aGIeubdH5SACM+4ev
	WlRsEu/JCFW9r8e466cKAJKVOpZsi5oWbYA2jS+zpH+WoXXT/yYGrUT4
X-Gm-Gg: AYBFou2c5YgcFq+TFuV/CgEewR4NxGjb9cjOC61eIqfZKcxyYLFBeSxnZveIMLQJBEA
	8VbF+dyeNk3HV1RQG7Bui2mg7dru0sS5JaQ8HXhv5hlTsLl9zftu6x6G9NMXORI5PZVKQQ80ThA
	1j1B8JYdvEyNVqhS/cwjmmShh92MCHTUcJXd+YRHli/TXA4VMTDdvXkp8Jh3cMVNINJ1OYg2RM2
	UQ1J3Vsfdvtg4lan7u8PcPdhliMQHuDAUaYIU/c10y9ZmJjgLyXiu+i7NfNR7O5Ea2m+ByfS8DA
	851yCAUe0+O+ny94Wr7a13GyQj/xr128crpUypohXLbt+NHCveCL95kgIXmDAq0ofhumzr/gbhf
	zlr+gFT8uO9AImgihFKD6hhtlUo/IadxD/A/UrYl0Sg1b19y9ntvXaCnNBHCYSrZA7wEnKSFyGQ
	x85GokighUyK6q3gbdvJ/H9MXJpVgHZpxXsjMvWhcGuAklbuelljccryi5K1dUwirOVaHEhKcj2
	cLXeyzHGj8N9F0Aotqo4w2/D4HDjLFpypkboBbWyVgCgAzfcYiTHqLzyGs6FmdAYKGLxRcwCmqB
	JyJ2QnBdf/AsnR7PUXhqZBzXyvhUcna9gJJfYolqAFv776UDuwawcMp5ysAhv+pQ7XOUFg==
X-Received: by 2002:a05:6a00:27a8:b0:881:3462:cf91 with SMTP id d2e1a72fcca58-8813462d3a9mr4861351b3a.19.1790593194670;
        Mon, 28 Sep 2026 03:59:54 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb67d1e0sm3881635b3a.53.2026.09.28.03.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:59:54 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Subject: [PATCH] MAINTAINERS: name the robh/linux for-next branch
Date: Mon, 28 Sep 2026 18:59:51 +0800
Message-ID: <20260928105951.2187076-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T: entries for OPEN FIRMWARE AND FLATTENED DEVICE TREE and OPEN
FIRMWARE AND FLATTENED DEVICE TREE BINDINGS name robh/linux without a
branch.  The repository's HEAD points to branch master, which mainline
already contains.  linux-next merges the for-next branch of this
repository (Next/Trees).  Name that branch in both entries.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is part of a cleanup of all T: entries whose repository HEAD is
not where development happens: one patch per repository, sent in small
batches.  The plan is at [1], and why it goes out in batches at [2].

[1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..94f6c1278c16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20449,7 +20449,7 @@ Q:	http://patchwork.kernel.org/project/devicetree/list/
 W:	http://www.devicetree.org/
 C:	irc://irc.libera.chat/devicetree
 P:	Documentation/process/maintainer-devicetree.rst
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
 F:	Documentation/ABI/testing/sysfs-firmware-ofw
 F:	drivers/of/
 F:	include/linux/of*.h
@@ -20471,7 +20471,7 @@ S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
 C:	irc://irc.libera.chat/devicetree
 P:	Documentation/process/maintainer-devicetree.rst
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
 F:	Documentation/devicetree/
 F:	Documentation/process/maintainer-devicetree.rst
 F:	arch/*/boot/dts/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0

