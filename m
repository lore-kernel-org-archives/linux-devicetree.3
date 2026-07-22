Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8845F224F3
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682117; cv=none; b=qsRmngl8ymiSJUdPdBLN+IyGG1ytqgzH/UQ/wq7Z+A1R5KC69FR0nN4h76il3jzRYOyxMAP1OtoDkMXm+3M/wFAIBbTtNpBoJwgXDHxxdURFWHUrv+GPxJowgkcN6bl6P1fN3uJOIn3nxny7DvHltLrJOSKR57Wyx0EMiguoMBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682117; c=relaxed/simple;
	bh=ruyEsUSk7dAWeLJgBxW2yqpOhr/A/9X7aodtMZGO2fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/0EBMXEVC8XM7vYxnPN9GVJtTaZ1vKBIOWPrGNFbTLpa0Vb3uUzYVu/FKxXeCiFlMbPim0C+WktmcUllYlPJ0eIoSnztG73CwBjq9QGIvR01RG9xxI0o/6+SUHDwSDcWnJHkzxuf2wwlwNp7v18weSwNMB9iztqAJnLhpswlx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=V6L+sp/0; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="V6L+sp/0"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceaf8a1265so119976175ad.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784682114; x=1785286914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tp8AOE3uAFXZigZSnFMB1K5F/tkZ+Fy9Wupl/gvbYAk=;
        b=V6L+sp/0T/WD9g7vBXu4wRVC7uAVq4ZOF0RTuGk2vRKr6r0voodO9ASw3Jr+eutfo4
         vCWeqHP0MfrPz8r+qpD0nKmeKoPbax7wadaZ52D/dmL0KOfYo7YMFhTtem9fuSOorQX1
         Lh8Lut08h7PHgOCyGmsSBnG1PVreBTes3Gz65XGaFxKNbCfjBqBr2mtv9VG2vr0gEz75
         KcvYb6mbFs/rc/gBA7ju4A+XQh/4qt+NhOvPpuqktAtWVXQQO0DiVxRtXNIiK8Q+0o1c
         bdqAf3qrgf2XucdG1HOZa8hhppByeg2pycN3aM/iVsgMQT+5MRiuTFu8MRPPUZVajKj+
         fvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682114; x=1785286914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tp8AOE3uAFXZigZSnFMB1K5F/tkZ+Fy9Wupl/gvbYAk=;
        b=YdRM0zVHv1jAmyTOHCCJSueYw3sRjX4+ufvv1sYQbyO7g+qH+Z1dQRDKWE4HYuFnj3
         Wzq+Dd/wERW5vua89895Y6zg82jbdkddYkGi+Zovjo9ht5UUemJjtu5DxPp3KycsCrpu
         h+KrWUnqUNbNoHWm2o6NdWlsmjcUa+RoB2UInUJR2I67FGFnnXECX2ym6JLdBrluKiaK
         zD/AMySFD1taBuNI0q5F6mnKoe4ZkQ+uqOSSaBzu0hVnhI0VS6S2y/5bCvKRxYey7iiI
         6uIWm0k66Wi1EO88BmCpwj6C3OaKRVW4nxGKg/NHkMCHJiDjsQlWk7WzXXS5qm1ZoUcr
         Q2iA==
X-Gm-Message-State: AOJu0YxV9lNXmcVYftptzoSpEDA4qOYzioH7eSVgV2Qc5APpxqqYm71S
	BaeSWlZJNyB0Y2MEyrJOjgwnZOuxfcktA7DtCaoEjCL3o/i234RHMznAflCShQ3e9Nn9w268W+N
	BuY+HLyk=
X-Gm-Gg: AR+sD10PfPcYxtx5OVcVf7SIb/QGncvkRFte6wrgX4XTDbBkqsnLxmlsDlVGIXN/VhB
	x5fctnO9Vrkw8VI7+Fm+9MrqaBoZZvpLuU1S6YlkppghPbEapMJeCYcsIPA8PZvU++kaiUeQ0Hm
	bLSqOLiD3aPDKPfy38Jr+KZlU7SSRFl7zPjSGIFJKDCFRcXioXtG24HpzyccqYKrvgRcPZI40bL
	L/hxhtCKAn8tn2kwKhcU3emy0MAl77aQFoT8Ia5sQeywTXjwuvBWZFuGozeelZNX2H4DLN+QY6P
	kS/dFYDTz1tpGeUS5HCeN+4Bp6hdIOu4Rvgj/HFvO84IpfDddoJlsr+Fj4AHipACadGdZur4pnm
	IqNNyhB4nTu2tvZF5TyRNJgXO9nx5hCedBnn3DUbeGY4GeyDdRbANYBytWGx3OCQ3QIfJSTs8Wz
	ZDrcbd
