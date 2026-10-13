Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBBE4915BE
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870129; cv=none; b=fGgmS9ee5uOgERmezsjDBSoEz1d/gXM5CRR+Y5zgaF+KEWdrUcpjyRuPOG+3GpoTYsA771Q1cjXPiPEPEAhi2F8hre1v2VueD0hLy0r8282M4JVJa1bwDZWC329tzcW9aQV9HhzdqqvYZxONj0wjMUJ4lJV7w8tKw5ih/DyFuCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870129; c=relaxed/simple;
	bh=aG56Ac7h2Y592xOGL3Jf8xm7MfpbHewHHYn6gR8JJJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT3VHcAe5Vny9xaaJ3HlS8Pd4Mhy1x3SKE1BZp3T3ogIviMCDu3N//7xXPV0yMr4Ok0aMo+b76g3cVcZcs0gW2MWcipJ7RkOqTwOsW6fuxrmDcsMQEfJ+hMJo0eSogJFwMQJ8Vwt23eWqJDlC1IWWa1EZ55jLB/ly268vgJe0/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i443NBo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHn2sasW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i443NBo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHn2sasW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21LPi3509517
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EuzD4n98XFQr8qVxMc+ujFNUBJUiJ93/Y53lGr/WPlg=; b=i443NBo2gZptrYak
	t0haq4df02oH/e2IQ5VglKIZOwLdUWmL33Hwa1PCkX5fJOIRThLN+LdzjNJ8iqfV
	ZK79fnjWNkW7UCxwHlXw+gcC5KPpzf475hi83ipMT63fd84YcKPGsgJTJRTCUD1T
	z9GxM/e2zdh4p7+HgR9PxVkHWzJ6sPiG0TYTrzlEnUv9r0TNzn4hwSGJWd4PF+do
	At7g0Y1pMIV+YFFaVqSKMvYAIk+86bdfkBzw4P+fW+0cKU4Ay7XOCZX7FM1JCArj
	5nNURyRYpItAqa7fBAN+oASy9el8qL9r0qRRjwXXGQX8HSLIeOvXz852rO83W6CP
	XpiiBw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc4feq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:42:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so3475543a91.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 22:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870126; x=1792474926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuzD4n98XFQr8qVxMc+ujFNUBJUiJ93/Y53lGr/WPlg=;
        b=hHn2sasWQKMVYJkDXdyPpxno5/f36zPoQ4nOA96v+tO/GMx2oW7PY1O13GNnmpH5b2
         UyBQwW8CtHN5Qjdn+DnjduGmuXHtsy2SgIpya9mrIaxspor0MmS7XxsiWA1FsnsD6H3R
         IEOm/DMUOFeDn2WG3XuLfN0obX/Cl6qoQSyympTFfXQsXbwJurK5eKlzhakeGwJRPaPY
         qjJsX38qqrLk5/dDfxNRJCKYSd0ExJkDCZgXzCimhHWntd+wo2uuLYT/vFu7YqjqJRsE
         odohtplJWmbi0GlrhMoZnt/oMdzMAjhBkjNESp1njaMbxt+hmg4a15P/GEgMDxQ/bW19
         IWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870126; x=1792474926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuzD4n98XFQr8qVxMc+ujFNUBJUiJ93/Y53lGr/WPlg=;
        b=sXujYjikz6uAikOPt7euVIvyI8bc/yssKzvCmvkTLbDN1OwkxXqieKhUeEYndG59kj
         vOo4HGksClgjeWzizmZ5JNFcZF8jJC8Jcv4W3EWocyMSx4pLOt8J7v2rGWic6We/g2Om
         60lDVfjwClfKM51OhPh70gSUb584Ll0tMRfKbzaQae3CAqqWzeO7uoWoN1WT8TvmS13W
         CapKSnXQCLFpgTEf1mC0ZJmxc41qUek4HnyYzw0NqIIgtrWg5GpZbw0Y8F0JKEQ/vfVK
         T72rV1ttcfAGCQmk7zJKa6kXAVjJ+tVzed3SWlaXsTdDjsr1DhPzJjffueEiZ/qdzbYL
         3RUg==
