Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992F3E7BCE
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525968; cv=none; b=tft3KsuYmJsSpk55AaujXuNpV8DrG5AyWX+qnoB4EFygyD07vvW7jb1UcmeCTCkYxgYEyEVz3tLlWK/5FVBR6f7F7rfaPXgt1jRawaD+ODrphlCbbJRk6tqORaiI+CbSqhDV18SjGFQvj3oNqZm/cdP/3eLQO+PAL7HVi/2g5Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525968; c=relaxed/simple;
	bh=fBO2hJf4+rPrkOp74SVXocT1M+hIBpxOon9pkP770BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bgas9IF4D0P48j99Bo7Ype59TLAOVNjSiEiuVPwpg8m/eeO1CwCAv9PVvQePjJnXhoZmD7wn35pdt1OK5nuOidmDcqArAXKan4Li6SqG//FekLDmM316yVIIQS1eJBDBel7UMlrCF7MB1r2ZaSxEh4TiYh+26GhOWshjd7MOWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjmew9QS; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjmew9QS"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51780bbc560so36581911cf.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525966; x=1782130766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ZBzvTGg5RXWxT981zetPvdIqY02XPOz3n0/R5VS1+w=;
        b=Yjmew9QSovj+Gv8k1T854IGf/12+JinUw11DK6RSF7W9n4aCMc/YwA1tYGlKcItWvE
         AbU72v7UHCxAW3snmUXOmRdayDtgTUppa7hLGOBo6bxv39Hd4aNnZu32x3+1THuwWubD
         0jUt79H6VTs0fx9SciXc3Qi9NxSyO8YOviBF/a0T0oXHwNFkDeyi5MCG/lHIlXvqdNW2
         /bAbqGiZqTBSBZB/EC8h+KoW3pOi6KfP90wSVoGOt3HVdY83ogkBwVJ8IYTeeNFeKJyf
         zwtSrYrUrgSL9b9sZiQxuKn9glvOEZWtCCacxTx8A7Lm/w3E9p2tuhsOJ+J9/dPZ/Sht
         7Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525966; x=1782130766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZBzvTGg5RXWxT981zetPvdIqY02XPOz3n0/R5VS1+w=;
        b=XvDkGyej0lLB6r09QnIBP+mntATF+fKyvsUkhEClQ9Wn0gh2nv305gKTEv1q30Lo6f
         hunZx99xiSrc0Ad65wYBcbcN/q1eRkbyOF3gFrF2Hqpf2XNQzyscGtgn0AdyD/4ifOKY
         IoJEP0rjdCsvDhJpCHCejmA7Sux5m3TKCDCcHJqkVa61CQHuRVPwbO/3MhaLa4N/ktfU
         uGZnduLuZRm+m0GwJ48ZtRaIlIG1a3rFSEavydV+sCxz/ns7/U6y6IOh+DZTkqBTews4
         igydqKBiTyTR6h1ylCUqlKsuxNuBQkj9VeMgCskxuV8WCLz+nLyy+jPhmqxDJTS5gMZQ
         jKZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8j3ViQq8VKVAHgYf4xk1nC1+msYWYIAKoy83xD3mNEH/Abucqo/sDxJN6sEqRaAthBiFmpXqKKcCbA@vger.kernel.org
X-Gm-Message-State: AOJu0YxUHwJjoNzY/f633KctM4YyOufGtPbcilMNah/RKIb8Fck/gwt8
	Xq4RrIedNbrwjE8hFseR0nFWDcKy+JV2rgN5z29RTOig3mDCYZ7LUd3a
X-Gm-Gg: Acq92OEObiZKBCBqWDcnp0h/FdRjE/zh5xIMq8N5xEL1/VD3v5kTMcljRkHSMVaq28S
	kKZLMBkNfB83W391Ox7GdSK1cMooF39gdPM0RsSoHD7t3gurl3voeNZC5bRpZ+1nn4B2+LOYHMp
	E+e0eZgnIrEktiqMwFKL3f/KzzihjTC/TrTmCkM7juzI6lh70MJf1W7IaX0sTN81tLWauBxQmJ+
	7izYWHBthlPg6sxg0NdkUEKFMl2gDqO+w9bBCiVYqrDyb87o4KjjpzVi2F62wTbjJHDbdLVSVa8
	Xp1WRVI2I9Jsi6qRG4n2gCa7c25KZCorT2Lp8+6YAUIhXaEauIKbCJKYtB9o30c7Hu5gObJQlnY
	j1mQk8vbcISju2yBQSmgseen8CeHavzaAD8oekZRyFvQcuiuVa8MyFDKDFO3TnZDb/Z59qy6+JN
	rkgSRfTP0bhAE27EqcxmczkNtS/Jk=
X-Received: by 2002:a05:622a:1819:b0:517:5bc6:b575 with SMTP id d75a77b69052e-517fbc898cfmr190512591cf.4.1781525965791;
        Mon, 15 Jun 2026 05:19:25 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a3c4asm106505581cf.14.2026.06.15.05.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:19:24 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:19:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v13 17/22] media: i2c: maxim-serdes: add MAX96724 driver
Message-ID: <ai_txjwLPHsSKsJI@stanley.mountain>
References: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
 <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
 <20260610144242.GF2948@ragnatech.se>
 <ail9bHXL_NV2DZK5@stanley.mountain>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ail9bHXL_NV2DZK5@stanley.mountain>

On Wed, Jun 10, 2026 at 06:06:20PM +0300, Dan Carpenter wrote:
> On Wed, Jun 10, 2026 at 04:42:42PM +0200, Niklas Söderlund wrote:
> > Hi,
> > 
> > Thanks for your work.
> > 
> > This patch gives me new compiler warnings, can they be avoided?
> > 
> >   .../max96724.c:402 max96724_log_phy_status() warn: subtract is higher precedence than shift
> >   .../max96724.c:409 max96724_log_phy_status() warn: subtract is higher precedence than shift
> >   .../max96724.c:588 max96724_init_phy() warn: subtract is higher precedence than shift
> >   .../max96724.c:756 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
> >   .../max96724.c:796 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
> >   .../max96724.c:818 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
> >   .../max96724.c:830 max96724_set_pipe_link() warn: subtract is higher precedence than shift
> >   .../max96724.c:942 max96724_set_link_version() warn: subtract is higher precedence than shift
> > 
> 
> These are Smatch warnings.  I appologize for them.  I know about them
> but I haven't looked at them.  I'll fix them by the end of the week.

I've pushed a fix for these to the devel branch of Smatch.

regards,
dan carpenter

