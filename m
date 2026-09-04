Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91917288C2D
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527367; cv=none; b=XiCHfzzNTT1aWL7ltRdlJkMcoZpBMKcFo8WGbj5hkeepI2IAw9y8tvkiKafsyos3zJ8ZtOdujkFzaHTClFyOq10Xg4+jvI8cAeVgOSEsNWz1siJZZchtPwAwenc3h+O3q8GRHvP4yL6Id+SxBpJ0NtLzd6mqecJ+YM/SJf4UQWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527367; c=relaxed/simple;
	bh=DXP7b9aeuGMlpb6EbUoiOrTeOWhkU0hKUHsr29rOjmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZ9R9JAnD2Pz/swit+YZUn33O9KhH5JA444GKZzBkHJtJg+e0lsf/AOuRPcd5flygTHOrUqAtIeDqd5BsfLTFdHOOljytu0i0MeAteubWTVCyNa6MRKRKXpeFlxQKL/cL0igGeNDbNbBIu0vzKT4QMk9LSWh7ggLssnvYQHA3ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqXlPFuS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqXlPFuS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so929645e9.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527364; x=1789132164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7o7pGTYJ1j9htjyKompyXPu5oGlEszk3L/eQl+FLhg=;
        b=hqXlPFuS6+NM7baHIqPdcb0pkKcP+P2FnxBeR0g0W6w+WA/iLZLKzDj+azJxR9j8Gs
         /W/eAjmGoAqL8loW5TAdoaEX2r0cOUHJhqSTAd6Adc1bQY9ymlFUOSg6uQGBJ7UDkWYp
         Y9B3R82NM9mG+M9OIuYUEmOjrZKcbf5TyvNEcCBm844eiOor0zw7r3SFfXIdSudANmrW
         j5h0LOrL/YHtWXhUom/MxRPAavMv2DENc295FOXn1aU06C6vkSIY08/jOPDBUZI/iS+p
         PrhXuoumdmp5aZw2ZC9WF/4wCDXXAO/UPtO7VW9/7rWFxuEa96jkGlr8EzXfqupet/kM
         YPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527364; x=1789132164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7o7pGTYJ1j9htjyKompyXPu5oGlEszk3L/eQl+FLhg=;
        b=iYgehoHW/+n3XwkNH7CSVj0ht/8w97KJr9grgLQ/6CwNotRF7076T4cYJCh9E3TVxP
         S86tMrGeYDDNRFaUSmRU5oYkw8tnbBKSLi9pyxWDAZILBctAxRJKezwxMJTOS4MGNbtw
         PAy77VHQ1VGYo/3Z/bAFWHpR4V7az0RxoOmxKj4eI0VUVDLlgQCcA3u8oRhWrisX1+Y4
         dLH+rw2NLvHwY47kdXgEfUGOcw1IZsb00JSxW0QuQTjHXbu2loxpyaIQWWrD+dkdDOE9
         mMRmP43oWKnH+TrKs1ImVzmM1C0c4AJ5lE58CxZkMYWsfRkMQ5c6pAD4LvvFBjHMSafl
         0hXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYCRlAjUT4ldco0E28P2RMNKe39Pv/TQ1GlR47YZQGK8Ew2NJ9ajM0YlorhNX1m9TAG0aZwFVVAi0r@vger.kernel.org
X-Gm-Message-State: AFuF++lO+pb0WrrxJL6LPpIQsR7zncwZqhzaB5iPCk9r2AO0g7pjaImU
	Xs1wow54YCLxdVTPVjoTaKWs4N9EbpXu85OAH7AJv4DWYHTT2E2/x3P5
