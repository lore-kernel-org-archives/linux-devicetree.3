Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31A2220698
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415048; cv=none; b=FFSjJLrNU03ybBzeUTT0czGDnwKgKjQFCaZ5zn1I3l8hYDtSkG+M1bE3iUY6AG/hjAyznXDREJYkOHgxxBDa6OzJuQceqmEHpiA2QRvdrTsRXX5d2b0ENGI7fpbRycI8Vb3LxXkUfF1PTmGCq5Xn8KDzclOv5VB2+uTIVSfxGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415048; c=relaxed/simple;
	bh=b5yd4WgH9gSTGVEjmO83VVz/lOMcmPJap/YSwBoEuBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyvbUteaYmyYk5zw7nUNhG0gRHde4Q6Fqt+jLC5+g4Oe/bJdcI2cg/oxzaOIGfTsRf4BU2v6X7EC6byRPbGQwgoAZfW1QskiqbP1n8rzeIQWSqx8eDz3lxOFG1AdC9mK57HFPg+DWtC7BjMZGqMEPqWRMzbJWPsOf1sp0jhruRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Z17rhzku; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Z17rhzku"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so2526216a91.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786415047; x=1787019847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viXXO3YBsu1Fz8lBiMsjk2TVrG0h/+p2a3sGOEyRNlQ=;
        b=Z17rhzkubpmjgfmia3tZUhS5NSsJQ7qrjZ+Q28c5Le7nzA9WcXYgKsk7euqRZ44hCn
         2oAmzGBsUM3V6bjtCkAlJ+u1F8NDoOYqX09g6RuaBpn0B4EUwxde90UIfY9m4rwNDke1
         bicaNt9Azm+3GlA1evbTOHkgWWmzavri2vJppWuvbcd/eMwf2ATYqqg3V2L7YAHvJlDz
         lpd3QQ4ea5L0zAnCEtHcVROpB2qNaBSnmt4vZ9BJYwOMY4HRJ+RxGW2c/fyS9IwGzg+R
         iE+CR62ZQOzFazGUH5VpqlQVvpkptfo7xGLJsi/2sGxaoIavjMp7jPerU58rsmLICWxx
         5uEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415047; x=1787019847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viXXO3YBsu1Fz8lBiMsjk2TVrG0h/+p2a3sGOEyRNlQ=;
        b=KqfbNEJszuJHeiLfoC7dArZvwE7SItYIpkRlngGomP/Mx2XAM+HYNqqwtKMYM+1fJW
         HSRacxyF3hq2L/vov0a94ykk1JiOIk6n7qnNXy9iaSubJnIPB/LcsDF1RgxnOEcgCK7e
         fAzTZ3bz6ICpovbG+q75UI9f0cXICvhS0QDe6XpuGlyVu0wL79RbXOvFUhoNPzH38zo9
         SnzAvELTViaFHfzyzkHD3r7oGDp6SOMm2VI3kD/zwNn0g36RZNr2p9eYt9grYdoXQ1ka
         /clOusA41Hf8ybiE5rc4yadWZ/LoeGTLQAbAH2RBlF48sdINdufJPNQ8YP2uTa6f5AtU
         tWAw==
X-Gm-Message-State: AOJu0YxF9x3HoeANpVKD4S9Y+qrgBmGUTpNnPsn26rRoIFeENH4JJ9iR
	0DoCSSLAxLxNfjMvz1Q6EOmTuNyiBWz4Rv/J6an8d+PdDNS1Ql5qAdtfp77BQOSDusQ=
X-Gm-Gg: AR+sD10iG70Y5fUEdXou3MzaHb7q3S/sKeYH/THBKqpe3LDRmM3GCz2mrMpQE6RSVE/
	HPxbb70Nc/zCrCoK3ypS49xBV9q+c2dSbDw3fOuJ3tQNGOc8CUeOEYTitjZM8rXWFjj6NPplEil
	1QNvsmQcO33XrFCg05es0Igwakbj2O554pzJvmaLWTS/kPT+24tRxH0sInNmY/a1LIS94K8oKQh
	FxAj1jUatIQ0JscPVtep/HUhO+z6r7M9lhk1XGnuaB2XV1b9fQbhivP0K+rXbpOzvUQc4AxVEyr
	kMyTMc0OJ5lK1hEiDFH0Q3gP18sz5VqkyhxnD5ertCTvt7xmb/HtiGqSMplQD2YKu2hutm7b8iW
	T2UgCADKxpQeKu9UNvF04XXQOJp1xzUp4RS6lUEtX9P3YhqaLowAwFPd2dWuGS7IQoxAj82mKQB
	w1LIs0yZdzbXCP69qBT26X65MptaxMHuOOSrRk+/cKuvlwdKsDUCmj8y7Zc6Y=
X-Received: by 2002:a17:90b:2649:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-392cc937909mr6926858a91.9.1786415046953;
        Mon, 10 Aug 2026 19:24:06 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d4051b98sm1572918a91.1.2026.08.10.19.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:24:06 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:23:56 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Message-ID: <anqHvJrZQZmAj+ul@plin-1878>
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
> 
> 
> btw, when you send a v3 of this please mark it RFC, since you're using
> placeholders here for the commit hashes of the extension being frozen.

Sure, will do.

Thanks,
Peter Lin

> 
> Cheers,
> Conor.


