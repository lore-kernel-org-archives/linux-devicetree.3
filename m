Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596615;
	b=NhY0rih76j/brD3r4WORHBzhjI2sT5U7eGfZj1rUDwAw3nRMXjNuMGmjFWqV7Wp+adx2
	 gfv0CvlUcepFVHJtjppU97AhV4lqhnJ8ePdDmkgN17UNGD6qvTuHoeppRZNqHAZ0k+dEX
	 y865+Ps4lnETQoLQPa1eWsgATXho89G4+DrA5+2P0rVx3vzTzkm6bTtEtBf47l6kQKSeC
	 xASvBUzbXPyEG4wfqCL5Ib3SqyA7ASgYi2i4Aei0MgY07ojCXM6HWYGxMHT2fsBHJxxDL
	 kecOpPy4qNzKo8fB3/tqW3oqlt+TKa7O6rArfHiM58vM8gh4KVVsvJLdTYIE6aTVIKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
	b=4Lo49U3ztmoPXVAtRBloEBWx0+vIyvLZ9u4/WSJcWjBW403eS3znFAA/E5go6ycef48q
	 Rr+LaFcbv7z4/4FcMLcS3PfSAo1Pf/0ZVW7NBGh0zg0ocPNwC7bj/80ud2YIoVLy7sKo6
	 y7qxZ5H0TyazNuRTYKORgYJAb4bWIVX9ud4gXwC6FMe0WfLzaLbokqTV78KV3LbviYAN3
	 ZIuVL1g+TR5viy8NJ/t18kHYZx6MksZ/sUbjroYIKboepw/jnISlOHv0OHarJcu4ET5Vy
	 5b2PfbJdKVO20ckpBYeH+xcocKhHFs9cPTOQgmWlzxzCJTTRpA5Z0+rx5Yon1nUD5QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F0g2FVBx;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAE606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DAE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F0g2FVBx
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e00eee27dso681400f8f.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792596614; x=1793201414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
        b=F0g2FVBxNGt25z15jXHDVej8cSyycGJloSn/fXbzGxg6vLaYBa3sw+KStMwK5TnxR9
         a17xy8NhyFOaRggNefISisvAQlvSrZUTfjJdykNp+RqywmeVdXNHvyoiGos21tDt6BVl
         owk9zd28+/bo/wyawd+KbXtb5rCkzmANQEnlSfDKOJ860CgKcTt2OXZgp6mspQx0mg1c
         Gj2SpG1HOLbn0q487wuoULJ71f8p4zd8tWsL0o4XKXV6ayUMH1Pv5i3TpCioZhqwA3jt
         7aZu1lYSRPPIANGjcz7N65zGf6pKRotoLKlZQrdWyBDjOaCYr84oPVCLCb2SzrvhTXU8
         PxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596614; x=1793201414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
        b=H29ZSbxngglcx4LgaF4fERvVASUw2yYFt/aNbiRnmAmK01dXksXDMaY38VxFG0Bsnk
         O7rOTozIX+0x2q8FUtJsO08vSL43GtRVg0dautOR3hcwd5Rr9RJ4eJlzPGfsE/cQApmx
         sJ2gBUz+4mszNYQ3NNvt7v5FCJGuXh+mHHCjUAf7ptiAYPX4AP7Q78pWBxtdxSTgTqnp
         jig/P23JZH/qflBSzb7jQu3e4HLyerb7Y7F3cnoldr2nDQ/kP8wWZyBZalpoZAJ/eWu/
         o579mjplWE+py4P5hpYQKC1Ak3GtadGfFyLCxYdA44sVPHRITaEAVo7cl7DyA0u8j/+4
         MfkA==
X-Forwarded-Encrypted: i=1; AKwUvBwyt1YJK4zUuZMHHot1rm79LBax1HfGtvCTTxxBvIT3N0lhGPMFJq3ZGKoxAjnuNBCL2JWksz3lzIhy@vger.kernel.org
X-Gm-Message-State: AFq9FYLaL2GAbKE3Y820sGDfptmgCwBW28Rt9WEwoS2dBuBBDThbEBpP
	9M5upOX8bFL/r4uQl5LqNXIgXXyZPZL1Dxd6tb+sRIaBaSpve3JIzKgl
X-Gm-Gg: AYBFou03DcVSZ7mVS8eSr+cENJYgjshmB8Xz6eUNsmQBGwwX7RHNgbifPsnNYFQp+Xk
	iIbwB6b8o2DLLntG/+aRHsC3y3jwGsGyTHULR9jM5dh8Q51Bpkw2SeYl9yfeuKTiBq8zhwnPLJB
	Dv4K7A6aWeqUjKzTHCsRARQEQDF8658MKRTxYfq/Y1xRb5cNtT8qji5dR9rN+P958EvuJoWagOB
	mntEHj+F+72YC3QeQNE7OrFbq9KOcMk+ZcVwNtsbdLhlwJNZSJjuBNuC5PJ/XWmzPMHhqr/Jr7s
	5ggAW7bZAjHp5bXu9VlZWBG+dvr8d6+je3Qy+XbLnIurBkXS9fXRqPvgxw3mG5LfBIrHK4DUIh1
	bk6Rvh8FBum58qXaTecLI5WHPoZXrYew9ow2XnqFa9TP6Led9B263yYRlrXlwim+mPGp0+nrHhX
	431NndKzoETNZ8ZxjNR6XhLCy0wZTTBgV6o40bLnz7BV+VfZsT4W9JQI3Cv5ZcpxNmhJ1+Jy979
	XYv62bP+UxqlJ28F1xrZSOX3h2DlBPrdEL7YzLjLacjBVrQ68GvT1VJTUmvPzgyBMaAj9tC8OS0
	6qTx7EEBuDJlNinaAxKAhaan4ticZ961nIy3O+3hL+iJvOVCYXOQNV8=
X-Received: by 2002:a05:6000:1623:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e264e4b62mr3988627f8f.48.1792596613403;
        Wed, 21 Oct 2026 08:30:13 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm6370102f8f.43.2026.10.21.08.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:30:12 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:30:11 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <6uiccieqybi7rmdpf2bjgfppjdgpzt6sollr2y7ygex4ofssbh@anwfmi6qbyxp>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
 <20261002-prepaid-retired-3d2c9cbc035e@spud>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-prepaid-retired-3d2c9cbc035e@spud>

On Fri, Oct 02, 2026 at 06:05:24PM +0100, Conor Dooley wrote:
> On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > [...]
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-map:
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  gpio-map-mask:
> > +    items:
> > +      - const: 0xffffffff
> > +      - const: 0
> > +
> > +  gpio-map-pass-thru:
> > +    items:
> > +      - const: 0
> > +      - const: 0xffffffff
> 
> These seem incredibly wide for something with only 4 gpios?
> 
> Thanks,
> Conor.
> 

Hi Conor,

Thanks for the chat at ELC and clarifying what was said here on the
list.

Regarding these masks and their width, they are indeed wide but they
determine what to match against, and we have no reason to match anything
except the exact number.

This was previously shortly discussed here, and clarified by Rob:
https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/

I'll be sending a v3 of this with only the camera patches soon.

Kind regards,
Ernest

