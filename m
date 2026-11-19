Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095769;
	b=cxo0jnRYZmwTe5yXdAQuEmPIX/H6dLZErqSCJphtDnoeiX2ltKeOBsmyHW2Pa8lvGshx
	 NklGZ+L+wgS/FGmHtUHNYkRU3c/P94M3jsF1fWKPFzBPNJ3lsCNusq5QICp6KDr1GXvH7
	 9msTY24Wephb/P76VP51WvubUQYvxJdl2DY9VtD6giPcMeKg7unvCNd81s8iNbMuXWRFm
	 482e+G8qvkVAbyuQPxgwn3T2Fv/Z7VW0vZWnyFjwRUzhROkQXkIJH/kbCCKgYnYqb1u+i
	 eeDQq7A6LTWXOBHJtzO9S1IXv2iOqrnzlH945AoPkZPxVT/e4fvW+8Eb+0ZcGgjSrJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095769;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=nZdp0i3Rcd8dUWa9Bt9ZOOH4xL6dQjkpGD8A+LBfsc8=;
	b=c9R632pEi1hPIH+dDyQtlj242A3FvKogriGyhWCgnatkoSnIr3BJboB6vfakWWaY1MBT
	 Jw67VNpe/1uvXd74gRe61IhcDmBCCQcuAm9OsGekzS7WzZV5NA2PT6hXN1qZ2tkdwFkFy
	 nEuUqJunq2ynh7cvDtGAqbUL/MOl00/yQGLg8Wz+9PNwQDFtyXROWPNMwKiDQ3Jvc/kvn
	 cvCS/qled3fUc/1MdoowuRpNOu0etC2EIdrP4JbLGMU+E04W3weATSJiZAej0BcYZwdbe
	 PUoK8VfCDOxXob8N9Vc25cMwFuxStut07PSEG0jNRsYyNyMJJKfzljA+yT1HRr5udew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=gUa+K79J;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5031606A335
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5031606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=gUa+K79J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795095727;
	bh=nZdp0i3Rcd8dUWa9Bt9ZOOH4xL6dQjkpGD8A+LBfsc8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=gUa+K79JoFLk+zHZD/od3q5BDN6fgMRGbO0ap4n0/c+4fYpuKgyqWN7qTVPHlsUvK
	 RaNGw2LTJUInmItLsGUGbuK5WG0ojWv4F9axb9YtkpQfSAWt6WBliiiDuc/O271PTw
	 +0+pucoJftCFksuQbC++x3qHdqqH0gcUFw/7Q8pM=
