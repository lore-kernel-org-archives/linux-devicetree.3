Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270CE407CCC
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568574; cv=none; b=dW76ccgTZmNZr1MyqDnL8oNkGzEVa2mab4H5EYT2JVsDL41hhP83Lgw9auj6VFtLWoOuicT9KvTD3zOxPwFSP8eJtuD0X71fuPRI597wgi8qDQTerZUmYxBEYKxzOSuok3MWlmkYynitW5TvRmpsBYDb2WHYGfRaMtAGX8rhcEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568574; c=relaxed/simple;
	bh=HM6nYB94UQqzE++3ZIy64Nq0TZgXvgxYjs2hM/NXndw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+4tIzRaOxH7wfxbIM7o/UkT1BK/0r2QHede2mtD+46+xlSEE33VvJXlOKRWZAkD4FmF7Fnzw+ynG5nX0/JGZJdp+zwQDkjLhpLMoYcrzcmgYhgE9Wix9CB8qmwPlP/ZLVUL5fbPYI7InlnymYEBViXb0OnCIokSxaYvW83x6YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAt365kh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvW2mLaB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAt365kh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvW2mLaB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O991B02448505
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vVusOYN3ugAh2ecLn7CEAf443UVMgdSl2XvYPqrDBtY=; b=RAt365khN+chPPLR
	D0jMxVq98NrNKKEVYf4o+yASOW+2/4AlVFAQ+x1jh7TGhJ08nftLgC6cnvwfGpdK
	XutpQb2nyANTKg7We6KnZ3XpzjlODeLJBkS0OeJVJ5ZcY5qXWk9pPAhpXQdHVRaq
	i7YReuWXfdg/leew+bHa5z5c6pKkQFk8pbSkVOo4VCK6oPVlwNkKOF2ZJ2PdciuG
	q7skLthocbpD1zep6K3VPEwNcMefxOYaVFySqwDmhtYCpxddqoAao0Ga3P1rKU1+
	s+u2z7ksSTnsJvPAk2ebdMdwof/5J0IRW6gSUnRCRMDe5xxrDXXmIx2AmK91GOKE
	mbMvyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0psq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:49:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso3352680a91.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 03:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787568571; x=1788173371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVusOYN3ugAh2ecLn7CEAf443UVMgdSl2XvYPqrDBtY=;
        b=XvW2mLaBUIlUBI2UTt9r/DYOyGKn4yK1giZM8rgeNhZUrX7Jck7hGAG3rqV7omtcWQ
         7NbQZyg4v8lhceQfCKsteDBhy1wUusLVHPbg1aUNZ3SjlzTVeHO3VunAL/zRoIEKdYRd
         7SAeLMDTcIkM/+n4Opn81DHtdKWzvP8Av00BQcwRIwfUfnQr82FBGknW37WZ5wOuTzvy
         hQEPuGadrQdqO0McsUmqb8Zc64WvhQTiY27XO/ZYlQUZ84lkYr5P2jDgTOW5OyAgl6nc
         krYAFnzcOhNq2nCeV7WhjLPsA4xWaqAenWw4ZkJNGEX5hKKrJb085LPLxH3Uim/HYDTH
         ws1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787568571; x=1788173371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVusOYN3ugAh2ecLn7CEAf443UVMgdSl2XvYPqrDBtY=;
        b=YxBZZxHRojIHyr3OpdptTgWWE414iKFxZXd23rQckgefz6DoYDrVIrRnqfKejXMCFe
         gFyv9Ge1ew6kEobpF5ktMv85j+1u3hlFtrccAiFIjEmuaDXrPWfBSNukxL9/9gzv0Rfl
         gcQwI9Crp74FeN3PSyY682diC0+J2j2Pc50uGDb5ir3H9V/xKrqwqnT6bHKT95tBLbwL
         xPpkdhzT+04oGwGPO/BiOnwLXhEnjHC01SdCaetSna7elbR5Qqh30hEQ02NnHQSDp92t
         gSDowoJgS3zC9nYOFhjrC2TReR6RpZp081ukuhtlrH2m27lcbfqgNzCXXtQuOp8DSK4V
         0geg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7197k5LfbXkkfsoMrX/9E4ecEP0yqZBGf4sSnPxXJY5CPXvZgBikyFH+BPy86fQoh4lumbc9cSE+V@vger.kernel.org
X-Gm-Message-State: AFuF++nX3CkjBBW29Fp9IBz5pohJ65FPPzFCUR1MaPUtlp83uWEwFxOL
	RvzGTPFbQ0icNXv4nwnBQTFJGBahc9UZdOBdMHFBLS0jGCwuJhnTbiaShw3xS2NRpbvIoG/2Lvo
	/ESckqRfm8YRl8Nw7lZ+eCDvy61rjl+DI3JdMkkXqK9ck9lqeBS2NdfyIr0NdqlN8
