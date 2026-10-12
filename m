Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1171048A2C7
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806814; cv=none; b=RFBGw3xmwXNRvvxPSKx+8b0fY6A2LFFMVzgmAYY86cPWqLQ91FURqlPcuvjinDDltLW4RwTmweHweJaCr1RXCed3au9jq0cCDDwwHuRukHvClgqI1S/km6HAglvRR9t+wT9XQJ8fGEbiccp5/JyBaZx2ginW9p/FAhI5Hza9kaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806814; c=relaxed/simple;
	bh=fzvEhmTz+Ddb+QnUGyF3Qj1zyXPGB9qkQhLX+ZZL6Rk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCvBEtNPO8nXrSDuP1inG6HznuLU17NUAakl67s044Zjmk3D5mkkOC2DZ1B3sIMC5Nz5nTtVokFesHX4k34BPffdfxKDR9cHJmDXKnL1PHm4VCS7cY3uJ2uufDpb+fagNQUdUfLMIhD4jG27D6RsRX9Qr2jDLGuR7wzXDzazB4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7r33p3F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7r33p3F"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso12133005e9.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806808; x=1792411608; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MAsX1GK+o6Cv2vDUupjDjLycMwLJ2GJ82bbQpCaX0c=;
        b=A7r33p3F2MgOKtk28pHh1t2uSUyNCl1e5d/fXJ+36cpc4lS/YoRPVcrnWoHQpKJJvD
         LT/lukMyPiNaUid7KgxSIbyEndeU/ACLK3rqsGku1VBiDqPiTTzJSF8llXwOvHN997fS
         RhNSxG1wdv0M1MlIOM5BFY6LHCi5d4uIcNUIe1aH3ISm86sPQ/UuXyQsuQ5RJ9Ro9YtL
         9pNoqS4aXDbLJTys+EGvQuuJk7xfFHnhqrcwA4QGaLvFEQBpnN+UWfkKOrJBpdwaUKLp
         Z+oj59GumseWuH7P4DB+HPsb9WZvGNRNhTTUuJ3EjjutVOBUIRBOgMYE78m8a/u/hUXF
         3iGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806808; x=1792411608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MAsX1GK+o6Cv2vDUupjDjLycMwLJ2GJ82bbQpCaX0c=;
        b=GMToGaaHothobqkGTFniIPd9IGv6hPGKgNleCwIGj/xUmbUal1ufRhbkSPX7owwMsx
         3mYk0MSFEn2lY9Zyfc2QYfFLZw5dFGXssHtgS0Be03HABUAO+cNxrmL5uI2qaSDUOLqr
         tH5wkKa351gNHln6pXL8RYO334XZMyYPkStjmRgwmlo9zUwnSeKNd2UpoHBt5KPwcvUc
         9v+UtGik3IfDSwQhUUN3ZlXiRuUvt90t/AwS/vEEfHpXYJqyMR5nwQ6ZGyg8FWy4UML2
         j424otDPVMwmTSQqrOGU7oWLgjZYA5+sPVxz8huIg+vV23JUJ9Xx2rjNjeSV507ZMIRu
         BpEQ==
X-Gm-Message-State: AFq9FYImsqZcIr76Yyz1vXo4AQFFSrpVIyD4hcjEvhPTiKCQgomezH0Q
	S1+XRWCBnsXzWkXtvpuxGzqJe+pwviAUN9KweKnljA6ZKw40dYJgLhbxBJdZVg==
X-Gm-Gg: AYBFou37mdTl6wZxt/1ikniPgNHFGRHLd9IRaFkJu7Dq8Q1liL4b9Sg+OJs5Yvonbtb
	8l9pTt+usTRFqifl2TnUlFy2uBpOBJKLALiecYgAWoEYNcF8A/jv3mblXtEB0sLqXsaRN+tDjAh
	965uMtoYcm4V559m94thhd3RpgOTWavQNp8sJBJHA6FTjZar8zSg1cMf2/2DlXnzo0lL8o43nyA
	T1icbrMWD/Be+nrb6Zo3rjp+BTOBGtNBLHoc4HQV28ft61mbWvtcqMulBEQsl1FjV8b7sAHdts5
	6YZKyQgqzD2X6PF7sOkmlXc3CofamD2ruL33QBl7rfh0JrZ7ad8rkbGjwt1iqlI8ltgg4AHtEad
	r2z2oGeG3zigi5QfHZ0p6yedo4LDTK2+7aAGtt1x5q4cQm+ra2dw9C4vzGVztXOkRTuJcFrQ7M4
	HDqlPtOGoHHKxjULW4n0GRbxNLRYRdtitKzjVIqwvJpFDia8X9TQsVo9Mhdj6jj3QPDdk30RUdm
	b7Fh9FoCEvHG/sb5GTuKEn7V8MgTkJLXhaVSpEUJAi7FS7aMseHqrnvsg1783ML60b0qmy4ouSE
	dKjf
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr172319655e9.24.1791806807816;
        Mon, 12 Oct 2026 05:06:47 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm155838215e9.3.2026.10.12.05.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:06:47 -0700 (PDT)
Message-ID: <6acccd57.bac20f7a.1310da.9a58@mx.google.com>
X-Google-Original-Message-ID: <aszNVJ0JRbWH7Kf5@Ansuel-XPS.>
Date: Mon, 12 Oct 2026 14:06:44 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
	mfd@lists.linux.dev, lee@kernel.org
Subject: Re: [PATCH net-next v25 09/10] net: dsa: mt7530: generalize and move
 common function to lib module
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-10-ansuelsmth@gmail.com>
 <sashiko-outbox-166724@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-166724@kernel.org>

