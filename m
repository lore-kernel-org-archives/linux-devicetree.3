Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9E82F7F04
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 21:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779829; cv=none; b=B1LvBXYBUHNrT7iieARte+zMTenL19b4+rgI0QRXhK6CQ/REGyLcF7DmXmFdJH+hwXuCzLPRQ9ySez8xQaNpQqhJR2Ov/rKPTxoDkg0evdGy35PnB+d3//z5aAO3T4B2bIlzhjw0drRyzDYc2oWBU9U/YOpiArlfyqnuArBzMzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779829; c=relaxed/simple;
	bh=8aQsvQV92fCNEJtI42BLGSyXug3KVyb8/WsuBLmztq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8CEtgRipJegB6uYe65Ht2MDUDCVi0qBsFAF1ZQBNEXwusCcOnMWU0WVMPibYAFRje77p6XcQ84BVHuGcR2NHU0Gn2DJ3UyYlWZXX1mfcTdt3BBF7All1W+NaNxL7W06vSeKuPq05HQDeFQN3pLjpMK5WDrOOUcWyu0bgd4kaxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyC2BOm7; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyC2BOm7"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137f27712fdso1304796c88.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 14:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780779828; x=1781384628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IpsbdQ4HEXAu1DofK9GVpNtvbeL5V7mTYGQq3LB/EZo=;
        b=gyC2BOm7S5VP72mgnsTuhnN9AFqyGpSdrXsm683Sebk4NIWJ7aOvSj1RrBs8RPIALg
         ZlNdaZ6jaPPQp6+QNBHKWny3CXkarbqoUaGSz5nZFfgV0ETia4Zz6BiXd1JOg4UmlgeH
         IuJxGxAfRFywUbRFS1iclf3mrzxm5/YMbwIWZh/Zvc2KUwvcPfGzQ1jPQS3SxbG4rzpd
         I1JOn7YF+iLVtAt46bifoeGncS+O5KRdu/D51wKDROjvP6s93+ODmZRsr7ztmDXC/aAq
         6gEML85fg84YhetACuEBdxXki7T3+TQ9/FzXnXlw0NSKYOaRFV/LYo5zSa/cyeDPxFUS
         HWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779828; x=1781384628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpsbdQ4HEXAu1DofK9GVpNtvbeL5V7mTYGQq3LB/EZo=;
        b=cBc1hOY0UPsm8DvBzQiGKbDCy2xVcZMQ1ccKc2acjm2Pal5RntWoUS/5+M2cXzUoFB
         l+cu32/okZauvCGfcdJCkSvvUHi450qYt9Zg4pyJBpKaQz0/BGzz5OOW6RI43b5Lu1iw
         qbPh98ehFUOYY2CFl9dPO/I/RnhweszhuDxU77dcHqYt4nSL93NerlIbm/ol67jySs+4
         M6Bn4o9mL9v4j15tadh/RahijHp87bnz+MILPqoHkofuEszwZvsRPw9XadaJ35QC99qJ
         PGv0lmS3BLyHYH822BpCPflgly3XUZTtju3542YAPRt6NpNYpTH1rgFOFHaqdVp6ZlJI
         F1dA==
X-Forwarded-Encrypted: i=1; AFNElJ9qkeO47MyvRasKxz4a9g/PZDFDUnkaC5OKjJnfbypkHyenjQBQzyg0+jQgTOGerqZdtN5KW0h3X9Pw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3tj58kAPBnkiGnrVWKbslCdT7JxC/O/dYLYYAsHZrxceoczAO
	ZSBd9y47w3kmokF542uKUctyvSOFbKcXtbpDvOgfWsogOAqnePiXj6zc
