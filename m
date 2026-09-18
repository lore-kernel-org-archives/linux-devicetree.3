Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2E274FE3
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698510; cv=none; b=GiqI8tuJO2CVnpuzAUEIbsg/Nu7m5mA1/DPVIUZ7PQV7WnIk1Rkkca39PUduTBxsUQsGchU4RXPnSrvkpKD7AH6H1KINonxMCDNcxoWm6RUPAAc+NCaumf/osS8Uitm57+bKRKgtE3+wAO5mstKLEIa41exKpSYJZUfK7vwPP6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698510; c=relaxed/simple;
	bh=TSlhaoHt056EG01KMjT4sa2DRPkJIycjVnCyNR/78kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kzh2VmxMJK43NnQxtgjb9ockLpEm2K6eFDddnyO/Jvoze/8e/Wuia7NH1SB6cFJnzwdEpbHij5SHDrcGHWsz8M2YLnOOfnfbr7/Qmda9uUFyTxArk5EhlBOGEK6WQ5iWLaH7ZJHTg0pl7AOxtt9HkkvihKnAfSTJsxUA8gclAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=gClRRH3o; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="gClRRH3o"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50b9e8a45so81502a12.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 19:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789698502; x=1790303302; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=75MOn+8Kpp1iMZpcq17k9pp4tVm/EJnw36C6hjqHAdo=;
        b=gClRRH3oH/0dsIVnjUsI2HRVYRNeqIO79qCisS/ajWM5QrGBPLtWLsWy1kDMve4jKl
         hxNhjfakRL3QTNjYfeta48mSkPvD2dRdlVI3o3F7M8sd1eYpz2T8Bnkn1lsDXvjCcKp6
         +vypVM11/+RlH0Y4uVqz/3w992zj3wFkaAQ8Lry0rKOWR3c9HPlHpyW/mmN9QclpwLkY
         CtCLvgth4QHg3MJd7PYiM+5Tj51cmUbGUNu2pu3eJBgbzun24iCTSC7Ih06UxkT86zz4
         WYFiPPm8xuS7zJoAr3c4WHw55HbLnROMSlkjQ+t6h+kLNb345IzhZsOlfFIw7XMIMalO
         YgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698502; x=1790303302;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=75MOn+8Kpp1iMZpcq17k9pp4tVm/EJnw36C6hjqHAdo=;
        b=RFpLiF0OmUndqP2Wq4KubF9pnFZW7WsfsmcOHxUaUOPQNa8gE/RsbcJgz/RRzwVeb9
         9ftQ50Y2nsnyWGndQocZpzPLoctc40LU9rFBZ/Nv1XHRtScjS82yv1aaxGLBla+gPIJS
         KjMYVSCzFbDQIaaY+OSRD4N5yH7PkGiwt6lBRrCA6XqtzsJ2dRnHUcGd6PAjGX1Zp3AK
         lFzIYmzp3dN1RvK6K8fIjVmZ4bvlLLuq3oTvE9oy8rHW8l9QUJrynO7Y10138OudibKi
         EP/ZaoD+R0Y0WHrxLnRLZKf609j4ztqT1yNUrapYcUed0n1hYi+y1t31KDW4jKNtdA4w
         pkzA==
X-Gm-Message-State: AFuF++ndz0gSxRgGv+CR2RhnpHWXl4Vyo9fVHrSxa35mOps7AtTiBz6l
	P9bd+Ft3MpMV4/ONjxL6xu+b3hVaSlb+fuHaNlKrmLVzJnEh1gz1U0nku6Hyx02QiW6volESq7X
	oxYN7lRU=
