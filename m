Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2676C2BFC7B
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209278; cv=pass; b=llkDWnocoQLJjMqM5XJBDR3QfGHC56yR4TQLzsxAZ9+pO+E7DB/f133KzWOCHveOMTqmz/oWRYtVO5C4FL8jppXsX8W8f0+Tv8LGFEMSz8wzXwn7g+uf7Hs1R9SL2FV/AZasOWPVkTlF6sr0cmQYT4mcVPXbguNLxf2KVwJn32w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209278; c=relaxed/simple;
	bh=Kty3xb0qI1jeD5aDGQBFMdTDAKANoOtIiofJOjvXrz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSZD6vVJgL/eGM0k6pWpCYImltqHNc6dqxkiPOufCK1dLfWwDROIj9WwQr0/0CioYe/VBUMULknzIOthIF13yjUFm4zxn74XbQcQeWOkPCh070Ytprtyx1LDFVEcuTkrjNdc0GbZ9CWnD9CqFEi0FGYs8UGMSPMBM7HKoIUPQbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0YL0LrF; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0YL0LrF"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2055f5a993so200511366b.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 00:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787209275; cv=none;
        d=google.com; s=arc-20260327;
        b=M8OV12f9oV7r12AwdeHsOBOZEG8dIaFcvqaFCwjewopcbFXOXqh89cUAuRdgKNRx6Z
         XUC19nN/bXlUTQMjOSZ6DuRqat/fexUwO/xoZG0cJj42PFpa/72ubgrba0rLWoRglsyJ
         QGjePKgNd0egLfCf7VWyfr3G7sJmb2/r4aTnaa/m7llkSCRJZsLj77EccBOoo5uFIuOJ
         m55up+Bu9pqEdYO/6oGiaV0Bb25w3FAfGHfOELvmES6fDd3k2zyJ+2OYHgfcxixIJ5QB
         tTR+lkiUHbSNPbv9KGCgaTLG11jBIaN3xv3iSf1UFO8kJ8Vspd8HHfmVv/oYpqW5Grhx
         4VCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=;
        fh=x+QreewciHdWVAYsBb+xSUYkh0Xl4lvqNrDY7cVMHbU=;
        b=jdKoyxhWJfVVpLI9JDa7xMjF52uIGM72L04ix6BJFx7cn2Kzf5+px6fj9Jb5PvdIkP
         QypBTq0rbta7S4TK3/H5sN1WIBc58zYD8BfiFFVlEHhjc8S4YmOAVYlFl+IDwVGpN3Bj
         iyL7AOdaf2n/WWfa6UJ0rYlWuSOgyCPVOYHxmUuFfJL7i6z1iHeWoRG7HJKqyaSq4rDW
         nert2smf6z9+Pz3valq4BR7Xaeh5eFAVWzh1SjCFp8uWO31NziGKT/liFde9BPnIuDSK
         DZ5SIQJOP9/HL8u79rBpdTP9jsWrm10C/mEb6kxEtg2qmf2Qp76s+x4NBA3DVLU9mFvs
         2LCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787209275; x=1787814075; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=;
        b=r0YL0LrFjG14nYVhNtaTpnURy7obNEYKMKjuIuHLwUdooLSh6/K0JfIsbAN4i9dqbp
         L8nxOCe+j9y8bQwU6Gy4WM+757RrXXqqUpmTErWwEvVSTFRiE4n8CD+cwoYID13Y96XG
         pvjnTp56b4743esk3kAf3TghyzV0wvSxMqGebUIdsdQ+3N9zqcvqtSQcUOrBv5ouag5t
         lU/rj2e/r3yj5oZmOkmRfM/VcoOilt4rBJLCzkmX3zUGGKHSN+Ca+/bYLfbIsjUCYffx
         ZFalhXGIka5JaWRrBiTwN0JgTgmKKvqPF0mVJEDVwnnjn8oSUObJntIHI05EkLG2LNuT
         WEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787209275; x=1787814075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AJBG4gSSkw0lXa5DQuNF9zreM4sRStgVFPDhjCBnh9U=;
        b=Bbd+nI7M2AVKIPed3oAbL5NcureCsI2mhB+hX1QZ+aqOsTMvGctNcCGUXnFeRHCdP6
         PkpzJqF9SS6T+DuMjCmnROWq6m5EgCyeiUk0ZMu30QXcXp1XdIW16zOHK8ClXqn3PSeN
         /Wt0JLL9gV0J/pRWtHjzQLjfB5NNozsFc3pn4hebLsgP6XqxFTmBfRYHcpxmAnPiOCVl
         ZTJNwNZom9M4QFtWqeVdocknulaznLQXrID0sz7Tgvp83YxZ+H4MR21uI3REKF6qe5Wi
         AhHMWJQtPs5u6rzfbcZ2ovXHzu6YpyAIBT9hIW8BZlSXeHtA41GNjDrLGMyMb2oq8aO4
         WEAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeH0lu7cG95pAuYz2lyyl/oF38lPDuSFPEBUIhdoF61zSKXmdbDri9JyFIsNyNVBxbRJe4yr4ZLvU9@vger.kernel.org
X-Gm-Message-State: AOJu0YxWbkuJYbl31I971BUPg32CIVOZZYYc1ldq7pC4zjX/iITqoHT6
	8IyIsHpkZ+Zx3KR6O24tcLU1fHoCV6jdRft6VvHpLCKvOLu5UlBcLuRCE8EGsvN0Rf/Ncp7XhVa
	Frv30UtxuN/eJP7Pl/oRCroBDQa7dIZ0=
X-Gm-Gg: AR+sD127A/Cbq3RMDqV17yziTYjDMobvcV7nTeMVNRGjxwhO8Mq8IIkm7rvNtob6s1e
	cz1m47KC1pjh3Ms+/DIlr8Bkhu7/qHy/gkY57Z+S6Yv+qpjcC6Z43FqR00u9y9gTpaIfmPsY6v2
	4cMoBE6YIaW6LT2C3rVaPFX8tTQwaUxjqWvaMeVoBySvpSvJ8ixnq6CC0LjkGz5EMKyKJBpIjOq
	xV2gi0WSX6/iAKz7/RmUASMapldFcHo2BGZHWAIyvLQNyaxuaHxwX9NzskVaz9+CK1p9+eWWrye
	4xxa11APra9iiX43mFUQk/XHIoRPvXSJhKhOKJHlf84=
X-Received: by 2002:a17:906:ee82:b0:c1c:2007:298e with SMTP id
 a640c23a62f3a-c242e38bf8bmr723860066b.24.1787209275106; Thu, 20 Aug 2026
 00:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <20260819101853.44681-4-l.scorcia@gmail.com>
 <h6cxeranayykvjnco5vuaoccuknoiu4yiancmwugouewucb5k5@osmdfzfc5dsh>
In-Reply-To: <h6cxeranayykvjnco5vuaoccuknoiu4yiancmwugouewucb5k5@osmdfzfc5dsh>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 09:01:03 +0200
X-Gm-Features: AcwNN1XJDhHftqNShtFzkYfbAjGi7imuQVN4JqERVqBvua6db_cDNPHETOvjtjs
Message-ID: <CAORyz2KMg1-zxSPVCiFCiC4EpVFyR9=Tcowim9vVzv-g7SS35Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Please drop my Signed-off-by from this patch.

Of course, I'll do that in the next iteration of the series.

> By the way, this header is not used by any part of mt6589.dtsi,
> so I think this line can simply be dropped.

You are right, I will remove it.

Thank you!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
