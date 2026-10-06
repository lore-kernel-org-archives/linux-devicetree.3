Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A702EEE8C
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247208; cv=none; b=fh4glrsp2ZQ+R/fj89szm7p/+k579f3lotClyd8A1QWAgAAxaUTxI7VbFveP4Tdk442/b7Ep+U2as1mVD4ocDZhy9YdIY2hpTTfGTVZwzTjBRuNQpf72G9GJXYkR+c9LKt9XC/8FxBqkz9hLWmvuPy8LcU4gLpHR53Gzy/97wnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247208; c=relaxed/simple;
	bh=Y9kjvXncYREFAgUwoBtFPotlKXtYHvixiI47ICifGeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JE+Fx9NnGgfkpuBGYC+KJt1f/VybAJnm+rlcVIC3le8n0xh2tJdC3ao1f4VewlPXb2kPBo+p214ZhBvqo+LwOqF0c3L2VRACIUEhURCxmZ+3BL8kkOpS4QfZ/x8FBwLycUqnYwfOvSTMFJ9gvzYo9P3B0pVcu0kxJJT3wgugLEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJBHUgB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOyJUuFL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJBHUgB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOyJUuFL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KN0a73299814
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 00:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IMtzZeKCMAa+ITg30dZJWQsG6U23gbt3P7bYwJipKpI=; b=WJBHUgB0X3/JGa2J
	bTCFQ/W0ALtJnWq+kuZTmRbg41C6dw160r5JxyfoG5vtdAKFDMajG5UUKQUKSPJb
	+dc5DjZZ/zSIzNRomCYaQs7UKP374pWPbSRJ0gJm4rRsKxY1a03qtQPwj8QUND6g
	ot2lBIIIJF+f4TFnswk6DwZ3StMhrYWMBGo2zYPcg+P5B6JGo3TSwOIw8dAGmdy4
	OXrKebuIr8yDnEtn9ZBpEY7LUwGwFQN+kv8Urk4z3bkETiDmz0go90XEnhlPsQXq
	aPDNk9xElb+rY4y+G4aR0cDJEmwbyCVhceZDZ4QJoRgznVHXoLeWXzXi1jfzRFbT
	rknFog==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg2rbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 00:40:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30f1b904861so2787317eec.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 17:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247204; x=1791852004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMtzZeKCMAa+ITg30dZJWQsG6U23gbt3P7bYwJipKpI=;
        b=DOyJUuFLUxKTClpyckhruViG6f9X3J/3TDzmimWwwmqELDLphA6zHzjVglfPJRs0L+
         /pEuAqyx/iouFVvs30FSeDKh/KK/dVRJB1FObaqBl76gEHc3Fzmiw4+tMHV4zzoVnf/t
         bnxeuQlaKKxMje3zcTEKoj5p4tvlXV9LnJeUQbpi+Sa6OyQpGgxojPH668og316coHz7
         EecwOw6VVQaKa/X6N5aC1spsdNr0k8nNFRlfmqENOqE4ky46OD/2yWEZVdFzqqPxiGB9
         vb/LM1gLa6VR2mjYSV99wVNH2dMCRFXiK7OKlDilU2a/u/6U5wbi0ZIUaK3uWAsNXUOq
         qKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247204; x=1791852004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMtzZeKCMAa+ITg30dZJWQsG6U23gbt3P7bYwJipKpI=;
        b=j9PUO7lz/T2os3/DjKR3OflHLDaB2ImtHVsXosvMEuE2iMOnzue1gUz14pLCJescjk
         hA35jZH9yH4a1g+XAYDeHTWoJuLbZqNK2BEmTd6sTASsmcsltJzdqd7F2j2rBz2R3dy4
         1QsF5dYsDChB3mtUMNeNFV1fragbbRFgZ7SKC0mPCQtxe73d1kfAk5jWR4yslCLGdZ4G
         OnhNrQWzLTGH/rF+qZuex97oG3QPCftlomJqdDGIULKNq9f4JiMO51PvPXYNzGXZEibG
         lXKT2gkvlA3O5cq33mc1D4Bm/NeNPxUd9oeo7w2B9iRy49sJwYiMb/+Yq2WRosGG18zA
         WB/g==
X-Forwarded-Encrypted: i=1; AKwUvByh7FS0U8D6DvXJxGicJRVkv5vxa3Sdnkuqbv14Ku0C3+pZAR9/Ogwa5A4L18jS0ziJvBGd7YwvOZEv@vger.kernel.org
X-Gm-Message-State: AFuF++m5K3Sv43fIy/aazkS23b8bFS2mV76nH96NNeqvCI86rTip5sBj
	/J4aCOOGXkqiuthprEUn42NUAMcPdHAIy2yCR9o1Er7MPtvgUv4uAs6+r68wqzERIuqPlVkFbL1
	tCjJfel59kbty6TeLWUgheKWwWiZuk1lfcLGJKgPVwcxQn7kzWpr3VLMzePnHxlc=
X-Gm-Gg: AYBFou1dSrG3Cmh/PltWcncQUgJxUC4svEZm/GPe3hjnKP29ikPr94HtBY2xDnWl+Rr
	ewmxYaA3NzCfjglS+f2MUvpPvG9LcfWnK5Fwf2dui+Xb8z71QddpLB18urBU0IvEyWq3ObPoEic
	M0Mn+dmhOOb8f8+2Tdxqc/rMa93rguRzTCNjjkmNcFlvqrWIxrXKYvzdlcN3OGB5VDfy7jTtcHB
	pAVldr06RsnQT73QIbrE2iZYN3jDzjgWIysgQ6EOpCg6IelHBoqV44aBY/A/w39q6JLAwVTb+ML
	kCvWSVxdSNdCUAiIzSgXqKiMyNJmtKMyuF7zabJzIKvT2WywODWtedLZUgb3TYcfJ9FSmMmYLlW
	II8gkpanq6e/881iGeKaaBjMR/L/Wqr7PheTqR2rxe5EZs6UWpWm/V1jprQ==
X-Received: by 2002:a05:7301:fc09:b0:34d:755b:d60b with SMTP id 5a478bee46e88-35111514891mr11504990eec.34.1791247203558;
        Mon, 05 Oct 2026 17:40:03 -0700 (PDT)
X-Received: by 2002:a05:7301:fc09:b0:34d:755b:d60b with SMTP id 5a478bee46e88-35111514891mr11504954eec.34.1791247202887;
        Mon, 05 Oct 2026 17:40:02 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:40:01 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:52 -0700
Subject: [PATCH RFC v2 8/8] tee: optee: support RPMI asynchronous
 notification doorbells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-8-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: wKZkM6PWRg7PXYHkXVR4wBvye-f38M1A
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac44364 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXzZkh7+Uv0PfZ
 Or/GWOilV0WXG2s3LXyTCIcMtqmuAGYxKE8ycI8cv+qDqkhugrSxh6k75j5gwGI3Npm879Uw0ae
 KY9Oqo8QRDzI0Xh03UuKSWlDHuqdKYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX8aFwsl1rw4Oo
 6uJviskLI8lBhiE+ySATwD6xwKwRV7VtrqzbjtvpU08lYDdRJ4U0zy2cn0dyd5rdbEuK/fkC7n/
 V7ibtgkQvXVFmN2PoqAEKlaz9U3v9g5FGeWrQbcgugppTqkreFltWSL/Qc4CipDnqHOhfsfcr5R
 kEgYEEP6PjRVdFwHbF/MfhGPm48/4y8v8AKiUFzeV0qgeR/kUKj2uhzgTDfYjRwZKnL+ActFwLB
 sizruIeOD8ix9KTCBfnreEqYPj1GplgcdseWvrvhqovDvNetv0TJZDNd79bzDHjUowEIocwfE6E
 njKxjeMyVKgSQOBGP/f8mQDRwNFncHoYGpKk+BNJQk8xwDKNwptICW7iX8XAJ0T5QgbyQG1H/53
 SlH1OQmRp9dxvKE/CpbPMZSbI5Olsn81jcsBqHx7+vHGZ3Dx4Jwp9wz/bxvXtqQ31VNrT1kg6Y8
 XD9sTGsiSX660negFDw==
X-Proofpoint-GUID: wKZkM6PWRg7PXYHkXVR4wBvye-f38M1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060001

OP-TEE uses asynchronous notifications to request bottom-half
processing in normal world without waiting for a client call.

Allocate a TEE-to-REE RPMI signal and pass its ID to OP-TEE when
enabling asynchronous notifications. Queue bottom-half processing on
a private workqueue.

Initialize notification delivery before publishing the TEE devices.
Allow probe to continue if setup fails, keeping synchronous RPC
notifications available.

On cleanup, request that OP-TEE stop asynchronous notifications,
relinquish the signal and drain the bottom-half workqueue. Transport
relinquishment does not synchronize an already-selected callback.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_private.h |  6 +++
 drivers/tee/optee/rpmi_abi.c      | 87 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 07c27e322a71..e5c6381bb872 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -190,6 +190,9 @@ struct rpmi_tee_device;
  * @shm_rht: lookup by the host-endian parcel ID and nonce pair
  * @sec_caps: negotiated optional OPTEE_RPMI_CAP_* features
  * @notification_count: negotiated nonzero number of logical notification keys
+ * @signal: allocated TEE-to-REE doorbell, independent of logical keys
+ * @notif_wq: private bottom-half workqueue, NULL when notifications are inactive
+ * @notif_work: processes bottom halves requested by the RPMI signal
  *
  * Callers keep their tee_shm alive while using its registration. Lookup
  * returns a raw pointer; the mutex does not protect its lifetime after
