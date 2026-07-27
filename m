Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FABB3D34A8
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133663; cv=none; b=WY13LP0gNw4N6Wm8cecckJ77/3Ta69poj+/IsbUn59vb3rwFYSI524kAx/70cLxRdXreREGdIbWdK+a+8+FewJUqVYvStlWKUEZapEzSMruOc+atRwigWnEqJGITklzDPClyE7dKL5GjDSFLEpm593+aMQLNTdaTliAvnZt8t4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133663; c=relaxed/simple;
	bh=sO1FpG911o/q0+FZA23s+QrHwH4HNXj2acMynrLF/Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2nYf3iq11drLc9PuKzPv9Q03Qm861VKdPCTCjWvfch+4QRL1JPcpJBgyqG9DjI8bUzNhwiZpeEJhqGYjQhshs7px+W0rgepOEOl/jTcL+3wUhiAnOeaqGpF3HvBy7di7WMFHkQnwfkdJcYGKgB5yM+v+8FLBY1jiOKnEftpeSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSQRCD84; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6m2IhUp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSQRCD84";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6m2IhUp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fpV92240165
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xfuykWxXF4Nb+P2nSICWn6yH
	tRdIx1sFvsYHxC8qBoo=; b=gSQRCD84bJm4yuhowMsOhOr3LJuN7NAJo2CG4PN8
	CnsZpTo4k885CmPIVpeWtq9V/uMsmP/1CPHQ1H8sNH8V3oiaekzw8/ZfBvaPPLwR
	ZfuiNMq4kZUHP1Tm7mnbFMasX9JecyUbTEOijRfxsqTgJ8lGVlGZNd0CSojURNWz
	dw5icezPNHrHfzLnk03/XqM6Gyolsw01DLo8EaaDqmGYoBbRv/6FSLkLS/Mdgswu
	GtODgH1METmmtN81gdiM9yUk2FtSJBY22PEOl96ZMW2AgR/WXyBe/IAoyMhJ0+ZM
	eae3QtOc7lRTcCBL5+gPbBuSBWpn8wIaCCTI2oFRs1I1fA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs13fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:27:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so2696437a91.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 23:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785133658; x=1785738458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xfuykWxXF4Nb+P2nSICWn6yHtRdIx1sFvsYHxC8qBoo=;
        b=Z6m2IhUpdjSnHxAAU2Taa5RNV1oske2qcIJW3k/EaSUrtnugHdIY02tXoPYWr0raUk
         yTm34X6ZWmMcpUiU8zmJqMoqG/lvMmKzNfgYXuJaD5yXvyOEPU/okrcUmqZS/e385PQ/
         qbf5HFNVrJ0usQTDq3befzEv3TGRvrZnbIkhOwzf/ijCJH4qlWZR1WU1+O1tInPx0+G0
         okkdU2wXZhYp6oNNsASVHiHFdpGEGHLMXboBYte71L7PLIj1MQw7jvNgYYSVqf47V4sQ
         1v7C7jjBmwbyc2yFqtJy2dzAIXMIV+dTqunINc3WSZV/NWRglAYDgJq4XM9e76PNBb6j
         EzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785133658; x=1785738458;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfuykWxXF4Nb+P2nSICWn6yHtRdIx1sFvsYHxC8qBoo=;
        b=qOF7/Uea6ANxPBeJNMQ8LK1zI44k2E+gNfpz+KM2/oOPM8vf4LIWGIMKHXqUs0Mxki
         g3a08g/HeVcx582DVaE9AuDti3akhX+fUllM2FrbLf39CBx/ftYCNlZ19Hzk7YVzCXR5
         q54GIcgQ+FUZz1n8A3EWitx7K1IUhf7mIgnfioR8SDY1wJtusIqTX0hllUkVr9Rq307D
         ip8TN2YRT/cvjalZSH7ySsfOPpjz8HPDQkTTH2U+yraZdH7b2cLQBtxdMXZBnp1nkZvQ
         w50UjNm0xvQVXGVCsg0RLw4kucKxh9v/KWuG73LJ47tovLb2TBpdWu2auLLcQC2XiHHE
         1dIQ==
X-Forwarded-Encrypted: i=1; AHgh+RryY1+nPiB0/jA7w/D2GcKqYZFf6O/dxGMlRo+8GYKhXke5muuljxUmtBq2J5rNHAprkeqFXPaWcC0M@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZ5JP7jdzK/qGYGe3TarsAtpscpuxsvQ3XdtKDpsEykpEB34F
	9ZrOdouCchChvIjuIDd1g7ilZQxFl7yUDVjANi/xgtNkMgf1BUnWi2Gf46ffEZL8ivmxl2ApMF7
	nFvGfM9CpXOST+1Jq/tOrNY9bQ54tjKjmdu92z9zcr067xXbCloLT+iKLx1C1DY/V
