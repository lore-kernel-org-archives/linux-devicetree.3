Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05A47426F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253043; cv=none; b=a9VRdPauoy6Y5kOJuaGfGYB9PG7OO/++IxXWHHspHgnVDbL2ZrQ/5nNMgdF8KY0RPLeHzMTwOWgIIFwTOBNyJk23EGVCijjdgFB2GP0PTkHvdwhyRMPNd7LxE7JRoSVirTaEmP/RkogsodvpF88eD10cdn+5astnYz8XZhha68w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253043; c=relaxed/simple;
	bh=ENu0ff/T9GLBxirGVWZDIEaSILfp2s3hEpQHwIiy3fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmtivHp396yT+zSd0V8Sh1BIwTt1YJ70YzzQbZKQ1l/16J4s8sF4a2/GXQvKRjS9fw88Qyl3ip/N1iOn8rTRlz2/cFZ05lQsKd8u715tEmhjQZa8FqGYdIkaWECIxbudifBr2KLq0gzvSGlWem2T97xk19I37aP4IZD5IpiEhWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=f68geqt7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="f68geqt7"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d710632717so38781545ad.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788253041; x=1788857841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3N14T7S98EVd1zcTAmDaJnZi9OULXIvtKuCSfJc2RNs=;
        b=f68geqt71ydmLpoUQEoVuDgFfHpnTSEaKO9o5RW9YK81ULPw0DEMN9EeIrfX4UUQ+H
         iXMNaB2hXNUUkYKTWcW1Klb+8cjjrhHLUt37JtuFqfv42WnYgAwfZG0QFpF8WDdVibdh
         dXK+Q19ZRNlcz5yU1T3Mmh/gZrsx6PW3NgRGfTVjoLtKZ8Th0TUuPXBRdbM5UcILB9Xc
         A0h+FRVh5YBN4t01q4rkMiCpEoeFTOXZvPZizZtzR1m7LMVCGa2aMQ8nHXn3OC8jhdCz
         RaepSsgBG5LL2jyVSgsJPi39aU2zuEM1M83WytDkpMGxFZpBI0HRGaeEVGm647H9Bsdq
         iDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253041; x=1788857841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3N14T7S98EVd1zcTAmDaJnZi9OULXIvtKuCSfJc2RNs=;
        b=XPUnOzyxU6S3XXy/yAZkS+/j+qaDwQcD7Z5CJS0xJJxbnU2EiktpXNp3r7kONDpX+c
         Bjcy47GNObKgomTtZ/WbIPTWLZ684QsUylmdvXTrwXCuxeXSdIjBkLwkX0AuPWBHYWB+
         uKwljvhIIqeQwELadxOtfoa2LwdqUWom6Q3GCVgBYNDAPSLxBFX2zJhoJqcqnqMKSyMj
         41Ckn5aXfVgUAIf9xFQe12Eve8Hspp7d2elSTI3lUafzMfhuWmdIvvNfg7ehL91HDPCC
         e2/YHnPYJyBxRVEbW14rVjdaKFPv5bJvOfg73xYauTv1pvRK6xNAm+sSNKiDA+s9yMOZ
         zfnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5RK0KlIyv176eGDsPoC+6qB/fvDF7cfWfQ0Z6cSxGAzN8Ng7gDtCxK5LXPjDtuIb+l3UdwAWX27qC@vger.kernel.org
X-Gm-Message-State: AFuF++nRNxTDNH+n2hEEbh4Eii6xtNcxbh/v3LlzEwG9g00DrhqOY1o2
	k5QzYa0P5+40SjqJW7ATvJYD0FzLj1POlWTgS8bQrvyofNCI+Gbyf5RLZuV7tBgv4FY=
X-Gm-Gg: AYBFou3lvVuyHc7nSRjY1vl0phy/WXAaoTrr07gCh79VyqLefDb039C72pHgsm6re/D
	eGkfqNFFnhai8KC521jPm3ezXjYPu8myhTJ9BaFb0iLpRCBr2D74p1AQRrjyfSvQh2THdImNK20
	WQYEqVgMTWDTLuCy/EDv6p8GSZYqHvcHQgwct5yNfU7mZm2RUxho+720f/kbRcKbcfpff0Y1lpG
	uFronZOo0Fq6eX+kBc2/rXZJKwbvjJ/7Igr+bU2ILdoLXnrlwt0ozvXmhT8VjPZPwOjNP6I966z
	7nkIduYOOSUV7SSCmx0GSs4e81HbXxKoNKyE6MYS/PNmldqh2uZ0AhaqBoSRJb2kTszN1w0KOXB
	/81KtmA+6IY7iD4Rb6DIYG3ZaIuDbGRoRlGntyIUCd98SQLKNUu1oJk6zX5DxYpewIqVJC3sfFY
	m2ywykpqbgrrRFcyISs788PaqPItRPIJXM3GBHrlqsIj5uPUi0GVfzIGc41TW7tAZUNOOyiV8rE
	00B/KMhi+udzskjiMZhOvsuI/HO3FRbiQlED9l6IVje+jyuPSYMpLl5ZV2pCccsaISurAE5wRpk
	6aCNhA==
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-396d0ed8eb2mr47596038a91.9.1788253040839;
        Tue, 01 Sep 2026 01:57:20 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf6800sm5934432a91.3.2026.09.01.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:57:19 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add support for the Synaptics BCM4384 Bluetooth controller
Date: Tue,  1 Sep 2026 16:57:00 +0800
Message-Id: <20260901085702.1515378-1-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
References: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

he first patch adds the BCM4384 Device Tree compatible string.

The second patch adds the controller support to the Broadcom
Bluetooth driver

Changes in v3:
 - Patch 1: Fixed typo and GitLint failure.

Andy Chang (2):
  Bluetooth: dt-bindings: net: bluetooth: add BCM4384
  Bluetooth: btbcm: Add Synaptics 4384 chip support

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml   | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.25.1

