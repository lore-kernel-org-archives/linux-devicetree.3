Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2DF3E8331
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828595; cv=none; b=VUF5hzmDQWVEX48fEptSbv7t2DfjP8+RUmp6DHOH2mZW5Q7YV58hwKv1XaXUCENGcnXp3sB4fFEfoLsET1WKETxkI+hjemrIzYy0ugXJ0lECSOgsFR7MysHdXqpAwUwNjDGWQXNYYAWC5W0biBpmMivAjNpuYCKYDNrrA4ANuZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828595; c=relaxed/simple;
	bh=xUcU4/ath3MB9X4umm3moMbocA/jtcRYF1kJ89FEfuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vAZ7VvWGK/0Xnf8cqgKLYhmiOOPR3t35q8seksQVTvSzkJajHdQTJqTWxP8kJMsePd864VKsjTikYCMesuGccC8Dgt2RyXLCE55A+VMNbsmbtZiNcl/l88Yhq33im9QvNDO2eIgoQ9/1LCWjc56YquqZqC3+Irekd85/8zYmTBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=iWjFxj8d; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="iWjFxj8d"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d58efc7356so23832615ad.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1787828593; x=1788433393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z30Tt3xIoabTbn0/fF4p38d5mX0hzLF11O+CjT3QkYI=;
        b=iWjFxj8dZ1jcL8ZJMZv1pSAz1/BNMjpgdPDiZsG4OVK7zaD8ArMT8Tb1w+HnTm1ZDr
         alfI7uvtOVffIJadERkR1ulzNIBdgCajUoprQryVNivatxfgZy7479eBLUikb18QHkKW
         pJCnZJoh8eLSz74lvJCteYhhniN4iETH7RCB1XIaaD0AqRKWeKLO4GUrooQrdwLC+GqP
         vGGlWvCv9n/LzrppMi8e7tmd5M9jXqVciPy2vMJq6SP0C1J6ypGBFcT5YUV3UUiU/XWk
         VjVliNtWlBCtONXIeDrEycZIvVNSbP68A6Ylt/bGeFNT7pBWQIc2snA53ZuYh6dMAs/G
         oZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828593; x=1788433393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z30Tt3xIoabTbn0/fF4p38d5mX0hzLF11O+CjT3QkYI=;
        b=iXDgdbJ/e1ixMIAhqIlhte4M+UAVvo6me372dQ+ihGf7Xq5xuj0NNsj+gr/TQGVg0H
         b/QWNFwzsgfVW3LNlBxG2kdSOSzzFf6mkR4VU1hxmHJ0/DPhhRyir/Tmm1xQhentQuHR
         Tg1CTZ4f0HP4EjDdVTkiHfbJqT9RTmM89iUMmHUndrkFkt5MTLZvJNW5VYVE0j8BRvM2
         uXJ4C5lfuGDTaa+eNc+UUZWTIsrg3WePGiD0luY/s9Od33nwBT4Vh2ICVyhlisdz90yo
         T4kKdGy/3tHCQorIL/XMfQLw7VMW83e0ESJpSTLve3ZxFWL/LR77FH3MDi4z4bUWwp/4
         L8ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPOzHsakkBAV51kRVzOS920GUdq81CEY+/xJGBXAzFDxAADrTtMLvrGUtbaiyh7wMWSVXyzqKbQ7HM@vger.kernel.org
X-Gm-Message-State: AFuF++kYQcCm+5TfymdIQeFYG6bNrxr5PH9N6KQ2LGOGsVgnYD4zzYyS
	QlT4Krz47yVpV7ieuMNU9qghmsEKbzSe9jcrzQ2NufGIM+gQht/SXM2CKsNjgxPQw/w=
X-Gm-Gg: AR+sD133qOb7TZ5Khhze5n6gJ692E9jTiOaAjUFzyBejf5CwYGXCoZj79011o3sSgoq
	nztwewIY8mZmZ2oSL++FpJgTX2/hpowKSX7CE1YEkX1eMUQu+P9kNm8WQ47iGEoUFixeYFddG6G
	HK+So9jJnEZblOqDqO5o4qULNzbEz/IbVHq3dQ7UOqu0xyZCRFnEZGbg/g2ToXFshgpsd/bAA3j
	geinROuyQfg1a0jGwHR4kMSfuaYGmyC27R12UR+3HlhgbN+6EEdogq8ZZrhuRUmQCuFBlNGC7h+
	qdRlS/hdbUu0tZdtIDzYc+HXUbaACqzgnKmDT/u2OpZxQE4gbILh+eomhvySfHEQA30VsFXI1TK
	JXqOJMJhC7Edq3TNM3HkhRmUC5FogeutelcyuIYuo9r7qMqgyXRPv5Hb6YCroluqt9msa2v9cUe
	gTAdH1Gh7hJZXt75J+DaPHepibjHLd7zb0q0l/ImO1pgPD0klMoWoy7b0GTIK5IajI1D4Bsj2OP
	/X8N8RidsB3l5o3y2QeMGkN6d4IVFVMPNCM1PwvlucBEDQXKdhA9kUB81VSkG6+A8/nBHIdwUaj
	ahOVaaQ=
X-Received: by 2002:a17:903:32c9:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d7079eb7e9mr258015565ad.4.1787828593135;
        Thu, 27 Aug 2026 04:03:13 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c4bea8sm15081585ad.82.2026.08.27.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:03:12 -0700 (PDT)
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
Subject: [PATCH v1 0/2] Add support for the Synaptics BCM4384 Bluetooth controller
Date: Thu, 27 Aug 2026 19:02:40 +0800
Message-Id: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch adds the BCM4384 Device Tree compatible string.

The second patch adds the controller support to the Broadcom
Bluetooth driver

Andy Chang (2):
  Bluetooth: dt-bindings: net: bluetooth: add BCM4384
  Bluetooth: btbcm: Add Synaptics 4384 chip support

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml   | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.25.1

