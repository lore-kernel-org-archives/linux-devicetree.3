Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391B39E17C
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624346; cv=none; b=Un5ZR+Iau89Q7OPN6SgbhqbJ8RAU6OlYAcDEAlyzgI8aHrinovomzmSwnHXg8EI2sAPjoXwhC+1krzVMQvleEvM0dNiRcfhcgxEAMGyPdenPVOmXXQbeOSmR4EkF3/4prYp4wosZQnL9zNXjFPiF2G9xcBg8jWBNTsgXSTlQyPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624346; c=relaxed/simple;
	bh=pZ5AZCE8CUlKxhBSvGXDDmIUbmvrCQOnJDfJS2TH6eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1MG1DGspBMi7lCN3KsMCg6dFs4qx+tdeWraGx3A7oJkuh+GTBEzgdvh/EFNdH/s0OJFCDutSx7l5/CWfQIbZQead3vL4Gjq4HBhC/j37JhkxcEJ97dvmdhzVms/bZeqyJ8JMVDQjG+3y8ZvLGT3kxfNFzgG6FsZn5pvNsIx7xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBDe5nLf; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBDe5nLf"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-479d593a0c3so5196374b6e.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778624344; x=1779229144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glwT5koQsVbYhX7I4MEF51k8vuLfNT2TtvwRkG3+C44=;
        b=bBDe5nLfjFKrhqUya1g6DhZlX+i2MZWmMYUTidZMKZEZjJNxk41BQ6+xhd+Yczkd83
         7t4nxQr/kX9ZihYDG7RnqqmYpt1EP9PMxZ3hNG0gmbXFNGiIvbMtyOEAah0H5eosP5/J
         5ADjIT2JpsmJW/z3gyujdeP/fQkRFA6S7aMljKjjdYSmXTuTs1XA7S04QLpnrhHOPtM6
         Xwb0WHLszRqopyEJu3/rLE9ACB8k1AJzYniHAMxyowcXSLLg6IUCnG3cFKMhWWVB9rSh
         /s0dCrCQFd8+cUBY/eqO56ea2M9KSp572lvKXsHa74m0N05UQEKsisnnHfnyx57hpNuW
         VxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778624344; x=1779229144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=glwT5koQsVbYhX7I4MEF51k8vuLfNT2TtvwRkG3+C44=;
        b=ST+hQwQPMyfhqEu80Kq/eyFcA7tNu1mGsTsLGWzOyXJ0eR+7bOACKyB55pvdmr0YXv
         h1Y2864ifF3fLbPXV8qO2prmtNduq43oEIxvSg4n7ClrHsCqE9fvh4IlWtKfzRhFrM6i
         oIS7Uj/qmJKbGirlOjk4Kf20qmmPvkhpvL+RmAjXc7rCj9geAya5oX8b2vQZnSKurxwO
         qjYuzZhoiDkF5Hw4YgiuDuEtO3tpTGavycXzJg0zLg4OFvVITmZ2qvjC0GnG+TXGu34D
         lAhkvdVjxD6WbLeWFrgssrPtmo3wNXYwhhiByltPMH8f8p9wCvbp4e76Wvntfx/MrnoO
         yeWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YUsnxti1u63+rl5cU4BPxAqcUg8/Jv6M8HGhHhf/wnucvDmDzJaXGt3NUT+bwuYDlH4xO66Goaj2C@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd0dWewJt58wGFKPnHyUBdhfP0UUMSjTlPYL9KbgjkLQ/sui1T
	ftNUQV/y5HDAylbgpfLQuAwxBihgBW80B5yGfO/hWP5lmsLrku+5AZLS
X-Gm-Gg: Acq92OHGSYA/5oOkb/eMCoJGEQ7meKUgg93BGWK3mtgv721g7oVY55z1FLApMu69uI5
	MOVC8rQMSP8FlFwGO1EywrnGLNpNxsmzkRvEOiju4lxBHvHX+ehcSbQxic3FHUNsrm2pQ/Mh5cy
	ClYszd7zKYyd9+fQDzAIkqa06D2YJ8MYUjljRGPp5tEFxlQ/jOsWBg24qNtbhc8oCubXGVItedM
	K3U7KQrEyE28UQxDa1fYfDROAqrqc7n6t5Lgj5z3HNKYzVdguWfmzZsWds5jvxTDVNbSqvzlXrI
	taDdAaJzzBqkwxYJSZb26VNmC5DMroDYKqgfB2fZxmisHp1BoW3jUZ/O7wrJdmgzqk4v+oMMgKG
	xKBKAy6GfETron99G2nGaEA+tCy86d2AuocY5ChxfD50I9h99qNDCaDNH5A2QosVIIx5PyjtunZ
	4noRYMaixqV4PBYinQ2hAR
X-Received: by 2002:a05:6808:19a3:b0:479:ae1d:fff6 with SMTP id 5614622812f47-482b2cf1259mr540768b6e.11.1778624344580;
        Tue, 12 May 2026 15:19:04 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76986f87sm23291473b6e.13.2026.05.12.15.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:19:03 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V6 02/11] dt-bindings: iio: imu: icm42600: Add icm42607 binding
Date: Tue, 12 May 2026 17:16:23 -0500
Message-ID: <20260512221634.256747-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512221634.256747-1-macroalpha82@gmail.com>
References: <20260512221634.256747-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add devicetree binding for the Invensense ICM42607 and Invensense
ICM42607P inertial measurement unit. This unit is a combined
accelerometer, gyroscope, and thermometer available via I2C or SPI.

This device is functionally very similar to the icm42600 series with a
very different register layout.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 9b2af104f186..b69c6bbb6f6b 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -30,6 +30,8 @@ properties:
       - invensense,icm42600
       - invensense,icm42602
       - invensense,icm42605
+      - invensense,icm42607
+      - invensense,icm42607p
       - invensense,icm42622
       - invensense,icm42631
       - invensense,icm42686
-- 
2.43.0

