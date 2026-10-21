Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574768;
	b=FNnYTAc2f7l1QoX4wjkgdqODksR0Ux0IyKbFJKBi8KzSQPG7//y7V+YTw5dnfNU/GYMc
	 VY4uG9H5BdO8zeXZDInhxXHriLx3ypFnGtdaxiRZK70FTilrk5pUvJabbm5BSupy0S4wH
	 yWRIqwghTVXWj1Cn3gyCm0+s03qCQqll6492stzxUuxvQfjVZN+Znr98MKOtva0G0CLAk
	 w8TKyhZj1IY7oZJPIn/Fg6jdjvBA4auqJb88RwgVCcOx3HiEve+ZUNS4+je92M7UzBnB2
	 C7OyhyWycx7docPkfTOfvFGiywmNZMP55miPVrf2AzWunxxWIrhfetyS/uioGTVKmCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2iddebWXn7PUCxROMEP3SYghJdqyKc/W0mQtZfkMMkQ=;
	b=1sqJElLgRy7vu5P/AgxfTy2Tlo5d4sbmYJM0sl/yk05aNT03VEqV/6duQhDKuIrGhaET
	 dWLNldouZyIC3ZlByRjwozaRkcHEjkMdVSKMvD64FeJkpcKli3HafNVlfk5aC/2rgUDey
	 vo/xbxwR39ebOBHEdfxDbUtgAAsKizTfLsAJPJqCkAez1WCbFWdVvAzDjsOG2v9v3rSvb
	 giZEXKmxz30+NUKleptXknOqZ07fU5yf12f06mpIWywjNl6797wmbcWNrAYWmhfMIhXX6
	 YWF0IEUqc3+VTV/XmwJsVjPS6UEfAyuJet2yGOIf8oCt8FvpCqx4/kpqAF/9KSihJiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E1KR00/r";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iHYnNkOG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1865606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1865606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E1KR00/r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iHYnNkOG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8VR6f2795041
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iddebWXn7PUCxROMEP3SYghJdqyKc/W0mQtZfkMMkQ=; b=E1KR00/rz6olJNK/
	RMOWFBIdpIq8s7x5gp3xdhyHzwD6De9nkB4o814y9VC9SdvMv/zRA4QLvOd7p5ci
	g5pRVZU8n4EfLtq9Upk9Yue6fAn8MkKfPveVQgtI9ohnJmmS+58QtOC0fFCFb+N7
	4LClWIJRcrsvOACaAoCd65AdDg8cQj2ErbsSlyi1gKWi4EaRGB6y2D/ZqFzza1pw
	Nqnmefy0DHwOPLjwAkDba6BX+3Tuaq6lNERcLD9+u3citYoWMSRZLkkh1moQ9kdy
	OM1bq6WitJc4tA3uhqHSiSexlc0kHryfXohoZJm7G/NrVJh3EnxP5e1r5XIGofUF
	I3kfPA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78c34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so2181093eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574766; x=1793179566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2iddebWXn7PUCxROMEP3SYghJdqyKc/W0mQtZfkMMkQ=;
        b=iHYnNkOGmvesr5OSA1AQLlFqcCEcGNqrWg61yoYE7NMQsUiyCBRRhdFM4OtrAhQVc5
         DyKPcdzRJhISgxUEu+pXKHA54Vn2LVGQOyqy8GIYX+coU/9R/OWgV7GdJIvuFMwbkVVu
         BnBAlz3OCC5j25iUEX60AgusKVySq5N844IOkF1V2SltZz6OY1Kha+pc1spiQ/kSusT2
         3GWTuOZvPsm605lzaHb3FPCj1SDm6qWq7K/bSrA/WlQo61gvK+0oeZ5GTsA0ws9vi6Q+
         dWHJ6NVGe9cZj9yYz2Rvg6sh0HaLoxM7QgieAXMq0gwT50pGDSmrJt6hqAoIfJJehh5P
         kppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574766; x=1793179566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iddebWXn7PUCxROMEP3SYghJdqyKc/W0mQtZfkMMkQ=;
        b=hrJafvZ3q+iXFUIQA+6uG6BOZdK5A+7ygVBpT8PHiXboKJ668zZRZH+KBmwJS9p6n9
         o4r3PEvNZBeLPtxC9GRLDnZUFziyonNh3kUDYMkZmCoY4Pv7pjxbzRlqOE9BbHibLrYB
         A29GViR0G+N1uENz2eakURIuoA9Ypo+YK0doOVjEL3U8e/Ni+Mf38BlsKQpKNSALJXqj
         qjJ7NKkQpEmOoVIEFQgCeoYjd52JZrZYWQ6BK+2BMnKCdY1RP1n6K21b6b7wKS26JzqC
         8+Q0+GRuqz1zeADFR9e67qStJy68rBmSkX+WW9s48Hfd4J3+yonSKPQ0846FpVYEMhKz
         gh0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxaW9m/sdZD6uUA5x8OAGDu6hpDZFYTLSJoWWyW3G3skxTJT6rD2VdylGWsLDQrPFQXTC2+UA52PDO+@vger.kernel.org