X-Gm-Gg: Acq92OH/EBFkPoM/9TCZIvZeCWtKjxkla3V/WDBQgL+ua1GFqQsZTF8+q6dxHJx3uAZ
	H/423HdDYhmcz5hInZMR9LSC76Ymu89igmXV/LkaUerpJwFFpW7/sgrBLlpTpfm3xx9uv3ikRh3
	cEHwftvBxv+In8morOxdhkkc1O/9mLXhuJn0f4tONbLYsS6+VdcY5lc1VTBoGXmVDdN7MjbgpOs
	cok819DeYvWMaR/Z/30qWTyXln+NgMqwhf07YMIfpoaJIhPeS3jD6vC7r+PiY/LFSvbo32O6cAD
	zPI9y3TKX0TN9az/ldeOUSWKTcKsH7b74GgkqfUbm7pN0i4KoDi0k8x7e9upEWgzMRxyvsqFR0Z
	m6UJAG5GpaGqhE0SCd96pkFZsmUzP3nrnJFQFIjhhFyAUwZo0UvuW4irE9rF2FW9gI9TJoYpNQ9
	ZfIdlteUNf+ozpUWPCyANLxAGmGZYC6Z1via6/B/SZDwOhPRoEorqJ0sWYiDm0uR95dJ1zk3o7t
	BFQqWf6oxeI/w==
X-Received: by 2002:a05:7301:5f0f:b0:2e6:e504:5431 with SMTP id 5a478bee46e88-3077b1de34bmr4945899eec.22.1780779827609;
        Sat, 06 Jun 2026 14:03:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bb2f:1c0b:386d:8909])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea9226sm11772015eec.19.2026.06.06.14.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 14:03:46 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:03:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Akash Sukhavasi <akash.sukhavasi@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andrew Lunn <andrew@lunn.ch>, linux-tegra@vger.kernel.org, linux-input@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Vladimir Oltean <olteanv@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Simon Horman <horms@kernel.org>, devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 4/4] dt-bindings: input: remove obsolete
 matrix-keymap.txt
Message-ID: <aiSK6_n4ZnB_KRd8@google.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-4-c8c19876ab64@gmail.com>
 <178052559618.2296868.8781332297681333925.robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178052559618.2296868.8781332297681333925.robh@kernel.org>

On Wed, Jun 03, 2026 at 05:26:38PM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 03 Jun 2026 15:42:21 -0500, Akash Sukhavasi wrote:
> > matrix-keymap.txt has been a single-line redirect to
> > matrix-keymap.yaml since commit 639d6eda3b80 ("dt-bindings: input:
> > Convert matrix-keymap to json-schema"), which introduced the .yaml
> > schema and reduced the .txt to a stub in the same change. The .yaml
> > has the same filename in the same directory, making this redirect
> > unnecessary for discoverability.
> > 
> > Eight instances across six files still reference matrix-keymap.txt,
> > forcing readers through an extra hop to reach the .yaml. The stub has
> > not been touched since June 2020. Update all references across input
> > and mfd binding documentation to point directly to matrix-keymap.yaml
> > and remove the stub.
> > 
> > Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> > ---
> > v2:
> > - Patch 4/4: corrected commit message (eight references in six files,
> >   not eight files), Sashiko review.
> >   https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4
> > 
> > v1: https://lore.kernel.org/all/20260529052246.4934-5-akash.sukhavasi@gmail.com/
> > ---
> >  Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt    | 2 +-
> >  Documentation/devicetree/bindings/input/clps711x-keypad.txt    | 2 +-
> >  Documentation/devicetree/bindings/input/matrix-keymap.txt      | 1 -
> >  Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt | 2 +-
> >  Documentation/devicetree/bindings/input/pxa27x-keypad.txt      | 2 +-
> >  Documentation/devicetree/bindings/input/st-keyscan.txt         | 2 +-
> >  Documentation/devicetree/bindings/mfd/tc3589x.txt              | 6 +++---
> >  7 files changed, 8 insertions(+), 9 deletions(-)
> > 
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

Lee, could you please ack for MFD piece and I can take it through input?

Thanks.

-- 
Dmitry
