Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690656;
	b=v9498pcUpt/s0ClymQimlUP/9Ytk6NXtAlQxq/OaE7Lw8wHkCxoHgzQJfdo9wXwVo4sT
	 7Yd8KEt/W/6Af1k9nef/w6+SUL6eVJ5yrfbX0VdL5x59Cz+0RJvOF35eB/kev+dSvGSSK
	 Ow+UCH5Qh/uY+ro+zAawGY/AExr+4OLwRMDoWjtCgD65JzfkxOaBamorgW83bgQUJuK9Y
	 W9SbVKzdqfy3Ll0d7ANtImDdS64o5D2vX77OOp0TDcsOwXNzNt0/SAVVeLZgp/60Bic77
	 8IOa0gVqYXCcuwGofuM5mOsSZzL+WCYbQqgkcz7Z9r3tGNGSCkbD3NaXE64+pgW3CtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HwfYvEOuN+jTv/rUMPMNkv6iGYyKWL7qSbUN29b5cO0=;
	b=AEiXyK0W0P+XJ5w/qJrrZMQ8FzrSNogWnOJvVXmxRWV4iKLOe1spHD1LA3UaOTfRXzPN
	 TNI/xGYv3N3EgOVAbsz9UkKknvutCVjVHqXgxQfFzoh75GvomGs+f+JKVTldOcY8fJ5zu
	 CfvfkefNYnl/kWAEXPXQXGHnxmsgZvmopaUtJzMVfXlnSNgXq8xW5x3jDtfOf5E00Yzmu
	 GQzRPBhrCLvdF+jPJB4T6dw6KWRZeqEl8z2Hae2fpb5w+a+2Ag20eePlLw+5QtDatdr7Y
	 ZCW0/BEIjvc+HR5IZYBoFyGg2qY2+xqnHEpmP5YQF0ludqOTtX5KWxzOv6HfbSQVHXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkMjPs35;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B67606A329
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B67606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkMjPs35
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3990975f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690654; x=1796295454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwfYvEOuN+jTv/rUMPMNkv6iGYyKWL7qSbUN29b5cO0=;
        b=AkMjPs35dEIf9ZgxdEYE8ikTLbpsCu6+nLp9CQv538B4ElAWC4PA8/a1gA1ZPw/tkW
         SOLTdfM4AiGxeAFLvEP5TJqfweEOcEbvB3/qJXiCmrAaz8sigjH95HrgPV5r8mnMkafV
         U9m0P4Jv2V0v+CElxzIzmq4tMx5edAhM8LMWTVVj6tBCq6xTRbsCTydCSYtDW1Ea8OSG
         uFYBEeA020lBk7st0zfVycqNOqMshHF+LabTdJ0+Moq/+bXLCVa1ad5WdwoykB69f2Ek
         wCQuuX0RRx6H9avPCbC1ykXO1cnwmQ5JPHJ34FrLBR+Rq4b3TKoX43P7chpgJVuHAcTF
         hmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690654; x=1796295454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HwfYvEOuN+jTv/rUMPMNkv6iGYyKWL7qSbUN29b5cO0=;
        b=O8FLAFv5hnuPyWn4V154nFo4EMyR739eQC3XuH/ZqiGJ0/FRyRuIDJ2nEyEuqb1x7p
         6Dus2Xu4vXxh+P0GGGgHRQe+oBCrfHvRaNw5M1eCTOeS+OA7I4l/Dw8gF0mqYRi7RLgu
         +95icEVjTKuaYrdS0pYJdbabIOPRa/m3nn7WGVc9bErz61AKDJhW53Bzn7I8A5mzvmVf
         fCa5/+k8nKWCjOQJ3ZCoVWCtXUVH7EoNL/4YsxfSjbzMGnJQOt0seMkD1K05g48LWtTl
         YVmgfLJjrcSELHWb8gAB2nL8N+fwhBUtHMArPhg2Xn+1GKho48Pv1Ucw0P9PQqF8+jgB
         hefA==
X-Forwarded-Encrypted: i=1; AL+hErHVl1Cdff76oMXfIML4wJArfl+IYGRjY3A5+sc0xMOsWqj605KP0a6smT8SqRHi/qlmxo/T2vVtKADh@vger.kernel.org
X-Gm-Message-State: APuU4Z8PqmF8oLaVJhrQ8NxY5CLlDBplRcZJsWnucGx2jMEGPUCqk4I8
	DY+TgzIeUXZ9ZZrn0v+By40KbLD7lWX2G0HpVt+NjP9PEXBbbV8jo/oa9zdGjDbT05M=
