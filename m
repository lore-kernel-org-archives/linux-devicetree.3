Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678552;
	b=Xz3vHj3jFCn+sT9d0q8zHQptV5JydmF9mkouaBFZ/6C5l0aCuBriS1zoH0wmcF3x3GFy
	 ZnDe9nteN+SYmoaWab1q2PNYvv53pamNvSGWuSr3DKGGbWWpH0/xMTBoQuvWW0QefrILS
	 wX5EA8D8xvsX7vIQdeRTPZhGVjpVLfDupqAM/gHta/M918VQEXRaLkp1hXQScQi+q9GqL
	 IHlXrXqptJ6c4FGuAagr+roAh6kgh5dl9dAcdSRvdo2Q1NWR7KMcdppZSqg4yAly0xDL3
	 jpO0z+bbQ69Zx6hMN2tWTa3BSq/W03Je2+bR3ms+82YNuxzBLPv3uispBnMrZiiD41w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
	b=CWLXUif7vVBkeinDh5yJpIY/Vw0CK8LM6q66BClgdR07AQUV5vsyJO/ObZXrX1+DeLff
	 N3PziNHs85Wyvl80tQaNtT00bTWDu6PJYbP1Ot9+UYNPPuNeW4OAMYPxVZD+61fRhIIM6
	 rBbhgRL3lpzqmU8I+tlIW7+1Ja+qi5B7/CoRYohVW8yzMlwKZt5LBks/KiP2tNLZHb5zE
	 PMHxuxT4bhtyGljAKTLfphCO69CO+0jRVN4A+DVs4oXNIPYVO/hYo3rT+4VOeYQmO/qZq
	 yCAw6lB/R1i9gCt/PvD5wV308wNbC3xEb7aAPbtrMHSQHU6D7e4BzY1Ilhpe7ErXqfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+KeYW5z;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C4E606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+KeYW5z
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso16602715e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678550; x=1793283350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
        b=J+KeYW5zKbAaR2ohXAf+0Uj0fjYUeB8W33bmWTi/ZMTBJPpuodDtKue6spwAGY4QY6
         3Nr+SYdmRDiB1bzgGMkre61w+w2gKROkWgxKCmW7sL7j1IqOx3IMtBla9F4YToY1DPcd
         wsnyErhtyEiOkEmkJ3i0boFeYHoSj8wpK2/FpOclE4sO2y7KBTGunZexmKdf+zlmBCPf
         JeCC8OmqKLyw294nxq456xv0GH6ceiOwKd/6o9UP/3tZ/EYvj2jUNaCqExXT4dFhXLLO
         7qqVWQv2GC9Ptl7OoRBMO2CUoujqfTLPOua4+Ge07c6MMnbdKElWI1MW0LU6hgRo7ErO
         l1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678550; x=1793283350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
        b=2vG1vOMfg4oRZvP3XPCvlTP3+nT1n1f58NLp23lu1Kh3lgJ5fnLKHoYHXNV7N3nWAQ
         I2PY3s3nJDzdHuE3/WcnvD+uUiovOqozfAvJehgBEmItmxbQFWiEkyMYt1Lm/icHS1tK
         KW6L5h+xKSB+fHPCrwooCZTlVv4lLBYNqTpeIOQVOZM+wTCXdqz66kJmLoMBCcdp9gwt
         78JFuJs6mYMyVCdUm6QcHt19e5xjWslswnrMy/rzvubyjmv4m53JqapvFpn6zxx1eplP
         0fYjXTh/r7G82iKIeFKXa9FEyurajVzPhY1lpXNjrSS9g3MA+9Udtg3aMfOt84VkhSVI
         6vcA==
X-Forwarded-Encrypted: i=1; AKwUvBz9Co5QitluO9s8W5pMT3u5ArWa1PhokWvVdgBj+NKlab+RvIrhJr5knaYmU/8Rq5ssKs9YyY///FwG@vger.kernel.org
X-Gm-Message-State: AFq9FYJTRsyZJof5LRJZ7Y/jkF1mFezBPOuUO/WtaEdl0i6cJ37n9mvB
	CCSon8UGCwPmQvnEuV6Ilj++jJ8rqv5ARe9cSINez6AZFVFN52jdSCUp
X-Gm-Gg: AYBFou2N1cC2erjN6Vv3LXVJu4CdW6MvXXsMKEANKwaIZDWCAnu7ikfOzJOybzlUhmA
	waBB7OFGEIyrVcwlc1laN4cu7rP44GY3dFOumocyvRYVt313fMadAJM37G8GkMf75Mf9KXeJubI
	tnaUNssWXHSYB05O1YbS+PNGwb2sAZuMqQjFx0xQOOYi6cyj4k8yPPmFeepXY4OrKlXLzvywDxv
	RXjsZLkJHWdP7Qm68NYvzWfF0+0UwYTYbnlwyXq5Hu2nCMCAs3ah4WFImQqT4tMX+fgT3o9mFqv
	uLPmr3CiCcOUsDP7iIcFqGrLlRik5P/zdBasAptOntdw4p0tLO2JsIlV44G0gOmxa5zzsVTGr7o
	WHOUg806nOn3058Yw0tDK9YCqFoOK7kSwReLCD5HHcpl73DpoNpjcAvXJyubMjoD6j8W7B5DhF7
	D0DyXc7TWEr2jTn37lyxobUSRDmrBhau02rMZ5cybHehZnhwXGhD7M2z3dAxSJqBaitquPfGVFE
	NYrn9UxK/q+PVLgAhki7Vh+MkvXrKXfv+bwlI5vl2cD1E7YwQEW/vj8P+Do8jE3ZjzGMCjt+gZv
	wbS09ay76DNt8fgG/czi3mF7tDd6lhA0bV4Nk3472Z66DrVxzJA+FDg=
X-Received: by 2002:a05:600c:34ca:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a1fdd39e68mr111050565e9.28.1792678550121;
        Thu, 22 Oct 2026 07:15:50 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203add62dsm82627145e9.2.2026.10.22.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:15:49 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:15:48 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <ew6jybymalb3d3q7hen4qubefipnofcfzsrzyjdajuagw5fnov@b2oe5mjyz63w>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
 <arLJl3jyyytfS_Qw@SMW015318>
 <20260923084111.GA460930@francesco-nb>
 <arPrD4TDYhjYxFGJ@SMW015318>
 <20260924101308.GA45659@francesco-nb>
 <arU0sLhGG__lh98n@SMW015318>
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
In-Reply-To: <arU0sLhGG__lh98n@SMW015318>

On Thu, Sep 24, 2026 at 09:33:20AM -0500, Frank Li wrote:
> [...]
> imx-uart<n>-mcu.dtso. similar case imx9-mqs.dtso.  Uart<n> is cross while
> imx famililer.
> 
> Frank
> 

Hi Frank,

v2 follows this. The UART overlays are now a single shared overlay,
imx-tdx-uart-mcu.dtso. Each module device tree labels the UART it
assigns to the Cortex-M core uart_mcu, so the same overlay also covers
the Verdin iMX8M Mini and Plus, where it is UART4 instead of LPUART2:
https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com

The Verdin iMX95 NAU8822 BTL patch (1/4) moved to the shared NAU8822 BTL
overlay series:
https://lore.kernel.org/r/20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com

Best regards,
Ernest
