Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C114D44CF52
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036587; cv=none; b=oLAbXCP/uGOpQ7PRF9hkUtpOO08/xbDIWYZSnYa6gWUQ6qF0dupfCs6RL/8kw+wgataLXYUtJp4NECdXex6z9JKq+FPdgBDL9s7SaQDMfjsx05ZBcHS/NPXXzA1Lc4OUmdgRRAvl4zKMEAgALCsNSc7UTEIjjtGRWJQPNUpXSVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036587; c=relaxed/simple;
	bh=c/awOCqUccuwHv1bu6mH5ayUSTzx+jzCTlB1GMYOoSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UolhoM0bMY8A7llvva0d0JeTOkDvU2g2qTwxz3wZAoITUjZabS+Pt7rD7RlTegZsKBtc95ev8mzLuT6GCnWCIXZmqou4HGVE47crgrToIYzYALsphZqaNsp6k8VKHLTvg/RQji6N/h6tHHM6iMtz2+svTKrGT9n2/1XeBZM/1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5Ztca64; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5Ztca64"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso8864855e9.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789036584; x=1789641384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/awOCqUccuwHv1bu6mH5ayUSTzx+jzCTlB1GMYOoSw=;
        b=h5Ztca64mSFji+xzYHGuILjsU+vsuZBcidj4JpnnKbeWjStzrlpWIvcsH8KtFJPyug
         nFfw/KPsXNnjrGBsT9bbHvESO5EeFU7qlIzfZQZImA8gTQJI8B5GL/iXCIBU5UY6AzPG
         wzSypiTAWJuo95phyampBpj/0e8EADBbrAtXOqRglSdEZFqFzMQjQ766Mg2vqe0vE3p4
         7uksG4+XcoV1N8oR0ubxYGkut1BhSoYt8occbpJ5KZqE5RihERFOCz2MrXalgn/Kv6k/
         axqgDu/QSWsl7uCwB/eJtaBV4z4NFBKzy9V4zpuimOMYDfcUCRrPtGiMGc9hh9jEKpUQ
         d/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036584; x=1789641384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/awOCqUccuwHv1bu6mH5ayUSTzx+jzCTlB1GMYOoSw=;
        b=s2OOnlNlGbne3ufFqVmlNjTepQSMEwm3o3yRZflhYTEJIygbhNZXiCoZOBOFvDsaxp
         zzAu9VY9VIloapCxa6CQugm1Om/RyzvQBZjGUQi+N8eaBaQDZNETH2ENwYHaxVrx9JNm
         t1p/2aKWNq7wcmxysa3hP8/ziJLZX0rFQqur8eCnxY696RSJRcSGbC3j0Jw29FRlrA2R
         q5ZyumtR/XuvM1PvPFdSCL/m/0G1BmWowXHRU1laUKZ65zpOuYpbBzWrI28kHlUwCO6W
         fJuvC86SeS/iimKa8nk11J0KmXt6jqNBwcNx6fihg2OX0UNaqLxV1SPUKIcA5QM9FU3w
         sVjw==
X-Forwarded-Encrypted: i=1; AKwUvBw8XYwNp31LzzVPU7gnO09vQ+/vF0TaWCNbHU6NuedvzBmUt2XX0wP2sI7oXiIMbTL5uBZyhf0jCgwy@vger.kernel.org
X-Gm-Message-State: AFuF++mFKbBhqFZJCwLpEnn6kkqz+D4d7tf5vH+4SGv8alqeMv61QB++
	F2cQ3N3mLSH4/NIUF2AdC0jgai4tIxUtig0JSRZhKAR3h3oX3VjfMVyY
X-Gm-Gg: AYBFou16jkIM94l4dTsG96Uy36b97XwwoKDgx9gANQ5Z9G05lIltoYLX4D4sjOwKhQ+
	ZsBIdJZPGk/iicl10Wv/5AcltsRv5WOvfwZ2olOwfyKmIaIO9qAcPne/F3BpYYWcvdJs0bsuFq2
	+rNfLilqg9SzLXnDjun+/3gQCN47LawQz4uM7Frh/5dkoB3Rg2EHZJxcaNyjQ9jk6IX64mEtVQY
	3KacxlnDBv8OC657wndKOn8JWowbHqexKwhWmtxZBOrn36TRMLzwB0SCf5XKCsUtbyrkf1ErGye
	rc+w1pXGyjcBWMB4JiqW8X2iKtHPROTPeB2hyq8SY9ovMSv+JIJs607/jDZt7UKpauR5DzFjPES
	B/Mz0VaRTY4+fkXtpn/ra/OvOQoOaKL464KC9tWG+FOM3Zy/zYl/lSxE/lqm0jU6Zyr4s+A+N1Z
	HaqhW3zo/+UnWWMVzm1T800Pg/4TaCyMCCi/2hAZd3IsPNS7X8GDhRXT+vBnrBOVrPwDMcK9LZ/
	/DNMKebwtosaqKAZ+JJJUw5IT57+uuXUsEJj0gZxVE+jLXd7Bae4vjP9fCBXkOk
X-Received: by 2002:a05:600c:638d:b0:49d:2450:68ac with SMTP id 5b1f17b1804b1-49d258dfc8bmr142550555e9.5.1789036582306;
        Thu, 10 Sep 2026 03:36:22 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb04f1esm103415165e9.0.2026.09.10.03.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:36:21 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test for [PATCH v3 0/3] media: Add support for the Sony IMX681
Date: Thu, 10 Sep 2026 12:36:02 +0200
Message-ID: <20260910103602.19228-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909203717.90605-1-lsa.uz@pm.me>
References: <20260909203717.90605-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have tested the three patches mentioned in this email in the linux version 7.3.0-rc2 in order to test if they solve the IMX681 problem

##DEVICE USED
Microsoft surface pro 11
Cachy OS

##WORKING:
The camera is totally functional in apps like qcam and firefox after aplying the apropiate configuration and installing the IPU7 Hal and bin of intel

##NOT WORKING:
For some reason, when i tested the camera on gnome snapshot (version 50, istalled with pacman) the colors where completelly wrong (the whole image had a magenta tint to it in addition with some horizontal magenta and yellow lines and a diagonal line that went from the bottom left cornet to the top rigth corner) and the image was inverted

##MINOR ISSUES
all things reported here are little details barely noticable and dont influence on the usability of the device
- When exposed to a really bright ligth the image starts to gain a green color and blue if the room is almost devoided of ligth
- The cammera has some kind of "Snow" on the image captured
- The image captured tends to be brighter than a normal camera, this error increases the more ligth there is in the room