X-Gm-Gg: AZFdTZdF8fodDjqNbKo5UjswD3/Gx0MfVzweh1QbFYnTFyLBWsZBjRquSCWcnUNzcac
	i0TDCFRih+LSyR9RT28crsRQ/RyL1U+ScvJkvssmMU8F70K2otADqnink/vej1JeJ7GevDLxoWz
	YKy7DwYEhh9Pc/VBOVU8ku8Wt9uLLl8o0B8KJ8IFEP01tH9uovh/oP9X1P75CVgoaGV975rT6mh
	k/fjR85toL0eyF8VDPYTsVKlXn70EfHJRAnVeclyiTD/q90hZGcXm1/PgXz/V2y4lHSAuv3zYdP
	7vYRq4twAhJjZ+L7Yc1S23vYFyPH4umAuQXcqHkgeFFFdn1g0A+uaI1wBD79XMya6GB8Y1g91nf
	pas6MSqIhdnyHABbFyJpnA14/v8pkO2e6nEDFh7nhaRETtT9U0h8jd8D39jqup9G9oEAbOUkypI
	/71n/GXuYvwK8beFoCdFNqCT33VgEFrvHfEPsHBDZSw/7BJwSbIsB4DlvIB2AlVwETtxK7j0IM1
	RbzUI8Zv6FmnmPtL2AHPDMy6aDlBJ6EUPqK9CVsUx1XmNt+S1HWeqj6vNe/R8slr3gzoppEytkD
	wmnQlmR1yAwamA8CCBf3oZ6U9FA4mq9dOE7+qhMPi99YlVeZ3IcFo5AFTit9Fulr8P7bPxuzYMQ
	T+GuyBfej8x96ODVLvihWdUqyeigCeY8UhmbjmSthWyQL+/zML9rnjNf1LN97n/W7ie7tPvCvuB
	quR8m3uwi4krwvT4Eq4g==
X-Received: by 2002:a05:6000:4382:b0:4ac:a772:6485 with SMTP id ffacd0b85a97d-4aca77265d4mr39737456f8f.31.1795690654538;
        Thu, 26 Nov 2026 02:57:34 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-148.globalnet.hr. [213.149.36.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm40336850f8f.44.2026.11.26.02.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:57:34 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Ziyang Huang <hzyitc@outlook.com>,
	Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/3] soc: qcom: smp2p: kick WCSS after restart when requested
Date: Thu, 26 Nov 2026 11:56:51 +0100
Message-ID: <20261126105722.188103-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126105722.188103-1-robimarko@gmail.com>
References: <20261126105722.188103-1-robimarko@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ziyang Huang <hzyitc@outlook.com>

IPQ8074 and IPQ6018 WCSS need another outbound kick after a remoteproc
restart. On IPQ8074, ath11k starts WCSS, stops it for coldboot
calibration, and then starts it again. The first start succeeds, but
the second times out waiting for the SMP2P ready indication.

The first start gets an outbound kick from qcom_smp2p_probe(). The
SMP2P driver remains bound across the restart, so this kick is not
repeated. WCSS waits for another kick before raising its inbound
slave-kernel ready bit.

When the SSR ACK feature is negotiated, qcom_smp2p_check_ssr()
resets last_value to zero before inbound entries are processed. If
slave-kernel is also zero, qcom_smp2p_notify_in() sees no change and
skips it. Kick the peer before the unchanged-value check when an
inbound entry is zero.

Limit this behavior to WCSS links with qcom,wcss-restart-kick. Other
SMP2P links do not need a kick for a zero inbound value.

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
Co-developed-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/soc/qcom/smp2p.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cf06a49149be..bf11b7d450a4 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -128,6 +128,7 @@ struct smp2p_entry {
  * @ssr_ack_enabled: SMP2P_FEATURE_SSR_ACK feature is supported and was enabled
  * @ssr_ack: current cached state of the local ack bit
  * @negotiation_done: whether negotiating finished
+ * @wcss_restart_kick: kick WCSS when an inbound entry returns to zero
  * @local_pid:	processor id of the inbound edge
  * @remote_pid:	processor id of the outbound edge
  * @ipc_regmap:	regmap for the outbound ipc
@@ -151,6 +152,7 @@ struct qcom_smp2p {
 	bool ssr_ack_enabled;
 	bool ssr_ack;
 	bool negotiation_done;
+	bool wcss_restart_kick;
 
 	unsigned local_pid;
 	unsigned remote_pid;
@@ -341,6 +343,10 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 
 		trace_smp2p_notify_in(entry, status, val);
 
+		/* Some WCSS firmware needs a kick after restarting. */
+		if (smp2p->wcss_restart_kick && val == 0)
+			qcom_smp2p_kick(smp2p);
+
 		/* No changes of this entry? */
 		if (!status)
 			continue;
@@ -681,6 +687,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	smp2p->dev = &pdev->dev;
+	smp2p->wcss_restart_kick =
+		of_property_read_bool(pdev->dev.of_node, "qcom,wcss-restart-kick");
 	INIT_LIST_HEAD(&smp2p->inbound);
 	INIT_LIST_HEAD(&smp2p->outbound);
 
-- 
2.56.1

