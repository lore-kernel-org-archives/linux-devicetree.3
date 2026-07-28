Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ED241B8D4
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231642; cv=none; b=f6Hrc86La8xEGTNJlTHXx65nC4ot7i0O8Us6wlW9rcmyAhylcI477se8T3JzAJXSeksvt0i5R7T1TBF47I3pPF4Imt//tiyxclyQQ8KPnHQMJAtux4QJNoitpl1NEUkcy9DrbsYvWAgWHaF8i9Y0qisc/hv4z7+nwf0Bj3uN7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231642; c=relaxed/simple;
	bh=TS4e4k2AwaLPKU8PCERHva2XuQn+wfl2NsI8SosqTKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNcUrLYZvVB2+vZlIXdnYZAcrCz1DGzPQXv3+esomTsR+MDjmJ0mH0XufY9MSFnZFOqCbnXPtUJq+FNRTh9NBxR2730Esbeuoxrh5YuxdJ4FRzM/W7emhDBmI1kSriMHQE+ndEYA8JTOESnRqFuTdU7ChqkeVAKmieQoPvYiSJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wf+ihB+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R81qoTmy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wf+ihB+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R81qoTmy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82tLv2309909
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1It8DhYGf8SmrJsGCiuwTyr+urpEZwrjFFHmHSM69pc=; b=Wf+ihB+O9E6zEwTy
	Zp2PfxsKT3mQvUmbaip4Imfstc5M8ZmxfjfNvAopwoxQJI/h5/jYUYEuJKl9zGkB
	mZNKExJR1ulJuo9aipQO1du8z1NLyUZYaNlIstComeA0C+F/LxtohqThvxAIbB9J
	cM4udhshHAU0WpjHu7d1vNMgkGYEziyk9f8eMQ1qJPxCPUb4vLIIXAuVxcoHNHt8
	nRED3gU2D3TLXwHc/gMn/y4cdaeC8d8Uy7XzRyHIJns2VHuwFFrYiDrOVBQsWl9d
	FNSVQAfy9Tj4ORPiU6hh39xNxALXzI11HrnJ5PPoORtZgff7MSWt17Sp/MuG9Dv4
	IEfHLw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7j2ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:40:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so40031411cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231638; x=1785836438; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1It8DhYGf8SmrJsGCiuwTyr+urpEZwrjFFHmHSM69pc=;
        b=R81qoTmydl299J1UTj1hg4eRm1U8Hv/5js1ezTMK2ANMGia3WyYOYU6i8bz9d42QGw
         h1RGQ6gEbbV2iHCBTpK2FhkTFS8e5OPQ7BuU+lQutFcT52iRz77/pHGKsYjJ7jSWNeC1
         ZUXuEDFAX2MASrTJC1IaG9Z4feGjGawvnEDnM+7sPodAxcGpDEhhG9kByvTCuJBft7pU
         hmsLD7/nDgORv/dCaF0hpofvuU2o7QJpKXKRViQlfyWHQ0EHkWIx23CMC/FjDPgneLzM
         wwt4hU5runNAakXe03ob8G5mhgamX+I5cCh4Q6HqU3PFB8Cf14LYdXbfyGadk2TjAFyw
         2lxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231638; x=1785836438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1It8DhYGf8SmrJsGCiuwTyr+urpEZwrjFFHmHSM69pc=;
        b=jUt0eWOHFuKLqy1r/emjyZH7c9CfM1mEZm5KD6zlo/iOW78ny8Ow/rTQ8cfcWQ18z8
         sFj0lzyfL7QBiQet4pYwde72ctYmTnMLcGUN0tN+ihRbA8yOQBB1J/zJNRJCsZeMTS4e
         KhrJc806fWnytgJPg/HGE1/JnMkzoHgJp1Y4q8tAUphwgksxr0KnSaZlTSxPyW8gi+sQ
         W/SLZzQOpcRcEVHW4sg6/evNEBa1LZoUJUMDmJhoGcMhU+Fakg1uIuRtBFgcx3UjVRxR
         ZW2L2NsWvKPG8ooHWDeq05F3NManbyG9t60oohcm3zpcAGToGnkev0b2v2SDwem9g4b9
         /OIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrpq3+n8LxrZ4nZYTjProqt60ntUbgfP5f7lcoabNolbTI3QVdozxM2VAu34I7Aix09A9sgNG1s/uFl@vger.kernel.org
