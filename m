Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639040BCAD
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485166; cv=none; b=LCGS5Fdw6qodf0DqwJ2atrf+EK/kTA3CMSz6mtNZXf6P0AEHShdWtr5h/fyI4lqvaEwRm+T+sn3kPauIjaoHMo2u3O9lrO+yHpCk/hTcEjxerZmbF2LeJOZ5j5OhFW45DNhJMvD3YoCwI/1TGSrZzpcAIzj/IoqJ9U3TLQtyY8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485166; c=relaxed/simple;
	bh=bQ0TijYSAVBtq+JEo+PXlhDy3yD33LnPANGg9BrGa0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKxlOmAeuRHcjWfC5Tb8z4i2xRWkyAYZJXF/2ZuaKkQ0BHK1Cr66PzWkDO/f26dzPJQcPGqpFSZm8AYwnlTPSCEgYmYgZ6athsZw/YxSDirnpSxPv+0A10GZOhHJveBtuspmm8ZoaZagXzxPTzWvALEMobQI9ZL1etPxQLrucjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqGYocKo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqGYocKo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495502852d1so316825e9.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786485162; x=1787089962; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4po5zk0dS52Bck5CruHj3lVNTqtL7/vSqh7qaAgXQo=;
        b=SqGYocKoAS/tsOkOsXSPLCsLZnTzERaKyoW/EWeftkMKagx1XrROc1NFGazgB/EIjN
         +FeQ2zO6cocyFJ69uBWgDT6owuG6TbUib/pGUIHSxhqOIY+5EmNm9o3XVUzDtIdwEf+i
         IZS+wcunQwJYj8F9n6CcoSbAJLkiOWYoe3R4SMtZcWEc2y6d1wMGnBOBfoSrbVAdKOtR
         qjgoZdXPnewz0YzbCMTdr8JRxlteQ+HxUu1BIIGm2bNAcmg6Wis/M7nZmfrC6VcIHoCX
         gB90ya3GxKm+638mTKc+1x3H/pZeIA06E4uUQ6r88Mlnn7/19At6+ljpNcGF0xMUpNsb
         E25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786485162; x=1787089962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u4po5zk0dS52Bck5CruHj3lVNTqtL7/vSqh7qaAgXQo=;
        b=cpgNsd9oIMTQU42UHCn7sb/X8LPCC+q3XMYXJTsCMPVGz0aYu6nINf6WeAcBWm9bfV
         8PIfDY77X9iKSwBtoCUAg6hBxMZjrOUiGizuYmQU3DTn25s5vN9QlrkKY6c9T9fWjiPP
         bJoIKBlm3CsXQ3M0RIkfPOBAuTvkPMqSVSlt3Ruc4iX2HUZ9h2NqYz8LqGa9Njg1eKFx
         X+v+kRCbiWKKzIGN1zfTGHux7yiuJZRXCTTRx06EPJcpPTVRQwWyCLps1H0vJRYhL265
         8IaBzH9cFixWrRBt82CThbra5hDf15Mh+3SukZCsM8pIjcHQ6txz/x90sOO+L8p2EUjf
         VGhQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4hq305dDlHcXQe9dntUG6FMdteSyqjDZ5mV8RJm+vFjrdyVhQuqZ3k4tD8EpPc7jmd8TUnMkqQwSe@vger.kernel.org
X-Gm-Message-State: AOJu0YyEtB0GWEZUg3KVq/MJxRj3NwI0sxT/jdIl1U2KQ/7821uYZDgj
	3Wh1EtgiHh0FKj88sxjXRpTtViodOLvSAI7AXe1vFT/kDuLyFm018gXq
X-Gm-Gg: AR+sD13/EzAK8pu+UxPaaCI0y9SC0vcQmOhDdPPyX4FnqNwO9W8l8f/H5eYDixls177
	6vjerz4hBNtfEyJbY3vKdso62skFniDIEKgfz0kt2QWL2nwLKlRWB/4+PKo0HrtTlRlw/NyhfK2
	75tRERL85VXEdzHVEt74r0B92LQNHOrwroeX8YaLzqeAVQ1GkA4irn2toP7rFybdXbaExNiRMWp
	MmcoZUg6Krt14fpfehG8aQWHpIdR3o7w3l6SVb8TtA2p1nIQdrU7aKD/tAqU3mW8LsTGLnsF//Z
	r/5Sin8sTW3BmYJHwPq1Oavm3BKZComM0yQT/vp1quLhAsohHfAINUYEh6grlDfSvTcVMOrYxor
	KDrUo6+qL/X9u6Podv8ELYSlmebT8h2LfTuK3/ok2z46jLjkxpool+sYHM+j3CwrUMb9Q3/KWDd
	wzYoz1+9Qh8cAi6JQez03GW5mhPD7g37KvtudXBNIGFMrIvxxH
X-Received: by 2002:a05:600c:c8d:b0:495:7561:a9cc with SMTP id 5b1f17b1804b1-4997c16802amr1408805e9.4.1786485162596;
        Tue, 11 Aug 2026 14:52:42 -0700 (PDT)
Received: from skbuf ([86.127.220.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf94c1sm19437485e9.14.2026.08.11.14.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:52:41 -0700 (PDT)
Date: Wed, 12 Aug 2026 00:52:39 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>, netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Semih Baskan <strst.gs@gmail.com>
Subject: Re: [PATCH V2 net 1/2] b53: deal with Northstar devices using CPU
 port 5 or 7
Message-ID: <20260811215239.jogh366edojjo3mi@skbuf>
References: <20260811193658.14304-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811193658.14304-1-zajec5@gmail.com>

On Tue, Aug 11, 2026 at 09:36:57PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Northstar devices have 3 CPU ports. Ports 5 and 7 may be used but have
> their limitations. Warn user when CPU port 8 isn't used and add EAP
> setup workaround to avoid non-functional standalone ports.
> 
> Fixes: 4227ea91e265 ("net: dsa: b53: prevent standalone from trying to forward to other ports")
> Cc: Semih Baskan <strst.gs@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Tested-by: Semih Baskan <strst.gs@gmail.com>
> ---
> V2: Print warning on switch setup instead of on actual EAP mode change
> 
> I added PATCH 2/2 as requested but I'm not sure what DT maintainers will
> say about it. I'd suggest to take this fix if there are not more
> objections on net changes so regression can be fixed. I believe we can
> take more time to improve Linux dealing with switch to be more optimal.

It's a good thing you added it, it created a better perspective into
what problem you are trying to fix.

Please look into implementing a solution based on commit b79d7c14f480
("net: dsa: introduce preferred_default_local_cpu_port and use on
MT7530").

pw-bot: cr
