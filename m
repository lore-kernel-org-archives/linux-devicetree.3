Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CEF43E06C
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551011; cv=none; b=J0DFjqc3RxetBB+Od4CO6q5jz6IXeEjjT1wGayUtraGxg6XQNS3+ZQL4xApxWVxsq8+4s4HRytqNpqD/CUIjl0PoW42/TARBKqG5PVkq/Ek9UBIzzHlZT0HnrEGPGZqtU5oZw+NyVXA/kCM3N6sgcfPsEg44AvACH89ASibGZ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551011; c=relaxed/simple;
	bh=g/iC+DIqI1xrZJ0xCTu4BStW2wCcnb3D4yhvlUsffN0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlLwywzJDNRtST9cHdsw+bturiWg0m7f55fx6jys1MbQQG184MxYtlxZqonnttXgR1LIoBniZOz0PjLTvDH9Sfq+EbqydZ9r9IEFtx/7evU1F5jAHS+XQbRGjoTRgwqthMGRC8c5l8gd7i5pAx7VWZSr/4dMpmPwPrr/mbUuKAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqKxl7Lr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqKxl7Lr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so3311625e9.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550994; x=1790155794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drCB0bFzLSt3iJv3AQNAxjZ5jc1SFYIJv68Mmbr8obI=;
        b=TqKxl7LrugOFrQrgr8bdk88+4lv6xwiasJTOfStkN5VPSjnmIzv6T/HIKUKB391l8m
         aP0WS6ji1Q/XPsOSzWynGbp6G3Sqk/TrqGdPwxlP+NPP7z04EpDLifyTLmNpyKjPitul
         EB9Rkfwh8ymrL4n1jIueyXuEuicoczUb6JmVVr6Ywn6sjH6iyLNAuPuGHRMBurrKQw1r
         4ZrPpvellJRfv8uBz/Hvs87/BfLCOS4sganTG4pAUCnUPLSPyjBBFaxLvBqNXUXAURG3
         7JEvragE67izv0WU4XGTUcfR1iYvN1W8CdmHmjmDSfZR8IAkAZA9Dx4kydTrt7X1fSg9
         yxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550994; x=1790155794;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drCB0bFzLSt3iJv3AQNAxjZ5jc1SFYIJv68Mmbr8obI=;
        b=Ppkga5+jpRecCFSNKmaW9pQRg0HDM+2ULnUsDI3n7zxPNbAmJoEeMZiY4lLtMl4YqA
         rl21xrLd9Mz5OnpuHEcWHqtDnSQBrq9B4creDTECR2mjXW3SRBV7zRoFiuZq2Vh2Xnox
         KXFn/LFzKrmCP792Pj5Q8akd6KbLOLRy27rvB350hqKwFR0PJF5RezDxE+wzGJJMh4Vy
         c+JZpmi7w5PvKYNpW0YEDZBKA6/ol1pk2S8Swldkh/sF2Qgt008aVgXcfBC3y//jk75i
         hhx9DP+uGdWQ25yHfxzzcR3HgWoU7ag7sKAG84q2EmpLqmOWwf6UU8ezLCLWtdlHlnjG
         uuow==
X-Forwarded-Encrypted: i=1; AKwUvBzQK9PSWtzT7OSkwKFmzAMH2XvEcM6fKwugwIJPr02dFM08/O2Ew6jC5+30Dro3KKTik6ufZNsIZntx@vger.kernel.org
X-Gm-Message-State: AFuF++nsHvFj1VhkA8FTwR8cDg5d88X2JKEdupxghmVmE/FaOmGBN5Xm
	NgzD6hG7w1ABTHQ9i47xxZ7qEB2rI3/uDzMsMjpWv6UJ/z/2KugmWIZl
