Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577758;
	b=qYrxQrEZv1yGh4kJOE6jnBnbQfXTNzrR5XJmcAcUeGYAflu7i4LHBbOlDziUeNhIMOgr
	 fhex4RBUs+USfDehjpvPLzlVO1Lvnt4BDP7fmQD3bYWiO2Yiwi8OKy6JJcVaeTe7ml7Y3
	 xOxh/+dWS9mnpm9yIRObedGiKnTMHb/atlrEUw2Vx0rtBgSxAFQN7vTcGHN+Tet7H2d+f
	 ZjHrCsrL0GNPFMaZkJBGTvtPH/+QO5yzEQbSuO/eo3FgKovz1OXAwroQ9+7cJLrbdH5jE
	 Ahng4IJeuHwH7WIubf8xWAFoRCxSek7soA06aGLHMxcD8YvD4dQaNfdxj8BOzPP0emw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
	b=U3/wRZ2numGLWGewi0gFIPF/FL0koJX2Kwa5uOE3w7T6NOa41RS98WSuTVvxt6cKARL7
	 waGIEG4vNebn/qy8U+zIx0tF2nfYMcOMbczpUGmlYlmONFJTvYqmuT0JGLD7LieJx4Rx7
	 V/wr7LkIcMogGJ/awd5Ljjw8l4po0m0uWdheDW0NOcn84yl9gamrmLfjndPkdSeNxxHJa
	 kNx3OTfYYc5bVsvQW5H4lfzHbdhWhszqrKAiV+5jMsJJ6wxoVlDOcze+5gJu81PtqhEfW
	 PIoZVN522r2XpY6kecA/pCsL0f8ET5FN9IHk/ls1HpR+D3Ovd2pgfST8gYb2TqnvOIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2WyAc65;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8612C606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8612C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2WyAc65
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1208114eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794577758; x=1795182558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
        b=j2WyAc65HHKXZAtTItIC5JMMjuCVCGvh24lyDPoCV3vQMwTi+DFmIwfD0//Z5d3bxy
         klc9Wq/T/2lESjNQtPg+ZoAnYZ2E4Jihj7aKgXVgYlxtBmmGZzID7ScasvwAUehBK6Ji
         Xmb60E0miUdAXJQ2fr1Dxl5E/twWeuVqr2lvw2K8A4T/sMuEkYQ4Wk8Lyw0oi2v4j5hD
         VKrpghB/FHbs0MZoXZ1D8jhPjb0ANbOn0SYehDI8ivVsxWXjDBTrJSkaMs1h3g9JI1PW
         i3q3kieyyBE9xQJFzORBSWc66R//jd6z6TkNVhspmEbEYuriYjGPHduoZrnvQDdmOokA
         LTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577758; x=1795182558;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
        b=xM7rk28D3rkxWUx5Mnra2usRFM/QEeNbqZLHnhjRtJsolKZp9avr9V54KIKaHj+5Yr
         iJjP6PDJUfOLjQOGfhLPZBSnPLOtqlxOudcJ5XNA4Q0skpAYk1pthMi6+2F9n23hOGYY
         3MS7+TvtIqCCzi8C6L/bZzEJTTX/ggGIrN7iQs+12r3iqAbWgB8urexAXbFyjpZYMu4/
         ewW4/q1TuLfjC+muDFGnV2/mJZ5gHS3tj6QG6zLapcr55NQvHXJMYn91Wm5cIwc5qG69
         WxGuQphCLI7XuBJsGtK7MVvp/YgWWZ44MrIuCUXPA2b5yd3uMgRk+CD7GBhRt5vQ6Mv5
         uN5w==
X-Forwarded-Encrypted: i=1; AL+hErGJ8+yBQC8c5irEEfkTDdqZIOAmbiyOx2Cq3wCSoUv5nqXD575XHhvcOu9Vdow2FduLwk2+8D/fxeiM@vger.kernel.org
X-Gm-Message-State: APuU4Z8P38yzdN5ZI1EVYsDasH7660p5g26Svbg2DtsnwXug82YwIyzn
	6UicFdz3t79pP1CI6IGInsPpy4fyHIUwKB2OcZr6yashsvR+P9LRwJe6