X-Gm-Gg: AYBFou3bgTLv8vj09srP9bMugVfG1gNU6FOP6tVLwoOVwOlcJEvP7DzKyTQyW0/nFA3
	uucums5FnMIsUGfbw4xIIvGYUErUkv/aXlKT8m9KOTp6YeTKqySDTthi/DyMZyH78BTbCoROzTF
	xqMPBJXncrGvk8txamV1Qn3ZR7uPoIS5PWen9WR6Lp36ufqnSqghua2odvaZ3ZRI/B3xutfA9zE
	n5c/nFFYNbn4BFO5a9ipTbHIL3IXzsIxSw1rhDjbYwwJa5w7z72YPmiG2reVryK1V6wPpl1IMgc
	Mx/YAHsRYIgjFbsVLgqh8//mlT2B49cTjZvJiQbZL1/DfQOLvi3ErUp1MqAhxKskRP1mi1J9jkY
	VThU4zk2EXmgt9NmjzTOoWay71trVRPGO1aoZEpiwTw0p3v5yJ3cO6z6uotIJbBYQSXTtBPuFf0
	UYVbZhwi/udMEf7sELxk3WJHrE5TWnh8NYpnHiDzDreFysMljNQDaGADMGQrVp+oVLGrN4Bq+qD
	OngM+x9JM1ZByTlDCItuHkueD8P3wYUE2O23buF1vTcQwHOU4NVnolLz0SRQG2GQpg7jJMgqs1L
	PCc=
X-Received: by 2002:a05:600c:8b6d:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49cf82420afmr41030795e9.1.1788527363631;
        Fri, 04 Sep 2026 06:09:23 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:23 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 1/7] accel/rocket: request the core clocks by name
Date: Fri,  4 Sep 2026 15:08:52 +0200
Message-ID: <20260904130858.27803-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rocket_core_init() hands core->clks to devm_clk_bulk_get() without ever
setting the .id members. The rocket_core array is allocated with
devm_kcalloc() in rocket_device_init(), and rocket_probe() only fills in
.rdev, .dev and .index, so all four clk_bulk_data entries are requested
with a NULL con_id (unlike core->resets, whose ids are set a few lines
above).

clk_get(dev, NULL) ends up in of_clk_get_hw(np, 0, NULL), and
of_parse_clkspec() only consults "clock-names" when a name was passed,
so the index stays 0 for all four entries. Every entry therefore ends up
holding a handle to the *first* clock of the DT "clocks" property, i.e.
ACLK_NPUn. Nothing fails: probe succeeds and the driver believes it owns
four different clocks.

The consequence is that rocket_device_runtime_resume() prepares and
enables the AXI clock four times, while hclk, pclk and - most
importantly - the NPU compute clock ("npu", SCMI_CLK_NPU on RK3588) are
never prepared or enabled by this driver at all. The NPU still works
only because the Rockchip power-domain driver sets GENPD_FLAG_PM_CLK and
its attach_dev() callback walks the device node with of_clk_get() and
adds every clock to the pm_clk list, so genpd happens to keep the
remaining clocks running. The bug is therefore latent today, but it
means the driver holds no reference to the clock that actually feeds the
NPU, which stands in the way of any future frequency scaling
(OPP/devfreq) work.

Found on an Orange Pi 5 Plus (RK3588) by reading the live clock tree:
/sys/kernel/debug/clk/clk_summary shows four "fdab0000.npu" consumer
handles on aclk_npu0 (and likewise on aclk_npu1/aclk_npu2 for the other
two cores), while hclk_npu0, pclk_npu_root and scmi_clk_npu have no
"fdab0000.npu" consumer at all - their only consumers are the
"npu@fdab0000" handles created by the power-domain driver via
of_clk_get().

Set the ids explicitly, in the order mandated by the binding
(Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml):
aclk, hclk, npu, pclk. After the change the driver holds one handle per
distinct clock and clk_bulk_prepare_enable() covers all four.

Note that this is a user-visible tightening for out-of-tree DTs: the
old NULL-id requests resolved by index and succeeded no matter what
"clock-names" contained, while the named requests fail probe with
-ENOENT when one of the four names is missing. That is the right
outcome for in-tree users - the binding requires exactly these four
clock-names and rk3588-base.dtsi carries them on all three cores - but
a DT that relied on the permissive lookup goes from silently running on
the wrong clock handles to not probing at all, so record the change
here where git log will find it.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, NanoPC-T6 Plus
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/accel/rocket/rocket_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index b3b2fa9ba645a..5dd260bacbff6 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -28,6 +28,10 @@ int rocket_core_init(struct rocket_core *core)
 	if (err)
 		return dev_err_probe(dev, err, "failed to get resets for core %d\n", core->index);
 
+	core->clks[0].id = "aclk";
+	core->clks[1].id = "hclk";
+	core->clks[2].id = "npu";
+	core->clks[3].id = "pclk";
 	err = devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
 	if (err)
 		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", core->index);
-- 
2.43.0

