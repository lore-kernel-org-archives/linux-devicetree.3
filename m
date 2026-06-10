Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6DF3BBFC1
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126136; cv=none; b=eQbbx3ZftmclbvsqdkvhyFb+l/lG3C+YQf/22wfcBsyzocsdXd2Ue1YKr2sjsJqIAl9akE5CIa1ph/8FVk3QU72rZV/BTBVdaa1/xAzaYRxO1Caa5fxLoxP02ZJw201IiSs5mh1xy5JG7I2SU0KOZdfj5qc4nB0DYA51mgiBuYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126136; c=relaxed/simple;
	bh=TZkwQKKqCZk3U8kl+d9mczM+m16/GBJEcUQmtDmKhLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fVVqM90+jengT8+6eIajzLhqrc24iSNlNqGNM2igr7y6Od3EsJDXzrfOSFurAtPTyIuHGI5rdEpKqRkvMn3E3qdf3KnOWvxANdBykaTVEKuQNfq/BI7Bu9sUHdkjJXeJqPyWH2It/bR5dombrJewpC0uKHx6HBC3zA8jEykUSFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFjI0D3Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pz3EzTym; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFjI0D3Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pz3EzTym"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AJYRiM2471323
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CK4Klk07/k4jSgiSHXB7ww53KV5gcUSDtrYkPkbQJw8=; b=DFjI0D3YeJCzsyuV
	YDJ/oScxBxVsKNCeSqlVvYtmQ+rt+tdPDz8RpeU6TSfQBG+mVbttxjgOF4y2MBo8
	9YSzZmhR4tP/g+Pwhsd+Uq2AVQsfK+k8yB15R9mGz3NVdBybXHSCTi50BVoe4/uK
	DbvGAHXWIPO6EFeQ+aEqBN5MAm0w7RSYmaW3UkwpoNHvOBMrUXQvd7fa0htfzpLB
	iU6cmAT/TLaRl3k6oOO56DwA68fjJjWU98pDcC/40Pr72cuk27ZvqM3G8TjWkdm9
	0yhu1Cfvidcu7AtMbZJLPwiKPDHdl3sKKOUESmfn/EWJ0gBdpLBNnYg2e9ZPQXO8
	fmUb1w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u8c6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c857ebbb0easo124273a12.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781126133; x=1781730933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CK4Klk07/k4jSgiSHXB7ww53KV5gcUSDtrYkPkbQJw8=;
        b=Pz3EzTymz3/Ry2vZhbRn5/yw+ioEpU0iNhQop7vZLgozZzImVv8ROAiSRIFtJJcMRF
         x6JHmpqwimUm1WP1adUA4uDnTRJfn0CYJBB7nKnLLmakDCFxEoCoYdxdDtsDMkBbkRJ5
         YqEIsPQNb5bO2OrlglBcPyf5bffBhktgoQqK5myqIUdXDWktP5qD1zvlDKPVr6MJjIvh
         +9Ml6CoUB1AMCih9rpGN1pXBaDl0suAyb4yui48DuDEGet6EgRxg7zdw1rJxyPNIutFv
         S5+W9LOL696rJ9q37O9ZDzjgJqmMsLeCupiaMOnRc7C4zTip3MXseDcuHFhTB0nqucAg
         YyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126133; x=1781730933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CK4Klk07/k4jSgiSHXB7ww53KV5gcUSDtrYkPkbQJw8=;
        b=jpBODwsIHlDSxx/SPPQvdTWVHYYXV5pNYlx/SEvLJp3wrLDis7dRDUew6Nl7yI6Ma/
         yvIJNeIBif4vomFLTYsmaX22VfY85DlyzrCBk/h9eUftfhMbZii2s4C49kMDw2K2Kt8S
         QSgRZiQjOiAroqFwM+a1cGtfFbiSflJ0OisSOfprN6KWCK6k5sB+7YoSrZO0zEcr2R33
         pAx82Up9qO6f/42KeCiq4al0hpwP+AFFgybw62/DihIt/g5KyAXFXWPuFRvaV/QxBJLy
         /3JPUtJWOcPV48e7h4L1FVtiytltquQtoHp1uYWnEeRD1MXikZ9PGa0+c84RrJ4VNrF5
         uJmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iRWWaXBlOySzAbYBZjuj1xIz5wYW5sZpb6y0e9llOWqrLuqz1PHaLLeWtPinOOI/hfIIW7cD2gmTF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywicwn22jhtdx8A+dzzm1rzAWJ53RKpKBCfLuJ5NfDdHfAfS/OF
	SKjzBmHmtynN2nfimF1nPMaxCUjo3GkiyEMWi6rf/OgPUPR7Gqn0EyaUeJjUb/BYEhgExM/+4qD
	D8/Aw0N1GBOxs9hFZm9KuZD7CqdB1rm8Tx4jVl1N+Srw7wSIk/kQJbEUKBTWaaron
