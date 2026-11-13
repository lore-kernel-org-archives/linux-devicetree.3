Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575630;
	b=GAqB7cZMH3vQjR76Xbf0MOQb0UDq+7lbz/PhbC8Jc+PQp8m9gtmky+8SX34AXXTL6rOe
	 ChZElJq4H5YmWeieQLXwiU47xYIiTyLkBTWtyB3UXNV+E0JPSvWY0NM4O8Gl8is076y2S
	 ZObLtGPefyy6oZFtwAUL1ojk95HbtwPNxNHttgp/7x+sCATQyUqbJjTbBfzoa4aFFQVTM
	 3OjMMqnYEIKiFMjB2W/6zRsuQcgkP7zwgqjvHyHYTOCdi9Ao1bSY3COZaInJZ5Bltn3XS
	 Sl2M2nNaUHeNVyKWibSwTyHoz9t07SbhXGdwUQGXMIxvaQLcp3Cr6fgzkMYHH68Twjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fQV6O29CWbHJCWsUDVgERrsRMlGpm6PoDt5lhgxHvyo=;
	b=phM6rxZFxsitMhIZ/1djI/q/b66OVZxz7iaD9ZymbwcLSi545D9paI2mClm2PlUxVyUc
	 /HkuPTuQHrQPv+PheQDKj4DfoIUP9XnhuyT4VCoOPWhGDWi4Zbh1+K1cP4KdIm3eDwzpV
	 lnlsz2kr4S50oztc05/52lGBK+JukFIwp+znBZNZBv1hRMZOQBqiD4cHw1NZ/LUdYGNhX
	 FMZRjDVNZii6pBknKQaPY5NBNcmnwKInBNkIj6wkqf7A5vmVnNRa9sh2q5ja9fVyQOpqg
	 0ZMoVqUBg68Zf4Ps4h9MVef46a9MNBer0TU59Q7S0HqeXpyfZKBCF1Mq892vnQ6F2uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0ZzEgzW;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D68606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D68606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0ZzEgzW
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37071c0f42aso1386741eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575629; x=1795180429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fQV6O29CWbHJCWsUDVgERrsRMlGpm6PoDt5lhgxHvyo=;
        b=c0ZzEgzWYRLqlAbAk/iiFtthAIinEQHeviGMRmXjVqOcjco02rpkw+1lNAB5z+lY3s
         izBJz/zTQysdeq5JffWEV91PZqFgh7L4FWVLIi9mwVjV+nd/q+WX29AV8UG289v4er8z
         dmU6MDMv7SUVzJr0D2Mhn4s9NxKx82oMHNeVzsEeOJXBp2ey+aPYHLx8ohCYtfsN6Msm
         63vMDjYnmKKlgy5MLG6/0n/wyzNq5Itfye2o9f/C4OBYKhy6fZV2AmYJ/vvNvYLu30EX
         5Ahj4Y1W3FPqW0CKhp0ySPcdAYCV+oJEAYjAegttpvc3BX91F6IzIie9c2ivfotB/l9b
         wHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575629; x=1795180429;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQV6O29CWbHJCWsUDVgERrsRMlGpm6PoDt5lhgxHvyo=;
        b=ivgYy/EuNmbsqK7lWxgJvZUjimXF90dz7cBxNLD3R+eK76S+vN5AV/6jrpREfvhPcK
         0Gc5YEEOXIlzG/jlbBPhxnav69RBdUE6X07AgOWsbiTHjCeK7BVNO9Q1+RoRU9JGdOm7
         i02O0vvZFexh0XkA7GAxBTHkziRdPwLCIh/4xx7og5wTy5SkP5ROxe4FqIsIGhvfpFTj
         Y4d96UETmVKF3kU1I+UoPt3bh+XLlaT3qky8qHxrqP+PAPR9FuPljium270mW2zoBTSn
         XOICbSQ8zG9pLziDmeuTvnGMQms/Y3DOf4FvGtkI9RAYrGFAxsn/I17aAQ+T4xHfxq6T
         +mEA==
X-Forwarded-Encrypted: i=1; AL+hErFuUd4bp7S0RBZA82Pyzi5HFLI9PmESK1buxyQDwTwH1q8et+NrKMwogUjJVMhVa3NlHCN+gt1Czt56@vger.kernel.org
X-Gm-Message-State: APuU4Z8jsMfecKpqVC9y3Pxcjkapvubet2SxXJzfUskz38Ta/xupDo5n
	Dgv9ewH8LdGzZHlqVZVbJHATq5CAoKZmDUeX3PG7MgIcd8KYysnxSscY
