Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54E44C4EA
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429327; cv=none; b=TG12W1IoYkOWg/Ah5JsmBu/R+LOZrMDtI62kS6UNFd0N058EN/Zk3nB4Vs5K2zMBXjdh0lWymNQwa42FkH4JGaItLe89kFDBlMZDDnBXvHT6Fa5ZdpdFJ0ZNZu01meB4+dkfFBVXmJGdS2e88N2c9ZykiujDeB2e9WHdSJNZveA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429327; c=relaxed/simple;
	bh=9/dYBTHrq7EV9WTV3/3yKdBwLkKoAWFK0mO9gViXnSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrDdgCHDoFZejpuB0DuUNyKDaaLFpUhWt980xo296BjZFCm3KhebAZMvzR/s0p6w5/ZV0ag/G0rmxM5HF5fsREQJTnziv1HnYI5ZHxbjnIIp8DQQeGEf7aTit1AGyPTSUgFaTeA+ELhFiHWNyywgGm94hMIU/aBPAPDA4XFAzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEp9F0hr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEp9F0hr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f6609c657so1207263f8f.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429324; x=1786034124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KN9fvuyUrAB/AWwJUn50v4AmnDRRKrkHVX/t4wvTSMI=;
        b=MEp9F0hr7dQIQfPC86eROsAF9fRK6LxGv5XniOeM7j0Z9jGVI502B3dA2AxnyRzezk
         a5rPrpzimbfyYelCLwqJgNQul1Ubzvy4oMmv6rbsPlhCn/luLbmbUPkBgNQhP5esCb1j
         Fo5aS2FLh9m/zltpN76BOXzHcskIFLu50NuvN8CpZofNOogLEWUvHAu9uLUgMAIUZKAW
         OWqlPRabDIFy2c5OJBC8T3BjO9dhfuNefsphn6NKwCK1nU2mvd+59YHWHDTG87HyZgHD
         f0cDBIOb8J4tIXYJUKEdzxm/I7TNsOQfnH6Fh6U6yqarMLJ3YrxKGuLmva8FoAlaTzLZ
         WL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429324; x=1786034124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KN9fvuyUrAB/AWwJUn50v4AmnDRRKrkHVX/t4wvTSMI=;
        b=sLN0nOLWGaT4jk1Le1rWjNRxBFmzo55H4C+jWkyMERjlmdWUfV96oe4bLYkCFkzNBp
         SiH0OQ87f/DKiWtQfKk/C/aUYov5b65qVRn93U/CyDuZZqedUfSr0YHNfhUHljbbz3cx
         sVgrfVEFc+8UUQIzX4+vyYBr4xzlZ4XYhydZON3NyDP9s3qrhVnLHmYcUFcVYllWsYWM
         o324fFROuhwHAr1qhbpM+8rpXvsfJWzj9ucwe9lO/zcVD1mXof3PUn2lLqQWy2FpBnT1
         +RQHC1BDM4Ba29ZDhmBTquwpJNbLrDMPWht/97GJEuxYy8mWhPqLx/b4uL3sBX4Xts3W
         lWVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3X9ToGoQBxqd0ieH7E7kvms34ixeiZSckQtl38Ty2FCIWzSU9X0y6mSRwxZcZLrDfRBZtMM1lK0nz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9bKX6kBCSoUz45ruN2lDh62em2ZUzEAbXqbFDET8K6ooeqR+A
	7Z/7Np523bQ4aRbJcC45zaCUL19Qm+PiNGqqtqLAJMxx+qfRVXBDfBpc
X-Gm-Gg: AR+sD12Jl9MBNwTfaqbbmdoLZ2IcM48dib9UkgWhjBxsm86jElYrU+lDjqQ7sXiIeny
	aqkS14go4waDp5chCEjKz8fl2m4GzqfhWLdVtnafEEsguptqLn8PaCPKlhnhDMYRSS3RqaupYss
	JJ5Lin1Wb5Lb3CXrGr4EGUOWRcGu3UBSeCAz2fmbsWfH01uLGBfmiyf/170rCQ6cxKiXsbm92oh
	NQZNLC30883toK+3Ft+Rn3W8zrv/hK/plU5VuSuLsf9XFQhqzzm5IM4IV2FGs9UHmCKr6wuBm+7
	p6Qm4lSAkI/nJPYatzpWkHtD1GHJv2+xlS0YiVZsFV2QZBl7yj80WLiXL9rxCD8BzBOXhd5hovF
	nj5vZMsUYYCrVzVaoS8BM/73L9jBAtWWqPDkMah62xpmcz37mwlE/ZmStsk4o16IR4GOL6EOsUk
	TPQwutWxzW97f0En7YJ8y/iawHSo5dO9MOtpOfyapEmeImMWO+2KtYFzn4a/nlQF59mxNchC7QV
	/B/rr2sGLAUbQ==
X-Received: by 2002:a5d:588a:0:b0:47f:9751:cb3d with SMTP id ffacd0b85a97d-47fc822e715mr4862784f8f.8.1785429324205;
        Thu, 30 Jul 2026 09:35:24 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:23 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Date: Thu, 30 Jul 2026 09:34:10 -0700
Message-ID: <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The imx remoteproc driver assumes that the names of the reserved memory
regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
conflicts with the devicetree specification's recommendation, which states
that the names of the devicetree nodes should be generic.

Therefore, instead of relying on the node names, use the names passed via
the "memory-region-names" property if present. Otherwise, keep the old
behavior.

The definition of imx_rproc_rmem_to_resource() is added to a common place
as imx_dsp_rproc.c can also use it given that it suffers from the same
aforementioned problem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++--
 drivers/remoteproc/imx_rproc.h | 21 +++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 745ce52cd822..ce9bdfc1fa98 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -643,7 +643,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -818,11 +818,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names")) {
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
+	} else {
+		if (nph != of_property_count_strings(np, "memory-region-names")) {
+			dev_err(dev, "invalid reserved memory name count\n");
+			return -EINVAL;
+		}
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a10..3632bc375c71 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -7,6 +7,8 @@
 #ifndef _IMX_RPROC_H
 #define _IMX_RPROC_H
 
+#include <linux/of_reserved_mem.h>
+
 /* address translation table */
 struct imx_rproc_att {
 	u32 da;	/* device address (From Cortex M4 view)*/
@@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
 	u32				reset_vector_mask;
 };
 
+static inline int imx_rproc_rmem_to_resource(struct device_node *np,
+					     int index,
+					     struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 #endif /* _IMX_RPROC_H */
-- 
2.53.0

