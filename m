Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30E93B9D9D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669802; cv=none; b=XG3rLOLPDTqfQnWSH/XdWQcciWob9Hbiv6JSrCHAfF6g7z3IgDuzoU8MpJAiR0nqRtA3kC/d0Jn8hVPRY1qAYDGkVRgncb6yKawfvqmRrqdIYvYuahzaKUZT8LD24ZqGEZoORF+YgbBHC6xZjnvj6cDv+gsAeOfE1lnY+BCB9bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669802; c=relaxed/simple;
	bh=9F7dJ+inrhVNDc21QsXGgXk/0suh7nvq9ES3M6+Hft4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NcQI5Q1IGa2JPIvMI+M9APPE7Xrm2N4bCRAYnq885pi2NUTgRXI/TMgnGyuNXVXeI0DOHXyymqHQzdBVyg7ubPLctb8SxMZ4rY63LTIZIy6EJu2lJUBIgviCEaAnsW+iagooZTFVxKX+lW/7ZQ51Sc7zdNxri1vqF1kc2d7evHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Dk4XN3yw; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Dk4XN3yw"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9d1fc053e0so7295497a12.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784669799; x=1785274599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+NMrtww3p/ZfbpmtINPl3bPptXhkVES+niqW4felRA=;
        b=Dk4XN3ywMVy2yc00ilGFMKmjBC357Xk6KI7jPecqL0J8BtAuygMdIhho+EMhncEEN2
         btvjlQYp2lVM1pSJmwQ7TLL6hFrwR8c/Trhm8DC0lszApB8VPwAhR1e4zY4ATHud5pyf
         /z4dgUx0tHDQz+JMi2hCADpde0qzPz6iv0oemh995aIFkSR3h9vgqhIY76Pw5oys3yAW
         n8CZ/owPV/TzOAFQX+TNMJlRte6/2CtpOLJbwQOhWTqAX2whIRofyCviqcTBFRF0Vmcp
         YuAJKSok9TSs4/taX5akBAgb3qkLj79jnPINpqsGNSoFWJ1yUjqcLSZw3d9S8MsXKufa
         huaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669799; x=1785274599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+NMrtww3p/ZfbpmtINPl3bPptXhkVES+niqW4felRA=;
        b=VWAp5JJuk7tF8JzGHDwO80ihHisputW9ljo50X+zeZESDWug0DweDpMntUP4ou8f3f
         ui+eFkj6cjI+dINa6NR0eikdE28z6Dvtgd5io2dsSHUGrCUbuQP0JMZH8wYdsx16IwVU
         mR4WXem0wVti3OJMLqYxQ6g6GFgpseR/X/m+lRb0qmOU8TES1LyGELP/rr3BM0qDR7Wm
         ffasz97n7grkbgxv2RjRecMpbmciXcVvEauTGLyzD1EM0sjVGxkqnZhRMYQvU6zyeBow
         bjHRdb1Fop5xBGSAOpF3GWPg7nM3WPcfJ6hK887o04DGjDTWp23RMX7HAFbdqFntMiuO
         ML8A==
X-Gm-Message-State: AOJu0Yyr69UlHXKfYd89A9GopK+yVxSHMSg2Jz6YQDmt+oVPJYi0tKAR
	tdJI9BUuQrodBsnuXYFPSK4c98SI8MgCoQay8eAzv699iNVeUGrs0eoZMm6llgZ2jaaLb2YpJGS
	XuDvnGbA=
