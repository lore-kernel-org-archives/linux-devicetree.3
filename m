Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785844;
	b=cm5z7GmQ2z5AFkEWS+zYiVULDQG/c1X0TEuF3T4Yxi4ktJJimyYGd7N8W72u6/NJop+w
	 5bhwhbtPBrFxSxy9LG3i5G0Ky50UFP9UOARY1M+vVrKjW9Ia7B2khIlh+VUM9yqTB7O/c
	 uWUZT6IjkAaMytITLJI4hes5T1avmlFAX+mdAhlJ3knJAnp74zfsQWNEhkwva9WozPntz
	 zWnJ2pFbQV7y/MAh4WqW3mlXmHLuOBueKsmH3WovxT8cb6mzYn54MxXGw8TisYL8kJpRJ
	 I3/Gi9YxhoyWK7QgoK7Lth4/AQxerX0GDsEwOpJ/MzileaYbsGiWOCM2TVWGgP5+pTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=M0PWQLD2FCpEUpDWv96HtGewID9HlsaLAxqC+iTd9Rw=;
	b=YB4HACxbkQsJvk5/hdcbA188EihJnyp09UQcWhMLetb8HV3XE3k5/ita4ld/3cocCUFQ
	 ovUeCsNfGYSN7I/3Bf/eZugr+IWTnjW22EGACAHAtsawuOlKIFYgKIwiq7cXs53fAF/bM
	 YIG+xrKwdVZq7c2K2T9m0cH+qgW4KtUKO54mH+4exbGYc7NOumaJaP/LhgjZClBVWLLvC
	 BtrspitMhRayxPoCDLpSxyQ8lfZxXrYV31/JoW5ANE3v8TVOMtelmxUEmjnQz1nVh4DYn
	 hA/oG6RmKH09ZE53/FNwSRVCHVXixaSwzupGhGf8zsvoobDlBweQSmQvvXBtbKtnhWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbDZ0OmW;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8F606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC8F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbDZ0OmW
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386ab9ab619so11120830eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785843; x=1796390643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0PWQLD2FCpEUpDWv96HtGewID9HlsaLAxqC+iTd9Rw=;
        b=QbDZ0OmWb23DeQ6SMsEROCLzRpC9WkHeoy/hlrD6xOTf+ZvTpSa+ESznh+t+jDIi+s
         XYDpDrTh/p0pGoouz1lCgNnxUWt/cnMof2H82NdysfECX+EW+GNvf8LKH/jDyyRab+9p
         F6nKcs/Xsm3rbRln7R3ID0HoPA6bBZOdcdGLsmAgpaELohL3ud0cQ5WV53mn8UFV1ieQ
         0QqGz5lvQNCCX+6/qsuk9gCTk31PNfwVXJYG8s0qfcWEuBtG5VKzF9y24IzOICGfxxg7
         UdhUsy9i2Pz71r5wYPVDqpezKUmUCvzHfox4nYsiZCV7c8K0xsN/sNnohLFlDRSe/tOH
         bCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785843; x=1796390643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0PWQLD2FCpEUpDWv96HtGewID9HlsaLAxqC+iTd9Rw=;
        b=E3bFdfMGv5fmWWn+e3ciSyJrhjNntnaaIHa2qHZmuuWGBsxPcXXcSDZU3rLXXo3Fk8
         j60OnJn0POuCS+qB7mLgizAaExNc/O10HtGNnAuA4SDCrKqvwe16EYkdKDF4mBNsU6WM
         oJU3jAWHky1Wf6abDdMi+Nu51eQjViUmn/KZsof1ef0Q2+WV6AfEyKQXv41QNlcwC674
         7Og2xbjjbaTZixtkAtz4sw+Fi3fyIoPqz5gKgNbmCtvvFd3mihVKRZSbxdPuyDfSIzFr
         Y9UY+8vLlRAfg7jK1aa3QdVJeo4eAKl55KeubXbqJYBAR22j/BAjXkY91oAMS99Zrpkj
         RZSw==
X-Forwarded-Encrypted: i=1; AL+hErHPBPzv2Y2UAWr2n/n3Ie0koBrnwP3Eiq7y3bxDmkpt9/n1MlXCY3oQ5xwQxakiYrPSmaEZjcmHstxZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+tWyrDB8ADcwd2HD+X1eHItFu81OZCLEQ8prbSagOY5AUN6G/k
	xPrNtmnVE+yLGHBPWeLkTKRD2wffEIvxGKt9w+X2CX71bfPGzhReHotx
X-Gm-Gg: AZFdTZdY1JhiiR/ir0ZY2VfG5QiXs/EfgfpGiILsDreik+2vzzAO7z2evra1sSiey6h
	RYlS+j1tOxhAWi2Zuu/e20A2vAUhgF4PE3Jxmae9pL223f4S2W6aL/G6dXy5y1FVSFonPycLL2R
	ut04VhKe/mlrkfmosIjj7+SmBwqSAmMhkbz2/qByIpFEYWEaSdyBXQmLMWfdkbXFXmuTWUGOKNq
	NOUUDXzVkmBll73jXi+Aip2zjahQuEa1ziy8Rbkz0RuBDLFZ3YRlnizphM1LOGIO04NGP6MvK6l
	Ai3rB5pRps06rYdBtyrV+c5iLIzcF7q4z2Ga6teQ/fqUu7DkYWfsjBOWn5ic1G41E6ERFLngIu4
	SQ0kXrzd78HySCWcix3ZNx1se4XKZRvk8Jc9mNhvE1SKakpRt+3RzbDk+/kqnyXSV/aUl8jMYsm
	fr+8raQWcYjOQNJDHzWSEyUQmZHgSdsVRNrkBhzT04UyC40thQK1NtSpyFR20Nbta84wi3QZDTz
	osTzLzXcSRRUQTcVzINVmKuRx2RnbsGQ1b/dMnnT+vZS2ChqVcMd5ayiHy/5hDBeeNR0h2v0h3s
	1r5SPq3SkQUF/SuTflsXJIFdPa6h+8Xvw8AtbFgZkMSX9X6ew3oG
X-Received: by 2002:a05:7300:dd02:b0:386:9957:750e with SMTP id 5a478bee46e88-386995777d2mr20420340eec.27.1795785842774;
        Fri, 27 Nov 2026 05:24:02 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm86897461eec.4.2026.11.27.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:24:02 -0800 (PST)
Date: Fri, 27 Nov 2026 18:53:55 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Message-ID: <awmD1f5QbjlQoZiC@192.168.1.36>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
 <20261126093819.76480-2-blfizzyy@gmail.com>
 <20261127105641.16941-1-romain.gantois@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261127105641.16941-1-romain.gantois@bootlin.com>

On Fri, Nov 27, 2026 at 11:56:41AM +0530, Romain Gantois wrote:
> Hello Ajit,
> 
> On Thu, 26 Nov 2026 15:08:18 +0530, Ajit Singh <blfizzyy@gmail.com> wrote:
> >    reg:
> >      maxItems: 1
> >  
> > +  no-hpd:
> > +    type: boolean
> > +    description:
> > +      The HPD_IN pin is not connected to a usable HPD signal. When DisplayPort
> > +      Alt Mode is active, the device is configured over I2C to treat HPD_IN as
> > +      asserted.
> 
> IMO device tree bindings should not describe configuration procedures,
> only hardware. So I would just limit this description to "The HPD pin is
> not connected to a usable HPD signal" and let the OS figure out what to
> do with this information (in this case, treat it as asserted).

yeah, sound reasonable.
Thanks,

> 
> Thanks,
> 
> -- 
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