X-Forwarded-Encrypted: i=1; AKwUvByKUTZWvbAtp1af2GBs0niKMiwqfTIWgzj7JIaKW78OSNt6uiHAPkoPC3+qekYC0o7ejpY4pF/q5d0H@vger.kernel.org
X-Gm-Message-State: AFq9FYL3IPP43/WsQ7ysx3lmoch0DkmHgNhfETvGWyyeH/s/dUySM7Sj
	6ouMWdI2ylKF+j6RpugbhyQNS42ptk6H/0AOdvyH/tGW7ULaIVY/7JTMdmXWJ1zEBM/AwUYA7Dy
	R4truCOXauJkvF4LWuaSAiD8zUL81gdpH3YnXNdHRU7ju/XJJoxWU8+Yxe2zD+Dg=
X-Gm-Gg: AYBFou1u3YeATq810jDVveZkH7AFmzVj8RjhVLHPtiLE4F0gys1qoB6g1O4rE9ILQV9
	W25guH91cd2cF7A+o2kXPo7K+KWcv3tb8qlPcONSLau/o4DYln6RcdXPP6wYBI+88KPNQhwGA7g
	UAf26UUNIJyvh5kKPubuqWmTJKfKocutz0GH/Itk5O6qw7IXMdhSAQfyQ3cXcUTCC9EGssQP0FY
	1WS8Cr38uO9+A3SVti/HkEQX0ieTYX8goLto5tPfXpoWrv7O9sICCHhnPOctW8q76tiOA8jVQRu
	dST9Ou20tW0XEvhHIGCEcCuzpaovStCyJWBiEoO2KDJtJFhUelbvZjDvXUVSjadq3e57Z8Io+9i
	CwGxKFnwmTkPaSdPbBNpvimrLxM0vOM1TPWCivb6JpJpUQT+Vz/b+J2OsuQ==
X-Received: by 2002:a17:90b:3d92:b0:3a8:5cab:ff5 with SMTP id 98e67ed59e1d1-3ab3ab1fa22mr10874805a91.43.1791870126277;
        Mon, 12 Oct 2026 22:42:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3d92:b0:3a8:5cab:ff5 with SMTP id 98e67ed59e1d1-3ab3ab1fa22mr10874775a91.43.1791870125744;
        Mon, 12 Oct 2026 22:42:05 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:42:05 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:36 -0700
Subject: [PATCH RFC v3 9/9] tee: optee: support RPMI asynchronous
 notification doorbells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-9-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX7wQIiDg1k4PE
 DBJQ71dADWWLnQude51XquRhmPnn73zE9qPxXminLo9FzhL6EbGmpdf1bSCaJid75cC5ukPhmSJ
 vD24SDpgIisqTSokjUgcvTS8PfVqLF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfXyyYbVy6tYtJn
 Dk5rxFiYGJe+r4M0qEqfXA4Dykd8pzExEB11YpPLruO3WHnQQ2r699LfFgi7qtVmvPdeE5MNmwn
 9uZaVnK1FasoJa1T3EMEeSWjs5RZblXisOvYbk4+6BHpcrVaWcM653ouUYg0HrTBVEDTH9lhgRW
 IkALjZGNEQIRS9J2uDLbEHovd2Y1b9TAo3bIwvP8zRV5oD9eMt0nVz7HBBn0XuxXFZwVxI64VBy
 z/AmYq1oUubk+/eiciGpQuSWSvMoPBRXAepPl0mhMSMLxIMYCCCJ8S8h12u5x9vuzylbzFgNfCn
 5jr19DXy5zY/An6e7QdHHlx8OkM/41LSnK6fS94g8SLlkfVu0o5srK1KBkxTyQ4wUTRVpnP87BA
 AlPVzgA9c5JEewCQoXhRLAuvcxcu1/tvzqp0nIFhUVkwrURnAUWsMWz5Qf9dZJZI1nwTCOOCgVs
 rRBcaQ9GXjG3AMUs91g==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acdc4af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VTAATCZO47tUykV1FvqnJXG-AKornv54