X-Gm-Message-State: AOJu0YxHjlOZpjy88+4ZJN2uHtUggdtB7EIkGiOQ5xRMO5gc95qKiiUG
	GkNJgyCxLr0uFlr6lZM/PT2NQ+Nh7FKx1y2smUJG2aP4Nlws5cKBLZ9x035byC3ASNajVw1FU2j
	HzO+TRwHTKb4UOHvM4lPkGyj5hHPAb2FdiQS333T/mjwE78F69jOLgWwzJJzNPk28
X-Gm-Gg: AR+sD122YD8+tvh0QWIa0+M/xRoUrFoU6+zadML0CoNLM1p/Khww3eOoG0mVlxLFJQq
	mVMbbht1R9lfdtVDvbyGJ43MBzKl9qxISdGiWlctnOzI/W3uW1QgFr8tiDOEmpOCKI10daiLuES
	dnf4vaS2eso5eSpxphlvlErr6eG8Ag5m8D5RccvI1Gz5u4DUYJXZWxxlW8ZpnLD4vxOSPbtcVzM
	ZoRZ5/I3yVtQVnJCqpSotHwGKeWCtG/u4UmzJ6i8bwnhi+ZyVTlJPsKz2PKIAjGHjdgkA205Ao7
	+LZnWSEq9dlQ5juXmCUdVTaz7xUldtGsc3PepCAbN4lmHxPAYBatQodbyLwOyAA3y7SSuB4rgad
	MP5t5nDQck5Kl/DVGukgkQ4T1se3RnYwqbia/vleIjtC/ZQ9V/lf1JFF2WWg+ZJ6nOAqSutQ/YF
	xzqRFCsrmJNqS83Q==
X-Received: by 2002:a05:622a:588e:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-529d70d7486mr13021301cf.41.1785231637997;
        Tue, 28 Jul 2026 02:40:37 -0700 (PDT)
X-Received: by 2002:a05:622a:588e:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-529d70d7486mr13020921cf.41.1785231637426;
        Tue, 28 Jul 2026 02:40:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f22236384sm18005631fa.24.2026.07.28.02.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:40:35 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:40:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com,
        xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com,
        qdchen@lontium.com, llzhang@lontium.com, hfxia@lontium.com
