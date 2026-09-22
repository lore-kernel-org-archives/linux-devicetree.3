Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE48F522F1D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064102; cv=none; b=PfONk2wG0ZdwKuAcUEJMy2b5wPLhugnLWq8bUng0KXwI7IY9rnUHbpZ3jKsTXRlEYlw/rFwv5fKT1bzR9GH4xGrCD8oqYpMiIsFjUVZgnluor/IS74QDYLdZh+GfKRYVHXlPeh6/22q1NYIrRmp2Er/g0b0Jz2PjgbjInxHDMmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064102; c=relaxed/simple;
	bh=0N9CYZPDiuUu44aUShjKzfgWHYRWpHfe6zVi7EjY5IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9CAZGWR0vCt1vil7cnUFVhD2br7bSDHgleDbPgBtk9G08jK60vt3E7oo38DJM5VA7s2hm4K9jMjNun+CXz79zmtn6m01Wv0qpXd0tI/SNWQaTR/IsfARFw3IyWif5IfY1/U/+CuiEW48PQZ/cGCtvpqy++79NbttEcWi/PfTg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW/Q5g1/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW/Q5g1/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e82ea30faso2294695e9.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064088; x=1790668888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmb5ZYsqks7WEIdeRWH6smgklDya3V2PeA5rJDQKGQU=;
        b=LW/Q5g1/musUc+wsQK4IusW0asOj6tj7c7eh51Rgj6l2IhYI8sQ3lqURkVbwZvykYh
         /AHx6mokkub/41wLr2HzABA5xH4IebKukxUyKBazaGLstabmgYqFj7H+vOxNEW/eX3tz
         x4koAMlgDU3rujnkWNkrCuHVqIJLB3zWsrcYyfNQwq0mLKHx1hfrDfq1tft6I6vfvS5c
         YUJZib79BdukfylpzuT2niwpsVmPcn3FJSz+OvQxy8xrFZr7eevJZvYqW81pDPXvUMA0
         T0mCazA9tRBTtXPQ0Qi/f9gxRWZdslN952mm9xyiyIz/+opRhw6bNj4/kcK3Dm82hi/I
         0jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064088; x=1790668888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmb5ZYsqks7WEIdeRWH6smgklDya3V2PeA5rJDQKGQU=;
        b=knppjImoq22qjerDOVT5uNhllE78MwMTTGivMkPRtwcxeDRoyRW3SGP9QGZpcIyq89
         71uei0A04TR2M6TnxxduMQbeFQUr4Sbe7n6VFSAPGntQM4Ta8H+yYQ8EY1UdcvKRleft
         9dyp8nFUcZdAjGVRkNmIxrN+6LKmc0aYj57+CDje9libe89sWm7dE5QlequxrGXGx3n0
         0qQt6fxJL0Zq0mJvkWs1FdsFFqsdl/N+SoaDeXGNgEsX5vim4/8RlJQ4uKA/afMoBukD
         YgXWzJuGenEIlqUEsR7l40ix0/cB61Cd9TYaXWw96p1gVvgB2+vwPm1eLK3qsZawwBo0
         xEJA==
X-Forwarded-Encrypted: i=1; AKwUvBwcds5eeoZslZR8+V7juyIL4XQCYXvPlCbtExOLVxATZ19bpUS89xugONgWvob6JuPmbJL57k0twU3I@vger.kernel.org
X-Gm-Message-State: AFuF++kU05VTAGzppLrWDu/NbBmQ4NghNphRoXy8TKMpCc2GhnE8tQF5
	JqK5fhXnUnz8FQ7lTVfLO9WrKXRW3e7h5/e49eDqhjwHWohV7Lrq5qTl
X-Gm-Gg: AYBFou0CneyFKtUJ5Mh+VH5GBajSFsG2axuvXm0FwKsNYVfE3tcOFXV86QChBfEIi7G
	jVAAmDklllSg3lx/jHyHXe2MQPctyaRMMAhIlyEtcGECF9r7lOZO/kTjNeaKLVm7lmY1qxeavNg
	/TBnpWBNg3vBB1z0NYKnMTCtInWENN2TMPupSrqL6XFu9unoL95+YH69RU1fAgg0RJeuLm+i3S3
	81o4Hlz0yIaKq51abnJW3S3sW/MsIXXBd2HUPdvXdd5mEy1VgWV5KfFuXAolDeteM5D3F8f032v
	9IeyE2RZWNAyB/pdMS6BdfaOqsFOT1yLGGDOWbt8gC2lQ3l+7/LI4c7vi7eh21FXWMc8zA1+GTj
	yi0aEBQlpzDsyQ8EjnStJFln+ADD9vGc6+W7fyeFwcySkECYin+Uy2RWyJ560FvAQrmXt2QB83y
	KDC62iWzVPdtnFO0qSsPdsmCk0lIPCmUJMQKL4fn61oNQF7jLXb7ufvjU3ahfmjORke0xSJDYcL
	bPzKt72LRe9Kq2O3R04LfRVVLXXyR/ZEHsiJMAKYrfS4q2kvrhQmrBosckuarlmVq2iH8qiqpt5
	k0I=
