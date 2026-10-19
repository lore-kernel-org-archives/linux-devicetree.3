Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428421;
	b=D/us45LvkF01LZy0U0gGvdZlPfeW7gWvlqCXmTGp40ax+wpss7sPt7eRPJIbfZGOlrEv
	 3ktLQSUi4nNw5F8m4RCWtjm0us1lRDECuR47B5h+tGmUBr6+eavX1K7wcRrNK5VhUuhSE
	 +R8rXofBHE0cWnpij+orts/kOnrdk8pswHcEmEuJ5gcAAhhKg40csToPUVos0vo8lm3JP
	 eyd+uzx/MnsAzVpHlQewaUFJOdbgdpVvDdPt9TWIhZOX3wGQwuhCiPCRL9ZuyEzfDJ4eW
	 DxhGaMJsRvPLhlVRpw08z+G3Tpb+0WitFpFv8oord9AZjbzU0/Wqba2PyCT4nA12Pvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0/9efCui3/xIgzAalfuRCkOK3+yAIMEf/WrJRW5n/Zc=;
	b=Jnc+zpG5AEdoVMPIsoP91sApm2PtmSIiUmFTEBXN4E5d4ScAcqu9NdygZd8sBLMSwzAQ
	 9zkLm3rJ8cL1TxRkNq81+Ekv8ODy+5sCz0A7Upu8CIrTCIeFs8CkT8hKNzVutGkoHIy7D
	 v7Puj4YoYtyTGvGU3VvyfV+gQJN+kFlsz8LTAyu61U65rthi9SwfT2cOwQcE1NPbxgzG+
	 uZuOZ6YPANmuW3I8P/WLLtYOcw2q08UIfR0Ftv3UYbOiSLetZ5z7ENqRGulLIQuGKgFFs
	 grDOPhC+fQ3XdWyDbXfk2P+2O2RTailmqXJyeiwszI1SYkXcPuI5ShDZ29olYkWGuRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pMlwFzMI;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD8760A261D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD8760A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pMlwFzMI
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso3210795e9.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792428419; x=1793033219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/9efCui3/xIgzAalfuRCkOK3+yAIMEf/WrJRW5n/Zc=;
        b=pMlwFzMI0mMno5hvlPAloml9Up/2dP2aQbvHAOG+/lZedn0uQXJqwyvl+pf+udPxic
         zKqxgRr+8K28Jx5CEBMi633pJOyjN359Uh2JRJXGZAn1wiRxRruAd12mYLO7uXizpKjn
         rc/L70OWwc9wAARP9zG9U+57YtTfIQvu5HqaAkE0/OQ4iTs8MkGXmion/PJkavSGb4ZP
         iVJjqSTpoCfy3XeVBfk0YAc689Jr5GD21zu3XDac/D/T001hMd9D0nxq6xE/QnHOx0gf
         Wyej1Rf6B/JHlbwEPTtc0MIT2LPKgi2zzQquDHETXIHk22cBsnY0bYhSBmsyrr93QIqk
         qZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428419; x=1793033219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/9efCui3/xIgzAalfuRCkOK3+yAIMEf/WrJRW5n/Zc=;
        b=kcIWEHTew43fMRBQm6Cy8UYS3lfYoSJuhxps46fld7keFj/WP2JVnN3TLmT1Vh8NhV
         my8GojMBQINHPcH4TyrSupf58gEMF9JnZTjYJ0SveK+rJX2KHOarpijIjLPj1/erT5r6
         EPVIyu1dVJFjCKKvVGTAkkpKuMSn99RjLmIWedcaFyFwczbYAeqFReBausV65qmE+eZ/
         pvdaGD8QAPVoUKspwFleXoLApg0E0Z2mAwUz64JkM5IRFj++miHGyy8myNi7KJcCB17j
         lm2b+4Ln1MJQpTjF7rytwsX1jUk7IJ0Q76YTxwwIcAUlDMr9mTf1AuKJbT1Ofgxi6CUy
         30IQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0jrFt2afgJDbrLHD5RZSxKLEN+0I4MNVfYmwS0YgkBzrKrJHIJXidpx9kpxt3Zauo8Pd1PeCfRNrH@vger.kernel.org
X-Gm-Message-State: AFq9FYLGY8/UiyHM6HzbbXRG1ws2x8zGpi7imG8lNo5HTNyhUPG5iOki
	3JNfYLbczSO++szcVoS6BI/xloaQWkn5lEzVGapnpwPXoYY68np/xT3/
