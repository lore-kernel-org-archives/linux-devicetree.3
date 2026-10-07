Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D34519A1
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363320; cv=none; b=OwQVLJK4SqlCMtb3xx1VcOCDbfOsUz2Dr4W2Fw8TBlE9dHJE2Q2Zu20QtbwjnsCJi0pN4sdDMIxrNIkc8JfmEshXbPaYlPsXkzGbRHZUe6LKbsnYTRiFA9Zk1Tf4Q5OexkNR4mY9oSMddJeM78lqsQKxJDXefsnJrfwCdMKDSrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363320; c=relaxed/simple;
	bh=pRig2jwfRvKIPmscPv3ga8MjLPmvBeWTyHRup+5LxN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=REPUoY+b4IFD4O8cdYFiHas71CZZWYdyl1Sps19wOJtImsmlvS+0hN/l5fm8eI58IVePTb156eWoCRQExzJ2glrNbtRr5i92Lw3kyANCs7TE9GohD9RR3XWBCdyUMrT2oEgP/0kmAekXrvBRuf24DRmlNo9CHSSt5/9KKALFkNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZE17Nib; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZE17Nib"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so12964595e9.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363316; x=1791968116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idGrLQ96uf8XUCDMxXSwM26M1eSYrrZBxKOU5D9zkzs=;
        b=JZE17Nib2Vjng4ryH+LLlIkU5DZi/0OSlS5srF5fkQbJ0gVTCfzC9vEqomaXL/KIR9
         /Ylr6LQoheCY+DpnQFToSd41UPY3pmL2OyNRXdpexscevpzpGUwVMDfyRi5pNd0J+k3T
         cIsNto2JlXJn/bI43xzRMOj5NBo2BVe4q5PiEM9NE2iJGVo7b0WTC65ZIK/6EOG4DNen
         iF+/Yiu7YnFpUa8kAEceg1VW+l5AOtJ6EWQPGWXE2jYLuK/9XCHE2H764fkDyEuzh90F
         AxSILEkkFMckzZH/M7QOakHkFLnF8yM87H9y7DnhFx2f+qc3ntDBhlbMZEyrxU9jaxnr
         WkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363316; x=1791968116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idGrLQ96uf8XUCDMxXSwM26M1eSYrrZBxKOU5D9zkzs=;
        b=YnPLPR4zqWFvd+gSsBNXu7h7qOyHrVGkfomuem4qJ8e+4fkHeDYsF2xSfjQX9Zhj/7
         KoiJALE0XCzFwI8GBaYkpwmFlimCfmkZgLEyVL5fT/lz8T0XqQAlYWR9uDuCSWLjvMDy
         ZEQsm4IUeK5C4vGvRv7LO1NlkKplRTdy5Ooea+3okiND6hGQzpy0/YsX7AiyJyw0WRfZ
         MA+y0L3QaomgZJXbFm0b+p6s+QWtC3G2/oITkW2IWYWBFbqdZpMvNwfaPTD76hQH4awp
         zGwHEpQ3ejWzCn41xxu88ho1DM0YniwkXyi0ysEH0sAm4xIuRY/M0ypiKZmgNhLFIUQR
         GI7Q==
X-Forwarded-Encrypted: i=1; AKwUvByDJvfcf/+UejiywGBm3xp0S5UEaW3nprkGywDe57Ez0Yr/YVM9kN+iKU2yAi4nVKpcMQs71XkBuo4u@vger.kernel.org
X-Gm-Message-State: AFuF++n7wSwdj6HDayq8HSPusWPrUuk4imUS/ijKIgCzUWU/nvRTyPKn
	yIAlpTnzMCmiSwiTqBHY/M86tbN8NJIqQwViribUHRr+/73pCyDhtKDs
X-Gm-Gg: AYBFou0OsZX9ZJr5sA3AY7JmYLI66Lt8ehg6KmV4NoGu3uN17T3FKqDoBEZVp9+4Ryc
	YgdSaL4Jg3eQsqzct/t8eK69mRNU4L0jX781/BL1uYqb8WENnzmsvVQjkQPXi4X+mP6b64xjdz0
	hDBwZC3L+fpQ7S2oQHWxOTJogxsrvGG0Geh4OfY9qHZ2qIj4o5p6hxr+ke1wLiGywO+gRJT1T5L
	hEq0dpUDgxFqEmU0q3t1QTkH7vG0lH1eXoCrFd4K3xNMtQkMLu3ckEr2TlumPPk6QsA4x2/ZJV6
	sPIcSDbbSZvteXAFwBf70X3Q95dYxFquHKilvsKp0M63GMD50QwUwOSZnPKzf2akdhnJ18hal+z
	dHh0iPSZs3eN8MJQti8aarLxH7J5b0whUi0NHcelFZgP2rlDM+Vo7jWLbnruoG/9ea4ybiwJTKh
	8BMZdF5C6Pc/UN4m8V1BmBeoCYlVW/p+q8F6tDQBxWkVBExSnJ804EwIEZQM+C9tXFxoihjkLZa
	PaNlTkaBDV6xyB9mvQ=
X-Received: by 2002:a05:600c:a088:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4a180313b89mr20150835e9.5.1791363316178;
        Wed, 07 Oct 2026 01:55:16 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81709225e9.2.2026.10.07.01.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:55:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] leds: aat1290: Add support for AAT1270
Date: Wed,  7 Oct 2026 11:54:54 +0300
Message-ID: <20261007085457.98762-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document AAT1270 and FLINH pin, adjust driver to suport AAT1270.

Svyatoslav Ryhel (3):
  dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current
    Regulator for Flash LEDs
  dt-bindings: leds: skyworks,aat1290: Document FLINH pin
  leds: aat1290: Add support for AAT1270 Current Regulator for Flash
    LEDs

 .../bindings/leds/skyworks,aat1290.yaml       |  8 ++-
 drivers/leds/flash/leds-aat1290.c             | 66 +++++++++++++------
 2 files changed, 54 insertions(+), 20 deletions(-)

-- 
2.53.0

