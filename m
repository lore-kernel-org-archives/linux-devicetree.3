Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512235218B1
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986278; cv=none; b=D8ugbgFPASwHSr9FULnTAoZ4UFqSEfOlZmBwOF7d3aUQo/Wz9AMiv+hIY9FRHb1UwnR305NCjYxYxUO+4r6iZM2+dK077N2H0aNVWXr01Lo+qPgaXI1RIDjiKWMiMv+92ajrfI7skXHf+nCL94izegg2GthumZkBBjDgu5ayANA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986278; c=relaxed/simple;
	bh=TMXUtKO2nNHGtsYqDTL68aTnNZaX3Bqh2FqKHXbmdTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JL4ee0+HPMuYxZwV404Ncdb822c3+0NXOOUms4SZKeqEOFSFDnbVtC6ag3Q0KI1RAB5y0ePzd7L5uyPOgxbTVPpNqfBzmOgxxMyuLdBKX19Xmw5HMnHoiy8KWgc9cP86dVOTuvgKVql/OwG7MTbiu+pLpG8cWLlCbDUA7BTPsWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRnV4Pgx; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRnV4Pgx"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4f6dcc0e8ccso3660783b6e.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791986274; x=1792591074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7e0ci0C74qh1IaIQAQj4oYwASorhtlXqumTlEsvUPK0=;
        b=SRnV4PgxoyO/rK11xHbo2RUY5RxFlIrH1aUrPbYfKivHK8wj6HiAcQfKr3DmSAFHXz
         eFDkUH5AmcFpLCroyjxBBXubBxlgqp82+fuh/rWg88Guci9tgtVwPjnxL2/5dLUKLHwb
         jMhc7Up3NGrMelNMLozVf3VnOewqzcVrUAw6mGEfkzv5Wy8KaE86n+UAASxUjN4n+nVJ
         hwnhBAUbKmpgyYEuX6IS3wwTON1IsUdh5Gse6Dl4PiyCnimRE8EE4CT1pDL2jNJ56mgC
         Ww27gbuV1WVFHd5wZ7U+mididDHlteMxmw9XyyhpnsXnC22zNAoJMhaCQJOvpsCBtZeA
         rk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986274; x=1792591074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e0ci0C74qh1IaIQAQj4oYwASorhtlXqumTlEsvUPK0=;
        b=m2UZ2kBlcg7qGmQeYBLIyygOQknAaOcrfrqJkvG7GS7uNXPd7Zs5WOfoukKzTJOcmH
         oYh9LmI6EZNrwrj00HN2ONnA2KMasfqCWQkT/kdNSWcJ9FdfsBXQ1vPURstwevz8q6vD
         Zyc3vIDAyn6o85iQH2aKrnSaFho8cs+bpGy4R5fks+ie91ZvMmTmwlh0OSwzAHCOoNzj
         RWEuOUSz5oy3NGP+VUuBsK1s7csGbQOIymopdlgqu90bpST9FbkY4r63lI2kbf6GfGCr
         wwdm6KmeHPG0hcwGHEGBieOebi4vInGc4z0pyaxVXSiPW2xaquIZTgVqJmoWmIOQaDdr
         HQ3g==
X-Forwarded-Encrypted: i=1; AKwUvBydex7SI+nGiU/zXuxcdm+ZkBfpEtvSQJmSYtc6JLbdXycajUka7aqzCzAZpwe39WgSrsgD6sn2b8cr@vger.kernel.org
X-Gm-Message-State: AFq9FYIGZb/sQUmSUe03erkMN7vIEZq2B/XpoR8mu7xyXPyC7hm/xoAg
	tcDf1K0JrF4cM3XguV8ZBMxYGmcCJsQmfIv8W1zCy58H+mUTGWpWflyX
