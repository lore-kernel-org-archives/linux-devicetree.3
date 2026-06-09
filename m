Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0960C3F1AA6
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781030163; cv=none; b=Qj9mFlX7Lhs4caeLLvqCurxApdw5GOF4pXDc4hkn8AftCCsMLeIfQuvkN2UCyUzahR1SpOxbOoCxJpXqERXYujebhXTrJEgtuAxu7vRqusJnWYQVK+u4aLWUrU8fxK5bdvSdIF1N0GhIEyIQWWweEV3yv2Rftd3mCNwHOEg+1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781030163; c=relaxed/simple;
	bh=ALGF0JYkp71o2WwvO7Wrabyf9hljxN/QJSQrdrlgPfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOUv7i+IvJtiM0EtXoNnVHGhHQUXkwU75/TGyrTd9rkQmCdFxALXBsAPxywt8GGNaVYl8cVACdgrwDBWmgDMVdbaIpRWvy88GaLgHZcLui/NPoCkVlK08kLsMweXMZ59HGkFmHlJCA7Gy2anyV38LzXFmSY602/2Ql2oZsGXvtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4B/kx0n; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4B/kx0n"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4908b92904fso67729185e9.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781030160; x=1781634960; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HgmsivMcka0FxO5n28WPRUyS7SBIOMsz34g/tl81a4=;
        b=T4B/kx0n7xQ6uPLTwPXdrw2oFCv0QDBptD5FnBK0Ghgocu5N5lEi2oZUK9kjmDmLDF
         oLtd6R0AGzlbEJf8r+UOj1OOGow0i8DzjIuo0H2e9s/TDc5H/8CkWRUZjdiTnQ0MzvOu
         QeXubbIXxFnDLaUR81gBflAyBp2dlqFv5gPvyrnuZRTCXZjm7hTcwkFxgi+6QcdcRkT6
         7TEFr3/jUIbbQwMGoGbW1PUEsQKCB1Wr+d310Q6Ke/TeMnLvxjoMzSKzPZVPS5ayAXTR
         /OJ97ep8eLZdiIttZN6Jc0IpeCW+YFnQJ/RUondHDcmy7/4XfwMDRAb8Laexo/C3KSlJ
         ApOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030160; x=1781634960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HgmsivMcka0FxO5n28WPRUyS7SBIOMsz34g/tl81a4=;
        b=ai2Krehz9E/vuHSPr8/30GbRQbMT57JqJ0Ud5BYc47FRwgwwV7uVFNOfiKnIiv1ckJ
         BCyOrBKDFbJ1EB7wgAyhWXy1kEIfWD/mqDYJs6cBjmV1vdXDuFe2QwT5pm26u2hKnp75
         3wV9M/np925/eHAgHKblajUgI982IqfKgWF42vFDUITV7BO6l+lTgQ2BFaGAnWTwp/hG
         LtsUenPBtBW9Rev7hRNBBm0uWNV76/8VZHpXnoYqz1lb62Xrw7EM4tWNuZ6jQVWRxTLM
         +mdS03Ow9wL1jl9GI1oZIJGu72AnGjH9UaA8HomhmYCMin8XV3mcbQM2T4yAlHhX8oBl
         cPpA==
X-Forwarded-Encrypted: i=1; AFNElJ/y4fH+8heDNGoH3/Xw9y8hxo0NpIZziJIocGFQ90ykOJn6xvwd4L2qFy0gVkTt7osBeprqSI5S0LOz@vger.kernel.org
X-Gm-Message-State: AOJu0YyWW3Duclr7b/0lLo0eo0Q//H7PIDRy1c0512qCPykoXdBbfTL8
	8Jrxflkeotnc5giz7UUumNgYYiddhJE7o6oKBwB9lNPUeazFnlyaCR63
X-Gm-Gg: Acq92OGWc1x1dO9uPBvuINQbFjxQDmWElBd2WZ6aOdtjYCLPNkiTFQ4MPEeE8FQN56n
	r6DJcwCCbZa6nvL121Oen9PhByKtKBKGqfBF7mzgUfZieIllu6MLSa/xHFIPycBG4zmf+UciWac
	GXqr6gakfW9tDR3bb0DZ6a/1cPtSZPl/M3r91Udn8WsmwS61Xg6AUaCHZ6L6oGQOT24e/n+ZIjf
	9Ik0LT5716eiehwucrG/R9ejrgvEBueQTzTTbWKp6vnYFxXLhWnu58opjAg7Pi9HIro6UArmY5N
	EsFlXkLmT2TyBSgip9HOykG3PQ1mba+kEAwiJJVW2HvtEv/rkuiEGp2HX24i+gBBgspSgmcm09I
	fE47LDDi6DG2f1kEiU5kwUxoi8PNNDc+IXPb/K45xFZHIs+0kbSktROPPLjs7zkQchQ28ZD+H01
	R1g+pLfY6wsRK4h8wdaPdpIX3VXG7UcJBEMCiWBZ6NmQ6GyBQjouLgt9Td+yknNGZ/cUs3WkcfM
	RUpZQ4nArLkOFqm5VTBsIlz3Ip+S8mIuTL/KMiYfWleRz4DMgxV85c=
X-Received: by 2002:a05:600c:6389:b0:490:33b3:4be0 with SMTP id 5b1f17b1804b1-490c26233abmr364661655e9.20.1781030160046;
        Tue, 09 Jun 2026 11:36:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm512912365e9.7.2026.06.09.11.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:35:59 -0700 (PDT)
Date: Tue, 9 Jun 2026 20:35:56 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M
 PLUS Boards
Message-ID: <aihdDCS7LDcUELLt@Lord-Beerus.station>
References: <cover.1780998600.git.stefano.r@variscite.com>
 <c65129896fc6ce80044ee1d89e12dcdff34945be.1780998600.git.stefano.r@variscite.com>
 <20260609-clumsy-material-b74a9b6bc7b7@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609-clumsy-material-b74a9b6bc7b7@spud>

Hi Conor,

On Tue, Jun 09, 2026 at 05:15:43PM +0100, Conor Dooley wrote:
> On Tue, Jun 09, 2026 at 11:51:18AM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> > 
> > Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
> > development carrier Board.
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> 
> My mailbox looking like
> | 169 ND  Jun 09 Stefano Radaell ( 27K) ┌─>[PATCH v5 3/3] arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
> | 170 ND  Jun 09 sashiko-bot@ker (7.2K) │ ┌─>
> is a pretty clear indication that you're iterating too quickly.
> Try to slow down and leave people time to respond before sending new
> versions, not just respin for every automated response you get.
> 

Sorry about that. I was making small fixes and re-sending the series
immediately, without realizing that this could create unnecessary noise
in the review process.

I'll make sure to leave enough time between revisions from now on,
so reviewers have a chance to look at the current version before I send
an updated one.

Thanks for the feedback, and sorry for the inconvenience.

Best Regards,
Stefano
