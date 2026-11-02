Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608287;
	b=mU1Jf6bZ5Yo+csDI5XM/lEAQU1m1bbaohENVpqY7E398kAt1VFdN8vd50sjgRPXtD9Ln
	 0l2LViD5rjWmQOyWoUZg98geGQtwdlJXrJn4ntBfFVXIdlHkOkyVyX7S8r001fGOZ39ge
	 Ot5Mez8k2F6vOV66pYVY6Y0opZ2Dsg2Y8Y/ZomIj64Xv5jA7Cl9Uyjhim//Hh4kQcKx1q
	 q7pVOrGMhbZP2DL4W4PC+/ldBxss04N6TAnFzw3GlyTTXPl/E3NJEiWuVophsbtTyQk++
	 lm+gsS23pf4lz9oAlWOeiKR6DwymjGBrCCLBvB29ayKuCyQkZmE4eY2H7PftDmDdE0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608287;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uNk7UoVUCyaNPvkUt39ka4U3PEtGKbZzHSnhMCo9iP0=;
	b=xU2xt8zVLabeayHnNIXC/Vbn5xrSTp2GT3AVdEHXMu1NUJP2WaOZmtbJGTsOo24vSkuQ
	 gp7wd2GqzkCZLc6vjyueX4NMONdecErEggpJ9xwoSJ879TRehcU1PBpLfzDFj32DpW4qa
	 R+AmuznEC2cwowdvOzfXaL63GfQI3lczuuN732XREP/QXTGmKJTFiof3Zr0d0aArUENb3
	 YD1Jv0/WbRzFRtaYKMHnJTM+HTZ1bZKZuSrAbchRG1cV7C/J94IHrBR+GW/oJluSt+Mhl
	 vNd7iO2MK3BfzCDoeOptjOs553zvp0MNXR+cJiDszqYbDWCExgctDQ+4iB/gFy1iI5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuNTRnhH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSFDDtVZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2B3606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2B3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuNTRnhH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSFDDtVZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vU102192525
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 08:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNk7UoVUCyaNPvkUt39ka4U3PEtGKbZzHSnhMCo9iP0=; b=BuNTRnhHCPpJt44k
	cp9W6DTyT+uE2Udvr6puPtOgVvkoupoQ35hDyGF4qK8l3CNm0gS9gBpJeCNd1C9K
	rYzSewasozAkQkcCVyJGaf5edwVr/QCqvSKmlqI10jg254oKzpYQIWS5KdwH1qrs
	R0WGCTwKGa/mO1VSQn4XKaApzDvazbiBrSKyTCzv3WaryibN8hLWSr4Zl05LVbWB
	pVlMZeQgirHbrRz4KdJXptq2he/B39pa+jUwPDeUBnLo/TkrYV1dBSZsaRVZ1Nve
	+FHKoo7XCeErpWjPYea6zoYvWeYEphKTC4Dcd7ThggIx43IdtWGaahJWadlZUHkh
	R1xhKQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93enspw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:31:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so1964151b3a.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 00:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608285; x=1794213085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNk7UoVUCyaNPvkUt39ka4U3PEtGKbZzHSnhMCo9iP0=;
        b=JSFDDtVZpTUqVySV993gjeSDjP1z5rMJFqgVRBe+0wVfXxO8pG27G3rThfPPnypVbv
         oq+g721m5JyMTPmNmbFfv2hPbT/xcWvM5II+bFh6Mwa7+N6nnGL1SfSmhR6WJilHOCny
         o6DamF1Nu4V61J2KY80cVGhklZEIohSFVhEbJyYZzcBbWXx5VajC72bvvcSzqAn1+NtX
         ZRfvwitInKfIYkkEY3ObrjTa+7cIfphSxov9EXX8cdDHOvlS8G2+uF/Yvx0vMWh95cvX
         0+wwug6qsCWMTBaigwy7oLGA2nNEl0y92QoRch8DFWKc7D295rylvGAIJXmsEbEULuTF
         q3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608285; x=1794213085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNk7UoVUCyaNPvkUt39ka4U3PEtGKbZzHSnhMCo9iP0=;
        b=Rh1+SwxFIXX8iGX6z9jPnsoFENtQkkCoT3RnnkCSHTM1w0hT/kuCdnojgVI9Pm0jqc
         IoYYLzlIXqSr42V5MzN7DObHDnAg/VTMVhJiVR9lvdS1yU3aIl0IEbLmpHeDo2gtEgHs
         fv3fBzxapuIUaZDzB896QRewzKZv86GKI0DD/AMP999mJtQpndapeXWwe02steYk0b51
         uggDve/AwNWfgKYT0oumdMXgR8svIIQ+uRpo+MehRUxBsI7MX9cpIuLXNXgZhg3NneUF
         akr7Z1ZzHpqujWvdAcnoBtpTQjJ3fP/qYyTGk2a9cpN4ydqXG8L+KJnlrX3UMllmpdYf
         aozA==
