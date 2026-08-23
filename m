Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2693367B84
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484025; cv=none; b=QBxSmz1nayut1rUx6uPjM/mJ0Nc7oEC5b0frrXoxfBy2BKNzuMymUMTpTjNYStGcl+3MtE20DW0A8c3Z1KRnaqfcuez3er93M1RR/87I1Htpk9mRJpoAop0j4SZqsCRwH/Ox1B5ezXXSp1fvOYU9Ub1gedVwU33I18j16+GFSWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484025; c=relaxed/simple;
	bh=2Z3rbla5teW8vnnn8atcqgya6toqlMgS5/3aq5A4QMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hHA7XAlazEZYS2jd2qTajWBG+3vEVJRg9IthmcpuGUq4ltFi1dh9Dqc41MmMSouIHi5OiSTFRd6oA/nVJ+EauBWG6NWMKrC4DYHW4CQhPdynUFhRGgF4a7MmsI1xVL2KPZ2kvNMwrCP3+nRUyROx0IR4QSk2jFAgweHCVbi4krM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsQvSGop; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsQvSGop"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso270840766b.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787484022; x=1788088822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FM+ywSXoVmivGfPkou8dixjoNeI0v4/sGEtAdMoWSOk=;
        b=VsQvSGopApeXFtKuHH61X93JsyQuLL8fQDNJtMFEFmL3i7Pcx22tHLLCioJmeGTQV0
         6ROgGwYv4GDrNUqnZklJqCsWrvy6YrGm2ylcSPwxINdi7HZEnnRnUTWXgUfR3LkX2IHz
         mfWDdO9A1+sr13gdmW9oxr4dk337Qp3xZaAxLzFSdXxrXJ1Nj5XHKzydf7Wv6g0Qh5gJ
         iW7bZW8ZkJzLGoqTqFXGKT3MWfSknkn3QBvml0KR9AfEISdYM+B7yZh7ZSLbLx7UcYpq
         r3ZAQxAjXnKMJuuExgAr7fjkfYFGmFv8bhufL5DjUw8cFVND48TjWsfXwPDCbdhRo//2
         wZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484022; x=1788088822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FM+ywSXoVmivGfPkou8dixjoNeI0v4/sGEtAdMoWSOk=;
        b=Nq5pdDe2FZU8xWb4swxoqiHLOJxX24GMfNY/nRTyjZd2NjqmrcTi6OUkvFev16knFc
         O4aqY7nnSybJjMdskq6SZVshAJJslHl3TjiVIPFWlO2rvx8C+ChkW0J/gufdJI/DFA46
         0slgFTVrw+PRJmRNxlbIuopBgkchVxu9TMziAeStlsDu37Rvlb4NEtwE9mqRzocEdMm8
         YzmwHu9sO8w76mIx3T4yFEvy5iwgUzriZRdeDJr5Yuf95AnAiY+WEgpCuOp+iVghUgut
         69O93qmyXONOFZhXYJA+GIFWepqViLBSPSxVgQF740yw2Jda36zEuu5U5+rzLIdb0ksT
         v/LA==
X-Forwarded-Encrypted: i=1; AHgh+RrJ1nv14jmHHFMSUQJ9/htB9qJICHhZwplOo3gS6xuaGJd5dCGVex+A1RJsiBI0jmHXCg16oOyuXCSr@vger.kernel.org
X-Gm-Message-State: AFuF++kVawe/1rPJobPzbBzKoYwF88L/8JEc0W6MPgEndhaLxn+9XA41
	nA7DQ6eD1p4yYj0Zgd6BbhAwDdyiJPZz04g2i1F9yA1lsapadeEeKPyI
