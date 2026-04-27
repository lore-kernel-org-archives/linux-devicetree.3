Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E49D3191C8
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777329729; cv=none; b=UT+SdBFsRD67ZT5zHKinE71O1yenGQ1i+7hwUzmCFV66qGp4WQhAffGlhz+Ee24LoSRdQi4yT74xsDBVwg4+MOq2VjO6GQx1mWDw5sRsM5OSJtlsAG6WJwQSQerVt735RcbRjM2lbg3h5M6xkSHqH8ycf4ci5Z00UmhBdVjwPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777329729; c=relaxed/simple;
	bh=DcS0xIbaiVfhw1uFxeAC+bBD9SzyqlKecFBf13wLMw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fth3uyffe/tI1llocbJb6GBGNP7S4zAMlvIqm+kaJF/dIoG6Cx0DT6bPFXB4BNZ3Wb8lhygyt5amUwNk3t/xNiVxlSzYsHiU8ewhrj3VVlR0IQSeIPU3B8bcxOVrc3HyESizBxMJ+epIcrfiSW8yBRvkUH4qToHfcWJq2SUVtcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYe5Oy+Q; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYe5Oy+Q"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cbc593a67aso985012985a.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777329727; x=1777934527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiuuIIQgB/ng72B2X5qMWHFySgXXLT4/yH9F0w6bPag=;
        b=HYe5Oy+Q5CrNfEqUGc8pyz6CeloeJ8LMAhLSLkIhshbRXzxDKXFsuGAG6j4UYvNePR
         evRrqYPnHFuKsTFjY4D5u7pJ9iphnT612p1tY+tdnB9bUgFdYTOT7NAD6MgEwHmjNBd1
         nMFRHnxsQFngtNSfO0AwGcLdw0ZR7opTH83ANbs/OPM/64+mOIHWxjl8OpmhJ9Cxj9/f
         tiob6Niq366GgZ2SPveewOVaRc/Ej9sDx2SCd9744eS98y+t5ZmO5sOlAmw7lTe2p76Q
         uWbZMp+cjmPPWVEaNpkYu2ufekSGrATxdXFv85G7KxGIcu+71/72pZR3AiezN51Kn9kB
         girg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777329727; x=1777934527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiuuIIQgB/ng72B2X5qMWHFySgXXLT4/yH9F0w6bPag=;
        b=OOWAwJhV7r3caxpygNDuzbo9Ov/6K6dX0TYrg6s+1/fRhr4K5q48G2m/+C7HPMDHBc
         wpussEgsXaJhKVCusCSDeNnOxJ9gUxzlQvzyx5wM5rjGY3cqGDOCZjbhKQ2Oexdot7UA
         impOSZBXfcCnreq+RSF2V9v7ymCmUr28/1jaFXp9qJtekioCusTCHXN8gBQGHntLAqYj
         gVc4lnAHlPKCrlywRO/1ZX4WS/NUUn8MuNp+pkiF014foSBsqcY310yJKTVEuCc6piN1
         SWWKt+ft3IUaPERTw0OjB9VXdsssBmcDXxV6l2qeRk5IxbW0LPz3HQKXA+GViXfH2VWS
         daxw==
X-Forwarded-Encrypted: i=1; AFNElJ9QHDfnnB3/+bIeYHPB4fARGupiGRETHLZuw5M/x6FDuGW6RAVtULhXfCXgwjy6NXr/R5gi5sdkjrXI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4BNtank+Xc/kGZm6DrC1TJsrIIAoy12xV/HltJkiuonJxBWji
	a2O+IIYx6MjKh4UXyz3YcaxbkDtG1q6OetQv1EIKohMalvAt1bnUge2V
X-Gm-Gg: AeBDiesF8eejVqNmA2rcVPp6IbgBNAnl0OQNL5tq6GFFnS4cHCOiBUjRCuRIJLa/sqp
	dONXCOdpI/uRvykpw/fL/CALZWQdo4Eynib/OQbnCTIR/qJOZRDfKQIaoTjgQ72rc6Mfca2ysnP
	pdp6ZU73Z8GpvW/LnMIduU4PND49OoldM7o6xGTaquKe8VjOYP7CPn3iZJ6B3+JFsh1FiSf2OBJ
	aqSd9QDxSIkmKhPO8xvAbhr/Qdd3hKWhChclc9ZXqFOy/94J5hYprtuh699RxcN7Dw3goLAfwyr
	fYrVF9wxbrxH0TJVIDjaJ0XgzXvLsvjwzBXyM+izmMLxQXEH8/h1fZt+DOqSYyqU3yO5ZGGgTHN
	vsSQiZFlEYuzlRYiXy98ENVUGY0unP7CeQFxRMvQ7hdx+EDOou6qS1girq5L9061UhguKpSy/UB
	s3gd3eLSqoaSf4TR0c5mNge9aZX5pM/TTfCp6Z
X-Received: by 2002:a05:620a:4504:b0:8cf:c0c9:bca with SMTP id af79cd13be357-8f7d78342e7mr91392185a.17.1777329727373;
        Mon, 27 Apr 2026 15:42:07 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c50b7537sm48163785a.18.2026.04.27.15.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 15:42:06 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:42:48 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Yifei Zhan <yifei@zhan.science>
Subject: Re: [PATCH v3 0/5] Support for the Pixel 3a XL with the Tianma panel
Message-ID: <ae_maHh5IMxQWxbM@rdacayan>
References: <20260310002606.16413-1-mailingradian@gmail.com>
 <ae-yXomgNWLd8IcE@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae-yXomgNWLd8IcE@baldur>

On Mon, Apr 27, 2026 at 02:02:39PM -0500, Bjorn Andersson wrote:
> On Mon, Mar 09, 2026 at 08:26:01PM -0400, Richard Acayan wrote:
> > This expands Pixel 3a support to the Pixel 3a XL, starting with one of
> > the panel variants. The Pixel 3a XL has two variants with panels from
> > Samsung or from Tianma/Novatek.
> > 
> > This series depends on the IMX355 front camera devicetree patches
> > (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com).
> 
> Please resubmit the DeviceTree patches once this dependency has been
> resolved.

Actually, did anyone see v12 of the front camera patches? I'll just
rebase this on the revision of the camera patches that get applied.

https://lore.kernel.org/r/20260331194437.41041-1-mailingradian@gmail.com
