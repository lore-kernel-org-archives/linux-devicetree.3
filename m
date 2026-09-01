Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E093ADB89
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226174; cv=none; b=u09JTwungOi18jlrTVQWuU1p7HwCrsQnYQKnMrzMxbQRLAL2mvk16Cdo5RDzlMK/5nPkXXgW5tuefXACLCWCsMD+3YPFl8ylflQ/Ef5PjtXHqV9vN6lvtAlycTc3ihLIkju/BDZkmPtlFQcif9KVp5HWnpWc1GAKg3XuyLi8aic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226174; c=relaxed/simple;
	bh=ZEr0m0+64zDKVxyN/0o4Ov6n71mrZ2+8QMK6RrzeH1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fiie4cCerzHwZ3QidgQXzQQTcldS+VxxaIdrao9n26EteSVwerXebjRqwpbF4FPCCALmC5pLpunfPjK9+qsVqXcdZTJ8bPYs08zy7xfr5DeMVyESBM1U3+QdXVXZEvK2VZGSkAuUblc8dRhUvvXAhVnYyqWnJv5U68Vm4O9RG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=CyNtx+5e; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="CyNtx+5e"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so3256015a91.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226171; x=1788830971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBX4D8QE2oULZc7c2LUsXpSCt3UMpyQ0mFmC05VzQfo=;
        b=CyNtx+5edej+b31Nq+lbzo/25LvgaIkVP56AknZAlQ/TW3i0y5jo4rmfR6qBq4gELZ
         7R8guBLMcHzMEbi3DByKayyxFDWFitfS+t83OWa/CLuBwxzhSsr1zDPPcbKDrBvHauB0
         0oS58idDmmnnDimxxf4YkplyXFdMgvSGYnDXJ+w0zggAI6tv1fIlbhj2h7OLzZA7RhYO
         L+yroD6D197Em5Q43Og5Uw0uV0iFe08ro8niCYLWgf5PID7LPZkI3eR8LtwGhcOA57s4
         cDQejMjn9l6sA/icaOZ7eyBpB9Fg8A/mSzykyxIJLM2DXjsPs+76C3CtaBPHejPz22io
         SX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226171; x=1788830971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBX4D8QE2oULZc7c2LUsXpSCt3UMpyQ0mFmC05VzQfo=;
        b=T2lvBuHBim/5ggQVQpXvr0Cohpk/QF5yhZFGFlAZkO2AyNu1vMIfSPPM128gP0Dq3J
         6aiaVE4m2O0X0ZtNW8ezm+rceCqZQarzsnxq0c7KxYKVwtHfRU0HKz+WGLvxRURjM06E
         2HJVMDu2A5c4g+cYErtibE36TDfudLGr3mZkYE2PEbRvBhrfyslAsG39dFxCOPtZS+CW
         KhkjBCUss3se0h8LrOa/3xta2UNz1+IghANMZ9EOIYtI/ueHE4jqwoGlp9HbEDdIrexQ
         +LyFItMH4VQ59awvIZYScVeosiuMNvxDXHXO8dik5QeK2IX9twluhCWcdpffd+A7BkvM
         hvDQ==
X-Gm-Message-State: AFuF++nSQ1n6pocW/ms2Xic0W8/tPxi5gaf4wKf3LvSgX3xhUcLLQWRO
	qxWED8sZRi8x5XTosv6UslGTOQKpmiDDDl8AfW108vGcFjWG1KnH5b2WB6JPdWRLJQk=
X-Gm-Gg: AYBFou1tEufm2EKENVrZUPq8urcA9lBcnBepAqma6i6Dhr8MygNjq3+pfirlQmBJaGO
	RRq+zwsU9aRvoF6m/6EpOx4jEOkFfct30bbaARwqVUM0+s1xdWGKp9/zRzvjhU7yOKXiRF/i/51
	IM420UlLQfIzN/7nxuY3DVrckMmg7IVAp66DPVAvrz15sXtg1Ci/fk2sY/yBk/A3STidWF/Ayt+
	DDaXQColQvVPG4yTFd+UuMP0C6PPnfLtMp29KJqKtk4+ocnRxwKw6p3VVSkdlW1ginG87+vWT9S
	mmVHZWWv1HcPcwnXCLRUFA/rGz409skxrLG0d6EeRzlTEFXg5021i71dCQcAwph6T0C6zBRYCHw
	YrAX3KKiAC4iaAOKFIeezoGmYQBCdepYUknB0gu+qT93uXrqHcebQL6J7MP+JhaoZljBL40PW8R
	w/+7wsVP4nchrKp76Uq80AHfYZChg2pxJjlXEVpS6h1XbZR5ogujybhwZxyrRIdHM=
X-Received: by 2002:a17:90b:3910:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-3989beb6373mr27864091a91.18.1788226170796;
        Mon, 31 Aug 2026 18:29:30 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:30 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:23 -0700
Subject: [PATCH v7 05/10] of/overlay: only treat a positive changeset id as
 registered
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-5-02754604805a@nexthop.ai>
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
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, stable@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=1525;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=ZEr0m0+64zDKVxyN/0o4Ov6n71mrZ2+8QMK6RrzeH1A=;
 b=hOe8J1vYL2U09NmjwTYJSOrQFA7DNmF3EOkLkPXnYsNk+jJbWbFKlsze1cF9Yq0lUHJ8KfHMI
 7J0cR1HTouxC43Hs5CV3JfLFr+LvPKVX6Z7V1+3GCJoKm8nCYIdCStj
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

