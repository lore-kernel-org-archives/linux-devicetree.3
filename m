Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEC3363084
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787017807; cv=none; b=CUNuYEGWhoiZaeIJltJlxeAsoGawvi63OHzAYKzmofY7LxN+9Nev80u0dUqnZfp0lXIIjATvg1+HULEjAi0VrsnYkFBaGWXNdiXnW1+dte9BmyrCwGEc+Cdx5b2Y1WDTwgLqpUtrztcsUpB2AKUonxkV+vIEA/oC+6RPSs/Yu3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787017807; c=relaxed/simple;
	bh=8Shijzz+87DBkGeFbAuU1GMELsQzAXTa4COa8P8ZJ9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQiuKM0onhn5mlzFX4/HxDGwNS0oYL1/lpF0Pn9SxwSC80mj1NnjggGkm9FkcaSjKG9GltDBLFL3aHmelnSe1niXAwsVCyEzE8QHO5T2it5hQqgXHtjN2m4H+St6oK2Z2iaEn8+btqOMo0Iw6BOX1VdJKmV7nuySRTPLhh8BKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=dmJ2zEKO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="dmJ2zEKO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d01663d816so36644305ad.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 18:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1787017805; x=1787622605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVoEfUB/ZAD7MbDl9ApeTkwxbHHTb4QoDPUw60dqPOE=;
        b=dmJ2zEKOsOrSljBO8ap4693sqyvcmy23E0Ae7MhxQcF7zZe2CKsGzW8/j6GvsPG9N9
         V1PfRHDvN8Qq7tCE/Pg8z+BGcRZQ6/Z3k6EkbtjPjTu/BBv5l2feZjorInn6BdfIPCRP
         /6//9CF1E4xxU2r+gl/Js5HI3D7A3+5l7J1MQWyL2Bz4oP/vwpJ9Fw1O+k7CFJZ4/kNs
         c6XEZTus9roZ+VvnjrKcPxhfs3otlTTw4iNiMrpE/DSw+7Xj/jvP6x3S8qqVlssU7T8S
         oz19lkX2kNmuHlCFuAkPIvhoTaAl9q6n+dbasnurb4gpME3bDwcNKY94w93xz0ll85Qe
         R5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787017805; x=1787622605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVoEfUB/ZAD7MbDl9ApeTkwxbHHTb4QoDPUw60dqPOE=;
        b=UxqnaiwcIsQwiljSfHNE3fQalAtcEFvpJrvi1qsGu16ebaunCm2E7mskn/GWJEsyqS
         7uDOSDZiKRVxuzqM5WqihiewLYwE+x2pNAJO5xv6zZ/D0AQvZi+Cs91SkkjSYfnuw5n4
         CCBacfmtuS5z8SM7zNgYLpUBLBHxTp7mQQvrdZ58+ieQ9r+RBK1IEvIRAFvAHjDMiDHv
         b9JJJ3+1a1hrWyjpLzIKIEwP1xY8Fea2vJbkiX4ay4Udmn7Ny2/2GBNhtIQKg1QAf/3S
         1EkKW9ZNkRlhc2lnbMsrqSn3be52m5ILNNgNa7QDGw9hoWcMxWKx3lU34Icp8bqarJ83
         MbUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEIXemjUrsj/stssEimvwIQqokUuVn4mHXjvAjUJLYwntD42wXWmKo6EqFXAyvIYIy0IHrZOjBRLpT@vger.kernel.org
X-Gm-Message-State: AOJu0YxwDO92Mw5BBhNqiqY63qotlY27rey05ISL8/Eu/rJZpR46jHe6
	HKSHYARSd/eMy06pwUEFw9jwH4lkXtgh04aOefhYyQ/ccQK3wmTtFbyMnGEuy3OSpQ==
X-Gm-Gg: AR+sD12+EjvOZ3ddDTyvoZfPNhdkyFxj2+OVessaB2tR1ii/645c4W1y6Rwe2v69Xr3
	5/EjyinmUjRZmFDtTu5bFCLBUXks9fGZcpi/wCobIs1ZtognagnjejfN2pPvB2Q730lkU82Wovp
	qOxmsv5hUuWkzX2VSGf0ywvw3bEFah8pS3q6gxZ8DMAFdJmqYN6i1VZrb3WDwrSm6m3y0S0kEkX
	NU4JZDg1BASWcKxB6Ef+fbh5nRgyxgYgdB3NJfYdS/sUDQaSL2338+T61ZZtoD0Mouicv5LHp4o
	5KoJV6DX58hFWKYT4nlasiYk15I2bknkrMh6DBzmvUzDW3kdIPBaTEqC3l3VCiRjT2KAyLEkN4G
	0KatMC2eVdjFLkayl3F0frFffa5rj69wOOnrvKzry4yLZYSQpgbwXmSe7pkB4aFWs6ltwVQGKuw
	h4CjipARFJH5MX8q5i4jgyG6XPl0Rxu2fCEzxis26Dlmh7eiRFMil1OARd7V5+BfASf8wb9BTVF
	Mbc0cO0lskw14CdzNLvKTa0FLZlqrY8i3nUijtZL7zEwUBgxXYcPTbmknT8feRnaw==
X-Received: by 2002:a17:90b:2810:b0:392:7f74:58c9 with SMTP id 98e67ed59e1d1-3933b8f4527mr31343707a91.15.1787017805461;
        Mon, 17 Aug 2026 18:50:05 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e84118sm7364750a91.5.2026.08.17.18.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:50:04 -0700 (PDT)
From: Kaihsin Chung <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: Kaihsin Chung <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kaihsin Chung <kaihsin.chung@synaptics.com>
Subject: [PATCH v2 0/2] Add support for the Synaptics BCM4384 Bluetooth controller 
Date: Tue, 18 Aug 2026 09:49:46 +0800
Message-ID: <20260818014948.996739-1-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
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

Kaihsin Chung (2):
  dt-bindings: net: bluetooth: add BCM4384
  Bluetooth: btbcm: Add Synaptics 4384 chip support

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml   | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.43.0