X-Received: by 2002:a17:903:1210:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cf34a0a6c0mr212343185ad.25.1784682113847;
        Tue, 21 Jul 2026 18:01:53 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm3141207eec.4.2026.07.21.18.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:01:53 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 18:01:49 -0700
Subject: [PATCH v4 4/6] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-nh-of-alias-overlay-v4-4-8ad097e31e36@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682109; l=3699;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=ruyEsUSk7dAWeLJgBxW2yqpOhr/A/9X7aodtMZGO2fU=;
 b=HJWATAYBeNlEyPwzlI1Xqfu0VK1VBCRpKGEAgPsD0xFwpREaCrfUj9YfFwHmmKR1HDvedi5D1
 kSy8kTm1gWsBuSx5y2bslal13DRwAVC9EawOT7gkh1nmvGPPnIF1Gi6
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

dup_and_fixup_symbol_prop() returns NULL for three very different
reasons: the property value is not a valid non-empty C string
(malformed input), the value does not resolve to a node inside one of
the overlay's fragments (not an overlay-internal path), and memory
allocation failure. Its only caller today reports every NULL as
-ENOMEM, so structural problems in an overlay's /__symbols__ node are
diagnosed as memory exhaustion.

The next patch reuses the helper for /aliases values, where the
distinction is load-bearing: a value that doesn't resolve inside the
overlay is a legacy alias that must be copied verbatim, a malformed
value must be admitted inertly with a warning, and only a real
allocation failure may fail the overlay apply.

Return ERR_PTR instead: -EINVAL for malformed values, -ENODEV when
the value is not a path into one of the overlay's fragments, -ENOMEM
for allocation failures. The /__symbols__ caller now propagates the
distinct errno instead of collapsing everything to -ENOMEM.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 74aea704835a..ad4e50482515 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -206,6 +206,10 @@ static void overlay_fw_devlink_refresh(struct overlay_changeset *ovcs)
  * The duplicated property value will be modified by replacing the
  * "/fragment_name/__overlay/" portion of the value  with the target
  * path from the fragment node.
+ *
+ * Return: the fixed-up property, or ERR_PTR: -EINVAL if @prop's value
+ * is not a valid non-empty C string, -ENODEV if it is not a path into
+ * one of @ovcs's fragments, -ENOMEM on allocation failure.
  */
 static struct property *dup_and_fixup_symbol_prop(
 		struct overlay_changeset *ovcs, const struct property *prop)
@@ -224,14 +228,14 @@ static struct property *dup_and_fixup_symbol_prop(
 	int target_path_len;
 
 	if (!prop->value)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	if (strnlen(prop->value, prop->length) >= prop->length)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	path = prop->value;
 	path_len = strlen(path);
 
 	if (path_len < 1)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	fragment_node = __of_find_node_by_path(ovcs->overlay_root, path + 1);
 	overlay_node = __of_find_node_by_path(fragment_node, "__overlay__/");
 	of_node_put(fragment_node);
@@ -243,18 +247,18 @@ static struct property *dup_and_fixup_symbol_prop(
 			break;
 	}
 	if (k >= ovcs->count)
-		return NULL;
+		return ERR_PTR(-ENODEV);
 
 	overlay_name_len = snprintf(NULL, 0, "%pOF", fragment->overlay);
 
 	if (overlay_name_len > path_len)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	path_tail = path + overlay_name_len;
 	path_tail_len = strlen(path_tail);
 
 	target_path = kasprintf(GFP_KERNEL, "%pOF", fragment->target);
 	if (!target_path)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	target_path_len = strlen(target_path);
 
 	new_prop = kzalloc_obj(*new_prop);
@@ -281,7 +285,7 @@ static struct property *dup_and_fixup_symbol_prop(
 err_free_target_path:
 	kfree(target_path);
 
-	return NULL;
+	return ERR_PTR(-ENOMEM);
 }
 
 /**
@@ -350,6 +354,8 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		if (prop)
 			return -EINVAL;
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+		if (IS_ERR(new_prop))
+			return PTR_ERR(new_prop);
 	} else {
 		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}

-- 
2.54.0

