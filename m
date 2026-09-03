Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD86E4EE845
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453415; cv=none; b=s0sl9CTpXEv+hT2RSllWLYXyn2QGAEt7bCljAPu/T+68iKAR2P5USEIoWhPo+FiGWuIecHsCXPrfdfNMBfZv+cKJh68mAH0r+Y5+L4Qqw0E+bn+zR+pHSGvgea8+G3HBd30YDxtlQEMIoDSPEyBmGQcDZH8LJhswNI0EN9c/zD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453415; c=relaxed/simple;
	bh=XydwLZg79QE9i6WsiKtoR53n4EvTxMwuiXwTwuu7/ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0Hy32Xa7PISTd9IigUdDFPISLlI+3aCGHObujpIv3tYrNO9ZiMFaBtgogsBlcPSHa4NQssUHg7IeS5ePf++ojGxK2j4TdO8+/z2GUHBKPQz/5CgpeLbICWq8FLvEfSpbup/ClWPBMDqXwl4TCUivjHwNgQ2srKHs0azxY/i04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyisQV7n; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyisQV7n"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc328b43a56so116474a12.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788453413; x=1789058213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mx2bivaT9nHj/TUUekmKHf7Mi+OS/7gBxKis+Uo212E=;
        b=WyisQV7nHcq7D3yVSGIrgaS6K23pR0zNRJWSQ+EEYpJxqVo7Mx5liNvczDdr+N/fVz
         Qf8pF4Jwk6gN8XFCGBbljYJta0T/yzbHICyBTuptxBBFWP/qEj3GMfzw45BZRb8Q9qyc
         +kF/XQbP1gtE5C3i12Vw/uAfuSlyog+YLUZ3XaU2X0tdyTyxFZAUN7WJrW9cSg+F4K/1
         UpQtGw8a14MwGzhhv3tc/adck7aI++sszr/Y8LI57Y7zR6CPG+WOEbveqQO6MY4hq+bY
         fHgw7RedIOn0Ujtbo3wOrWUvNA7L8TcGhkr1mReXvPFmnhccPa/iB1zkL4H5jQKB+5Y2
         yNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453413; x=1789058213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mx2bivaT9nHj/TUUekmKHf7Mi+OS/7gBxKis+Uo212E=;
        b=j8UH8BJIvEVY0+4V9YUBx0MuDdn0baAIs4pgOPSSQLM/HNPBeqJtnBxCn7VT7aLeUP
         x/FOPUsM+ZHRDPNZRdTctaUWfBuiFSOcM//PhPms1Z+aQpMhuytkSYlFzXs+6lXgSJrC
         0BbEzVdMX9Zp9sgKb4369Q4d+OLl8C05+A3a2kZ3jHSYsABpvWDA6lxFP+ywqFcA1mu8
         ri/VVaeQnpDw7BVokeBw4/pnazgHn9YJVXhLxoYAChw4R+CTaf6ULCcHNHaVbcZMpvWP
         nqZyIZXvQQ7w1kIuPXvEKbykdTi9dsVF3rmHU4evhOoNQjUhNcjSRd4Dzopk4bFMfcT9
         cExw==
X-Forwarded-Encrypted: i=1; AKwUvByFg/Gf16hHqh0U6epwVouAvhFszdchE8gw6EdukLY5nZVmxlCv0E4jdLPSh3ecI/jC8D2GWOF5OdOv@vger.kernel.org
X-Gm-Message-State: AFuF++n4jkz7cHlwNIHXAhOiJFXeuzDtXRgJj3xPy0gC6t4gaWocFJyW
	+rJ9Af9JYAkc2LtZlhLRSfkJsuaV2ca6GDh2DES61v8DXSa4chQhdHipElCzYM3f
