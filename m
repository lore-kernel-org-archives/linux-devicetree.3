Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69F47126A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961879; cv=none; b=nEEJM1He60+XDbBO5bav+KdcYcdvZDlPcheLq4JTuWB5JgQcnS8chbexnRH85zuJnPtyAj6JD4STi5NJ6x3o26ieYTWgzdEq+AordFtFOjcKHku0q4jNZUG0LqfafDKOyux6pYsEsIM5Acmvaaqh5rWly0HDiRFJhrqavVprfCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961879; c=relaxed/simple;
	bh=Or1MHs7BHU4RwEsjCS87/j+WE5saCqR41FA7BAZ9WfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myszAWgOAkyd33h0R0Ox3zgp5OUVa7+Xd9AuzF0/sPwPXntB6NSNXiWdqu1grqlPYPXRgm9F1XwjpVKwg/ptMd88wQHOrWM3j8EjSuIGbs+7Xi1fbqa2nPz+37hk4aomcVoaDFILrlKVtAiOlULtFog6j4Ia715iiTqZ3mDrvBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=M4zmHeO+; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="M4zmHeO+"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbb973e6749so1746776a12.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785961874; x=1786566674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vi1HjMdF63tIWmwZPIcgrh+hHmXSZEnMc+Ltimo0SR4=;
        b=M4zmHeO+lz0LxE+3Mgj9IrZthMTKMw3vnWABARi91BKVogswr2aB3RpFa0tK4aoBES
         fxhJBNswhgccI4TZ2MNJAaXWwF7dz+Cg0OXzKd2pYSqQJq4JTe5z+m4FV72lcaTYEGaj
         72biZY02Xbr+4mqf9W62EKbZCHafKPQiKZ+1mBfCPebLA0T+9/anzWNelUNMTZe1X+NW
         E6QM3Wg7gmMDgd9VJ65SRIf83TFEqtHqUnfh+N77fIMff+eZdsH6HR8qra4h23zEviIs
         kC3RedC2I/hzIXwth32V2wrKnU7Gp0nxD8mVo8y/1+a73ZLjKScmTI4sDyppeyz1JUyH
         HJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961874; x=1786566674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vi1HjMdF63tIWmwZPIcgrh+hHmXSZEnMc+Ltimo0SR4=;
        b=HHeHYsGLsferTmzyG75RUKY+g4zgiFXdtAfwGJv2erZqi55uKzzSpOk6Y+jHVXsn/S
         XTxdpBj3OcYuXs0HZP8IFGmLWjDcXqSB/ias+uGJE9YwYYb3Vam/syBMrCdLE6VGIR0V
         QsSVPdxFBEACkPWvXoKe69IKT/ECjAODmTzyeIfvCU9cDSdOLsPUuFhiBX0Nh+1cpKfV
         3kS2bPyads3uJt3d6h4XZez9n72m7JRqj6rzXLtUEtkZkSakz6tsMxdpEacRyHOWs3X/
         4GNlV184OjSwtXRN8Y7HwSETTHdCMlPEaIM9vNiEhOTRY5D2kVhW2eV32PmRHsogUofl
         Xm9A==
X-Gm-Message-State: AOJu0YyCA2aS65PwqMfYxvJ1L1ybH29crJR3sxuDEjse9ujKvux//9d6
	JtbQF7RaIlLDCXPWBGnmsKmN/pNjW9r0KvPtyrJFCZOHgkPPvyxd8eahDCVorkXuXsfVnpPVABX
	jYUVXPkc=
X-Gm-Gg: AR+sD10UfthUPd4e+qQRZ+DE4xN1glP78rEIx155T3wwzUpObALN51fBBhvQxNagHkO
	Frxd1svbSfItsFMDclHl1Xrjlybx5f+jaLPAsh4oMgfckAwPn4nMT0qHdXjzSz764fbkzuecp3T
	rg1uhb+WSwQWXxnqN10nih/AMneroUrtQw7z3MyEKl1UloPW2Alw93CLp7D2e72uUqa+IodN7CH
	rHj6njEfoXm+JJGcE9qA8KfzluOadtr0TmI5YX8tXRevBpg6rkBOCPmzYXx30ZgeckvlkdkSV6k
	RdCjQUYXchHCRRUaKH5Jd9iLh95Ca3mSScvLLcDajLPrQs8u8kSPaz38gfyUtF2O9c0Ot8KN7Uq
	8rD0ywdM2XadS+9TNTUmiM0Nr75aXV0snIF5e+4C5rAZWeF2R4A0/Erv+Ywl7hwMTfXXo6QO5ca
	qLasqBPS3ZYOZVO3t0zgq73BpfaF9mjtuYbWNKvpIwOOc5kwLrDHSt2duso2kQ2vm4laB3m5J5i
	Q==
X-Received: by 2002:a05:6a20:734b:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3cb85dcb2efmr10868548637.7.1785961874000;
        Wed, 05 Aug 2026 13:31:14 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20694924c88.5.2026.08.05.13.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:31:13 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 05 Aug 2026 13:31:05 -0700
Subject: [PATCH v6 06/10] of/overlay: only treat a positive changeset id as
 registered
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-nh-of-alias-overlay-v6-6-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawn.guo@linaro.org>, 
 Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, stable@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785961866; l=1466;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Or1MHs7BHU4RwEsjCS87/j+WE5saCqR41FA7BAZ9WfE=;
 b=BI+hMWMEelWji4+07CG+Kl23bVoo3g1r9UXMuhI9QOPfBNP/orkMQKg0Kd65fLCicQGYx2EmA
 h9Lj5k6JHncBCgNMrN7tGo2IbTiIfRvHkXU+gtcNdIqWVZacDuB8Nif
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_overlay_fdt_apply() stores the idr_alloc() return value in
ovcs->id before checking it. On failure the stored id is negative,
free_overlay_changeset()'s "if (ovcs->id)" check passes, idr_remove()
is called with a negative id and list_del() runs on ovcs->ovcs_list,
which is not initialized until after the id allocation. An allocation
failure at that point dereferences NULL.

Make free_overlay_changeset() treat only a strict-positive id as
registered. The rest of the function already copes with a
partially-initialized ovcs, so the error path stays a plain
goto err_free_ovcs.

Fixes: 61b4de4e0b38 ("of: overlay: minor restructuring")
Cc: stable@vger.kernel.org
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 284c9bc6c9cf..9b9f198a1d70 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -860,7 +860,8 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
 	if (ovcs->cset.entries.next)
 		of_changeset_destroy(&ovcs->cset);
 
-	if (ovcs->id) {
+	/* a failed idr_alloc() leaves its negative error in ovcs->id */
+	if (ovcs->id > 0) {
 		idr_remove(&ovcs_idr, ovcs->id);
 		list_del(&ovcs->ovcs_list);
 		ovcs->id = 0;

-- 
2.54.0