X-Gm-Gg: AR+sD12r4qh+/vnnS3vBI++z3h/0EvhUSEn68OYL5AbiUG3ADhqbhygJ273cOYE5MQo
	t+je14Xt/e9Uap3GUzXdJOLwBo9O+ht6cRyiWrHwKB3MHx1p/zrVgKGEHe+kmd/tYbg5i+Kznxz
	hWfkG3bLci245DL7CxkDldttjUSO8mbmWyCbsGiuA0A8gZmP1zNtbmsZCwy5RAljp5hQ/ztw5jQ
	7Q5Nvsdnh8vw3C7LYcxclqUdKq2O6BjcZ5Wu5nwAAjsOHTyBWytJQOnFUzFsPD8r0dCmlOiHLzj
	+xhOiFa31b2eVlT+mjL3kQsQ4zqcCYevP/hStJWZd9aAT6sRqIMPPvgrkTD5+0HD+QL5K8YRhOk
	R8K7D8ZZcgSKovQ3Cg+uqEeYVW3yxhp30uDNQqb8sT+1nI/xlNd9zvAeVyqGF9Fn4UwElUzsn8J
	Xw2t+3S7bn7hfI8WbtKzFttIhQul7GW5qsUvth/96Nel+a2jpSPSV6rrLfkYgvOSMs3A==
X-Received: by 2002:a17:907:934c:b0:c15:f65a:43a8 with SMTP id a640c23a62f3a-c246a604950mr2181314566b.12.1787484021753;
        Sun, 23 Aug 2026 04:20:21 -0700 (PDT)
Received: from thinker ([2a13:54c2:f000:e268:6d0c:d746:2b12:231f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm707233866b.38.2026.08.23.04.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:20:21 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v5 0/6] drm/ssd130x: Add support for the Solomon SSD1351 OLED controller
Date: Sun, 23 Aug 2026 14:19:53 +0300
Message-ID: <20260823111959.17029-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Solomon SSD1351, a 128x128 65k-color
RGB OLED controller, to the ssd130x DRM driver:

  - Patch 1 adds the device tree binding.

  - Patch 2 switches the SSD133X family from RGB332 to RGB565, bringing
    65k color to the SSD1331.

  - Patches 3 to 5 are preparatory cleanups requested on v3: constify
    the ssd130x_write_data() 'values' parameter, convert
    ssd130x_spi_id[] to C99 initializers, and reimplement
    ssd130x_write_cmd() as a variadic wrapper around
    ssd130x_write_cmds() so a single loop remains.

  - Patch 6 adds the SSD1351 as a new SSD135X_FAMILY. It gets its own
    primary plane update/disable, encoder enable and backlight
    callbacks; only the callbacks with no family-specific logic
    (ssd133x_primary_plane_atomic_check(), ssd133x_crtc_atomic_check()
    and ssd130x_encoder_atomic_disable()) are reused as is. It also
    sends command parameters on the data path, handled in
    ssd130x_write_cmds() via a new cmd_params_are_data flag; see [2]
    for why the split lives there rather than in the SPI transport.

Testing:

  - Patches 1, 3, 4, 5 and 6 are tested on an SSD1351.
  - The SSD1331 RGB565 change (patch 2) was kindly tested by Javier on
    his SSD1331.

Thanks to Javier, Andy, Krzysztof and Fabio for the reviews.

[1] v4 of this series:
    https://lore.kernel.org/dri-devel/20260818080626.30430-1-amit.barzilai22@gmail.com
[2] Command parameter path discussion:
    https://lore.kernel.org/dri-devel/20260811122603.30773-1-amit.barzilai22@gmail.com

---

Changes since v4:
- Move assignment of fi and plane_state to be just before their
  first use.
- Move ret variable declaration below cmds[] in ssd135x_init().
- Constify remap variable in ssd133x_init() and ssd135x_init().
- Replace ARRAY_SIZE() with sizeof() in ssd130x_write_cmd().
- Collect Andy's Reviewed-by tags on patches 3 and 4.

Amit Barzilai (6):
  dt-bindings: display: Add Solomon SSD1351 OLED controller
  drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
  drm/ssd130x: Constify ssd130x_write_data() 'values' parameter
  drm/ssd130x: Replace positional ssd130x_spi_id[] initialization with
    C99
  drm/ssd130x: Implement ssd130x_write_cmd() on top of
    ssd130x_write_cmds()
  drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support

 .../bindings/display/solomon,ssd1351.yaml     |  42 ++
 drivers/gpu/drm/solomon/ssd130x-spi.c         |  25 +-
 drivers/gpu/drm/solomon/ssd130x.c             | 420 +++++++++++++++---
 drivers/gpu/drm/solomon/ssd130x.h             |  10 +-
 4 files changed, 432 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml


base-commit: 843bc34db94bff0612c8294861b156489958897b
-- 
2.55.0

