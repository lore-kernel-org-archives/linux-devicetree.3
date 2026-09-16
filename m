Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9BD4772B6
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545569; cv=none; b=Ihp/H7ZCQcKedrZ7CCpemLwXT3F9UMrYKyyqF+mWsnnHMN9QORdh0QkcNU3OqWCc2Vja0a39qeBrQ9hRfIEfN/uIpiVC0ia9d1HXYaMJ8d8qGNR4PFX3XQ3GI+C78ZsVdvUu4dXfohPtiuSHplQe+Nja3SqkLdEVhIOhmlYQaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545569; c=relaxed/simple;
	bh=eyI1vaHvczB69tPN00V8OLfMpbO9IL68H/HlfpvrLfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3UfDn4P9vLpLGS0s1GyARTnOwsZdaLX0FA0kBSmCl6b5zinlhCLD8tAmcl/q/KBF+mzlyWPsPRMsjLRToLvae0dT51JoNAkrtvRTkMjbhe43S6Z0ZySAzSlUoCzui0huCTMGoH9wiLSz03z3TGONu2LbicUX7MzTupLsWuO/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EdYWdqak; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EdYWdqak"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso523651a91.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545561; x=1790150361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=;
        b=EdYWdqak89mpGcCcIBBIMtsyZhroWNz1AS049I9fmXFVAZFhiphJZcuAOtyVaCGoAQ
         3tTGpR6qDAYUev2vE6cobStk69IjGrt70exJu50kDrTkne6lTpdWr/Rv60/91Eepttva
         79ezHXoQ0iqFtMl9WNAlvPFXVJMn6XgZLp1HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545561; x=1790150361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=;
        b=Au2ctFmSFHw/HIPk0fU36ueNw4taGv7ACy3ViYxw1tVDUBhxZTRF3udR5kLn/seHx5
         /SbLvTOSBuAeqph5Rm2ClEz+lRMg50/VxnrAJWj+SYUXK003sTNd6t4po6CwSGornVex
         4trBfokPs6mIkskWXSIxqdUupfIWwp6blnIjP/8MFttWyU7ZKwNUH6qyK23nj+cwAEFW
         ZXkDJcKNpjGUF9xyU94D0dKsC5LJAopbm0Vg2ZXGys1uNLiBdxlpoEsUrQfo9dyp2kuS
         CWb0j4Yt5SJXfuS8brJv0bYYt906NMQwPMo2PsPsu/Qd22UvzkZISIfowT/xjV+3uZF3
         y9qg==
X-Forwarded-Encrypted: i=1; AKwUvBwpACmsHxOXAuDg5HUB/7mlW3qY/WQtWEi5AZAnEUXuRRlAPGOWWawMxl3Limm2UeqwRmOs71o/8mLH@vger.kernel.org
X-Gm-Message-State: AFuF++nX2MgcjNKW5FXenKx3DaW2zNJH6xrWh/l2Di1FX+nJnZ6PyS81
	AUca0DhFxIYcu582rJ/xpbhhTy0h96D9zsNSH8DNHd7wzHPE3/XUh15RS0ybHStxKA==
X-Gm-Gg: AYBFou17rNNE4Cyi/W4rvwF+CUxZY/TldTDbbwOQtt9IipJKy1GoK0cM9xTSHDz2VcO
	JR+M3IE0Wkfb30JViApUmhBKCbhp8F4K8s5/BEWggQzYEkAfTQFIoWxSY+PSZwjRhKPxjltd2T2
	X+sxJG6B30nsolkkRZqb1hQJWLlWfYYeINhav6uKiTbi6PH36n97K0MIff63O0WGIvzowWUDWyq
	2jnQl4RSna1rSA/tcciM14lwEZD2vPPW/ETbUeWNWE92zB/X40XY9/uZk7RXT1hW3qyU2ZWrnIw
	SH4JFr0kh9ckX26+2Tx6QV52Vb9Q0ByVAXV/4hSdJXwvFAO4ycQGNSdm925ejfUAxMYuMTat/dN
	ODg8qu1K/OiAoM2xnMEWmsBlfW9KZEssw7A0F5blHA4FTwPtFNmDU/9Ka2rKwCusOcsiMLTnFR2
	I4kJVs9YD52w9ij5dm/tQqa9GYqYzGq1s9pkjVaC3YlXM6tY8AcDonpAmqB6bvpUpIImqYP/L36
	M/h8OH3NFKBSD3swHnu/AKjY4NyQuFxcBWG+ZJYtJ5sFxxyl6xR8Uz4og==
X-Received: by 2002:a17:90b:3e85:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39e1e55f7ffmr3982483a91.24.1789545561399;
        Wed, 16 Sep 2026 00:59:21 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 11/15] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 16 Sep 2026 15:57:37 +0800
Message-ID: <20260916075745.3549953-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 322c307ce6c6..350a4c8831f7 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.1032.g73a4cd73de-goog