X-Gm-Gg: Acq92OEqkeg2roLwo0WoTh7Av+/pXl8FULAixMZPrQNcv4LyNB2FcSTi0PJwejgQewA
	/B+95CCkoYoXckTQhGaLzaK0zFxqkHGSCAIl20mSK9SDQujoxwNCS2RoMDmsMDehTbGblmiwy4N
	zBAhhpttOnIWyCk2Lx8cWp1fA12ogRVF0HqY7MpjdXm6SKbcDX7V2TjqmluCYPXQ7CFhJ6qK82p
	+to9/bI69/Ey+KD6GeTUL+xm5EIUJEEIsaHVMdqyJIaXsJCnjpGxyNzwjHrng+s5fNS+QlmZO2v
	l/6LSFjk0oKl8fHS6rkNOG55i+3PqG6Ka3WHVBk7ahGBF8DYmz/Z6P0cDF0/y/6YufbvIKjnLDV
	ZQ0VMfvLdLDIxH8ex13ycYE2V8NUz9BlOFjOAoczaKNQk6zfNv/H2g+f+DA==
X-Received: by 2002:a17:90b:3804:b0:373:302d:3ce6 with SMTP id 98e67ed59e1d1-3776a6cc810mr315525a91.8.1781126133069;
        Wed, 10 Jun 2026 14:15:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3804:b0:373:302d:3ce6 with SMTP id 98e67ed59e1d1-3776a6cc810mr315503a91.8.1781126132511;
        Wed, 10 Jun 2026 14:15:32 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d01cc6sm309490a91.11.2026.06.10.14.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:15:32 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 02:44:59 +0530
Subject: [PATCH 4/4] drm/bridge: lontium-lt9611c: Add DSI port selection
 via DT property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-lt9611-b4-send-v1-4-42abbcd3bb1e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfX2BL1Bc6d+ebP
 UbSOAYmuqnjIOGMx3Nj0Dy9jqTyRdVvGQ5nlI7R8a+VoMoveskuGd4iGrr5pItZC/bHGLY8I+XF
 NbKlA+kT3KKoswjYu94X9YOl1zqHqOI=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a29d3f6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Xheu9sz8Ka-PZ7GlfuwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfX7x4bOAUQWbn+
 BhNZsvDOk/rj1naWCsX9zrQVdacRYIC1sBqBdZGQIOI+9SZnDVyjIPu7VzrQLzx/gW89XJB8rDL
 BBhsKmJHZ9yMoa2clSHbfrL1l/NGGwp9kR0MtH1t2Carfk//vVMk2j+tviYAnUdtKvwtJG2LL0s
 EPvP3gVhF2cqfBjYD+AdNOdmmDa8aoRVcrmMVNgYU4ulJeGmLcN3dxNlXNNTUoVvZ/X8WwI8faC
 SfdEDwyKjz7Sim0baRVJKzFtKeee/vveOg8t/64cAxOFkLpjjmgAArJqP/jSbUhG22fra7dLvZA
 gf569Hp8pprpwAChOAImV8DT25pDnEyl3x3Hg5J01iquribVnramy2cz8o1Btm0UmBbBFcrGYTa
 17zmOiLAzMH4bmlF//w46zMY7dIPq3iqoVHEHWdr6JK+y3rgwBeEKISAv8D1agYQtQ/wcsvFk1E
 QDXf8VXmom+c0koIACg==
