Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA16DF6C
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 01:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786237297; cv=none; b=JSU7CQUHkSfkC+2ufrYph0sUrzHyKzPFvEOBjSKKs5zNXkehZZZRFUqfFYpk8+tMSAmlLN/nVSIG6YoGK+f/tjzoWX12hf2h97B0AuREVyZH0RFn2/y0JrR+8mRqoAybYNEVfjR2/CFY1J0nyW4iW+pIDTLgE0/Xwxbufk0VEos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786237297; c=relaxed/simple;
	bh=PQq+lKTeK7k4HPNl1hyqWFlesD4mUjpD9Z0LOKkkekQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FD2/NCyIWUmKNYCEZBzXCGlrOTpbDSVoKClDG7SEP5umU8g1AfIW5JyZu1MJdsQuAcP50s8vq/f2BzZzbIpwAySu/9z86GcND7aasbKxhS1CJzV/7Mo8rgEFjYl5rTeEyXWd60gT7Au2W+xEdD6VUxMoTcT9iy4MwhEVHBvbrjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLT/Ot+X; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLT/Ot+X"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c9fcd903839so467998a12.1
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 18:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786237295; x=1786842095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTU4eIZnw4U9ZhD6oNkBxDN+wvA8F1rOyrlQvDjEprA=;
        b=VLT/Ot+XrkN8rrYRRU2TcgF6uhYh2sgj6rnLw2spKxPCNS69K/+yTLEQsX2mCuwJZn
         +qyFEtxecKSN2nDKZHJF4b0evQ2Vce7aMQZoFKUMBYh/JvPClCDXXkUsxczU/0YmIUSi
         JjytOrJ928LNc/1BFFJuE6wjDW4x9mvAIoUNSKdEDA6CWzDUJX+0A/U9aOw+wzeBX2Ld
         smzuDrF4AY+e9lc9kgLZMX5F+rHm9zkierlZUSVxR6s5UJNVZPHwxUhFZBYQxxRDDL1C
         BaRsTnr6sbK1FnRe16efTF+bVjFdW4Os+klQyv5lTsB/wwn+Hkvp/4TYNHHi3ZWOOHcE
         /2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786237295; x=1786842095;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTU4eIZnw4U9ZhD6oNkBxDN+wvA8F1rOyrlQvDjEprA=;
        b=GO0QXZYswjrOb0JPULkqu8BYyRgH5sV6KUp8TH938U6TE9CLpXSxxzdtF9llG69wwQ
         E26YUEjhMkn1uinct2TGKDBE3Ugn+A49icWw7fNpu8JU6pHeE3/GvV1pE7n5xsUeMpEj
         q8JvgtqizWydnR7fSW1Q/6W0+PvE+h3a63RdnNzWAyCw54a2FEG6BHlhDUovUXTDnM3i
         h4sC+EBVShSHYC1M008ScPZKTP+LNarAgNjvPmuztiK63EVkELFBpFw0dIcEPNnKmx9H
         I4cknrCDasWdGc7CeYfcQmqzQKSIMcIvf7GmWRFNKeKe5HGhz/o9s6kBVg3bw/1NWdH6
         GP2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpZmUmUsRcOsQPm1FtppWXjKpot01CwcnZwlq5xj3brygRhVyr6KdL+CeJ1QlETfAuwmHO8sMsjRePk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu/IPgnkDG4hgrbkTg6pkrphsC8ezG0AUZBab44PPf3qhF76lh
	S3Jp0Fjkxh9ilOQI2Tz8B5AUHkQ09KiAMaZSY+szRQ29ON2VtIu8PgdF
X-Gm-Gg: AR+sD10RgYSxj9h1GbYWIaCLNGxitRt7yvN1eZefmDmqQZjC2eMaMK8F88/xmL+bS7F
	QDwChhi6c8F3p2oJo5404h8bF2wRzmVkp8Oo2wriBNM4W8VyiYYU+aRsVRLx1NVjWCoInVUe6bq
	w4/z1GHL3SroJCVqT25oxg+P2W8xJfHJWtZXK01iwoxsNd50aKXF5RO1vDgycZ+D+7Bz3G/ZKjt
	SiS6+JNadmD3BBFm6haLO91VN66Icp5QEq340de8orY46D/X7gQKmgGMrwZcBHQY032JXXbz48m
	zA7OnWRS+O5nOiGgcEIKvHj5sQjMpQ8xFUIIxl+tWvbqI8j1InbOpvhjX81rKuWBh/IhaoSxzrf
	DOaEZf9YYFC47FHEVUSnRQLgI4RoyUjxZ9t3Z7k8RyqxjstEgdwXIRBo3KKCQi1KSr8Tz9TRpIG
	fR4mxBvy/6jaY/BUoV59YGrbAgxK5h9bDCL2QVE2g=
