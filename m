Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A57407CCC
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568569; cv=none; b=KSWBY2VnFrSuI3hWObv0K77jbZNxzi9nOnzx2YdmajUi8dI/Oq8Fes/PewfkfiebfYXFxRDWEjWK6tifOe6veLqcdRZNNRKTzxBSPcT3oFYvszQzV3ZFBDcnrkg/5cxVv4N4YZkNkuMzv/O9uZyHlh/aVgR7IAuaDc8rX3F92wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568569; c=relaxed/simple;
	bh=hmRfD5hv2hilDC52QM6CRPaznt6Vo0mIHRScEu9qbZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3ZebflctcSHfMUhtnov7gv8stMhLXh8sHRuBlMrarsix0uEfFKZes6n07omi1Bnuggux8h5gwr1/otNta9ThmE7wFREUOiImNd7IEzG7Ir1dU+wwph2nMWEHdCZ0Iv2pMcfHw4hwLE8wPpNc97r4nWpwxpU7EHlL35awL2mUxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jO5SiWJS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDuSJ9m1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jO5SiWJS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDuSJ9m1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99BJj2448713
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CypDPS5i+7FSZgzBsU0HBDl5Ax6l8lVjcrNheaMq+rw=; b=jO5SiWJSeSxfrPxw
	5K31x3BpHJAEaSvodqZtxqIqjb5MFtqtuW7VX9cCnGNnmKh22oJtncaZ84nLbA7P
	U8vViu1GyyjvdmgWCoSvZuzIWLX6XrBixvBXJQTU2eRsYlzaj6s4w/+K5KwoYlFn
	crYS83URoRdUpzViHHgG83ite8U7HYDwAvrqDRG1emNf2mfD+YV9C3tMhe3uWuo7
	vPnbzjZAe2seXqa1OGKpAXLttcy9PyZ79HlfqJaBrYu9W2xVgkvX8C+bLuM46sVZ
	isdJlUA2q3nRigMfr0NLS/lJ1/vnTfsnJXsGiaWyTDvY3hEC7J5Qaq83SDso+F57
	SZWt7A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0ps6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:49:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee8d434b8so2875036a12.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787568566; x=1788173366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CypDPS5i+7FSZgzBsU0HBDl5Ax6l8lVjcrNheaMq+rw=;
        b=dDuSJ9m1l3lfX4fRFA7pHGHZh/HXf+FTGRPYa4lxanqlffVvcOojILndh0DATizWsM
         IUOqRdoTOWqVAOZQPYaRzfHX6dBRYBlPh7RN2eKCl0+rqw2Nwt6tSzCYje2hTLGPgrtg
         0B+7FHMEVnOLXiLGDIHKMQEvzHzy1SlvO844UCfIwY8ED0UlSczV4hg8fkxkPw88Fnq2
         XmsJMchi4fMgVi+cwPx5AMwxsv0M29EY66XVEuynb2ls01Ld6k0fSejr8JxFfHbC8C5i
         6RfnSPDZ4qp/RdDitSXAMhfhLwiEUt6JqSHF3DzwIz86Xftupym1El58BBpisqBdoMUS
         DNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787568566; x=1788173366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CypDPS5i+7FSZgzBsU0HBDl5Ax6l8lVjcrNheaMq+rw=;
        b=KZMlUoUE3ZsFqs6tj9eMg1BDy/MAmJCJdgBsunzMOScWN8YKlN6lt5ZGKR47iQny8i
         tfeHbQOcFF7/j01mvZ99E97av5OrhD7/HSoO3o67Rgr5YFycFbAV7qsW9A6ZRvrCl2ZU
         /8DB4yiGaRtsJM20LUfZH2FrXyvrGUq8IQxprKKyZBLibcpThYbJLmSte+6TAkjltcHf
         GdnBzTeWEYsMUnjqCwOOnTkUPGXq+SVy3d9FTAASPmvK5flXKMLFigK4H7nm3cDq/lit
         AY55+ztoP6EMlBUtJopfQSuvG9Swl80XLZEEGHzOv/NRrcF8Aenl05S5rXYyFI+yulkp
         o5tw==
