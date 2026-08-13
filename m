Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB3C4399EF
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655377; cv=none; b=ZydmBNtgAsygnJbSMsP/1wfzyzra+UXUoAN4p36Z6p/WFWs/GSKAIAOut8wdvl3IpsV1b9HtVJ59Lfj3ld1cts0ffW4hg4UCPsDl5ajtP5jytM69/v+SXhCLxWNPENmoySO2HXIIvugxNu5rX0LRk1KSvWMtWKJOJpg1tdHYzDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655377; c=relaxed/simple;
	bh=Hp2dcXM/XUPidSA3t5C735yr8KK0/qRkNqBby47yXic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h+afE9j4D7rpx1IvykBCgjTQo59IAsRRuH8vvLOJEOt39vOFGVvVthp7SrYEgG8aBWGgiClqxesY/DMfnwGIyJHt1hb6aKKA65eEvViypnzOuEwoqAVjg5xv0w9jvAl1xvMUWDqUDANGwpCd47PDNLT1PcghHrTr7Vmw1kaEuDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=hZjFnzAS; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="hZjFnzAS"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c998fd549a8so195750a12.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786655375; x=1787260175; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XlUl9T+eyvKnDKZwOXK3sguk5KOgNvgtL+Pgz6DeMIQ=;
        b=hZjFnzASxHt1/eP4ioHeC370sO5z4IUoFGWKX0P2YedIA7flRN/jcoviVLP6eAXzvB
         LMgnYq3X7R7j3EZCnNkfJTwZHo5ecALL+dATdc5kZx8PQquyXKQItTMKsRS32DNC+RU6
         Fk+WNtj+YSrWBUVUYtUqgBd4F9Di7qMmVD7m2J68ZYfuuZDcOOe7YTYdXwFuvGU9nuGq
         DBZSibCpz/cYpNgFbRSwqALkj7dsYC2Xuc7x2XhdM/GGwe+v1RYI1zMiFJ3+gaU5XAGI
         1ruShhri6H0I9g0TC9Ztkyy2YtEfbeIt3zuY3kgQbeGzj3Ry93qGtWdWoiFBZCxjHNu9
         xcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786655375; x=1787260175;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XlUl9T+eyvKnDKZwOXK3sguk5KOgNvgtL+Pgz6DeMIQ=;
        b=Ql5smYgIBmnEjE+gXbVPRb2WecCRfFU0ZwhtHp+ttdNe9fEsziam9uOzkeVlCjBI2y
         KmsltNM9B6x92J+oi5l2/SpjKtoFn7lS685qtpXIvjmHih7Etjb3vmfJ/Y31XhoILJgR
         2BkpOnNzrtXbomFrZfWXH1CckgjTywu953V8fVdO1W6IuzSI/CAyiWnZkcM6afHYOY4r
         aSWzIkRivGzfpufMMjjr88b8LYRwkAnisDM55XrApMLKFFWjJKA2WveXF1DOI/5Dhhv0
         j1JAGB+2lSr86V+rSw9J9zTIJTSZ41otUUHfhfEDxeAgzoJ/xWokLgKvF7VBceFkddcj
         UDeA==
X-Gm-Message-State: AOJu0YwWoe/jgbagQwlEPZQjP9na1a5WZJFEFQCDys2jaXASqij6wzdg
	GCFsWvCPbUCrOT0UlFL724u30l1bRuVAWQy126MpgsT54anet3ELnwfioTnY6sQJb05hev9gh3y
	cZYLooV0=