X-Gm-Gg: AR+sD10ZM1UYJ+S77Rbbl7eIc7IcUKcqzMqvc/JLah4uJngHtSM7QQBI/HeCfr64JwE
	blRI1ijuJjPzordhD0yXZ3U1gCAwSVQCVRimYFQb7FdfkSIjSrzPvzb79XqPGK12QSUpy9/Hb6z
	7gTA7BRBxils+XoLKezCNFXbh2UPCEksZq78C/bi2NqM/elRiC+QLNKXdE9yAm+XXxqy3aEmdsm
	U3wSQASZ7lq40K21Cy5LUoir4wluhVkif4GCKmrVhzVEkSpplbBNWtqx0+dIgDz1tB09Q+QdWVi
	EiemwVI5IgpS909kjcERI8quJfnA5m3NymBimCe8DIDbFQnoIFeQb5FY4imNEtdX5vJG9mVLc14
	P7GlSY88KjRwYhgOvhDeYkLGWGivxGmWJRAR2SDtiztAJMse6fP15rb926UmhkvRAZkczahqx/n
	ygvkW2bffV0mV8gY8=
X-Received: by 2002:a05:6a21:103:b0:3c3:8440:f6da with SMTP id adf61e73a8af0-3c3ad77e60bmr21400247637.29.1784669799421;
        Tue, 21 Jul 2026 14:36:39 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm40706521c88.9.2026.07.21.14.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:36:38 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 14:36:33 -0700
Subject: [PATCH v3 2/4] of/overlay: look up absolute target-paths
 absolutely
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-nh-of-alias-overlay-v3-2-7001028fe2f5@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784669796; l=2645;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=9F7dJ+inrhVNDc21QsXGgXk/0suh7nvq9ES3M6+Hft4=;
 b=K7TWG8LDs1vQAWT8Lb0c9TsZlJLa7vzjS1nRi/14Qq0J3TrIdhHvpemb0gpGva/hOus0gGAH+
 1P0TO8V/VVsDqYrp6rdn91aPN2FqShtNB9LKBjKqJ3iV99H8srHug+R
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

When of_overlay_fdt_apply() is called with a non-NULL target base,
find_target() currently concatenates the base's full path with every
fragment's target-path via "%pOF%s" — so target-path="" resolves to
the base itself (the intended common case), but target-path="/foo"
resolves to "<base>/foo" (never the DT root) and target-path="/" to
"<base>/" (never a valid node at all).

That makes it impossible for a two-fragment overlay to modify one
subtree under the base and one node at the DT root — a shape that
arises naturally when a PCI-attached device wants to declare its
peripherals under dev_of_node(&pdev->dev) AND add /aliases entries
so alias-aware drivers (i2c-xiic, spi, tty, ...) can pin bus numbers.

Treat target-path as absolute whenever it is non-empty. An empty
target-path continues to mean "the target base itself", preserving
the existing shape used by drivers/misc/lan966x_pci.c and its dtso
(the only in-tree of_overlay_fdt_apply() caller today that passes a
non-NULL base).

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 08d5351746be..b6545905cf67 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -693,7 +693,6 @@ static struct device_node *find_target(const struct device_node *info_node,
 				       const struct device_node *target_base)
 {
 	struct device_node *node;
-	char *target_path;
 	const char *path;
 	u32 val;
 	int ret;
@@ -709,23 +708,14 @@ static struct device_node *find_target(const struct device_node *info_node,
 
 	ret = of_property_read_string(info_node, "target-path", &path);
 	if (!ret) {
-		if (target_base) {
-			target_path = kasprintf(GFP_KERNEL, "%pOF%s", target_base, path);
-			if (!target_path)
-				return NULL;
-			node = of_find_node_by_path(target_path);
-			if (!node) {
-				pr_err("find target, node: %pOF, path '%s' not found\n",
-				       info_node, target_path);
-			}
-			kfree(target_path);
-		} else {
-			node =  of_find_node_by_path(path);
-			if (!node) {
-				pr_err("find target, node: %pOF, path '%s' not found\n",
-				       info_node, path);
-			}
-		}
+		/* an empty target-path means the target base itself */
+		if (target_base && path[0] == '\0')
+			return of_node_get((struct device_node *)target_base);
+
+		node = of_find_node_by_path(path);
+		if (!node)
+			pr_err("find target, node: %pOF, path '%s' not found\n",
+			       info_node, path);
 		return node;
 	}
 

-- 
2.54.0

