Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F23B33F8C2
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 22:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466374; cv=none; b=FXe9GlRGoqpe49X8pASAokR12j/NebqRPKYWPlnyqjkvF43vxDJqcAmimfouyOLGuinkAC4owt5MvrwDUkFS7brDw84k/Ni58iQ/OzB0YceF5cege4ufrBJhQFttcxqFA0C88G3pLjksDJVyPraY1TAV5yG10RZaKFTLwbCFlZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466374; c=relaxed/simple;
	bh=7lRGRgO+sY+Tbxa5k/XtW9OKVistKJlg859ZG++Wb+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJj3QTFEiEp6V8NBV3Ten5yx6csd5KkJAN1wBeJoiqEmUnPeqr/ewvIQsGEJpatALUiep/3BCK+0MhI+hlXaFYpzwDbrgNqsuIBZWTYrEX5+jm1Cn5rGwCILOzQSOOSmInxbGpSExc/Nq8fbNjodQqly0RePmQBy+DBCyXbXTls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq338jIG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq338jIG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso11955155e9.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776466371; x=1777071171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7b9iJ8FYU8MqXaQzWePrt8eUV3AQUrbeqNJZgHzFab0=;
        b=Pq338jIGCJboGm70RZIPTV22a+4zkUwQzhrlquloVTMmj+Y2BJhdkbuylNHkxPnn6V
         WddFC3UVHEPUaT5IB4ZabdTwmmhOG9lSczHsnOgGrJpXtkb48unkJZGt/7L/N5wbSVUd
         /xO6H2LhsYgT/NmON3omdnOtVB1UaEJk3Ug/XY4daq9PUpjh2vAFZ+Icaf22nr4wLDrZ
         634Y5vt3cKljmiVGEDs6DzuZdFIF0dMo/3KUe3Jwn4TtVfVfDUxoHqkA9ke+qjCDyuDM
         //i9YhrL5IP44RyTOYioF9n1KQMjuHAlt2mxaPK+UuO6lv6SZFh8aJDtGq2LKRwA8x9N
         do6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776466371; x=1777071171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b9iJ8FYU8MqXaQzWePrt8eUV3AQUrbeqNJZgHzFab0=;
        b=JpOWF8XznfcWDPvBkqFR76z+AdfEvzBmLN59H7P72P/oeNqIb507o7lX3XG3N9T8Yx
         IQnjlXtCuH42thQK2fzsbhbiZzRw1UaxPiH26dmlYku0bnhlqbUKo/w3zISo1mSUg5z/
         xXk2B1HVx5OaeXvS/ync/jt2ZSo+qKK9URn5tDmZSClN102ZUtDH53sVogxTiiAx6XHy
         56B5TApPBeKM3DOrFkux90NhGBBZn3vhdYDwQGHN5/mdfJeHir6m41C9JnBVtAl5jFeE
         X0ZYmEp0eKangv2Y9JII2JXs5W3hPVnPdOY6b6c6vBZ/zjpVyk685nJNbJsYYA63vgIm
         u/QA==
X-Forwarded-Encrypted: i=1; AFNElJ8rT9f3aSg1FWSXtGMZLtgTSATPPKSiJNCu8aNaB/ER10vcHaAwZvMurCe+kl82xrF1SCivi+KzmdsS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75u45kpdlUEcGKXyV9cjs2CWQJzuWqJkwmgOKYSS3EFR9IxIR
	vixsvTilnwc8J43F2me9j1oCgXnGjxlbfLlEyaw00kE36xviMrLVpnzQ
X-Gm-Gg: AeBDiesHZXONWl3qx+3Pzy9YXJD1cPl/D1Z598nUrpYVBbgH1QmqZlGyjCBeklZ11iV
	+ndCv3XzLOZcPjXl8Udh63Cw50XBmZ6fyRJ2YbZhCPzsYJS2BZsu432ZkRtJDy35NMzG1goxPgy
	deAUCDg1/zYF+qiCbUaTyz+ZSbdKsAkoEl9zjp3nNTHkvz3f9LlrqrteDMHTDCF8tI4QdvKqwlM
	DiZD4zndyka5QcG4EppEYVw9GR0k4ck/eyjJAJ9SeB6BzLmvpQtZvTtwUCiiPv4zkBfNIdkGrAY
	XDw5cAeGIlyaAH+UoOggy+BC4W+9o+3FRry6nISrNAjKiVvWiRIu5NdQGE+RIJJC9Yhp+qov0zi
	5IszOJPw7DUwBPfhxos5aObFpi/w/bHW8tyogvM8Q4VOnPOKOO1xR94Vvh0kmQXafYrfIWw5yHq
	uQSuKlJ28MykB4+JTBkqdkVwd7l0TnGg4YwQcz2tq9p/Pn1CVphhQLe4i4a9ojJiz2Bys=
