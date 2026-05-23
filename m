Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6601FE471
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 00:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779496887; cv=none; b=dZMV1QQ/tmnWHh5zJI5XIPWDV3/8RRHn6Tw9TVcIrwPHjU6flS0i/val+sZ1rHZc6I/STD3YsOPNozIKXaDqJIXmeU1HdOwTp6IApqVqSxzaJSkBvCNUn9zxckb24GVtyw1ynrmTHILQiyLJKkmg3/gI6fc7AD/0CUL/GWrTAmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779496887; c=relaxed/simple;
	bh=7B9Me30lI4Ge0+kGlZBt+RspI0sONljRo+4xoaGXXxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnJKRA/crW6BmNaEjELdaXjs3vUoUQxSN/tB41Mu/CM51gw9/gsHmClSrjMzZB3nbzg6u0R6tPBF8KqCiiEo0X5mOXb9jM46cfoFHJknC5owZ6dBg1IwWrW4S2ihLLT1ojpEL2yEPJ24HoklKR2hZq72/Ix2kaOvX4tfNbR1Eh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT4yurX8; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT4yurX8"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-479d593a0c3so6683916b6e.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779496881; x=1780101681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B9Me30lI4Ge0+kGlZBt+RspI0sONljRo+4xoaGXXxg=;
        b=JT4yurX8q9r1WsdwH76BICVevVn1cKH/4D/8D/dlbAmKrgXfReg1uel6BUP4pP7kCG
         nUGNtxFTRyZFB1WeAj1ztVjMxNS8uOL20WiJeQXrCl+eJm6c4EVt/dPXsm2OX3oc6V6D
         N7omb+F+ZHGiELZMPdxAAeu3NZpKy9T1zVJMYvN+A7ei6KGRNsX26G2sSSm9PrmWli+0
         614mUg4tM8Ud3NppmQHv8mQk0S6VeoK+n9nFkY8eLZSq00dTDXo5j3F4gyuSuzK5Zrlp
         EyWtL73X6EggMzoMbhyw2U/ETT/tZo8gimX4ZDUJtK6GSsLXp34Zkue6kq+R65GKfeMT
         sg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779496881; x=1780101681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7B9Me30lI4Ge0+kGlZBt+RspI0sONljRo+4xoaGXXxg=;
        b=E/aVWcRxoXWqJFkKgos1ZH9Asj5Jxn+3AAaPXSOZe4fBDDxlQ9vuxgMuTLvpAOT3Xc
         Tz1qYi7cYPI4VIxlKPrfOQtHwt/JPGy1UgDlOlHEJvgtE/jQ6zoZP3y2lZ5MElWjX6Kq
         qtNuszUEkqmnka53djPC9SjKYnKIhELU+al8qJgVzgNcbFxs6mDgX0eXZ5IAlcm6Byx+
         oFcCqjvf7r2E10M/+P8YXtpuQUoxP8oXfNpKCNKQeTG1uNfLaTXDdeQ/8/s2EY1QM80v
         ilVGUKI2WExVMg3tJlqAnXJm3QmN16FK091Abet96yUAoRzPWrgtk9OFqLXAAOT6KwYm
         Z69A==
X-Forwarded-Encrypted: i=1; AFNElJ/AmfKYxSddJm0EcxjV+Hlbqf1YfyylwaVD1RRrmG23GDexDTF0HhdT/F+9EQ8AGGphI/pYuWLsfx1Q@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuw+w2yRrWmetKfCIYRei+FcnFMCOOsljQnCNvEJwX7xJAqD2J
	22lXjVD1mgHhXfYV6sLkAhntrATXyCayoARY8D6c24sIf9dmMs66L0PW
X-Gm-Gg: Acq92OGy2e/v4HnNYkvB1/cTUFvOKosUN56pzWluQtqBhJtZouJ2PawlMKkU2GAt7rw
	RI1i3yqHsJKQjn8F+CtznYeS4VoaaJaM4oNxgHee1zu4MtbJOOCLMcDuOr4pxpPxR+7UXasoN9Q
	omsNWTj/DyJALImSRP/4Om6VXaOBvSWb+gRfd7iCBURnF5fSZ0//DOyLAG91iFNMgeJb79U5FSY
	W4s/mqcjqChtQBKlZ9e1DpbGyvXcaJtJhVfld4UeUPahiG5Jx89Jij2JZQWze27gUppViu5ZqKH
	6ZlBU0lQFKNeqB8XgYT/2LuBKSSlr/bTGaUaJn/HCcLzP2M8cmSjduTYUgLcNEWBzYjDZba8kcJ
	vPkcFwqTRi+BW+0HEU+9Mtpp7EM7sKDxGOGceuoBgdqpL2aP/oFlEUPnVpHTuLuQJy/CDLxvo4m
	fYUUG7nSjWppKJ1lsVB0ItacR7dLPv39roMCNBHZ48xFOpHaCNuKLkvA==
X-Received: by 2002:a05:6808:360e:b0:485:4f07:eefc with SMTP id 5614622812f47-4854f07f952mr1616300b6e.15.1779496881266;
        Fri, 22 May 2026 17:41:21 -0700 (PDT)
Received: from Dell.cheetah-searobin.ts.net ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b6350ad38sm3365739fac.1.2026.05.22.17.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 17:41:19 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk@kernel.org
Cc: akash.sukhavasi@gmail.com,
	andrew@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	hkallweit1@gmail.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	robh@kernel.org
Subject: Re: [PATCH] dt-bindings: net: mdio: remove deprecated .txt binding stub
Date: Fri, 22 May 2026 19:41:18 -0500
Message-ID: <20260523004118.37647-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b3a268ff-6f69-494a-9b9c-11995f35b9c2@kernel.org>
References: <b3a268ff-6f69-494a-9b9c-11995f35b9c2@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 21 May 2026 20:41:28 +0200, Krzysztof Kozlowski wrote:
> Why removing it? The file was left on purpose why converting, so you
> should provide reasons why now it is worth to remove it.

The file is a single line redirect, untouched since 2019. No files
in the tree refer to mdio.txt, and all existing references already
point to mdio.yaml exclusively. The redirect no longer serves a
practical purpose. Sending v2 with this justification in the commit
message.

> Don't do such patches one by one.

Noted. I'll batch any similar cleanups into a series going forward,
and make sure commit messages clearly cover the what, why, and how.

Thanks,
Akash
