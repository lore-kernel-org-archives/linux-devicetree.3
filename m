Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627271;
	b=1YKwsBHEXsz38RGQGVojbItJyYIaE+r1aqkoXr5gmNAY9rhEGeYOQiASmCkiCsut3s1W
	 nEt+M/SGDKL2m7pimb7EgejexYrXjsNnViQMe3Gx3BFfp1tM0CU1ftgPR2gWEGdsLaA2Q
	 bimC+RfWXYyCz8LjUUIjc3+yHYX/sY4oMRRvRi9sudvvjWEWPLVtSVKKEQr/HpaCvgVuj
	 4Piy3qFjcQR/NykYoT9WG40KixHIDN+eCLsoiVQrUQCw+J7m6dMqGOU+u50KGuRWU1Uvp
	 XrbePY3LzSPV3zmXq/YR1nn55ITUG93SOToQn+MLwK6cOTa/q9C/Qq+3Tl6Z8hyr5+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627271;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
	b=mL1I/YaO85pSIVt3D9izmkzk5vDx93a9++6T9SWUrlKlzySS3MlMc0v/QGVno2J+CMnm
	 MsTlxOBS2RKb3aCV6nNkU85XRE3mK0JhrqOjWeXxNWRW+ALcb3MxMfR7eJ+0pKBwjyTIA
	 Y3E12JyM/lQwah+5P6b1crN74pseEsfb2mgCD8CflpzTeqB3v19P0MImdg019Cr0xnyD9
	 FMZVyOpRNChWJxqgkAzz+RM6vbcNDxctK8+r90Qd1QRmRTnCkIwF8zsx+jaC/aE1MM9LA
	 WWrhGvOII/JnlmClFO9X1YuPlzkFWw0Bte9F9tUxOaa4djoMGMJKi2lgi81FaxmMiTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FsqjNyMf;
	arc=none smtp.remote-ip=209.85.160.227
Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CDF606A331
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8CDF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FsqjNyMf
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-55c35262674so3533221cf.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627270; x=1795232070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
        b=tsADI3XHrWLYTg/up1UvoB6sfykYncEvmhpzLHUeTOPGhyDViyLzXnl5374sR+fpFX
         gzfI+0kOLcn2cJImnQQmZuAVKZ1fTuBrnSIWwJT4Y8fA5g+pONc5p7wg+YiQX/0ForKR
         OICRt1jZQAD311Q8S9Mhp93ojsDsbvGoso3Zhbdil1Yj1Kn4SkVBvPFRTlrY5//oVTUm
         Z+jL2GBbSRa1Q4JucKpBMn/jGYAbEInMHH2YvprLUaVqJ5yBQTzgQPrywyiDTRwxycZ6
         Xv77dysDxeJjtcvUTVHhGl75O1F5gLrBK8BmCg2HRFXup1S57xN21iXvSswygLgrutte
         UryA==
X-Forwarded-Encrypted: i=1; AL+hErGj5L4rYxH+P/DVv3GGTLsdX62sKy1Tl8kt5b6HDqihU2ujat9y1G32k9AHZ6rfTvcuLIsBqYfZ9zGS@vger.kernel.org
X-Gm-Message-State: APuU4Z/ge/0gcR1LBKr3NKsP2Wn18wuHljLrJEPPCZ4mOQPiF+drg0XI
	phqUIN08q9kKQfaEjnLIWI0YZd7tWDmq2BufU3e1+dNayLx/r58DmTNjE/KnrbRdmqJxTQJyw9k
	KFDmRyFlv50nRJCt8QvhOFKx0hNnODN2JSTkyKYaz9fLBqupXJCfgUbGn3p0vujoPzFri5wush5
	Gf7NKuxYMYDYOfZmWEel9MmW8/S8PYP5k0N7hWDZ0W3M6r7MJyw0y2hKdRPYDvkTiT9gup6OSrK
	xukMQuYC3ULQeOhepHx7g==
X-Gm-Gg: AYBFou3arcWobS/Pfw273VcxjzvubxlETHouAEBYSoceMyU3B8ice7p1WOCa1r8b9kY
	nO6Mv5Je8ty1xLmSBeCRylSnNpj9u3iFp/bh5hCOucG3K1OrvMyyxa0f/iCDqprue9Op3JLXb6f
	2t5IS6xdHOsOQg+mWSyOVpzOQocrF7t3hy1Ifa5xqzAk+eLIZMHlRb6lMCQuV6fu3bCX/KGieWQ
	K1+ZoSmvtGvXD6ftsLKKzBQc51WENB8fJy9X4gI0VEUwdCQ/cT+PbFPx/mQkzRQb/kSGmDh+CaM
	uQu+sP+NzlYmTsV5v6ej2Kciw7w0LAw27g1YDSGp/GqbbbdBTT/qV5jw20IStf50pXO0D18n7BN
	lzKDPD+7epJV4tQWbl72l9powA0P1mzWPDXSiVWMhj7L6pawB/AXLQVYM1qvLUxZPvADyEgxFHi
	atZ7+sQdu3whlVPqHpUZlI7nUE1bc7h/LjLlAGxkgE
X-Received: by 2002:a05:620a:1721:b0:949:698f:8be8 with SMTP id af79cd13be357-949698f9a3amr7815585a.64.1794627269539;
        Fri, 13 Nov 2026 19:34:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9494c7d3456sm85200185a.17.2026.11.13.19.34.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:34:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso7021734eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627268; x=1795232068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
        b=FsqjNyMfYgeS4j2kNrm/zfVVwKD8gp6v3yQOf5DVh7CEU0zFvg6tiYf8uA+setgmAo
         J7xTH3iu1L9zPuzHHGjVEHcV20AoHjk/tS0Kcpmel0PAmHFTmFlVzj2B2J6+1m5LVU9w
         EbEkdeU+675PubUrj3KbEAmaTvpfBvl6GU3S8=
X-Forwarded-Encrypted: i=1; AL+hErE1obpXTVzWVOeUcFRwgL0crXEP2+9wBTptfT+jwte5UyAOoH/VIIcsWZ7Pu1M7MsfFH6QRM2cbNiKW@vger.kernel.org
X-Received: by 2002:a05:7300:269b:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-37acafac54amr1253752eec.33.1794627268047;
        Fri, 13 Nov 2026 19:34:28 -0800 (PST)
X-Received: by 2002:a05:7300:269b:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-37acafac54amr1253710eec.33.1794627267158;
        Fri, 13 Nov 2026 19:34:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm12865283eec.28.2026.11.13.19.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:34:26 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	netdev@vger.kernel.org,
	James Clark <jjc@jclark.com>
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its clock
Date: Fri, 13 Nov 2026 19:34:25 -0800
Message-ID: <20261114033425.876398-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de> <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 20 Oct 2026 16:58:11 +0200, Nicolai Buchwitz <nb@tipi-net.de> wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
