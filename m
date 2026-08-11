Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9518B417355
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436705; cv=none; b=qOAbecyBF/ujoLeKDef/yISjhJOtEkyoxTESKPhtXwcgUbo776BXv6GwbWKYyXg7mJrKdk4+Zj1yPTQH1VzR7xTHy4xl27hhJjkSFsjhGmFDi5rE9TYtzir7Y2VNtChBJ1FXUwo5NdaARGx4gkJjM+kljCtJ5VvYUDep4U6lTfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436705; c=relaxed/simple;
	bh=OOCaryhxL0aZFIpqWVWChO/Kygk2/DrH5JEkdBY00iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osZVhC438ThzWSuKyMmiyd0CTWIlBQqcmizRzwQJ9JFx+AQrEd1si0QS2Cj8Nb8Q3GhYMdZkPHS67zOD66+cMHEj13E0VIVMfTEPhAJPzvCqSe4Epr2BlDNugSsA+JFbbuayDbUe2YVaXoy2rKm9TTROxpYu3SaLcmD8RTss+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=nshrsKj9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nshrsKj9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2951323a91.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786436704; x=1787041504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZbxtcArluxLyA8miGWugZbCFD+9watkIVI9ZpOeFGK4=;
        b=nshrsKj9EhEP6yuPn/lyDiOehVenaeUAUs3zoeUbZzvxjhqhq+tbUNyTT4qL/rlODD
         cfPvq6lTh0eUj5BQqhjQ46QoA7HJngPAgerbNkLM/md4N60aq+ftI1JAGN3GsKLK79dv
         BzChDbEn+j0TRpUHnulnkS1YfgJ8NlWH2Rd8g3K+qqom3JMcWwmywdQ3aECtlgLUE1YR
         w7ZCRjot60J2K7IiI1C/kD84HZKyVpy8r95j3bC2ODqjGpa6xoQPbkMTDyq7MIzdxh+B
         xAU81BA4V59s7g2z1mbrpULZ23F4x5IWrZHJTdxZTVpiXxzmMHwsYcqMJfiMx58HLE59
         HROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436704; x=1787041504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbxtcArluxLyA8miGWugZbCFD+9watkIVI9ZpOeFGK4=;
        b=rhKXYM2aB/nhLJGtmWC0MjdJV/8OVPlZZW02Q7llYJXY7lZwEXshDC1jNQ95vfn30Y
         g/qwKmdkWAvs3SS2r15xeWLmptZT7xaUSnVOapwvozBbWD0YyTA2WArMxjb5y+GSt9+C
         hZxvn/MaPSTGM8dAc55aJihs3jdtn7rIiJWc2MSSQ3Lp7AKaQCKeNcCS15B7rm0xyMMI
         fZLtXWwbEawN7YbEao/VPX4VN3Me1VRu7LJM3o+zZwSeJkl74fsLth6YUOpgf4/+5uVr
         w82xFetpFflk8+y2uw63ELgFTy0b863Fw0/5IMwuZ3x/U/ez3oFrR2sHVaC1dGAxCkUf
         4vpw==
X-Gm-Message-State: AOJu0YxTcwui6QQsZvtjdJhCCyFdilg9+z9su+I9hLn4z8GuvphLtF2p
	9WXvPS6cWkpS9H/Y135Uiex+9w0WYLIbT9nxIwyp8Zmpe5Bd0COnUax6gGny1z7xu1c=
X-Gm-Gg: AR+sD10NEa50LmuT3RRmqll21Sfm6lXraxjwNHQbubOPnOY/s4MxaGzVDUf5Yk7kwR1
	bjeHgDm1Vu9s8GrZkNoV/8kAwTIzrJatC+8BGxqrIdsO6xvCC4+S7P695dxEuChga9eR5jXhf9K
	sQQ6wp9kFfH7WijYo6j1ESqNKR+rJX/v3lViJXN0HW0dwtAMSV3hLUFol8i3ltQDEKS9GAm2shj
	cAKVJkPDzEA2g8SpK0DpravLbAsS2q5XQXSx7DaEeM7hs7yBuIk/gUqFkSyUSSwLLzRFWvh9A0Y
	yD4rM3fE296ASOpqAm9CdcPri+uYI2v6SJDm/lHFeHmP4g2Ivs/hp+heGpErMJfo4SIqP3MjxCu
	DvVXwdQOcyIWSpjYdgrUXBFT115nII8C7+xEnVsWIcZVCiflSq+LJkwzF91nUVZkzyPKW/Zlw36
	WB7GJ4h2HP7MlcAtCvux0SoIWiS980OuH3mPFFYxp2uxmAbA358DgvD1exwrI=
X-Received: by 2002:a17:90b:4ace:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-392ec74c9aemr1532247a91.19.1786436703800;
        Tue, 11 Aug 2026 01:25:03 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee1e35b2sm1038839a91.4.2026.08.11.01.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:25:02 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:24:52 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, dfustini@oss.tenstorrent.com, michal.simek@amd.com,
	junhui.liu@pigmoral.tech, darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org, zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com, pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com, jim.shu@sifive.com, zong.li@sifive.com,
	greentime.hu@sifive.com, robin.randhawa@sifive.com,
	scott@riscstar.com, dave.patel@riscstar.com,
	raymond.mao@riscstar.com, anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Message-ID: <anrcVIoupzPVA74B@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-2-peter.lin@sifive.com>
 <20260810-penpal-aluminum-772319e5fc10@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-penpal-aluminum-772319e5fc10@spud>

On Mon, Aug 10, 2026 at 05:25:08PM +0100, Conor Dooley wrote:
> On Thu, Jul 30, 2026 at 12:39:06AM +0800, Yu-Chien Peter Lin wrote:
> > Add DT bindings for five RISC-V Worlds ISA extensions
> > that implement World ID tagging for hardware-enforced
> > context isolation. Also, add checks for extension
> > dependency requirements.
> > 
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/extensions.yaml | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 2b0a8a93bb21..7a57191a0293 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -193,12 +193,35 @@ properties:
> >              ratified at commit d70011dde6c2 ("Update to ratified state")
> >              of riscv-j-extension.
> >  
> > +        - const: smlwid
> > +          description: |
> > +            The standard Smlwid extension for M-mode control of lower
> > +            privilege World ID via the mlwid CSR as ratified at commit
> > +            TBD ("TBD") of riscv-worlds.

Also, I will follow alphabetical order in the next version.

Regards,
Peter Lin
