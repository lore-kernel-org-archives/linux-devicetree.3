Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A743AC0C4
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074856; cv=none; b=sisUPHh5fX8nkwgYCjgbxUm6N8wcbD0w6kVS6/M+n/b64xnH590Bs/Ma5LbyWgTwvCvtz9zdbWwHVrJnXKbjYJLGSa6pyH6PzolwPNzvILQ14CaiT1ycWTlNc33ab1yt7ct6tWiEdogYYcOaOO9scqFQR6h7qYoUI8n4VRVZxUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074856; c=relaxed/simple;
	bh=Mwmud0ptvuHV+QGGbUoP8Aq9HWXBoreRMpco68h7Q1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UW47AB7MiBKkMaBXYKbJkXVFJM3YjGmb9Ktj2EqIk0fHBjdJdaAGg13PY0uM7LUopUNQkIrbTEQhuctITro2OX6wBeo9P9O4dvrWwDJYOBzDwjEafDNV+/G2cYi7Z9nqySOYijRefjWSr4y5RCkHBGhL7yX7slgsbO9vK0H3NAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nacJeyKy; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nacJeyKy"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f1f6103afso865412b3a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074855; x=1776679655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee0L/AD5HlNBkYL/vdO0qzIztqPcV8bZs1PfoNLBo+U=;
        b=nacJeyKyUF3e0dvnpIk23EmlEC+zDeld6l9s+WMfw6PMURANCex9cS0tF42flYHvwJ
         nBAVbx3UJHUKtnT5FIT26J7rJXuUefpxO0f0OEtN5Of9zNSGjmNXjc7Yhx+5aGSRu9fa
         Q7LFmJ5ggrGCBzJEAKv75CJ1VUdPwSGDl0QozQ4+We/lZLQ//5Y4QJ0Q0JEcUl2rdftS
         q/oCsaJ/oUlta0XfgUREQyi7bXaItqfOGTkP/7WRfShpqUAzcXHyTIZ229cOWgb4w1s9
         6f1296plzbPH1Uve6ysm5M5H6RRmYWydQsYSxav6PS73+6LqQA7wOA8mYjC9U/J/2ZlB
         Goug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074855; x=1776679655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ee0L/AD5HlNBkYL/vdO0qzIztqPcV8bZs1PfoNLBo+U=;
        b=W5IegDNHm/eFbPZH8NEPttPfkh1dmN1UkaNi/XHvsFg3Sjw7e7FgrXlte+ram1SZ8l
         ERN3vTBQRO2mFf/zpCEqPurheaR2fVRFXqXFPEsZeErovxXnoQ+UAwzJgA5Pfn+f55bq
         uMG1wSsvPKqQZL5SPEaADaoy5druhN4kF1iK3jp3DvJKJ5WMRTEFfEMgygU50cVuvAbW
         2RiIspzVRE+e89xyCc7dr59+bvoWBDN/ERbIkQrrPrZpwYpdTivqvg8JrElriJ3kE5/G
         4xMilUJIXEg+0Rh+R2xf5Nl7yx96Id1whq277EoIHx9ltLuLuuWcJaHnHtUr0MhwOw8O
         hueQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mIGZRh10xyRpw6Vo9d/Ew13tEeicMkSkX+BSiJwdh/EEUn/GZ/bmraxSLbHvGtTCVpp35AnFalofh@vger.kernel.org
X-Gm-Message-State: AOJu0Yym98Ie55i2i2pxBDv6DPRWKSBmutd8j5/un0Z4WaYi/PUFQlWA
	iAxRELh/HmvXIKJcTgJG5h4AjgZHJehnmS10F9js6wCMpbDaRWbDvdOH
X-Gm-Gg: AeBDiesd/bJl/nLQHwL0cKDQBIkDZIk4GHXMRvLXhkX/34/UQ451Iu4tCFRpwdU+3qx
	zQV8+4G3P9YVxgKwo7DDij8+aZ+t38NwAkyg92JMThBI9W35yv3sMUYHSaecx55K8ba0QkVI+9n
	eCtfcf8C7QjZGkI5W+/Gbba13DHkd7srveJD1Y0h3KlMYaNfrN3p5QIkllL/jpi9TQQleKIWvPn
	A/XrUOUs5TS5QDiBMkc7Mf5eBoRibKO2mK4SxCHGtrZDuo0WLtpvS3txv2de3l4nnH+Fkq5P+mz
	G95ofNGnIzi5LbmfSa0ezd1wHQfyTKWtktyjBpahW/PjANVz4M54Ror5M+ef5v9lQL1mW0RAjgg
	WC6xkUVPdbRqnaDOjQsOwIutvvBCHNKe2zh4Zrhv7ykD9syztubzaOtw6s23BsHz2jOKPp7ffSd
	rEirEQeRWn6yjC6vEYfMK4XFTWICr2ocGZL4UwY8I0xbEz20VqG5gQq4+kgg==
X-Received: by 2002:a05:6a00:1785:b0:82f:24e:6a3d with SMTP id d2e1a72fcca58-82f0c26b5e1mr14138598b3a.3.1776074854673;
        Mon, 13 Apr 2026 03:07:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
Date: Mon, 13 Apr 2026 17:06:56 +0700
Message-ID: <20260413100700.30995-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable/disable the shared SPU clock in hw startup/shutdown. Without this,
accessing FSI registers may hang the system.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move SPU clock enable/disable handling from fsi_dai_startup/shutdown 
   to fsi_hw_startup/shutdown

 sound/soc/renesas/fsi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 196ec7bac33d..109e06b5f32d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1492,6 +1492,18 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret = 0;
+	/* enable spu clock */
+	mutex_lock(&fsi->master->clk_lock);
+	if (fsi->master->clk_spu && fsi->master->spu_count++ == 0) {
+		ret = clk_prepare_enable(fsi->master->clk_spu);
+		if (ret < 0) {
+			fsi->master->spu_count--;
+			mutex_unlock(&fsi->master->clk_lock);
+			return ret;
+		}
+	}
+	mutex_unlock(&fsi->master->clk_lock);
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1549,6 +1561,11 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
 	/* stop master clock */
 	if (fsi_is_clk_master(fsi))
 		return fsi_clk_disable(dev, fsi);
+	/* stop spu clock */
+	mutex_lock(&fsi->master->clk_lock);
+	if (fsi->master->clk_spu && --fsi->master->spu_count == 0)
+		clk_disable_unprepare(fsi->master->clk_spu);
+	mutex_unlock(&fsi->master->clk_lock);
 
 	return 0;
 }
-- 
2.43.0