X-QQ-mid: zesmtpgz7t1795095720tcc6bfe3e
X-QQ-Originating-IP: oBMZ7/Jsgw81Tm2aj9xw/e7pkYmdSSzjUv4Itvl39qM=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 21:41:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3828560295831810714
EX-QQ-RecipientCnt: 14
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Thu, 19 Nov 2026 21:41:52 +0800
Subject: [PATCH v6 3/5] usb: chipidea: usb2: drop the ci_hdrc_usb2_priv
 wrapper struct
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-spacemit-k1-usb2-v6-3-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795095710; l=2809;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=ghDUbM3sfq+Qbsm1aZIr9gI6ddjgLgmKB6Bs3nXeJJY=;
 b=/p9EUu2W5sU4Gq/JNAGtaVTBG0xB4UJ5XKWFK4NrJoFvb5hUCtQ4uwrI/ARX6/ssfwYo5sV+l
 rIenUpy+em8DhHvZeOkotptEznqs+FOx7g9b4fm04iHiI8vLyBbKhco
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Ne8UdcGpoErH4icDzkpidW+w8CkD5MPhVMnbS6Axhmrhs+fx7RZYqgZK
	GBeMoqxTchrDbeZs/ZxNSZsHAby8HLD9kTBkudPS16ACp4SqSTBsFC251kE09UFdpHljcJN
	OaVFwMnQiQPoLdxbKIQeIr1mdRVJGoS85hvqhp0dMjaPSo88czoTt74FFfsAQgvIWanZlYE
	L71lYfAMUKnWDgUl+uHo7NHNjGXB1C0zZMrqgJlBUFE5zhy11uxvb2IF+KNRJN1VRnDOpwU
	N8tQPbkUMyjghuw8f63GxmG5AB/svtXPQNUDqzxO3MjdotAIs0zd4Q/OlUxyCeOCMFdQJwy
	sqWzM/35ExtzWUnwlGnB2kQ9qW55Lq1u0kwtayg2JbjTi9KnR/quUPh5hvxXYraUKMBD8d3
	GWHfI+NPce3xIsByrmuXrJmSPlDSOxUqmzXVO3HinBcZi7JZ9pBtM67Pjdyv1sQFo0Tvlg5
	UYbpK3z9veitK3fnCzWOlMT9WaABx7d2gBjMkwZvu//z7/GarN0bU4kKYn2Nr244HlO7s/d
	8+LXLmqnsr2p5cQ2frt3jlNT2A0DX7FFsZZHkT/lEwdGoXdHRT46B/7x3KXZWOHo8dtCDXj
	sWyqaViDSHUCw6ZluK7IEL7wUyFwhdHiR/JReo+SFibEtQb4cyNXHKikgfYH52JCrgrigd0
	GL8C6ouHNyHAoWHGvybEiur26UjVgyphCAbNH1c0odp+bdVFqcn9VLIM/hUtq3NPLt772N3
	I53MBJ48hS5Af1q5GCvxYYXpgvVx/Kpg5J/cUondGtI0xxXYQPMPmIv+J/ZEptwrPQgWnwJ
	Uk/Yt6cyd3GdC50gMgWAwTItyMM+AB0JZP2RKxAiuNqBUWzgvUYctQHaoY8A22/z65nVYDU
	arUMLMMNr//2e2rqztyPu531m+Dhdpc7QhdBaQFybNluqRm/pJw1r7O2OvVJO5WUOl0Fle0
	8mAU3zWGyo5VnlSRQSID53w+j/Hal4XyPFXo0dRBZpgGDhSmMaWthfe41JOWhXFcHzF7c6f
	ssbl2JPJzpDaJ4tm5+wqdyg89F/u1Uwa2wqgp06eQs8k42rnxMjOCucGTKuk+mWJZIl2QF0
	E9IhRSchLClw1+fk/elnK/YW+ZbBCtv4PFQgePw1zue
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

With the clock no longer stored in ci_hdrc_usb2_priv, the structure only
wraps the ci_hdrc platform device pointer. Store that pointer directly in
the driver data and drop the wrapper structure.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 0032f9a9888e..264546247a08 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -18,10 +18,6 @@
 
 #include "ci.h"
 
-struct ci_hdrc_usb2_priv {
-	struct platform_device	*ci_pdev;
-};
-
 static const struct ci_hdrc_platform_data ci_default_pdata = {
 	.capoffset	= DEF_CAPOFFSET,
 	.flags		= CI_HDRC_DISABLE_STREAMING,
@@ -48,7 +44,7 @@ MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
 static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct ci_hdrc_usb2_priv *priv;
+	struct platform_device *ci_pdev;
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
 	struct clk *clk;
@@ -66,10 +62,6 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		/* struct copy */
 		*ci_pdata = *data;
 
-	priv = devm_kzalloc_obj(dev, *priv);
-	if (!priv)
-		return -ENOMEM;
-
 	clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk),
@@ -77,10 +69,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 
 	ci_pdata->name = dev_name(dev);
 
-	priv->ci_pdev = ci_hdrc_add_device(dev, pdev->resource,
-					   pdev->num_resources, ci_pdata);
-	if (IS_ERR(priv->ci_pdev)) {
-		ret = PTR_ERR(priv->ci_pdev);
+	ci_pdev = ci_hdrc_add_device(dev, pdev->resource,
+				     pdev->num_resources, ci_pdata);
+	if (IS_ERR(ci_pdev)) {
+		ret = PTR_ERR(ci_pdev);
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev,
 				"failed to register ci_hdrc platform device: %d\n",
@@ -88,7 +80,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, priv);
+	platform_set_drvdata(pdev, ci_pdev);
 
 	pm_runtime_no_callbacks(dev);
 	pm_runtime_enable(dev);
@@ -98,10 +90,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 
 static void ci_hdrc_usb2_remove(struct platform_device *pdev)
 {
-	struct ci_hdrc_usb2_priv *priv = platform_get_drvdata(pdev);
+	struct platform_device *ci_pdev = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
-	ci_hdrc_remove_device(priv->ci_pdev);
+	ci_hdrc_remove_device(ci_pdev);
 }
 
 static struct platform_driver ci_hdrc_usb2_driver = {

-- 
2.34.1