X-Gm-Gg: AR+sD11SVfLECZcofcKhrks5/7r0joQkvtwpGpXTXhIwXHheED5Xl+yxS0vEsECwE/a
	8TX1xX7ycHIIjYg/aRGr8ANbNvORgo9zT9Wy5mw/dZ7O0WjSxmJW5YC/DCeVdcg0IRnZRk/s4GS
	qdasD7k3b1ANB4cT0sIpBH2G1cCc8x+qCXkMFKCQ0rgG7v4VW2uwYpFERXCPFBR7YCbZka/q8Md
	6HJPjMUTljQAB/XkwrxFQ6wBJ49zjAI90n5rMnibKYCXASAVjKGG/6ArCPTPVInWAFvJv41qRcV
	mHxgcx78Bu9877zQWV3OqnZQGlQQr6CK2NT1+Z451nFw0B91fVNkzPXgzHlYnkveQFuNZKB0ymn
	Ujnj9BtcAD3DozXvhpDAtFt7vt/2DPtEpwM9F50WMRRSZbFrlO+W4/W4UG9kKIUbyYaolN/7NXe
	ewPmPqyrfjqL3KYzIshcFmT2/Eo1bEctWa5IODVGSArNOEzFtx/20fSOImrPRf0e4=
X-Received: by 2002:a05:6a20:258e:b0:3bf:983d:e9b4 with SMTP id adf61e73a8af0-3cc71f7b02fmr547188637.33.1786655374944;
        Thu, 13 Aug 2026 14:09:34 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387af4adsm1484343c88.1.2026.08.13.14.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 14:09:34 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 13 Aug 2026 14:09:32 -0700
Subject: [PATCH] of: property: add i2c-parent to fw_devlink supplier
 bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBAAwK80e3aTQhusfsV4oLDoegCyUKNp+
 vdSPc5lVigkTAWu3QpCby6cYoM6deCeNj4I2TeD7rXpJzXgPGIKmCVlkvpF6z2ydpitUKyozOS
 MPwd1GUZoRxYK/Pn9t/vfZZlf5OqRwrbtJFnKKoEAAAA=
X-Change-ID: 20260813-b4-of-property-add-i2c-parent-168c6d7f1934
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786655374; l=2180;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Hp2dcXM/XUPidSA3t5C735yr8KK0/qRkNqBby47yXic=;
 b=Abg54Sse1aGWrGGIEtDCKbETGFDRipZJURNLRkGqNfGWIxY0n8wrtrT2HWMurxI4KPMOhcne/
 WxwrBs+r2HkBUPw0DB+/SkRd3GbtF3IK4KI91Xiu8fy/C/3HJC3z5mm
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Platform-device i2c muxes (i2c-mux-reg, i2c-mux-gpio, ...) reference
the bus they multiplex with an i2c-parent phandle and hold a reference
on that adapter from probe until remove. Unlike muxes that are clients
on the parent bus, they live outside the adapter's device hierarchy,
so nothing orders their teardown against it: if the adapter's device
is unbound first — e.g. while reverting a device-tree overlay whose
changeset attached the mux nodes before the controller nodes —
i2c_del_adapter() blocks forever in
wait_for_completion(&adap->dev_released), waiting for a reference that
is only dropped later in the same teardown sequence.

Teach fw_devlink about i2c-parent so the core creates the
corresponding device links: consumers are unbound before the parent
adapter's device, and probe ordering no longer needs -EPROBE_DEFER.

---
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..c1e89629c842 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1409,6 +1409,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
 DEFINE_SIMPLE_PROP(panel, "panel", NULL)
+DEFINE_SIMPLE_PROP(i2c_parent, "i2c-parent", NULL)
 DEFINE_SIMPLE_PROP(msi_parent, "msi-parent", "#msi-cells")
 DEFINE_SIMPLE_PROP(post_init_providers, "post-init-providers", NULL)
 DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller-cells")
@@ -1562,6 +1563,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_resets, },
 	{ .parse_prop = parse_leds, },
 	{ .parse_prop = parse_backlight, },
+	{ .parse_prop = parse_i2c_parent, },
 	{ .parse_prop = parse_panel, },
 	{ .parse_prop = parse_msi_parent, },
 	{ .parse_prop = parse_pses, },

---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260813-b4-of-property-add-i2c-parent-168c6d7f1934

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

