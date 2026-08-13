Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111242046B
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648100; cv=none; b=Da75VA3tE1advtxbgbhoqiVGFlsEs2ljcLVWfsGphtA85rm26g7Fo56ixF5j8+CmGd+/iV026Uzt/49aQcF6BYkr5ZofS/IILUOeGuDK2MEMTnRtMDeJ4eHsk9XVMwHYVPp3nTcbLTSEpt67FagxWb9VZj1YJHPUqO4cCKQGXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648100; c=relaxed/simple;
	bh=HZj+weV/1/7EoxP5W0AYiX97vOirYnjuweQQFbFN+8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUgwIIg1WBGjG1BFkkOU/kj7F/4QVydP6ZwZ89+uPFdPfu6TcmeG1yavMk7YYoarVxVau6L01IrRhwxSCFsVqxgIuLhf9AisDTsWVO1Xr7FlscDF0yP/ayCEKPvrqg87rL7lFB+eiM8KMQygOlGVIPmeKL836MAjnkUrJL2/fEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuMW+aWr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuMW+aWr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f611b3af9so10652f8f.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648097; x=1787252897; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kw7FoD+bzLFhraFxvPfr1StE5DODuuLr8Azjhw6HlYE=;
        b=YuMW+aWr8/2nl3/bvP/lixAjM9aiaTU4/ju/zvu5Z71Kyg8kfaOYkIZf6y/cP3OyvH
         cy7no6kzVcWZ/DSIEZmcwwysOrHdh2yfuKwYBb5V8tNgfzgQpy7+hqVJSrrawRUlRuky
         gUNG8atuukMLxFdowCudWmiM/x/HpkbZnYw1tJD8gYw5J46eWJp4aidlUJaXgK1lvV6S
         BP/xUrL1Zu8p2PkkDqjVrnaA2oz3Kf+fP/Ye+DHpbnjjK6aLoAACww3qEftS2E7zaiCI
         yQqc2Al3mZKvGBXxGo/em0VPL4K0ULaeJD7AJhgu1QiKk4hELN663jojPA1VrxsZCBpk
         C34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648097; x=1787252897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kw7FoD+bzLFhraFxvPfr1StE5DODuuLr8Azjhw6HlYE=;
        b=WXSoiXCiQK7PIw0IuzI2HLbEIhf/TKfxxKMqcm7UjLoGeObNBaaQyUF63n8IuY0Q/c
         0oqAZXCinCnu783JQjolALuvbVBtFpTKCtuchxPd5BbD2GciXlLM/16JaIcsJDE9xSGw
         qVTetxUkRkRRqsErYWM2AnPwg1617tsOVcHphrFRFQlvg+wtdRsDPIYxlMxnr8E9b/2L
         gtT26WC+ehnP9tbJx/f1uaxB2Recsq4Sp/lOW/Re+87K6Eid+R+JykMdFlYqSFikF27V
         ncK7FZt//AJyFKrNcnnuom+ZlLl6X0Q8o0oj8BTFTS14HFKXFMNKNCkQigHndG07HO5A
         F5/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqnP3zZp+8ZlNKVZ4I4eTDp/nnOLOEWiK9xzmwt99aQqGuff9NHOT/BvyB1WTxuK26DgempURhxby5t@vger.kernel.org
X-Gm-Message-State: AOJu0YwWjtbztJrnNcNelc6E1iBgdCMTkUWNIs6xefvDvC8HloSfLQsN
	1grHYeLd+zMg/FIq7297wcM988fAyu4hiNaT4dliuiOwL4PhlhAOORVQ
X-Gm-Gg: AR+sD13rAYe/KgGQgMsw4RIiai43bUMj2RghGT9jHlidaKAa9DcN1keJJe1irM15KnQ
	veKpMq6YY/9wB2oRr/pqeEmaHv25ODtR29VgdGJNdkTfQYZLH3DxnJkUejhBirsG7/3Ys7m88JH
	JQWIZGQBfDeu27pAzBDJxjR+KSh804rLSaaEqu2fqAYnmvEPpI8HWzU/YVcVl1ePgkW2E0mjtUI
	DhpNujjPVHcLHx2Ft7fn19EfST4zebTnzv+V2b4RapSjpn3JKDEAPBRVJFy6PohZw5JcDaVxD3t
	WGXdOFt5KPwb7IiKMwdk4FNqtYWIjxLQJLaGBQkueSaqRveRNb2h9VryWg2W2gU1omtST4+r31g
	5OE4U39RjWAvHl+af14X2nZ931YCRFO73ksGZI2QTrTDNUW/TrjLF5cYIGET92l45Ja4ue46CxD
	S9ZO8SLBi28z2qjFbElio7rHtfYu4OwWLfpf01q3mmeA4oATUG
X-Received: by 2002:a05:6000:1446:b0:47f:959f:d5e with SMTP id ffacd0b85a97d-481606984d0mr345336f8f.0.1786648097563;
        Thu, 13 Aug 2026 12:08:17 -0700 (PDT)
Received: from skbuf ([86.127.220.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2cd7ecsm1427509f8f.36.2026.08.13.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:08:16 -0700 (PDT)
Date: Thu, 13 Aug 2026 22:08:13 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Semih Baskan <strst.gs@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
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
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices
 using CPU port 5 or 7
Message-ID: <20260813190813.63fjmjmciry6ubaf@skbuf>
References: <20260812132755.32585-1-zajec5@gmail.com>
 <CAAsRjRn4Pfv3LzQtVbeBzw49fN3Fk+M4JGwKkKq6pvo5Uk-fpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAsRjRn4Pfv3LzQtVbeBzw49fN3Fk+M4JGwKkKq6pvo5Uk-fpQ@mail.gmail.com>

On Thu, Aug 13, 2026 at 01:53:56PM +0300, Semih Baskan wrote:
> With all three CPU ports enabled, GMNGCFG ends up in dual IMP mode
> (0xc2 read back). In that mode a tagged frame whose VID is missing
> from the VLAN table is delivered to no CPU port at all: an 8021q
> upper on a standalone port receives 0 of 7 tagged probes, whether
> the port 5 conduit is up or down. With port 8 as the only enabled
> CPU port in the DT, where GMNGCFG reads 0b10, the same frames were
> delivered. So the preferred CPU port alone does not revive
> standalone 8021q uppers on DTs that enable all three ports.
> 
> The same effect touches 4/4: the R8000 today has ports 5 and 7
> disabled, the single IMP configuration, and enabling them lands the
> switch in dual IMP mode through the same driver path. If its switch
> behaves like this BCM53011, standalone 8021q uppers on the R8000
> stop receiving with 4/4 applied.

Where is the code that configures this GMNGCFG register?

> On the RT-N18U the boot firmware provisions a MAC only for gmac0,
> so gmac2 comes up with a random MAC and the bridge inherits it,
> changing per boot.

In the previous version, Rafał included a patch so that gmac2 uses the
same MAC address as gmac0. Is this better?
https://lore.kernel.org/netdev/20260811193658.14304-2-zajec5@gmail.com/
