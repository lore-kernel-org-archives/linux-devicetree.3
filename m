Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376229;
	b=BEsG59IGK+v2RjvNtYNQdGInS8H8WyefhsCfu2Mw7KQxG/Ri2+1kwpf7jf1FDr04AkVO
	 XRoLxwTy3fJOvdTGxz5Q5yAJXb6AAoWG+0aKusSEg5H518pmSvV0/Ff/o5zEvoUFxPoVv
	 qUYqxk/Tbfc2djB9NcgfvGkRVRuF4C7Ko8uYxd6D0/0eHqGbVKs9DwluSb6HDmR2RP+IU
	 9y2fcEucKDJ4bp/RenczNuVcuyRiqZi3Tzzfw3mqKmuhISdqteT+Vu2WUmn7DhRJKj7Zb
	 haPQ/yYAMc+KvyxS0AGJZDWCIicIVGymRNrD/z/+57Lt1mLpldh1MbP9bPXcNyrZGgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AR3wxTpCn4fPZMsTPtQgVxEZ/XZfuPty0wu9tEDhxSE=;
	b=47fV4Km0hB11jp7qriaFBnE5NFn/qBv6tslYsqEm1BMdY4AYYqbHelLmuDE5PvMWBNJY
	 gm1ImChQAHdqIeDiNZYYs7ediQX/VXHCQK3xSqVRFX+mtl/plg2BWrxZhRsaxqvYJZ3TM
	 kZF/6UfIaPaSvEoy89QUGltPJ/yXADiiEw99W6AzETZOr6MkKXiejn5cV/WkY3CFTXfoJ
	 z0nFi1wd9CD+ORGrB1Xen2xwA9OJYNuAQnHc4FECl8enfjHjTkE+kDeP16Mp6zZhkqpN3
	 BsQSJhxSyauI/XOmGO63u/rLKO+outn3SREU74oUfEswysll8JdI8y8GgVJ6/hsW9Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hNLd8UuV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4DSrIdM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FC560A5BE2
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FC560A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hNLd8UuV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4DSrIdM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUqdu412105
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR3wxTpCn4fPZMsTPtQgVxEZ/XZfuPty0wu9tEDhxSE=; b=hNLd8UuVn1GZNd+C
	yju+czmzGQHj7zTJaJ8M483pjlEGDtb22xI+KPlArcIu4G4Lxjd1+onlsYHMfxyg
	SFTy08ZgMYIOcxKB4UJmONtlOyi8Z3iHY5xa0l66kSZsehuDBpY/iBiOpBFXyLLY
	tWOKdfZkaamoR/3e0iGg7Zm4EdoJ1QAWQgknGv7R3+O31sx0mnEg7VFOu8pxxs9f
	os8H5We8MKwMaTx7WJVMsdmgjz/gcbA+u19cU9iJz2f6qiArlCqraBrpwsicwL1y
	rt/1lKGOMgN17FroC6B4z5kcyde9VFNZd9Q9LBTNwWcT31u6ciKAIqaIOtTrka3O
	CQsL3A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6m5yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:37:07 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so2838307c88.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376226; x=1795981026; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AR3wxTpCn4fPZMsTPtQgVxEZ/XZfuPty0wu9tEDhxSE=;
        b=H4DSrIdMydVlmjhBW5QmeM5/wgdDTimP6sQL0vF4oycb8eUXsEO5qPc/AkXdNBdAjO
         EW12dXfzRlte6GK+bk5H9NqZ2kKzz16tArcvkqSLhoT12NiedwB340TPVpadyy5LpPpf
         /NzvhbUMBbDKf35uLr1Zw/VJniG/FtFd1qSBsaqrvZTfkezWL0OuF1JEpsKi+YDfdQnk
         AMyqXoQ67muYk7wYbhMHtrkF9kZtZT/IVfiitIeZyquC8/hH/JVt9GpI1F6lWeat7xxa
         m1KcYNjUk6O939k0ZY21D864HfPLtn5XslkxPRPGa6Q1IAH09RhSkSBx0de1jYGDNq8T
         jRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376226; x=1795981026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AR3wxTpCn4fPZMsTPtQgVxEZ/XZfuPty0wu9tEDhxSE=;
        b=Y+SQ9mnfm328YNxVrgW0j/ADepqpLPH6RJ70pgr6N6rerkec/9fC8YThXttD2SLQ7I
         ZB0jEBFDYAiL2FsceO5GN7YA3/Nspf94IQSRdiAYPyfCvv/AwiE3SsPbw7/7HCzCY6zI
         2qpWzRkkuUY25Bq+pUfXgfd3gmEXQ5Ogibo4f+6rBZHGQraH+woxsSGVmmC7o5RN8jbX
         zdiZ2Z35StvF8BTvBjRsA8MR4FVprLs3yZ1A5YuTwCKxeCYYkB8ddwIn6swdLdxDF678
         5lEhTYS2SBGIUPqkzs3l0DdVTAWH60BhP7z+yOwV5jF2WbliysufBtXHP2PX/Bfi/6BW
         W9yA==
