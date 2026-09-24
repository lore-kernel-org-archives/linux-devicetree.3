Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E236D40911B
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234097; cv=none; b=HUCKpSxXtLwOYE1Zlo0KJyvsGpweFqis/tLImz0h5BtHa39reyY/K1uer5AL9HrKi4ycZc5i3/rnXgDd4sk7lwtdZ3MMOgG/PWyyIZs/VMuArnHVmQLskcEumpSPlZKnUgTIIrSIs8T4b3jMP6QDF3ERhuyMSqffZBx+ilk/new=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234097; c=relaxed/simple;
	bh=7N6pTSfQIgQpZbCNDu3Pk+zXTCh3MC0AIlBR223ryak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JfDE28P/AQU2zLRATRc+aIe6cEzXzdiWI515ysC8onLEp7bcdEL1QNM6PkyrAk89u6kTcnL5Vii8LAJ2xQI5s/NsTvaxwCueF0WQyikxedH2Sw7Zo0Q6S5sRX8vJlZam02bjDe2gLIztB8GWGOR16F7RrrjUe1bkxqmNPaMowQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=JDCZOGhH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="JDCZOGhH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso1223360a12.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234090; x=1790838890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bU+4t3FGIXSiYOJEMQu/Cnc9Vdhxqo1btIx27NvDSa0=;
        b=JDCZOGhHB2+AI8B/l5/VdQjnSq1x0lSHoerfCzJrsm5cKaPp/OhRnsnkRzoAedKhWS
         Tzy9VwrRbvc/KIKUhi+Q4F30a5MgP9pL0Jnk9KUwkkmJ2FNhstHKR/ZDadeGfrZ7UU8u
         a8zE6MaKIdXok2MBFYK/+YRa1rgrRS4fKoVeSt0xgQyATmEESaKF5/HfwPZJ/u0xcJsM
         kKU0W0x9tHiIrngNjlzD+ma7cw4cX6tqMiN7J1u6UZlMXc6fshcIxadXE9F8UsQ2VToy
         oS6VxdIdkF0t+Bjns0JFENQoFRyErIBorM0g0zGjCHYHXgNae0vF4s1Csz+GI0htq+EX
         venA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234090; x=1790838890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU+4t3FGIXSiYOJEMQu/Cnc9Vdhxqo1btIx27NvDSa0=;
        b=lm7gLG8Fdk/53aVYX3FplJZTEBZon5Nu/yFzPkSsAIQfSPnfNWcVVtpx5DAs5q5QPU
         5jsinbYyVMtXtm5gahEiKAQqA3K2+BSMNeMAME2XIzGjVLsFwzmx3Od7CAbq4iZtuT3n
         tYENkiGJqG0iNp6e4isxQ7G43f+M/MnkFCiWWW8hYc7t/1CzXXmo+n5PemH/YwLqzcqo
         qGEwGjGSmZaQaIyx2xB+vUpRO19Zbr/1Cn0EeZ8ZeG1o7XOSxrgLZdAD4lRgeH5O33Qs
         VTGLbK2BRJwUiMhO/xqTPDaCULy9tuQFTIfj6PDmpmZmJ4WKhn5Cv9ehv4uWZtYMm1Of
         g0Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwqCFjGEwVUT9X9UmZFxQuugRfkHleR1sh9ai/y/A21oYUomgFLka9eGPlmrG1m9DI8wq08ABe60YXC@vger.kernel.org
X-Gm-Message-State: AFuF++ngXX6Pbdzu+LpZI6GwlC973B9bg/2J1EKiC+JNzXUxrsQEx1I4
	fCw0H0YlqmKFIDxghOrsmby0nByeDMcCzm9TDsW6NuBJPKjbQiNoVWi6XENBoYIkhIE=
X-Gm-Gg: AYBFou2m+gngPzvRwzRv52s/XPw3IWIIBp7QdeTkA+xiqbxGCNqi2HVHWRvTbj/XSSM
	tjJkiVroOLPAFhieVWTZXJ+dY9qATlHqmxSxrRpdi/XQ+PNnEd3vvKY6czGwNqg1CpLm4Csc5B9
	Xim1na7UIRpGBv1KaxuHwaY8qE4OFy4p3R+vcmIccqM4AlKliebedd4J1SL8C9/GPrtnRtthE4N
	GKMuQ1CVM33gKO4sy1FozawOJtw9Qq3eNNY1aRc7AgLM6craGz+8UcPzQFTmcOS6fBT7QL5bCNk
	q2b/4n/qYtSakTOICA909kePTjDYgOKQXhnynKmpSgOeta+odqzrpLgZr/tJRLnYLeogsFnOOoa
	LPAJhzHFSSAuW6V/4m31KBlhBVoRinwZgG86z8zQ+ll2bK/gf2qMjVcBe7p1qGhsOPxWm6Vrwyd
	Yb69dEFMWrhtMevDHfVv7RzYt8/7NwWfpphh3o2b+iGo/GFIMMYMDDL8jOSuyfzDcxGzbwZunAT
	F1K+RRxmz3DZuhF5ft7vxr0H6Rsg4s96xvfHm3sPijXQ4c=
X-Received: by 2002:aa7:d712:0:b0:6a6:b2b9:7660 with SMTP id 4fb4d7f45d1cf-6aac8f86d0dmr907853a12.13.1790234089543;
        Thu, 24 Sep 2026 00:14:49 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:49 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] arm64: dts: rockchip: Enable M.2 B-key slot and fan on Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:42 +0200
Message-ID: <20260924071445.441822-1-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Radxa ROCK 3B has an M.2 B-key slot intended for 4G/5G modules and
a 2-pin fan header, neither of which is currently described in the
mainline device tree.

Patch 1 enables the second USB 2.0 host controller, which serves the
USB lines of the B-key slot. Patch 2 describes the power, reset and
W_DISABLE# controls of the slot. Patch 3 adds the PWM fan and ties it
to the CPU thermal zone.

Pin assignments were checked against the ROCK 3B V1.51 schematic.
Tested on a ROCK 3B with a SIMCom SIM7600G-H module and a 5V fan,
running Linux 6.12 (OpenWrt) with the same changes applied.

Adam Wermuth (3):
  arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa ROCK 3B
  arm64: dts: rockchip: Enable M.2 B-key WWAN slot on Radxa ROCK 3B
  arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B

 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)


base-commit: 23d8f49fcae5d72b77744c7f349c12462c3bb748
-- 
2.43.0