X-Proofpoint-GUID: leX6igzJrmhmMc1Fl9FjTnYU8v-JkYUT
X-Proofpoint-ORIG-GUID: leX6igzJrmhmMc1Fl9FjTnYU8v-JkYUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606100204

Some board designs connect only DSI port B, or both DSI ports A and B,
to the LT9611C. Add support for a 'lontium,port-select' DT property that
allows the board DTS to specify which DSI port(s) the chip should use:

  0 = PORT_SELECT_A  (default, single DSI port A)
  1 = PORT_SELECT_B  (single DSI port B)
  2 = PORT_SELECT_AB (dual DSI ports A+B)

When the property is absent the driver defaults to PORT_SELECT_A (0),
preserving backward compatibility with existing DTS files.

The selected port is programmed into the chip via lt9611c_select_port()
during probe, after the chip ID has been verified.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611c.c | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
index fe51f4978546..5d67bb7391fb 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611c.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
@@ -41,6 +41,12 @@ enum lt9611_chip_type {
 	CHIP_LT9611UXD,
 };
 
+enum lt9611c_PORT_SELECT {
+	PORT_SELECT_A  = 0,
+	PORT_SELECT_B  = 1,
+	PORT_SELECT_AB = 2,
+};
+
 struct lt9611c {
 	struct device *dev;
 	struct i2c_client *client;
@@ -60,6 +66,8 @@ struct lt9611c {
 	enum lt9611_chip_type chip_type;
 	 /* HDMI cable connection status */
 	bool hdmi_connected;
+	/* Selected DSI port configuration */
+	int selected_port;
 };
 
 DECLARE_CRC8_TABLE(lt9611c_crc8_table);
@@ -115,6 +123,34 @@ static int lt9611c_read_write_flow(struct lt9611c *lt9611c, u8 *params,
 				return_count);
 }
 
+static int lt9611c_select_port(struct lt9611c *lt9611c, int port_select)
+{
+	int ret;
+	u8 set_port_select_cmd[6] = {0x57, 0x4d, 0x31, 0x3a, 0x01, 0xc0};
+	u8 set_port_select_ret[5];
+
+	if (port_select == PORT_SELECT_B) {
+		set_port_select_cmd[5] = 0x40;
+	} else if (port_select == PORT_SELECT_AB) {
+		set_port_select_cmd[4] = 0x02;
+		set_port_select_cmd[5] = 0xd0;
+	} else if (port_select != PORT_SELECT_A) {
+		return -EINVAL;
+	}
+
+	/* MCU must be running (0xe0ee=0x00) for lt9611c_read_write_flow */
+	guard(mutex)(&lt9611c->ocm_lock);
+
+	ret = lt9611c_read_write_flow(lt9611c, set_port_select_cmd,
+			ARRAY_SIZE(set_port_select_cmd),
+			set_port_select_ret,
+			ARRAY_SIZE(set_port_select_ret));
+	if (ret < 0 || set_port_select_ret[4] == 0)
+		return ret < 0 ? ret : -EIO;
+
+	return 0;
+}
+
 static void lt9611c_config_parameters(struct lt9611c *lt9611c)
 {
 	const struct reg_sequence seq_write_paras[] = {
@@ -924,6 +960,10 @@ static int lt9611c_parse_dt(struct device *dev,
 
 	lt9611c->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
 
+	if (of_property_read_u32(dev->of_node, "lontium,port-select",
+				 &lt9611c->selected_port))
+		lt9611c->selected_port = 0;
+
 	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611c->bridge.next_bridge);
 }
 
@@ -1070,6 +1110,10 @@ static int lt9611c_probe(struct i2c_client *client)
 
 	lt9611c_reset(lt9611c);
 
+	ret = lt9611c_select_port(lt9611c, lt9611c->selected_port);
+	if (ret < 0)
+		dev_err(lt9611c->dev, "failed to select port %d\n", lt9611c->selected_port);
+
 	lt9611c_lock(lt9611c);
 
 	ret = lt9611c_read_chipid(lt9611c);

-- 
2.34.1

