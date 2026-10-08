Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A2127466A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430125; cv=none; b=QnRQnHpay2MkB5yJaSWIdnXS2is2dGA0CVBGOfOQQ+RW0mkxJH4/rpBGhkcCOx5Fm2d9juwUw/4g+XseogCKnz5mZf7ZjrQajzdmt214f0U7LpxSnOBsK9xUHW7BDYAYbCbnltmW8uqwU+OJ6v3FS1bT1ZEjydcGt0gKV2AdLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430125; c=relaxed/simple;
	bh=rARwHkFKjjbvU4trPhh8WewFiGLZGn3L4375nqv/M2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7y9bEczvVRTPfM33hP4Am3+VRcM4sXjpRkMPNCbq+92V9nDCecwK44fz70/ypW5uectiDmbRqhxgvFSHhF3kF1F23giOSGmMYLZNd2VoFqftcSzHWIMsTzZjSlJfNvu/ckuirh4SPtB6GWuQdBIUg8ku8KqBgfubuBCgq8DgbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXGVAFPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TheXvlgG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXGVAFPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TheXvlgG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hLhO607428
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 03:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtcvnUkmVqQAt+w19mrphwNYznnIA8lvytR0upTmt8I=; b=cXGVAFPRnZDuaPt3
	K5OIuEuDZ+SFAt0mwwMToxWRUp7QQaBy6lZG/a6Fn8DwWvV/e8gafyFrljbR7pjG
	x2f84njQBKSSLHMjOZZSOtso6vIHBXGbZVxsTvIHEw4HtagDfeJYaw4sh0ZLoeXD
	vu5Y2unNTjTRPIiWSCLw8+BEcZVs2QnQ2kv2Aeh3yDNrhY5ixFRqWETkmvqWTFPJ
	KChjVKrnGGbyCT19olAzOqBCjuGDLN/+oEdEImSkjSKa6CIhmjKxPfbD62B+bdFf
	cShCQOzzrNolxgyp7mbXytNB9z+NPwF3FwwehU5Wp/+HsEAi++gGAQ0VI+lilCcr
	MFE4yQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rwpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:28:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso5790624eec.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 20:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430123; x=1792034923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtcvnUkmVqQAt+w19mrphwNYznnIA8lvytR0upTmt8I=;
        b=TheXvlgGrRhIHhWLQsEBwO3Ht/fskX71oZatkQzJ+pv0jrAB6B7FMIDBnGpzsjpKYJ
         AbOg1XHH9wfvthE74n5um7edle+fAstiRwVhLkkqvdDDFmkgYbBPskRN8TDnFrNv+9ao
         saTuZTE0TKzUJ3TVtHBXg5YIuTjS2xqVV/DiEyhxrpDFdALqJAxQeGkKozDiKeKoiuv1
         4ozflEyfnkrFOrGC4gM3ICEg5frSvNKtvEMpEPr2DCfc0v3RU50x3Fy+d3cMnidYFJ6M
         5tfMedV1altbDMQTAKWzWe8wvp7DZQG6a9i5X7raG+ZPbvvajuDULgHb9IcYz9uZMps5
         9xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430123; x=1792034923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtcvnUkmVqQAt+w19mrphwNYznnIA8lvytR0upTmt8I=;
        b=Oeq/jcNhxur7IpmuxiUDSLXusbPKZznuRvihJPJHKHjMs5NWcrEV9W9wQfp0pVOZ+p
         OcG8+i8LaOiwPP7zTdtVFb6nPngrDPtqDF/RSm9o/yOM9CAgxdDDOl8IZX49dVIkCztF
         vell3jLTVZqbwr37PSVdDX3yCjRaaw/2ABK5Fc8hBpXwKYvRQN8NKaTXK/Sdv3rNHrVt
         /KJiQ2yygwGUApAixPcWtSa/ZQyvhQUhQ3F/fxj0c4fqed+W9rudNaQj1/fwvqpIswHo
         ZRjgNflXLgx89C1/C0TUFUD0oZHb9Nuy+AWfMudugVra9kr12DK+gUezpSKBhoijBo4F
         yQXg==
