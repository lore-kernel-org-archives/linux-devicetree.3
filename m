Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6324749DB
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041238; cv=none; b=Y/a48VHWo77AIVyKU6jjuywj0uHhF1jSHd9HgX92nFCTj3qoYS0kD5tilGLKnn+Kj//7oF3pSarligFYSg+cyiyZOc4X3+NLtnle1iKiTunbPGBRjFDZ0oPGzW5OZfIKnK/Dc+0UFBNQ20DBXh5EQRQ2BLAb5wsvOaETvAi2sdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041238; c=relaxed/simple;
	bh=t3C5Fug6dA8Ig/dnotWxKnpFMQyKuhdsviGmTo7wejI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTzL7dLXw+DPFrdL/fzo9TLj34EBO5EotRIz765l02L1My3dwcTCR0qt5UbYqxTZ29lPczsDdvFMmlrURis9UITnGRRK1I+pzdiQNRg9zQ5PTRlmvhrAeWe8QHqRtWKlWc9nNPhGPQ4FQ0D9/1r6drfhOH8lNSY9FC9JIPXr7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SL6OQG87; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SL6OQG87"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso73812705e9.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041230; x=1789646030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3C5Fug6dA8Ig/dnotWxKnpFMQyKuhdsviGmTo7wejI=;
        b=SL6OQG87H3PSWC/tD89aWiSO2AC06XYEij3J0evHi9CmzaeIx3aplnbrD8RCmoRszI
         Gl+Ywv8r4pTPwlLbhYnzbx/eRakRW3z/xQHvOnLMNvTMzWOMbT1vx+6GhI7D+xaVT/zV
         O5xPlNsAGmU+W2clYM/IYQcIUrpKPBDoxEid00k1bUXw43rAtr/MTkN2v0DrHhxMCChV
         cjPcQ4AQ9RcXZVRkw6Xspgca1jw6xzH2sPwlwT8bawyHrBPh5UskVNsXoEaEnLNtzUFi
         O9w6nDvg6HlqLNYo5pP5j3fjHd+rZtnn0iDJwMlsZxG6pQVt7UmtOHNvlrrOSQVSogqs
         4sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041230; x=1789646030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3C5Fug6dA8Ig/dnotWxKnpFMQyKuhdsviGmTo7wejI=;
        b=jK0IYlfeX8knuD/k3w7RVdHm/H4Twf5fLQeHzABzs36OV0xpZiYgzpQy7s97nPWuof
         xAR6cUhhNBhx4IxHF32orz65Zyn4UisGI3NHKqzwXg0acpdI4nS3LbFa3p6VYnk4bn4b
         WgJs9RWu+j4cnwz30MUnl8+MiisELZbQKfJHPI8lzm88b0zi6XFHnqLNbAfUueuf5z98
         nO84PSizRk/mP7KEJ1NVNUKjIY3OctbevMA34vTjl4Rv4uj5QhwwFtH3KpQY2QoSSOTJ
         kP9HzWffXI9KcQBwK8MQUB7swyBsig9PuADjGVjUZ723e8LJkTpz/qEGPGHXSXxooVTf
         XbGA==
X-Forwarded-Encrypted: i=1; AKwUvByjRMf0uq+9lteBe6IGxGqQn/S9rLBSLekSeKuohUK1hgXktrDX/tjZ2//vW7nla0Jm1wVbRIj59JNe@vger.kernel.org
X-Gm-Message-State: AFuF++kgdQHG2y9jGl9+O4mwN3Ggwx4D/My+aqCQIF9OhXj7+HdNWvBb
	7g/LWh3jeZjQeLK1PGoAbQg5lWphom2W3aW4qPozNtbLv7omIAeeJ/cF
X-Gm-Gg: AYBFou2q6fDDPoSSx35hPiyMr4OMf1I6iV0cBWUAiSQOKRbLbsUGB3fKiqX4Uet014D
	+mzip4gd0vpuFtjoN6UfgBIs1crvNRYc/8nqzTsu4GfXNBn2yfxS2THNl8KJOqMs3ObEo4s0kI4
	W/LURiIrfOmaaqXYBIy18aGEXeOumoU38NG53iaTvIcIQG3rkzMh8GqemNyEC5YiwgLQMVhWFry
	Xqz/h2BG7KLEQAUIK4Xc2mB1tWmhoeDCqk+5FCmhMii8GDyqul3Oc3qzKmop8Zvs4Dtm8nN4eYg
	fpVRXhPewJdIAav7VyemqLd3yanXmz28N4Bp4NW1eXh3bjCDe/bKJhQatKp4wNf8mBY4kcz6CWp
	HSled39+EhydQu+baM3uxNvuN1z/HY0SdybU5ERSXLKJJYp42Nn2nUn4C/pxQ/dW99GOMUqyYDo
	3Z4uG1QxUVD1I1AEioEzeHQ66TzeOx0b/CsrYIuun40LPfRK2A7xW/22yrYb5JTcVLat0bdV6OO
	OtgALhO46XPl4HjPNcVdHvvIaVhHtlSEFfEk7/7lpIddKVa0o0iuaTHpBsNt2oH
X-Received: by 2002:a05:600d:848e:20b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49cf824f697mr298682635e9.10.1789041229934;
        Thu, 10 Sep 2026 04:53:49 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm66654015e9.6.2026.09.10.04.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:53:49 -0700 (PDT)
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
Subject: Test on another machine and userspace for [PATCH v3 0/3] media: Add support for the Sony IMX681
Date: Thu, 10 Sep 2026 13:53:32 +0200
Message-ID: <20260910115332.7171-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910112210.44432-1-lsa.uz@pm.me>
References: <20260910112210.44432-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 Thanks for clarifying the origin of the errors
 I am more than happy to provide the tag
 Tested-by: German <germanpapulindez@gmail.com>
