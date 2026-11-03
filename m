Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718006;
	b=Mv3Dw3dnjSiX0i84/RW7RFB61xbQbFnNlwd+qSL1eDdBXG1HujJ24hySnl9OWhQfr7L0
	 0pyI9+mWTOGGXFl6kukQlxLAh0OTWHNpIS0Q9ZRHN5dxB5vOhy5G0mzZ4qWNWwIpPzCMY
	 km/y//EXtFOj1Dw8N9RCGJoHZ6DSzzFNyVLTVeb2zWjI/oyuqeDNK4+O+cFXv1hDGItDn
	 iMQVcwXC3vIjQQvKL2RGaOzNwi82jeITmhnhuwe9GlzVoMhmdKV1ShIbHuus5oVVl96XZ
	 CtBdsopDJ5sRpIeBSrLi+TwoCuLVoOCWcu4I6l92wNYjhOfYI4/KnbW9x9A85AaavXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718006;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
	b=HGLzlqmrFfIhihp7Pz+wjzMXXD+xO6rzHlln94mm8oN1hswFkZtJcePjBQlTewbYBzDC
	 w+I5bCOLnatsfC/tu9Hg2EUC9BjV0Xj4S3CExlVnm0qQjoeKmlD8C4Q/uT0WwVzD8grBE
	 4Yy7z8yhxgbWhFZ6PzlTPwSqWIji6eQ46BZDK2T0jbKodLVJZ4mkmCkc1yPwV7L1jnNOi
	 PxTiVP97qocQOEApccuMIEo3ltdM/auth1xGCYDPqqRlk5a6Ekc5/0PvAbUmyklG51m1K
	 mhcMAPOeUsAfVkn6bWRUoMgImayFSMra714FeNRCn+nBLG6yPm6DQWJoOPHzJFeX0oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="d/aEna/I";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L8ikNYu2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19990606D2C7
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19990606D2C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d/aEna/I;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L8ikNYu2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793718000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
	b=d/aEna/IqhxuAdRkL56DUGLT33MVPskmrVBKBPcZHPcKk43bZeB7SeuomSGeqEqmDGLief
	OKAECoTFmR1qi6iz1XThuvxJftxsUcO7BBw+QRkwxnzKe1CQOInw43o9thPuLjhfoT7Yl9
	ylBFNG+l+979ZIOzzgBnaFlWd+RRo2k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-AisS1V-SMvyxkkKcUALjQQ-1; Tue, 03 Nov 2026 09:59:58 -0500
X-MC-Unique: AisS1V-SMvyxkkKcUALjQQ-1
X-Mimecast-MFC-AGG-ID: AisS1V-SMvyxkkKcUALjQQ_1793717997
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso24402225e9.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 06:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793717997; x=1794322797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
        b=L8ikNYu2nJANA/1K/oRwp8m7sU05o/fPbEHkZIDt/M3Ypjb6ri/5xVc/PKz5qbB608
         aX0x8gpkgf5JSKjPrkuFRK3S+VKQWLcFMJnHECryKpM+KPRyYXF+xQHy9Hl6x2DoABkZ
         YZ0vgcHSypaNF/7sH8oY0onzz83jov/eVP7bCR+hpntJwAhpuFfPih0e99Ywn7rLG0Pg
         3dFK/jApuEk52U0M9vrYgDJlDzBL5IJ0BgSy49Y2D2THjeOvuoxH8IDBWT46kqg63ue3
         7Ng6jiJ8hAqnXpeOpzdVqHeY8vnIZpEsEOQ4hBV4vtnrQKxx4Tw2cWclN0sAzRBGnhPq
         1QDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717997; x=1794322797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7N01ts74+fbd6A0+ugAJGY01iwryjK/kLUoNysOMm1c=;
        b=BSlSPxe+vqrgZHm4LdmprX+lA9+q08MbxqefO+BPdjvhXfr859P5ZkDrlu59h6hW7q
         o01TzUrOXkvHUcx1aYXtVy9imopzr7zr/tk4mTLRCdqjsbY6lQKlShJpqHkdfh3vOg7o
         Dj8qF8XbnWnrHZvgHavuOaF5MDq4N11mtg6FttLFGv/hVICeS+ADwXRUUh+rR26o+PMo
         yk1ikon5/kAfCWcAnHW4Wk8TXuUlw8vWnBCUDeaqQ7PPjvpw3Q0VLJ0HwIgg71CAWc5R
         3IpmLyPv9Zbo0p/dXopmQFvtHfhh/18IC9tLMq802FWEOTRtTHo6lFXTBDmin93afXRR
         Xu2g==
