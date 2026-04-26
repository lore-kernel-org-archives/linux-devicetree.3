Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAE71A073F
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 23:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777246844; cv=none; b=GGGXkMjBJdc9lfAwgdJxDyzoXGj9WonMfTeogi6zmhzk5PM7iCoLr5VCTL1lZkKfhV6gTcCv3p60NJcSp/pVs/Y3PyqF1x6xu1pLyx3O+pYqOG1jgYGvn5dsBVm5mIZtYzSjn3cfguKt2GtFjsxnVpjRMeE/7tcl/sXeLmet2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777246844; c=relaxed/simple;
	bh=2JZbIC1j1ZT07IZeXZn2PsOsR4I8cDLN4cHjVdNpjzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5D2dL99VOsVicBCIHxMUgq8ozXFVY9es5/tiZe9vzL+ctM1+TYg66ylsQhIbSfG2aOt1uL+iB8H56fUVOTgmyAP8msbal+04b0PmHxr/1RgTz241zkKmC46VDFiymZCWuFpxAfIkU0D7Ly5eNj4j567SNGHAId2p/dLj+dsXqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=og1bhdDa; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="og1bhdDa"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2d891442388so17376323eec.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777246841; x=1777851641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DVQAh1zH0R/yT84bvoM6C71cA7nJPq6N2ZR3XUe5gac=;
        b=og1bhdDaSIzYPPikiiqc1MhamfXTzr6yIojrurMuSTsyBBgxvw2Fbgy6BX3s/JizXW
         gRHpQYAF8wIOTr6G1eSe2oBpkKEpvwe2m9wRWrWv6yiN6fjl4hxXeaV8P4eLpKHYvbVQ
         gdrJJJMXrprSOSiXqa0U4VKoLNWm3HE0OQlKFHAlGuqgTtgrm9kQQ/SgQf/2T/9rqeoE
         OC/isuq8SGA938d10kksX3b+eFPIyC6FOdlCv6qiBROuwv1PSg/tVpNQ0xUY9VsBOM+H
         u/lG1kfXoFqCkMhWmhC9d/ZgdN0JkE6Up6iyily/Aa1eOsGjxNJvmePVfPBNGzlsaPHQ
         nMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777246841; x=1777851641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVQAh1zH0R/yT84bvoM6C71cA7nJPq6N2ZR3XUe5gac=;
        b=HRbinpkdTthen7/lfR0yY+pwBdIbtgN2/VuEM54HZ7JEe3ETL+9vQ/0KNmAKkLa1nq
         r8QuXIyIizeJM64wj0S7yU1pZTNxJF0r2RfaTJLAqyIrDOVJtTgTYsNnNpZsr5Py04dk
         bWbPsqxBMxSWA5e1onkccZP3DeX3y4QmMspOHxAX/1p2BTpmwueb+dDJ6o6vltuvA2S9
         dQxbnRFOD4udhtLFazmKjys/j545uegOlR2wlsEX7C75aZ0tf1FOBvv39yt7yoCyJgox
         E3fNJgL5aZuWRW5TR76ZIP4qYJ6FFurtm3seRXGP0rdBj/uERES1HX6OH+CmhlOI0pq9
         DCng==
X-Forwarded-Encrypted: i=1; AFNElJ9YHKXL3drtjXb3KnidKBUa/IZ0HJmFvOUNAsqHb8GkDySXyAtshz9cnjmj6P6PJ/BH9mk9yrNluFPy@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJ1r5nbQUIPZTLwsN0YDGRi5d20zwjc+2vtAlb/9WX+nsXnmA
	tbtlkLqb5eCBv3y28vW3YFJ3F68/RKPyMQHC00bAtAMChNl2MNhHaPJv
X-Gm-Gg: AeBDietwaYakEYBPLK8mVEXXVlq/2Tr/GZBOoOs6bwpZvoVtAAlDK3wnMloqejzzcZ1
	s4HFlp6qBGu3VGUNi+QWZugZYX7gyGdi5A294QihVC5UjY0sxbBP9ChcuefV5XSbRsu4tjxkpvn
	tg8sLivwtc7X8sDYjzRvYf4yZZmTN43Q+Y7CY2z8savdssojGW72gSZ4Al9trKvFNXOepPX4Pbr
	mLkjV2SDEvZ3deY6BIfJnerFevpKSTWPpazAxjXmvnJ0u0BvwDpi9GidnlroFury0Gnx7XGrDbZ
	UyLb/fEAcpMiLhwdEswWQnyo8859U1bcJQHckguv64nPI42Da/dSyh03da1viV4sDLkIrXnV/wj
	ygCRdGrMJXRHJKkArsB50cVPVQiRQemrkoidufWO6/dxjbkypkjKxKlGxjLYDxnmJGSR54Lt85d
	+xApbjZao5AdlyYGlCCtn/s6w/cGC1p6NjhhzgnEuJOxOefSNQRdcv9u6B/lIyC4QuCCSg4YA7S
	g==
X-Received: by 2002:a05:7300:fd18:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-2e478c1ff84mr21648118eec.23.1777246841412;
        Sun, 26 Apr 2026 16:40:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:da2b:741f:93fe:403])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce0f5sm41133434eec.17.2026.04.26.16.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 16:40:40 -0700 (PDT)
Date: Sun, 26 Apr 2026 16:40:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hendrik Noack <hendrik-noack@gmx.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ferass El Hafidi <funderscore@postmarketos.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] Input: Add support for Wacom W9000-series
 penabled touchscreens
Message-ID: <ae6iPsVrMhSFrqPm@google.com>
References: <20260426135232.371272-1-hendrik-noack@gmx.de>
 <20260426135232.371272-3-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426135232.371272-3-hendrik-noack@gmx.de>

Hi Hendrik,

On Sun, Apr 26, 2026 at 03:52:32PM +0200, Hendrik Noack wrote:
> Add driver for Wacom W9002 and two Wacom W9007A variants. These are
> penabled touchscreens supporting passive Wacom Pens and use I2C.
> 
> Co-developed-by: Ferass El Hafidi <funderscore@postmarketos.org>
> Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
> Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>

Some of sashiko's comments sem valid, please address them:

https://sashiko.dev/#/patchset/20260426135232.371272-1-hendrik-noack@gmx.de

Thanks.

-- 
Dmitry