X-Gm-Gg: AYBFou0yXxOmQC/IGFFyuXBmOj9w7YciWssRwdIzNBHzxiDC961vmppnTkGnGVjnRoQ
	Rfqm8QI8Ui7AOqWtBzf3ay0J75syfOKGDuvm7HYJkFK8SURKUVhQ1hqeAoy5R8xMPj4TyFQLOXu
	ym27KqazGRRIbqJE9qA7YeYs+fw5lbSn2Amn7DvsIGJt43nQ7fXlMWMV5s81R09Fe/YlTI3i4aB
	AbP3qVO+IJmvH4+c/N9Zr/z6znntTJ0jn1/pwh4UmMC8V850hYNRWXBoosQ6y9wWANS7+BhwymF
	fPrqcit7KmDVcUEjZWwwTJkd80veyEyfVsuf98C94oZU5xKUTpo2CYPZoe0viB1CuVXSZWD/16k
	IaVSzmNxZegiVcvyPlVIDBJ+ZvQRHH5UvzCsf2mpciHwhbmnQawaMDpJML5gy5VgOlvlDt6UBzR
	/WZRj6LgNCRlceUwKXudHpU4K1BYKgT2icqQv3lftB6UJVgnwOi7f1dE7izGFcRl2O6DQ=
X-Received: by 2002:a17:90b:2d83:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39aee049464mr22342206a91.15.1788453413101;
        Thu, 03 Sep 2026 09:36:53 -0700 (PDT)
Received: from leonardoc-nb ([179.160.36.119])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm115281eec.22.2026.09.03.09.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:36:52 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:36:47 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <tu5f2ffhfe4vxw2mmdz5qy7svu5a2wi4on3ixrx7zn66chnim2@3tb2jnwp5eke>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
 <aoSqJ7pHEgJ_RZmr@SMW015318>
 <gsihg6tzkrq6gcygquzbjtiqntvoxp67lo6mqntnmbyvyw7s3y@suv4t26pl5eh>
 <aoW7M1CmaPWDxvhE@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoW7M1CmaPWDxvhE@SMW015318>

On Wed, Aug 19, 2026 at 09:18:27AM -0500, Frank Li wrote:
> On Wed, Aug 19, 2026 at 08:56:53AM -0300, Leonardo Costa wrote:
> > On Tue, Aug 18, 2026 at 01:53:27PM -0500, Frank Li wrote:
> > > On Tue, Aug 18, 2026 at 03:08:33PM -0300, Leonardo Costa wrote:
> > > > It seems that the drivers are being deferred at boot start by the
> > > > device_links_check_suppliers() function. It runs through the drivers before
> > > > they're initialized and defers them if their suppliers are not available. The
> > > > GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
> > > > (through the of_parse_phandle_with_args_map() function), but from what I see,
> > > > device_links_check_suppliers() has no such mechanism. It follows the phandle to
> > > > the nexus connector node only, and since there's no compatible driver for it,
> > > > the function defers the consumer drivers used in the overlay.
> > > >
> > > > I think this is what is happening mainly because setting the
> > > > fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
> > > > flag) solved the issue, though I could be misunderstanding something.
> > > >
> > > > 	int device_links_check_suppliers(struct device *dev)
> > > > 	{
> > > > 		...
> > > > 		list_for_each_entry(link, &dev->links.suppliers, c_node) {
> > > > 			...
> > > >
> > > > 			if (link->status != DL_STATE_AVAILABLE &&
> > > > 			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
> > > >
> > > > 				...
> > > > 				device_links_missing_supplier(dev);
> > > > 				ret = dev_err_probe(dev, -EPROBE_DEFER,
> > > > 						    "supplier %s not ready\n", dev_name(link->supplier));
> > > > 				break;
> > > > 			}
> > > > 			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
> > > > 		}
> > > > 		...
> > > > 	}
> > > >
> > > > Has this behavior been observed before? Do you know of any work being done that
> > > > addresses this?
> > >
> > > Does a dummy container driver (for debug) to proof your analyer?  Let
> > > me to find time to debug it.
> > >
> > > Frank
> >
> > I made a dummy driver matching that compatible string, and yes, it did
> > solve the issue.
> 
> Thank you very much. Let me think how to fix this problem. Nexus node
> should be direction overall.
> 
> Frank

Hi Frank,

FYI, this patch sent as an RFC addresses and solves this issue:

Link: https://lore.kernel.org/all/20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com/T/#t

In the meantime, could we have these overlays merged as they are right now, and
refactor them to use the nexus connectors later, when that patch is more
concretely established? We'd like to be able to have these overlays on upstream,
but we're not sure how long it'll be until that patch is mature enough to be
accepted and merged.

Leonardo