X-Received: by 2002:a05:600c:354e:b0:49e:479b:c13b with SMTP id 5b1f17b1804b1-49fc7dff668mr165624765e9.1.1790064085766;
        Tue, 22 Sep 2026 01:01:25 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:25 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 01/11] accel/rocket: search every core slot when a core is removed
Date: Tue, 22 Sep 2026 10:01:04 +0200
Message-ID: <20260922080114.44662-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rocket_remove() decrements rdev->num_cores for each core it removes,
while find_core_for_dev() searches slots 0 to num_cores - 1. Unbinding
the cores in the order they were bound therefore loses the last one: by
the time it is removed the search range has already shrunk past its
slot, so find_core_for_dev() returns -1 and rocket_remove() gives up
without doing anything.

num_cores never reaches zero, rocket_device_fini() never runs, and the
file-scoped rdev keeps pointing at a device that is going away. Binding
the cores again starts from that stale count, because rocket_probe()
takes rdev->num_cores as the slot to fill. On an RK3588, which describes
three cores, the second round lands on slots 1, 2 and 3 while rdev->cores
was allocated with room for three:

  rocket fdab0000.npu: Rockchip NPU core 1 version: 1179210309
  rocket fdac0000.npu: Rockchip NPU core 2 version: 1179210309
  rocket fdad0000.npu: Rockchip NPU core 3 version: 1179210309

The write to rdev->cores[3] is past the end of the array.

Nothing in tree reads the core array often enough to notice, so the
overrun is silent today. It turned up while testing a devfreq series on
top of this, where a worker walks every core a few times a second, and
UBSAN caught the first bool it read out of the overrun entry:

  UBSAN: invalid-load in drivers/accel/rocket/rocket_devfreq.c:47:10
  load of value 5 is not a valid value for type '_Bool'
  Workqueue: devfreq_wq devfreq_monitor

Record how many slots were allocated and search all of them. Every core
is then found on removal, num_cores reaches zero, the device is torn down
and a later bind starts from a clean rdev.

This does not make unbinding a single core out of several work: probe
still takes num_cores as the slot to fill, and rocket_open() still
reaches for cores[0] whether or not anything is there. The fourth patch
takes care of both.

Found by unbinding and rebinding all three cores on an Orange Pi 5 Plus.
With this applied the cores land in slots 0, 1 and 2 every time, whichever
order they are bound in, and the shared supply goes back to a single user
after each round.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Jiaxing Hu <gahing@gahingwoo.com> # RK3576, two cores
Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, 3 cores
---
Two paragraphs changed from the standalone posting, which this series
supersedes: the one on unbinding a single core now points at patch 4
instead of saying what is left, and the round counts are dropped from
the last one. Posting:
https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com
The two Tested-by tags are from that thread. The round counts were
taken on a kernel that carried the use-after-free fixed in 8/11; they
were re-measured with the whole series applied, see the notes on patch
4 and the cover letter. The single-core unbind and rocket_open() cases
in that paragraph are 2/2 of the lifecycle series, now rebased into
this one as patch 4:
https://lore.kernel.org/r/20260731064933.12548-3-royalnet026@gmail.com

 drivers/accel/rocket/rocket_device.c | 2 ++
 drivers/accel/rocket/rocket_device.h | 1 +
 drivers/accel/rocket/rocket_drv.c    | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 46e6ee1e72c5f..efd004194c1af 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -31,6 +31,8 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 		if (of_device_is_available(core_node))
 			num_cores++;
 
+	rdev->max_cores = num_cores;
+
 	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
 	if (!rdev->cores)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index ce662abc01d3d..c62d567010696 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -19,6 +19,7 @@ struct rocket_device {
 
 	struct rocket_core *cores;
 	unsigned int num_cores;
+	unsigned int max_cores;
 };
 
 struct rocket_device *rocket_device_init(struct platform_device *pdev,
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594883e..2bcfe4ab3c68f 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -223,7 +223,7 @@ static int find_core_for_dev(struct device *dev)
 {
 	struct rocket_device *rdev = dev_get_drvdata(dev);
 
-	for (unsigned int core = 0; core < rdev->num_cores; core++) {
+	for (unsigned int core = 0; core < rdev->max_cores; core++) {
 		if (dev == rdev->cores[core].dev)
 			return core;
 	}
-- 
2.43.0