X-Gm-Gg: AR+sD12JRNl+OJNv6vcRnEBd9EzEBxcraa35AP34Y4XgTd3TCmQC5gviTqLwg42IhRg
	u/ML2CP2K14rBgRvD4q7kwZaCriCz9rkNKIRKzBNSVslSJNOg1p4FIxmFLnttIDcfH8S22KcPS1
	3B0ShTDQDM8MHp97KsOtwSHqXm2srhv4sQmpQEi10IpV3u7psJ3pX1A/s0U4uTScrFSimhM58zv
	aLp94Fsal9kI/2HBwsT70pxbxtgLQ7x49ZygQI7emI47l3DnoauB0ohLg2vXmutN/yboI8/Fe36
	H0YKPT2xMXRr/J4+3VnB+suok4hb6fDSdKHvYomKJ5DkMNbNyUOI9fl1vfA/Boaa+js6lREkAVb
	SUKLTbLOclLkSjdKqSa3PvtMbcA==
X-Received: by 2002:a17:90b:3c8d:b0:387:e0db:bc26 with SMTP id 98e67ed59e1d1-38f297845a2mr6097868a91.38.1785133657485;
        Sun, 26 Jul 2026 23:27:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8d:b0:387:e0db:bc26 with SMTP id 98e67ed59e1d1-38f297845a2mr6097845a91.38.1785133656886;
        Sun, 26 Jul 2026 23:27:36 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm80732134c88.15.2026.07.26.23.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:27:36 -0700 (PDT)
Date: Mon, 27 Jul 2026 11:57:26 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: Add Lontium LT9609C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <amb6TsmbJeppT66p@hu-mdsor-hyd.qualcomm.com>
References: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
 <20260716-lt9611c-v7-v7-2-7553a14735fc@oss.qualcomm.com>
 <4t3bar2svwex4wojumql2t66ivtj6bsxnt7pgmygnc7og4zquh@fs7wdd4k4cjp>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4t3bar2svwex4wojumql2t66ivtj6bsxnt7pgmygnc7og4zquh@fs7wdd4k4cjp>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfXymnCvYMfTN2K
 B7aAWcvQj19EvRB2vAyJYHYemx1sZxLLFDwu9CnRyj+3BE+FDm+mkMV+/+uF7PbI6By8Zn4BTNI
 NHS1S6HhwHbj64sOoA42UJA1Ylp1qE2eesH0pS6rwCk2dtH+Pty9GnymGTabSmJ4mngH8gnEv9d
 shCNKV5EsYufvrv3qf+pDmWUx9pbGP69LoNsbHMUV+2TjP3d1AicTSdFB6rZLYIFOARaHZFWG9E
 enEnyEgzf97LmuAbNfCqOxaSKpl8tUl7tG4sOpnD6GT7jGrifdK3mjlrhK4RoCE4eYOLNCRqGhC
 0jDlwkmNUxEyW0CG1yJuJuhAE/0SVlg1YNkA9ZZ5WqDXu4KGe834JfNCp4jN/d1F5kn5yAcUv8F
 XZoS8YcHb6tUccrFx3hMyFv9tpfNMpGPHkC8dCDRA3i2KFHAa8TudqHeYspFy3GrbayzsrbAs37
 27XsoookmOT/vEyMDDQ==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a66fa5a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=G51wdyXNffBd49tQvuoA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: my-dzJNFvmt9OSs4UTGbZTP6svlEJ8o2
X-Proofpoint-GUID: my-dzJNFvmt9OSs4UTGbZTP6svlEJ8o2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfX/RdY/EDud/Y/
 QU1XcT8Q7Wcu2jt4ff4X0yHSbdNGF3NuzYS5NWydp4SFZnmdIzan4HC952ROt7jNmPBxXX2PHqf
 GC50jXCFyKwA5FPndpZkqpSGiIxQsmU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270062