@@ -203,6 +206,9 @@ struct optee_rpmi {
 	struct rhashtable shm_rht;
 	u32 sec_caps;
 	u32 notification_count;
+	u32 signal;
+	struct workqueue_struct *notif_wq;
+	struct work_struct notif_work;
 };
 #endif
 
diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index db541f3de425..ffe44d81e857 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -685,6 +685,88 @@ static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
 	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
 }
 
+/* Yielding bottom halves run here, not in the transport retrieval worker. */
+static void optee_rpmi_notif_work(struct work_struct *work)
+{
+	struct optee_rpmi *rpmi = container_of(work, struct optee_rpmi, notif_work);
+	struct optee *optee = container_of(rpmi, struct optee, rpmi);
+
+	optee_do_bottom_half(optee->ctx);
+}
+
+static void optee_rpmi_notif_callback(struct rpmi_tee_device *rdev, u32 signal,
+				      void *cb_data)
+{
+	struct optee *optee = cb_data;
+
+	queue_work(optee->rpmi.notif_wq, &optee->rpmi.notif_work);
+}
+
+/* Relinquish is not a barrier for an already-selected transport callback. */
+static void optee_rpmi_async_notif_uninit(struct optee *optee)
+{
+	struct optee_rpmi *rpmi = &optee->rpmi;
+	struct rpmi_tee_device *rdev = rpmi->rdev;
+	int ret;
+
+	if (!rpmi->notif_wq)
+		return;
+
+	ret = optee_stop_async_notif(optee->ctx);
+	if (ret)
+		dev_warn(&rdev->dev, "stop notifications failed: %d\n", ret);
+
+	ret = rdev->ops->notifier_ops->notify_relinquish(rdev, rpmi->signal);
+	if (ret && ret != -EOPNOTSUPP)
+		dev_warn(&rdev->dev,
+			 "relinquish notification failed: %d\n", ret);
+
+	destroy_workqueue(rpmi->notif_wq);
+
+	rpmi->notif_wq = NULL;
+}
+
+/* Enable OP-TEE's bottom-half doorbell using the reserved RPMI signal. */
+static int optee_rpmi_enable_async_notif(struct optee *optee)
+{
+	struct optee_rpmi_enable_notif_req req = {
+		.op = cpu_to_le32(OPTEE_RPMI_ENABLE_ASYNC_NOTIF),
+		.signal_id = cpu_to_le32(optee->rpmi.signal),
+	};
+	struct optee_rpmi_status_resp resp;
+
+	return optee_rpmi_call(optee, &req, sizeof(req), &resp, sizeof(resp));
+}
+
+static int optee_rpmi_async_notif_init(struct optee *optee)
+{
+	struct optee_rpmi *rpmi = &optee->rpmi;
+	struct rpmi_tee_device *rdev = rpmi->rdev;
+	int ret;
+
+	INIT_WORK(&rpmi->notif_work, optee_rpmi_notif_work);
+	rpmi->notif_wq = alloc_workqueue("optee_rpmi_notif", WQ_UNBOUND, 1);
+	if (!rpmi->notif_wq)
+		return -ENOMEM;
+
+	ret = rdev->ops->notifier_ops->notify_request(rdev,
+						      optee_rpmi_notif_callback,
+						      optee, &rpmi->signal);
+	if (ret) {
+		destroy_workqueue(rpmi->notif_wq);
+		/* Checked in optee_rpmi_async_notif_uninit(). */
+		rpmi->notif_wq = NULL;
+
+		return ret;
+	}
+
+	ret = optee_rpmi_enable_async_notif(optee);
+	if (ret)
+		optee_rpmi_async_notif_uninit(optee);
+
+	return ret;
+}
+
 /* Query and store the trusted OS revision. */
 static int optee_rpmi_get_os_version(struct optee *optee)
 {
@@ -823,6 +905,7 @@ static void optee_rpmi_remove(struct rpmi_tee_device *rdev)
 {
 	struct optee *optee = dev_get_drvdata(&rdev->dev);
 
+	optee_rpmi_async_notif_uninit(optee);
 	optee_remove_common(optee);
 	optee_rpmi_shm_rht_uninit(optee);
 	kfree(optee);
@@ -901,6 +984,10 @@ static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
 
 	optee->ctx = ctx;
 	dev_set_drvdata(&rdev->dev, optee);
+	ret = optee_rpmi_async_notif_init(optee);
+	if (ret)
+		dev_warn(&rdev->dev, "async notifications unavailable: %d\n", ret);
+
 	if (optee->in_kernel_rpmb_routing)
 		blocking_notifier_chain_register(&optee_rpmb_intf_added,
 						 &optee->rpmb_intf);

-- 
2.34.1

