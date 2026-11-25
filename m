Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565227;
	b=Sh8UgmzKwMpHwxSDGXyTvjuNWFoVPLqos97+oY1pbAA/TMpYNa8jpXUtJfRbg36SGcmA
	 TYnKFCE0HT3E5aQwvSFENW5F3UhWJcKn0ON8eqMUGIWsJBAEW+57up5AIhPfJnYIWKm0a
	 qC9WaEF7igCNJ4rqap+LHoUjMMLD/OZESUfL6wySLS1T9L+v37W8r7skWfSrt77k8pyxG
	 3OTb4JC5GBE3F42ntnZotI/wpFjnYHVy97PbczMwWatmCVzMPmIhDMCO5Y/SFd3RxQstw
	 kVSwL2nGkqUOL1gSuquxCJBu+R+vlVF5iIdvSS9tOCoWImiFzexoyyz7vzg7BNnt/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YCNZoUZm4GBeMsriz4yFo0wE9eJVtGfqSHsFxrSTkGw=;
	b=jvYHxc8HSRcZClJHpnxxBjG7e5y8p+LAMlMTwTP0r0P+cqXNqmDkc1J8zjO+tkg46AnX
	 I9C/Tqm3YeO0MNnZqvgB8SIrLYbe0AEGKS1MEJYBSC+PwCqrK5nY6zHy0mGvbEUxoxWKz
	 Uaf3Qnv8cee9z0v/k835tInleoTnc6MavY9OlDIMfgmJZa8/6S41LfXtFQKbmJFViee6i
	 VPQNI00wUZueWXQiFCs2inQSWXku47R488EETOmixrPmW+hZO22gLfD/r0zO5hEpxIUS8
	 tuN7DaHYUbiADSxYHvhCr+8Z082/vO064sYxPtj+pFuFrcK6lzd0to5iP3tDfb4VbwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9fQEbk3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlvgTP54;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC424606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC424606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9fQEbk3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlvgTP54
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AONYGIQ2291715
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCNZoUZm4GBeMsriz4yFo0wE9eJVtGfqSHsFxrSTkGw=; b=F9fQEbk3KbG3tw1Q
	5XBc22fQP0YyyDnUmuVn4NzHCKmt2loxjKqi7l+X5T2y7kMZeI/hy1z48HeBfI2X
	ru4cwnAheuGQz1tmTXXhQyyT4NvhsBOpZjPJk2I+NTV07Rz2xOCKNvP9gLvh/S1E
	dQ+F5hqasXiGDWUsJ79Ekw/FBv68lv7Yb0YVerSMt0eHDH4N4Tv+7VEss9Hckv9W
	WW0i06bUDzF9OdyM5kXEOcZwEzVbN/aPXMAjbzRo18YTqtiIJNYqxKWflm/lcKLx
	6Kx1QfD40n7x3uy9pdu9jKnfB9T4uo6tRd8QUopxqnqX3r/ck2FUVPMnwCYU1QLz
	sjze/g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc282yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:07:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so8047805eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795565225; x=1796170025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCNZoUZm4GBeMsriz4yFo0wE9eJVtGfqSHsFxrSTkGw=;
        b=IlvgTP54mashVbmRYU0moO4QEhChNeElUmxADRQF2CaiGw9ohO2RgEwXL4N0+kio3m
         wF/yyb44FAouQzQ6r+MYE4jGb5RrrGT1mcFG+qvwzQiJqY37dsohqUiS5+UZPKUPMk2V
         3vC5pjoXWx/nts+rbjNLmMwqUrpuUVlJ1kiB1vGLII/sj46LOqDsW/vgvhHU6YU6FIcV
         bcSkQY8RuuZSKiNpSN9cmvuQglKNBW/vjvBr6sqXagswApLT6/tg9Wj2mFVj+OiOfyXr
         5BG1gzQqS/OXWodsN56wmPBHtiAk+YaQ1eRdSlTv9KYZqEMEuJoNi77cvC0ILei4FXIT
         GxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565225; x=1796170025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCNZoUZm4GBeMsriz4yFo0wE9eJVtGfqSHsFxrSTkGw=;
        b=FZMYXs854q+GrO5gNmo+0nWNdhSpV68lieWb2K6kDNi4Ac4lmN7dQXRK81c5O5EcTs
         3a++CD7U5o7AlgTwl3K5qW/xIB7xJBMTzNs8QYOxk9XNUlqlbJm5hm9prh5bV2tEbZag
         0Vo9tPAqYU0ttgckKADr4oy9cjL8J6BfVpR6JY7BLsYjJ6XAyWIxMnvPiJISgvemh2zN
         +la3FLR+aysPhc3q6B52LPVPIVlqgklQcCEdyPB/kmDLw6/w/hxoUVJfGJVrDGr4ejbF
         moWnN3y3ZXf91RgrJ+va1PTXsut4OTTaI8CqVSfdRGqxerWro3mgzt5hFYrlVsCgWNev
         5HoA==