Subject: Re: [PATCH v17 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Message-ID: <b57ijnpvbayerjqcv5lfoawgtmuahnhhupfso6bxa5in3j6efq@cq3sgg7yv3bh>
References: <20260715015438.2770155-1-syyang@lontium.com>
 <20260715015438.2770155-3-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715015438.2770155-3-syyang@lontium.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MyBTYWx0ZWRfX/mjjDkh+YBIH
 xnWXvNmxEtp3CmKiBXJt5DS0linMTz9p3D8VZyw7sQu2V/JvGcD+4zn6FuM48gXFmYrwTqnpd80
 qn3XX6jNAse+xjNr5b09TdYZtLy0rogl1cfY8DrjzEQVVTmcQQS/gF8x/xkqpeeAIrcTpFaQyFZ
 geUh1fP11ZvysFVXNl8tqmwEhuZPRciBDlvY8Ypi0P1cglbQ53uXuMwC52rBpbXhPAsSG/6GscW
 oUv+kcMF2u3rrS8swhQfUaXyHo/bR0R+7yZ8vQgIgqgylsysmF8EEHaw+ABLfzl9tcWKhHEld8T
 yekPGqHTUXyw//vwnYnFcWLGt+sIRKTKf6k2JuiMbWimAIt2410RcaxoT68phJsQIt8YVa6+AI/
 pnzMedNdJypy94y2ma2CmjqO2heW7/rI8EMSsJUS1zNki0aPiNHCpLkxVP94bChzmxRu93uzShx
 Fnd8xDYjYKqvlsQyvfQ==
X-Proofpoint-ORIG-GUID: IQSNGzGmGrIt3pwquw_7WYxwOfxPYP5H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MyBTYWx0ZWRfXynIiEPCUR3Hv
 nw4JpVAjLHClhFQYpekLdEaeNLxqt+vYw4V39IfT3cnTkomAcnH/8+ueFYrNW8+X1O59Yh+uQJq
 T9mzKDBNSg1qp07Jp+MhO7OD5Zzlxno=
X-Proofpoint-GUID: IQSNGzGmGrIt3pwquw_7WYxwOfxPYP5H
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a687917 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Kz8-B0t5AAAA:8
 a=pWePRjm4GqRyLHq30uQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280083

On Wed, Jul 15, 2026 at 09:54:38AM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> Add support for the Lontium LT7911EXC bridge chip, which converts
> eDP input to MIPI DSI output using an internal firmware-controlled
> pipeline.
> 
> The driver provides:
> - DRM bridge integration for eDP-to-DSI routing
> - MIPI DSI host interface for downstream panel attachment
> - Firmware upgrade mechanism over I2C (erase/program/verify)
> - GPIO-based reset and regulator management
> 
> Display timing and MIPI DCS packet generation are handled by the chip
> firmware and are not configured by the driver.
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
> +static void lt7911exc_reset(struct lt7911exc *lt7911exc)
> +{
> +	/* Assert reset pin: logical 1 -> physical state low (Reset Active) */

Redundant comment.

> +	gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +
> +	/* Deassert reset pin: logical 0 -> physical state high (Run state) */

This one too.

> +	gpiod_set_value_cansleep(lt7911exc->reset_gpio, 0);
> +	msleep(400);
> +}
> +

[...]

> +static void lt7911exc_firmware_upgrade_work(struct work_struct *work)
> +{
> +	struct lt7911exc *lt7911exc = container_of(work, struct lt7911exc, work);
> +	struct device *dev = lt7911exc->dev;
> +	const struct firmware *fw;
> +	u8 *buffer;
> +	size_t total_size = FW_SIZE - 4;
> +	u32 crc32, version;
> +	int ret;
> +
> +	mutex_lock(&lt7911exc->upgrade_lock);
> +
> +	scoped_guard(mutex, &lt7911exc->ocm_lock) {
> +		if (lt7911exc->removed)
> +			goto out_unlock_upgrade;
> +	}
> +
> +	ret = request_firmware(&fw, FW_FILE, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to load '%s'\n", FW_FILE);
> +		goto out_unlock_upgrade;
> +	}
> +
> +	if (fw->size > total_size) {
> +		dev_err(dev, "firmware too large (%zu > %zu)\n", fw->size, total_size);
> +		goto out_release_fw;
> +	}
> +
> +	buffer = kvmalloc(total_size, GFP_KERNEL);
> +	if (!buffer)
> +		goto out_release_fw;
> +
> +	memset(buffer, 0xff, total_size);
> +	memcpy(buffer, fw->data, fw->size);

memcpy(buffer, fw->data, fw->size);
memset(buffer + fw->size, 0xff, total_size - fw->size);


> +	crc32 = cal_crc32_custom(buffer, total_size);
> +	kvfree(buffer);
> +
> +	lt7911exc_reset(lt7911exc);
> +
> +	scoped_guard(mutex, &lt7911exc->ocm_lock) {
> +		ret = lt7911exc_inside_mcu_stop(lt7911exc);

Move guard() into the function.

> +	}
> +	if (ret)
> +		goto out_release_fw;
> +
> +	ret = lt7911exc_block_erase(lt7911exc);
> +	if (ret) {
> +		dev_err(dev, "failed to block erase.\n");
> +		goto out_mcu_run;
> +	}
> +
> +	ret = lt7911exc_write_data(lt7911exc, fw, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write firmware data\n");
> +		goto out_mcu_run;
> +	}
> +
> +	ret = lt7911exc_write_crc(lt7911exc, crc32, FW_SIZE - 4);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to write firmware crc\n");
> +		goto out_mcu_run;
> +	}
> +
> +	lt7911exc_reset(lt7911exc);
> +
> +	ret = lt7911exc_upgrade_result(lt7911exc, crc32);
> +	if (ret)
> +		dev_err(dev, "firmware verification failed\n");
> +
> +	/*
> +	 * Always restore MCU to running state: flash is already erased,
> +	 * leaving MCU stopped would render the chip completely unusable.
> +	 */
> +	scoped_guard(mutex, &lt7911exc->ocm_lock) {
> +		ret = lt7911exc_inside_mcu_run(lt7911exc);

Move guard() into the run function.

> +		if (!ret) {
> +			ret = lt7911exc_read_version(lt7911exc, &version);

Why is ihis being executed under the OCM lock?

> +			if (!ret)
> +				lt7911exc->fw_version = version;
> +		}
> +	}
> +
> +	if (ret)
> +		dev_err(dev, "failed to read version after upgrade\n");
> +
> +	goto out_release_fw;
> +
> +out_mcu_run:
> +	scoped_guard(mutex, &lt7911exc->ocm_lock)
> +		lt7911exc_inside_mcu_run(lt7911exc);
> +
> +out_release_fw:
> +	release_firmware(fw);

release_firmware() could have happened long ago, after copying the
buffer.

> +
> +out_unlock_upgrade:
> +	scoped_guard(mutex, &lt7911exc->ocm_lock) {
> +		if (!lt7911exc->removed)
> +			lt7911exc->upgrade = false;
> +	}
> +
> +	/* Notify DRM to re-trigger modeset after firmware upgrade */
> +	if (!lt7911exc->removed && lt7911exc->bridge.dev)
> +		drm_kms_helper_hotplug_event(lt7911exc->bridge.dev);

drm_bridge_hpd_notify(), outside of the lock.

> +
> +	mutex_unlock(&lt7911exc->upgrade_lock);
> +}
> +
> +static void lt7911exc_atomic_pre_enable(struct drm_bridge *bridge, struct drm_atomic_commit *state)
> +{
> +	struct lt7911exc *lt7911exc = bridge_to_lt7911exc(bridge);
> +	struct device *dev = lt7911exc->dev;
> +	int ret;
> +
> +	guard(mutex)(&lt7911exc->ocm_lock);
> +
> +	if (!lt7911exc->upgrade) {

Why? Can't you just use a lock to prevent DRM vs firmware upgrade races.

> +		ret = regmap_write(lt7911exc->regmap, 0xe0b0, 0x01);

What will enable the output if bridge was upgrading during
atomic_pre_enable?

> +		if (ret)
> +			dev_err(dev, "failed to enable mipi output stream\n");
> +	}
> +}
> +
> +static void lt7911exc_atomic_post_disable(struct drm_bridge *bridge,
> +					  struct drm_atomic_commit *state)
> +{
> +	struct lt7911exc *lt7911exc = bridge_to_lt7911exc(bridge);
> +	struct device *dev = lt7911exc->dev;
> +	int ret;
> +
> +	guard(mutex)(&lt7911exc->ocm_lock);
> +
> +	if (!lt7911exc->upgrade) {
> +		ret = regmap_write(lt7911exc->regmap, 0xe0b0, 0x00);
> +		if (ret)
> +			dev_err(dev, "failed to disable mipi output stream\n");
> +	}
> +}
> +
> +static int lt7911exc_bridge_attach(struct drm_bridge *bridge,
> +				   struct drm_encoder *encoder,
> +				   enum drm_bridge_attach_flags flags)
> +{
> +	struct lt7911exc *lt7911exc = bridge_to_lt7911exc(bridge);
> +
> +	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
> +		dev_err(lt7911exc->dev, "needs atomic updates support\n");
> +		return -ENOTSUPP;
> +	}