X-Forwarded-Encrypted: i=1; AKwUvBxF2vhqcmJFDGHEyzPGsq0wu5rj4R7enxQ9GrLs4k1RdWDY3zok+r+jiy9WxLOehpMl5wXFm4eUfwpi@vger.kernel.org
X-Gm-Message-State: APuU4Z9KDHriOszKS4nm4FQQ411QUc7YuJTx4OFxvCfipOAZFlIH13H+
	wtCgI5/DxTNkQKrpBHicvljIWIP0qZ0MetqHjNmXPfKxOI2BiJT/j8eycGh+sgsssEbRr6IlCG7
	ygcU3bTVjERHYvlnd5zEjcRGAkcnKQ6rOAlpFBx3XBhW9UYpY+osfIGl+aZWPSJwj
X-Gm-Gg: AYBFou3OfCz2DCsu9tZ2Fm7DCH78bKp/7Wbszo655gfD8CCxqZswGqnRvvpfRHePj7q
	xPX4wEQqTAUtHKi2KWaBKFJKpO7eV1GgfdPImSgeUyhwwVg/K4RgDMxe1QIKPbvG0q6d35+vlDB
	DDxM2qlIfUj3VV+tFlS268+cdQB2hznPNfQY8YQxxzGcoAeYBGPEt5GaYx3hHS1BJrDutP2veag
	xXUioxWCUkC9qNSziwN9TwsKwi0NKofTGFNWkLlkTfa7SmYLIXaaQlhzf4zQbTqFCla1rv9WyZR
	yPUYvU2mwmpN3asV86xhn5RoSp8G4ewNuIsbfQKVUT0YXUmFLvDi2UBMBlUS0WG0h1YdOAc3YUP
	vHwhHadBwKu09cqmgAlfsXd3jcENq44XhA236yfbXhLqBMkjhXr1lzmzUz0h7m0YCd+iTWd5/6z
	lacoZj5A==
X-Received: by 2002:a05:6a00:ab05:b0:893:12e5:c07c with SMTP id d2e1a72fcca58-8a9be965277mr7867702b3a.27.1793608284978;
        Mon, 02 Nov 2026 00:31:24 -0800 (PST)
X-Received: by 2002:a05:6a00:ab05:b0:893:12e5:c07c with SMTP id d2e1a72fcca58-8a9be965277mr7867678b3a.27.1793608284451;
        Mon, 02 Nov 2026 00:31:24 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1674680b3a.27.2026.11.02.00.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:31:23 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:01:02 +0530
