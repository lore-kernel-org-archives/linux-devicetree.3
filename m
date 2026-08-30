Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB802DCF74
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788100790; cv=none; b=ZoTE/QsifyvM00t0RiYEdCafrHS7S3p/a+owN27099hnxf1YeOR+7i2NUG/F3hmpjwNKBE5WVfbK8R+1iKd9gg16bmJyGRFQE2I7xyqxFu7MtS808aIOxd2vmc4SmU0lAd2Ms2gpZwtqhdmKShwJgph5LhBKgFgpAuN+5LR689k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788100790; c=relaxed/simple;
	bh=kzKKSwFCjVL8OYiN+XLrXmKWiTBsHtjg0B3pzsjlekg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pur2D/WZ/qo8risV9OTxMhWH9kZYY4mm9UQN7cp+kMp0Wr/NYHurPxg/bkp4PxKbhdaTzHf5hEA1LnbhvXwPDxpKm/sPA1XWEpk5THgU4CXuMBvzGO1FdXPtiRBoAlC4zOgb6PUp4K2pHyKKyw8uysUVr2+TSzeleyoOSyDcpxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OL3/X4BM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8e4Z9ov; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OL3/X4BM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8e4Z9ov"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UDf77o166950
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 14:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC5F4dXivYg2N0cCOBx9PDBe42XsfplP7Q7huvCggSU=; b=OL3/X4BMYoNRG0Hv
	TAUfmdZi7A1nAJjkeuo+XDjO6mGA6tSlyOjOyz4LKZINAdXoN5ysYmjF1s5sDmla
	Ywx+JWAdF1VJ4If2ihh0WBK6XLBgWfqFVGfPcsKELcYStJwAodBGc/6CB4BIi34T
	vXAO+SgHuMOJnJW/GYNxHpdY0NiM5dGyhhAukx+B67cG/zaHUmyYp6EjwDKth5U2
	r7UTd5cuakjezkVPL4MVoWL2uQxnbchvvWi4TZJS7wBAw3HTE2l7P/rURwcpLBVo
	htSNQxsXUo43Orxd5emJ/d44rVUgu2fchmc+Pmn/xEHGcCgCElHGpbIFnG7Cma5v
	VGfduw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6du1vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 14:39:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c057f480so2939574a12.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788100786; x=1788705586; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WC5F4dXivYg2N0cCOBx9PDBe42XsfplP7Q7huvCggSU=;
        b=e8e4Z9ov/Gl+sXuVYrC1XiyDIB8nf9UVtUgqCdtIruCESISnXIhwgJmCD0cMgZ0z9h
         /Xrq10jQdMc94046aTc4JBi2uW/xlm1Ks9TaoYPjxUYt8vt9deg+wDcs8dtv3d555a0P
         Xj63ESm0bQvVO7MEOUeD3VlkdYay246QEzvweF9rlWdWBSjenzqfXVPGaORibzJHcSwO
         3q0QdSWv5Pako0bJ6Qrap3IAzg6YZIAoawQT9mPhabEJsfW7dKbxu7AKfbjCqbTmH0aj
         vopHE+bpfSOdApd9R7pSC1eIYElyKOB+xHJlXXcuwmKMnUFGYKXMf/cbkc/dq8kMB6wO
         feww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788100786; x=1788705586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WC5F4dXivYg2N0cCOBx9PDBe42XsfplP7Q7huvCggSU=;
        b=fYlY6ubmPpXoY4a39QlrY6CDADrzWsxVvAEgCLvgzT098SzDbLoONyrOWP2k42AroH
         kcQK8UANWhopRAXz/puWvOAcRrHWw+P4PTui/ibyCQDzgrngNWJW4HmXBAiJ2rGXTMzS
         ZIFDM5C6ObVa44yWH+FhavkWCINym0oinYPXyX0zsCFDBdLGVRbGleiBp3iY9faMhmCI
         XKIQce+Mkkv8yapI25EA/01jycIJTcHDqyLtX+7BNZvOmSUl7cZewb1k7UWotrr6AV0Q
         eiPdcEFEpyQzRykvueNotyqfjdac19QOQczYPGn1ctmvCrKK986MbLYT4aJyi2GFSEQH
         b1eA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+YpQk6YdmK0xubqsr2NHBO1mKtZbAaRP1hlbIVhMaKFlYbEPIgWm+6R7Wbey29dcGcSWvtfWWtsGW@vger.kernel.org