X-Forwarded-Encrypted: i=1; AKwUvBwtxbyDoEvmGMrfTck3n+0GaVaNW66Us7j0tF41FG1OledB63U7LweRygynwrBzJ2aTaQkvK9Fyubfg@vger.kernel.org
X-Gm-Message-State: AFq9FYIwKpjw5OW26XykUegyvo8zHI8fNE0r3F79aTvNre1m54ZuSFaG
	vJTUycZRLJxY/oKEqPqYKeTwT0R4Bb31JAureRavndbMwpNIj8B7fjC0sH8D1IkmbB90Iog5bx5
	3zxtg9wdhv2Mr8lv+JBUGoDrO1jz6pxCkW45sYapB4b5wRn8qLxSvcQg75QDr8Qo=
X-Gm-Gg: AYBFou2vNQ+gRzj2hajNMK/z3G2KiY/AQlj0mbKEjY7bsLVGL+P8qUelTrM8o9Gcefy
	QrWJWjU2G14oTm8rhHdy6HUWf48kvoJDup9Hr779D7Cfy8WUOlFRZjJQG0qVS5orSnh9x6hf5oB
	e4ZmR2goIZ+Urj9WMRWlhoO52l4wyoJyt30rIghoQ/fh23ZTQ6yjUsIySo6M+dpwRMKsuhh1+/0
	GvYi4dOQ8bdvMGdZsRXzZqZgYO7lfIiboIVY22HtHXsEgu9b6SPpVIA1pNKnSzOfLcAadDE3HIv
	URLemPs/d6Je7EE6RD9TAZLI6TXLVfES42inpCQRbqQPtASGuZ873s8BpAXRTlkeb3kxzZk82yz
	pvHLg3ZIJ/4TVDuXQtdujX1By1JbSVjPRq1vqj4kofZC5s8SoAd4vc4u5Qg==
X-Received: by 2002:a05:693c:8208:b0:34e:f948:d7da with SMTP id 5a478bee46e88-3515de4de02mr5309878eec.21.1791430122687;
        Wed, 07 Oct 2026 20:28:42 -0700 (PDT)
X-Received: by 2002:a05:693c:8208:b0:34e:f948:d7da with SMTP id 5a478bee46e88-3515de4de02mr5309843eec.21.1791430122071;
        Wed, 07 Oct 2026 20:28:42 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:41 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:07 -0700
Subject: [PATCH RFC v2 01/10] mailbox: add direct synchronous send support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-1-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX9upwc7sg/Rgo
 p0nW84GQIhHWbsd7FuDHX4TTz6doE+46iKcTEpyqk18zOXLIxJlgDe3gChpX3i9KHX8aTigiFFD
 BxyEuuxo3B5ivu9n1VjMVtiTgP+tWj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX+W5ykqylLkc0
 cZicMxoxZgzGO8MFm3dYzpoomiMeAn/B38vV7B6ZzEAMLPJdKFWu6F7HuEHiJFGiUuR0Twn3spb
 0jfBa9CcywPNIBefgkJFjc4zEIm4XvWQDPDG7fN9Up/Dg1kaMDYQRAhfQrXtWKniI/TjBd6l/Jr
 Ie4LjJeKlf3ENfq08LyXCstnh7frsFA+4K3VLSjxuxelU2/cxBTnqFBf/+iel8d3dj9+zi+UzaB
 AXjX/b0T3G80WmSiJI7dM7DUkLSXoQAmgBwED/NjB7+W9GHWTMNwj5s8lce3qNYY23eLilrB9AI
 8RUfEnTU7gj3MOpt+fP62+Yw07SDaUoIJwmszeWs46r4095m7zT0NptbherO0ukfeWi2gVkFs0o
 NpeO/vUmgUu5LX3s8mG8wThSbUuj2Qgmm65w/frTW8zlytvgtH6QaXHiQH7mtZ2mulY26VCLZea
 yuvJgaIRsQeJGuvgxGw==
