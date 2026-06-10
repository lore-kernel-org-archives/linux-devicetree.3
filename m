Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3555D3B83EE
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126129; cv=none; b=c9H/EYj+OE1TXbOs6EeqjuC4uAKf7UCR9K34+dmxBxgef73A57yNdEHdoMD7XTUZgJ2JGToQX5Vs2PrzE1IzNOViYFnITCRkmb+iLPhSulNQeoCvREUBUSKh0zDqMevFcGGFh6B106yVeTTY1JOx0JvgulgZs8U7ezBuWNFJiQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126129; c=relaxed/simple;
	bh=jlB10Y7sudGp3PpWQriXrpxKxIF6l4euPfqwrk5OUS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsbwADYNjPCm5dHasr0YCt56QG7NE6gng00e/YLaz/NCLfVFM8XIf6u7gajngRrJwXHhlzf7wxyuSarheLXuDtY4U8YhTavazUAPsae8rPNyocd7gWfpHl81euyOKt4wwfapkZccrbr7YxQRoQv6sBI9mJXEG8In753CmUsZtgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DU9wx6Pr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAJGgs0q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DU9wx6Pr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAJGgs0q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AJYApR2570655
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WiNIoHn0tPoQszF7OPT5fMxwm/uPz62m9J+Xlh/PCo=; b=DU9wx6PrSxuJQAFd
	Pwdq5CLTdkcy0tq710HkqJYRm8Wz3WwuffLj0Vm0us6+NAe7QI4JkCIn7g77rU5+
	s/Iw4Bz95Qa/bziW0P7ucKr1+/hk/ndRIdzIleU//wWu/c7WT2XnvzTm2hqHeFIr
	99GyIrxPYyhpLwKMEOKa95kWVmrC5yGeSrVsbJ83q24ciFrNo+iYFJqB+PC67F17
	NxrloUr5uqGnxqECOoNi8GdRXfeccE1WsAt4GDecRf9c5PK/+2xNh3prfeMz0owW
	wl5BQiiqBkAz28Wk5bQYge/eO/2OnK+PXLvelOHTsy7QIDOZUJSDJo0GTXwoPC+y
	i0PCRw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6urbra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso8513281a91.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781126127; x=1781730927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WiNIoHn0tPoQszF7OPT5fMxwm/uPz62m9J+Xlh/PCo=;
        b=LAJGgs0q8CgFGoBMoBbCDvKneIcku+gjy2F6OXupnIDUjvt0EegN/o6xpuRkU0xIc9
         QvKy/5iX+Bw0JCbhHzMtVpqRXXUB8vGPndjRILHQ8qWL8xJv3wmuALGJ6Uz1h1LeuTW7
         jfJ9vzDBSktTkdKR7WEnaqXVz5C84S9FxHeHQwNt8RccuW/S0/IxS/iPqMZBKBtw0HvV
         zGKqZwfP9oobCQsBeHae40AIkonRJS/74Gr9rkYRjZKbjGE4kYRh3TOFPFOHXWRVMRIe
         MP4KeBvJrCNLDa+iirtlPhHqoSkING38QTcQUU7tnmFpVQPSehGhaFMOiltnFDKywV6s
         oKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126127; x=1781730927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0WiNIoHn0tPoQszF7OPT5fMxwm/uPz62m9J+Xlh/PCo=;
        b=P5ZZUZUshJqMRvQ2yErQbVS7YJQKPL1q1JLzX6ffW9WSnVAwbDR6w6g6psyWiyNQ90
         t4XlTDA33Z40zf3VkYDsK0u+yPYQhuvkWeGxH7Vx3L7wBXTf5ii/NUUSbFCtbXr/k4lc
         1DlS2POfT4/5IzYf6Z95c+xNxlhx0oqAE+yInJHuRygxQAX7UoCRKCPnYXFIDLm0usYM
         CRsjsGlkXWEt/Zl/8CYUl4pT+sXqWl20f7amYQI3TJj7BoLLAYADoV+wZu9AgqDYpHi2
         8dO4WBoHxCbqMV4/53y9fXHOjVE+xYVvmGaYLD87BuU4/EUKbxlJtrDQVkULAjNFVzXo
         ezNA==
