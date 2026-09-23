Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE53A3E73
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152816; cv=none; b=Y4xmfesG+QzGa5E/JY5CLTb28cyUgFYDQJscWa3W1skHAUSVLCjXCGdmdLl3edDxCKXLJ2uQc4wu8lOmexcouiRYUqAdExGLyF5fC19o13uOzb0yLuNC9MHEe4Mz17eDBEwDQRJbW3qi0dJ2kWnonMy8rw5MReQUu4L7jqZx074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152816; c=relaxed/simple;
	bh=TpBJy16S8qnRUC5bjeqAKGF99NjM6kdKLzu6h6H5AgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qszwj4i8BUJeEk/HG4Jrt/J0o4RMC6uWWKgUi9obYgE7q27oKZjsOALb11OAHeF5tqtFSZm7HH2p0xlqpGQlGd+dvtGGd5MO1C1YJkCs4YVO2FxvxqijOyv3fvx+mYhgfJzqcYZ+/NKcuhDZmKBzQROdodo95/p/sk7vsGFhs8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7wMsSmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFswQ/KZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7wMsSmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFswQ/KZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8K2s12590074
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ottca0EiKIyP7vWmuQi/4WvWfdgC56k4HVx18P6/hbY=; b=F7wMsSmdgQjLZvU5
	2CCvGGk7UpLvzXxhElnevwvA0wsK9FI3rJEYg/KZD7hXBDDr3zX2kwhd30kFL4yX
	pL7CHa7xVSl4YTWqhv6e/ENys4ZL0j4eF9hb6xCVWB6IpjM7HNMOnaKtC+zpLTwI
	uuGAj1aCD1L1LEQ1GVnLHE97WPS6ojYWH3Wyz9LAt63jbITK+nxqWk0YT44jaRh7
	RAh7s2beQmihwxrKf3SRvryJAcDrG4liVjFCvE+tD7thHOP+JrjdB/hJRb8UV33S
	8BGtfwWAfCawmZ7YvQjfIRxV5gLZQpzPwPfdW3hCDcDfHF/aBuGxjYEeJK/nKcze
	FH/9ZA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3319wf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:40:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so989290eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152808; x=1790757608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ottca0EiKIyP7vWmuQi/4WvWfdgC56k4HVx18P6/hbY=;
        b=PFswQ/KZCxnZgDZFuCcQKqcuDAY9rhZ64vMyom8EUdrpg9wfG9Dx/UUEmocKdUTJUS
         gF120xekdgn+VqTS1QGruM+BpDvZhrnNjNkBPg4fgef63rdT0C/BPuwrWXlNrqJ5GTtW
         ZWsydAkhyXNRJ5tkJGfU62DWULCFJ2LMc2HBFwRgYNYGki3Cn5IBzxWkRoMOW8dXJtgu
         tZvrifjcdJuib5zCEdIx1NpUAFAwhoTroL7/E7WmJX9wbBCOjN55SvyPoUDpcawrKN+M
         OVOf3nPscgqI+yU4jvkwLcwoHEua6BajNTrlimbLCc7eS7Uz7bbvBseAJfVy0Nf8SpuD
         Gn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152808; x=1790757608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ottca0EiKIyP7vWmuQi/4WvWfdgC56k4HVx18P6/hbY=;
        b=RbGXwQqjzyNt6RrAIAzOajBvzkKhss8hv6ZQM/AIJ9xcGpANQ6Hpw1PTdI4lTPYWBH
         mKbq6xHoJfhEiZ1Crh2BbzcA/nfk09R3YUwZ2q1UsKgx7Mt/UI3zbJkfRj8XBKo6hLLo
         EOGbCn1yegoJr84ACoG1ipW41JazrNiq1/TYoaD3GYYRpAz5Lu5TEee463rfn2icdUFd
         17tqGxxTIclg40PQmv3iHMSaik6HoDV37SplYkzwseO0ahb/H0dAPXCuC9sp4TeqonKo
         eOdgn2FLpFX8Gbzmh8BlfIvKaDpAeWDQTBktG8OpKBKLdv05wl3Fb1n6x2Usd9DaF9Xk
         n2aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmY0tMUkCWbMIEk0mYB5BKB35n9HIPGZ8j8s/VRLuQxhqYWNMMdi+Q6uh+S5YzBnFfiLVR+dwF7Vvk@vger.kernel.org
X-Gm-Message-State: AFuF++llAbt0xfYsuqotpnGRTDIH8Mo2ZbYy6FRcOqvbbdB+4I0W1HH9
	G2SKgRM1WiTnvX8bc+1YfRFPf2la1RxhTM25BOxob/IjygyM/xx2uhPuvW40Fov9erftuJ0VvUt
	7hcTJJTGaZHe1ROFAkkkSYu8d4L3m0bCUlunouD1naOF4lUAxfI+k3oToBkJpiljH
X-Gm-Gg: AYBFou2VPS54mReTvtjUd0HQEpEo+G/tTmBPs+OMpNAdaQX0cPROFDxDR08BvNyDh7o
	zJNSR8LDc6ueg4/12PTm3jFEq6UaBqairE6Q6WnH8xqaKMBo67zy8KTltFOMbYqSnBqh5WzgaPo
	0k4K1nD4bEeUr9o3H422NuS8FgsuqjoPWgbaTmy6zJHh3dOOIikRFOqC8Uunev85+mjifPaSd46
	TQAhhXv15UTJgwJxMlFWZwQ/PX34cDLquK4h+iC/krCU5tj2jNXF9HRYxbGr9kzYSmy6qntNhzM
	qUQyRMR8PEsJX6+X+JnDM6QfhvdPfmaI2U0kBYQd/DuvrPq40rHOWwSA2JvdjHebaXLxKU0Kx/W
	0+P/Dt+tKoxgbQWhPEEt092Y2YCdolM9Y
X-Received: by 2002:a05:693c:65d1:b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-33e8c24a5f3mr1854808eec.10.1790152807812;
        Wed, 23 Sep 2026 01:40:07 -0700 (PDT)
X-Received: by 2002:a05:693c:65d1:b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-33e8c24a5f3mr1854783eec.10.1790152807221;
        Wed, 23 Sep 2026 01:40:07 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm4701275eec.25.2026.09.23.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:40:06 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:09:34 +0530
Subject: [PATCH v5 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790152791; l=3250;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=TpBJy16S8qnRUC5bjeqAKGF99NjM6kdKLzu6h6H5AgY=;
 b=N/29XZZ2KO5pgju+btB8IieQgG4KOSTd0lXWxo5oi7fE1R/tYC2WmQBPt/3FoOvHUW/mlk4Ma
 ooHExQpQNfyAlOMaLjv+Yvsy7qeMrbEYL09rXJTHOnkEbEpyCXUiIZ3
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: CEvG7wFTUDWZwRUp7AR0pBK5KAxC_9M7
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab39068 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: CEvG7wFTUDWZwRUp7AR0pBK5KAxC_9M7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX7nQs4EJByWJd
 PdPXrox/XuqqGIWvvnNf0+JpoDT9gUjd1JEO0dAWTiCTMwmgVVKbaiPtB0lqLHzkxuhHw4Cerxk
 gymvbLKkJ63OiuIkZWYmqMVQ7mkZ5E2gL52wxvTpu+1cAz0l5l9uJwoPJyzWlGPlc21cHEMGT0L
 cJrSuNmtCbWpQAc9TEQTZEb4efLmih2KAHDeKtiGFSS8Q91yw9Qfm0+/XaAnH06t0QGZdivOgp/
 xyEHDVuAzW5VHzU09T/afTvA1QWMuhKrhh5P7f+HrjFioDUmt9OG93UhKUxblYRu9uHt8Y2qrsN
 KIknCqO+mS2zPJ/mhxQ2bzi6IML+g5KCu7vfOWkMKLMcgKeu5MDEPclp2bmxDK2ZP6ue6SdFb08
 eLF7alPijKQwIMrC6u7W2ws622I230pgTXa7kXmMNdsP8ha3n8wbnDdWraDpY3IKWmnuVNHi+7u
 QePcccIpmwlWx9mK75Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX0sHiY67p2Kvy
 E4rKVcZwsP1SB9kNbG3D4XMClaXjAX5UiZgm92KGzGJ9Oons9dzatRfDg/BUPVeje+EG+fDpEF1
 SC+uZ2sNhj8f718wIRNTVSrh7qiAtSg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

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
 drivers/misc/fastrpc.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f20d3e5ecc81..b29c1fd00de2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -34,6 +34,7 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2338,7 +2339,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2348,7 +2348,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2369,16 +2368,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
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
@@ -2669,6 +2658,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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

