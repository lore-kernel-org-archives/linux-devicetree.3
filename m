Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D7C38236E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 03:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783483143; cv=none; b=HHOOCPYt/xXqoeKBoht4dEpa4rjXEvyndXldjayGew0n4j8qyjRQKJAhrcxPY9IKOuN2h6Z4zTIwut+r/XvEoYy5MnigOKjL46RjLEFy+X84OXrjThR3Mg0YWJW1uCGGj6gWdRH9aDKMs1AfvkxfANhzIab2Qpo0Zvj7dRP50aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783483143; c=relaxed/simple;
	bh=E1UlleUpatfwJfXD7CvEFNe2U0LGFAfWDhnzotj82/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hA4tVkbqA3rFVd83uG2FiCkslBvztt4ykj/SPdfm/zNGd7ok8E9OdWAvqIMISDYRpqk7pCTVU9JkI4B1V98IvFOmD4NgIdmMTcUO4VCmWppig/B/mlcuI0UpkT1umANQSy0E/YWQKhuP9mK6rUrCxt6KJPgP6yW5vLUJwSa922w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kU50F+pV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oa3PkDNe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kU50F+pV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oa3PkDNe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Mcu26963813
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 03:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FaiG/eJTya26hN8ZkkimAahZgkkyWSyTo5eeeXV0qN8=; b=kU50F+pVW7duPG1j
	nguPI7KgKlvCv8FZO/yiiROpFLdzH7MlwlqUXra65hFEtHxzizT4k2NbBEeqdecc
	ZEgnUcD/9JiIDo1n7rX7pBjTThjbNWCdA8SMJ0SsCeXP0AR+mqNgdJdTCzb7SXV5
	bWV2Q2n64zKJzT4QvnFRxjfnEM1my56AwtcJ7aaFOJLZLua6cf8hQOtm1FkeSOyf
	qYqjn7SVAlF2Cgfe9H8uLS7Jqu0zk92ADQi3zRslEpdJeRbhOMS2nPyTE2MhaWQV
	P0dgQQ6fLYsEbw5A+ioY4CqN78Kd0dNfMbdDsBdp7ldtWqG9cy5bi0CqlydMkkDy
	TKwCvg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep4jpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:59:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce870a060so6608065ad.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 20:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783483141; x=1784087941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaiG/eJTya26hN8ZkkimAahZgkkyWSyTo5eeeXV0qN8=;
        b=Oa3PkDNeW0M4c8czwGTZX0rMuB9IG7FgzvDx0bu3jsJZHJgsqM30cg+rfrsZsEeM+N
         NpECgoDdOGzfx38IFlkjT6iplX0CR3iE0OgbEBUgp9hHL3795u3Jyh4+ZuN3VBPlyYyC
         LjBTf//L5YOAjcTNC4+DInj/rpxGSUo98BQajwzj3vgH144XX82GZaAQjN94NCYvvO0V
         0/lNQfohqjfuPwcmSqfDPRmXNmsype/YQfJVQvg2B/1XdN5JwOZw4wer+mauHrZWoTlx
         GvnSPyFmqCjwOQEPKRSdZAGQ/18eKMs1CNbJYZtL4QMRxeosRhFd0MW0bfUdViSHi3ue
         DoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783483141; x=1784087941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaiG/eJTya26hN8ZkkimAahZgkkyWSyTo5eeeXV0qN8=;
        b=HE2vbgdcDWBleXFSei8cgET+UNKBZDjlUx1nczsAPk8C8yj+z5mJHWqWMGMVvEsysP
         FT1oglvHpL4RtsbPnOVN9L7DDYh1v7Z4qpvcAVRhJq3btvxQGFnzHGli0r/WBjZ9OYk/
         aC8eiJRDjYpjVXDN/K8CifI9qDmn4yNzFsVIQTU7tVewItsH/syW7GK5ofr6zvlwi2vH
         uOExLtBjMZqMTdBYtgWWbcbV9Ahy+bE6yJcjjlz3lyC5TIXy13NbbRvwFW4lw4f2orTv
         LsZsiCb7FYEzlPn3YUfhxfJkEQQC+cw680C7ZO9Izflothf3Pfh7bCq7QHRQWpYoXJtH
         rB+A==
X-Forwarded-Encrypted: i=1; AHgh+RpZu6pK7vT4kBOnsgzZ/Neg4ZuPaNLa/T0s8rO7teH2BgwzIMfNFIMDTwJKdnkcv/u7sSc6PqBo/1pA@vger.kernel.org
X-Gm-Message-State: AOJu0YzbdQf02NPsCzWaeAS5OBHG6410I5tLQ0S9XFcOvZtcgSvMaSQO
	js6Ujw7/IFnH8aVD9PPEG48WmRmSyvMTEJRUwNdqq/qHo/uw8yz49vqTnXw8YDZs+dAJxHGcyWf
	cfgrSuXYg2x1gDVIN9B3uoBw1pEyMWj09QbLcudNVAlqmV/+MzFxk+GU7J0jyR7Nw
X-Gm-Gg: AfdE7cmlXv6DEu+wH1fuqzXUHV/WstjTV7f8Oo1+Yfq791+tySzkh5ALMQWAYZpipD+
	tDferfYlnWkUwa8qtcpBgiSu9JPNubiAoiQIay1tUVf65p5fhJVeze69qnFwJ0mTd7n949YeN8J
	/APotkQJ3fHTuJvF/OMxCQTJEFRhXNgEoRTlyfsH0A/sc3FfWJhrMbeBeS7SFQao3rCbJPjRCng
	MF+KOrtmGPmeLQLn0EuBzvNQfBB8+aiBLYarb3Mab/vbdZSsOl5FpgUJOimJ43o0Jn+i0m8mLRu
	zTTLxT1ndt45r7isLGp0doHXctjE6qmxzDov/5GCdDb6oFqXK7vr35SK9LvkR85zyJv/VZaowed
	mh0V6sJqruyPquV9rnSLnYVr2PJYycaCtVcS5phI+jVo8
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr666211637.56.1783483140611;
        Tue, 07 Jul 2026 20:59:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr666186637.56.1783483140117;
        Tue, 07 Jul 2026 20:59:00 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm14487136eec.3.2026.07.07.20.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:58:59 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 09:28:33 +0530
Subject: [PATCH v2 2/2] misc: fastrpc: create duplicate sessions after all
 CB probing
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dup-sessions-v2-2-da40f9c98a2b@oss.qualcomm.com>
References: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
In-Reply-To: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783483125; l=3803;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=E1UlleUpatfwJfXD7CvEFNe2U0LGFAfWDhnzotj82/o=;
 b=vzZxLNd7liU/JhRSS81E494juiP4krazhNrpl1MhaEYQUKdt7OFLSrYc9HzaqlKyJUsaTdVEH
 eYM4q03WfjQAGUl8BUukX599/aTRK0Z40NuRBc4TAVEgbqe/Pw8XdGZ
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: jhg2iPXr5pYxBTv1oT3cXjZt1KbrmtZ8
X-Proofpoint-ORIG-GUID: jhg2iPXr5pYxBTv1oT3cXjZt1KbrmtZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX+0c8HAxkr1cQ
 ESFtpbY5+1sSsBn7HZrSRPKUHQoizAN4Yc/aeBJa7aqr/MNoyTbQiqbpuaaIHpy6Y4D8mqnfGHs
 sVs6ZxluHINgAvQJEn0y8jFdnrVnnrHmEbD/XnhfOpxpr1+/1QKmTRKpVlhyw55Pw3CfTsyOTwE
 DkSUV4/0kBiDv1DnOQpO4d+hKtjLLbgg8+xRE1blQUDycc0KhGXFr5M93X2ZJuukT6oPVNGpYWw
 Uv9zadfUmGAhydZbHJwmlsCRgOQrGgKZYFo1a2RIEabPtd1MWLGhpj9zgfP9FpLs4pKcnNJnAXA
 HCo5LYHRp8Lp3jgEkFnHonYmCu/zmkJyYZqGFdIGJZ3iTNf6VwNo9Ldww7U32L1jY/OZcaJ5u/D
 URPRupEC0rSsHx/U/btt3YZiNNTTJ9k8AKM6JsPhCC44rdtX+hK8bTZGz0CxU+CKYBWcET6b52e
 p9lYittpilWIDiDVpBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX1OVHmcZ2h+W6
 IssdHAZOLJu3cjIgT5hp2z5pc0syBV4yGkYzwTz+4AE8dbk/LhFSJS92COJljzSrzWUsVEOODP7
 4Wl+9QPUmK3cT0YzDCmWmJDVC3DSqTA=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4dcb05 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080035

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To address this limitation, a Device Tree change was used till now:
  qcom,nsessions = <5>;

However, feedback from the upstream community indicated that this change
should not be made in the Device Tree. Instead, it was recommended to
handle this as a driver-level change.

Instead of duplicating sessions inline during fastrpc_cb_probe() using
the qcom,nsessions DT property, defer duplication until after
of_platform_populate() returns in fastrpc_rpmsg_probe(), at which point
all compute-CB child nodes have been probed and the session array is
fully populated.

For the ADSP domain, append FASTRPC_DUP_SESSIONS (4) copies of the
last probed session once of_platform_populate() succeeds. This keeps
the per-CB probe path simple and ensures duplicates are always derived
from a stable, fully-initialised session state.

The qcom,nsessions DT property is no longer consumed by the driver; the
binding and DT sources are left unchanged.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..8a3944f6c036 100644
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
@@ -2195,7 +2196,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	int rc;
 	u32 dma_bits;
@@ -2204,8 +2204,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
-
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		dev_err(&pdev->dev, "too many sessions\n");
@@ -2225,16 +2223,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
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
@@ -2445,6 +2433,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (err)
 		goto err_deregister_fdev;
 
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
 
 err_deregister_fdev:

-- 
2.34.1

