Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608295;
	b=Nb9UOcvSsP62DTM1Wko9oQUQn23ysCDPadTDkk9PzsWqDgoneqOnfuoI3Eecr8hDQxv+
	 UuyKiZDx66BD5ZjwhIwkz2tq1xCgABgPkOdz3psUSFtEUer5yQeyJgQtHd8d5WNExtX3b
	 ic5BFAAs1wKjJ4HkY8xPNcNsY7F0s3Kt1mM9vtbd2DvK8zATXLRz29qt92XoSXv/VUnoi
	 RoRfrtkIA1iN4m8fWL0gl5SpVa/pX1haqilPEVpN1sfe4fm2dZ2YWFI/jFWuEKXDF4lqY
	 f0oS5k5hMcPY6TP0KesRWuczqEtQIwUQO2OVw6dnrBcd9sttCzvSOm6ax2zvMlYzFEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sl/C0ue7XKBR5JLbZ/3q4Bcos5iFaHn+Kv1/3l6xjqY=;
	b=E5EbI7hskeIzOjeD0KRx5d3jQswOxY97b9u+NTZr+eU5ewVX+PRQMZM1pCldM6Gz41qy
	 yLeJsLVx+IUO79o4giZfvGku0y68GtHQOJhNGd+cndBte0gTFlYKGOTv0q/KAWw4+9zXD
	 OQtNh0mKeRjmAW4cKBaluf2tlIMntH5Swin1cdnlbx0ruJ0TSsDkbl9RQQ05j2HUbGowx
	 Dqs1GzUC9mo4OONxA7ZJSFf2xhP2KzJtq1dm7INlD7bap9RoHQtR4BWnUWqvmxnQvbTOw
	 bcyEwdbFYT3ExGQihYFLewCYqhzM4MlS9KGu5jriyTyQW8VR3YXaRKD/4hc2ApbBHoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kKMtXU4Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=haXUhwS0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A4E606A32E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A4E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kKMtXU4Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=haXUhwS0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DQob2433842
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 08:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sl/C0ue7XKBR5JLbZ/3q4Bcos5iFaHn+Kv1/3l6xjqY=; b=kKMtXU4QPRmZmwTs
	8yi9pLSXsl4/YLmX1A6kg2U6IKKBVqC+B9bNiJ2G3N3Y/+aexXEXSgjTO1cJNBqT
	gkEG8SdOhLKWmhEuK2mz5k05SrtSTbCvdODmN/2Le3oWWEgJIq88iCMlmyD403I5
	xm2RPm68r9Hs29soP0GQgM2Xgk9I7qJcSfXaqOZesfo32VxGgRAt8e2LQIIlJshf
	D/3xRT1KKGdUaCv9JCuYcrLHAvHDRxV5dj/G123eKmp0SGOTnzRwsLM1Kc8NWYtj
	1FdXcgyqYMqsUxlDblBW3Antk1IpA4lIedUQP9xwQoUZa+jX3aNyk1VgCsWslwSH
	BROLug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60ux7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:31:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso2667490b3a.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 00:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608290; x=1794213090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sl/C0ue7XKBR5JLbZ/3q4Bcos5iFaHn+Kv1/3l6xjqY=;
        b=haXUhwS0BdPJmZ0kE6ygB2NDAUDzbDqmhPZSJZUjIsG59fTSI5/dQB5qD3czhiliyX
         ABTd7VCE8NzBCKdIxKtjFkudJ+Nq3mk+P53EbSlPGOnl+D9t3wYBPZoKq9tLvEGNTuip
         YWK2Ve+sQQaEo85g2pvemxPPOy+asuZE/R6kc4t9lpmZfVFawez6UHpxrEopWIVCmnUM
         idGeTJxgA1e4+NPBgRmjEThXAgQqxU4I0vhKZ5VDvC1btTFX4lqTa3FCNoozDRqlRSu6
         /7C6p+aj2BrS59Lcq1ADliwLJNLfnRYProT+qbFN9HZs36yrNeT4fcODR6PKUVUFGFJ7
         Q6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608290; x=1794213090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sl/C0ue7XKBR5JLbZ/3q4Bcos5iFaHn+Kv1/3l6xjqY=;
        b=JEwr93lnCK/q5n7OY4lOz1iep5cVG1BVsO0tQh517OWnzmnykAWyLwTxH+6O7Sla0F
         JqxWXNIS6CzM8We67QmBEaO4+cpjUrEy2LdO2SFWuGU/2bI8NPbOzB4y5WYBHuKjcHpc
         MuBaGcLW1f14Q+RWz+cbPv3CrFT2ndFqfFhbE7rvXn7Sq3x+R5e35fH81Z0O6Qdd55ki
         nSJv7RB13feAYgpF/s4XfWUM32dp0sdvLqqnoK72H43Z5TmyVa+b65/0Tv+Aorh6uYI4
         IcGBCOOvP7DNyCYxlep5gCZPmaT055ZWTUMEx1Cbqqqa0Jattl93DHQ6bLNwfl0epWVe
         AweQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGuurrP2EyqqgpcZNKDAf4jsVXSvUrfXg8DUgdBKUtAWVHAEv1VzQtMl6/EEgaUv7kK0Az6YFsYiEM@vger.kernel.org