X-Gm-Message-State: AFuF++mkQGSsSjER8gpiH4Nj9pv65/MWa4MnOt9w7L9mOYeKkmFcibFi
	Giotmmg2+1yVs872gcKiPt5U7raLMnlP/jCV9ZS1k2/B1P9WJHJontR5shBXTpXw5Y3OQ685euX
	X4LwCE8FLqMNeUVQ8Uco9kkXI2cAXRTcTJ0vd+h/hzKH3jkXo9xQf/T35mU1UPwe7
X-Gm-Gg: AR+sD11cNMx2gnXw3xrL5YMjCn9JENNbOqWEGYdIgv3rD2Dv7RCQ33HQF8blKbMLLpI
	iKWJj6NpVdyBxpbYvHYFTI4Id9UNwKalHcrPJCNr1KuDiSe+I5oEJtnxWziwM0B59mJvy8YIG1k
	xuhYiWid+CO09QOMF76F0JRB9ysDd4xUC7bK6gD092mgo2s8TRL6gYr6y+IA57dgZ9CV6k4IgeL
	El1hevGUqkC4uE+be5voUqwdIDD5z+BqiobL8f8R+YACRWSDJ7TQTqB2EvdvDqQqB+v5Fr7SVan
	q4xCZjp82KqI3HVX9fKzTFzoeudeREbaOWqpe1UYw7G4oMjh9GeZ0QHAxu+HY6+9enhU7uaWAFR
	fgR177pZ8SUscp8AIUsOdETVmxQ==
X-Received: by 2002:a05:6a20:a11f:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3d269a4d3ecmr31267376637.17.1788100786310;
        Sun, 30 Aug 2026 07:39:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11f:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3d269a4d3ecmr31267343637.17.1788100785854;
        Sun, 30 Aug 2026 07:39:45 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f80a0a5sm25389218eec.11.2026.08.30.07.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 07:39:45 -0700 (PDT)
Date: Sun, 30 Aug 2026 20:09:39 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v11 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <apRAq9iW+Q8RJdq8@hu-mdsor-hyd.qualcomm.com>
References: <20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com>
 <20260824-lt9611c-v7-v11-2-eb4a79cb597c@oss.qualcomm.com>
 <20260824142125.B655A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824142125.B655A1F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDEyNiBTYWx0ZWRfX1KbA6AOzxhEl
 iO6wexdJo14JDmquZ21hoCh5ULW6qzg3MtFYjVTclmmuPeC6qtzxGKmVZpB9JWcl+09h0l8ZPDP
 i+03a9F3NOqVyWtDw0MICNV7CLnUaPTYh+NZbypcZy3WGOFaW9uxpTaw7p9mCHcEHh9CxPy09eM
 fpE2U9GNnWoDq1FGlVUmMWZ6lc3xYeIogk5Ckhx00cAd0LSPKD8vPGDHDGnRBiW/fKNJtZ+rqoK
 PJwgFaTOziXPoEz4mEXCVbtjwUfdUgk5qpTb0vAyiLPcR8Qk+72R2Ge2dw8HuVM1vQUMYQE2G8k
 2VYFOYgbr1w/UPU/R+kL4Hf4WxgEYPljUcrbgixjPNCyZdDl9s3FLvsDXxNxJQXArAJtbpjL7xx
 SQYPehp8QAkjc5atv2ollN4KTILUdog02kwUbaN38qG8T+av7bk0jDDuUCmUmKG6rPIaOUTeq5Y
 rsmL9tUHogJnEvhpRtQ==
X-Proofpoint-GUID: 3bV4jJhoU10of7-aLw8oEboijYWMD4pz
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9440b3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=zF36ZKa9zYMQSWNkURUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDEyNiBTYWx0ZWRfX+vtmuQ3r1ng8
 ZA6wkIfuSBKvgWm47NJKPd0eHRvLIo/TNxPQikwXpa4AEzb0z5G2RXReCD+QOB5UtBjUkuwnyaj
 3VHvqFlYddjW+rzRuDG6j6/qfXoplXo=
X-Proofpoint-ORIG-GUID: 3bV4jJhoU10of7-aLw8oEboijYWMD4pz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300126