I'd say, it's redundant.

> +
> +	return drm_bridge_attach(encoder, lt7911exc->output_bridge, bridge, flags);
> +}
> +
> +static const struct drm_bridge_funcs lt7911exc_bridge_funcs = {
> +	.attach = lt7911exc_bridge_attach,
> +	.atomic_pre_enable = lt7911exc_atomic_pre_enable,
> +	.atomic_post_disable = lt7911exc_atomic_post_disable,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +};
> +
> +static int lt7911exc_dsi_host_attach(struct mipi_dsi_host *host, struct mipi_dsi_device *dev)
> +{
> +	struct lt7911exc *lt7911exc = dsi_host_to_lt7911exc(host);
> +	struct drm_bridge *bridge;
> +
> +	/* currently do not support connecting several DSI devices to the same host */
> +	if (lt7911exc->output_bridge)
> +		return -EBUSY;
> +
> +	if (dev->lanes > 4) {
> +		dev_err(lt7911exc->dev, "unsupported number of data lanes(%u)\n", dev->lanes);
> +		return -EINVAL;
> +	}
> +
> +	bridge = devm_drm_of_get_bridge(lt7911exc->dev, host->dev->of_node, 1, 0);
> +	if (IS_ERR(bridge)) {
> +		dev_err(lt7911exc->dev, "failed to add DSI device\n");
> +		return PTR_ERR(bridge);
> +	}
> +
> +	lt7911exc->output_bridge = bridge;

Follow what other drivers are doing. Please store the next bridge in
drm_bridge::next_bridge. It saves you from manual handling of its
refcounts.

> +
> +	/*
> +	 * Force panel-first enable order: the DSI output stream (0xe0b0)
> +	 * must not be enabled before the panel is powered on.
> +	 * This override is safe because LT7911EXC's transfer() is a stub —
> +	 * panel DCS commands are silently discarded and panel init is done

Is it a hardware limitation or something which is not yet implemented in
the driver?

> +	 * by the chip's internal firmware. The panel driver's
> +	 * prepare_prev_first preference is therefore irrelevant here.
> +	 */

Do you have an actual issue with one of the panels? The overall logic
should be to let the panels decide whether it needs to setup anything
before the DSI output stream comes up. If there are any issues, they
should be fixed on the DSI host side.

> +	lt7911exc->output_bridge->pre_enable_prev_first = false;
> +
> +	drm_bridge_add(&lt7911exc->bridge);
> +
> +	return 0;
> +}
> +
> +static int lt7911exc_dsi_host_detach(struct mipi_dsi_host *host, struct mipi_dsi_device *dev)
> +{
> +	struct lt7911exc *lt7911exc = dsi_host_to_lt7911exc(host);
> +
> +	drm_bridge_remove(&lt7911exc->bridge);
> +
> +	return 0;
> +}
> +
> +/*
> + * LT7911EXC's internal MCU owns the DSI link and handles all panel
> + * initialization. The host transfer() is a no-op sink: accept the

How does it know panel init commands? What about the panels which use
DCS commands to setup brightness?

> + * message and report it as sent so the panel driver does not abort
> + * its init sequence. Actual DSI transmission is done by chip firmware.
> + */
> +static ssize_t lt7911exc_dsi_host_transfer(struct mipi_dsi_host *host,
> +					   const struct mipi_dsi_msg *msg)
> +{
> +	struct lt7911exc *lt7911exc = dsi_host_to_lt7911exc(host);
> +
> +	if (msg->rx_len) {
> +		dev_warn(lt7911exc->dev, "MIPI rx is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	switch (msg->type) {
> +	case MIPI_DSI_DCS_SHORT_WRITE:
> +	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> +	case MIPI_DSI_DCS_LONG_WRITE:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> +	case MIPI_DSI_GENERIC_LONG_WRITE:
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	guard(mutex)(&lt7911exc->ocm_lock);
> +
> +	if (lt7911exc->upgrade)
> +		return -EBUSY;
> +
> +	return msg->tx_len;
> +}
> +
> +static const struct mipi_dsi_host_ops lt7911exc_dsi_host_ops = {
> +	.attach = lt7911exc_dsi_host_attach,
> +	.detach = lt7911exc_dsi_host_detach,
> +	.transfer = lt7911exc_dsi_host_transfer,
> +};
> +

-- 
With best wishes
Dmitry
