Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E200230AD0A
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776653180; cv=none; b=Tb3xfRw3tqLoFmKQGROqfJFmYaoRF3xx/mYNeM9WnjFLtroTU0zpxIdJ3jPeRKlduwqtVYEGUrDVTkdq9fmpbTdy2+LGZJ5VFbfAE9Rwq+34t6RW+oXebBiqtHK/09vqqlObOelgAYQz8lREaqWoHyD3gxxs4n+yI95gO0594Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776653180; c=relaxed/simple;
	bh=bJZWL3XjU16A/mMj9ogl96Ckj2uQqXsZktpSDcOhYzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=axt83sW8zvLZyDkROGNrRAu/o/SCBb3QqGOFjbI+3TQle8+3yMUK1bm9xmVkH+ZJTcfn10Sl9ASyladj5OWsMHB3g/kyC0vSFkncoIn2z3DtHpZ9O/qX0IDU+MILHSe+8foO/+OZahbP/ex7JeTJJXxxfoTZCrmtytsoHl3aN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5O8dowY; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5O8dowY"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso1444546b3a.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776653178; x=1777257978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BK7WMJJgOkD4ogsiZrKHO2rDgX1emKX8e5Nvoh140S4=;
        b=N5O8dowYKOZpUjXfE4jCBJTb0K+ZfcUrJIUN07+B+nAxz6XNVovQGqqr1grZT8tPRS
         uN043JDKc3G85BcrbDYfbTACROhd+kh1p1RogP17pn4mDd3E12E3wLwexH3OgfSfPXwl
         /H4JvdEXdfULKbZtUqPIMHyBhDaw01tGr6fOxanXqQjclDq4NXXEcMz7kz+xCQ0Wawyv
         XY1KnGOYIzirjaztPti/qKjXtRpeCvUeDTJ7Ot7qbXrvhFx0lq1sHBUlW6pycAfk8jVr
         +JZYX7m9HWo6IbMobcWgS1NM4Kw6UalFyAe5806h22JB4wb+sQAhwOQQMXMe/P0SJZBf
         a8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776653178; x=1777257978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BK7WMJJgOkD4ogsiZrKHO2rDgX1emKX8e5Nvoh140S4=;
        b=U+lJD6u8J/uvTGzbFNjj6mXJVKEUujXWd4dKUqyGkI6SlNYlfvCOQKYRn5HSl3Cz24
         wbqTOrYsZK/jH255M7kD+mQDFZmltgb3gpijT6912PDyHtjnlWPo8CE5l0zmZjRzDKjg
         2zzs3j9uC93SelXX/Ys0D5SJIMMEQx9CvtPiYEIfChIZI7DGevhb3+F6Ce9kKeYSvQnM
         dYbg6OCcXGY2JPSSj8g+giQ3+KoXYg7q8yT5Q1HEEzaytJQ75VG04iUGMboN/2bDwjKA
         hgL4rQMNkeIUSQJyw28S8crRKvH8gzpQ+rJ3UDXmg2Hf0orlDTZNctSzUEiVeMxcnHtC
         LX6g==
X-Forwarded-Encrypted: i=1; AFNElJ+Fw78dpo/oUt+5KE5YMHTTtJfTM1eFWFT7IT4NREsva63Us3dI4aEkA0vMqm54kZqZQTRhIjvGGXa8@vger.kernel.org
X-Gm-Message-State: AOJu0YymdHWEIHTm4LM2JaEUK9SE1lrzNENLu3L4QSk+QSv07nl9oodk
	yxQsAGG/ddtE5UkfEjL1cCCar76TEHxBmrbd/PPW1btrGvYnjCkPFhTs
X-Gm-Gg: AeBDievb55HwpzEyYWJ6Q3WX8WFS/O1Xvr1+jPAmwCSrE6B2oM6Y1fNJmrTli/ADfzY
	IBfrvKshUxqtTIKSsJoAz1TSAS3qY0LfD6f9VcxpXfGSu+nz/jnlqeTa5nlCQcahcYxMrXaS/2S
	w6Jimz0P9EA1Ti8wkX4aqBfo37vRBx9WMG3fZgJd3l9cTQuGNVTDe17dUB3htIMyblEShJCFcYR
	4ir+SqsOxyrOqYgfB38IZHRv+83HCeKiaPjfzxSJeiJQ94pyZI9YDCXnKRs5HGS3Mc+J25DtZJ3
	GAenrBMTdLuqukBwxHcwXGZJnFZzTYo60bxR5vkEXzx3k8mXBeyyWHor6sWI6JQq6PvG8cFFhCN
	EbY24EULLtOMmc3sh8XQgD4eHuCaGvsjqVDTP8+ulsCNEDftSu52mrxue+uQd/Gz9yzNgP4mJAo
	StPa+rrIht4l3px/nHr/lvQJ/zoDMF6DGbX2M=
X-Received: by 2002:aa7:8892:0:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-82f8b32160dmr10160174b3a.3.1776653178104;
        Sun, 19 Apr 2026 19:46:18 -0700 (PDT)
Received: from lgs.. ([2408:8417:d50:4775:4566:2520:8878:87d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe41cfsm9351203b3a.43.2026.04.19.19.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:46:17 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/bridge: imx8qxp-pxl2dpi: avoid of_node_put() on ERR_PTR()
Date: Mon, 20 Apr 2026 10:45:59 +0800
Message-ID: <20260420024559.114664-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx8qxp_pxl2dpi_get_available_ep_from_port() may return ERR_PTR(-ENODEV)
or ERR_PTR(-EINVAL). imx8qxp_pxl2dpi_find_next_bridge() stores that
value in a __free(device_node) variable and then immediately checks
IS_ERR(ep).

On the error path, returning from the function triggers the cleanup
handler for __free(device_node). Since the device_node cleanup helper
only checks for NULL before calling of_node_put(), this results in
of_node_put(ERR_PTR(...)), which may lead to an invalid kobject_put()
dereference and crash the kernel.

Fix it by avoiding __free(device_node) for the endpoint pointer and
releasing it explicitly after obtaining the remote port parent.

This issue was found by a custom static analysis tool.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Fix DEFINE_FREE(device_node, ...) directly

 include/linux/of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 2b95777f16f6..600a6e8418bb 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -135,7 +135,7 @@ static inline struct device_node *of_node_get(struct device_node *node)
 }
 static inline void of_node_put(struct device_node *node) { }
 #endif /* !CONFIG_OF_DYNAMIC */
-DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
+DEFINE_FREE(device_node, struct device_node *, if (_T && !IS_ERR(_T)) of_node_put(_T))
 
 /* Pointer for first entry in chain of all nodes. */
 extern struct device_node *of_root;
-- 
2.43.0

