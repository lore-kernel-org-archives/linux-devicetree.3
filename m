Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912FB2C3757
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961659; cv=none; b=LG7sMmceL1GoiTy5ebOpiBPiN4wy+ybpjRq18n1Ye2S2brvWDwIxCfDyhF9i1TD18qG6HZ/n4G6KSYcXV8IIHQqwrUdZSHf3Yp8yMPqf00pFQg0BdyKAeDQXi++2tUNj6A7qaWCIa8cVc8HEBnxHcsYxVi8UvFgXIvl3d0MoET0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961659; c=relaxed/simple;
	bh=CK3Qd7JtwaCS785oIL9SXaJ5indJD5W5VLAi3IhI91c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZF4ctWvylgjx6r02NrLM/Cuna5m/eNmXZHS16QqtLPotwNuBdQqLOFGQMxfnbHMk1nAM2pRsQp1u9pw2A7BoHKTCPqeLqUj4bVevTn0v/Jt/m7vi8xyeptvRR9PXPPNeSTrlZepQZ/Bio6Xt+3xEFGsqowCi3fHHdahw4+vD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUR6OybP; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUR6OybP"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a4bef87631so4665731fa.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788961655; x=1789566455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK3Qd7JtwaCS785oIL9SXaJ5indJD5W5VLAi3IhI91c=;
        b=JUR6OybPqamijSbijCLaeZ0PPNmC8kckffNpbSNDXwDfqetDAH4WrUf6O2Y/z62ab/
         AdwiohKxoxZUQtO8HNsrraBWb0q7yP5XbbIa7vmbQePyeohGnLk2g4T7us9z603f+YWK
         5s3y+A+cQ+6Uiyj/Gh2obsXae5WYm83xbUCP5Xpp2rdtFKNMRNdae0e8d/ypzLBj6NCy
         VJwAEdon30vpDlCWvyj49v92JXAA8p8R/hdYjIrCFN+4so+aSC3z9Wh/5PJ1e6JVXSzT
         lFs7F74nywdROI5Th0Vow8kD1WOap6/iSLfotLL30JQQswe2+E79lK8SvkV7S+Jz4GQ2
         eEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961655; x=1789566455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK3Qd7JtwaCS785oIL9SXaJ5indJD5W5VLAi3IhI91c=;
        b=myIoshKW8+IT+ccIHaFqdsnYaXPM3qin6dM6kjuDsS6/S/LAl6KqacbRN1xDjwO0W2
         Y9f2iKDwBzI472ckELe89jRlpATmcHQ7DA+bpQIQ0iTYXu/vJuOY5sK0RcZ+4wuCTRcL
         geiVBzkIN2l6SzsKZS3yGhyMK8vUPPx6+qFjNMtLfMISktRiB8UE/Ftgx9j/IrE7DtFl
         dh6+RTMGsP0srbD/CVN4kD5VD63A8ckBNcU3Ia34v4Mltw1qL7nE1K+CB1t50jM/UHd9
         F4unui3U1Mpa76u+X2oM9NRM162C7n4Jf1cwHsBX2fpxGD9/SY74vq1zBS6vVEbyeC2C
         hBxA==
X-Forwarded-Encrypted: i=1; AKwUvBws6BMdikw++017Bk5XpO5+Pb1cA8eqnYMmMDeH/AvRt/BKEufFwYFwPV4XeWc0PIK1ZjHXLKDy4kmS@vger.kernel.org
X-Gm-Message-State: AFuF++ln0Ki+rkXHKLnRziT9ImlPSF0WnivnKm+TkHHAm7PnbAs2Y982
	oeHi+hCUsTu0zwhzlG5O89XsPOXAyeXlY4DQxACWobOIZKM1HjPNlmTC
X-Gm-Gg: AYBFou0U7Kcs6uWI86gU5MS7X8/P/+FIam36FMaghP/nGKpS9aB8h/fWUjsGvRJBEY6
	OXZONiJrXjW6M/rNsScW2YIx0JZ7Szzs/uBoayH3TEN0n3zlBRA5eTr8gzAAA3cDOUgZPRrYkOW
	kzoANFC1AFnZqJxlJ057aB+hMGbLjIzjDEideKTei8nAp6IqXayn6Thu1H+LQN/ytxmd06pj2Xw
	77GutX1n9Gk8Tl46EvcrwXjqlbSgXa+K70TZon27I9nn5asAtIf9JvRB8Rmlt/Vf73DUTTVx+XG
	pcNP0fDWqHGbDXVURDyAIsGhXaOvMHfFC0UdEjKBXPVTE8N5RiPsf5/EeniQTNBTNAi6tDe62WS
	uBKUsaB+wbrpgsCtzSlgv5Cj1tNJKBLMCuz0esa11Xnboffp4z4MBSm4sRDP0BNLWuUqHy/MD2R
	4HUiTWJR4BjisSIYSPqt9PECvjKWJ159N/05rnOW6FFWZj61iMUF4X6FFSQAl8q+md1Bd8AYVtH
	HWc+O1bYF3IIQ==
X-Received: by 2002:a2e:9fcb:0:b0:3a3:7681:6d72 with SMTP id 38308e7fff4ca-3a37681756fmr35983981fa.27.1788961654972;
        Wed, 09 Sep 2026 06:47:34 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a58f539ec8sm136161fa.12.2026.09.09.06.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:47:34 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: diederik@cknow-tech.com
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed,  9 Sep 2026 16:47:31 +0300
Message-ID: <20260909134731.364-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <DLAPRUR4Q73F.1KIBGA408LQSJ@cknow-tech.com>
References: <DLAPRUR4Q73F.1KIBGA408LQSJ@cknow-tech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed Sep 9, 2026 at 12:29 PM CEST, Diederik de Haas wrote:
> There's already an attempt in the works to upstream NanoPi R28S support:
> https://lore.kernel.org/linux-rockchip/20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me/

Thanks, I had not seen it - I searched lore before sending, evidently not
well enough. That series is further along and covers more of the board,
so please drop mine.

I have the hardware and will review and test that one instead. One
finding about the PHY reset has gone to patch 2 of that thread.

Andrey
