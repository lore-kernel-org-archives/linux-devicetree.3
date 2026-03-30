Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6922733B6D0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883352; cv=none; b=SE0pR+YXxjHUGnaRzuTDl9XpQIom5Cl7DBNSFDXC0uY6eb0Pe8NorQfYyKtWShMN57yuPwl3d5FhCcaAEJJ8T6ClheHFWRR6TAw2rGDZRDys/Ee0y+Q3+RbcBOB8YQg7w+EweQkQEdCRf+LHzJ2UbdyDOVNNX5riITPGd8kF9/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883352; c=relaxed/simple;
	bh=UETGGgVBuUFVU//IoPb6yqREGa8Fyc8FmIKlatx8jKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDnRWO3z0qwfcnpmuo+hdaZTUCvdOqNQgCRE330UG+9HVDas/WM999HQP+Wo2B+8xyHkr09WlhuqKrfjRa+eYU6gpbN28pz47hgTK2kAXdf1Gs6RU6dvrKXb9pE/Xr6lXWU2ZtdsL4CbpCay7pWVgKeOy4IB1h6Qjsb8Q4ijWzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8vUAr6k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ol99mi3B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8vUAr6k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ol99mi3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774883350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7RZylSVCYgAIw5EH+90iXOfbLfETW2Xky5UhPlA+i2U=;
	b=P8vUAr6kFaYk/Ch4fnNpG9bGn2sPJV3RtjeRefSlJK0RP718rfk11wWj3nrwFBtLykaVx7
	CEKfOn9BUa6mfrUnAlPjz7jt8BIZjAuDc15Hzx1aZyIuEjNuQv13tzrYZJrmH/b0CVGGgF
	PM26Vyynv7adL/ufZ8ZtDAKsnAyDU3s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-NBv7bgPbNoa2NXXLK2Yhug-1; Mon, 30 Mar 2026 11:09:09 -0400
X-MC-Unique: NBv7bgPbNoa2NXXLK2Yhug-1
X-Mimecast-MFC-AGG-ID: NBv7bgPbNoa2NXXLK2Yhug_1774883348
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091782ab06so238022051cf.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774883348; x=1775488148; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RZylSVCYgAIw5EH+90iXOfbLfETW2Xky5UhPlA+i2U=;
        b=Ol99mi3ByiWoZqk2YGxdee5Ky9+lYtw255wjlUjibu9l6572lHPLF0dP59LFtQKngU
         w08awrwKoeRJKHsf8luQYoAa8mz4C41vFLwWyji/F36OU1k4qseYMmhBMlRKxI4nPKK9
         MCKNCCKKJr2xFL8JowkuaiWqlg5g9f7VqhKdKNQv7LrtLU7wTj9DVXn4sCdheIim4J8q
         l7ZzEXZIhB87/xNIjBqt3/VPs4jXBTTFXCkSokyke285ls3ckSKMFC2azLGcCU+p2DHs
         brT9yXQOYMWHeRYQFXOLtkGB8RqaD2uVW0MXF88d0Tu/ydSVPOxK+rUwudLi9uGQEois
         GHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883348; x=1775488148;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7RZylSVCYgAIw5EH+90iXOfbLfETW2Xky5UhPlA+i2U=;
        b=JNEYQ0iBgLxsvQhz3Tje1dVxX3xmxtVdhpz2loJX7cR9wupTJmD3yuMEEbfgsr8GM2
         NIVFaJ8pj2iVPYfHvc1QVBRHPZxD4QhFz+mFGI9ExD8tb37kejVCu3kS/H5OiK97Hdsp
         NUQGG3YEsilvAR/oCFBJwZr0HxhgybjcoV1ouzNiHNcuYBhIxiyK9za4aZzs2AclXj7l
         bTnyx2givgpptag0iodrRP0ZFSkhtnxyet5JAcTISlB0lIDaf399kwN33ckNtYwtzkQT
         9oTHJNTrjqyVGIhzbUKxiEbiqC6aGkCmrg7XnHdW02V4blm+SDdVkszklusc4lcBF9fL
         4Eow==
