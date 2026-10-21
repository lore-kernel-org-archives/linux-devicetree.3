Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574774;
	b=flnJYkvUikNqrXrGIjbKb8d1zmL6pIrBiyM4nW5+p0VP15e2o6plKjapO7+Dy70ZAxwD
	 mnX1lRhQaj5zbV9uQt6yG9rh7fp+tKh1kjy3fpDz0A7ZIkOT63yIrmDGBtuy3kQ32HS43
	 WTDmxAG1rRSWlO/fAz9DcufcLqss2JM+abpmquZeH9PIIXWaARqPno4S/vHUlyttOOjbT
	 AH56hpV+NgfRrDbin5raXllIzLfisbtIOpEAi3X0wkmQvN6tKS/20u4grGegROFq+Enzb
	 zUFEyeITYCZ/W4KF911ejrLr8IKdBtd3csqwYml1BBO8PVjmvRVBDG0CRi1gFCbYxrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=;
	b=mYGwkAV4TxvTdLAB1rayg+QneRr2Q5AJuBCaDkb1AyJ/jIUbcgT6kpZeAnEGsj7bfo/Q
	 iXrcOPn0ytRLKvstciLEG7aJ/Ztyi4zlJ2ItpPvKbgfOxha+91rL6v1Jn6a90LeRSgznr
	 0LIXXe81JuI1EtylKBupotcfGKhLFEcNxBscU0I+heZv0oRoOKV2RPkCeTQRXR2KKMp6W
	 5OHZDpU2OYzhvCbZA9cNcVG30k5qAS8lcyBm2e9le4z7IV0R8l1P8Q9gCG93tGmrgbTiI
	 DFQxhguvONPAlNzxlDZ1ySPWvsLa2kW35nrtUc30rIWmAISV7HBCcYMkvR7aCuJjphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZP6RJxAz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwsZCwkc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78D606A32E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B78D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZP6RJxAz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwsZCwkc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0jF756368
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=; b=ZP6RJxAzcZY4H2aF
	/JLzUqi0gmvmU9LyRhTwvotGe6RgfZ/IHX4qdNcnPEvPLH4UlfQsmi/a4bUta+Jp
	6S8371gAAdiWU+V9ADN1fJT/tsLhNPQdTnAoOcYGH3QbnDHJhRNKo2qCrrYwFSlt
	C66v7dC3D7JHEbzGbmqyDdglCzBEMxMttFb38whW8HghFvbG8oa5yPh6NqcDWrK/
	K1/UiQ/GtvXh/unDC+dBoVSmCBFU8qJY9ST9b2QH9W1M3ZVq2VF4j11Y96BninVT
	S1qQzmXOR8950y0MpU7oKNJZum16YNeO8sJlYHHb6nq7MDmZaXbn2OQ/mGauXv6J
	77xVUA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4u7cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so1214570eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574772; x=1793179572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=;
        b=JwsZCwkcrDBzUDPeMBtG3IJKvLQGzM6cJjHInM5/0LpRry49KlTj6VfA0hlNptx54H
         urwOIQ9fvCi3xOJ1vU1Iti3l+iZ/FtNl8C5qV8G7l1PGEj6+h4sHV7HJ9ajOn6TvrGrK
         i7uVr5Mk5M9djx5Qr/iQFbD/d0GMhSHoagUsf+lCKGIegn8q1wTFVAfHBUlkOMOR5cW2
         SwNU1RfaT2SXhpWqf7Dflf5hiDgGWXBTvfhDU70SG+m43NUhR/BD1OkVxy5e5nAex6WG
         j8o2dqgPChUJLOOTTOWjDCZoJjhcQIo4W4yNIm4EgeAmDIXx1ewQJQSnNqZnMFD7HV6e
         uMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574772; x=1793179572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=;
        b=0I0REuREQykYM+Ji7sV6udeG66i3S5SL8tLYn2TTfXNvXRF/v2iWxRLpkjk/1Mw49P
         bim8HoMs5EnArBb18OykGL7GdoidpUT3M0mnK4F0zOhfSHUtl9WoLfa4neficFdQEfZ6
         9LluZz5cO9eVcTDqc+JjTxNYjVkgkyRQyH8YhW/nsXnaPg9T36BgBnrSmxpYpGWdpOyP
         npKuXrqRIJg8RA5sG5gbyB6Fj+H4tyVI6HbW7xMWD1dIRZhqCY6HCyxWGp4q6nH2tZw7
         EGvHfuxx4z2vRsbaJJR8qVBw6VUUgsVsJDxKWcom8kiDMr0/JmZt2kNhduwlNp6zkNcO
         zAmw==