X-Forwarded-Encrypted: i=1; AHgh+RpjVcDJhsoxE+L6e8QgKPtBgEArrjVUi6Z9WztWQa1n17OrnDvfIaI9aocJsp69gr/HFzLkgn2eziAC@vger.kernel.org
X-Gm-Message-State: AFuF++mLJlxryYEfUcnoWl/Ko1HLMtXH67d0aiGeNEUswvfVTB8IfINB
	NrZjsoGMaPmcaw1TGhN296D1stcn+cJHMES09yepsOMbF4E5AoiA0dVlfSaNY1JrBw6Tkca3hhJ
	G4r9y0eGDBV7g4pgvrdxh2VuTaeCVqVaaJuyeHji5fNqdjmyiiQpbTxzeQrIlrdzy
X-Gm-Gg: AR+sD127opjxl43zqQD9pck9p3j0m80nEomk8Dtq7RmfE5genfw5wTmzqiCiB3MHZ8h
	M6fXr8m5CZv2Z7/jWvXtvB8SEesbYx9KqZ4TgkvIKRBjf7Cm0N5R3J24RWD56jRStUVTAwyFpWd
	v0OOdVhpjrWApK50r7Q9djHoB2Y9K9pGsa7Ppz+RN9310/E8+mU5FkiNkCuEd0b+seDsVqfOrk8
	WAs1T+PFHULpCiJoRk4nt8xpfejk31VH8/d7TcBYzNWWuFBV3UardN3X5xFI/b2VMBEoRB4qIKe
	GJvKOpPgSXXFeopqM2PyPGKgdq0UXkb1zNcsThZDRH7e7d1G3aiKHkSkMHCjm71wKNdKTSl8f87
	W0tXLkVvqBJ9wYLkNwxi7eylJkkazV2oeow==
X-Received: by 2002:a17:90b:3e8d:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-395c4fa444bmr15906916a91.5.1787568565651;
        Mon, 24 Aug 2026 03:49:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8d:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-395c4fa444bmr15906880a91.5.1787568565184;
        Mon, 24 Aug 2026 03:49:25 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c91ce453sm4125829a91.4.2026.08.24.03.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:49:24 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:19:05 +0530
Subject: [PATCH v3 1/3] misc: fastrpc: iterate CB nodes manually instead of
 of_platform_populate
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-dup-sessions-v3-1-4b019def4e0b@oss.qualcomm.com>
References: <20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com>
In-Reply-To: <20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787568554; l=5195;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=hmRfD5hv2hilDC52QM6CRPaznt6Vo0mIHRScEu9qbZ0=;
 b=WiLB15isE1CXfEtAmICuz+9YH7t6oI0RHaX/M/hHzzWWE+okxkiNABiQCDn8U8ROqDR4phd4k
 3nnCU8IPFTfBEDIFeXqV4KR0mCGcV4G22actsREthxJEAkBiyB2ueca
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfX8l8AmGWnXYvm
 dXXSWikVpQuYD2hTp5gYrVttW2ktxyP+OoMNurINqjo3VjFnXXjywBlly+z2DXdR5JUovUJq3GG
 3t7BDHkwbbCcS6ynMgqx0Ou6gu2r+bNIR+zOvrDtulCOZKsEk0+T8d2FHzOOvTI9jynpmhf3JNq
 XqneQljHhuO6Ceux/vCM4yza0FGxXuZdqarXLbas/5FSnaRi7kS7DsSFxlwAo7cWdIp4YCVzsyq
 NZrFc9/tzblM3UD3IZal7Q1vQ+jL2S5f7x5Y5po01GoGAvUKaIAVWVCZ667mVqSbOGb84mdmNfW
 bxyRQzrEG6qYMHUVNo82raTpoEivX0BbkH8z035d6afeCxO2J951PZETXqx8EC20MZQv5SlyHkW
 f7Y1nO/sDE0AOKobBP9yws+axX2BGXVHnW04EhWUErkfv5yOuJcdJoBKwOL4QZ6JKQtpQhsAAv6
 +21u6Ed38t0C9puxnqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfX7vo4tcqqVdq4
 M69LgOxOGowHrYYnMy0XGmZBtTVM+cV8rqOKK1C6/6nAR4owrvzUwkBkqMUbyTsOL/NRwnuJnu0
 mnJ+L7zp5eqsPQWzdHV3SKfyQgLmKmI=
X-Proofpoint-GUID: sYybPFo1VsBvsVRtzyF_Iwk3aZh58bdr
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c21b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0tPlnvf1ouYV9MwHMgkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: sYybPFo1VsBvsVRtzyF_Iwk3aZh58bdr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240090