X-Gm-Gg: AYBFou1nG/QpuT9HzIQJdAd5BF1hUWeC0Svf4G7uXpEm8cP4IEOJGJgEXGjm9eBtMCd
	ZPSsJQL3Fp3chg6Mfb19DQGFIoc6QB7TT7TrQKuqFp6GOAoLURqWoLXbhek11r02QQRlUUgFBNX
	zZvRzhHaHcBnTMJ21rWVmjjdjWIDTJITpXlGQocCYu3pMjQ2Tlo+n8kkiIpJewlITOO8D+NR6p1
	Od4g7Jr1xCAKYFJzh43zuqovp7qjZ852Ccr+zngyHbhEUgQeE7VJOfTCIda4hFJaJWHDud7a61B
	u5ZOJUZsTv0cf5/DMQ9v//S3sFvaTDJzTxdkG6lzxhB874BEXohvhbW58mI2wpuBAUsoCFa4BfM
	aIKUU1QuyFYjkDAZEQJ6qjp/qjYpIJMbh7sImY1DYxOmpGKlRH1HFFw3bRZ8M1r4ckmsrn8cvVP
	kfjjsHRUcHHG45JZ35Ax2eULG9IcCzD6nkzCuO7j9Bf9av3lPh8gNdYJ9zcw9FtOQCEcV7BTeO5
	gRSnmlW+5oX/Jvg0MmAiJsbO06tVcQS2SLU
X-Received: by 2002:a05:600c:4709:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49eac46374bmr21150555e9.7.1789550993497;
        Wed, 16 Sep 2026 02:29:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83db9102sm64812065e9.12.2026.09.16.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:29:53 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:29:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
 codemender-patching+linux@google.com, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Peter Griffin <peter.griffin@linaro.org>, Linus
 Walleij <linusw@kernel.org>, "Martin K. Petersen" <mkp@kernel.org>, Trond
 Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Jiri
 Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>, Chuck Lever
 <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown
 <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo
 <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Kanglong Wang <wangkanglong@loongson.cn>, Tiezhu Yang
 <yangtiezhu@loongson.cn>, Qiang Ma <maqianga@uniontech.com>, Randy Dunlap
 <rdunlap@infradead.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>, Ard
 Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>, Thorsten
 Blum <blum@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Johan Hovold
 <johan@kernel.org>, Cen Zhang <zzzccc427@gmail.com>, =?UTF-8?B?Q8Ohc3Np?=
 =?UTF-8?B?bw==?= Gabriel <cassiogabrielcontato@gmail.com>, Rong Zhang
 <i@rong.moe>, linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 devel@lists.orangefs.org, linux-hardening@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/28] ALSA: ac97: Refactor snd_ac97_get_name() to use
 snprintf()
Message-ID: <20260916102532.4b881a25@pumpkin>
In-Reply-To: <202609151134.361FEA04@keescook>
References: <20260915081910.4142719-1-morbo@google.com>
	<20260915081910.4142719-2-morbo@google.com>
	<202609151134.361FEA04@keescook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 11:39:34 -0700
Kees Cook <kees@kernel.org> wrote:

(I've just juked a lot of the 'reply to' list - too long to gmail.)

> On Tue, Sep 15, 2026 at 08:18:18AM +0000, Bill Wendling wrote:
> > --- a/sound/pci/ac97/ac97_codec.c
> > +++ b/sound/pci/ac97/ac97_codec.c
> > @@ -1850,10 +1850,12 @@ void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name,
> >  
> >  	pid = look_for_codec_id(snd_ac97_codec_ids, id);
> >  	if (pid) {
> > -		strlcat(name, " ", maxlen);
> > -		strlcat(name, pid->name, maxlen);
> > +		int l = strlen(name);
> > +
> >  		if (pid->mask != 0xffffffff)
> > -			sprintf(name + strlen(name), " rev %u", id & ~pid->mask);
> > +			snprintf(name + l, maxlen - l, " %s rev %u", pid->name, id & ~pid->mask);
> > +		else
> > +			snprintf(name + l, maxlen - l, " %s", pid->name);
> >  		if (ac97 && pid->patch) {
> >  			if ((modem && (pid->flags & AC97_MODEM_PATCH)) ||
> >  			    (! modem && ! (pid->flags & AC97_MODEM_PATCH)))
> > @@ -1861,6 +1863,7 @@ void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name,
> >  		}
> >  	} else {
> >  		int l = strlen(name);
> > +
> >  		snprintf(name + l, maxlen - l, " id %x", id & 0xff);
> >  	}
> >  }  
> 
> I'd rather not open-code the length math here. Can't we use seq_buf()
> instead?
> 

Or just use the length returned by the strscpy() call that wrote the initial
part of name[].
The return the name length so the callers don't have to use strcat()
themselves.
Replacing strlcat() with strlen() and a copy is just pointless.

David