X-Gm-Gg: AYBFou0RR/akE0wFRcML/mS/kDT/3f3ix2yPm9QG8vKsvX0ZgPcSKR/J53rICWk+imu
	OLLkEH2bJSp5NASshu+4K9eYqoAi1odNffylqHjoPVyVVa8+8UyqRAKQokLkjTVsjPp0cLRo+j4
	qvo/ZNhBfk1W8XZFQcR73KfBz3JQguPWubDck1PjdADmqnzguXQuIzhhhY5s/FJZ3z+Se2LfvFx
	C9XiThr19Pe5w/t09kYJwWjXPWMxlpUr2sJictNjtaajvy3m2wwyOxxNMTT5TJ7bEFTzGPWpGme
	QFglJ85qTOD4nTQnuTZY0cRXeR3CmE71PLcN0c/vdnd9LW64+r4npavBMTJv3rO9ezntBK/0TKS
	dEjlmKomCScekxDMJ2qTni4guxnitwn/Nhrx33NvGHtia6EJUce25cD0HDwOFdiTX17h3fimza2
	XtIeKofUjqq8xa1Bg6TIFYjWuZTwe5rjI2Cv7aSnNPEcesMRmU/k0S4wZBeHKG8WfcJTF6MdXTW
	Jlo5sFzvfTILlgWU7/SJevZLTfXNflwVutSrCOfhB10yTBEzT9qRKnmtXqP/F1Gqjr2o+wnN61O
	ruSXyfRFYoL6F/CMl0VKDIEMxMXQbg==
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr1777573eec.30.1794575628817;
        Fri, 13 Nov 2026 05:13:48 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm7834718eec.29.2026.11.13.05.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:13:48 -0800 (PST)
Date: Fri, 13 Nov 2026 21:13:38 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Yao Zi <me@ziyao.cc>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <zya3wt4zziflg25y6grnvfcbfa6mnetn4o5c2khj2cii2wh7s6@ymjmxqyn37ks>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com>
 <au6niF5xiqj7cqJ4@pie>
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
In-Reply-To: <au6niF5xiqj7cqJ4@pie>

On Sat, Nov 07, 2026 at 04:22:32AM +0000, Yao Zi wrote:
> On Fri, Nov 06, 2026 at 02:05:24PM +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > Keep the AES_WTM clock enabled and its shared reset deasserted while the
> > provider is registered.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  14 +++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 151 ++++++++++++++++++++++++++++++
> >  4 files changed, 167 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> ...
> 
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index d2f5bb236663..28d6c59fbd74 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -476,6 +476,20 @@ config NVMEM_SNVS_LPGPR
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called nvmem-snvs-lpgpr.
> >  
> > +config NVMEM_SPACEMIT_K3_EFUSE
> > +	tristate "SpacemiT K3 eFuse support"
> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > +	depends on OF && HAS_IOMEM
> > +	depends on COMMON_CLK && RESET_CONTROLLER
> > +	help
> > +	  Say Y here to read configuration and calibration data from the
> > +	  SpacemiT K3 eFuse shadow banks. The boot firmware must have loaded
> > +	  the shadow registers before Linux starts. Programming and reloading
> > +	  the fuses are not supported.
> 
> I didn't read K3's TRM, but is there a reason to depend on the
> bootloader to do so? We should depend on the state set up by bootloaders
> as less as possible, I think.

The Kconfig wording was incorrect: GEU loads the shadow registers in
hardware when it leaves reset. I will remove that requirement from the
help text. For the READY check requested by Troy, I will also trigger a
software reload in probe, since READY is only set after a software reload.


> > +	  This driver can also be built as a module. If so, the module will
> > +	  be called spacemit-k3-efuse.
> > +
> 
> ...
> 
> > diff --git a/drivers/nvmem/spacemit-k3-efuse.c b/drivers/nvmem/spacemit-k3-efuse.c
> > new file mode 100644
> > index 000000000000..d106053beae8
> > --- /dev/null
> > +++ b/drivers/nvmem/spacemit-k3-efuse.c
> 
> ...
> 
> > +static int k3_efuse_probe(struct platform_device *pdev)
> > +{
> 
> ...
> 
> > +	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
> > +		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
> > +			u32 val = readl(base + k3_efuse_bank_offsets[bank] + i);
> > +
> > +			put_unaligned_le32(val, efuse->data[bank] + i);
> 
> Does memcpy_fromio() works for the device? Otherwise, you could define
> efuse->data as an array of u32 instead of u8, so it keeps aligned and
> you could do a simple assignment here. Reading from efuse->data is
> always ok since memcpy() is used.

I will use your aligned-array alternative to preserve 32-bit MMIO reads.
The cache will be an __le32 array filled with cpu_to_le32(readl(...));
the read callback will keep using memcpy() with byte offsets.

Best regards,
Jiayu Du

> 
> > +		}
> > +	}
> 
> Regards,
> Yao Zi
