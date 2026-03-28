Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A41A683B
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774664019; cv=none; b=tdvXRp7fES6h3dcJ5sWIPYVL1WrWJlyvwjfvfCvTHpDj8xNKYrW8g+bKyBZ9SmhYRRUMcbp2ksLB60r+QzyMp76C8GvJkrNKftGMY5sXJBYsJKjyWEcYIph2WOqDNmtNlw9/cwflzOsKVRFco65XqdilyMUKYF04uSJX6yva9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774664019; c=relaxed/simple;
	bh=ATKWFQRUP23topNj63SfFnspXkMmp8YWIXAjBnFqKNM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QENyC0Wb1HtVXg373/Ccrg0XenEWUgq8mi/ADg1fyHA1j1RExIBEnQFr85LYBdkiqWi4uWgpS2PDHNevugE8HqeEc8uqsJX2UZrZKz4sMjIfNggeNA59MnfoQkvrDxVZDKAE6fkU3l/9MtXvn8OWKeSrmo+wDeL7oK0jHs8vxyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHUJAxHL; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHUJAxHL"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cbb6d5f780so315206485a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774664017; x=1775268817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0SqqMgKQDeGv0TpX+c488DpvFeTC5TGIxUu1Utv0hBs=;
        b=jHUJAxHL6/w0zxS/i0sdTZ30Dxt3FV03CH8/TmZlNa2SB5UNZ+N19Py5j2O/3wRwqw
         +EuEfU7LB0FsdFf9CA4S4rrhAKtcrYFtp8EYdztw5kN+avsNBLKn2VOn61U9pjp82ZaV
         GGmjwAa1PUNqi7/tQmzsDMDFDOSoQppneGZ1AQEcoArDg4JM+mzvut/ZAVv2pt87sVkq
         K7WAqSE/BReGP5MooJxBwJW/KiRdQti7GiEb+/AwJNWs24do0kDIdIwIM5VIyAlusvEh
         NUq/t0bCVg7QNXExxxRH0qm09OdznNM24kp9Ry/jKhVK2inwximQ+ozjWV7o352Ih7F9
         Shmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774664017; x=1775268817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0SqqMgKQDeGv0TpX+c488DpvFeTC5TGIxUu1Utv0hBs=;
        b=BCjIfT6LLfiNEjB26YAKafTwFNWmVi/Qmk23llBKriXJpbFGc4qPE8/YOCeZI3wUCW
         ysneycy8FncFvsbxtMpdFjE+TKFn5RHVQLsSb4FUX+Ejg9ePndbZ3vmqQAQr4BfSpnd6
         I7pYthbhTqfEBPG338pENyfs/xpLtojpJ7ShueshGmxEzaqHvX6uncUoYT3oVHCSvEsa
         NYnReswDfOBEG/UukEz+7aALAtdQTNYDy4bbeqEY7bJL9PifBolByDLoxZRJWhVtTmRA
         ButnCuJm+EqxHlAnkjcbLAlz2FD4vP8bmp8fD5ASJQvg7rMsDLs1E4QicYQKApp0GmbD
         QEqA==
X-Forwarded-Encrypted: i=1; AJvYcCU2JLGD61fe7tDGYw4xEueXr9pQOjXxvb/ONiMZ7YYEqQSknlrlo3iaDRK91OENe3E2Coj2Qt3wd2ya@vger.kernel.org
X-Gm-Message-State: AOJu0YzWidd5bB2WgNxNGhs5pjuSw53XYyTkO9JCskp55xwmDP50spNr
	k6S66IFxZSOPe3opSVhrh3tKO/ZIUbnz/ebJX7JWOPYDY6skvAbuCUZl
X-Gm-Gg: ATEYQzyILJVi6eLne5KTpLDFP5Fi+dV7baEfbr65BrZhke6vBGqDnpnHjT6+Lovzo62
	ftxRQKn03dAPLbdpXxuHWDANNAPznbMDG/hHnQaktiv/8ZdQro7Xl2at6roeb0nbDXZ8ITgyKh8
	ry7vleJ47uZPJiry0LuxhW16O7MMgJ5/HxGWblyq//2iNi2fniyWVoXNOjbQJP35EVtt8vJL0JN
	Lih7L5fwEjcjbFcH9yynkK+wdioCWmf5mD+m3PBc0VBSyXFbPIl/9G+5XHhIMTc/55uFP0JhTWV
	ujrlzmY8f9jCMv7nf2jidi3KBDln9l/432s9vpuja6rYEBqH43uxixVEosaO9uuH2qdIpaA6+sC
	4HWSyKpTGkCVNn5kVHD6HzXQO9TBWIQdifkXoG8tbrE13jsCOAvw1bV2yHLC6hXhsa4b2P9gfBd
	GBcyaB7+eUXyKG+nBlJTMSA/iQag==
X-Received: by 2002:a05:620a:199f:b0:8cb:71d4:d0fb with SMTP id af79cd13be357-8d01c7fbc7emr603637585a.36.1774664016838;
        Fri, 27 Mar 2026 19:13:36 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027f2fc0dsm66130585a.21.2026.03.27.19.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:13:36 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:14:12 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/5] SDM670 LPASS LPI pin controller support
Message-ID: <acc5dKPef3v4cvbC@rdacayan>
References: <20260328021036.85945-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>

On Fri, Mar 27, 2026 at 10:10:31PM -0400, Richard Acayan wrote:
> This adds support for the LPASS LPI pin controller on SDM670, which
> controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
> not sent yet.
> 
> Dependencies:
> - SDM670 Basic SoC thermal zones (devicetree nodes are touching)
>   https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
> - Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
>   https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com
> 
> Changes since v2 (https://lore.kernel.org/r/20260310012446.32226-1-mailingradian@gmail.com):
> - add minItems and maxItems (1/5)
> - add review tags (2-5/5)

Uh, it seems I dropped them (pun intended).
