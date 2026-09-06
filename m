Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37A643F4B3
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788695537; cv=none; b=qV2f75V/mraBWVUFq+upbBIQBW6hL/4v4ywHlc94Bhughj3fmJxBM5IS3CsryeB2tutoycXq5Iok7dXFvCqnNY8fcrBkgkZtYePGbZi6mOHI/OPE0oxx3vHBKoaV3CRKRCpuLUoNrIG1TBgb9Qrbqri6sM3Ur+Xq6VKtJX4+/qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788695537; c=relaxed/simple;
	bh=MtIxUv1HUhphqto5paraCNIhe7tNRBGeSF/voPqNm34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AC+GxDmGW8/vQkqizLjhBWtytJZKxCRnNv3a39cREQfo+45BdvHA/U2qhQ7hSZ/R77mXVnTDQLbEdYA1fKFwVgNZ7hHhGeNdv95R9dpyfHXTqjTzwgevM0iZDgHaP4xTM7cgOoWWqp6KWRPrVUvH59BAfa1LBMeNgZ32HxbhlnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9I3m3Pq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9I3m3Pq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47de0093c42so2170029f8f.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 04:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788695529; x=1789300329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZO6dxofZbAitz209jLurPVDhx0uGUtYXwmfwELJ9t4=;
        b=Z9I3m3PquqCzh7yvD1sPyANNs/vP23D5WZLIiiLpthVn5RTbG1WBTk6knbimcmCjyV
         z3a097TvjVpJCiJMAUMbYgdon+mNmKg1tw3k6mz0rS69BMFpItuyf+KL/e4I8Z45dkuP
         ysO+db7KhChFYhJQ5aH9Emal/GIiT8U5UcPNidpEjc/i0O0I0dnqHXHM8WrF3HYjUQQM
         qOrd1QeA2cS6QENk9XPyv+OheFVTv+AJmdVb/T2tWfdostJnncTQnLxANnOLQtCp4Xk9
         /7yzS4xuWrg09b+1keE/K9a/V5yfqJF/yKojJ7MoglEzfhtBKBZs4RHc5p1qmi6xzPuy
         YWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788695529; x=1789300329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZO6dxofZbAitz209jLurPVDhx0uGUtYXwmfwELJ9t4=;
        b=jE63YmXPqjdODLRzVSU+YyWvogByLgog6QC5fBA9t6vhVfFTd0DVUMsi0bmW5lBFed
         ACefhayLINIWSCBaslsWSqDPgbvjrAsUgX0rBBWq2An/AJvUB/8xX2++ZzgsduZIZwPb
         80sYdNzwWBHYfDARAz9lEp+ZRkUMGw8W+M/+ygoegIT6zwrvz5mSToaxgu1u7S53wZcM
         gPx1ypV291hC8F00TwyRll4fJlwzHIGm10+JPns244Jg5gyFdlvPCQQ6qfX4lm23Vh/q
         9A5jTELyHkZGCHXc81QD8e5hHKZzjgy0ynspJHVjlYP0Kp135vi0FlULxGAMQqIJXiWF
         SSXA==
X-Forwarded-Encrypted: i=1; AKwUvBwYRSLO8V4I6QkX04qLeV5+sq2KcBySTDNa0K8YLuAe9e6jUxts3ea7fAWB5Ud5QcvbuA421Yn6qaYe@vger.kernel.org
X-Gm-Message-State: AFuF++mQapsNtQjE28ohVafWqzSqwmALMOBYUZqXNdHVWFpqi7X7JVOg
	yB2XHUoRnRhGGIL+BID54vWf0BVYWcHmCq2wZb8Qk0So6PSYuVhpRiV5jg9y3Iu5Muo=