X-Forwarded-Encrypted: i=1; AL+hErHd2hv7elChfxZ3pSHQOxuWZaKcdA3o0dfW/R6d3fneOQ2VvbnT+JeAg+6e0J/UEFZfhSrllDAaYLjh@vger.kernel.org
X-Gm-Message-State: APuU4Z/TLsPeVpvkvsx4hAvSw6tgzJARzTVOqpgbhnZaV6yA/oq7+RW3
	SLMo3aXJi2InwWeq3w4LChZ3T64UyVEcdFb1PxwlVUukv9G4c7XmWoJImGLwh+2VaFwOBqVz5Ja
	KLC+/wSBrmHNs6nIrOYNuoEVv5OK+Ziur2GO+b3oVTWeGZPGJXh2j2xkj60GSBz0B
X-Gm-Gg: AZFdTZePSpXZ4Q0gsYcYPV0RzPimWFRSU6Y/5tUQLUxQNV2NZDDVFzEiGRa21mIRp8G
	5loD5sWjf6peLx1yYFOf7tQh9Et80Nja6/TmfiSP8Yo02XFpfnhn3BWfC6Cmawh6BdZmAs254q/
	vocbjZo5FATpnB+kScq7yPj6BnfvU1A/Yjm+e5v8RcAEQGnbYIzu7ZOgLW0DY98mnAYulFyq+zL
	6Gb881Qy83cp8zcjKT10p+tvGS4c+aRsolLF6pynXYNL+PGQzko5nAET7j0gK1+Ew2g4eeP5sU9
	43xKQ3mAHRde8b5R2c7nuBVBVGIcNQUIaP4AWK4wGlkh3Xmu3Educj8fg+gVVHlcGEmu0MxGhUe
	08qiqRWv9n2CD3zV+0+/xO/usGWEWWkl1JypZ3z5LoIuvh/dtAL8mXb7c9A==
X-Received: by 2002:a05:7301:1402:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-3856fe564admr18926367eec.22.1795565224465;
        Tue, 24 Nov 2026 16:07:04 -0800 (PST)
X-Received: by 2002:a05:7301:1402:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-3856fe564admr18926303eec.22.1795565223569;
        Tue, 24 Nov 2026 16:07:03 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm47494708eec.23.2026.11.24.16.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:07:03 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 05:36:43 +0530