X-Gm-Gg: AYBFou3qyItF9jgnBURErLELo6a5/ClW4OzQiZzqOaogd2UlyQpbq36g/KFCxM668RN
	OYSSWxeH9VoEDWwGPoWIVP7gmNXGjP0VHatbiRYDLfHqIJypmivqtA2JlF4SSkObaT4TZZ+qZkb
	bhc+ottwNXbDFw7indNX8mZxF/Htkdmy1rzRFWKAgKX0HICxrSmRlqfR+CJxWD3BG/GOEYefeHV
	lv2HQ+NsEk5lA3ZC9Ncv3DVDbF4+HweG/5RRjqR86s6Yfu12bVykurlSbTjXk32+KhwCoO2nTZQ
	Y6XzQWSCqJaGk1E9vnSSaBBOmfpJVSGY+NehJ7Q9JmjPCZFMU/iiE/Rxqmh6FTMd0ZTRzKi/TPS
	FnCCQ0gTIKrWJ2TPE91oarC/ph2iyewoQFuwqIsUGBSLaB8q4AaDx8UhbiweMZ1jEZSq8pqRoTW
	P3/Ik5iHB3WQTXl8izsxxfhCDXx0n3lx7tBF8jT7qHhDDT69rjwmhUNeuzP6w8vOsnKqnyYZ1l6
	GMu7LJcAoIKogx0lIZzpg8QiEE1NyRDSfpfRiMo5708LznpgG4eimieEdhfrexJw4ct1jdK7OQB
	NlD1/y9sT75cJfwMk9E4h4J8ZxRsAQ==
X-Received: by 2002:a05:693c:88db:20b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-379684ae78cmr2170730eec.38.1794577757517;
        Fri, 13 Nov 2026 05:49:17 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm8381252eec.7.2026.11.13.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:49:17 -0800 (PST)
Date: Fri, 13 Nov 2026 21:49:04 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <7xzpzkw5qmt3xb3ezo2sii6tnfraetwooh2l6dl4svclvbn43o@uvm7uyhz4bck>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com>
 <DMO4CP89Q1AA.17HKYA50DLY8L@linux.spacemit.com>
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
In-Reply-To: <DMO4CP89Q1AA.17HKYA50DLY8L@linux.spacemit.com>

On Fri, Nov 06, 2026 at 12:15:54PM +0000, Troy Mitchell wrote:
> On Fri, 6 Nov 2026 14:05:24 +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3
> > eFuse controller. These banks contain temperature calibration
> > parameters and other configuration data.
> The rest of the window holds the root key and the SSK, which is why
> only these two banks are exposed. Please say so here and in a comment
> above k3_efuse_keepouts.

I will add this explanation to the commit message and above
k3_efuse_keepouts.

> 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve
> > reads from the snapshot and use keepouts for the remaining register
> > ranges. Keep the AES_WTM clock enabled and its shared reset deasserted
> > while the provider is registered.
> Why keep the clock on? Reads are served from the snapshot and nothing
> touches the hardware after probe.
> 
> Tested on CoM260:
> - clock on only around the snapshot: probe and unbind/bind work, the
>   clock stays off (AES_CLK_RES_CTRL 0x00c30050), same bank 0/7 data.
> - this patch: unbind gates the clock and asserts the reset
>   (0x00c30070 -> 0x00c30040), rebind reads the same data.
> - this patch: 3s of WTM_RST or of clock gating leaves the shadow
>   values and FUSE_READY unchanged.

I will disable the clock after taking the snapshot, before registering
NVMEM. It only needs to be enabled while accessing the hardware in probe.

> 
> [...]
> >
> > +	depends on COMMON_CLK && RESET_CONTROLLER
> Not needed, both APIs have stubs.

I will remove these dependencies.

> 
> [...]
> >
> > +#define K3_EFUSE_REG_SIZE		0x400
> > +#define K3_EFUSE_BANK_SIZE		0x20
> > +#define K3_EFUSE_BANK0_OFFSET	0x104
> > +#define K3_EFUSE_BANK7_OFFSET	0x190
> Nit: the last two are not aligned with the others.

I will align them with the other definitions.

> 
> [...]
> >
> > +	if (resource_size(res) != K3_EFUSE_REG_SIZE ||
> > +	    res->start % sizeof(u32))
> No need to validate DT here. Drop it and use
> devm_platform_ioremap_resource().

I will drop the resource checks and use devm_platform_ioremap_resource().

> 
> [...]
> >
> > +	reset = devm_reset_control_get_shared_deasserted(dev, NULL);
> This asserts the reset on unbind, rmmod and probe failure. The fuse
> data survives, but WTM_RST resets the whole GEU (FUSE_SCLK_DIV_CNTR
> went back to its boot value). The driver does not need the block after
> the snapshot, so use devm_reset_control_get_shared() and only
> deassert it.

I will use devm_reset_control_get_shared() followed by an explicit
reset_control_deassert(), leaving the shared reset deasserted on teardown.

> 
> [...]
> >
> > +		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
> [...]
> > +			put_unaligned_le32(val, efuse->data[bank] + i);
> Please poll FUSE_READY (GEU_FUSE_STATUS bit 1, offset 0x184) before
> taking the snapshot, and fail the probe if it never sets.

As you clarified, the automatic shadow load at power-on does not set
FUSE_READY; it is only set after a software-triggered reload. I will
trigger a reload through GEU_CONFIG bit 22 before polling READY, and
fail probe if the poll times out.

I tested this sequence on my COM260 Kit: probe succeeds and both banks
match the data read with v1.

Thanks,
Jiayu Du