X-Forwarded-Encrypted: i=1; AFNElJ+rt3gWZ+8M6dawaMg824dLGHaB/dr3v7wulQi6CXnlkWEOQg+WOHTyUc6Q5Q4DB0E8EJL2qs5+3qiz@vger.kernel.org
X-Gm-Message-State: AOJu0YyH6Nw8zkFxvb2sRVd1CKF7AjO5eaX5aaUaffoJh4MnrNkMsaaJ
	jiuCNXpleHj5+bmNZd9CR7hJuX5ifpFh9D01g+jISTv0CZyA4RNKjGqDJ8rRlYMCTftCFETQfRg
	4D14Xzg6g0WRj2o38wQQuM7A3tGiLxy/5bXxo9De/Cx2t1n9I9t+/H6g0pLOR847l
X-Gm-Gg: Acq92OEt9brLcm8+cVj/KqmRJWCJdLCoHh8IrFkTDi3BoO1tsf1rqlQ/o1Frq5iztg2
	3t85+ky0RccPLcA5fkQWN5Mni4SI6ATU2j8n49jDX1DE5eFnzc77WIvH1sfUcqQigxdaN5PsuVh
	ajj55ZuF+bWWX02ZwOxoYQiMsbGib431QZK+IFdyb1wTZo9f9j817vBMNnZ7jzXj9+0FdsjUtS/
	iJsfpOnproXIzUeI+8YUlLDJJlkgq6vCKaMOxUKixyPKftQijxRTJWfDcLUQqT1DcwJTTw5++mS
	6N7BgG3etlPk1n/NStVkEe0KebOT9lQ6yd158yEgTBZaGnrNMCiEu5/mW+O0SQ/lF0AsYMkTgGO
	SOqI+Y7FN/JUoA06/OVBREp8+DAtCx0dAxSiyWIJ34VFi07DifWNxpCFVGw==
X-Received: by 2002:a17:90b:4c41:b0:36d:b12f:613c with SMTP id 98e67ed59e1d1-37746e0873fmr847502a91.10.1781126126640;
        Wed, 10 Jun 2026 14:15:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4c41:b0:36d:b12f:613c with SMTP id 98e67ed59e1d1-37746e0873fmr847448a91.10.1781126126014;
        Wed, 10 Jun 2026 14:15:26 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d01cc6sm309490a91.11.2026.06.10.14.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:15:25 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 02:44:58 +0530
Subject: [PATCH 3/4] drm-bridge: lontium lt9611c: fixes and improvements
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-lt9611-b4-send-v1-3-42abbcd3bb1e@oss.qualcomm.com>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
In-Reply-To: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        boss@oss.qualcomm.com, qc-display-maintainer@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a29d3ef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wg3Ek5SRs51OoikjvKEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfX3awwTqNyIX2x
 EzxSsrqIS5fUQ1pbwXMqHMcY18QKvXwVTxkNv6BRS1ap99zXZKsxbswZe9kl14/puXxU3meemXB
 OapU0t73qr/aVAna7xlVCYZOEq1AvGY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfXww2yDqu+tzSm
 xGvuca7HpVX+oAypZ0Lt5KqLnAf2945ZEvnZjU8PENNwMYXe1htyzRxr4BGTg+0gRDZYxkoNFPZ
 YWTHSZlysyIzBbeaMPtvIeURyCMhQ+0IFe47oThtzb9QuzyRiiWLzeR+SCy9XRJ9UpVSyeglavR
 MhuHN1Re2VRpAz3fM3zbNJuF2OTdqTVTbGQ9/00S10X0GBTmRcGPHgoO+2DYrn/nmIErJVTy1fm
 YQCVCPTy4lELpPRAMEmn1D2RtzPKbIlyTDqSyxqzi86rsyeWiQ1cBqaMPLVfliUu63N0mRs6g5R
 z0ljXYunkqsAR8xFIUB3vGfTnXOBqllVLIYJye8HgwwWU8cqyZ6VMAlbyV4PywLad7HFyxx6Qbr
 Vl1Nebk+BKJxyrgJIpbDTOr+SfbNGvEC7bcH8iVVpYTV35bvgnVYidcj1kiZMIzgWv8fJbnzJPZ
 BBt1G0Ytxzp7Qb+S60g==
X-Proofpoint-GUID: 0yIjxP7MRfCd-4VCq7D8gGWXLLyyQjP6
X-Proofpoint-ORIG-GUID: 0yIjxP7MRfCd-4VCq7D8gGWXLLyyQjP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606100204

Remove two redundant lt9611c_reset() calls:

1. In lt9611c_bridge_atomic_pre_enable(): a reset is already performed
   during probe and resume; calling it again on every display enable
   adds ~440ms of unnecessary latency.