X-Forwarded-Encrypted: i=1; AL+hErHTfsfrq9tCSZAcjHSnxXniQg9Y9ZOyN5rlvMALparxf5iLTB8lh4bJw8lNqPqfBORpVoJjLzSOTysc@vger.kernel.org
X-Gm-Message-State: APuU4Z/MZpHEzNT8iwzpgG44XLP+Dw7Xk3GCHyZdgWhX6uPDA+RB96vb
	2euHRDkWmrsvQUHclZpz0cqxeYLUwkO3z6Kk4bdsphiMZlcR1KiN4hhC81EYP7NibgoNA7twJ5P
	wZwrAMGfjpjpMjkxSPjylJJPk8J4lMCw6WRjVYhWLHzYtlq1QB3UPtO+o23JR3TVFDSQSdwnS
X-Gm-Gg: AZFdTZdXKla9ein59xz4Gb8ceQs8eAIySBSrEBA7VkNQaQXfognjrFh+tip2TvtUP/L
	WU2egDVNRt1o7yopwEctSoiTGAcF3HxUg57bXodKtzGHxGFdHpi+kRGDlsZRkM9aENss9Sa8CBW
	/Nl8ZUWNC21T2PRJrERux6N0bLqpeerST5cv/2gmfRya+BOyhWS9HhAXyPo7uRyZJGBR+VgfaBM
	YOyM+QpErcamL0YXrHaoiCsZkOmODybwSe1AsXh6jzEGfakAFh3n8NJdrPGtWFFw+v8zYZO+mAE
	2DxUn664x3mitccKjfh4xicCGutzBoLyTySrcq5opL9zXNRkZntsPIuxte1AUTVk42yyUgeJcBp
	zO/Secbog5HIGMXWvj1LPYYgOb0G9Ev/jadQaqlGb+5n8mfuslSd10E+2o9O8f8siYjBWdZulRg
	c=
X-Received: by 2002:a05:7022:2209:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b5568b9e59mr12369987c88.24.1795376226093;
        Sun, 22 Nov 2026 11:37:06 -0800 (PST)
X-Received: by 2002:a05:7022:2209:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b5568b9e59mr12369954c88.24.1795376225433;
        Sun, 22 Nov 2026 11:37:05 -0800 (PST)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm36391893c88.9.2026.11.22.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:37:05 -0800 (PST)
Date: Mon, 23 Nov 2026 01:07:00 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v18 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <awNEXKZ4PcBlFZ6t@hu-mdsor-hyd.qualcomm.com>
References: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
 <20261021-lt9611c-v7-v18-2-4978b94896f1@oss.qualcomm.com>
 <sashiko-outbox-179959@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-179959@kernel.org>