On Sat, Oct 10, 2026 at 04:11:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] net: severe MDIO bus performance regression via sequential regmap_field accesses
> - [Medium] net: dsa: mt7530: stale hardware bits preserved during VLAN setup due to RMW
> --
> 
> commit 9f9905cb3bdc569b54ef5ded23eb827e6ba6ffc2
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> net: dsa: mt7530: generalize and move common function to lib module
> 
> This commit creates a mt7530 library module to share common functions in
> preparation for Airoha switch support. The functions are refactored to use
> the reg_field regmap API for register access while aiming to preserve the
> same logic. Minimum modifications are made to header files to permit reuse
> of common macros and enums.
> 
> > diff --git a/drivers/net/dsa/mediatek/mt7530-lib.c b/drivers/net/dsa/mediatek/mt7530-lib.c
> > new file mode 100644
> > index 0000000000000..098dd45d3ee9f
> > --- /dev/null
> > +++ b/drivers/net/dsa/mediatek/mt7530-lib.c
> 
> [ ... ]
> 
> > +static void mt7530_lib_fdb_write(struct mt7530_lib_priv *priv, u16 vid,
> > +				 u8 port_mask, const u8 *mac,
> > +				 u8 aging, u8 type)
> > +{
> > +	/* Clear ATWD registers from previous access */
> > +	regmap_field_write(priv->fields[__MT7530_ATWD1], 0);
> > +	regmap_field_write(priv->fields[__MT7530_ATWD2], 0);
> > +	regmap_field_write(priv->fields[__MT7530_ATWD3], 0);
> > +
> > +	regmap_field_write(priv->fields[MT7530_ATWD_CVID], vid);
> > +	regmap_field_write(priv->fields[MT7530_ATWD_IVL], 1);
> 
> [Severity: High]
> Does this sequence of regmap_field_write() calls cause a severe performance
> regression on the MDIO bus?
> 
> Since the MDIO bus is inherently slow, taking around 20 to 30 microseconds
> per transaction, replacing a bulk 32-bit regmap_write() with individual
> regmap_field_write() operations expands a single register update into
> multiple Read-Modify-Write cycles. 
> 
> It looks like this single FDB entry write will now execute up to 15 RMW
> operations instead of a single bulk update.
>

I think it's acceptable for the good generalization done here and also it's
not exactly an hot path updating the FDB entry.
 
> > +	regmap_field_write(priv->fields[MT7530_ATWD_FID], FID_BRIDGED);
> > +	regmap_field_write(priv->fields[MT7530_ATWD_AGE_TIMER], aging);
> > +	regmap_field_write(priv->fields[MT7530_ATWD_PORT_MAP], port_mask);
> 
> [ ... ]
> 
> > +void mt7530_lib_fdb_read(struct mt7530_lib_priv *priv, struct mt7530_fdb *fdb)
> > +{
> > +	u32 val = 0;
> > +
> > +	regmap_field_read(priv->fields[MT7530_ATRD_CVID], &val);
> > +	fdb->vid = val;
> > +	regmap_field_read(priv->fields[MT7530_ATRD_AGE_TIMER], &val);
> > +	fdb->aging = val;
> 
> [Severity: High]
> Similarly, does this sequence expand a single 3-register access into 10
> separate MDIO read transactions?
> 
> If a full FDB dump of 2048 entries is requested, or continuous stat polling
> occurs, this could multiply the bus traffic and cause severe latency and
> MDIO bus congestion.
> 
> > +	regmap_field_read(priv->fields[MT7530_ATRD_PORT_MAP], &val);
> > +	fdb->port_mask = val;
> > +	regmap_field_read(priv->fields[MT7530_ATRD_MAC_BYTE_5], &val);
> > +	fdb->mac[5] = val;
> 
> [ ... ]
> 

Same reason, it's acceptable.

> > +static void mt7530_hw_vlan_add(struct mt7530_lib_priv *priv,
> > +			       struct mt7530_hw_vlan_entry *entry)
> > +{
> > +	struct dsa_port *dp = dsa_to_port(priv->ds, entry->port);
> > +	u8 new_members;
> > +	u32 val;
> > +
> > +	new_members = entry->old_members | BIT(entry->port);
> > +
> > +	/* Validate the entry with independent learning, create egress tag per
> > +	 * VLAN and joining the port as one of the port members.
> > +	 */
> > +	regmap_field_write(priv->fields[MT7530_VAWD_IVL_MAC], 1);
> > +	regmap_field_write(priv->fields[MT7530_VAWD_VTAG_EN], 1);
> > +	regmap_field_write(priv->fields[MT7530_VAWD_PORT_MEM],
> > +			   new_members);
> > +	regmap_field_write(priv->fields[MT7530_VAWD_FID],
> > +			   FID_BRIDGED);
> > +	regmap_field_write(priv->fields[MT7530_VAWD_VLAN_VALID], 1);
> 
> [Severity: Medium]
> Can this sequence of regmap_field_write() calls preserve stale hardware bits
> and leak them into new VLAN entries?
> 
> By using individual regmap_field_write() operations, this performs
> Read-Modify-Write cycles on the previously populated hardware register via
> RD_VID. The old implementation used a full 32-bit regmap_write() which
> safely cleared unspecified bits.
> 
> It appears that any leftover hardware bits in MT7530_VAWD1, such as EG_CON
> or PORT_STAG from prior usages or bootloader states, will be preserved.
> 
> Could this lead to corrupted egress tagging behaviors or STAG attributes on
> standard VLANs?
> 

From what I can see the vlan entry gets read first for existance. This zero
all these values addressing this concern.

> > +
> > +	/* Decide whether adding tag or not for those outgoing packets from the
> > +	 * port inside the VLAN.
> > +	 * CPU port is always taken as a tagged port for serving more than one
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009161102.38961-1-ansuelsmth@gmail.com?part=9

-- 
	Ansuel