On Mon, Aug 24, 2026 at 02:21:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Incorrect HPD read response length causes HDMI to never be detected.
> - [High] Sysfs attributes are accessible before drvdata is initialized, causing a NULL pointer dereference.
> - [Medium] Incorrect interrupt clear sequence leaves other active interrupts stuck high.
> - [Medium] Global CRC table is initialized concurrently in probe(), creating a data race.
> --
> 
> --- Patch [2]: [PATCH v11 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver ---
> commit 1a2f947d19c88c8a2effc903f8f83ec6e9fd330b
> Author: Sunyun Yang <syyang@lontium.com>
> Subject: drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit introduces a new DRM bridge driver for the Lontium LT9611C 
> series chips. It provides conversion from MIPI DSI and I2S signals to 
> HDMI output, and includes firmware upgrade capability and sysfs integration.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > index 0000000000000..148da2bf5648e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > @@ -0,0 +1,1283 @@
> 
> [ ... ]
> 
> > +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
> > +{
> > +	struct lt9611c *lt9611c = dev_id;
> > +	struct device *dev = lt9611c->dev;
> > +	int ret;
> > +	unsigned int irq_status;
> > +
> > +	guard(mutex)(&lt9611c->mcu_lock);
> > +
> > +	ret = regmap_read(lt9611c->regmap, 0xe084, &irq_status);
> > +	if (ret) {
> > +		dev_err(dev, "failed to read irq status: %d\n", ret);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	if (!(irq_status & BIT(0)))
> > +		return IRQ_NONE;
> > +
> > +	/*Clear interrupt: hardware requires two writes with delay*/
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
> > +	usleep_range(10000, 12000);
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));
> 
> [Severity: Medium]
> Could this sequence leave other active interrupts stuck in the clear state?
> 
> If irq_status contains other active interrupts (for example, bit 1 is set),
> the second write will write a 1 to those bits. Since there is no subsequent
> write of 0 to clear them, this appears to leave them permanently asserted.
Right now our driver only supports hpd interrupt.
> 
> > +
> > +	schedule_work(&lt9611c->work);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void lt9611c_hpd_work(struct work_struct *work)
> > +{
> > +	struct lt9611c *lt9611c = container_of(work, struct lt9611c, work);
> > +	struct device *dev = lt9611c->dev;
> > +	static const u8 hpd_data[] = { 0x00 };
> > +	struct lt9611c_cmd cmd = {
> > +		.hdr = { LT9611C_FUNC_READ, LT9611C_TYPE_HDMI, 0x31, LT9611C_CMD_SEP },
> > +		.data = hpd_data,
> > +		.data_len = 1,
> > +	};
> > +	u8 hpd_status;
> > +	struct lt9611c_rsp rsp = { .data = &hpd_status, .data_len = 1 };
> 
> [Severity: High]
> Will this ever read the actual HPD status payload?
> 
> As demonstrated by lt9611c_get_edid_block(), the LT9611C chip's read protocol
> echoes the subcommand index byte (Y0) as the first byte of the response.
> Because data_len is set to 1, the driver will only read this echo byte (0x00)
> instead of the actual HPD status in the second byte, causing hpd_status to
> always evaluate to false.
> 
> This same pattern also appears in lt9611c_bridge_detect().
Will be fixed in v12.
> 
> [ ... ]
> 
> > +static ssize_t firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "0x%04x\n", lt9611c->fw_version);
> 
> [Severity: High]
> Can this result in a NULL pointer dereference?
> 
> Since the sysfs files are registered via lt9611c_driver.driver.dev_groups,
> the driver core creates these groups before calling the probe() function.
> However, i2c_set_clientdata() is only called at the very end of probe().
> 
> If a user accesses this sysfs file during the initialization window,
> dev_get_drvdata() will return NULL, which is immediately dereferenced here.
Will be fixed in v12.
> 
> > +}
> > +
> > +static DEVICE_ATTR_RW(firmware);
> 
> [ ... ]
> 
> > +static int lt9611c_probe(struct i2c_client *client)
> > +{
> > +	struct lt9611c *lt9611c;
> > +	struct device *dev = &client->dev;
> > +	bool fw_updated = false;
> > +	int ret;
> > +
> > +	crc8_populate_msb(lt9611c_crc8_table, LT9611C_CRC_POLYNOMIAL);
> 
> [Severity: Medium]
> Is it safe to unconditionally initialize the global lt9611c_crc8_table here?
> 
> If multiple LT9611C devices probe concurrently on different CPUs, this
> will result in multiple threads writing to the same global array
> simultaneously without synchronization.
Will be fixed in v12.
> 
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +		return dev_err_probe(dev, -ENODEV, "device doesn't support I2C\n");
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com?part=2