X-Gm-Gg: AYBFou11OkIO/E2kj2zbPFUNY/zLGzJ+/uuE8zSDzjJ8tSXNUtpReTEqqJPdo/K+mhg
	5JZfRyHmYNXtveMTnSGlQlCkMYLWZTqOOEHfemsPhWt4LNq7Lpz+oA3hs9ckLDPFRZ4oxBhjK8J
	HYjiizZ5j+i1urFsxHo15+zrebbrOScxPsRWp076DQm6aQ9AITrbZR70TNR9QVyv27aebI7BXaT
	CZEjw+BPErm+L2i8T75DDZs/CfU7sR+xhYYRsso8IPMtBsAhsP43iwIfuXHWi/268aLfDlQVEy6
	sg+HBpeTt1xi2IJyMVyTTIjCamw8UuNsmJNJ8WLmF3+IRBYjZPXKRO0Avo3ekgDx1BW+sJqYYjM
	P2baGSCPha6mxoSK8K7w8IMDDC10hCaG934MtAtwJt0rCGxbE/TQG7F2l/oVfaPjMsNEYGm5pRu
	Dfw0cVPvOoahNloxmyWG18xUINGM4mwsjhq69VW+EYjsA/bGO88vobDaK9DYyB2UjVXc6TIUw7y
	44nRrJv1DnfNk2TIZ1aMZ6vxkBDYIRO5ldmPjoewei9M6oClrPvETzDBA6Ujg==
X-Received: by 2002:a05:600c:3551:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a1d75a4653mr187564615e9.2.1792428418471;
        Mon, 19 Oct 2026 09:46:58 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm2377005e9.4.2026.10.19.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:57 -0700 (PDT)
Message-ID: <6ad64981.198a47d7.3d6d5a.6d01@mx.google.com>
X-Google-Original-Message-ID: <atZJfjkGIL2V--en@Ansuel-XPS.>
Date: Mon, 19 Oct 2026 18:46:54 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
 <sashiko-outbox-166721@kernel.org>
 <6acccc4e.4c22a69b.132624.271f@mx.google.com>
 <20261019164430.GI2663669@google.com>
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
In-Reply-To: <20261019164430.GI2663669@google.com>

On Mon, Oct 19, 2026 at 05:44:30PM +0100, Lee Jones wrote:
> On Mon, 12 Oct 2026, Christian Marangi wrote:
> 
> > On Sat, Oct 10, 2026 at 04:11:40PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > - [Medium] mfd: overlapping regmap readable ranges for General Purpose and GPU timers
> > > - [Low] mfd: structure and variable naming violates MFD API guidelines
> > > --
> > > 
> > > commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
> > > Author: Christian Marangi <ansuelsmth@gmail.com>
> > > 
> > > mfd: an8855: Add support for Airoha AN8855 Switch
> > > 
> > > This commit adds support for the Airoha AN8855 Switch which provides
> > > a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
> > > and registers a regmap for each internal PHY.
> > > 
> > > > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > > > new file mode 100644
> > > > index 0000000000000..a2778511dfefc
> > > > --- /dev/null
> > > > +++ b/drivers/mfd/airoha-an8855.c
> > > [ ... ]
> > > > +static const struct regmap_range an8855_readable_ranges[] = {
> > > [ ... ]
> > > > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > > > +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> > > > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> > > 
> > > [Severity: Medium]
> > > Is this range definition correct? The General Purpose Timer range
> > > (0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
> > > (0x1000a200 to 0x1000a2ff).
> > > 
> > > Could this be a typo in the hardware memory map definition? It seems like
> > > the General Purpose Timer range might have been intended to end at
> > > 0x1000a1ff to avoid overlapping and potential register access boundary
> > > issues.
> > 
> > I have to double check this from documentation, but if possible I would
> > like to fix this with a followup patch.
> >  
> > > [ ... ]
> > > > +static int an8855_core_probe(struct mdio_device *mdiodev)
> > > > +{
> > > > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > > > +	struct device *dev = &mdiodev->dev;
> > > > +	struct an8855_core *priv;
> > > > +	struct regmap *regmap;
> > > > +	int num_phys;
> > > > +	int i, ret;
> > > > +
> > > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > 
> > > [Severity: Low]
> > > This isn't a bug, but does this variable and structure naming align with MFD
> > > subsystem conventions?
> > > 
> > > The MFD guidelines suggest avoiding generic variable names like priv, and
> > > instead recommend using ddata for the instance variable. Also, should the
> > > struct name itself avoid hardcoding implementation details like core?
> > > Naming it something closer to struct an8855 might better adhere to the
> > > subsystem guidelines.
> > > 
> > 
> > I already updated the struct, is it needed to also update the local
> > variables?
> 
> Ah, I was just about to apply this!
> 
> This would be preferred:
> 
>   struct an8855 *ddata;
>

Ahhhhhh! You got me!

Do you think there might be a faster method to submit this so I can quickly
rename the variable and you can pick it? 

-- 
	Ansuel