X-Gm-Gg: AYBFou3T4auOykCxCg8o9w8MrdCBNSFDvNfKTyi6DLA0zIfyL6CU+XkkOLXm7B9X+Mt
	kmUVI6HX6d0FnqsusE1rIv/nZdh+uZa+I7y5h6qoTeTl6K16F98OSrEI/iN5TqK6BxTLLmLrkN4
	xzUTeT0Nprf71j+PpHN+k7DboU3cd+JNb7FV60kLWo25UsNyhh4kpPcjxCphIK6V3/E+b46ZiLL
	TlYvJRNOB5Wx/Zcbv5J5SKAP2NYTN15hLkm7SNnsTsDVcD/zCa7viCCt5N95mVFOOAWITX773k5
	6js5/gLrtPw7HOsbrGZfVTVj6K9wQ7S98ELt5lCj8+Od7QdCufeyCWWGRZFS5VL2e1x1K542W65
	Tmvs/FTZuAkgwfTf3YMsp3+xKuh84O6S6UOwPL1YUfINx+SR+FPqlRnUwVuVMPq68VEOE6realU
	jP01bbdIeCAAtD49s0jKqFOpFSTPlVKv2KQqku2n+iirEQQebJqwfPxCe3PogE90zsozGrM2NJ
X-Received: by 2002:a5d:5d08:0:b0:485:8c16:5ee3 with SMTP id ffacd0b85a97d-4858c166094mr13997876f8f.29.1788695529055;
        Sun, 06 Sep 2026 04:52:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm19337821f8f.3.2026.09.06.04.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:52:08 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 12:52:02 +0100
Subject: [PATCH v16 1/5] phy: core: Fix use-after-free in phy_get paths
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-1-f7bd68b5369f@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5297;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=MtIxUv1HUhphqto5paraCNIhe7tNRBGeSF/voPqNm34=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnVPkzQreRDINC8gc6PVU9OptNsBHyPK2HTTLF
 HNWUVg2QlGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap1T5AAKCRAicTuzoY3I
 Oi7aEACVDXdnif71jagkrS3DzKgqQ6oTIlTQ9NUmf0Ym9BAFaZOLLl4C0BewDxxksy1N7hNXi8D
 BMD6g/ch+0X57Kh5p0PmwjB/+Vx8VCIThFyGplccRTwRN+DuOPGk2nWC+1XE/wO7uueLsv4Khwf
 snk+5k9KMTriW7cZt4Wi19GMRPP8IlDEzp6bqg56qlpzqkFDPI+PWU9Bs7k0/BPHvpd0p9/dHUY
 /NdwhpzvSw+TnhyS5Asl+RqBziBOFWXPIpAbnlbO2reopW8wq4+y5JvkPCPUMQiCnRMT85uU7PQ
 c/2dLT82MdJ5GqppK0Zde6SHF9a4e0X1u7m2WndNpTSEZ97is1ewLQMEH+IrJvREtXBXqfo9Rrt
 VIaFElW9qHPfrNoiCAf49D4qDpQM3hemY77ZD+MFLtk87KPTQ4YoHUzbMHkQD7TUF7o4hOmxwFB
 doC42uvAWgXF9PL8uUirO8VoHlOQjHNbA5Y5JF5wWzVz4+alPn4sdwI19jkGU++FvzNOetzt2ol
 7UkaNAR9s986SoXLHQGv/OxkxBtzOmCHoQFrbMlyBIVRFljM7GX5PP3Py0gGIivSfVgJ9Ms5Fkt
 7Dx6qbHE9aT5LlzVsKCE52ldXjqOxhYNkCPZVibTy8zDGyvPoSeEOOQikpxhq9yNEAn1dzglMT+
 KHF35dCy3KGQcbA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Sashiko asked during a patch review if the existing usage pattern had a
race condition; specifically in of_phy_get() if it was possible between
returning from _of_phy_get() and running try_module_get() that a module
might be unbound leading to use-after-free.

Looking at the code this appears to be so, there is no linkage between the
phy and module under a synchronisation primitive.

Using the phy_provider_mutex in phy_get() will ensure there is a link between
the returned phy pointer and the module_get() bumping the module reference
count.

Amend phy_get(), of_phy_get() and devm_of_phy_get_by_index() to fix the
same usage pattern.

phy_provider_unregister() must take the phy_provider_mutex so amending
phy_get()/of_phy_get() to take that same mutex guarantees there is no
use-after-free.