Subject: [PATCH v7 1/3] misc: fastrpc: iterate CB nodes manually instead of
 of_platform_populate
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
Message-Id: <20261102-dup-sessions-v7-1-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793608273; l=7646;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=1ZCjKkuEklA9dqtgrXzcHhTQLVOklfUh4hr7qs27ZYI=;
 b=Avy1J3E49Dc36+bGc1BPg1IiqDzb4s/n4DFoCSABSKVHfa86jc0nGXFdVAD7YvROrQ+mFq6oK
 35f+phSWQktD8JK2sYAVz7jmgm2WMkPMu5K3UMvQ1qS2BFZvB+vcOVU
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX30105yjHNp1C
 WSu1Qhz06bLeNC+TzdAOOkETeuBOOLPKCpUWj7a2NIp6RZKi39B5wwLaQv9gy/DPki3dHM+Plgn
 A98Edyz/XVDOde0pCK7W2Xfvg26LgR705h87KDviZHPkqmsPomsfPB72MsEYdzKbx/+ftX7aUbP
 WrzrWyjXYgLKK1uMlvxK0qDZDP2x5SuMu2ClWDwpxwEhyaugIKr53pX6DjH1hY7eipYJh0syhxV
 Qw+F0QN+iVeEEwhYv0V4zWLxhoQKfyx8hczmK4n9c1dAgSjIfAeG2TVp7KVW7IM6VVtkDdAdPK9
 sZ3w+FwqnOHuRM3JONEdaHutGx5lrmK2VkepIRjVdE7XqNDzl3h7u8bErR9znjsyl10prHE7/nn
 9f7NUpQ/Z1gSMY37aCR6DbJAeAQiIXED55zvYwVXuTaREs+Musc5QqJQIIOm0eYz/iTND3B9qH6
 qbmp6KfCc1Ik7AsSXxQ==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae84a5d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uxAdCuZb9_mwF1n_fQcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: EErKVV4cg2IQkzPHQH_nGIrlcby43yNQ
X-Proofpoint-GUID: EErKVV4cg2IQkzPHQH_nGIrlcby43yNQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX+DAdjKdkczy/
 ohI9i99T9yu7vWSdqm1eU5YHxixQ963kLR7UKUSqFcwtzRRamxNVeAa8OfwfC7A+GLA6n4ExHFV
 CQN2EUJ3Lg+MqPiNXr3BYtcEOSOxlCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020033

of_platform_populate() only guarantees that child devices are registered,
not that their probes have completed before it returns. This creates a
window where fastrpc_cb_init() may not have run for all context bank
nodes, leaving the channel context partially initialised.

Introduce fastrpc_cb_devices_create() to iterate over child DT nodes
directly and call fastrpc_cb_init() synchronously for each
qcom,fastrpc-compute-cb node. This ensures all context banks are fully
initialised before fastrpc_rpmsg_probe() returns.

Since no driver binds to the CB devices any more, the driver core no
longer runs dma_configure() for them. Call of_dma_configure() for each
CB so that dma-coherent, dma-ranges and the IOMMU group are set up
before the session is used. If a CB cannot be configured (or has
"iommus" but no IOMMU group), log it, destroy that CB device and carry
on with the remaining ones, rather than leaving a half-configured
device behind for a later IOMMU registration to trip over, or failing
the whole channel probe. -EPROBE_DEFER still fails the probe so that it
is retried once the SMMU is available.

Introduce fastrpc_cb_devices_destroy() as the symmetric counterpart.
Before destroying the CB platform devices, invalidate all sessions under
the channel lock so that any fastrpc_user still holding a reference to
the channel context cannot acquire a new session backed by a destroyed
device.

Since fastrpc_cb_driver is no longer needed as an independent platform
driver, remove it along with its match table and remove callback. Use
module_rpmsg_driver() now that only a single driver registration remains.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 120 +++++++++++++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 54 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af18ff1992ee..7441e9b8940d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/of_platform.h>
@@ -2333,7 +2334,7 @@ static const struct file_operations fastrpc_fops = {
 	.compat_ioctl = fastrpc_device_ioctl,
 };
 
-static int fastrpc_cb_probe(struct platform_device *pdev)
+static int fastrpc_cb_init(struct platform_device *pdev)
 {
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
@@ -2355,7 +2356,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		spin_unlock_irqrestore(&cctx->lock, flags);
-		dev_err(&pdev->dev, "too many sessions\n");
+		dev_err(dev, "too many sessions\n");
 		return -ENOSPC;
 	}
 	dma_bits = cctx->soc_data->dma_addr_bits_default;