X-Gm-Message-State: AFq9FYLpiQn9DIXJF7kin+9MSgGg9VY9kgK91bpMqHlGpBJiTWODljEg
	bSM87HPU4HKbVSZxMSAl+omDJWnNeYHupYY29SbYmxWmsaIco+l2czYJ3dNmArY+tZGKZxWfIwr
	3CE0s+uTLnDftYLMqiV0RJrww+wShR0YYAibWnMlFC72/CIsJuS3TyNLOSZxPIbmN
X-Gm-Gg: AYBFou2HrtVr6HU34GSBLCtDTxwpiJG78luWcr5Ih581wKaPXL49mPDN/TxOpzuk/R7
	ethybhNveLsNvSeYy3WfVEaZsfJOOCvNXUI04R7gL+9S1/cpqGPoQq2zpiDuBrFXWLOzg7ytugL
	gp68vfJnldWWRlfvjYQyK8neuHPmD9gwbKalVG4ln+9RbO57g6BuAFXE4oaN+fhL3XZGhhJjrNX
	m8z6rUCiAZcOia93GDsCpdgSR0xvPTOyt7Fd0jP3dbMxaF54Ou6a7gpfAxZ21JAOjzHlKXhYhJP
	+PF6L4GlRpFP0Cg+Cam8V7Yt9WPthjcF7m0NXHNamIIyWJZu5Q7tR6Mq0I3yk0giOOgKGsTFN+W
	0AzSOMPeeZYVTmkNoCIgJgrs+iDMrPqYu
X-Received: by 2002:a05:7300:fe89:b0:360:8596:657d with SMTP id 5a478bee46e88-3674e04eb02mr2352393eec.32.1792574766400;
        Wed, 21 Oct 2026 02:26:06 -0700 (PDT)
X-Received: by 2002:a05:7300:fe89:b0:360:8596:657d with SMTP id 5a478bee46e88-3674e04eb02mr2352376eec.32.1792574765898;
        Wed, 21 Oct 2026 02:26:05 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm6155671eec.11.2026.10.21.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:26:05 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:55:47 +0530
