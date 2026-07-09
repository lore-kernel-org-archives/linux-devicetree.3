Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6906C3C10AE
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633568; cv=none; b=DYw8iMDRJRixXQ1C52foplnhWwUIMkY5e/HPc1oQXkW+1M1nHs0YnnIiuyYKWOXq27PGAVaQeviLPtcHWicZZPUZx8pKleXBBsmO1FZo/PMgAG2iV+LmxRiVcP2RBf6N+N8g3qyd5Y1TEyDTYUjw3oBEj6ig+u8CAXXwiAcDklY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633568; c=relaxed/simple;
	bh=MXG6F+XOaJjTHz4SHrXau2henaRyFb9pRMsdcqxvSUQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlYumlB+QYUxqxquJdB3I/3f4NEebhtlcLFvfcgBpCsgcZGd+t9LWOAAabyV+nVIgbDa0OSsbOf6TMXxnSeFK52ZKyuCugndy0rE58KMRcupbWiX2Q3Yz1MDToU6SYgqYUq5QabskXnj+8SlcSrU39n2gJ4woTA7WF1eM+mV1+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMPFIP5V; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMPFIP5V"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-472326ca506so231198f8f.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783633566; x=1784238366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VkbACm5M+XrCUV3Z7NNaW5IbCVSb/enbC9nT9Rpc0jM=;
        b=VMPFIP5VmYlPsYdxH/RzSJ6YIXQzfqwwW4TxGyWMyNeZJmO8ZBRMeZAfUmud4k3ZUU
         cmrDSyB5V1N8jey9jGLTwytFgVx0mzGCAuxjMfbsTjC5XITv0HadgKAdwgr1fGNtXE+f
         dABxE6ik17BUHEPzQTfon56MxZsKBWFr9NXRZP310hRtR9kwsF6vZR+YSwdAK37qcp1t
         7SnqFISUE5EAfyIET7Xb9vDHYBwETw9iHVil+492YuKakTW5Cg7qA3KGbpe/Qjfme1+a
         GgZN1BracjpPpnZJwiimk/gkL03jSUxdHwZLnHLD3qqL/U8jccLENEbyEHeBFLFeltmP
         IUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783633566; x=1784238366;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkbACm5M+XrCUV3Z7NNaW5IbCVSb/enbC9nT9Rpc0jM=;
        b=Fn/338+AFuSEty4eyjbTGcZOn5/o00+B5DZ8W+UHQACEDnOZsyzBPwi27aC3gIFnGV
         WdySsmBDU0XBoZa5BexsCSW2keHfRaQdYyI43vw8rNorn515zW8nKcZdm31e16DF3hEV
         PgM9fIA9wDjlfg48QxAa9M+tLBY9fXSQljC9S+4hFRD1OxrWnVADuDCoxapHpe+npQNZ
         UyXkF2PBNWAV2E+Iy8XVGSiSYio/bgWYeaIwJHH6BZch2HDedLNf696kdW2SCiYOnPvd
         At13U/WsUqE/rpL1GDbtRaVdum+aDEZ3KbOLE0Nvwl+6bSTuNYf2rqK6mWeLjsGd9AWS
         RACg==
X-Forwarded-Encrypted: i=1; AHgh+RoMU4ZR+kPCPu+dWrbxZ+oh7EAQtY2wiZfSpon5/EYaIvedNhY5D+sfpvEXeyjUZbQc2VC7OAOOvHpK@vger.kernel.org
X-Gm-Message-State: AOJu0YwpUUwCAZlngHVSf0q1RwxVPU6dvDjWH2o+pufPp7ZdSAT/9jOh
	gLNeZi6G9ZtRDmiaGGphtHHw5FvqRmQqxJC1hk5VKud0KPm4ZXxmn60y
X-Gm-Gg: AfdE7ckBjOkrrcP2PCwoOwqq5cTQqdPqwHEWyY/J0IKIle8Ijv3vM4UpQ+nrZ5wJ9fo
	RU6HSY9WlJVPh0sbYO0vaN5SkOPXK4Fuwebt/GZWBzIJ7NMVJQArVU8BcV9SyD8YPoY6jfmomLY
	zosT6Q6AGKkQ1aD4Ybfm/HPSzvYPWXA9l3SutJ/mFxUkJNC0hUdP2WZ+OHdQL9UFOyrjTB0jqs9
	SDrzcdlJdJS4gjeyIEI8sdiySQoI73aVol3IWHfED32PNJuoSaQRA4rdtYsvh4e3PxMkebK0AP4
	x+TflQsGILn+sYwBfVfIiV6eVcbNTqufZYIT0jNgevXtFtWqDL2SRN5vVsUisSve/eM2yaDHCNl
	dg1jHVYinzLEl3r3Z4Z21+tzajbJ253OobVFb3euPJcl9cZlQZIRD8egpQtjI5M90uHAYui2WtO
	KGma4/kX1lDBL3+1dq2/MTYRYYTtHrOkoscxEqpUITg9Rj3vsk9KHuJbMTOSrwkymKdhbnBB5yT
	w==
X-Received: by 2002:a05:6000:2385:b0:475:f0f0:9ef0 with SMTP id ffacd0b85a97d-47df0782dfcmr9126719f8f.53.1783633565738;
        Thu, 09 Jul 2026 14:46:05 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm55980888f8f.0.2026.07.09.14.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 14:46:05 -0700 (PDT)
Message-ID: <6a50169d.41a38e5f.1bb169.a6d5@mx.google.com>
X-Google-Original-Message-ID: <alAWmmBXI7S1QUG_@Ansuel-XPS.>
Date: Thu, 9 Jul 2026 23:46:02 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	John Ogness <john.ogness@linutronix.de>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Gerhard Engleder <eg@keba.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Lukas Wunner <lukas@wunner.de>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 3/4] serial: 8250: map UAPI port type to internal enum
References: <20260709205656.319531-1-ansuelsmth@gmail.com>
 <20260709205656.319531-4-ansuelsmth@gmail.com>
 <alAUrANx15gyOgdZ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alAUrANx15gyOgdZ@ashevche-desk.local>

On Fri, Jul 10, 2026 at 12:37:48AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 10:56:51PM +0200, Christian Marangi wrote:
> > There is currently some confusion when a new 8250 UART device needs to be
> > defined with the related index for uart_config[] to be directly defined in
> > UAPI header.
> > 
> > There isn't any specific reason to define the index directly in UAPI header
> > unless it's also needed to be defined for userspace usage.
> > 
> > To try to address this confusion and making it clear how these specific
> > index should be defined and where, create a dedicated enum in 8250.h
> > with all the current defined values in UAPI header and document how these
> > id should be defined.
> > 
> > Rename the define in 8250_port.c with the new UART_ prefix.
> 
> This will bring a wide field for the all possible conflicts and doesn't really
> solve the issue. Why not simply kill the UAPI part of the definitions for good?
> (Move the all, except the first 13) to be internal to the kernel.
> 

I mean... With correct review from maintainers, conflict won't happen. I don't
feel it's that easy to kill UAPI header... userspace stuff and we don't
kill userspace.

The previous suggested solution was to stop declaring stuff in UAPI header
and start declaring in the internal header making the situation even worse
and error prone with id conflict. This can really be prevent only by
correct review of the change. (or keep using UAPI)

Maybe other have better ideas on this. On net we have a similar problem and
the implementation is mostly similar with duplicated reference and some
BUILD_BUG magic.

-- 
	Ansuel
