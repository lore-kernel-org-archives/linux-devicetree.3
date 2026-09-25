Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DB74A1E12
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344435; cv=none; b=FSHYRASZtqLXgIXnVAXbGiMPzWOlFuGCZN7NNM9eZyT+GycGseOMo1Aiuoafps41tjthctQf7e6Pr2iLzoEfJIQe8/O4chc+F50ntTCCpND4M2LfdQK6uy5olVnjpPHv7C36hkEun0covWqG71WVJ27rBxLD9twfdwI/6n0mvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344435; c=relaxed/simple;
	bh=hNw6vrHbhx2PblfWwARxPslf5MioPjYbwh4EEsJ1w7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+1RvTgz1h1H0UJf07WR+oqhfLIEOqMolr7jmBChycM69+88vCKyQUG85XN3YQ6w/LbQWbKPncA3C3SL+EWhPcqi97v+JePQb4Cn0Kv0ml4pAN7WeSY4Ijee+tYX0eNrOmpEBSJlbXCMJH3+MIjkJcyJHu68Sq6JeF40lc6SE6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU+WFRJp; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU+WFRJp"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso510990b3a.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344431; x=1790949231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XdrXdgsFzarfUhjEFq1mXLUok84uZ5SW2Q9gL7YwPb4=;
        b=eU+WFRJpuY9fo5vRDPjd+sC/yw9JCX73Z4+d+zMXat9PT6j3Ch9bUh2lguBc0a1k92
         DWyrzdqd88xU8Nf0Vg7036p3VNjaHdu8jmp6b0lT3mMWg3yNnEon0JB1Fz4Dbg5Jjxjq
         1CpeFqyqMZDsTgf+yigRKxUJH7fo7smaJMdlrEpP5sGh+GJpgakdZv5/QwxIFYiWBfu5
         Klw6oeHKOU+ted8K8JYlDqAdgWL+EULZKtIvl2g80LBavOfBBYFaS6yeCsmDe6LaXCyX
         BFwtwcwj2SUopk5f9t19tcgLGCix0a8t5Lxlt/GKuooUJogSFFwCOlhervC7DdzfdAtW
         +WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344431; x=1790949231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdrXdgsFzarfUhjEFq1mXLUok84uZ5SW2Q9gL7YwPb4=;
        b=1pygPZQYBbZASkgEQio3DR2hmIp2DVL5alpB9SC+iERaotYcehf0c9FNGg0xuQvHFi
         xln+DhvstYM07K2aiyOTU0H8hQHvaSn4gX6o+tXaF49+FyqZFWkWs+JCgi18Tso/mo2y
         nfOvUmUDa7/diWW2RlLcoAp5Y1TthncmJ2TQ7q8bUk2Gk7ayiMDff7bFXIIQTIocfp0I
         gLYdi+SyL5S/k0d/iSsz3/Y0N+7slGAtopVXtff9MVTzSWBygT1g2wU1YiBKMRkEObOr
         S1E6T2FzgBjZHadxILIrWXn0fwPKc/yXMeLifImVmpVtEAnPs9NMEpoFYoXnj8ZiRbeO
         fymw==
X-Forwarded-Encrypted: i=1; AKwUvBxMgPiVxmmpZLiZ3Jg/Qh979VEC94Yto75uwgqxbU3fz1PdbQgLdM15Z83k/jIn7JSn8I9RvDd0YON3@vger.kernel.org
X-Gm-Message-State: AFuF++mNp0f5gRFknlKgyJtGq54wHQwM0oKZqEexdURZmnXvkOAtxqkW
	qtebZ2kJL2w8Qn1eYGX7f8xCK8qSgsVwHc3uqL7K9JDGBfjkVM5RcKyf
X-Gm-Gg: AYBFou3fMI/oXMIdrzjEAf/GVUvwR/NBMxKLNZ+u9N+vtpy0Eg/7zwY4yGScfX1rdYH
	V86RxZwj4nM88dRbsukwtQimWMGR8qeuuOYkW6m+DfTTPmrdHT/wqRkzD0IJuoNR9QcpCPdr1Ww
	dvUMtnGJQoz2bdQUmaWkPtIst401Gh+PEuvsQx+7IclDE/VU20YDVxJDzwdOukENQf9pA8uTuhK
	4e0sg6yjjEKolB0ZPVqorAr+k86uCBoVKJ7Gek/Xc85EoDTpMZh7+r0EndPL1aUGMHfJhXJM4rw
	XrJoPoGUFqPCQEyCg4g8l/ZP6X8pVzectrFuK6Imm7FKSU/r6qMCnX1aAXqGWWd1lf2v/oydhRA
	3scVUJwVyyFAhnR2vSRh0nzx4o+cNxAPEfmaeXdTxhetVgLNbsn5Efl5Ok/ZeZjmoclApj8BsPc
	qb2EhISK3D9tUyoJqakeAC9I6E5E1W2fhbQJ9r4EaXDS6SzS7ZQO0zN0/3R9Fcobf3ORvKAExwF
	Ix8qDwYvwt1
X-Received: by 2002:a05:6a00:6c88:b0:868:f29f:67c9 with SMTP id d2e1a72fcca58-87e9899515bmr4754627b3a.9.1790344426713;
        Fri, 25 Sep 2026 06:53:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea888b10sm1160362b3a.29.2026.09.25.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:53:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 06:53:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639
 and RAA229640
Message-ID: <6c0a8e93-9fe3-4389-8d59-08df49cc54e4@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
 <20260925-hysterical-otter-of-courage-bc6ab0@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-hysterical-otter-of-courage-bc6ab0@quoll>

On Fri, Sep 25, 2026 at 03:06:51PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Sep 21, 2026 at 03:16:36PM +0800, Colin Huang wrote:
> > Add support for the Renesas RAA229639 and RAA229640 PMBus
> > voltage regulator devices.
> > 
> > Both devices are supported by the existing raa_dmpvr2_2rail_nontc
> > driver variant, so no functional changes are required beyond
> > adding the corresponding device IDs and OF match entries.
> > 
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  drivers/hwmon/pmbus/isl68137.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> > index 2f7f825bfb69..15b4e3f15f11 100644
> > --- a/drivers/hwmon/pmbus/isl68137.c
> > +++ b/drivers/hwmon/pmbus/isl68137.c
> > @@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
> >  	{ .name = "raa229004", .driver_data = raa_dmpvr2_2rail },
> >  	{ .name = "raa229141", .driver_data = raa_dmpvr2_2rail_pmbus },
> >  	{ .name = "raa229621", .driver_data = raa_dmpvr2_2rail },
> > +	{ .name = "raa229639", .driver_data = raa_dmpvr2_2rail_nontc },
> > +	{ .name = "raa229640", .driver_data = raa_dmpvr2_2rail_nontc },
> 
> The entire point of fallback is to avoid this change. Why do you need
> this?
> 

I personally like to have it for this driver because it makes it easy to
track which device require which configuration without having to track down
devicetree fallbacks.

Guenter
