Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C1B1DDC1D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496176; cv=none; b=KWIxrgNzjc7qPx8VarPhjtvW5zQRoZpA7lO0D3XRBemjlK1SPQTBh97yQCXiwrMq6O5FHfAwczrBMYkj3oenpI0zpn2vBPAuyE7DYLlc2f3B9hULIGP8CYGDBuUQjEitHuRWNWYoFuV55EPgFogAUNW3z2C+shNymjXIc1unDzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496176; c=relaxed/simple;
	bh=2Fbe+51I+NHaqoJEm/Ia1P/RkOrsQ8sOHQ84+D4jX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NeIEylks0EoEx+xIuo+ecnwWr0f7/NlZdOPHJCkdWqsf+7UP9bcU8jv4PKCD5lyNHptz2PplhU+RitvtuJCCvyUcAvNRR+SUxcYdfUYRx/ToN3zajM/XRwVYbulumroKE8DRhqbzEMIVmq0QjVD5upwBh15I7vpjiX8rwN+gTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvGLaGKS; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvGLaGKS"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-368977e33b1so97143a91.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496174; x=1779100974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=XvGLaGKSFPmqZENA5e666mYVr2m216rLf9TaaxaRCCh/Q1cOxaEueKSvJ3FvUyXjN3
         XAEzIC9lG/TdvzLkQrzRpHV6kGlJdUttejwUVK4g5ECGnYkz+PHay07PtqIb+ldNe7nb
         pe+SxFAUHV+1ffTkLKUiD4p1i7LjjTE0ld2fCLt2k5xTq6LHywZzQSTdm7mvhUmGpDIJ
         jPnqavGyg0vBiI7DIcIX6LIlWDjMviopYO32UEqYhjOfXfQF13H6XxDO18NQmGRUSbtQ
         r5hdYf56mghiGYldRiQLfUnPwioEOHalit+jOLRlWdIOVRy58BXCvVNhktZFicm5esh8
         Il0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496174; x=1779100974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=G1xOl02qxuNqeRNSUvRlhuqXhfnT+yPLuhOlUFDEdzmOHm4sHvOluBdPNJH5BZx437
         1SpFciRGznSxO4ajz46AyJBeyaQqx5OmquUTq6jw8/7xFhkYWDrCzjjk1w24pcsTwB4b
         Gi+j0NT2OAXyh6qCvHzcT+j9mrb1hjw+PoD6RyDx8m5GWLsbkvIZ+0cez7WQyAcVHbEm
         OG5cdk1v+S5wKLxo4GRT2oKyHrzAgFDmYk8d/Xfl4jGLH7vkAzksJLR5R4pDXv5j+Vv/
         G0OJ+9cYD1IZgMN2CqF5k//e2/Q5OIh5cVRNTfmHGdcE1i05pgLrJYFKTIJtQyQCqRbI
         rnUQ==
X-Gm-Message-State: AOJu0Yxxpj1jT6tfKc9G3nFh7bCUr6vKPcfRfoaS1ucI2tkXzgzxikiZ
	ACbt6KErGoOo6+IcQqM12wuRo/4aXBJ3qYX/uWFbdOFhzNzwMUuAT1AV
X-Gm-Gg: Acq92OHYu/Hm9hDOWi9xGsenDFERHoY3fmww37UnLdrwzdT8CAcafnZe2BYXe/nX6GE
	MHYzUew/gFuahVjYUTcUtdUmbIwUWLPmtwf55fwAUMbL/oprpXOwA2BhRCiif/IV6cqW/hww3JE
	JjuRj+FRBiYKAHHE4wGt1hSbaQXfJol6xJNSHUH8rIf33pcu5JFKFqhcgSkwya/8aiP5emtpF+F
	f9yJL3TlvWbgQNxsAP3DeIOXLmWime+f7D03imvOK/0PLSHpuwstQAAdjhnJPAksCJlCKLBVxyT
	LVhpbLZI0NZMlEQwhpGODpqho7177Q6SbuHWspxg4mrqRvaseIQxyOxzTxV28olEaRGfXNpobvU
	oUhOPtP3TfM7/XaiR9s0OpU36HWOx0OXq/bCF3AUwLhiac7t/3GpcYHBtuPyDWTI52cS4zrrXqo
	QCWLQ3iWAm5HjNCMb4yYNg9qoe0bJN
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr11161538a91.25.1778496174159;
        Mon, 11 May 2026 03:42:54 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:53 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 1/5] media: hi846: fix hi846_write_reg_16 handling
Date: Mon, 11 May 2026 18:39:23 +0800
Message-ID: <20260511103927.279550-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0

