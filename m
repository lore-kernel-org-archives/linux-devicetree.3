Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C79A418A3A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298785; cv=none; b=fCz71nq0QhQavOvwKFSngtSeg4HqsIq59Og2h2s4T+PyrqWx4fb8ffAOyfOcPFJxB5YZacvK6VpIOUoC6EDiLrf+KlHYwzL9vM972TiuaFmuhs31M3wjSq3ABUI7NA8xDMex39myU/Qh/8md01J2lYnphEUej5NxDqUCgcJml6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298785; c=relaxed/simple;
	bh=4lX2KTzLDxqkajLOI2x4b8RcuUBUe0pdPMW9ATeAUss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XejrV3ezEbB4l3psfb2b/9prIzk1QL13j3gQ3hPX8aLxChyaGkA15EQFCYDD1D7Gcx8Eghw/gtf3kf37MSiNmAEWdSMru0wCIoI/xTJSvx4Qx2ZkznymvKqpfywIjtr7aCiR5bkT8oHxkail6JsRvPN5F2dR4WNG+bnik8hlk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SvCia4qX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xac3qR1H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SvCia4qX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xac3qR1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784298783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uiFJW7yDa7Q593qaNVa5df8mhuriHuxHGUsJACa+pQU=;
	b=SvCia4qXaGWSDAD0hmfflW44MyMZEwtdYXZN2mpbw1ak8BPxlrHmH+WX+I5OGWceCtnniC
	VYa8MD3i/33VvUGhQ3XJtEUXhk8PBTEjipvdClBbtvtEqoC66N7Y8XrFAgEjDhkwz3IRDX
	usEcrgbxmfKYtC1djLZ0toA9E4Q7Z7o=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-9chrC_ubO7y50M8Zn1JPog-1; Fri, 17 Jul 2026 10:31:00 -0400
X-MC-Unique: 9chrC_ubO7y50M8Zn1JPog-1
X-Mimecast-MFC-AGG-ID: 9chrC_ubO7y50M8Zn1JPog_1784298660
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso61849951cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784298660; x=1784903460; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uiFJW7yDa7Q593qaNVa5df8mhuriHuxHGUsJACa+pQU=;
        b=Xac3qR1H+Dt6E8Cfzbx77gJJv+KPkm0N10jy8Hun/sAKNPU/UZN3LnlIFMptgTIc/a
         q0dBUXF7fT4ZTQeWngkrjy0Lv7nJ5kKyQG7MHcJ5T7vLpmD4YEPeEeOoAz98AsYkAX8x
         SXukuHF02cm2Ilc2PnPi2VXbNkiEsJAMDA7YQ4py11uN0STP4TT7+THiUeCTe1P0VUcf
         ZXi/pCGqJqIqHI6AluppSTgrgT4kPF4xmV15nDsyiMgdmm0KvfH+SwnTLz+ABn2j4c0P
         TK6F5NV3coRTnjj2KcSYpGrv+3GUVWgb7fxpkBJhg/RSq9rkaiDe6AoemXrtTH9yiikA
         z5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298660; x=1784903460;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uiFJW7yDa7Q593qaNVa5df8mhuriHuxHGUsJACa+pQU=;
        b=CwjJaSwwbvOd1ySJdW9LXMGpTBQE0je63uH2bD0rcy+muoo3nytoJk65wrJnMz2Oqr
         LvXpAKnAE5EhZhCwE1DiZ2xd0CiKGcuwBDffT3wIF41X7QeWsEtYftg7/W1QRc0dTwd0
         Fo9ttUuKslHhN7yHlA4OMFwNHgUT47k9oBFEkTp8k93wD4ZMBeo4dH8eVJiYA7AHujyN
         dPtT6MiErGizuJVvE5zdG4KiIxNtqDa76FP8AXu1xWgKEx9KVB5bQSaAGmCfSykjfOlQ
         /gkSE3hz4OvxsnGgac/AO9hdHGYPd01WvNOA0LeLW7KgV/JIo+dD4mmh71GNOWUlrBlV
         E24Q==