X-Forwarded-Encrypted: i=1; AKwUvBx+D6GEPXmoHc6TV+kCrva59N/Kdn+EnkGgHkq74Ldz6L1v80iTViD9zQMydyuH6JQRYo3sUIl8FWH3@vger.kernel.org
X-Gm-Message-State: AFq9FYLb9NIBQ7BvLyhiQjzdYaYk08PBDM398kEzJtAI0VG7ak4xXNWg
	UVElzIz5yKmgekBO1qqfvQl8hX6biYMOCUuUQMmA914rMhjjBEzZ4mtRHpL8DpWJWKNkH7kZin+
	goRya2zV7xRL/amz9QNBkpWchXh0oJ2+zHe7PiJxK1QAQ6Knnmz4I+SoaDPg4EHfv
X-Gm-Gg: AYBFou3cezuJDE0/02NKyxDSrPJ94fKz7s8TVIp+Bvgd45jYzT3/Sm1QJ7eVkUmxU1X
	FzLPGTIUOvmo8h6tD1WY2IrPlKHzJD3Dr00dzru8wtDowZl7nQDHH0MGTduUbmwDCF90Zfak0pz
	y1CHZX2zIg4yrcpIU6thO9OW1FBr+AGO6uzlm3QhFdRkHfiNNYTKb5b6YwFI8Un0Jryd1PU58fY
	Np6a/sF8PNkA/wosKzcudPALp4YkFbe3kYruK5R5+gxNnsz9qaVIhH7SYyx+tOay2vTWCZgt5mx
	CvhWEsYcgKIDT+3BP7m+dTiAlvFCZ7HMSqMFczvb5hQhp/TPaXroFQ/A2WSEJ3WmnvQl32HN0u0
	0mPaK1mjIYrh24/zJjy08w9AAvyCchHkQ
X-Received: by 2002:a05:693c:62da:b0:35f:71bf:131a with SMTP id 5a478bee46e88-3674d13ffeemr2438738eec.28.1792574771947;
        Wed, 21 Oct 2026 02:26:11 -0700 (PDT)
X-Received: by 2002:a05:693c:62da:b0:35f:71bf:131a with SMTP id 5a478bee46e88-3674d13ffeemr2438721eec.28.1792574771404;
        Wed, 21 Oct 2026 02:26:11 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm6155671eec.11.2026.10.21.02.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:26:10 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:55:48 +0530
Subject: [PATCH v6 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
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
Message-Id: <20261021-dup-sessions-v6-2-578ab52ba66c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792574754; l=3363;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=hoyqKe3Xg75nwp77nhRMqSJ1qCMhXfgxFsO2RjAVi4I=;
 b=LC1PJt8KXbUZfy9ow4duAZddRfZhmxUyXouyYDY/1eKvG8XU9wQLssAvCoFt9h3kaF+wkgumf
 eoG9rZcAutiAvulGWlaNiI5ZQ+5HfGx3D9mV3LidBOK9FZ36auSqBJs
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: XYvDgepBCTIT6kS6rm56RYX4B6Ty2VF8
X-Proofpoint-GUID: XYvDgepBCTIT6kS6rm56RYX4B6Ty2VF8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX4yWozFwgCP72
 w2+RewE/lpVB/MrLS/AT4gXOJRUh8//AHpbbAg9KTmLYeeh55XaAgV1VWTqF+F8WvRO4H9AlUUv
 rwlCW1q+HvaROxYIlL5HDyEtxVS0g+E=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88534 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX9Wl3cmmIwzgV
 INmc3g87HdoxjaqXI7lwGjs5z3DhyarNKzUV7+Pjh1pzlX3ykNm2LTF59Q8KOUW2ETtuWp7EGvx
 n8xeTnN5YtI1TirbofRkMjmxdw78WcUPl8zqKpNDW0ca0p7fbWYncdya120XujGB1ZTMnGdBqLY
 p6xRlRET3sDHtew937LM+uAx+9V4rp8eoKqY3PNGwalOEGOWq9rtOofZg2rM/1jHVwDvpR2wROF
 5/CbN8SEEQS1q56OWvXLUpQRB2d830FUfJAjCTxEw11gr/o60UhfGplPjUiTL2WsXvw1jFrCkD8
 PKsLWL210BnArM2iUrEdXiwxbjMHSc8JOGYCMMwnwb4+62mZxigZlMrjpUB9Q/FtAas9lrloaDs
 YxhkTa0/MruRbmxNyhpiZQ3yfAY93mBxc9sk3ZhnRZTQSTCFxHHjEtzZ4JzhvasB/9gQDmslzPy
 BTJBmycUGmTioMujfIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

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
 drivers/misc/fastrpc.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index caa479f304c1..5dd1990d3e2a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -34,6 +34,11 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+/*
+ * Extra ADSP sessions duplicated from the last CB, as each CB supports
+ * only one session.
+ */
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2338,7 +2343,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2348,7 +2352,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2368,16 +2371,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
 		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
 
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
@@ -2656,6 +2649,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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

