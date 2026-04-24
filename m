Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0B36D9EE
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014825; cv=none; b=o5j22y5bY2qVoeeE36NvmefJobNiT2bSQyUfU9mmvqzg7FvYqfUrpsHFLN6tjX2bDu1bTdGEMNY8WaTuM5Q1GE7nH1wyCv5M1rKAI+uorpD7pEkRN01wtUclqwZdyXi0LQn0VA3V0PLfbr/xzkgpsDdGQm+CSJlQjV4uSaU12TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014825; c=relaxed/simple;
	bh=TTMApobnGmWOOW06RSWxzVL2ux7eZCtH8CR2tkV9zBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZuwLnVGZuMM6VrpJsttZ2cW0ej4zwSjUVdfhOpx6PoV7U9Co2JGVK9fteiJRGv2ouOuKWvPJV4qKfFiRCKzVkYNmb+H2B4tJAv9AWxBVCk8jh8k+2trm0V7nxpBuLRY1fCYxVnIq8f2AyPBAYleRaLuJligw4naxlL1d3dNuO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUhfNRB9; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUhfNRB9"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e936caafeso74788691fa.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777014813; x=1777619613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A182jZR5TwBM/HJjBNyA3hAZAqMm6f76hkhqyZnm/tw=;
        b=VUhfNRB9sds1opZVvInmxG5RQYS2iN0wJhkYjK0kVRtDjW61M8YoxPYAmhpeJk+12k
         k1koRQlGVfcxnLBNR5F1q1kdNVxDxFsXa4eyuyxqyzTZyMgdDABxdWlwZY+tJvdsmP71
         GMuuRDAhAIjrLA9M4CzQ/NIcKhLgKDH3Hp4K9Dt+tqXNXJuSAFuB94PxFPB01wiI1/DB
         fe6ZDofZk5cz9OGZEb/kk1nnIiwigWB8zaci34EzNw1jCBX8NuYmdsp47jyh8hoZV04i
         2kcZtYFA+3urkfIXA29v5IsdC081a4gD+GR8DQshAQgKHf6fkyq0JSkfScOkKwA5cAVB
         897Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777014813; x=1777619613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A182jZR5TwBM/HJjBNyA3hAZAqMm6f76hkhqyZnm/tw=;
        b=ruu0U084ocKdePC6D9VAa1aKntxaSe5wxCz3XrP1g6YVAlisagmZO9Qs4twaWaH6zY
         XMgNTTY2h60XV2HjmkE2A2AeGdK7J18Dn1vpVPWkKxZhwbMmZYb+J+aNn+RIG84zW5Oi
         O1m5hWKWEnzsdhVLBb+xj4avoytoPX+1I+0IQheA2Q0Vr2FkJdTJYzRhSM5xMI7w52MK
         KRQBHQmO+OsVaIP+YT/phIcUskb2s3xjf2e6ojFnbzszZk1g1MQKWdDOXi1BmU8EeKr0
         85EX7Nf1XnBDawzlu/inSjkT2c7QRGAcn9zVyMKFbhX92EsmmLhFXpSCiqgmZvNERq0y
         kl1A==
X-Forwarded-Encrypted: i=1; AFNElJ/8OfQ+iYB47q++gj3O3nv/fgIPbJi7QEOEapdbPBG4GqSgvqjHNNCcdei3UdVQDIr+y3+ONJdzmGsS@vger.kernel.org
X-Gm-Message-State: AOJu0YxHuk0ijLoUtRcYl6vGkzE5r0hzWhyAsonJVi0p1MOVx4b5qh/v
	2tnl+sXgJ+/W9GxHIe0oQ8keK1hSdBqjOQgMXjAOHBFk/quVjmwnNCHt
X-Gm-Gg: AeBDievYhT1dcgyHlxAR+7KwJoLPmGuL3r91eP3IWOGXRhXr59OlSpr/6oKUGvKwR8h
	9dGKO8G4b1gD3r9Pi7wHni+rsh5n85sQl2puGJUCQKnpPufLJRnf42XOFv9Pqob67z9RiAMiATm
	Q4wiZk3KoU+knd3VAfUdWYbc1X5FY0X7MMYW4tl8d3/bwGlmpCDt1S8odbzFcR31yzZFxsqFOWV
	7y8vqhZzXyJ3LcO5GNuBxyf652uZ1t+7eCKwsUoGvTDUjutM7+3ihT5m/WRbey5RRZ9bUAllAki
	+0VHkXJtdtK5TY5ABjyupIMxy7toqfea3bFMWeebehol/BXLjiRWhZBE04qWVvK+1QStjkoALAA
	zoPqbMergiVpMHzHhdeCN396BswuTnTvGEVfTLg2TaOMQtLppOPtuNlD5HTV/Ifi+aDXebIeEtt
	XDhvYxMV0kNNGbv7SuZh2+PZ4=
X-Received: by 2002:a05:651c:1448:b0:38e:90b9:ce98 with SMTP id 38308e7fff4ca-38ec780d734mr96591931fa.6.1777014813092;
        Fri, 24 Apr 2026 00:13:33 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb290095sm43760131fa.0.2026.04.24.00.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:13:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] input: misc: add support for Imagis ISA1200 haptic motor driver
Date: Fri, 24 Apr 2026 10:13:03 +0300
Message-ID: <20260424071305.89503-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISA1200 is a haptic feedback unit from Imagis Technology using two
motors for haptic feedback in mobile phones. Used in many mobile devices
c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Beam
GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.

The exact datasheet for the ISA1200 is not available; all data was modeled
based on available downstream kernel sources for various devices and
fragments of information scattered across the internet.

Linus Walleij (1):
  Input: isa1200 - new driver for Imagis ISA1200

Svyatoslav Ryhel (1):
  dt-bindings: input: Document Imagis ISA1200 haptic motor driver

 .../bindings/input/imagis,isa1200.yaml        | 145 ++++++
 drivers/input/misc/Kconfig                    |  11 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/isa1200.c                  | 459 ++++++++++++++++++
 include/dt-bindings/input/isa1200.h           |  16 +
 5 files changed, 632 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/imagis,isa1200.yaml
 create mode 100644 drivers/input/misc/isa1200.c
 create mode 100644 include/dt-bindings/input/isa1200.h

-- 
2.51.0