X-Gm-Gg: AYBFou3PerkDy580WaA347JfJfr8qhaxq/yq+pr0Td/p8kNsaMzQ9MASznGz59nKsJ3
	wOmvoOqFXXFJ01m02rZ1eO9uNyJu5lguwT0IYoZKQ8hIbJNGQIN26xXsRgNc90mwuuc/kvBsEjz
	N+pIL1nltdH1ShuwH53Gf7V4DuTREoPPDuqibm8htTFTCrD2VcB1V3D9urME1g+s6/EKqRmxkob
	d6XLPyCgYfKIUpjDLkSe7DqZpNYG6v20apAxywf4iY0RX9V9shF+p8wrOate40OVi4pJdSBfeZ7
	ClO5czvaVE9A+zxDy3FkkJpgxyTeFyVplKgnO2AhsDDBhMGuF1k2ykJBNKrABlcNTe43h3jYMUj
	CH7VfTy0e1n+6CRU4px0+BcDYk5os9fkLEdCvYcoAeSQm8GLd91bzoSdgWS28pDn+6BGQi9sEKE
	3dbdg1Tnpj0psfz/44Ae3PNo50ow+fxL4pZzgpKYIJIe7vnAASu1+NVRzj54L/P0PnKDHuzKcDw
	qOhXZA756ac
X-Received: by 2002:a05:6a21:e584:b0:3d7:b3c1:cc34 with SMTP id adf61e73a8af0-3dd8c41a56dmr1477664637.26.1789698501950;
        Thu, 17 Sep 2026 19:28:21 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c28723c6dsm251393eec.14.2026.09.17.19.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:28:21 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 17 Sep 2026 19:28:16 -0700
Subject: [PATCH] of/overlay: don't pass the changeset's own id to
 of_overlay_remove()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-of-overlay-remove-all-fix-v1-1-920441cecae2@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAyF4auQrm0yQ4iCVzEuytCRmpExHSQSw
 t2tunvfW/wbFFbhAudqA+VFiuTJ4A8VhJGmG6MMZqhdfXSdP2HfYI6YF9ZEKyo/bCKlhFHe2EW
 KofWuYXJgiaey3b/85fp3efV3DvO3Cfv+Aey4M0SAAAAA
X-Change-ID: 20260917-b4-of-overlay-remove-all-fix-9fafc8104ea0
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sashiko AI <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698501; l=2070;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TSlhaoHt056EG01KMjT4sa2DRPkJIycjVnCyNR/78kc=;
 b=ahKQebfVELI4uwmP8Kd5EoQqoH+iJVv59cuX1yxk5zcLN7QNFhea01Xoi1+K2qopXD6Rp8nzY
 gFulJHc0tqWDTyQRZrhtRClVjXoAYNFUqYktzz9b2tjGtTKtI4lQPN9
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_overlay_remove_all() passes &ovcs->id to of_overlay_remove(), which
zeroes *ovcs_id once the changeset is reverted, before calling
free_overlay_changeset(). Through the aliased pointer that zeroes
ovcs->id itself, so free_overlay_changeset()'s "ovcs->id > 0" guard
is false and both idr_remove() and list_del() are skipped: the
overlay_changeset is kfree()d while still linked in ovcs_list and
registered in ovcs_idr.

Every overlay removed through of_overlay_remove_all() thus leaves a
dangling list node and idr entry behind. The next ovcs_list iteration
or idr lookup walks freed memory, and the ids are never returned to
the idr. Nothing in-tree calls of_overlay_remove_all() today, but it
is the documented API for removing every overlay in one go
(Documentation/devicetree/overlay-notes.rst), so any module user hits
this deterministically.

Pass a local copy of the id, like every other of_overlay_remove()
caller does.

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/20260901014554.83A8D1F000E9@smtp.kernel.org
Fixes: 24789c5ce5a3 ("of: overlay: detect cases where device tree may become corrupt")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 83c56dd9b5d8..f66f16cddc79 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -1297,7 +1297,9 @@ int of_overlay_remove_all(void)
 
 	/* the tail of list is guaranteed to be safe to remove */
 	list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list) {
-		ret = of_overlay_remove(&ovcs->id);
+		int id = ovcs->id;
+
+		ret = of_overlay_remove(&id);
 		if (ret)
 			return ret;
 	}

---
base-commit: 21c89ff1fc86ffa517f3a9ca1ba5c48e9e37c1ba
change-id: 20260917-b4-of-overlay-remove-all-fix-9fafc8104ea0

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

