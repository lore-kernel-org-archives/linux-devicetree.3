Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671600;
	b=n4e7LV+yfM7AB3VoRItwqVJHw+TT2bxKfJMJL8xqJ7oldUJSQpDW2XFefjhE2UivOIs5
	 NrR8hXesVXAmvuHtXoiKDXB35poOhveGc7/xe37FFIcLqUh7cYPnUhOdhMCpx690waJWe
	 Qi7GbpRkO68altUC15nMnTUXAtzodvGmjJZorefly7WLRNwSNXriEGnwSs81zdn1PAylG
	 PLZfwfo/x0zWNw/kIEBcj+xyoB12H+pusIXUSoGIG3MxAemJ9XBOvMhCzu1ayMeeuBYa7
	 hXmWhOt735ZAWcGmjX2UAfvpi+7D3iovMW3OX3cLE5JUS9h/UTpjQTbJ00bGH+xiYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
	b=x4XdktLAymfT3PhjxsARD9zKdoB2V3HphJG1PMMSvF5q69HwcLTMx2/LZHMHLx79ATXs
	 Bbup36RSoGOp+Jw2YEtefHQeobbCgkGHJ+Yw1+BNVzwigEAjWB+spFB9p0JcowYFK3I/6
	 WkvKptsVi9Wji5yERNVHTM9j88EHw0bsRY20Er2zg+w8n+i0GClglhl6BmnQaEWj9nFwV
	 Sujefni87nVU5vgd5p2rgAQZCvkE71aXWmAPqbels9MmOb9NM4Gj13W0Q47+X/WMt1DN/
	 yrk2wH32ne/IHgEJcz2LV5hkFlkoCqXMY4QNJVcgbPbgffjFsdl0HzOqW/sMF2DRilg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mAQ0+p5l;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F07606D80E
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 02:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F07606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mAQ0+p5l
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-353804b591eso6476252eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 18:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671599; x=1794276399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=mAQ0+p5lGe83v747xCyqCS4N8Akjbdkj3F4Iz2/8iImspy/v52+UuU1pE1/Bf6MR50
         E2qDfWgV7bzTU9JYVsGuVRf/bSzdw7SGqRzm0piGjvkzs5eN3BDwZTqZ3vUQsCyWwqzT
         eKkyuVd25qAhw0WgVLwLZD9VIBXnP3Zi75qdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671599; x=1794276399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=IoFR8YE3dzygGjjeJ2U/XGWVymDlTzAG0lR0dvJcJG3MxuU8p2hyjQO0vX7pSO9j86
         pDxLE9lEqppp5f7aRoOcG+efk9JrFnxDkQL241m2//tbJSVheNnsIhAEbBoT4MIx233J
         4hiWiukuLRzF5tr4FSlcMpgYw5w3u0nT6HuCflcLFusntCbIl0sPg263qp0RGpEPsQlM
         yY1jAYft08neKaQL/QjdGxU5C7/zp8lgZ/3ixh1YQlfBqmgHuoGSZqxAmKAZU7oSlmtc
         Q/u8rv+Wq30bgNOSigOghkdLEfDw5KzscCXuWUIMPlPmOpmMCQ+WdO4fgL9iYe8hclB+
         s0uw==
X-Forwarded-Encrypted: i=1; AKwUvBxCvxuOCRP7REVHYd7XG7scoUhhaUfCwE79hBi2fSTdBA+O6NDVnsjVnuwxzmWPMZIG/wvm/CgDH5UX@vger.kernel.org
X-Gm-Message-State: AFq9FYIehFucuER2bUHHOBaHDI7SsPk4jIrt8bR1E2S3xWB2DAWoZA1b
	pRoqjuONhE4Phkyr6XrIcbLWk5BM3NyHtW5BGgIliws/PqnL+7QwGY+datyfKkm+9A==
X-Gm-Gg: AYBFou1LALvGepTO0VMNYjTjPB2sBf85ahbWuc+ujjmHVXTxSBWe9o6ySQf+ojmMs3A
	nRU5887PeSVM6YR+MGmM0Fac2Ww7iXLixjC9WPLsz3HXZ49dY1WMwbp/3TVHufD66DeM1QxRcTR
	87yNu8jBc16SfA+4l412Alo8icRQOFqXEgObzGO3qk/PcINsbNoMvKKIrodWl2Bo2tkBxzsVimD
	VTlqn6T/sLwkcll+FHucmFglf4c8wa/TrcMbBZYWRR4JDH7P1Svk5EU5FWTXjcWcMO4jFsgpz5n
	aKYhgGuAc3Y8n8v8otHCWOk5zhu1DG2FBBtE6OzzffLzMqxOz176XP84b6X4vqB08KPbff10fpj
	C7V0ltqa4FVkx1WP7EjMxCMnUaj9vdl2Iyh6NJRI2vjuBcPNukl+Et/g8EgLUbUr5lVKUiaes57
	sGVwLDGCvjjMobzpzcR21XH7lg/QF8UtaQCCE0T0l5nTc3tYSDu6MIacAopIsNh1tG+y+epYWan
	vy1eP4ORwB+hf8pm3tNWDajp2VBnf5Q1riGip9aiwPP15xiToqF5yHxZ/AhcuCf/CdKQlJXZE4v
	jAKEIBUOyMutzeAK6UAqvOL4aa3/4COsep5xmS0aUmGBn2fLu9FnlHdtAm6y/SbUsgY=
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr3971156c88.3.1793671599060;
        Mon, 02 Nov 2026 18:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1ac19f4a04esm37837284c88.15.2026.11.02.18.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:06:38 -0800 (PST)
Date: Mon, 2 Nov 2026 18:06:36 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
Message-ID: <aulBrFWi54E6a7Br@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261028-armored-glistening-cheetah-6f3070@quoll>
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
In-Reply-To: <20261028-armored-glistening-cheetah-6f3070@quoll>

On Wed, Oct 28, 2026 at 02:24:35PM +0100, Krzysztof Kozlowski wrote:
> Either you expect review or not. RFC means no.

OK, PATCH.

> If that's patch, then at
> the top level of cover letter, as the most important thing, you explain
> the dependency and merging proposal of this.

OK, I'll try to move it up. To be fair though, every change that has any
dependency is clearly noted in its below-the-fold notes.

> You combined here like 5
> different subsystens...

What do you recommend here? I believe the general principles of DT
binding development suggest there should be a single binding doc for
describing the "Central Power Manager" (and the services it supports).
CPM supports functionality covered by many subsystems.

While in theory, bindings can be written without corresponding software
support (drivers), in practice it usually works out better to develop
them together, to prove that the binding describes the hardware/firmware
sufficiently.

And even if the binding goes separately, I don't think I can 100% split
the driver support by subsystem, as they all require the same underlying
CPM helpers, and those helpers don't have much meaning without their
clients. So some multi-subsystem work is still necessary IMO.

So I don't really see how I can address your complaint. But I'm open to
your ideas.

Brian