X-Received: by 2002:a05:6a00:2a0e:b0:848:6c37:cd74 with SMTP id d2e1a72fcca58-84f696a0369mr12238522b3a.22.1786237295147;
        Sat, 08 Aug 2026 18:01:35 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a55f304sm2378524b3a.49.2026.08.08.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 18:01:33 -0700 (PDT)
Date: Sun, 09 Aug 2026 09:01:28 +0800
Message-ID: <4da43aa690649fda8565941ee576338b.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, olteanv@gmail.com,
 linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <20260725051713.B60E61F000E9@smtp.kernel.org>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-11-f22a10a52867@gmail.com>
 <20260725051713.B60E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 25 Jul 2026 05:17:13 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing IS_ERR() check for 'match' causes an ERR_PTR dereference inside component_master_add_with_match().
> - [Medium] The atomic commit tail stalls the commit pipeline by waiting for flip completion before signaling hardware done.
> --
>
> --- Patch [11]: [PATCH 11/17] drm/spacemit: add Saturn DPU DRM device driver ---
> commit e12174b9614adeccb5a06f03b5944837004e96f4
> Author: Cody Kang <codykang.hk@gmail.com>
>
> drm/spacemit: add Saturn DPU DRM device driver
>
> This commit adds the DRM device for the SpacemiT K3 Saturn display processing
> unit. The SoC has two DPU instances, each driving one CRTC that scans out a
> single primary plane in linear RGB, feeding a downstream DP/eDP controller
> over an OF-graph endpoint.
>
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_drm.c b/drivers/gpu/drm/spacemit/spacemit_drm.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_drm.c
> > @@ -0,0 +1,132 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025-2026 SpacemiT Co., Ltd.
> > + *
> > + */
>
> [ ... ]
>
> > +static void spacemit_drm_atomic_commit_tail(struct drm_atomic_commit *old_state)
> > +{
> > +	struct drm_device *dev = old_state->dev;
> > +
> > +	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > +
> > +	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> > +
> > +	drm_atomic_helper_commit_planes(dev, old_state,
> > +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> > +
> > +	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> > +
> > +	drm_atomic_helper_commit_hw_done(old_state);
>
> [Severity: Medium]
> Does calling drm_atomic_helper_wait_for_flip_done() before
> drm_atomic_helper_commit_hw_done() stall the commit pipeline?

Deliberate: the cmdlist engine reads the old state's DMA buffers
until the frame boundary, so the next commit must not start
programming (nor the old buffers be freed) before the flip
completes. Will add a comment in v2 saying so.

> By waiting for the flip completion before signaling hardware done, the CPU work
> for the next frame (such as state preparation and buffer pinning) is blocked
> until the hardware flip completes.
>
> Should commit_hw_done() be called before wait_for_flip_done() to avoid
> degrading atomic commit performance?
>
> > +
> > +	drm_atomic_helper_cleanup_planes(dev, old_state);
> > +}
>
> [ ... ]
>
> > +int spacemit_drm_of_component_probe(struct device *dev)
> > +{
> > +	struct device_node *ports, *port, *ep;
> > +	struct device_node *remote;
> > +	struct component_match *match = NULL;
>
> [ ... ]
>
> > +	for_each_child_of_node(ports, port) {
> > +		if (!of_node_name_eq(port, "port"))
> > +			continue;
> > +		for_each_child_of_node(port, ep) {
> > +			if (!of_node_name_eq(ep, "endpoint"))
> > +				continue;
> > +			remote = of_graph_get_remote_port_parent(ep);
> > +			if (!remote)
> > +				continue;
> > +			if (of_device_is_available(remote))
> > +				drm_of_component_match_add(dev, &match,
> > +							   compare_of, remote);
> > +			of_node_put(remote);
> > +		}
> > +	}
> > +	of_node_put(ports);
> > +
> > +	if (!match) {
> > +		dev_err(dev, "no downstream component available\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	return component_master_add_with_match(dev, &spacemit_drm_master_ops,
> > +					       match);
>
> [Severity: High]
> Can match be an ERR_PTR here instead of just NULL?

Real; will add the IS_ERR() check in v2.

Cody