@@ -2363,7 +2364,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
-	dev_set_drvdata(dev, sess);
 	sess->sid = sid;
 
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
@@ -2389,37 +2389,75 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void fastrpc_cb_remove(struct platform_device *pdev)
+static void fastrpc_cb_devices_destroy(struct rpmsg_device *rpdev)
 {
-	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
-	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
+	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
+	struct device *rdev = &rpdev->dev;
 	unsigned long flags;
 	int i;
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
-		if (cctx->session[i].sid == sess->sid) {
-			cctx->session[i].valid = false;
-			cctx->sesscount--;
-		}
-	}
+	for (i = 0; i < cctx->sesscount; i++)
+		cctx->session[i].valid = false;
 	spin_unlock_irqrestore(&cctx->lock, flags);
+
+	device_for_each_child_reverse(rdev, NULL, of_platform_device_destroy);
 }
 
-static const struct of_device_id fastrpc_match_table[] = {
-	{ .compatible = "qcom,fastrpc-compute-cb" },
-	{ }
-};
+static int fastrpc_cb_devices_create(struct rpmsg_device *rpdev)
+{
+	struct device *rdev = &rpdev->dev;
+	struct platform_device *pdev;
+	struct device_node *np;
+	int err;
 
-static struct platform_driver fastrpc_cb_driver = {
-	.probe = fastrpc_cb_probe,
-	.remove = fastrpc_cb_remove,
-	.driver = {
-		.name = "qcom,fastrpc-cb",
-		.of_match_table = fastrpc_match_table,
-		.suppress_bind_attrs = true,
-	},
-};
+	for_each_available_child_of_node(rdev->of_node, np) {
+		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb"))
+			continue;
+
+		pdev = of_platform_device_create(np, NULL, rdev);
+		if (!pdev) {
+			of_node_put(np);
+			fastrpc_cb_devices_destroy(rpdev);
+			return -ENODEV;
+		}
+
+		/*
+		 * No driver binds to the CB devices, so the driver core never
+		 * runs dma_configure for them. Do it here so that dma-coherent,
+		 * dma-ranges and the IOMMU link are set up before the session
+		 * is used. A CB whose IOMMU setup failed is destroyed now,
+		 * instead of being left for the next IOMMU registration to
+		 * retry (and fail on), but does not fail the whole channel:
+		 * failing the probe makes the DSP reopen the channel in a loop.
+		 */
+		err = of_dma_configure(&pdev->dev, np, true);
+		if (!err && of_property_present(np, "iommus") &&
+		    !device_iommu_mapped(&pdev->dev))
+			err = -ENODEV;
+		if (err) {
+			if (err == -EPROBE_DEFER) {
+				of_node_put(np);
+				fastrpc_cb_devices_destroy(rpdev);
+				return err;
+			}
+
+			dev_err(rdev, "skipping %pOF: failed to configure DMA/IOMMU: %d\n",
+				np, err);
+			of_platform_device_destroy(&pdev->dev, NULL);
+			continue;
+		}
+
+		err = fastrpc_cb_init(pdev);
+		if (err) {
+			of_node_put(np);
+			fastrpc_cb_devices_destroy(rpdev);
+			return err;
+		}
+	}
+
+	return 0;
+}
 
 static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
 				   bool is_secured, const char *domain)
@@ -2639,7 +2677,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->rpdev = rpdev;
 	dev_set_drvdata(&rpdev->dev, data);
 
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	err = fastrpc_cb_devices_create(rpdev);
 	if (err)
 		goto err_deregister_fdev;
 
@@ -2711,7 +2749,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
 	}
 
-	of_platform_depopulate(&rpdev->dev);
+	fastrpc_cb_devices_destroy(rpdev);
 
 	fastrpc_channel_ctx_put(cctx);
 }
@@ -2798,33 +2836,7 @@ static struct rpmsg_driver fastrpc_driver = {
 	},
 };
 
-static int fastrpc_init(void)
-{
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
-}
-module_init(fastrpc_init);
-
-static void fastrpc_exit(void)
-{
-	platform_driver_unregister(&fastrpc_cb_driver);
-	unregister_rpmsg_driver(&fastrpc_driver);
-}
-module_exit(fastrpc_exit);
+module_rpmsg_driver(fastrpc_driver);
 
 MODULE_DESCRIPTION("Qualcomm FastRPC");
 MODULE_LICENSE("GPL v2");

-- 
2.34.1

