Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AB62E285C
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226176; cv=none; b=NwFLvLxgECkGbQAOQc3qvQInzjSWnnDH+rFmxeVe6MaCBY3DJgDJaNMG388d00mIdRpf4dHth4YLLwKPpmuuQJGMjzNMp6VDNnjc5zswes4VcjQyp5tP2jQ6fF62Ec6F6qn5/7wPCawZNokmsKcDt8c//tvL3wJ3icoRcVKZxfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226176; c=relaxed/simple;
	bh=q9xLMONCbLWdhJ4OaevWw3M/plpvpB4yfOar6DAZZUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxxwBd6YwUzv6xmMJAh25ZK1Xc8LR4wldRReNMrEk9J0XwsXRxLEpdpLUOmz046otYSRw43KTjrFIr0/denx/LR1ExCwQgWWwfTuOluPZE/KwZTG5RVJ4p9XZFHdMicf6IQltBdUQv9Xv7nQ5LX0nhFCXDPvFVl5qXKcvwYGuyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=WbkwoeER; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="WbkwoeER"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d944747d41so14129115ad.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226172; x=1788830972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEreQw5XOjDLuZe5quRylIWJUa6BEc0yCs3u3pGy0TQ=;
        b=WbkwoeER0oEcVW9iovAvC5oyWIhUPROM7LtnXhnUscZga9vVePsVwPF3HQL5aN/sws
         3xcBTuZ2WdfrU2ZPDxff/6HDhP7ii0OiODfnLlyp/abO/D5ZjPR70aYk6EDVmI2x9N2d
         kJqnfM/uJ+SaJKgzGvWwfKJTpeB6gmvpIZxW8YLyML0NTeOs8qY88sYFzqN0fvb2mMD4
         PU38+K/0ZomACDVDTDksAtKfQx8kVf/t0hMVQV0g7UbTsr5PgmpeBZxzjJ85s4mlbHSS
         1Y0U1itxtf71D5hcCj3Hbr6KRmkJukZ+pta2M9ZGPMb0OmbQ5q5v4kg6frQIZ7ldPzld
         Kbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226172; x=1788830972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEreQw5XOjDLuZe5quRylIWJUa6BEc0yCs3u3pGy0TQ=;
        b=KYMVYgSSxNJLB+kbVFoYUBDKtMG3UCe0Ng4E+KEenDCU1yex3BIQx4AdLQhta9VyrH
         LgeMR3XjBywwWQqPFdt3oVfGOMxYU0PGVl+lo2s4oE8W9SSWTenYXNENLvEMGK8LJrFh
         E615hNfkeAis5glhb41hMNgKMRvOEzE5jnRRQkn/uNtHg/naKa1OWap7RyuZyTwPjb8T
         gfh5As0LcBMDB7NphLoqJyowEwkKIQJO/QyWCSY0FU4KMOzXUkZ/Klz0oQKjfJM7OJFm
         BkSfQ1DxrpXHllmi98B5wqaxHezXAmQ2CXYaWli3GcvjhLdWpyqQt/F5diZSLGVmKayY
         PqlA==
X-Gm-Message-State: AFuF++lUwrVg+/UUt1fN4eKY2ypdE9ZSDKrunkLp4fmVCsrP8pzVCzz+
	mUdvej+GNAqM1xhbLpygkT6qOYxPl36JrKOGKiYDxB2lad7DDGnMs7BDKs4MlyCdRRQ=
X-Gm-Gg: AYBFou2ogAspl3lswJcIpEB/gNJeFvJS7UZ2REsRv/KfFTuBjRi4eTFUg03NcAZG8My
	j0DYL90oaORpV2K3ZVChu8qBwRAkPZe21m4C+IrF5PGPeoDS8GJW8QgUqaQCSaVCEvHJQCMRi/j
	bXifwOlt8EyVpCPB1iBzD7Jn5Y/qZia/3QgV1VLOaS7Nz9aP8z2EHHKk4bvBOy6/QAWBdJxPMBB
	9uqAOpzmOv3nnF/21KMzrge2j4nLS26jMuoUMpcNvhZfuNmcG2OEO0Re39g/dV7Tn8C3NNhvRrh
	mIFX1rBXokiVK7ppqIKKqL32yGfoYVXXyH3wW+S24wx9bqtlD9x5DIz7PGqgKUseesL2G+4LwpK
	vtav1phJm6z6CUE/eTr+NKEgk+pmqyVlbSCwMdzhOsfgThO2dtjy0tBchcWOD1MisJKYoQaTtVh
	k+zwfpkssyw+Zk7j57b16erkBYiCPWQRa+uNp2LlcM8BSPsO2LKlpPCy4mCtIZcXE=
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr506351595ad.4.1788226171712;
        Mon, 31 Aug 2026 18:29:31 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:31 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:24 -0700
Subject: [PATCH v7 06/10] of/overlay: don't leak fragment references when
 changeset init fails
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-6-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
In-Reply-To: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Sashiko AI <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=1515;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=q9xLMONCbLWdhJ4OaevWw3M/plpvpB4yfOar6DAZZUo=;
 b=L2cOOfGiICvIF9zYrz3xoO8sZHlPz+DiVgGkYsFu0M/jgz5h/QAjfRyiV+hpjZXW7EKU2BSGI
 MLXOyFCtdATDJuLScYyhkVzJIZjhVXUsU1NdPYcSQ3HUpDpnEUuHXs9
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

init_overlay_changeset() stores the number of initialized fragments
in ovcs->count only on full success. When find_target() or the
__symbols__ lookup fails partway through, the target and overlay
references taken for the fragments initialized so far are never
dropped: free_overlay_changeset() bounds its cleanup loop by
ovcs->count, which is still 0.

Store the running count on the error path so free_overlay_changeset()
puts whatever was set up. The store is guarded by ovcs->fragments
because on the allocation-failure path cnt still holds the counting
pass total while there is no fragments array; everywhere else cnt
only counts fully-initialized fragments.

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/20260805204009.CF3891F000E9@smtp.kernel.org
Fixes: 61b4de4e0b38 ("of: overlay: minor restructuring")
Assisted-by: Claude:claude-opus-4-8 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 9b9f198a1d70..51241f16e87b 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -850,6 +850,10 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 err_out:
 	pr_err("%s() failed, ret = %d\n", __func__, ret);
 
+	/* let free_overlay_changeset() put the fragments set up so far */
+	if (ovcs->fragments)
+		ovcs->count = cnt;
+
 	return ret;
 }
 

-- 
2.54.0

