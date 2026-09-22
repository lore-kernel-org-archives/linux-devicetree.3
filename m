Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B0B522EE7
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064100; cv=none; b=KaE1lReOat5oCi9PsWjJrBmBnf2q3G3XshPlqKFvaf1Cy0D0Lh+Q4nw7FEp24JUsF6ANZwPyKqPc1kC6ZlpmzyeF0bRmLUNGopo7lACaX2cja3gqaKVvJHONJHXDw71OQ4xfnX/BkTPHU+jcpEyP5GPkIUZKthDCjF5jzIauGFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064100; c=relaxed/simple;
	bh=0xrVY0R026KpNfsviBE2/QZKTNvfEgT3VjQqd30Zu1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izdDVXSkJf1JpyjVvieOlP6gdYQq1mDrOTtS/mZSc63IhAwIwDpd1trwXkcrFfHX+zuMKd7y0br60A21gXtGXpEwqcej1yFi6IQoNEMW4Fa7NtSvEn6TpRR5yW9nmYE1g1RgV/7v0sFQ2Op87ogyXFJOcFA6i7hLw2XgBnA6/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q040+peI; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q040+peI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e82ea30faso2294905e9.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064093; x=1790668893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGF28/ongkg1pjDH+01IcEm6dgrPiae6qX55Ok4Xvzs=;
        b=q040+peIpfvQZ4ZAgW4XeVoL008HSoNc/UbVBj+MbSAHtnFdJ8CMFiwxnoqed94mOo
         hULVWBApRB1EMLkMIO39WqaN42Na0cTCb6xtCCeFWyRKwWS59LIGvnqiOLHu88FNy+TY
         b48yP85bGxVpwbo4ijGVRfJOCRD7n63MDloN8XNT911wEFKrePn9LfT74O6OFTPlLOxq
         qFKxsLJ+mHU8lANLX7hh6CWxUsufoC7Ljv/1xHdQsdzJ2JjPGrvrp8sfL0rJDkU+quG5
         cIXiJBOGCNx27b7RZzn07MODGVIyjcjdzAIkxAWhqQSR4IQxm7KmLTsSYHfh7b/jdCA6
         zHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064093; x=1790668893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGF28/ongkg1pjDH+01IcEm6dgrPiae6qX55Ok4Xvzs=;
        b=jtKZTuzKbeILupYM8tkqkLc27ByS0oY5aA/AZiFRumaMZ1PxjwXsKk6ZUrX1OZshat
         weDqveNLzbMAV65Owm2CulG6P8IRf2/uq7/X+NZQAiXHtrZInjDhr9bKJMYBFo9NyEVT
         wZdv28O0A1kX/VQsi9L/66/8cfNmHUc+EpHOcxnuIuGmK4ayWuiTbI02hCPYCGLmRbsZ
         zmmWe/KDWsYfhrbykJ5+Enge8Ysux8cllHFQGNyrBqI1CWurDz2xfIh/UaW+FNv8favP
         0zw0tWCnym9T8RNASjCtLn0quPSJ4B9dDEF7JZ/VkXuc6sh4jRa5rzEJwIApcXQ6ao1E
         u1/w==
X-Forwarded-Encrypted: i=1; AKwUvBy20WpA5SxdCDOOb27zXqwbp1A16VhPQxRuqX6/h0TS/73RnmL6VJgh3lC0XMrNCTx5swUrSJ6mJVsV@vger.kernel.org
X-Gm-Message-State: AFuF++khzMI0Gf2F/Pz7EoLjOJIx4fqKygk8TWudKYAqVqsKBbzGTg0x
	gdHG/2U5hbrcDasNlea0pP/7f10mxG/MCn0J9t5Voqd21EEmx2wtSzD4
X-Gm-Gg: AYBFou10tJftRuVUyOSW7xnHNIowaATM3qmQXgONAn8Eln0DIVlyGKh0JD1W3mqwN7M
	HE1SaGNpgdNJ/rH9eMfzSWhCd15uwjgv1mb0OJH6UFORh6b5VqCO6CsCE2DKRj+++hblfrjLFjy
	xBL7rVLFkEWjlGw9qCRrTScdN6ArBY0bw//twK3CPFn6j5DrvMgVO3iuKE0WblMr3o3Bpxm515T
	ZdwB4RIhTSYzX3yDtGo7YwHug6R6Ma1HdNJs6FN7WL9Zgutlh1IvdD+ZMmTpPiCh/o96gWWhzex
	3yg5ea2SsjA5evbB24zHgY3KaUHj3iQ+EhnQHauDuPLWckl9gc57afPD8MW3xK7zW9G6ZnTWvo9
	OUs7hw48BVzEO6HO93Ivzd/B70TGDe5mJ2LGUTaYmlJYcE3ECexf6+V6ESnEhzQRLjf2f8eYsmL
	D2jnTNgXmpbmr0sDK0/p1gKcJtK5V3xbWLQSmzWx9IsQGBDC8jaOIj62IxL4VEkKIozEH13ir+3
	kmnoraeqt6S+GL8B1cyWF+ERNUOWK/Pkqc6LVc3RYWyxyRxkXNsTtSj+IKoUw7YppWLLe7yl+oo
	MrI=
X-Received: by 2002:a05:600c:3b99:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-49fc7bbfe4bmr199176535e9.0.1790064092385;
        Tue, 22 Sep 2026 01:01:32 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:31 -0700 (PDT)
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
Subject: [PATCH v2 05/11] accel/rocket: request the core clocks by name
Date: Tue, 22 Sep 2026 10:01:08 +0200
Message-ID: <20260922080114.44662-6-royalnet026@gmail.com>
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
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, NanoPC-T6 Plus
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
---
Same diff and the same message text (his copy re-wraps the lines) as
01/14 of Jiaxing Hu's RK3576 series, which carries this patch as well;
whichever lands first, the other drops it. The trailers differ: Jiaxing
asked me to drop his Signed-off-by from my own posting of it, as he did
not pass this copy along, and Assisted-by is added because an LLM helped
with the checks on this v2.

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