X-Proofpoint-GUID: VTAATCZO47tUykV1FvqnJXG-AKornv54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022

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
 drivers/tee/optee/rpmi_abi.c      | 92 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index fcb291a43b7b..3bc65ffb6f99 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -207,11 +207,17 @@ struct optee_ffa {
  * @rdev: owning RPMI service device
  * @shm_map: lookup by the host-endian parcel ID and nonce pair
  * @nonce_ida: nonzero SHM nonces, reusable after successful parcel reclamation
+ * @signal: allocated TEE-to-REE doorbell, independent of logical keys
+ * @notif_wq: private bottom-half workqueue, NULL when inactive
+ * @notif_work: processes bottom halves requested by the RPMI signal
  */
 struct optee_rpmi {
 	struct rpmi_tee_device *rdev;
 	struct optee_shm_handle_map shm_map;
 	struct ida nonce_ida;
+	u32 signal;
+	struct workqueue_struct *notif_wq;
+	struct work_struct notif_work;
 };
 #endif
 
diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index 0ed2de96758e..6434767a2249 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -580,6 +580,92 @@ static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
 	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
 }
 
+/* Yielding bottom halves run here, not in the transport retrieval worker. */
+static void optee_rpmi_notif_work(struct work_struct *work)
+{
+	struct optee_rpmi *rpmi = container_of(work, struct optee_rpmi,
+					    notif_work);
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
+	int rc;
+
+	if (!rpmi->notif_wq)
+		return;
+
+	rc = optee_stop_async_notif(optee->ctx);
+	if (rc)
+		dev_warn(&rdev->dev, "stop notifications failed: %d\n", rc);
+
+	rc = rdev->ops->notifier_ops->notify_relinquish(rdev, rpmi->signal);
+	if (rc && rc != -EOPNOTSUPP)
+		dev_warn(&rdev->dev,
+			 "relinquish notification failed: %d\n", rc);
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
+	struct workqueue_struct *wq;
+	int rc;
+
+	INIT_WORK(&rpmi->notif_work, optee_rpmi_notif_work);
+	wq = alloc_workqueue("optee_rpmi_notif", WQ_UNBOUND, 1);
+	if (!wq)
+		return -ENOMEM;
+
+	rpmi->notif_wq = wq;
+
+	rc = rdev->ops->notifier_ops->notify_request(rdev,
+						     optee_rpmi_notif_callback,
+						     optee, &rpmi->signal);
+	if (rc) {
+		destroy_workqueue(rpmi->notif_wq);
+		/* Checked in optee_rpmi_async_notif_uninit(). */
+		rpmi->notif_wq = NULL;
+
+		return rc;
+	}
+
+	rc = optee_rpmi_enable_async_notif(optee);
+	if (rc)
+		optee_rpmi_async_notif_uninit(optee);
+
+	return rc;
+}
+
 /* Query and store the trusted OS revision. */
 static int optee_rpmi_get_os_version(struct optee *optee)
 {
@@ -720,6 +806,7 @@ static void optee_rpmi_remove(struct rpmi_tee_device *rdev)
 {
 	struct optee *optee = rpmi_tee_dev_get_drvdata(rdev);
 
+	optee_rpmi_async_notif_uninit(optee);
 	optee_remove_common(optee);
 	optee_shm_handle_map_uninit(&optee->rpmi.shm_map);
 	ida_destroy(&optee->rpmi.nonce_ida);
@@ -807,6 +894,11 @@ static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
 
 	rpmi_tee_dev_set_drvdata(rdev, optee);
 
+	rc = optee_rpmi_async_notif_init(optee);
+	if (rc)
+		dev_warn(&rdev->dev, "async notifications unavailable: %d\n",
+			 rc);
+
 	if (optee->in_kernel_rpmb_routing)
 		blocking_notifier_chain_register(&optee_rpmb_intf_added,
 						 &optee->rpmb_intf);

-- 
2.34.1