2. At the end of lt9611c_probe(): a reset was already performed earlier
   in probe before lt9611c_lock(). The second reset is redundant.

Also, the DRM HDMI bridge framework requires hdmi_write_hdmi_infoframe and
hdmi_clear_hdmi_infoframe callbacks for HDMI vendor-specific infoframe
(VSI) support, used for features such as HDR metadata signalling.

This patch add stub implementations that return success. Wire them into the bridge
function table.

Also, Store the chip variant enum value in the of_match_table .data field and
retrieve it via of_device_get_match_data() when probing from a DT node.
Fall back to i2c_device_id.driver_data for non-DT (e.g. ACPI) probe
paths.

This is the standard kernel pattern for passing per-compatible data
through the OF match table, and avoids relying solely on the I2C device
ID table for chip type detection when DT is available.

Populate bridge.vendor and bridge.product so the DRM HDMI framework can
report the correct manufacturer and product name in the HDMI connector
properties (visible via xrandr --prop and related sysfs entries).

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611c.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
index b0402726367e..fe51f4978546 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611c.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
@@ -622,7 +622,6 @@ static void lt9611c_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	ret = regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
 	if (ret)
 		dev_err(lt9611c->dev, "regulator bulk enable failed.\n");
-	lt9611c_reset(lt9611c);
 }
 
 static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
@@ -777,6 +776,17 @@ static int lt9611c_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 	return 0;
 }
 
+static int lt9611c_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
+					     const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
+static int lt9611c_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
+{
+	return 0;
+}
+
 static int lt9611c_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
 					      const u8 *buffer, size_t len)
 {
@@ -895,6 +905,8 @@ static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = lt9611c_hdmi_tmds_char_rate_valid,
 	.hdmi_write_avi_infoframe = lt9611c_hdmi_write_avi_infoframe,
 	.hdmi_clear_avi_infoframe = lt9611c_hdmi_clear_avi_infoframe,
+	.hdmi_write_hdmi_infoframe = lt9611c_hdmi_write_hdmi_infoframe,
+	.hdmi_clear_hdmi_infoframe = lt9611c_hdmi_clear_hdmi_infoframe,
 	.hdmi_write_audio_infoframe = lt9611c_hdmi_write_audio_infoframe,
 	.hdmi_clear_audio_infoframe = lt9611c_hdmi_clear_audio_infoframe,
 
@@ -1025,6 +1037,13 @@ static int lt9611c_probe(struct i2c_client *client)
 	lt9611c->dev = dev;
 	lt9611c->client = client;
 	lt9611c->chip_type = id->driver_data;
+
+	if (dev->of_node) {
+		lt9611c->chip_type = (uintptr_t)of_device_get_match_data(dev);
+	} else {
+		lt9611c->chip_type = id->driver_data;
+	}
+
 	ret = devm_mutex_init(dev, &lt9611c->ocm_lock);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to init mutex\n");
@@ -1111,6 +1130,9 @@ static int lt9611c_probe(struct i2c_client *client)
 			DRM_BRIDGE_OP_HDMI_AUDIO;
 	lt9611c->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
+	lt9611c->bridge.vendor = "Lontium";
+	lt9611c->bridge.product = "LT9611C";
+
 	lt9611c->bridge.hdmi_audio_dev = dev;
 	lt9611c->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611c->bridge.hdmi_audio_dai_port = 2;
@@ -1136,7 +1158,6 @@ static int lt9611c_probe(struct i2c_client *client)
 	lt9611c->hdmi_connected = false;
 	i2c_set_clientdata(client, lt9611c);
 	enable_irq(client->irq);
-	lt9611c_reset(lt9611c);
 
 	return 0;
 
@@ -1214,9 +1235,9 @@ static struct i2c_device_id lt9611c_id[] = {
 };
 
 static const struct of_device_id lt9611c_match_table[] = {
-	{ .compatible = "lontium,lt9611c" },
-	{ .compatible = "lontium,lt9611ex" },
-	{ .compatible = "lontium,lt9611uxd" },
+	{ .compatible = "lontium,lt9611c",   .data = (void *)CHIP_LT9611C   },
+	{ .compatible = "lontium,lt9611ex",  .data = (void *)CHIP_LT9611EX  },
+	{ .compatible = "lontium,lt9611uxd", .data = (void *)CHIP_LT9611UXD },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lt9611c_match_table);

-- 
2.34.1