X-Gm-Message-State: APuU4Z9XB4zhW6RufVph12/KCUF+E3iiGdriYsF/AM8IJnLwlMvOmR7s
	ZXsuAt5uSiDMW0wQGNMNIAajPy8l8RJTCZahovrCKi1oHTOmwkuqzB5+yBL0+RdNvJ6XlXjj7f8
	wIiQTcWqOGOkKUPEU1kBMqFGwKNer9Fa20s0puDCHmiWkr6mpweyUq5JooI9anDkR
X-Gm-Gg: AYBFou0u8PaQl03bpwEj11RUVUYw35I/SNT9zbGZ95mEfF2r1JrOpPoI5xd8z2+tQhm
	Oqy+yi28HC7ShkGTgwS2AMuOmDMOujjgMfHtNoxGeR5IKKn7Q0QjNJjV3R/F/rEACpTG+oPlnmh
	I586I5ScKhEi1usJThE2ZIywp0emIbvWtbSBviV4CI+RDw7jYo2kLbAl5VKMH2+vc1fljFBu5jP
	SQzLLbBmjex8JGAUcbOo/bswKf8C4FUm39iUe6lE56qpe0GMZn8XFC3FmIzKH4K2aAl01HQmXn5
	4mgxTKgmMN/pRcoWoVLHeats5XliwUFg9y41hq7ieW34NECPmxeXtVv0YvoAj0S48g1WiJjUeUi
	47LnKjHVEYF0JSDXLX273vZSMk0sBfk+rquLHqQ+GZXlGB8pcoO8DGTa5RFm5g7jv4Bpq7Mshos
	lwmTwWuw==
X-Received: by 2002:a05:6a00:2e24:b0:8a0:3d98:6901 with SMTP id d2e1a72fcca58-8a8317dd9b0mr7526919b3a.16.1793608290179;
        Mon, 02 Nov 2026 00:31:30 -0800 (PST)
X-Received: by 2002:a05:6a00:2e24:b0:8a0:3d98:6901 with SMTP id d2e1a72fcca58-8a8317dd9b0mr7526892b3a.16.1793608289571;
        Mon, 02 Nov 2026 00:31:29 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1674680b3a.27.2026.11.02.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:31:29 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:01:03 +0530
Subject: [PATCH v7 2/3] misc: fastrpc: move ADSP duplicate session creation
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
Message-Id: <20261102-dup-sessions-v7-2-03f06c014e78@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793608273; l=3389;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=GzcRHbNO2LaB8PuGTjCYn9dNPlPk5e9cggwn9DNEpK0=;
 b=yg1+cd5W5+ps5gLLwfz1IOCzeKnefgGcJpN8uae6dE3CkNoxSlHbgaZ8tfUKjoBUh/R5+Xpyw
 zITO6NzG3Y6CDPt2wrqK+XTiILEQ5FQ3hr3OU8hYTcSYkoz5mA4pkcp
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: OoOLi5ZHZOhZzsvPKXc8R_IeSqasyWyv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX8+rMGKN7qWVj
 j9ztc74hIk5xQLezsYj+Uu2Oc/VBaY5K0z4BARHch1f9pch+RmSI1QP16vZmuI0oPZBPdQdieft
 5fGI3Cp4bV/IK8oDo3RYfubqIWh9WcI=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae84a63 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX72IYU7BzvTc5
 u/+XCVtPX4vYFIHA0m2Yn/a7JRWRUclK03aHsy6l5IHr7S+c/ouL0E9TkdH9a8eSHSNmeWuP0QX
 BHoqMZ7pkiGMa4QBGcK7rw1tpBwLxGNXw4s1pCL5fMMsUd71HMEZlt0WU02QOyGDNsAjzKASFCL
 2FxGvfI3i7e7y4ICiCOeFEXLwINM74vvTHbQXgc0FE6q4jQxampQfrFb4AV/u/Kdt4DdDDGbLdl
 Y64i+wYPGOvLH8L/ouQC12pcSOb8vwuMPVCi+tUI8s2jl8dgmZWovstVWV4+wbVaaScT3vKcLoe
 Pvgmz3oquJ9T+NHflmp9vDi/+zhCXZkqnFuNep6tdmW9mmNxcrmr4coYbG7SXlXmB5KHO6XVyRh
 JIvn32DvQKDa7XNdjLuUO0K/OIfoZy1VYFROVGTGg4AU5RYHRsKCxaBitt9arWDZSEjuvNTh7Iw
 OhzM+X9Rj50YoapULFw==
X-Proofpoint-GUID: OoOLi5ZHZOhZzsvPKXc8R_IeSqasyWyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020033

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
copies of the last successfully initialised session for the ADSP
domain.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7441e9b8940d..b4be0ee2bc18 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -35,6 +35,11 @@
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
@@ -2339,7 +2344,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2349,7 +2353,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2369,16 +2372,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
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
@@ -2681,6 +2674,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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

