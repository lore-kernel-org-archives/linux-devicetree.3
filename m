Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03BB3F23C0
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811538; cv=none; b=RrZthdUMFNnGur8s225mgyPin+Hldw1T3aB+F2PASaiHd+uivvJx8XcPRX2zTlwQHKDahGcOUqQ6F/l0BMWGT6zGxmHGvrUCDi33iIMthzq2tgGfKQERx8UjEWkND1acmBkX+FGzJxI9256A1sB8wc/4RpEZnihcxlrq8aZK1CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811538; c=relaxed/simple;
	bh=2et5MI+LD4TXfhAuZVbQ5m6nKItHqKLs3FNIMdeB6io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uH25cFze+Of9GkM44WtCpu4BQOlfoGA22rMxnf5K4K/spCp8bdD6WZnOltc0kJqNoHAXbct23pFLO3pqwDxsCmZ/daj5I5jMQgogMxFfSZf03vFgc/lY4gBM24w2a4UMlduI8ymI08cv73/rlCHn97T7IlgcVKMThMisLL5K/04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Sfuphvyo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Sfuphvyo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49395888c7bso37617055e9.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811535; x=1783416335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK4yTa3cbLdIqP1ptN+einUAQ5LJAL8rNWF8tvWA23k=;
        b=SfuphvyoTDZYPOPfU19LP8HHdHROASrJmvMyvzDpDncxouGr4Z+ZQLkkz435770a9T
         4LhWAeXYzlh/hxTLWG0+tPLidlwiI3+JBOWZ9FxZIIfQFSpBHxaYBuX9swnbbpQdCMtx
         k6OCVuSRC2qPyx/hd1uKLAz3tbYd4wSGf8fxtHQYSSe1BEkyxRQ08bR/noZthK3aNo+0
         02QGbU4jWO0TE6OIDJkH2h5Sz2vrZh9WnqMh4TmdzdQ4H1NtRv3nWATRpH3MVn7sxzNP
         Ds0t54bXQZ11Fz4+VmwOfnTHZSV3Fe887FjfQMO1ecjYO45VWwk9MWSY7CjBTgdoqYKk
         aQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811535; x=1783416335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lK4yTa3cbLdIqP1ptN+einUAQ5LJAL8rNWF8tvWA23k=;
        b=S5ypq9JjV5VuZdVv065mEeQes4oQ0pUrfRill7JQOIplrXNvnvYN5UIKIzFBfHmdnv
         zBMFzUpBaAS87POzzFkYBSzfsMh3P0XrdfuUK5E4gePU1ZxI/NI8Z9LA0/jOFa9fYrYC
         GFZM4DsnZS6mfgmmULn/tUsnjdfhYXwWSQrrWrKx5K+ouBYSRGwur8LmmBGIu0ETXPaM
         af5UpSy0ilQvtWxM/NwlaK6line/RqMzk89zrNirdNdl0/7D1FgrgpUEgAvsIZDw94UZ
         hdsjApY5gH4ouizd8sn3SePJ+qGLBX2VvBnq4dCtx9PEDYMNHE5BozqWDg/g5QC/QieS
         hKrg==
X-Forwarded-Encrypted: i=1; AFNElJ8PpnjKTKN/PX2RTV3PvRfOr+MIRK6qs52VjDcrjhsSCUkUWlZWMUelNCZTyG+rnxtX7XOtU2+RvyWs@vger.kernel.org
X-Gm-Message-State: AOJu0Yypt7LrqOJM1ezMCQQJFGHiFT50OqPd1Qda1syAOwbjB3yyQo2V
	4DS79Vm6XjszAu7Z1lWS66356xSr1VbpuaO0z8N8w4MhUnL/EtUHqLKw72iHn/0brgQ=
X-Gm-Gg: AfdE7cnMBcoNlNVCNPt9QYi21BeE2ty8yKfmoarkSt6UIH7snV7TE6rdY04Vhw1DPO8
	qvCD9oKvocqIXU6//ckfTqUE8qzBqF6PfMKq4ndqoHaLr2JE9NpQhotH74MYOapofrfQg+cN1tU
	d26Sz+HiQUQW3vlU+IXATvInsCYruAkKh2+9OpnauU4VWePipUFzvzZXvHhpvtxAluHqVd+mC0g
	zjVIWSZILy9c9KczMEgDTEuqDRmLP9CpUsGjox5KvnwYsHb7nGSlMlnYJ9no0EEDWYAPq2GSXXz
	qGVZtO7aCNY6+3Lh/CI3FkylTODr5UoERsjJiygTXToBhDzh7vKshp9MS8jcaK61Y91Pm5ShuA4
	YckJ78tVFKovz8St6cWQ5zcuL/KdqcmIU24izUehlL0G5erJ/NDnheulmWB0KVxHI+wBraB1l0l
	eWSjJnRwkkvgpjgDyPYWOqZk4N2jPKmYYVOHbDT1ovQi7pMi5+m3O5t0ao3X1vafOcBfU35clvV
	X6GRyGV2QyiyAk=
X-Received: by 2002:a05:600c:6383:b0:493:b91c:6bf with SMTP id 5b1f17b1804b1-493b91c06ecmr38220195e9.18.1782811535233;
        Tue, 30 Jun 2026 02:25:35 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bc7aca88sm51297955e9.0.2026.06.30.02.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 07/17] of: Explicitly include <linux/types.h> and <linux/err.h>
Date: Tue, 30 Jun 2026 11:24:26 +0200
Message-ID: <a730991bc8813cf70c2445064ea425291538f709.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2et5MI+LD4TXfhAuZVbQ5m6nKItHqKLs3FNIMdeB6io=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGpDi1mi81XgfSjDC8UAQ5A63guN9vWRIE/tkpeqP+LhLtcf0 okBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJqQ4tZAAoJEI+A+1h9Ev5OXuMH/isW FGYNohoV5Njrh9ljFmRoNyGYnLB7EUrPAddeuF94lrgw3WX6yIfLgPlEuoNzEv4elWmIVF75Bnh naqH/qSSAFX/9UAoS974CZPvtFxgZntSKOewuC+0ledbmM0mJyLXgI8zRlyCSIHE1Sxku13xxgl 0G1NY0A97wnbWim8Zi89EQS412uDXT4tKE2dR9GSKy3ehRafi2D79OFvP37eUL2JFfg/CmTjfV9 kUuMUjYOSnwz+iF0K5PBTI7cqr2z9C7EZrm2faKREh8hiFWn/eoT1e8BMYRwKmDAUeCIBdSd/2x 7NqU8RJTQ+5a+r7ssOvz1pu4/eCEQ9REZhorU30=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

<linux/of_platform.h> uses resource_size_t and relies on the transitive
include <linux/mod_devicetable.h> -> <linux/types.h>. It also uses error
constants and thus relying on the include chain
<linux/mod_devicetable.h> -> <linux/uuid.h> -> <linux/string.h> ->
<linux/err.h>.

With the plan to split <linux/mod_devicetable.h> per subsystem and then
only letting of_platform.h include the of-specific bits (which don't
require these two headers), add the needed includes explicitly to keep
the header self-contained.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/b6783e713ecf3d15ee9ca261c24b53e18d4bbfba.1782682124.git.ukleinek@kernel.org
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/of_platform.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 17471ef8e092..48f73af88dd7 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -6,6 +6,8 @@
  *			 <benh@kernel.crashing.org>
  */
 
+#include <linux/types.h>
+#include <linux/err.h>
 #include <linux/mod_devicetable.h>
 
 struct device;
-- 
2.47.3