Fixes: ff764963479a1 ("drivers: phy: add generic PHY framework")
Cc: stable@vger.kernel.org
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c | 45 ++++++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53e..89addd732bff3 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -124,13 +124,13 @@ static struct phy *phy_find(struct device *dev, const char *con_id)
 	const char *dev_id = dev_name(dev);
 	struct phy_lookup *p, *pl = NULL;
 
-	mutex_lock(&phy_provider_mutex);
+	lockdep_assert_held(&phy_provider_mutex);
+
 	list_for_each_entry(p, &phys, node)
 		if (!strcmp(p->dev_id, dev_id) && !strcmp(p->con_id, con_id)) {
 			pl = p;
 			break;
 		}
-	mutex_unlock(&phy_provider_mutex);
 
 	return pl ? pl->phy : ERR_PTR(-ENODEV);
 }
@@ -624,6 +624,8 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 	struct phy *phy = NULL;
 	struct of_phandle_args args;
 
+	lockdep_assert_held(&phy_provider_mutex);
+
 	ret = of_parse_phandle_with_args(np, "phys", "#phy-cells",
 		index, &args);
 	if (ret)
@@ -635,11 +637,10 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 		goto out_put_node;
 	}
 
-	mutex_lock(&phy_provider_mutex);
 	phy_provider = of_phy_provider_lookup(args.np);
 	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
 		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_unlock;
+		goto out_put_node;
 	}
 
 	if (!of_device_is_available(args.np)) {
@@ -653,8 +654,6 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 out_put_module:
 	module_put(phy_provider->owner);
 
-out_unlock:
-	mutex_unlock(&phy_provider_mutex);
 out_put_node:
 	of_node_put(args.np);
 
@@ -678,15 +677,21 @@ struct phy *of_phy_get(struct device_node *np, const char *con_id)
 	if (con_id)
 		index = of_property_match_string(np, "phy-names", con_id);
 
+	mutex_lock(&phy_provider_mutex);
+
 	phy = _of_phy_get(np, index);
 	if (IS_ERR(phy))
-		return phy;
+		goto out_unlock;
 
-	if (!try_module_get(phy->ops->owner))
-		return ERR_PTR(-EPROBE_DEFER);
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
+	}
 
 	get_device(&phy->dev);
 
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
 	return phy;
 }
 EXPORT_SYMBOL_GPL(of_phy_get);
@@ -786,6 +791,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 	struct phy *phy;
 	struct device_link *link;
 
+	mutex_lock(&phy_provider_mutex);
 	if (dev->of_node) {
 		if (string)
 			index = of_property_match_string(dev->of_node, "phy-names",
@@ -796,15 +802,18 @@ struct phy *phy_get(struct device *dev, const char *string)
 	} else {
 		if (string == NULL) {
 			dev_WARN(dev, "missing string\n");
-			return ERR_PTR(-EINVAL);
+			phy = ERR_PTR(-EINVAL);
+			goto out_unlock;
 		}
 		phy = phy_find(dev, string);
 	}
 	if (IS_ERR(phy))
-		return phy;
+		goto out_unlock;
 
-	if (!try_module_get(phy->ops->owner))
-		return ERR_PTR(-EPROBE_DEFER);
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
+	}
 
 	get_device(&phy->dev);
 
@@ -813,6 +822,8 @@ struct phy *phy_get(struct device *dev, const char *string)
 		dev_dbg(dev, "failed to create device link to %s\n",
 			dev_name(phy->dev.parent));
 
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
 	return phy;
 }
 EXPORT_SYMBOL_GPL(phy_get);
@@ -961,15 +972,17 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_lock(&phy_provider_mutex);
 	phy = _of_phy_get(np, index);
 	if (IS_ERR(phy)) {
 		devres_free(ptr);
-		return phy;
+		goto out_unlock;
 	}
 
 	if (!try_module_get(phy->ops->owner)) {
 		devres_free(ptr);
-		return ERR_PTR(-EPROBE_DEFER);
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
 	}
 
 	get_device(&phy->dev);
@@ -982,6 +995,8 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 		dev_dbg(dev, "failed to create device link to %s\n",
 			dev_name(phy->dev.parent));
 
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
 	return phy;
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);

-- 
2.55.0