X-Forwarded-Encrypted: i=1; AJvYcCXQqf+ZY4ltQ4mE+rqoTEuy6wnwoDe+wNHke2MGGjvth4a6cI60y8iHXlXsxgBK61gaGasK0F57QsEW@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxqUHUygSP0Wk+HGRdEUkjFtq27qPVaDm33AFGro51gEJBslM
	cbqGawZNzrJGc5CrCw+DyAvCYywgHZaV9uBmza3PlOnoF+E/98l5UsG2E0WS+jJfvaeEA1ptTMV
	fxN4o2Cwd51lL8Hu3O9QDW0TGNLvPReM1XWJz4+3HNP9ZN5vKlSomKRLaxNzKH/0=
X-Gm-Gg: ATEYQzzuaFgivLn4JORKW2Advc1SHLZCBcgLMNNvtD1CjoWj1skTYJtzrq5zhzW3SPL
	vD/KeDEPCl0hHa4VlQCLJnDu7FlfDlQUmPHtcNuGPDBH3J9AaU0KIffZ93M1NizXc62FVCC6S6h
	sk4Ulb3YaMhG8jUzT0iGfUxfcf/bsZoLeyRZIGcJV3bOcv1QNOVFlSp9XbuE3+72UCQCKL+wBUZ
	D5MFfFRvmYpIiu8MySfhDMJZBgPG84jSvlBxbvfn6RYV7xqSG2brOKodowu6Y59RdDLRIIKvrN1
	fXlFKlVTk+QnCF+MWgQC0wFMa/EcsVpHpgDs0xnuh9Xg779tFMXQNtSIa5ncM/trCtPkIZnx2wk
	pPY4hUzqOyy0RLW7Heo1iEVeoLPNPDDbomsU/ec1Z7NEJoRlU3UTQ/4Hd
X-Received: by 2002:ac8:5dd1:0:b0:50b:3b54:d796 with SMTP id d75a77b69052e-50ba380f13dmr171149621cf.27.1774883348264;
        Mon, 30 Mar 2026 08:09:08 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:50b:3b54:d796 with SMTP id d75a77b69052e-50ba380f13dmr171148751cf.27.1774883347545;
        Mon, 30 Mar 2026 08:09:07 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2e0fe31sm63567841cf.20.2026.03.30.08.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:09:06 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:09:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 10/16] clk: Add support for clock nexus dt bindings
Message-ID: <acqSD1k91pKGj0Rr@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Fri, Mar 27, 2026 at 09:09:32PM +0100, Miquel Raynal (Schneider Electric) wrote:
> A nexus node is some kind of parent device abstracting the outer
> connections. They are particularly useful for describing connectors-like
> interfaces but not only. Certain IP blocks will typically include inner
> blocks and distribute resources to them.
> 
> In the case of clocks, there is already the concept of clock controller,
> but this usually indicates some kind of control over the said clock,
> ie. gate or rate control. When there is none of this, an existing
> approach is to reference the upper clock, which is wrong from a hardware
> point of view.
> 
> Nexus nodes are already part of the device-tree specification and clocks
> are already mentioned:
> https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
> 
> Following the introductions of nexus nodes support for interrupts, gpios
> and pwms, here is the same logic applied again to the clk subsystem,
> just by transitioning from of_parse_phandle_with_args() to
> of_parse_phandle_with_args_map():
> 
> * Nexus OF support:
> commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
> * GPIO adoption:
> commit c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
> * PWM adoption:
> commit e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
> 
> Expected Nexus properties supported:
> - clock-map: maps inner clocks to inlet clocks,
> - clock-map-mask: specifier cell(s) which will be remapped,
> - clock-map-pass-thru: specifier cell(s) not used for remapping,
>   forwarded as-is.
> 
> In my own usage I had to deal with controllers where clock-map-mask and
> clock-map-pass-thru were not relevant, but here is a made up example
> showing how all these properties could go together:
> 
> Example:
>     soc_clk: clock-controller {
>         #clock-cells = <2>;
>     };
> 
>     container: container {
>         #clock-cells = <2>;
>         clock-map = <0 0 &soc_clk 2 0>,
>                     <1 0 &soc_clk 6 0>;
>         clock-map-mask = <0xffffffff 0x0>;
>         clock-map-pass-thru = <0x0 0xffffffff>;
> 
>         child-device {
>             clocks = <&container 1 0>;
> 	    /* This is equivalent to <&soc_clk 6 0> */
>         };
>     };
> 
> The child device does not need to know about the outer implementation,
> and only knows about what the nexus provides. The nexus acts as a
> pass-through, with no extra control.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