X-Proofpoint-GUID: 7JWtR3cjSEaFWxIUlkYut_LAlO5rHmOn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX0WuM8lUbWfeP
 kGVxjPJJgaJD9x833ElVntAAnuK56RquBus5L3llAoWxWervUVGVyiUeSdcFDvYBX6TEGBhFp7B
 HHCvLVMw6SHjyLGXgxvX9kq/AKSQAvw=
X-Proofpoint-ORIG-GUID: 7JWtR3cjSEaFWxIUlkYut_LAlO5rHmOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX5Y4Oeh78I9Ov
 Kfp/quJwGRqjdih7oZsl9DC8ROZBrkRglj35pCa9xpbkkmU7k4ffw745pnD777ho+qZ9AhF7Cat
 uLri0pbY4DXoNBpqVxpHCJ2+2ZvHrIAHN7OTAL37m2OMM5fUqSYeivD2VdXl5hQt6ySqm0eXiTe
 KgKNB6EOflzyk+W/TZbsggrhmVgoWOUTkRP8S1pdMwvhUbRvuE1ruF/zre+eHIVEIAzE46igXrg
 +HHfOftkvPKERhx+fNs/fvjcWz5JDN1DBmdXF/e8N7DN8W/MRrVlKVFS346NAf67VMo6s2kcpJo
 Wotx+KcaT+LwHBDnLjkj2Ss8V8DfxxwxGk3c2Hd5I8qI7En9BX8jO8qV3bFlq6IlqCVoTEsKFXW
 UEioI3DSHAQaT3UWS/AgwxlX46JPDaOYQ/D6YiH0cuaZBXg61Od7PSR+GBUtMy2+/0aiIy5ugLr
 Gpm8JkSyJcwNBBaRaxA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b034463 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=IY4m9wzs8ccATqxbe_oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