X-Gm-Gg: AYBFou1UoRVZ9VCX6dT5jleJaKLQkOzZdnMrDZcxxhDdRGa0bNMGvcwIE33Wx5KpDvx
	G3rfppe38VQcIKoEIzDwGpTM7BMNKFA3ESdxKAN6bDTx8lu14Fz4ZEn9VQpvBUHWdKgPHpGdO7D
	tevbWMhWa6nDhjZv60MtAx5s+kMdgPnIMdO/4vDqqcDV4D1ecMUO08Xc+/e30ZlWB7Vmv9Cxgz0
	7NyouL7JYdThCldQQi6geNC43uMF6UrPpYIvezxRh+17TpNj0Zcj33x89UrTwL3oYmFQ1qgE1mK
	SJ35T15IvBKojbCogPPajwATzpXUKy1mcuTTnlglSv1EVgLKQuuPPoVb/Z2prBPx5uhZsoyQycE
	PctDMJpUqF+XuZQPWFctQqgxOqIiv/2Z4ITfbOIRIM4J8MrFu7sYBJ+M7qG3teJz9H8EHFxGDfp
	7/wXVtZJ3GhAfJQT8z23znSLVMSoeCFb0fslG7E71H8SKLCxc3UkwyIVLNp0OImT0NDl7U9UOg7
	owTKlKSenb/paE=
X-Received: by 2002:a05:6808:1a19:b0:4f3:28f7:dfb with SMTP id 5614622812f47-50c516e42fcmr11298620b6e.14.1791986273875;
        Wed, 14 Oct 2026 06:57:53 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1815fd26sm17891866b6e.10.2026.10.14.06.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:57:51 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:57:40 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add VGA support for Apalis iMX6
Message-ID: <druavdvcgm3rljk3mhano3o424xyelupmcz7kbzguuljdsungx@xuj2ovbvz654>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012164054.GA56180@killaraus.ideasonboard.com>
 <20261013090631.GA33628@francesco-nb>
 <20261013111158.GG56180@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013111158.GG56180@killaraus.ideasonboard.com>

Hi Laurent,

On Tue, Oct 13, 2026 at 01:11:58PM +0200, Laurent Pinchart wrote:
> Hi Francesco,
> 
> On Tue, Oct 13, 2026 at 11:06:31AM +0200, Francesco Dolcini wrote:
> > On Mon, Oct 12, 2026 at 06:40:54PM +0200, Laurent Pinchart wrote:
> > > On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> > > > This series adds a device tree overlay that enables the VGA output on Apalis
> > > > iMX6, which is driven from a parallel RGB interface passing through a
> > > > non-programmable video DAC.
> > > > 
> > > > The video DAC is a simple resistor network gated by an active-low
> > > > data-enable signal. For the bridge to work properly, this series also
> > > > changes the following in the dt-bindings and simple-bridge driver:
> > > > 
> > > > - dt-bindings: Add a new compatible for the bridge in the simple-bridge
> > > >   binding. This is necessary because the existing dumb-vga-dac compatible
> > > >   doesn't describe a data-enable signal polarity.
> > > > 
> > > > - simple-bridge: Add the VGA bridge match-table entry and timings
> > > >   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.
> > > 
> > > Is there schematics available anywhere ? That would help reviewing the
> > > series ?
> > 
> > This circuit is on the SoM, and the SoM schematics are
> > confidential and not generally available.
> > 
> > I tried to extract as ascii art the relevant circuit, hope it helps
> 
> Thank you, it makes things clearer.
> 
> The circuit seems fairly generic. Wouldn't it be better to add an
> optional property ot the dumb-vga-dac instead of a new compatible string
> specific to Apalis ?

See the diff below, this was the initial idea we had when working on
this. On one hand, at least to me it seems like something that other
bridges could use, and a new property seems reasonable. On the other,
since we don't know exactly how much configuration is expected from a
bridge in the simple-bridge driver, we weren't sure if this would be
accepted, and went with the simpler solution of creating a new binding
for our bridge, which also seemed less intrusive.

What are your thoughts about a change like this?

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 3fba7002322e..41b00a44983a 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -171,6 +171,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -212,6 +213,19 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	if (!sbridge->bridge.timings &&
+	    !of_property_read_u32(pdev->dev.of_node, "data-enable-active", &de)) {
+		struct drm_bridge_timings *timings;
+
+		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
+		if (!timings)
+			return -ENOMEM;
+
+		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
+						DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = timings;
+	}
+
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }
