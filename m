Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D743473C8D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706949; cv=none; b=K2AXunpquISHrzMdF/WI94Ul8oZkgKbkpNmsSkPzFbDu+ON9qDD9ZhkXSaBTvhYwG/0YBVCQw0IRojtmL2WF5K2A7ZICqiFwt4KclOlmLuafBOH03TDVRwnZhNvJwc+omUMmE+s6Nx8VIfZFLRilej/3ukgb+vILEosC0RbVIGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706949; c=relaxed/simple;
	bh=7iZEz40xLl00lm91VqgOG7NR1gf8pYZxrp3nTa6KfZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLKQIb42DmZ81DCi+NmvIlWuq48y9TTOaVJrww2UKoUDp1cZe1gm3qYiqnd0/eEjn1RaLIf0f/q0u489oxaeSl+fBJceHGkwJx15hfDe+SFsLMtnId+YYBC0nq4b1T02gSPnM1NGDoKBDulzoxDBmjqaqdlcRJvJm4sCcNZ1Uq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwvOMFDl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwvOMFDl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f6981d244so197259f8f.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784706946; x=1785311746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ylc8TXlNP8HCp9xOR7j/KXR/abtqHgmLUYlJxvcNlVU=;
        b=ZwvOMFDl/1E3Iw3pBlJrYqhFqGqcOWSz6C3GgMmpuFj9aqVtxXxaY6nilMGXNvNOWB
         hXqchaug8ol8cJkuSlPV+rZCA4ugHesmgwM+El6a7MjE/rvSuybRfv7VZ7tK3wX4eQLe
         sSFBHBanVsVF4H/vEZ1W5navaSgvxaoa3tG9iZl8JemfRroUagBgVp/EYmdH8pbUBnhC
         DIlpkjDEcpV9vY8nIaVe+zlfU9KzfvaKAwv4FHTST1Qg4tMI0t8hVuayo+fq9zxOgZK0
         EfwA05FlF0QAqsBwB4vxRWWNJs9ZTefniwlmwU9Gd1f5cIyKnq1Hf+fGnLypaKPckOAy
         WDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706946; x=1785311746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylc8TXlNP8HCp9xOR7j/KXR/abtqHgmLUYlJxvcNlVU=;
        b=ZzkB3WS0EvCoW+UrPdXeV/03YXdP7YTc4irjqo5LcxUUIGUeS4FO4lgt+FTNN0GuZR
         TloMSlvCDWsi9+VRUEM/XgvtBunwHoF6iViSRZKs61uxqxmm1+K5kGSyydLbMsKrx1KO
         qvBDId6mxqNYHfhRTAK40vHnL07PTF5CnxTdFTXv+Ulpo5c4/syj1liCu85FYfM3oXF+
         mXUqoQjBIZ0YAnKPH/vPYgefgZaoo/RSJ0jYUnk7GJ8Zc+05LD0cLQsPCBMLjzVSraqv
         0GzBN871tGr3g6ZaGlOXHPLxAKmP4EBLV1uMXYj3Bt7KY7xHNWPKw2EYK/cC53SeYpEr
         mJHw==
X-Forwarded-Encrypted: i=1; AHgh+RoGNWNZo+R/cZRb+qrBfcacBlrwjlKBtkQ6W8aiZpPXfybTKfUNkNTn0qDligA/Z0uKfaA/WRy4XKp6@vger.kernel.org
X-Gm-Message-State: AOJu0YzOvB0Cf85tfVoWuKa9ttpqjqzHyaD/o97UC6gHZGXEnnkgdpG3
	k/Rl4KY2xKbQtO14C4HBhvi6/VaG0xycyFrGjs1Gk9MFmBWpJFaVdF7U
X-Gm-Gg: AR+sD139/KwcjSM+07DLvhUqN3v/4a3FPe49YXHCQi0ej7+qAgHvXDvvL6tceaLeNBb
	sz6R2M2M+KBBmf8RZb227fnrk2rSMHbunNRgFMJiWNMjkoxsZoHMJLy83iJE8gZboU4lMm/p4mC
	N7PpjcWCA253w34vz9ewyYRDVYsD84fut1EkIUmnTBpthQHgfbmOwJ73rlPs9CJtS0RczHCvo0a
	93Bv5Lao3Y6DvDD7Yfi7jrfz9h0tFcT+WXP9eZRk9gEINtC1trHLW3jLrVKUmlYfo+h2NATu0my
	pkVVkRsHkjp6JNiswFO81ibdKiq+kFOkXgDc8ch7mlnC5ISi+DybuPHKNz/yeZWAE5L0YUl6O8t
	zVhlRHKn31A/Li0bffaNYg2XeTUs1RoYPoncbVkJCyL1L0KargI487BC+GGl0m2Ty6k7g
X-Received: by 2002:a05:6000:4687:b0:47f:8136:e7f5 with SMTP id ffacd0b85a97d-47f8136e9edmr2516706f8f.2.1784706946354;
        Wed, 22 Jul 2026 00:55:46 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d801:b100:1a7a:c7e7:fc27:12d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm3759581f8f.1.2026.07.22.00.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:55:45 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:55:42 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 phy-next 1/9] soc: fsl: guts: perform fsl_guts_init()
 error teardown in reverse order of setup
Message-ID: <20260722075542.p3uissyqzcvfsdri@skbuf>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260721231603.67865-2-vladimir.oltean@nxp.com>
 <DK4X0XV6ZM1E.2L9G007WXO2J6@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DK4X0XV6ZM1E.2L9G007WXO2J6@kernel.org>

On Wed, Jul 22, 2026 at 09:18:48AM +0200, Michael Walle wrote:
> Hi,
> 
> On Wed Jul 22, 2026 at 1:15 AM CEST, Vladimir Oltean wrote:
> > Michael Walle has confirmed that ignoring the error was intentional,
> > and we preserve that:
> > https://lore.kernel.org/linux-phy/DK44809N7Y8I.J2Z3U4N32H0Q@kernel.org/
> 
> I thought you wanted to check if kasprintf() fails and return an
> error? Just to be clear, I'm fine with either way.

I did, but then I considered I don't have a strong justification, and it
isn't a change I need to make to make progress with this series, rather
more of a distraction.