X-Forwarded-Encrypted: i=1; AKwUvBwnDY6rWddbpbiFiXpqYMFaRQobdczTd3tDK97jeIKQfObI72xz/kmcif56bU9SmeVhxLRJXlszQvum@vger.kernel.org
X-Gm-Message-State: APuU4Z8Io7xrwApVdfdZZRRD5vlPMRtb8+1wmMQIy2DTJiH8kml4woh8
	pPeWMRssnrisPgJ0GPBbeyr6x5d3+ohkxceGtZtAgrbiP8CpZ/xiJyY4plCQAv/n5phbSUlizsy
	6F0Od+YOlGNEZ6vuQPuK/IEt4cOe1EsrIPP6FvKmVM8nK6+vHJLT1WNMG4rkod+A=
X-Gm-Gg: AYBFou08BeBfovN969PonRgyYbvyQN4Ghaj0YfBZ53Izp37Gh3CnfvoOeen1GFNio3g
	IzAm3bb2Fq5Mz4u7iXLCYrp1MGT9ZnYNP4MhzA86nTuM/9tBt9RsZ8kpXebIPyVEuGVX845VQ+W
	O3d9nlZpAmUs2VHNEev5xqZlXKJN2ZYNaXsxZgXMozZ4bHqBC7jPxkrB444bZxwEmKchN418CFb
	SDnlJ+QCl6IZmo0mWiXr/4oedqDf/W637+ymIbzj7J7rhKcVtYrC0m/6sgpsz9c3F9DSa5aD573
	uAFDHX9zI/6P7gZhDLtAdEDTTJ6+Wi2EhKkkJS0RE7dEZgAfQOxmmT6vWx5jQtPGaI9NEncJ2BI
	rnJBdTVM0S5C3fOlHsZsDO9ww2KMpx9H+bgIHVdZhZuArDP/PXIRR5BFZH6HBa46DW6VA7KLHcM
	0n+kUmm0gi3hId/EQLsG2DBNkTuweUmQ+HOkV8n0En8Xg=
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr307788855e9.20.1793717997477;
        Tue, 03 Nov 2026 06:59:57 -0800 (PST)
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr307787935e9.20.1793717996940;
        Tue, 03 Nov 2026 06:59:56 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm464079285e9.1.2026.11.03.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:59:56 -0800 (PST)
Message-ID: <ff77c7ef-4c3b-4113-966d-3c46d5776cdf@redhat.com>
Date: Tue, 3 Nov 2026 15:59:54 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] net: dsa: mt7530: support EcoNet EN751221
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, linux@armlinux.org.uk, arinc.unal@arinc9.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 naseefkm@gmail.com, b.larsson@gmx.com
References: <20261029184202.1859843-1-cjd@cjdns.fr>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261029184202.1859843-1-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 19:41, Caleb James DeLisle wrote:
> The EcoNet EN751221 has a unique switch configuration. Every chip made
> with an EN751221 die has at least one on-die MT7530 that is MMIO based.
> This switch has 3x 10/100 ports and 1x gigabit port.
> 
> Some popular chip packages such as the EN7513G and EN7526G have another
> MT7530 implemented as a multi-chip-module that connects to port 5 of
> the on-die switch and is controlled via the MDIO controller integrated
> in the on-die MT7530.
> 
> In this configurations, the upstream switch is put into a "passthrough"
> mode in which all traffic is forwarded between port 5 and port 6
> without altering its DSA tags.
> 
> Furthermore, since the DSA core does not call mt753x_setup until all
> switches are present, and the downstream switch only becomes available
> when the upstream switch has configured its MDIO controller, the MDIO
> controller setup on MMIO implementations must be done before
> mt753x_setup, or else it will never complete.
> 
> Finally, the on-die switch and the MCM switch connect via a TRGMII link
> which requires calibration. In order to calibrate this, PLL adjustment
> must be possible on the on-die switch, necessitating changes to the
> core_(set|clear|write|rmw) functions to support MMIO implementations.
> 
> Solve all of these issues, add the TRGMII calibration, and add support
> for both switches.
> 
> Since this patchset will probably be subject to some discussion, please
> consider accepting any patches that are non-controversial since it will
> make future re-submissions easier.
Does not apply cleanly, please resubmit. While at it, please add the 'net-next'
subj prefix.

/P