of_platform_populate() only guarantees that child devices are registered,
not that their probes have completed before it returns. This creates a
window where fastrpc_cb_init() may not have run for all context bank
nodes, leaving the channel context partially initialised.

Iterate over the child device tree nodes directly, initialising each
qcom,fastrpc-compute-cb device synchronously. This ensures all context
banks are fully initialised before fastrpc_rpmsg_probe() returns. Since
fastrpc_cb_driver is no longer needed as an independent platform driver,
remove it along with its match table and remove callback. Set
OF_POPULATED_BUS on the rpmsg node so that of_platform_depopulate()
correctly removes the manually created CB devices on teardown.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 82 ++++++++++++++++++--------------------------------
 1 file changed, 29 insertions(+), 53 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..fe127bb0c115 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2190,7 +2190,7 @@ static const struct file_operations fastrpc_fops = {
 	.compat_ioctl = fastrpc_device_ioctl,
 };
 
-static int fastrpc_cb_probe(struct platform_device *pdev)
+static int fastrpc_cb_init(struct platform_device *pdev)
 {
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
@@ -2208,7 +2208,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
-		dev_err(&pdev->dev, "too many sessions\n");
+		dev_err(dev, "too many sessions\n");
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		return -ENOSPC;
 	}
@@ -2245,37 +2245,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void fastrpc_cb_remove(struct platform_device *pdev)
-{
-	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
-	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
-	unsigned long flags;
-	int i;
-
-	spin_lock_irqsave(&cctx->lock, flags);
-	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
-		if (cctx->session[i].sid == sess->sid) {
-			cctx->session[i].valid = false;
-			cctx->sesscount--;
-		}
-	}
-	spin_unlock_irqrestore(&cctx->lock, flags);
-}
-
-static const struct of_device_id fastrpc_match_table[] = {
-	{ .compatible = "qcom,fastrpc-compute-cb", },
-	{}
-};
-
-static struct platform_driver fastrpc_cb_driver = {
-	.probe = fastrpc_cb_probe,
-	.remove = fastrpc_cb_remove,
-	.driver = {
-		.name = "qcom,fastrpc-cb",
-		.of_match_table = fastrpc_match_table,
-		.suppress_bind_attrs = true,
-	},
-};
 
 static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
 				   bool is_secured, const char *domain)
@@ -2441,12 +2410,29 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->domain_id = domain_id;
 	data->rpdev = rpdev;
 
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
-	if (err)
-		goto err_deregister_fdev;
+	of_node_set_flag(rdev->of_node, OF_POPULATED_BUS);
+
+	for_each_available_child_of_node_scoped(rdev->of_node, np) {
+		struct platform_device *pdev;
+
+		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb"))
+			continue;
+
+		pdev = of_platform_device_create(np, NULL, rdev);
+		if (!pdev) {
+			err = -EINVAL;
+			goto err_depopulate;
+		}
+
+		err = fastrpc_cb_init(pdev);
+		if (err)
+			goto err_depopulate;
+	}
 
 	return 0;
 
+err_depopulate:
+	of_platform_depopulate(rdev);
 err_deregister_fdev:
 	if (data->fdevice)
 		misc_deregister(&data->fdevice->miscdev);
@@ -2476,6 +2462,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int i;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2496,6 +2483,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
 
+	spin_lock_irqsave(&cctx->lock, flags);
+	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++)
+		cctx->session[i].valid = false;
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
 	of_platform_depopulate(&rpdev->dev);
 
 	fastrpc_channel_ctx_put(cctx);
@@ -2556,28 +2548,12 @@ static struct rpmsg_driver fastrpc_driver = {
 
 static int fastrpc_init(void)
 {
-	int ret;
-
-	ret = platform_driver_register(&fastrpc_cb_driver);
-	if (ret < 0) {
-		pr_err("fastrpc: failed to register cb driver\n");
-		return ret;
-	}
-
-	ret = register_rpmsg_driver(&fastrpc_driver);
-	if (ret < 0) {
-		pr_err("fastrpc: failed to register rpmsg driver\n");
-		platform_driver_unregister(&fastrpc_cb_driver);
-		return ret;
-	}
-
-	return 0;
+	return register_rpmsg_driver(&fastrpc_driver);
 }
 module_init(fastrpc_init);
 
 static void fastrpc_exit(void)
 {
-	platform_driver_unregister(&fastrpc_cb_driver);
 	unregister_rpmsg_driver(&fastrpc_driver);
 }
 module_exit(fastrpc_exit);

-- 
2.34.1

