Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5CB5326CA
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915273; cv=none; b=MpJJSAseALMKQlb7EY3WMeLdq4776vwyUdTBOVzCGKezCqIE5gDqE3+1O6Iil8XZ+nj8sBfpHUnWnMnI96XltywCv+OvKDWkseZnmMIueLWWuMFRsCNKtC0nzExYx0qMty6Inf7UAXQwiXINdFyQv0Q6B/TMUKENL+iolAcj9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915273; c=relaxed/simple;
	bh=VkS8/eN1CMkj+9VO0vpEM66MQdnGxIRtGFS8LIZEl80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L0PwYgO3stsAu2JqcjzoUfkWKEjWTvlmMG7Edi5caP83N4Bz6ro61F0XvXpzETrLnkP7/kKmq9CiYZTKf/U2rvlRckuP392I7ctzafQ8e2kIZsQzeWLCNZ9EJPRG6tp/ouVtcjFZl354hGqBRo6vzE2/ikonUPoaquNOqtz5B+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZameJJu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZameJJu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a01933b584so29248505e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915270; x=1792520070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pycBEIgejzDg3p5izsdhMn99CZxMwrY/YZ6UKG/0lpg=;
        b=GZameJJuyMht74Om9e7bAMLJ4a0PSqQvIDUFK6Jm24DnorqJMwTzACYIqEqy4rqs52
         JAZeVp5WUtEjAz+0F9sA6oX9vdZNHkUoB19x8PIkl0HgbJBTZ7eBeAyAGkQJYPW8Oo5M
         JDqgWPrJ2CG7v23E2JwqH4JARlOyYjRKwbwUpJ1lx5cyoMtC+/YHh/r3WsCGFeP9aH1e
         tphZJDGnByLc8cOUXLbVYlayAl2cV+X4tNGX/KeEbyLg4oRdRh5unwkLACvQKh7ZKcax
         axmEmbGnJI2ezfvSeP8SAu7xIYaLeLNud1b+tYiGhhKEQplR7lX9TkroquV4GjffYigW
         MNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915270; x=1792520070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pycBEIgejzDg3p5izsdhMn99CZxMwrY/YZ6UKG/0lpg=;
        b=sqjqDd2RoZ+KZhtWS4Rsc3GT1CRginUvX4iXCqDVGBy8OW46W8hLpm1wXGwdH5k/JC
         CKaVRJ5WSWtWCkYh3ibM+UqVgm/5VeO8GogNYWUcRt6sQupPw0VlT/GHM5fJPJu+ncFK
         dL5dutJ0e/KJ3BMizjE+v3H4qaRrMQL9lnPb7ahpQai40lz5IpeCxYY0K4y+gBuR813E
         GjZ6YVUGlqo4Dvt92KS+zNMz9fY5lrm3gFXvOxZAEB129a1tfVGRlg8p/7ZIcUljpqdC
         c60HliGn0YErdWbOFEUwAnf7e/yct3XKbD2WX26KssU6mfHJLh387NnwVsVVg8M5F2K/
         tdrQ==
X-Forwarded-Encrypted: i=1; AKwUvByDkov9rsvHIgu7eSdTw3chWkM+qo0iTq5z/Q52ybFg/i4XVGVjvNajKwzngEponqKWSoEY4WnON9zp@vger.kernel.org
X-Gm-Message-State: AFq9FYKwXhdYPnqZWiDqPboUBGXRze4i0BNrFsetZTMn2nBdKK5extrF
	FW78jWoNHt8YoOxPvhW4YC5BkMfONok5nfdTVoUNig+264+O0c0vDK+x
X-Gm-Gg: AYBFou0T2nJyAKWILrKH3ZkRUQGtePfTcrcbosYOoF+FmHCM922MvVeeEqDGeAfPnog
	rbpkThBDv1PG26Z2lPYBvG5cXTiup3HWQ8sDMszD2JpKsOFG46n/smBP9R1Qmzwa5a61OeX0w37
	xIwTHNxOkbC9eS67ilx4kWzWB+PEEZkkMa9TeJmsvc2DuvJGRAf0TM0R/D7+piWj2Ay2HxdeJKE
	dkw05G3FHX+knsVtAoH1D3Mnr3ZoVucMkzArR7WPr8dqUOpwgRDLgapOu9wQiohi5zRojgdd117
	Luh369XHmN3RcphTu415zopUhsfj1eAh38NnbKihxUIHWiX1AHXTjj7zZQMoJo5Werzho6VqnD2
	7kx1bbG3z5TuMgD76EBR/AbmyByQA9xdNzoB9siy+uTzpLCZlokA3koD3Y2Y0uppigWdv690GlJ
	2Cto2U1XTyYM5jfaBIjO1jh+LwkFLE1se+ZmKM90aNbbpAN7r7e348liBb7zZnLC6HZwtDD+G76
	+OX0wo+QQaRnxpkGGg=
X-Received: by 2002:a05:600c:34c4:b0:4a1:b027:99dc with SMTP id 5b1f17b1804b1-4a1b027a161mr36768025e9.18.1791915270126;
        Tue, 13 Oct 2026 11:14:30 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm383933345e9.4.2026.10.13.11.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:14:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Milo Kim <milo.kim@ti.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] lp872x: remove platform_data based probing and adjustments
Date: Tue, 13 Oct 2026 21:14:10 +0300
Message-ID: <20261013181417.492252-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upgrade schema. Consolidate driver file, remove platform_data based
probing and add missing regulator/chip supplies.

---
Changes in v2:
- dt changes applied to new schema
- read dvs vsel and state into local values first
- use dev_err_probe in lp872x_init_dvs()
- rely on ti,general-config and remove ti,update-config prop
---

Svyatoslav Ryhel (7):
  regulator: dt-bindings: ti,lp872x: Deprecate ti,dvs-gpio and
    ti,update-config
  regulator: dt-bindings: ti,lp872x: Document input supplies
  regulator: lp872x: Fold driver header into driver file
  regulator: lp872x: Remove redundant regmap wrappers
  regulator: lp872x: Remove platform_data based probing
  regulator: lp872x: Add support for input and regulator power supplies
  regulator: lp872x: Use macro to fill regulator descriptor

 .../bindings/regulator/ti,lp872x.yaml         |  18 +
 drivers/regulator/lp872x.c                    | 672 ++++++------------
 include/linux/regulator/lp872x.h              |  86 ---
 3 files changed, 229 insertions(+), 547 deletions(-)
 delete mode 100644 include/linux/regulator/lp872x.h

-- 
2.53.0