Subject: [PATCH v6 1/3] misc: fastrpc: iterate CB nodes manually instead of
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
Message-Id: <20261021-dup-sessions-v6-1-578ab52ba66c@oss.qualcomm.com>
References: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
In-Reply-To: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792574754; l=5896;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=lc7pys2jl8b6IeEdNwVX+R72jMwQXYcFVXfMeNww1go=;
 b=I3hQVmbkOrOFRuheTwQMtCKvT+0RJmbh/FYnDX1zO0sMyKYnUeGHmBBvUoplAf9aLJVJmLVJB
 8yxr/o7d1QeApc/hWO0brnsOPoTKSo9SsThle8MD079927/1O5v5aQb
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: XfR0Y1Y0q-TVrO7XOiSIqPWP--nb5NLz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXyVJ5y1BRtBPh
 a79QMPjmIzUvSwz3q8vrbu2+9gW8c0TIkilLehflEa1u/dn6I1KRD+npZdhvPIBmHHNKPfJDuEX
 RRz5va8wDk7jqa2kvHlTm7ZtiJsTcwPru+xhPUQFP6KhZrXYZ8axb+C9ULwQf50ESrQsbY61lAa
 vmTWONe0bRb+pPXY1RQqFYaLajZZ+yd2XNqvVvoChvHonxzJypCadUDwZdqo4CHY3UrJJ6rT2Rg
 kOZCGTZhya1zA0WJyq3ALYQE1E2qaNmsHiUiwlsI/RoT5pGWRYOCvV64+hSHbYSrDx6tM7EMBJ3
 spTfxgr4/ZlNXBh7qtBbZ8G3wZ08wI/G/Lf2iaHDgkqfOk+94w5NiLoDuNWJJgaPOTJxiWvgG27
 f1qpypZQQvyttjWVfoU2ZR7eUW9725HymF4LOB+rxytEztjR23i08UwLaQecPz1fM+F/jvueX6s
 kTOfnplroJzF6Co5oJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXw9rNOXQXtaYh
 u4p/UIGhYmizSAzt6V7Q3/78Dhw95GDaDQTNuVZ3UTDKE3ujz8JD/HXxbBe1Aj+RAFnX/4deXtv
 m/LzQdBECjzts4wifbJs/3CsmsXNk7s=
X-Proofpoint-ORIG-GUID: XfR0Y1Y0q-TVrO7XOiSIqPWP--nb5NLz
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8852f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mOEaRXDu9pUODS4UlNoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

of_platform_populate() only guarantees that child devices are registered,
not that their probes have completed before it returns. This creates a
window where fastrpc_cb_init() may not have run for all context bank
nodes, leaving the channel context partially initialised.

Introduce fastrpc_cb_devices_create() to iterate over child DT nodes
directly and call fastrpc_cb_init() synchronously for each
qcom,fastrpc-compute-cb node. This ensures all context banks are fully
initialised before fastrpc_rpmsg_probe() returns.

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
 drivers/misc/fastrpc.c | 95 ++++++++++++++++++++++----------------------------
 1 file changed, 41 insertions(+), 54 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af18ff1992ee..caa479f304c1 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2333,7 +2333,7 @@ static const struct file_operations fastrpc_fops = {
 	.compat_ioctl = fastrpc_device_ioctl,
 };
 
-static int fastrpc_cb_probe(struct platform_device *pdev)
+static int fastrpc_cb_init(struct platform_device *pdev)
 {
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
@@ -2355,7 +2355,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		spin_unlock_irqrestore(&cctx->lock, flags);
-		dev_err(&pdev->dev, "too many sessions\n");
+		dev_err(dev, "too many sessions\n");
 		return -ENOSPC;
 	}
 	dma_bits = cctx->soc_data->dma_addr_bits_default;
@@ -2363,7 +2363,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
-	dev_set_drvdata(dev, sess);
 	sess->sid = sid;
 
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
@@ -2389,37 +2388,51 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
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
+		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb")) {
+			of_node_put(np);
+			continue;
+		}
+
+		pdev = of_platform_device_create(np, NULL, rdev);
+		if (!pdev) {
+			of_node_put(np);
+			fastrpc_cb_devices_destroy(rpdev);
+			return -ENODEV;
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
@@ -2639,7 +2652,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->rpdev = rpdev;
 	dev_set_drvdata(&rpdev->dev, data);
 
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	err = fastrpc_cb_devices_create(rpdev);
 	if (err)
 		goto err_deregister_fdev;
 
@@ -2711,7 +2724,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
 	}
 
-	of_platform_depopulate(&rpdev->dev);
+	fastrpc_cb_devices_destroy(rpdev);
 
 	fastrpc_channel_ctx_put(cctx);
 }
@@ -2798,33 +2811,7 @@ static struct rpmsg_driver fastrpc_driver = {
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