Subject: [PATCH 3/4] misc: fastrpc: query the dsp capabilities during probe
 time
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
Message-Id: <20261125-fastrpc-hpass-support-v1-3-cb1d46b29e3b@oss.qualcomm.com>
References: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
In-Reply-To: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b0626a9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jtXnty-gg5gQuGKUqicA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 3wqnGnisck3vZAn4ksvaXWZCI4_kLUtH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX+hQM4l8Ipg8N
 R5IdN+OKMSq0KVmCcpkk0zeQ5qxMVpKE6lGYxFz6Qkcdc2N8pelhtwjsEYAzrUoU04OR2rFqZTC
 fdifreguNFvCn3v3XfJmW9WxagWffxJ4jhdUU4phFFTVgearpaIhQDOkWTFMhKRgwU1GqDPP0Vv
 fuO1n8QAiVakT+y/pHXIdJlkiB6EjSruKCmcJgYJVMhtKx6vjpAjmLfIQ1DcYPnk7dMN6SqL703
 GBEz0QO3bD2iMNeWjd0ctuPQpJz8Mu0hr/PGnAvGCFP1OUcxpEHixUcS5IaIOrqOYtW/314OFvj
 wzCiPlf7vUsoxZLIYhRA8cZvzwYEBreSPzoGKkjIhQnn4/hMJ9HhBu3xacJr+XU+bkt3m9GATLe
 F+U15C4lTbFpvcmlx8b30OqFb6vX9FMjoFV7Y8qIk3IgiQ+yYFw/KxRaq0GGcOSn9OGLQ8DocWV
 1N/fiEL6NDPATKazlzQ==
X-Proofpoint-ORIG-GUID: 3wqnGnisck3vZAn4ksvaXWZCI4_kLUtH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX+Pt7Oc0nnZIL
 1QqIITkB0HlecUDNW8VctRepBp3WugbU9AnwMMjOLsgBuFLeM73uHDmpMgc39HM+nmwf0HEtS2k
 QJRSO/2jDMPQDfOmDpf2ODqu1pSvtuA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250000

An HPASS domain can load either an audio firmware image or a compute
firmware image, and only a compute image exposes an unsigned PD node
in addition to the signed one. Which image is loaded is only knowable
by querying the DSP's capability attributes, and the driver needs
that answer before it can decide which /dev/fastrpc-* device nodes to
create. Today the query happens lazily on the first
FASTRPC_IOCTL_GET_DSP_INFO call from userspace, well after the device
nodes have already been created from the domain id alone.

Move the query to probe time, before the device nodes are registered,
so the set of nodes created reflects the DSP's actual capabilities.

A synchronous query in fastrpc_rpmsg_probe() would work but
fastrpc_internal_invoke() can block for up to 10 seconds waiting on
the DSP, and a target can have several DSP domains probing
concurrently, so a single slow or silent domain would delay bring-up
of the rest. Instead, run the query on a per-channel high-priority
ordered workqueue (WQ_HIGHPRI | WQ_MEM_RECLAIM) so that probe()
returns immediately, and register the device nodes from that work
item once the query completes or times out.

fastrpc_rpmsg_remove() cancels the pending work and destroys the
per-channel workqueue before tearing down the rest of the channel
state. The temporary client used to drive the query is linked into
cctx->users for the duration of the invoke so that a concurrent
channel removal aborts it via fastrpc_notify_users() instead of
blocking on the full invoke timeout.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 225 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 177 insertions(+), 48 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c515097c3d3b..59ef755feeaf 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -338,6 +338,10 @@ struct fastrpc_channel_ctx {
 	atomic_t ctx_seq;
 	u64 dma_mask;
 	const struct fastrpc_soc_data *soc_data;
+	/* Per-channel workqueue for the probe-time DSP capability query */
+	struct workqueue_struct *cap_wq;
+	struct work_struct cap_query_work;
+	char domain[8];
 };
 
 struct fastrpc_device {
@@ -2704,6 +2708,159 @@ static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
 				  cctx->vmperms, cctx->vmcount);
 }
 
