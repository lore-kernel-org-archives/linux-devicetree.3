Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E43346A8
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422877; cv=none; b=lsyU5VkYpI2BBO4tBTbxysnCLPOckS6T/Tw2r2Nv00hlgwA4wSBIunWl2P0VhFOJV2LdIYJ7wxyfWUEuy1oNwXendEHyV9D/DcdavsGTJTpV1BReCFoaWqkk4doaI6WQcQkMGTDJoVZTUKs7U+yTUuhp+N7JaZCs8oPvoB8XThc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422877; c=relaxed/simple;
	bh=hYv+G9HVY4uyMNuRDlZU67xGbvlAEm5vs4ITFgbJiug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lj9rIdbG3fsoDdoj0wbBW1lsZWddq6IvAAhNNUZgJ2EMi1wQNwn50KuQOk1zM0KoBm9d6Lk/UZ5qq+JIiir8MnHWW/AjB7bOQvdKFcE2ASA4k7wA7WGippfypOboMGm/fyUjNEMWZabJOlIsqb8ZawlSoyUrK8PAC5ldrOLNzqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ce9V3RNS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ce9V3RNS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso517188f8f.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 03:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776422874; x=1777027674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EtF+ZEQP6zumvHcoC4Xl4LiFgpkDyF+mdpLzjK7diUk=;
        b=Ce9V3RNSlwP+8tPGgF20AShTwEJVITr0rHEsT+hoBJ46+ZT350vBYmDmBlHOsRr/5k
         OYX53cvI7qBJY5F9juOB8uT14fQjBKFtb61BzLOW7QaSi32MYtoIlffZV0UqXD/68ELk
         lozqkeD9mk0eZqo4EPFkYhcMDHV8j97HbY+OhES/1B6cZscO43RSgMFHkbdDZEOxFbyR
         F58VK+J7qaDuaapdlZb7AtlE4VDcC4ylLeQv/IkBOwX/PKTjn3m7UsoqNMJIapWD6q6w
         //uKYdZaMqw5JBBuFgYA2KgP85qBKTITT8/0QLZx3KsQTERLjTZizmmd7OKDpS8x5Hya
         HFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776422874; x=1777027674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtF+ZEQP6zumvHcoC4Xl4LiFgpkDyF+mdpLzjK7diUk=;
        b=ZcDbhSAbjkBFUVBgktOtPmrXugL7Xuv/JYyPldn7kGVV5xoTSD9NIcsLVG3nCQSqGR
         pQ3AunXVn3DSUd2Jy46c8Vmnyve5cKy5Oqeu1eTqPFfBZQ35z9Pn9R1M7yNPZ9H7AyOT
         z2l7pZ5eGyYgq3O529LNaGFuJAZMIGkgWMpCdu1zZfnCHK4u4MhW7A+pB2feOl6h47rC
         xvhPuNjJDYjwgV4QN+5+wO7B8KjAIBnNKXOjD4W/mVsyTgc/33V7nsAoyl4ExvF/w3F3
         kqaSfAmSJtUF6Ctt4CJbHinLM1NzM+A/BVajT22M+9NQ4Oie0H6oJLAtQlhmnvXHXgeK
         QX8A==
X-Forwarded-Encrypted: i=1; AFNElJ+WpdX7uVnFrihZrK3s7jScT5Vyfbm5/uJjMVplYz43/iPB4/ajIH5hIvvKjn2sqcgIIMppAJqjQ+iC@vger.kernel.org
X-Gm-Message-State: AOJu0YxbWAL9eiZAvuUQKl1moYIiHgPg55WbE4XaSSjBwOEtM9TjwCFY
	mV727cyWa79so4+7+vpiFmvq3mhPL4sOyhGI3aYpX4npqFiPAVLbN2gr
X-Gm-Gg: AeBDieuh9Yx1n+dZVCMyxuwGq1pcGdniHMsRcIIgbRxXHlJKPB15nzJuh7RfJU4WU92
	f6q4RFHD7zbnjxKgp9Nu48qVLvwhPomGYatGny5bdgXdiMa4r/GMjlGosXxFmrI9Up/Gk2B9u5o
	0qn3wDyG9NWhz6PMxtSnZzG/mzs0qgmd2D2577vJjN7GJIlSLP2cavjOn4uO/1CUFHrrB5tLxCj
	IrA83kBdCqWnxzrmR8qYcDm9hNrPrcu20QlQy2elRuqjbC/r3hPY2NVmUg1fYwY/mjRxLW4w7mT
	vI6pSFlvSVy7yawEQ5Ymg8MdtquWtHvGTxAoyD+seZ6l7wQlp33C5xWi8p45cZ97mhJlYJmVFe0
	XSQJFG4zokCc77CkkdaMlzK6R14RaMIglU8IRDpOZeyxZJL5EYca2TuYNbxDAkx5pfyOF3zLatU
	wXZCWRr8yJZLqk9SGwV50PWvIwVr9ZrA==
X-Received: by 2002:a05:6000:61e:b0:43d:184:8a9c with SMTP id ffacd0b85a97d-43fe3dd3a8fmr3614532f8f.12.1776422874310;
        Fri, 17 Apr 2026 03:47:54 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d5b1sm3732966f8f.30.2026.04.17.03.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:47:53 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Marek Vasut <marex@nabladev.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for Zhunyi Z40046 LCD panel
Date: Fri, 17 Apr 2026 11:46:29 +0100
Message-ID: <20260417104740.259689-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zhunyi Z40046 is a 480x800 24-bit WVGA DSI panel based on the
Fitipower JD9161Z DSI controller found in the Xiaomi Mi Smart Clock
x04g, apparently in two different variants.

The Fitipower JD9161Z LCD driver IC is very similar to the Jadard
JD9365DA-H3, it just uses different initialization sequences. A
partial data sheet is available at [1].

The two initialization sequences for the panel have been extracted from
Android original firmware for the Xiaomi Smart Clock.

Variant -ctc tested on device. Variant -boe not tested.

Changes in v2:
- Double checked and fixed some mistakes in the reverse engineered
  initialization sequences
- Changed the generic variant names -v1, -v2 into -ctc and -boe, as
  they're described in the Android logs
- Fix alphabetical order in bindings and correct company name

v1:
https://lore.kernel.org/all/20260305195650.119196-1-l.scorcia@gmail.com/

[1] https://github.com/QuecPython/QuecPython_lib_bundles/blob/master/libraries/LCD/JD91651z/JD9161Z_DS_Preliminary_V0.01_20180803(1).pdf

Luca Leonardo Scorcia (2):
  dt-bindings: display: panel: Add compatibles for Zhunyi Z40046
  drm/panel: jd9365da: Support for Zhunyi Z40046 panels

 .../display/panel/jadard,jd9365da-h3.yaml     |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 313 ++++++++++++++++++
 3 files changed, 317 insertions(+)

-- 
2.43.0