X-Forwarded-Encrypted: i=1; AHgh+RqVzwoao3/LumZv1P5TVJTRyWCTDvD20mChheIc5D0veFKpLAODQ9ga23B9xXfpRr1e0+8xW2kJg9dO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcs4W7nl+rHPlEWCqSrq/F+DMXFLMHkNrieNlFurJ/dkdhiYcn
	8cQTBuyPUXf6Ad8T7UgPdfHuEVC1xRCUdSESh+SiseEAWXD3n67dH4eRooo6Av77hWKHX0Ia7cQ
	B6ELBi+N+UZor+oHFvwrz+qnBiaG5OZ//e/FqKlFypvwIl1Nr/PvygOGGj4L9qlodCTf8usA=
X-Gm-Gg: AfdE7cnPinANXkwb7Elntby2+wBnwTuEMzkT9LqhU+rdEDPYHFPUX8haA5zeYkXAz1U
	Ot5de7h2UevaAoTaNUvuRL4D8oF3BojLW9Z8MRnP1ZAoSW0tpUq2f7e6WOjxGwdth+1ekgcUGvX
	hZ2sOS93B5DYUtzmThB7+dmBDPIeUx62ci58M0qGFLgM3PDfmWTgYBykop7lLIOFLPxSH8lPZXT
	/XQa2p696tFA24t6TCk+AJRxfs7akktSjg2aarfoZo/Of/nJpUAMKtIHgS0GP1A40bhMzoodgET
	WbZO4A5QzxfC8/wvUIFQQma6+4tnrd2QrxTg9W6WcWKIwWa+GQo9qlECPTmLLIjWnpsNeXSBkWZ
	C6Btebxsjyk1LtEvz8U3abRelfY0smwrAF/4=
X-Received: by 2002:ac8:59d4:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5213daa1d49mr25658931cf.54.1784298659440;
        Fri, 17 Jul 2026 07:30:59 -0700 (PDT)
X-Received: by 2002:ac8:59d4:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5213daa1d49mr25658361cf.54.1784298658914;
        Fri, 17 Jul 2026 07:30:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13091681cf.0.2026.07.17.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:30:57 -0700 (PDT)
Date: Fri, 17 Jul 2026 10:30:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joakim  Zhang <joakim.zhang@cixtech.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <alo8n8NmiB_8l7PL@redhat.com>
References: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
 <20260709120125.3997078-3-joakim.zhang@cixtech.com>
 <allvw2ZiiyX5SGIk@redhat.com>
 <SEYPR06MB6226BD151ABBB192AEC53BA482C62@SEYPR06MB6226.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB6226BD151ABBB192AEC53BA482C62@SEYPR06MB6226.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 17, 2026 at 09:47:28AM +0000, Joakim  Zhang wrote:
> > -----Original Message-----
> > > +static void sky1_audss_clk_remove(struct platform_device *pdev) {
> > > +     struct device *dev = &pdev->dev;
> > > +
> > > +     if (!pm_runtime_status_suspended(dev))
> > > +             pm_runtime_force_suspend(dev);
> > > +
> > > +     pm_runtime_disable(dev);
> > 
> > I am fairly certain that remove() is called before the devm handlers are
> > invoked. The clocks will be shutdown, but there's a window where they are still
> > visible to consumers. I think you should use
> > devm_add_action_or_reset() so that the cleanup is called in the expected order.
> Agreed. remove() runs before devres_release_all(), so force_suspend() tears down the hardware while the OF clock provider is still visible. I'll move the runtime PM cleanup into a devm_add_action_or_reset() registered before the clocks/provider, and drop it from remove().

I don't know which email client you are using but you should fix your
client so that the text in your response wraps at 80 characters. Also
add a newline between what you are quoting and your response since it
also makes things much nicer to read in the archive.

Brian

