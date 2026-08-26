Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157C742466A
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750777; cv=none; b=sMfecmm/hJVNE8nqNm8h2Jpun5dWlc6dXYmrWr3/LXRv54zHlNo3xqMcCbA8ajpqEcSoeXG59xCvcN05XjYn1zUoq1RfAoLTmbhjYAETcX+8pLnr7QiADboGAJWNdn8gFiHzlbe0z1BBHI7Mr8DgOzyTY0TPb54h+yuP60+tgbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750777; c=relaxed/simple;
	bh=Zza1N3Y2FKmg1mQy2qIK8tXblDJiQpYmkV3BRv9IN/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cikIwuARoQ6JphqqkkzMY4Ny/lzFwa1lUDsQpw+eUyh/PFj9DbnUHKEhM5PH3iTiE3N0Fcn/wH64IEw8nRHa2xlsY3CegZoDZ37vB/W1BpZAnrV60M3dUGf3LGGGLrBhDqdOGGaMr3zxIQfpJdCBE4VDE9hLd2QgYiiF0MnbE9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBuKGqmL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IH2Jr3QI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBuKGqmL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IH2Jr3QI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBn7B3983363
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ulzrg5Jgbzcu7NdvzxEDb+qFiWQRuMHzc+1iwLtcyyo=; b=VBuKGqmLiocUIwHt
	0iPDM39Avaueimj6DQynSuQtrxeXR2hrt4lUfIu0mKH456ajW4UTxZMwiYvEZJ6t
	Qx0AKeeVCL4Ox/EZDdLyuTCZOfe3hl7U52dY8dYvxOGn7dhb6AaFBJDZ8xSxlrkU
	1U4bHrLMjoik9OGXK4iWtCYkqp+oVJNTb4Ys+DWyeORKWr9lr4XyIj/JLpAd/5JB
	nDORMRVKOQv8rbvrCupunqmb932IItna0cLDS+oJvkfzkOtsPiOl44HayYT3qBew
	mEgLgk+awdOc2IpDQ/0Y4Mkw9PC70t2BeA64JfS8G6Gxnv5q3CplY6hpP+PzbrzH
	vB93KA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqrvd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:26:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so1358302a91.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750773; x=1788355573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ulzrg5Jgbzcu7NdvzxEDb+qFiWQRuMHzc+1iwLtcyyo=;
        b=IH2Jr3QIxpyMYt04ajQd42juhtO6867RSDv4G0VtQtAagNTzoZdX2C/qUOXMJQiqU/
         drOnXI0kidAbFtOhd6QibbUfF5qbiKsxV5KtTBccocvZYIYJ4aXSzbqGOT31huBMZ7pL
         HTWOt+DFKmtOpsYfIeN5VMPrthUG7KwUHvmHmb6wGXtCG3fM6aRWb0ywWvA1WjRfm6KV
         SoBpSMgY8XGFQ064rFWJKX1U8tolPOygTZQ472ZhwdiWJR1+dkt6wHb8T7DDjWnLHOCP
         EbTvfg1rMrN/RnixlX1VZ/j6PJusYbcLj2F4RhZnNkYMXgIffPtgq0ILy8TebL7GBFu4
         1ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750773; x=1788355573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ulzrg5Jgbzcu7NdvzxEDb+qFiWQRuMHzc+1iwLtcyyo=;
        b=KuXD2qqds7CrHVBNfQJlEXzrN3aqabw8lGiQ/DuajaExnJkdvKN6S0Bdl9ydbhPiDk
         z0zvzr5RredDkAcX9STw4J6J5vnYlaCsQxRGc49UB8CocyDriYbeZetUE+3sN4dyh+IE
         cdGxeLGf8St9Rdfhmais24O3qy2Y2N7qZFTW7ChiG154/0vMHiw7/giklvvLJ8t5xzRY
         7XMQdJl085HEV1X+IC77QLSNQDtUUnWwcn2DvyEYe2ivoViZmo0VnG9gBP9FwGzhXufF
         m3LFAzzmxEBvjssLjJv2CZRwX42JItYPM0hwclLcp/X1FJpMdHIKAji+K9TKpXgwTgQd
         NnaQ==
X-Forwarded-Encrypted: i=1; AHgh+RreqdlkDNnD1mfYnM4iS7Bgtb+jTzzSIsKI6w3cjY2evwdnbfF2db2GeUfHg2CbTar/7xxx79nNfypg@vger.kernel.org
X-Gm-Message-State: AFuF++nJNaw8o5Bq9oQL61NzBpQhcMuwUkySKZTVR/h6H5C6J3JWi2zB
	JYWS++dXJPmbR6QlEX34z3ua9plAQB8BDCkk9W8ZD0jj4MhM70XR/r3NCjAL/PFDCsve9x/qh/G
	ps2plFSW/YrHSaI5ylovrDl1jJuL+w4gu7weTP4/GYLujP3J/JwhQJrVkaHf3zYf81rp0FSAn
X-Gm-Gg: AR+sD114sLV/NQ2HQYseg/P4PR2lGrdqwLUUXtWmx8i+SDx6B/Xhn57hVP/LemrhlMo
	ceJDQHU/ZfByYRHmi5fiTKmaFmuv1jTu2uxMVCmHmNftUFJ8SEMSoJG/yzkrYZnKOzQcqpaIfmR
	0BIoRi0/L9uKjX/LQmzati/Uha30o+nk/ZULyUvsa/ARP9Aj9AEROxCJNvpuckCX1VS3kiTlsic
	clxuYkbfUmSK49m/Luhk6BKtDWcW1bLRftT/B+YYqxPKLkmFcU9rNb1FpZ1ejKx+U3r/Qwc7d92
	EztK71GQeS51TkUgdNWXVPbqZEn43j85ycr+M9riTUpHkqyPhCbheoR9w80k+fmezD62w4u1+u7
	KYOa7y4RrVrRswO7yKOOIMyiPPEJshE4NEg==
X-Received: by 2002:a17:90b:1845:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-3966d85dd8dmr15798789a91.9.1787750773100;
        Wed, 26 Aug 2026 06:26:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-3966d85dd8dmr15798645a91.9.1787750772646;
        Wed, 26 Aug 2026 06:26:12 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668767d65sm4581108a91.8.2026.08.26.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:26:12 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:55:50 +0530
Subject: [PATCH v4 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-dup-sessions-v4-2-35555d2bfed4@oss.qualcomm.com>
References: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
In-Reply-To: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787750757; l=3234;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=Zza1N3Y2FKmg1mQy2qIK8tXblDJiQpYmkV3BRv9IN/g=;
 b=MvYtIoBfRHzr+9ZlxzKLLMoppQsZDe6pf/KPNN/1QMZ5lRfEuP0Dwulclq9H09nsqHriGV/ys
 J1Twvj9xDNPBP2Fdaacm+ZxMCdQ9/9E7ncnRt/0xCCt2ksAYoackshw
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfXxc8PqAvSQhLm
 mzloZKkXk9QRDf777xhpX11CPH+EouKwP55rYz0BBlrMZxTDCZU1BpnrNBWhZ/2u71TR0JVZeB0
 argYMjvoGGLyjTnJQlToEVVxL+YGeSc=
X-Proofpoint-ORIG-GUID: Yc1f6AhCKrfAEwMgcvv8p-UseG_mJVrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX6L2kgxJTcYaP
 7MbhlM7fwNJ+e3RtBJhFyEDe1SN5eSnjXQHOSsjx/E7b25hOLyQz0K1SMq4/TZuEknOZPPlZkKX
 jVoJDtUs2VZECAhB69aoMI3D6VM25HHXMKDr/EPSCNzKdz21ajPy/o+bm60SMshmNggfcwOivPH
 at+epCsFQzkKYrbgqnngw+lSYoEUhrNga2uHaanD3DmOY38R2ZosslxHV/9yASPd9hdaiU1QuVN
 MX+pXaIiuES2jSIUYidZMgKx03iOstpGjjm6uMGyuSzyMXVLvfqnBOq0Xp9Or1iNYLxVzM7SkmY
 5PVh+E5+8EKygmpo/c794XTTCX4Ym9zGXt8RmlH/0BDtkLU728ynM71B7pRWqqMQ3tplwXhTvad
 x/en5GfVclGoobJA1ZqAyq6EtKrY58bWUWzqXYPd798DKjfXMik8sNtpVN8CS2FCN8VNVdbWDqR
 rEBOKgonb05/qL5sALw==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ee975 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cClR-N3A75S5OZrvWOIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Yc1f6AhCKrfAEwMgcvv8p-UseG_mJVrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260111

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
index a153107d0085..98a61b8b9013 100644
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
@@ -2368,7 +2369,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2378,7 +2378,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2399,16 +2398,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
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
@@ -2629,6 +2618,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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