On Wed, Jul 22, 2026 at 11:11:27AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 16, 2026 at 05:01:10PM +0530, mohit.dsor@oss.qualcomm.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> > 
> > LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> > mipi dsi and output hdmi, differences in hardware features:
> > - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> > - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> > - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> > 
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > Co-developed-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> >  MAINTAINERS                              |    7 +
> >  drivers/gpu/drm/bridge/Kconfig           |   18 +
> >  drivers/gpu/drm/bridge/Makefile          |    1 +
> >  drivers/gpu/drm/bridge/lontium-lt9611c.c | 1293 ++++++++++++++++++++++++++++++
> >  4 files changed, 1319 insertions(+)
> > 
> 
> > +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> > +{
> > +	struct device *dev = lt9611c->dev;
> > +	const struct firmware *fw;
> > +	u8 *buffer;
> > +	size_t total_size = FW_SIZE - 1;
> > +	u8 fw_crc;
> > +	int ret;
> > +
> > +	/* 1. load firmware */
> > +	ret = request_firmware(&fw, FW_FILE, dev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to load '%s'\n", FW_FILE);
> > +
> > +	/* 2. check size */
> > +	if (fw->size > total_size) {
> > +		dev_err(dev, "firmware too large (%zu > %zu)\n", fw->size, total_size);
> > +		ret = -EINVAL;
> > +		goto out_release_fw;
> > +	}
> > +	dev_dbg(dev, "firmware size: %zu bytes\n", fw->size);
> > +
> > +	/* 3. calculate crc8 */
> > +	buffer = kzalloc(total_size, GFP_KERNEL);
> > +	if (!buffer) {
> > +		ret = -ENOMEM;
> > +		goto out_release_fw;
> > +	}
> > +
> > +	memset(buffer, 0xff, total_size);
> > +	memcpy(buffer, fw->data, fw->size);
> 
> memcpy(buffer, fw->data, fw->size);
> memset(buffer + fw->size, 0xff, total_size - fw->size);
Will be fixed in v8.
> 
> > +
> > +	fw_crc = crc8(lt9611c_crc8_table, buffer, total_size, 0);
> > +	kfree(buffer);
> > +
> > +	dev_dbg(dev, "firmware crc: 0x%02x\n", fw_crc);
> > +	dev_dbg(dev, "starting firmware upgrade, size: %zu bytes\n", fw->size);
> 
> Merge them into two messages and maybe upgrade to dev_info().
Will be fixed in v8.
> 
> > +
> > +	/* 4. firmware upgrade */
> > +	lt9611c_config_parameters(lt9611c);
> > +	lt9611c_block_erase(lt9611c);
> > +
> > +	ret = lt9611c_write_data(lt9611c, fw, 0);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to write firmware data\n");
> > +		goto out_release_fw;
> > +	}
> > +
> > +	ret = lt9611c_write_crc(lt9611c, fw_crc, FW_SIZE - 1);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to write firmware crc\n");
> > +		goto out_release_fw;
> > +	}
> > +
> > +	/* 5. check upgrade of result */
> > +	lt9611c_reset(lt9611c);
> > +	ret = lt9611c_upgrade_result(lt9611c, fw_crc);
> > +
> > +out_release_fw:
> > +	release_firmware(fw);
> > +	return ret;
> > +}
> > +
> > +static struct lt9611c *bridge_to_lt9611c(struct drm_bridge *bridge)
> > +{
> > +	return container_of(bridge, struct lt9611c, bridge);
> > +}
> > +
> > +/*read only*/
Will be removed in v8.
> 
> obvious
> 
> > +static const struct lt9611c *bridge_to_lt9611c_const(const struct drm_bridge *bridge)
> > +{
> > +	return container_of(bridge, const struct lt9611c, bridge);
> 
> container_of_const() ?
> 
> > +}
> > +
> > +static void lt9611c_lock(struct lt9611c *lt9611c)
> > +{
> > +	mutex_lock(&lt9611c->ocm_lock);
> > +	regmap_write(lt9611c->regmap, 0xe0ee, 0x01);
> > +}
> > +
> > +static void lt9611c_unlock(struct lt9611c *lt9611c)
> > +{
> > +	regmap_write(lt9611c->regmap, 0xe0ee, 0x00);
> > +	mutex_unlock(&lt9611c->ocm_lock);
> > +}
> > +
> > +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
> > +{
> > +	struct lt9611c *lt9611c = dev_id;
> > +	struct device *dev = lt9611c->dev;
> > +	int ret;
> > +	unsigned int irq_status;
> > +	u8 cmd[5] = {0x52, 0x48, 0x31, 0x3a, 0x00};
> > +	u8 data[5];
> > +
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	ret = regmap_read(lt9611c->regmap, 0xe084, &irq_status);
> > +	if (ret) {
> > +		dev_err(dev, "failed to read irq status: %d\n", ret);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	if (!(irq_status & BIT(0)))
> > +		return IRQ_HANDLED;
> > +
> > +	msleep(100);
> 
> Why?
OK checking it, if not needed can be removed in v8.
> 
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, cmd, ARRAY_SIZE(cmd), data, ARRAY_SIZE(data));
> > +	if (ret) {
> > +		dev_err(dev, "failed to read HPD status\n");
> > +	} else {
> > +		lt9611c->hdmi_connected = (data[4] == 0x02);
> > +		dev_dbg(dev, "HDMI %s\n", lt9611c->hdmi_connected ? "connected" : "disconnected");
> > +	}
> > +
> > +	/*Clear interrupt: hardware requires two writes with delay*/
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
> > +	usleep_range(10000, 12000);
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));
> > +
> > +	schedule_work(&lt9611c->work);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +
> > +static enum drm_connector_status
> > +lt9611c_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	struct device *dev = lt9611c->dev;
> > +	int ret;
> > +	bool connected = false;
> > +	u8 cmd[5] = {0x52, 0x48, 0x31, 0x3a, 0x00};
> > +	u8 data[5];
> > +
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, cmd, ARRAY_SIZE(cmd), data, ARRAY_SIZE(data));
> > +	if (ret) {
> > +		dev_err(dev, "failed to read HPD status (err=%d)\n", ret);
> > +		connected = lt9611c->hdmi_connected;
> 
> connected = connector_status_unknown;
Will be fixed in v8.
> 
> > +	} else {
> > +		connected = (data[4] == 0x02);
> > +	}
> > +
> > +	lt9611c->hdmi_connected = connected;
> > +
> > +	return connected ? connector_status_connected :
> > +				connector_status_disconnected;
> > +}
> > +
> > +static int lt9611c_get_edid_block(void *data, u8 *buf,
> > +				  unsigned int block, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = data;
> > +	struct device *dev = lt9611c->dev;
> > +	u8 cmd[5] = {0x52, 0x48, 0x33, 0x3a, 0x00};
> > +	u8 packet[37];
> 
> I assume it's 5 + 32. (and the 32 is repeated several times below).
> #define 32. Also, it seems 5 is another magic size here, #define it too.
Will be fixed in v8.
> 
> > +	int ret, i, offset = 0;
> > +
> > +	if (len != 128)
> > +		return -EINVAL;
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	for (i = 0; i < 4; i++) {
> > +		cmd[4] = block * 4 + i;
> > +		ret = lt9611c_read_write_flow(lt9611c, cmd, ARRAY_SIZE(cmd),
> > +					      packet, ARRAY_SIZE(packet));
> > +		if (ret) {
> > +			dev_err(dev, "Failed to read EDID block %u packet %d\n",
> > +				block, i);
> > +			return ret;
> > +		}
> > +		memcpy(buf + offset, &packet[5], 32);
> > +		offset += 32;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct drm_edid *lt9611c_bridge_edid_read(struct drm_bridge *bridge,
> > +						       struct drm_connector *connector)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +
> > +	return drm_edid_read_custom(connector, lt9611c_get_edid_block, lt9611c);
> > +}
> > +
> > +static int lt9611c_hdmi_write_avi_infoframe(struct drm_bridge *bridge,
> > +					    const u8 *buffer, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	u8 *cmd;
> > +	u8 data[5];
> > +	int ret;
> > +
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	cmd = kmalloc(5 + len, GFP_KERNEL);
> > +	if (!cmd)
> > +		return -ENOMEM;
> > +
> > +	cmd[0] = 0x57;
> > +	cmd[1] = 0x48;
> > +	cmd[2] = 0x35;
> > +	cmd[3] = 0x3a;
> > +	cmd[4] = 0x01;/*write avi*/
> > +	memcpy(cmd + 5, buffer, len);
> 
> So, 5-byte cmd, optional argument, 5-byte answer, optional addtional
> data. Can we make that a part of the lt9611c_read_write_flow()? Mandate
> the 5-byte in/out buffers, add optional in/out args.
Actually it is 4 byte command, FMX:Y0Y1 Yn, will adapt it in v8.
> 
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, cmd, 5 + len,
> > +				      data, ARRAY_SIZE(data));
> > +	kfree(cmd);
> > +
> > +	if (ret < 0) {
> > +		dev_err(lt9611c->dev, "write avi infoframe failed!\n");
> > +		return ret;
> > +	}
> 
> Drop extra messages, write_infoframe() already has drm_dbg_kms() here.
Will fix it in v8.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int lt9611c_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	u8 cmd[5] = {0x57, 0x48, 0x42, 0x3a, 0x01};
> > +	u8 data[5];
> > +	int ret;
> > +
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, cmd, ARRAY_SIZE(cmd),
> > +				      data, ARRAY_SIZE(data));
> > +
> > +	if (ret < 0) {
> > +		dev_err(lt9611c->dev, "clear avi infoframe failed!\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int lt9611c_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
> > +					     const u8 *buffer, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	u8 cmd[5 + LT9611C_INFOFRAME_MAX_SIZE];
> > +	u8 data[5];
> > +	int ret;
> > +
> > +	cmd[0] = 0x57;
> > +	cmd[1] = 0x48;
> > +	cmd[2] = 0x35;
> > +	cmd[3] = 0x3a;
> > +	cmd[4] = 0x04;/*write vsif*/
> > +	memcpy(cmd + 5, buffer, len);
> > +
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, cmd, 5 + len,
> > +				      data, ARRAY_SIZE(data));
> > +	if (ret < 0) {
> > +		dev_err(lt9611c->dev, "write hdmi infoframe failed!\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int lt9611c_hdmi_clear_hdmi_infoframe(struct drm_bridge *bridge)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	u8 cmd[5] = {0x57, 0x48, 0x42, 0x3a, 0x04}; /*clear vsif*/
> > +	u8 data[5];
> > +	int ret;
> > +
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, cmd, ARRAY_SIZE(cmd),
> > +				      data, ARRAY_SIZE(data));
> > +
> > +	if (ret < 0) {
> > +		dev_err(lt9611c->dev, "clear hdmi infoframe failed!\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int lt9611c_hdmi_write_audio_infoframe(struct drm_bridge *bridge,
> > +					      const u8 *buffer, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	u8 *cmd;
> > +	u8 data[5];
> > +	int ret;
> > +
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	cmd = kmalloc(5 + len, GFP_KERNEL);
> > +	if (!cmd)
> > +		return -ENOMEM;
> > +
> > +	cmd[0] = 0x57;
> > +	cmd[1] = 0x48;
> > +	cmd[2] = 0x35;
> > +	cmd[3] = 0x3a;
> > +	cmd[4] = 0x02;/*write audio*/
> > +	memcpy(cmd + 5, buffer, len);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, cmd, 5 + len,
> > +				      data, ARRAY_SIZE(data));
> > +
> > +	kfree(cmd);
> > +
> > +	if (ret < 0) {
> > +		dev_err(lt9611c->dev, "write audio infoframe failed!\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int lt9611c_hdmi_clear_audio_infoframe(struct drm_bridge *bridge)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	u8 cmd[5] = {0x57, 0x48, 0x42, 0x3a, 0x02};
> > +	u8 data[5];
> > +	int ret;
> > +
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, cmd, ARRAY_SIZE(cmd),
> > +				      data, ARRAY_SIZE(data));
> > +
> > +	if (ret < 0) {
> > +		dev_err(lt9611c->dev, "clear audio infoframe failed!\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int lt9611c_hdmi_audio_prepare(struct drm_bridge *bridge,
> > +				      struct drm_connector *connector,
> > +				      struct hdmi_codec_daifmt *fmt,
> > +				      struct hdmi_codec_params *hparms)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	u8 audio_cmd[6] = {0x57, 0x48, 0x36, 0x3a};
> > +	u8 data[5];
> > +	int ret;
> > +
> > +	if (hparms->sample_width == 32)
> > +		return -EINVAL;
> > +
> > +	switch (fmt->fmt) {
> > +	case HDMI_I2S:
> > +		audio_cmd[4] = 0x01;
> > +		break;
> > +	case HDMI_SPDIF:
> > +		audio_cmd[4] = 0x02;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	audio_cmd[5] = hparms->channels;
> > +	guard(mutex)(&lt9611c->ocm_lock);
> > +
> > +	ret = lt9611c_read_write_flow(lt9611c, audio_cmd, sizeof(audio_cmd),
> > +				      data, sizeof(data));
> > +	if (ret < 0) {
> > +		dev_err(lt9611c->dev, "set audio info failed!\n");
> > +		return ret;
> > +	}
> > +
> > +	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
> > +									&hparms->cea);
> > +}
> > +
> > +static void lt9611c_hdmi_audio_shutdown(struct drm_bridge *bridge,
> > +					struct drm_connector *connector)
> > +{
> > +	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(connector);
> > +}
> > +
> > +static void lt9611c_bridge_hpd_enable(struct drm_bridge *bridge)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	u8 cmd[5] = {0x52, 0x48, 0x31, 0x3a, 0x00};
> > +	u8 data[5];
> > +	int ret;
> > +
> > +	mutex_lock(&lt9611c->ocm_lock);
> > +	ret = lt9611c_read_write_flow(lt9611c, cmd, ARRAY_SIZE(cmd),
> > +				      data, ARRAY_SIZE(data));
> > +	if (!ret)
> > +		lt9611c->hdmi_connected = (data[4] == 0x02);
> > +	mutex_unlock(&lt9611c->ocm_lock);
> > +
> > +	schedule_work(&lt9611c->work);
> > +}
> > +
> > +static int lt9611c_hdmi_audio_startup(struct drm_bridge *bridge,
> > +				      struct drm_connector *connector)
> > +{
> > +	return 0;
> > +}
> > +
> > +static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
> > +	.attach = lt9611c_bridge_attach,
> > +	.detect = lt9611c_bridge_detect,
> > +	.edid_read = lt9611c_bridge_edid_read,
> > +	.atomic_enable = lt9611c_bridge_atomic_enable,
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> > +	.hpd_enable = lt9611c_bridge_hpd_enable,
> > +
> > +	.hdmi_tmds_char_rate_valid = lt9611c_hdmi_tmds_char_rate_valid,
> > +	.hdmi_write_avi_infoframe = lt9611c_hdmi_write_avi_infoframe,
> > +	.hdmi_clear_avi_infoframe = lt9611c_hdmi_clear_avi_infoframe,
> > +	.hdmi_write_hdmi_infoframe = lt9611c_hdmi_write_hdmi_infoframe,
> > +	.hdmi_clear_hdmi_infoframe = lt9611c_hdmi_clear_hdmi_infoframe,
> > +	.hdmi_write_audio_infoframe = lt9611c_hdmi_write_audio_infoframe,
> > +	.hdmi_clear_audio_infoframe = lt9611c_hdmi_clear_audio_infoframe,
> > +
> > +	.hdmi_audio_startup = lt9611c_hdmi_audio_startup,
> > +	.hdmi_audio_prepare = lt9611c_hdmi_audio_prepare,
> > +	.hdmi_audio_shutdown = lt9611c_hdmi_audio_shutdown,
> > +};
> > +
> > +static int lt9611c_parse_dt(struct device *dev,
> > +			    struct lt9611c *lt9611c)
> > +{
> > +	int ret;
> > +
> > +	lt9611c->dsi0_node = of_graph_get_remote_node(dev->of_node, 0, -1);
> > +	if (!lt9611c->dsi0_node)
> > +		return dev_err_probe(dev, -ENODEV, "failed to get remote node for primary dsi\n");
> > +
> > +	lt9611c->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
> > +
> > +	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611c->bridge.next_bridge);
> 
> of_drm_get_bridge_by_endpoint()  ?
Will change it in v8.
> 
> > +	if (ret) {
> > +		of_node_put(lt9611c->dsi1_node);
> > +		of_node_put(lt9611c->dsi0_node);
> > +		return ret;
> > +	}
> > +	drm_bridge_get(lt9611c->bridge.next_bridge);
> 
> Extra leaking reference, drop it.
Will drop it in v8.
> 
> > +	return 0;
> > +}
> > +
> > +static int lt9611c_gpio_init(struct lt9611c *lt9611c)
> > +{
> > +	struct device *dev = lt9611c->dev;
> > +
> > +	lt9611c->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(lt9611c->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(lt9611c->reset_gpio),
> > +				"failed to acquire reset gpio\n");
> > +
> > +	return 0;
> 
> Inline
Will fix it in v8.
> 
> > +}
> > +
> > +static int lt9611c_read_version(struct lt9611c *lt9611c)
> > +{
> > +	u8 buf[2];
> > +	int ret;
> > +
> > +	ret = regmap_write(lt9611c->regmap, 0xe0ee, 0x01);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_bulk_read(lt9611c->regmap, 0xe080, buf, ARRAY_SIZE(buf));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return (buf[0] << 8) | buf[1];
> > +}
> > +
> > +static int lt9611c_read_chipid(struct lt9611c *lt9611c)
> > +{
> > +	struct device *dev = lt9611c->dev;
> > +	u8 chipid[2];
> > +	int ret;
> > +
> > +	ret = regmap_write(lt9611c->regmap, 0xe0ee, 0x01);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_bulk_read(lt9611c->regmap, 0xe100, chipid, 2);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (chipid[0] != 0x23 || chipid[1] != 0x06) {
> > +		dev_err(dev, "ChipID: 0x%02x 0x%02x\n", chipid[0], chipid[1]);
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static ssize_t lt9611c_firmware_store(struct device *dev, struct device_attribute *attr,
> > +				      const char *buf, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	lt9611c_lock(lt9611c);
> > +
> > +	ret = lt9611c_firmware_upgrade(lt9611c);
> > +	if (ret < 0)
> > +		dev_err(dev, "upgrade failure\n");
> > +
> > +	lt9611c_unlock(lt9611c);
> > +
> > +	return ret < 0 ? ret : len;
> > +}
> > +
> > +static ssize_t lt9611c_firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "0x%04x\n", lt9611c->fw_version);
> > +}
> > +
> > +static DEVICE_ATTR_RW(lt9611c_firmware);
> > +
> > +static struct attribute *lt9611c_attrs[] = {
> > +	&dev_attr_lt9611c_firmware.attr,
> > +	NULL,
> > +};
> > +
> > +static const struct attribute_group lt9611c_attr_group = {
> > +	.attrs = lt9611c_attrs,
> > +};
> > +
> > +static const struct attribute_group *lt9611c_attr_groups[] = {
> > +	&lt9611c_attr_group,
> > +	NULL,
> > +};
> > +
> > +static int lt9611c_probe(struct i2c_client *client)
> > +{
> > +	struct lt9611c *lt9611c;
> > +	struct device *dev = &client->dev;
> > +	bool fw_updated = false;
> > +	int ret;
> > +
> > +	crc8_populate_msb(lt9611c_crc8_table, LT9611C_CRC_POLYNOMIAL);
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +		return dev_err_probe(dev, -ENODEV, "device doesn't support I2C\n");
> > +
> > +	lt9611c = devm_drm_bridge_alloc(dev, struct lt9611c, bridge, &lt9611c_bridge_funcs);
> > +	if (IS_ERR(lt9611c))
> > +		return dev_err_probe(dev, PTR_ERR(lt9611c), "drm bridge alloc failed.\n");
> > +
> > +	lt9611c->dev = dev;
> > +	lt9611c->client = client;
> > +	lt9611c->chip_type = (uintptr_t)i2c_get_match_data(client);
> > +
> > +	ret = devm_mutex_init(dev, &lt9611c->ocm_lock);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to init mutex\n");
> > +
> > +	lt9611c->regmap = devm_regmap_init_i2c(client, &lt9611c_regmap_config);
> > +	if (IS_ERR(lt9611c->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(lt9611c->regmap), "regmap i2c init failed\n");
> > +
> > +	ret = lt9611c_parse_dt(dev, lt9611c);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to parse device tree\n");
> > +
> > +	ret = lt9611c_gpio_init(lt9611c);
> > +	if (ret < 0)
> > +		goto err_of_put;
> > +
> > +	ret = lt9611c_regulator_init(lt9611c);
> > +	if (ret < 0)
> > +		goto err_of_put;
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +	if (ret)
> > +		goto err_of_put;
> > +
> > +	lt9611c_reset(lt9611c);
> > +
> > +	lt9611c_lock(lt9611c);
> > +
> > +	ret = lt9611c_read_chipid(lt9611c);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to read chip id.\n");
> > +		lt9611c_unlock(lt9611c);
> > +		goto err_disable_regulators;
> > +	}
> > +
> > +retry:
> > +	lt9611c->fw_version = lt9611c_read_version(lt9611c);
> > +	if (lt9611c->fw_version < 0) {
> > +		dev_err(dev, "failed to read fw version\n");
> > +		ret = -EOPNOTSUPP;
> > +		lt9611c_unlock(lt9611c);
> > +		goto err_disable_regulators;
> > +
> > +	} else if (lt9611c->fw_version == 0) {
> > +		if (!fw_updated) {
> > +			fw_updated = true;
> > +			ret = lt9611c_firmware_upgrade(lt9611c);
> > +			if (ret < 0) {
> > +				lt9611c_unlock(lt9611c);
> > +				goto err_disable_regulators;
> > +			}
> > +
> > +			goto retry;
> > +
> > +		} else {
> > +			dev_err(dev, "fw version 0x%04x, update failed\n", lt9611c->fw_version);
> > +			ret = -EOPNOTSUPP;
> > +			lt9611c_unlock(lt9611c);
> > +			goto err_disable_regulators;
> > +		}
> > +	}
> > +
> > +	lt9611c_unlock(lt9611c);
> > +	dev_dbg(dev, "current version:0x%04x", lt9611c->fw_version);
> > +
> > +	INIT_WORK(&lt9611c->work, lt9611c_hpd_work);
> > +
> > +	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> > +					lt9611c_irq_thread_handler,
> > +					IRQF_TRIGGER_FALLING |
> > +					IRQF_ONESHOT |
> > +					IRQF_NO_AUTOEN,
> > +					"lt9611c", lt9611c);
> > +	if (ret) {
> > +		dev_err(dev, "failed to request irq\n");
> > +		goto err_disable_regulators;
> > +	}
> > +
> > +	lt9611c->bridge.of_node = client->dev.of_node;
> > +	lt9611c->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > +			DRM_BRIDGE_OP_EDID |
> > +			DRM_BRIDGE_OP_HPD |
> > +			DRM_BRIDGE_OP_HDMI |
> > +			DRM_BRIDGE_OP_HDMI_AUDIO;
> > +	lt9611c->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > +
> > +	lt9611c->bridge.vendor = "Lontium";
> > +	lt9611c->bridge.product = "LT9611C";
> > +
> > +	lt9611c->bridge.hdmi_audio_dev = dev;
> > +	lt9611c->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> > +	lt9611c->bridge.hdmi_audio_dai_port = 2;
> > +
> > +	devm_drm_bridge_add(dev, &lt9611c->bridge);
> > +
> > +	/* Attach primary DSI */
> > +	lt9611c->dsi0 = lt9611c_attach_dsi(lt9611c, lt9611c->dsi0_node);
> > +	if (IS_ERR(lt9611c->dsi0)) {
> > +		ret = PTR_ERR(lt9611c->dsi0);
> > +		goto err_remove_bridge;
> > +	}
> > +
> > +	/* Attach secondary DSI, if specified */
> > +	if (lt9611c->dsi1_node) {
> > +		lt9611c->dsi1 = lt9611c_attach_dsi(lt9611c, lt9611c->dsi1_node);
> > +		if (IS_ERR(lt9611c->dsi1)) {
> > +			ret = PTR_ERR(lt9611c->dsi1);
> > +			goto err_remove_bridge;
> > +		}
> > +	}
> > +
> > +	lt9611c->hdmi_connected = false;
> > +	i2c_set_clientdata(client, lt9611c);
> > +	enable_irq(client->irq);
> > +
> > +	lt9611c_reset(lt9611c);
> > +	return 0;
> > +
> > +err_remove_bridge:
> > +	cancel_work_sync(&lt9611c->work);
> > +
> > +err_disable_regulators:
> > +	regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +
> > +err_of_put:
> > +	of_node_put(lt9611c->dsi1_node);
> > +	of_node_put(lt9611c->dsi0_node);
> > +
> > +	return ret;
> > +}
> > +
> > +static void lt9611c_remove(struct i2c_client *client)
> > +{
> > +	struct lt9611c *lt9611c = i2c_get_clientdata(client);
> > +
> 
> Missing disable_irq(). Otherwise the IRQ might schedule a job even after
> a call to cancel_work_sync().
Will fix it in v8.
> 
> > +	cancel_work_sync(&lt9611c->work);
> > +	regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +	of_node_put(lt9611c->dsi1_node);
> > +	of_node_put(lt9611c->dsi0_node);
> > +}
> > +
> > +static int lt9611c_bridge_suspend(struct device *dev)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	dev_dbg(lt9611c->dev, "suspend\n");
> > +	disable_irq(lt9611c->client->irq);
> 
> cancel_work_sync(&lt9611c->work);
Will fix it in v8.
> 
> > +
> > +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > +
> > +	ret = regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +	if (ret)
> > +		dev_err(lt9611c->dev, "regulator bulk disable failed.\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int lt9611c_bridge_resume(struct device *dev)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +	if (ret) {
> > +		dev_err(lt9611c->dev, "regulator bulk enable failed.\n");
> > +		return ret;
> > +	}
> > +	enable_irq(lt9611c->client->irq);
> > +	lt9611c_reset(lt9611c);
> 
> Will the chip report HPD events here if the display was plugged while it
> is powered off? If not, schedule the work here to reread the HPD status.
lt9611c_reset will do this.
> 
> > +	dev_dbg(lt9611c->dev, "resume\n");
> > +
> > +	return ret;
> > +}
> > +
> > 
> 
> -- 
> With best wishes
> Dmitry