+static int fastrpc_register_devices(struct fastrpc_channel_ctx *cctx,
+				    struct rpmsg_device *rpdev)
+{
+	struct device *rdev = &rpdev->dev;
+	int err, i;
+
+	switch (cctx->domain_id) {
+	case ADSP_DOMAIN_ID:
+	case MDSP_DOMAIN_ID:
+	case SDSP_DOMAIN_ID:
+	case HPASS_DOMAIN_ID:
+		cctx->unsigned_support = false;
+		err = fastrpc_device_register(rdev, cctx, cctx->secure, cctx->domain);
+		if (err)
+			goto err_depopulate;
+		break;
+	case CDSP_DOMAIN_ID:
+	case GDSP_DOMAIN_ID:
+		cctx->unsigned_support = true;
+		err = fastrpc_device_register(rdev, cctx, true, cctx->domain);
+		if (err)
+			goto err_depopulate;
+		err = fastrpc_device_register(rdev, cctx, false, cctx->domain);
+		if (err) {
+			misc_deregister(&cctx->secure_fdevice->miscdev);
+			cctx->secure_fdevice = NULL;
+			goto err_depopulate;
+		}
+		break;
+	default:
+		err = -EINVAL;
+		goto err_depopulate;
+	}
+
+	/* Duplicate the last session so multiple processes can share
+	 * the same compute bank.
+	 */
+	if (cctx->domain_id == ADSP_DOMAIN_ID && cctx->sesscount > 0) {
+		struct fastrpc_session_ctx *last_sess;
+		struct fastrpc_session_ctx *dup_sess;
+		unsigned long flags;
+
+		spin_lock_irqsave(&cctx->lock, flags);
+		last_sess = &cctx->session[cctx->sesscount - 1];
+		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
+			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
+				break;
+			dup_sess = &cctx->session[cctx->sesscount++];
+			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
+		}
+		spin_unlock_irqrestore(&cctx->lock, flags);
+	}
+
+	return 0;
+
+err_depopulate:
+	fastrpc_cb_devices_destroy(rpdev);
+	return err;
+}
+
+static void fastrpc_cap_query_work(struct work_struct *work)
+{
+	struct fastrpc_channel_ctx *cctx =
+		container_of(work, struct fastrpc_channel_ctx, cap_query_work);
+	struct rpmsg_device *rpdev = cctx->rpdev;
+	struct device *rdev = &rpdev->dev;
+	u32 *dsp_attributes;
+	struct fastrpc_user *fl;
+	unsigned long flags;
+	int err;
+
+	fl = kzalloc_obj(*fl);
+	if (!fl)
+		goto register_devices;
+
+	spin_lock_init(&fl->lock);
+	mutex_init(&fl->mutex);
+	INIT_LIST_HEAD(&fl->pending);
+	INIT_LIST_HEAD(&fl->maps);
+	INIT_LIST_HEAD(&fl->mmaps);
+	INIT_LIST_HEAD(&fl->user);
+	fl->cctx = cctx;
+	fl->pd = ROOT_PD;
+	kref_init(&fl->refcount);
+	fastrpc_channel_ctx_get(cctx);
+
+	fl->sctx = fastrpc_session_alloc(fl);
+	if (!fl->sctx) {
+		dev_warn(rdev, "no session for capability query, skipping\n");
+		fastrpc_user_put(fl);
+		goto register_devices;
+	}
+
+	dsp_attributes = kzalloc_objs(*dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
+	if (!dsp_attributes)
+		goto err_cleanup_register;
+
+	/* Linked into cctx->users so fastrpc_rpmsg_remove() can abort us
+	 * via fastrpc_notify_users() instead of waiting out the timeout.
+	 */
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!cctx->rpdev) {
+		spin_unlock_irqrestore(&cctx->lock, flags);
+		goto err_cleanup_noreg;
+	}
+	list_add_tail(&fl->user, &cctx->users);
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
+	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
+
+	spin_lock_irqsave(&cctx->lock, flags);
+	list_del(&fl->user);
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
+	if (err == -EPIPE) {
+		/* Channel is going away; remove() will tear it down. */
+		goto err_cleanup_noreg;
+	}
+
+	if (!err) {
+		spin_lock_irqsave(&cctx->lock, flags);
+		memcpy(cctx->dsp_attributes, dsp_attributes,
+		       FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
+		cctx->valid_attributes = true;
+		spin_unlock_irqrestore(&cctx->lock, flags);
+		dev_dbg(rdev, "DSP capabilities cached at probe time\n");
+	} else if (err == DSP_UNSUPPORTED_API) {
+		dev_info(rdev, "DSP does not support capability query\n");
+	} else {
+		dev_warn(rdev,
+			 "probe-time capability query failed (%d), will retry on demand\n",
+			 err);
+	}
+
+err_cleanup_register:
+	kfree(dsp_attributes);
+	fastrpc_session_free(cctx, fl->sctx);
+	fl->sctx = NULL;
+	fastrpc_user_put(fl);
+	goto register_devices;
+
+err_cleanup_noreg:
+	kfree(dsp_attributes);
+	fastrpc_session_free(cctx, fl->sctx);
+	fl->sctx = NULL;
+	fastrpc_user_put(fl);
+	return;
+
+register_devices:
+	if (fastrpc_register_devices(cctx, rpdev))
+		dev_err(rdev, "failed to register device nodes\n");
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2761,34 +2918,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->poll_mode_supported = soc_data->poll_mode_supported ||
 		of_machine_get_match(fastrpc_poll_supported_machines);
 
-	switch (domain_id) {
-	case ADSP_DOMAIN_ID:
-	case MDSP_DOMAIN_ID:
-	case SDSP_DOMAIN_ID:
-	case HPASS_DOMAIN_ID:
-		/* Unsigned PD offloading is only supported on CDSP and GDSP */
-		data->unsigned_support = false;
-		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
-		if (err)
-			goto err_unmap_heap;
-		break;
-	case CDSP_DOMAIN_ID:
-	case GDSP_DOMAIN_ID:
-		data->unsigned_support = true;
-		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
-		err = fastrpc_device_register(rdev, data, true, domain);
-		if (err)
-			goto err_unmap_heap;
-
-		err = fastrpc_device_register(rdev, data, false, domain);
-		if (err)
-			goto err_deregister_fdev;
-		break;
-	default:
-		err = -EINVAL;
-		goto err_unmap_heap;
-	}
-
 	kref_init(&data->refcount);
 	atomic_set(&data->ctx_seq, 0);
 
@@ -2804,31 +2933,27 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 
 	err = fastrpc_cb_devices_create(rpdev);
 	if (err)
-		goto err_deregister_fdev;
-
-	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
-		struct fastrpc_session_ctx *last_sess;
-		struct fastrpc_session_ctx *dup_sess;
-		unsigned long flags;
+		goto err_unmap_heap;
 
-		spin_lock_irqsave(&data->lock, flags);
-		last_sess = &data->session[data->sesscount - 1];
-		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
-			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
-				break;
-			dup_sess = &data->session[data->sesscount++];
-			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
-		}
-		spin_unlock_irqrestore(&data->lock, flags);
+	/* Probe returns immediately; the capability query and device node
+	 * registration happen asynchronously on this channel's own queue.
+	 */
+	data->cap_wq = alloc_ordered_workqueue("fastrpc_cap_wq_%s",
+					       WQ_HIGHPRI | WQ_MEM_RECLAIM,
+					       domain);
+	if (!data->cap_wq) {
+		err = -ENOMEM;
+		goto err_destroy_cb_devices;
 	}
 
+	strscpy(data->domain, domain, sizeof(data->domain));
+	INIT_WORK(&data->cap_query_work, fastrpc_cap_query_work);
+	queue_work(data->cap_wq, &data->cap_query_work);
+
 	return 0;
 
-err_deregister_fdev:
-	if (data->fdevice)
-		misc_deregister(&data->fdevice->miscdev);
-	if (data->secure_fdevice)
-		misc_deregister(&data->secure_fdevice->miscdev);
+err_destroy_cb_devices:
+	fastrpc_cb_devices_destroy(rpdev);
 
 err_unmap_heap:
 	fastrpc_remote_heap_release(data, rpdev);
@@ -2864,6 +2989,10 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 		fastrpc_notify_users(user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
+	/* Wait for a pending capability query before tearing down cctx. */
+	cancel_work_sync(&cctx->cap_query_work);
+	destroy_workqueue(cctx->cap_wq);
+
 	if (cctx->fdevice)
 		misc_deregister(&cctx->fdevice->miscdev);
 

-- 
2.34.1