On Wed, Oct 21, 2026 at 08:23:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [Medium] drm/bridge: lt9611c: negative errno stored in fw_version corrupts firmware_show()
> - [Medium] drm/bridge: lt9611c: unlocked reset and power control in PM callbacks
> - [Low] drm/bridge: lt9611c: unused function warnings when CONFIG_PM_SLEEP=n
> - [Low] drm/bridge: lt9611c: missing MODULE_DEVICE_TABLE() for lt9611c_id
> - [Low] drm/bridge: lt9611c: unlocked reset of hdmi_connected after bridge attach
> --
> 
> commit 990744b0d700fbd77a4343ac0bdea653a817a6ce
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit adds a DRM bridge driver for the Lontium LT9611C, LT9611EX, and
> LT9611UXD MIPI DSI to HDMI bridge chips. It supports EDID reading, HPD
> detection, HDMI audio over I2S, dual-DSI mode, and firmware upgrades via
> sysfs.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..8fc86c0732122
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > @@ -0,0 +1,1361 @@
> 
> [ ... ]
> 
> > +static ssize_t firmware_store(struct device *dev, struct device_attribute *attr,
> > +				      const char *buf, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	if (!lt9611c)
> > +		return -ENODEV;
> > +
> > +	dev_warn(dev, "starting firmware upgrade — display will be disrupted\n");
> > +
> > +	ret = lt9611c_firmware_upgrade(lt9611c);
> > +	if (ret < 0) {
> > +		dev_err(dev, "upgrade failure\n");
> > +		return ret;
> > +	}
> > +
> > +	lt9611c_lock(lt9611c);
> > +	WRITE_ONCE(lt9611c->fw_version, lt9611c_read_version(lt9611c));
> > +	lt9611c_unlock(lt9611c);
> > +
> > +	if (READ_ONCE(lt9611c->fw_version) < 0)
> > +		dev_warn(dev, "upgrade succeeded but failed to read new fw version\n");
> > +	else
> > +		dev_info(dev, "firmware upgrade succeeded, version: 0x%04x\n",
> > +			 READ_ONCE(lt9611c->fw_version));
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +
> > +	if (!lt9611c)
> > +		return -ENODEV;
> > +
> > +	return sysfs_emit(buf, "0x%04x\n", READ_ONCE(lt9611c->fw_version));
> > +}
> 
> [Severity: Medium]
> In drivers/gpu/drm/bridge/lontium-lt9611c.c, what happens in firmware_show()
> if reading the version fails after a firmware upgrade in firmware_store()?
> 
> When regmap_write() or regmap_bulk_read() fails inside lt9611c_read_version(),
> it returns a negative errno that firmware_store() writes directly into
> lt9611c->fw_version via WRITE_ONCE().
> 
> Subsequent reads of the sysfs firmware attribute will then format that
> negative errno with "0x%04x" in firmware_show(), emitting a sign-extended
> 32-bit hex error code (such as 0xfffffffb) to userspace instead of a 16-bit
> firmware version or an error return.
> 
> Should firmware_store() only update lt9611c->fw_version when
> lt9611c_read_version() succeeds, or should firmware_show() check for a
> negative lt9611c->fw_version before formatting it?
Will be fixed in next version
> 
> [ ... ]
> 
> > +static int lt9611c_probe(struct i2c_client *client)
> > +{
> 
> [ ... ]
> 
> > +	drm_bridge_add(&lt9611c->bridge);
> > +
> > +	/* Attach primary DSI */
> > +	dsi = lt9611c_attach_dsi(lt9611c, dsi0_node);
> > +	if (IS_ERR(dsi)) {
> > +		ret = PTR_ERR(dsi);
> > +		goto err_remove_bridge;
> > +	}
> > +
> > +	/* Attach secondary DSI, if specified */
> > +	if (dsi1_node) {
> > +		dsi = lt9611c_attach_dsi(lt9611c, dsi1_node);
> > +		if (IS_ERR(dsi)) {
> > +			ret = PTR_ERR(dsi);
> > +			goto err_remove_bridge;
> > +		}
> > +	}
> > +
> > +	lt9611c->hdmi_connected = false;
> > +	enable_irq(client->irq);
> 
> [Severity: Low]
> In lt9611c_probe() in drivers/gpu/drm/bridge/lontium-lt9611c.c, can setting
> lt9611c->hdmi_connected = false here race with lt9611c_bridge_detect()?
> 
> Once drm_bridge_add() and lt9611c_attach_dsi() have been called, the DSI host
> can bind the DRM device and run initial connector detection, which invokes
> lt9611c_bridge_detect() and updates lt9611c->hdmi_connected under
> lt9611c->mcu_lock:
Will be fixed in next version
> 
> 	guard(mutex)(&lt9611c->mcu_lock);
> 
> 	ret = lt9611c_read_write_flow(lt9611c, &cmd, &rsp);
> 	if (ret)
> 		dev_err(dev, "failed to read HPD status (err=%d)\n", ret);
> 	else
> 		connected = (hpd_status == 0x02);
> 
> 	lt9611c->hdmi_connected = connected;
> 
> Writing lt9611c->hdmi_connected = false in lt9611c_probe() without holding
> lt9611c->mcu_lock after the bridge is attached can clobber the detected state
> (and lt9611c is already zero-initialized by devm_drm_bridge_alloc()). Could
> this assignment be dropped or moved before drm_bridge_add()?
> 
> [ ... ]
Will be fixed in next version
> 
> > +static int lt9611c_bridge_suspend(struct device *dev)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	disable_irq(lt9611c->client->irq);
> > +	cancel_work_sync(&lt9611c->work);
> > +
> > +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > +
> > +	ret = regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +	if (ret) {
> > +		dev_err(lt9611c->dev, "regulator bulk disable failed.\n");
> > +		gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > +		msleep(400);
> > +		enable_irq(lt9611c->client->irq);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
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
> > +	lt9611c_reset(lt9611c);
> > +	enable_irq(lt9611c->client->irq);
> > +
> > +	return ret;
> > +}
> 
> [Severity: Medium]
> In drivers/gpu/drm/bridge/lontium-lt9611c.c, should lt9611c_bridge_suspend()
> and lt9611c_bridge_resume() hold lt9611c->mcu_lock while asserting reset_gpio,
> toggling the regulators, and running lt9611c_reset()?
> 
> During system suspend and resume, disable_irq() and cancel_work_sync() only
> stop the HPD interrupt and lt9611c->work. Because fw_devlink relaxes
> bidirectional OF-graph links and there is no PM device link ordering this I2C
> client against the DRM master device or audio codec, bridge callbacks such as
> lt9611c_bridge_detect(), lt9611c_bridge_edid_read(),
> lt9611c_bridge_atomic_enable(), or lt9611c_hdmi_audio_prepare() can run
> concurrently.
> 
> Those callbacks serialize hardware access with lt9611c->mcu_lock, whereas
> lt9611c_bridge_suspend() and lt9611c_bridge_resume() assert reset_gpio,
> disable/enable the vcc and vdd supplies, and run the 400ms reset sequence
> without acquiring lt9611c->mcu_lock, which could reset or power down the chip
> mid-transaction in lt9611c_read_write_flow().
Will be fixed in next version
> 
> > +
> > +static const struct dev_pm_ops lt9611c_bridge_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(lt9611c_bridge_suspend,
> > +				lt9611c_bridge_resume)
> > +};
> > +
> > +static const struct i2c_device_id lt9611c_id[] = {
> > +	{ .name = "lt9611c",   .driver_data = (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611C]   },
> > +	{ .name = "lt9611ex",  .driver_data = (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611EX]  },
> > +	{ .name = "lt9611uxd", .driver_data = (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611UXD] },
> > +	{ /* sentinel */ }
> > +};
> 
> [Severity: Low]
> In drivers/gpu/drm/bridge/lontium-lt9611c.c, is MODULE_DEVICE_TABLE(i2c,
> lt9611c_id) missing after lt9611c_id?
> 
> Without MODULE_DEVICE_TABLE(i2c, lt9611c_id), building the driver as a module
> (CONFIG_DRM_LONTIUM_LT9611C=m) omits the i2c:lt9611c, i2c:lt9611ex, and
> i2c:lt9611uxd modalias entries from modules.alias, preventing automatic module
> loading when devices are instantiated via I2C device IDs.
Will be fixed in next version
> 
> > +
> > +static const struct of_device_id lt9611c_match_table[] = {
> > +	{ .compatible = "lontium,lt9611c",   .data = &lt9611c_chip_data[CHIP_LT9611C]   },
> > +	{ .compatible = "lontium,lt9611ex",  .data = &lt9611c_chip_data[CHIP_LT9611EX]  },
> > +	{ .compatible = "lontium,lt9611uxd", .data = &lt9611c_chip_data[CHIP_LT9611UXD] },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, lt9611c_match_table);
> > +
> > +static struct i2c_driver lt9611c_driver = {
> > +	.driver = {
> > +		.name = "lt9611c",
> > +		.of_match_table = lt9611c_match_table,
> > +		.pm = &lt9611c_bridge_pm_ops,
> > +		.dev_groups = lt9611c_attr_groups,
> > +	},
> 
> [Severity: Low]
> In drivers/gpu/drm/bridge/lontium-lt9611c.c, will building with
> CONFIG_PM_SLEEP=n trigger unused-function warnings for
> lt9611c_bridge_suspend() and lt9611c_bridge_resume()?
> 
> SET_SYSTEM_SLEEP_PM_OPS() expands to nothing when CONFIG_PM_SLEEP is disabled,
> leaving both static functions unreferenced without __maybe_unused annotations.
> 
> Could this use DEFINE_SIMPLE_DEV_PM_OPS(lt9611c_bridge_pm_ops,
> lt9611c_bridge_suspend, lt9611c_bridge_resume) (or SYSTEM_SLEEP_PM_OPS())
> along with pm_sleep_ptr(&lt9611c_bridge_pm_ops) on .pm so the compiler can
> dead-code eliminate the callbacks and dev_pm_ops structure when
> CONFIG_PM_SLEEP=n?
Will be fixed in next version
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com?part=2
