Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6A470E86
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784747386; cv=none; b=i0IHHTX7NdSBHlWUwzsy/77LZHYfbFb74iQs5msQSY+/WxN4pVRBjCXavraq/YOgQKU6o9azF2fJbxEQRcthm++Z2ppNtZz6B4U+V1EpOrG/U//KhnLmLMzwYsd9eB/4G/IyOUAg2NWBtgn+c3yYm4cxJhYTuInKS1cKT/Da8fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784747386; c=relaxed/simple;
	bh=W3AJfaqsk6O5uX1cym18MO6eLobye9FVt0s1g3mujNw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=OKzowq6XC4WCcriWzfCDKxZyGnUaUzIf+uu8Np1cLHohu6tVvdfLJltZcjztDI9woUIIUbmZYxoLHBZj/8xwBHjePib5Q4xLjcJOfJSUjpzW6HCyMVSaUxMjDKtJllEwoHGQcqMzo5BH17i8VoxDAz2GRSvlLG4n4Fd5S4TQrHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=EyM5iJ6i; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="EyM5iJ6i"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc61541f8cso78452625ad.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784747385; x=1785352185; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3AJfaqsk6O5uX1cym18MO6eLobye9FVt0s1g3mujNw=;
        b=EyM5iJ6iuyE8gxWAOpMm2BHAessOU9yU+S/pUqvcvB/EOYoGgQLEy+tg02N38ubwoE
         QlyWZ4vHbMblOtjI7EKaD7S8oHJTplywel/fSuaXbkLjpJSvGGXmNFSAxC2iIYv5H8Ax
         lSAdlhUQ5Ikt8yBZHStyRXb+8UiBpRnla/Gt1g2TkagtMCgIlwUMXUA9ckj4de4H/xCh
         lN+03+dJsRyNdH8Fbomxaz9nXm8GwaHT2rZhe8nZ805klZRPuqH8p8jBwbjHs1jtTieY
         jAROfrR8zd/VMsVP2XRDDaoUBB2K+T9gbdjzJH/9sal1PSNEWzCwKDNnhvEoMhe+t1zj
         gQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784747385; x=1785352185;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3AJfaqsk6O5uX1cym18MO6eLobye9FVt0s1g3mujNw=;
        b=WAOVwLYJCy52aO32C+EFr5mK4YXCTetzzAy1OpaY/lRbsL35UDnWg25/uqJEHgxzy5
         NbxW0mzNcqhcr6OCNvRBA/sHI6fDLMoR9bmo3YZYL3P8DYuobmIjaK+hVY/EgzK/+8tP
         2A63XJRD7npUnmpY+/f3QUcASitvvJFlXJW8C2HeAD2K8+X4PvlgbEXaz4HlIIx05p5P
         KlccS/HHv6rZx4/bdoFB3v/SK9R3VjkiJhIR3wCe80Soqt9S1OMMRngMLdoZA5Z/FDeC
         AMiFnDP/qumQzPUwo2Yw1+GEiJJJnWQ1kvBYYaHW6YB8kW7CeQZmaKvAO6YmRl/dlKBt
         lpuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Nf081rnHvBTtqIIqgnplpDWqnO37Titv6CuAMPYi1GHJ6LSUqriU6Man5aVBb/EVtdf52nf5sEwc@vger.kernel.org
X-Gm-Message-State: AOJu0YyubGqgCx0CiyR4RlCKpPVPgERwuKW+TKLwwYN+Jiw8OqRJE7Kx
	VwSkoyPhG6FZS5eFcAR3CarTNR2ZLufAr38Si+PTj5qqWwQRLCzpELn9VIK7n7huHEmpK0zegFe
	Z8LCJ5us=
X-Gm-Gg: AR+sD10sLMzFeWOrvp0T445oQehdxZFRFl5WeJYDExzYXwUw70vI7wcUKew2+o6UXD3
	wMGQWBZep6BDaV/mbmFazGCdItGT6PLZ1nglcP+s2VfBFRWZ5IqHLeI8/FCJs0KJ5aMCLibGrlI
	XvGPABXDmov+cIB2j7SJ9nQAsKesldDF6q8Htuf9uYLrg5gbn3IQQA6o8rb19fUIO4vm8OnoJYZ
	AP6apRWR90fOyVhE5a0rztTAn/PkqekqLKZk+n7Y02KnlwCgGiVoiLPZLsgo9t8S43Cpv0OXjkv
	czVfdYvpjWFBdeJCKkUqFoAWQfU0M0H3gd9RI8zJtORSj32IiNFPD5uj8Qx9TFVY1SMtn5TpcIj
	97Ns5z4NjHOuFssIeveGR8weq9vuJMFZrzWqrrGz6sK+DjYZApiNDExZp+DUWOHBNMynlaLOSQ2
	05NVmZZYoNmmEV
X-Received: by 2002:a17:903:4688:b0:2cf:461a:3863 with SMTP id d9443c01a7336-2cf8ddb8b0dmr58992725ad.22.1784747384682;
        Wed, 22 Jul 2026 12:09:44 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm11439970eec.12.2026.07.22.12.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 12:09:44 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 12:09:43 -0700
Message-Id: <DK5C597BG03W.13X9XDWV2JEA5@nexthop.ai>
Cc: <robh@kernel.org>, <saravanak@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/6] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260722-warping-earthworm-of-downpour-1bba3d@quoll>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai> <20260721-nh-of-alias-overlay-v4-4-8ad097e31e36@nexthop.ai> <20260722-warping-earthworm-of-downpour-1bba3d@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed Jul 22, 2026 at 12:36 AM PDT, Krzysztof Kozlowski wrote:
> Again, AI written.

As in 1/6 -- disclosed in the trailer, and I'll trim the prose in the
reroll.

> > Return ERR_PTR instead: -EINVAL for malformed values, -ENODEV when
>
> Why?

The /aliases caller added in the next patch has to handle the three
failures differently: a value that doesn't resolve inside the overlay
is a legacy alias and is copied verbatim; a malformed value is copied
with a warning rather than failing an overlay that applied fine
before this series; only allocation failure fails the apply. A bare
NULL can't carry that distinction, and the existing caller reports
every NULL as -ENOMEM, so a structural problem in /__symbols__ gets
diagnosed as memory exhaustion.

If you'd rather see an int return with the property as an out
parameter instead of ERR_PTR, I can reroll it that way.

Thanks,
Abdurrahman