X-Received: by 2002:a05:600c:3150:b0:485:3b00:f93b with SMTP id 5b1f17b1804b1-488fb79df09mr72042475e9.31.1776466370571;
        Fri, 17 Apr 2026 15:52:50 -0700 (PDT)
Received: from localhost (16.237.129.77.rev.sfr.net. [77.129.237.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc143a0fsm80393065e9.14.2026.04.17.15.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:52:49 -0700 (PDT)
Date: Sat, 18 Apr 2026 00:52:49 +0200
From: John Madieu <john.madieu@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 13/14] ASoC: rsnd: Support unprefixed DT node names
 for RZ/G3E
Message-ID: <20260417225249.mvi7sygew77wf374@labcsmart-sqy>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-14-john.madieu.xa@bp.renesas.com>
 <87h5paz1w6.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5paz1w6.wl-kuninori.morimoto.gx@renesas.com>

On Fri, Apr 17, 2026 at 03:44:41AM +0000, Kuninori Morimoto wrote:
> 
> Hi John

Hi Kuninori,

Thank you for the review.

> 
> Thank you for your patch
> 
> > ---
> (snip)
> > +struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name)
> > +{
> > +	struct device_node *np = rsnd_priv_to_dev(priv)->of_node;
> > +	struct device_node *node;
> > +	const char *unprefixed;
> > +
> > +	node = of_get_child_by_name(np, name);
> > +	if (node)
> > +		return node;
> > +
> > +	/*
> > +	 * RZ/G3E binding uses unprefixed node names (e.g. "ssi" instead
> > +	 * of "rcar_sound,ssi"). Try stripping the "rcar_sound," prefix.
> > +	 */
> > +	unprefixed = strchr(name, ',');
> > +	if (unprefixed)
> > +		node = of_get_child_by_name(np, unprefixed + 1);
> > +
> > +	return node;
> > +}
> 
> I think it is better to have name get function, and use it on parse func ?
> 
> 	char *rsnd_xx_name(node, name)
> 	{
> 		char *sub_name;
> 
> 		/* name = "rcar_sound,ssi" */
> 		ret = of_node_name_eq(node, name);
> 		if (ret == 0)
> 			return name;
> 
> 		/* sub_name = "ssi" */
> 		sub_name = strchr(name, ",");
> 		ret = of_node_name_eq(node, sub_name);
> 		if (ret == 0)
> 			return sub_name;
> 
> 		return NULL;
> 	}
>

I agree that having the "try prefixed, fall back to unprefixed" rule
spelled out at multiple call sites is a consistency problem, and I'll
fix that in v6.

What I think keeps consistency, and it is to factor out
just the string operation, and have both sites build on it:

    /* "rcar_sound,ssi" -> "ssi"; "ssi" -> NULL */
    static const char *rsnd_node_name_strip_prefix(const char *name)
    {
        const char *comma = strchr(name, ',');

        return comma ? comma + 1 : NULL;
    }

Then rsnd_parse_of_node() uses it in its fallback path:

    struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv,
                                           const char *name)
    {
        struct device_node *np = rsnd_priv_to_dev(priv)->of_node;
        struct device_node *node;
        const char *unprefixed;

        node = of_get_child_by_name(np, name);
        if (node)
            return node;

        unprefixed = rsnd_node_name_strip_prefix(name);
        if (unprefixed)
            node = of_get_child_by_name(np, unprefixed);

        return node;
    }
 
> 
> > @@ -1273,7 +1294,8 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
> >  	of_node_put(node);
> >  
> >  	for_each_child_of_node_scoped(np, node) {
> > -		if (!of_node_name_eq(node, RSND_NODE_DAI))
> > +		if (!of_node_name_eq(node, RSND_NODE_DAI) &&
> > +		    !of_node_name_eq(node, "dai"))
> >  			continue;
> 
> If driver is handling almost same things individually and/or randomly in per
> each places, it will eventually lose consistency.
> 
> rsnd_xx_name() can keep consistency ?
> 

and rsnd_dai_of_node() uses the same helper instead of an open-coded
"dai" literal:

    const char *alt = rsnd_node_name_strip_prefix(RSND_NODE_DAI);

    for_each_child_of_node_scoped(np, node) {
        if (!of_node_name_eq(node, RSND_NODE_DAI) &&
            (!alt || !of_node_name_eq(node, alt)))
            continue;
        ...
    }

This way the "rcar_sound," prefix convention lives in exactly one
place, and each call site keeps its natural operation (fetch vs.
compare) without redundant lookups.

Does this work for you, or would you still prefer the node-based
getter?

Regards,
--
John Madieu