X-Proofpoint-ORIG-GUID: gbN48hdzGGJutddc7Mne3YhBVOgiS62k
X-Proofpoint-GUID: gbN48hdzGGJutddc7Mne3YhBVOgiS62k
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac70deb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=F4dQRpG-GgUDkkGoPlYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Some mailbox controllers can complete a transaction entirely within
the calling context, without going through the queued TX state
machine or a TX-done interrupt. Add a synchronous send path so their
clients can request one and wait for the result directly.

Controllers advertise support via the new send_data_sync() op and
clients opt in by setting tx_sync when requesting the channel.

Channels bound this way must not call mbox_chan_txdone() or
mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
reject them, since only mbox_send_message_sync() is a valid
transmit path. The client remains responsible for serializing calls
to mbox_send_message_sync() against mbox_free_channel().

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/mailbox/mailbox.c          | 72 ++++++++++++++++++++++++++++++++++++--
 include/linux/mailbox_client.h     |  3 ++
 include/linux/mailbox_controller.h | 10 ++++++
 3 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index efacd24a085d..c640b19de608 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -166,6 +166,12 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
  */
 void mbox_chan_txdone(struct mbox_chan *chan, int r)
 {
+	if (unlikely(chan->txdone_method & MBOX_TXDONE_BY_RETURN)) {
+		dev_err(chan->mbox->dev,
+			"TX-done notification on direct synchronous channel\n");
+		return;
+	}
+
 	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_IRQ))) {
 		dev_err(chan->mbox->dev,
 		       "Controller can't run the TX ticker\n");
@@ -187,6 +193,12 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
  */
 void mbox_client_txdone(struct mbox_chan *chan, int r)
 {
+	if (unlikely(chan->txdone_method & MBOX_TXDONE_BY_RETURN)) {
+		dev_err(chan->mbox->dev,
+			"TX-done notification on direct synchronous channel\n");
+		return;
+	}
+
 	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_ACK))) {
 		dev_err(chan->mbox->dev, "Client can't run the TX ticker\n");
 		return;
@@ -278,6 +290,9 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
+	if (chan->txdone_method & MBOX_TXDONE_BY_RETURN)
+		return -EOPNOTSUPP;
+
 	t = add_to_rbuf(chan, mssg);
 	if (t < 0) {
 		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
@@ -308,6 +323,43 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 }
 EXPORT_SYMBOL_GPL(mbox_send_message);
 
+/**
+ * mbox_send_message_sync - Send data and wait for transaction completion
+ * @chan: Mailbox channel assigned to this client
+ * @mssg: Client specific message typecasted
+ *
+ * For a channel bound with tx_sync, ask the controller to transmit @mssg and
+ * only return on completion. This function may sleep and must not be called
+ * from atomic context. @mssg must remain valid until this function returns.
+ *
+ * The direct synchronous path does not queue @mssg, does not use active_req,
+ * and does not use a TX-done notification. The client must serialize this
+ * function against mbox_free_channel().
+ *
+ * Return: 0 on success or a negative error code.
+ */
+int mbox_send_message_sync(struct mbox_chan *chan, void *mssg)
+{
+	int ret;
+
+	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
+		return -EINVAL;
+
+	if (!(chan->txdone_method & MBOX_TXDONE_BY_RETURN))
+		return -EOPNOTSUPP;
+
+	if (chan->cl->tx_prepare)
+		chan->cl->tx_prepare(chan->cl, mssg);
+	/* Try to submit a message to the MBOX controller synchonously */
+	ret = chan->mbox->ops->send_data_sync(chan, mssg);
+
+	if (chan->cl->tx_done)
+		chan->cl->tx_done(chan->cl, mssg, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mbox_send_message_sync);
+
 /**
  * mbox_flush - flush a mailbox channel
  * @chan: mailbox channel to flush
@@ -326,8 +378,11 @@ int mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 {
 	int ret;
 
+	if (chan->txdone_method & MBOX_TXDONE_BY_RETURN)
+		return -EOPNOTSUPP;
+
 	if (!chan->mbox->ops->flush)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	ret = chan->mbox->ops->flush(chan, timeout);
 	if (ret < 0)
@@ -343,7 +398,9 @@ static void mbox_clean_and_put_channel(struct mbox_chan *chan)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
 		chan->active_req = MBOX_NO_MSG;
-		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
+		if (chan->txdone_method & MBOX_TXDONE_BY_RETURN)
+			chan->txdone_method &= ~MBOX_TXDONE_BY_RETURN;
+		else if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
 			chan->txdone_method = MBOX_TXDONE_BY_POLL;
 	}
 
@@ -355,6 +412,14 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	struct device *dev = cl->dev;
 	int ret;
 
+	if (cl->tx_sync) {
+		if (!chan->mbox->ops->send_data_sync)
+			return -EOPNOTSUPP;
+
+		if (cl->tx_block || cl->tx_tout || cl->knows_txdone)
+			return -EINVAL;
+	}
+
 	if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
 		dev_err(dev, "%s: mailbox not free\n", __func__);
 		return -EBUSY;
@@ -380,6 +445,9 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 		}
 	}
 
+	if (cl->tx_sync)
+		chan->txdone_method |= MBOX_TXDONE_BY_RETURN;
+
 	return 0;
 }
 
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index e5997120f45c..32b1d5ad3bfa 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -21,6 +21,7 @@ struct mbox_chan;
  * @knows_txdone:	If the client could run the TX state machine. Usually
  *			if the client receives some ACK packet for transmission.
  *			Unused if the controller already has TX_Done/RTR IRQ.
+ * @tx_sync:		Bind the channel for mbox_send_message_sync().
  * @rx_callback:	Atomic callback to provide client the data received
  * @tx_prepare: 	Atomic callback to ask client to prepare the payload
  *			before initiating the transmission if required.
@@ -31,6 +32,7 @@ struct mbox_client {
 	bool tx_block;
 	unsigned long tx_tout;
 	bool knows_txdone;
+	bool tx_sync;
 
 	void (*rx_callback)(struct mbox_client *cl, void *mssg);
 	void (*tx_prepare)(struct mbox_client *cl, void *mssg);
@@ -42,6 +44,7 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name);
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index);
 int mbox_send_message(struct mbox_chan *chan, void *mssg);
+int mbox_send_message_sync(struct mbox_chan *chan, void *mssg);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 26a238a6f941..c7dc098324ef 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -18,6 +18,7 @@ struct mbox_chan;
 #define MBOX_TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
 #define MBOX_TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
 #define MBOX_TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
+#define MBOX_TXDONE_BY_RETURN	BIT(3) /* TX completes by function return */
 
 /**
  * struct mbox_chan_ops - methods to control mailbox channels
@@ -28,6 +29,14 @@ struct mbox_chan;
  *		transmission of data is reported by the controller via
  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
  *		sleep.
+ * @send_data_sync: The API asks the MBOX controller driver, in non-atomic
+ *		context, to transmit a message on the bus and wait for the
+ *		transaction to complete. It returns 0 if the transaction
+ *		completed successfully or a negative error code otherwise.
+ *		The controller must not call mbox_chan_txdone() or
+ *		mbox_client_txdone() for this operation. Concurrent calls for one
+ *		controller must support them, serialize them internally, or
+ *		return -EBUSY for a conflicting transaction.
  * @flush:	Called when a client requests transmissions to be blocking but
  *		the context doesn't allow sleeping. Typically the controller
  *		will implement a busy loop waiting for the data to flush out.
@@ -53,6 +62,7 @@ struct mbox_chan;
  */
 struct mbox_chan_ops {
 	int (*send_data)(struct mbox_chan *chan, void *data);
+	int (*send_data_sync)(struct mbox_chan *chan, void *data);
 	int (*flush)(struct mbox_chan *chan, unsigned long timeout);
 	int (*startup)(struct mbox_chan *chan);
 	void (*shutdown)(struct mbox_chan *chan);

-- 
2.34.1

