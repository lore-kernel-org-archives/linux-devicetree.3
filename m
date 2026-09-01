Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3DB3A6B8E
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 02:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230009; cv=none; b=Q293vW3MAvb09XnsbFFK+4C50CJnn28941p/W4dK2VkmtXN0fjAaG43Zf3ibrhuy0ZxxZ0Wmyf1Y+VwoewENawoX0/zB+dKlQg6dVAxvQtfKS+bn78zDnge+CWIEw8NmXCxAIbFDq/DOKxJ4+hj9FyGFm/RWgEBWEKqDjnF06Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230009; c=relaxed/simple;
	bh=xzNUE0g2RNOAbTc+miqaYUEcLeyNwtRt9Y4owm+vRG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ow3nS+uZ+CCV1m0nJfiNyrtzQGbnuNFppxCWtK2inKFh8lTJba9HhDP7Jbl3hOqVbe0PXbLXbn41WNOqHLoYABDmYQOMNRwgx6iw0InuyA6ctV1RSh5EbBzpyCJC2HunwnheJziR5j+6bk8Z//yGlu3J1aEbejb4ajSfK8pJ970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=Lla81i4+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="Lla81i4+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8541875f596so2292524b3a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788230007; x=1788834807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gChFCRqPTxG6qAlhVmq1u3HWUgs8rr2muPIizuvzUM0=;
        b=Lla81i4+g5yHvkaxNNtSY6n8Bx6uvQCOH9AS7HTiZcuMtc8ZWw8H0OcP+QSbZ/ra4E
         pBO92t2J85goHbrPXmpN8JKeIbIdzlRDFpniX0KRCEgMNGGt6pEyukO7SQpTSlhtxbky
         UCOvEIOkfRVLytnMrNMveAWtNQhRy30/Z4qEE7r1Rf7JZwh5kD9GpozI4ccp1gDelwdh
         KonEg45GUN9IrLd3nsgiMkJ/t0f/98POiMdVDuDAWIQQ33EehKmcW0lIQGlTHEENO0uL
         CAffW90wj7sk7NFxmE0smC34ExHPe1hk7Lq//SlgfkX/EvwQQkBn4/Tahkfu4oOlgC5A
         tW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230007; x=1788834807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gChFCRqPTxG6qAlhVmq1u3HWUgs8rr2muPIizuvzUM0=;
        b=K3cYk1I+l+z/Um95aqSqeXT96MJWiKqfJwq+jh/QGxznoVQySJeCs3AVdZlkgNG1Jq
         +8Nbyh1dATZVMnWS54irNok7GzMc1cFe7pgOEuCDQrF6h4TpLLnK0ZKHcixRTQtsAhfD
         X9VuEm/sWGyGGCXPHtJmMm6tTr4ziysJxMcguubMN4lyt3+q5aHqWUWxy7ZyLqkkXuyi
         eBRW9LvVrbwoKIUjyT8+MrTFP7WaW8jJNNgbxuR7OxKc9+UFwcohgvh4//aUCQtoIhob
         JZThullbPfeNZGT//FK6zD9baFrHv50YOnivctkfY3oAk3DZxJZHqIEl0D3XV/j2T1V6
         9AXw==
X-Forwarded-Encrypted: i=1; AHgh+RqlB99HJLQkMzwUo+Szv7mVKVW9qFgpU6WL6nwkb4GJbvak6JO/NdhnAClPlLSpj1r8sjIxMKo0OkfA@vger.kernel.org
X-Gm-Message-State: AFuF++nhEuSdU2JkBsPPrfNZONGpQaEqVjbo+WOG5pRx5vgb/a/YCjHp
	VfA5wqep6DvA12eUt4+o4hmQNAS0pq02P6rpljd9H9BrN7ghAaGFuxwddujkBRasjMA=
X-Gm-Gg: AR+sD139iIGR0fCSv29qWoN7xd3ghPva8QoErh/p6F+SuCPE73DLVOaVNNayqZ2HzJ3
	tkRpD6dbHiuPgd6+HDveZjEiQgOLAvL04zp5RLkYzT8i3TWY69UVU80bcqk/b0ilYGqMfYCLL5F
	GaPm5hROiw6ngBvahQW60FgXnmKR3LXSkNSbtRrMnSDh7AfGonTdh4CcBEzbKSluvyD7HUq81Jh
	IulXZ+cnzOQesW+avvwO+jRRcXMvF8V6oTNzAF5K7J4+xLgWL1vi9aZZqGuml5QHmMY55ioPsG4
	tQL2TBymWT69Oj23jt0EaZMhxL0SuEjPUx2kWWHxAd0J4HuLbxEVBi8ULOtoKZrCh01yu2CeDKt
	n0TYahO5BbO2rKh11+87dz2PSzDAurK7M6VZpTc6AXvRiWTyTDkvtrUydWMZTsZbJI75X8Otng7
	icwtx/Gghy2l6AatswT74H1Wml6UPiNZv/oeMvu3myznn5QzrVa28JB5EHytMYcw45LwbVMlGsX
	MxkPP5BnQlOzii+Gt3RB6aVlkWbOMkTwn1LZRZJrALbTE9rAQ65egnjyOxQCLL0uQZMXSHhs8Gg
	nD9HwQ==
X-Received: by 2002:a05:6a21:4d8e:b0:3d3:ad3c:49a9 with SMTP id adf61e73a8af0-3d3ad3c6441mr37600042637.23.1788230007459;
        Mon, 31 Aug 2026 19:33:27 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm5005565a12.11.2026.08.31.19.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:33:26 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add support for the Synaptics BCM4384 Bluetooth controller
Date: Tue,  1 Sep 2026 10:32:58 +0800
Message-Id: <20260901023300.1382808-1-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
References: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
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

Changes in v2:
 - Patch 1: Added an explanation for why a fallback compatible is not
   suitable.

Andy Chang (2):
  Bluetooth: dt-bindings: net: bluetooth: add BCM4384
  Bluetooth: btbcm: Add Synaptics 4384 chip support

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml   | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.25.1

