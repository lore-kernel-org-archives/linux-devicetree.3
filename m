Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C4C32861E
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607430; cv=none; b=GfMXIkqnji79omSg6FJWQNS7YiXoQ0vtMsI3AU5xCBChYHMXC3x6gKsxlUOuAhGWISmQxk423d56s8yfOi8OOfM+OrCiiJyleisTcUmyc0EoAM8twdLeVyu5Xfr68ce14J1QY5EtWroDgMKsT56bUeGvi8zrK4UkH6aSA0z3HfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607430; c=relaxed/simple;
	bh=d89DZbU6qSxHVFReirp4z+F8nAR1vhudlk9+d6a3WxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUNqM9cM2IMvQQachPiY7u8mKGe5QcZll/vwNXNHZfaUjZntLOaLXcwl0S6lbFV+Hxz0PlwUHyrTHvxvzycOMi2tQI6qDB6kaaRQSRb2xmbDi/u1IEbpfFGpTHMT8iwYhzsADPVFEW7TLfs58YTZ1vZ1ZpcwyOM/ARa0B3lJvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYwxpOdN; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYwxpOdN"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50bcf87b2so163840a12.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607428; x=1790212228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=;
        b=dYwxpOdNsllifx6zKm9MJTKYrX8DCV3QiSvcQp2dm9zavIWqYWfkAJtITq5Cd6BW1R
         yqVXjWWgZi4mOdnBnF38XhgY2Awia7PhuLfR/a7C1FYSDOKAoErp1sh7k+HWJ8hgPq+H
         PuPETgVS/4HiBtoWZBtzCKeCya8UuKRXDqFKIiZEBgBJPF6GfjzFzMTLcMLD7MY3wBUO
         jmB2WdezzRTrs8JEdbx80VAw39Sn/8REm18oGZqsVhai12QgMjfxX0LnrhdfERqeqHR3
         HYfmU3VIUqR/2KxaJfLv2fz74BXmcugYto4SQgwVpN62IMdgMdLzNgKN1zKCRJwOBlmC
         0GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607428; x=1790212228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=;
        b=j+OjiOhlsH2hH+ma5Lss8DnWObmRve9OluYNhJkXA6+yimSA9Qo0YDVow2y74nEW5z
         6UJoZd0YS3eHrHOSTpg1RlR6vNBCMyulz+o13C7oFgNg0FBANHNF0P33IAhzCokYTooT
         mgabWIRlazDW2VhrwePhhb/EpaE7Lh9N+PK1kA8Rne/T2uHahpNz1Fck2uh8t28CnfRV
         fvidUDPIW8xhYx1F4Gc0/1Zf99BCx+8CR8AhwfX9sUiGtxQcFMuFRwLa5UoEJvB1tG5b
         v/a9Gb6VvpqYdyZ4laebRYSzXTFKWZDVTkhd62AL4Av1nhDBZWGc1YVeiMMQzg/prJ7i
         B5GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiXp4Lg+lOYuIrbjAn222BKiz/IcSn3TbRYYl+lcXIIeEF6cCYXa6/2q/Ui00uOuG1/FCDDPcZBRtX@vger.kernel.org
X-Gm-Message-State: AFuF++nmODgMjrhKRgX4AuDM0g2SEnj4Fp2g5ZBF/sUmBa6bzCYe08zb
	SCFJh4xll83Zrh8qdma9HtNlziaEXXlgCeINHNtTITUpSHRMvoNmXtCz
X-Gm-Gg: AYBFou2uTzxhXm8nD3GYPandEP0+esk4owTmox+d/o2B0JUYZN/AhbbrUJcyhx0r/rw
	u8VE4F/TUvQoB+4MlgQsoBH+WNB8bsZ/18QprOk6ZO30V7qTMib/xrV5JAidSuYeBI+prJaa6ZH
	AadpbXQwefsBqYbXG2jj1g4xYWiNjCXkQfRTnREpUCUl3bkARuiXShH7mmRrU0hH4zC7rI/nzB9
	29Ehf6wjhMq6rdBTlNBNZ/avOlQXQzkQ4+zq8U5qn0xM3Pm6D8c1ABe5BmTen2MDiVbbtJQbEWt
	NZIZigZjQAOfQH0JEwOgqeujC36vf8pGe3672+G7QHOFG1JFtUrzf6Cs+CcSWMau3g5FerZdepH
	fEsvWT5rvAQj5UrfV8io/L41AjSHTogZySgaV26cb/FszvPgQzWBWLAf26ITXMAja9G6m+PZWcF
	HjStiGtNAWZvvVGKAB9dnEIxTZzjEaMna+G+0LsEVfqhbljHMPe4Ga+nLK8JenBM5mmSAq72Olp
	TKZFnSNMmvp
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr14917254a91.20.1789607428438;
        Wed, 16 Sep 2026 18:10:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3909d02asm353486a91.0.2026.09.16.18.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:10:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 18:10:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/8] watchdog: mediatek: Add support for mt8167
 toprgu/watchdog
Message-ID: <befea2ce-e4a5-4bc0-ba01-d18c4a236667@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-5-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-5-l.scorcia@gmail.com>

On Tue, Sep 08, 2026 at 07:38:31PM +0200, Luca Leonardo Scorcia wrote:
> Add support for the Top Reset Generation Unit/Watchdog Timer found on
> mt8167.
> 
> Since according to its data sheet mt8167 toprgu reset bits are not
> contiguous, add support for a reset table to the driver. This lets us
> define reset identifiers as contiguous indexes in the binding headers.
> 
> Also address a preexisting Sashiko finding that noticed that the
> has_swsysrst_en configuration was set after the reset controller
> registration.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied.

Thanks,
Guenter