X-Gm-Gg: AR+sD13TVzxeKYZadR3kIWUMyh0HKTKeNJ1rL94MIjWnjNODIrcepH3RI4gbu/pRb7R
	HLbAtgC922DN3OcUlR1kXV7Wm754TvqeXuzBy019DqjqE79Fp+iM6slV1DZvjbRl+J29IvLnYAX
	uGNpYOFTzaDj2b7LuQ62s1DCXKZ0W35uYHTZxsQ69qnvU2II3E+btu3oILwe+wXA34x9AMq6WMC
	+j1buHT9S2+8tJya1c1nd+qNMd+gQ8lQbg1kdBSaKh2vQ6NgukbW3HgcImoERlK+lTTdixZukMc
	Wu3N019zlvjMCe5w1l3bSsq4xLh2PvtaXrQP4Eag6Ca2KRcDRfKXfz41IIgyY3rNx/qaPdpwov+
	5xU1HbnO+KSrTT2F+x/QKbSODmorZBXxJmw==
X-Received: by 2002:a17:90b:224f:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-395c354d445mr42198013a91.2.1787568570941;
        Mon, 24 Aug 2026 03:49:30 -0700 (PDT)
X-Received: by 2002:a17:90b:224f:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-395c354d445mr42197936a91.2.1787568570362;
        Mon, 24 Aug 2026 03:49:30 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c91ce453sm4125829a91.4.2026.08.24.03.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:49:29 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:19:06 +0530
Subject: [PATCH v3 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-dup-sessions-v3-2-4b019def4e0b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787568554; l=3276;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=HM6nYB94UQqzE++3ZIy64Nq0TZgXvgxYjs2hM/NXndw=;
 b=g9wCclPyZiAPUuGFKMrBlbJy5VBBnr74Oy+TaeeyeXIQ03nk9zb8OlN3NKcrfVGygVSTuUFQe
 ofWIpVDiXiSBgNx6+4kYmUdOO0EBI+0LlaoKSTOI9thyPcjuyE+pSyb
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfXwMc/0tMxgBWy
 IKJ6ZuhGyPS4j9Xq+TDOpygujzRrPvP8Ks6yFi6YzMpyfRgDDC8dfNglC2R8Zl3WqzAcgd3abMf
 lJDwjYFvfLbJTpPidLkzpvyTzj5MW5alpqEbfiZ7xRL4hY1wuhNR4I6cPmB8Q2qtK19Qwtj5Dno
 Q6wZKdKNge2BhArAg+i462HEDYMzebQBT4lNZeA+jCjW6cX85YeOxo5QanUgIxONHAP1lZMd34W
 9KMhEVqkIsQ/BG7wMuu2LGgucamqMhUMYhkp0uluZLCMpz6NxqwLeI/F7xahnA6SNcDq/31QRJG
 jOfuA840CDbRHUa7RvCCucRmEU9XWrKW4ThTrAgPRjdICkiQdGbFZfVqPadKzX82MvOeMQhivaA
 JFcFjzXCPA30zZ90jaanWrslLNCNbUs7cXfXXoGyF8x2sa1GtdabNm7+lxe7yHmbVKBq45nidG5
 13KomlsFzlJzOwvzh3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfX2E3T7W3IDFa6
 IOhR3jb9GkUxEjLJl/IL91k8qf/6N42ZXR+gCnJ27gnmElnVznJl9arO07nt+Vs5dCg1g4Fe+d1
 PVo5OMyzpgB2tWoCazE9cdutCzwtLC8=
X-Proofpoint-GUID: kqc3Kk3UV0JNBJWttgv6nrr__zRIn51q
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c21bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: kqc3Kk3UV0JNBJWttgv6nrr__zRIn51q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240090

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, qcom,nsessions = <5> was set in DT to duplicate
sessions inline during fastrpc_cb_init(). This policy does not belong
in DT and should be handled at the driver level instead.

Remove the qcom,nsessions DT property read and the per-CB duplication
logic from fastrpc_cb_init(). After all context banks have been
initialised in fastrpc_rpmsg_probe(), append FASTRPC_DUP_SESSIONS (4)
copies of the last session for the ADSP domain.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index fe127bb0c115..55653af223c8 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -30,6 +30,7 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2195,7 +2196,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	int rc;
 	u32 dma_bits;
@@ -2204,8 +2204,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
-
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		dev_err(dev, "too many sessions\n");
@@ -2225,16 +2223,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
-	if (sessions > 0) {
-		struct fastrpc_session_ctx *dup_sess;
-
-		for (i = 1; i < sessions; i++) {
-			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
-				break;
-			dup_sess = &cctx->session[cctx->sesscount++];
-			memcpy(dup_sess, sess, sizeof(*dup_sess));
-		}
-	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
 	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
 	if (rc) {
@@ -2429,6 +2417,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			goto err_depopulate;
 	}
 
+	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
+		struct fastrpc_session_ctx *last_sess;
+		struct fastrpc_session_ctx *dup_sess;
+		unsigned long flags;
+
+		spin_lock_irqsave(&data->lock, flags);
+		last_sess = &data->session[data->sesscount - 1];
+		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
+			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
+				break;
+			dup_sess = &data->session[data->sesscount++];
+			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
+		}
+		spin_unlock_irqrestore(&data->lock, flags);
+	}
+
 	return 0;
 
 err_depopulate:

-- 
2.34.1

