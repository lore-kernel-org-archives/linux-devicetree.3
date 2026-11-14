Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628489;
	b=lWx4RNMKGTCq2zDmMFJ++I6APL/RyOFbif33pyw/HlmNtsae9UsJb29gvXVQBWKlbjds
	 18+kSnrpdExZQ3gRem6FuG1E+WPPm621wND/pTp4yDdHjpsZLNSsviYAIdm6Nun6kxhEi
	 a6TPbQ/lhuKYclLwSMtlSyPeUmWT+igXjHqfd4MOhpkUrn+TwbqdcIJozCvwl6M32qj46
	 cTNQuzfJA1lCHx6CenLMSDqI237f1WT81+1ip4/NTdzbTVHOPUCZQW3dU1aruQEkpCkyl
	 bPWLyNrvuZRq6DafR3yeRG8ap8/1Y1te7uzPS6NvFLJVtsTwrT8mIvbVZf0Crrzx2+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628489;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=CneFnAjFutRrGEcU3jb+M5OY+ibrOp6RyZtxs6jTIGg=;
	b=HmAJHxnlu/un/43r+oyDcJMoCYSDtyghc+gKm9gARGysGJtH5KxlyRrw9gtmoOgCEooq
	 szb6PNmVC6fNqJayfGRsauZ0lqA118mmBBCkNQLJWovu6RBxQ3b7D7ju1noBb7vKAJtUa
	 6ij0pFk4GCvJBmwgeASRomLBc7WqTQE0U6L5HO9uPYDf9deMn2NIbFUnAlIo0fYLhmsZt
	 K0wmNrZv9C3HmwVM7nSZEIqrGMMaohc+39mQqnuXSdskTdBqgf+Zhpg2cqpuAtM7GwWtd
	 l9ucQFPrNQrBO86TvG7yaYprHzUKiBluoCwb8kDznfGuh81jyAa4C4CWBCC/Ce7qryg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=drvc8h42;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A57606A338
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A57606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=drvc8h42
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1341308a12.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628489; x=1795233289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CneFnAjFutRrGEcU3jb+M5OY+ibrOp6RyZtxs6jTIGg=;
        b=BG+cn3iITFcqUkab1IrsUz3q9ni+fhzaYhYcAoa4jil/wQbfSCslUkgU6fmD1hvSw+
         FzFXFxAeJTYIwXP3kOiQcTXFyezFn7CtkfJkymVxD/cQs9cevno1gtmoI0Uv5tD8fBlt
         X+HYNGVQEhMBjZTQHqahsrbb+ksjsvj9WpFC5oJ1fAAdZ0KBW5LEiyhF0ROK74UPYleb
         Fto2S0/bU+FG+db5X7EAAXBK/kmM5Yq2X7KvzcZeOH1/WYDITFcy3rW4kbIXyLUIc7JX
         OIxG2pLc939Gk8BkTq5nH0gJ91qsu8Jz3jJ/pMrCTgEoADTETG6DpDf15OWMO58iOEuZ
         1qPw==
X-Forwarded-Encrypted: i=1; AL+hErEzBwZr3C254KuKVoiKgNq4P2hNt0x6a5zHcQu4E5yd80WmSzeJ2EmijduQP+K9NDzHA1a9c/P6fLmm@vger.kernel.org
X-Gm-Message-State: APuU4Z/BM+t5U5Q5F5oxZanbunCMTR5LrwTMXeGmmc29P92XwdgiyHg9
	lj287YLFWs7N0qvZ/Q0hyyQGMhCDBnPeF5Lo++aE8Vvw+Cr6EK29iUcNks4mppJJ/dOE5El9am7
	JZQc8bB/zW0zcg92eUHo9ssAvbpF84cefrAzTX1CrybHPKVNeVYdR/cm5teBJKlE32tOknD6kUG
	Y1aV2nEEr03/A6O3lwbIkkeALtjdvn609IvXuiIZAQbtahwcAfEgY/CIn7t3WA1T+4wzjW6E6ZW
	vltcdVU7agutMXQPKJspg==
X-Gm-Gg: AYBFou3U3AaHilIFf8uahxwO42RvN12U4KzUph23R57/1AjJHQqhYQySk/z0kOZsXbL
	xBXC6acR9mgV7C1vRSOXc0eSirsBNIt5tTgSICyfbLleBbQM6e2//iobZgmNNO8YpDhafZxesDY
	8xjmdujDGoZA4OdBrqYVucekWWWWU6nBv2Et/lCtYbTEFC3bm7Ilt/XG5KvwtomnjrhkIACedQN
	5RrxseJUVYxtwyuRiq6tYwtcFstHNAB8bTEaDjVYLn1375gmX2FbIAaiJDLJPvMWWh68p2B+3Y2
	b9zpcPCGLYc3K4TvtyMegBsddqo+MKCudd5zpJetCBqpi1z4QQwAvY+aUG135NvQmjgy88me8wO
	xGfu6Vk7sITWR1wgzMlPkI21LllFAhCvQeTExXG6sVJ+rUbsQqMuX5Q4u7pn46isFhlsLT2nUxX
	o+Tplld1YwLxjJ62xxWodWqhC6Q8dDcm80RMkHQhjO
X-Received: by 2002:a17:90b:57cc:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b1b0cfd53dmr2658847a91.33.1794628488805;
        Fri, 13 Nov 2026 19:54:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdc76asm9171415a91.7.2026.11.13.19.54.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:54:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so1226928eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628486; x=1795233286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CneFnAjFutRrGEcU3jb+M5OY+ibrOp6RyZtxs6jTIGg=;
        b=drvc8h42yhln/YjZe7shg79q5++pGd63cnYsqkfosID+NFED/w4+2Ib4pK3Dm0qtxE
         +/7KCpYXb07Xuirl/UG4oG3BAxtTHlSit0XukoC/24QS7p3GIaDEbmvrjo6q856LTlLh
         Lv08jV43l6yp4LO+GFXaQAx0KF9JmFyLsciVs=
X-Forwarded-Encrypted: i=1; AL+hErFFskaQ/LmpDmMEY0vHPxifiH9ASjF9U1WE68QHS/5cehdf0gYsTZoYfFTxtSbyHb/dwHgS+OqYkc10@vger.kernel.org
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr9727045eec.25.1794628485927;
        Fri, 13 Nov 2026 19:54:45 -0800 (PST)
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr9727004eec.25.1794628485231;
        Fri, 13 Nov 2026 19:54:45 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm12842438eec.14.2026.11.13.19.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:54:44 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: alamo: use qca8337 internal PHYs
Date: Fri, 13 Nov 2026 19:54:43 -0800
Message-ID: <20261114035443.879552-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923183912.13389-1-rosenp@gmail.com>
References: <20260923183912.13389-1-rosenp@gmail.com>
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

On Wed, 23 Sep 2026 11:39:12 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The QCA8337 switch has a managed internal MDIO bus for its built-in
> PHYs.  Move the PHY nodes from the external mdio@0 bus into a
> subnode of the switch, and mark the connected switch ports with
> phy-mode = "internal", so the ports are linked to the correct PHYs.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
