Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EAD3C199B
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868361; cv=none; b=isoefly625uH1jd5YbM7S9qYB5BK9jBAFijWGSGt5RliP4xv/ZR7uKQw2A9axc9zAc2Ua6r5+155bjGn5TiSzmv9bAkr9whdz2CdFWymqyO6u7JbVZezqVXdg/wm5ayUCjiiEUmSm5FfBO8a4XaELXqf5AOSMU8TDMcET5mnLio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868361; c=relaxed/simple;
	bh=/TXj5dE4mqvc1ssxoqFjKHWoirafJM76VbqarPKJr48=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gtwtC7rot56/YfsOA9w2y/zqedh10mJTQ554PJ5+h4hEC3IAObvK0aVAhe/k0XL0HBcmLdoCtBbHZ8yfPMQJeiP0pb/1jdY5bHyHuyEwIGNetJqSFQ8LVnM7P9IEVdIDsyX/tQvmmCAv6sCi4/6sg9Jx4/8RXG2bVUFkC1nlywY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OdnnhIHR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OdnnhIHR"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so635556f8f.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774868355; x=1775473155; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/TXj5dE4mqvc1ssxoqFjKHWoirafJM76VbqarPKJr48=;
        b=OdnnhIHRLORDkLjeemJT4Vn/uQgn5CTW3+wmhtTg2QjoTSUTULguzpK3bxKFhJxKub
         iPjpL823UnseHyb7m4shyvII0SOAg4VwWpMDuFp5E+1IdwfaSwXdN21RXBsYQMGL08Iz
         7hRWR125+lZh6zPzgCiUUYjFIeJDqqQSXWB23HVcLG8teJvlVeddk/bRd48dBD2ea6HZ
         lOyEQv+Qds3xG5q73yOenjhZt1bu9d/jQn89YRfJxPeNWFOnzrD7lVp6f7LHHKvpke0k
         /FTtBWHvqUWYvgESr63wBxd5fTlZRtP2Ax4a2tI8TlscFphftcXxwQqptXMAeP4itr1i
         qo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868355; x=1775473155;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TXj5dE4mqvc1ssxoqFjKHWoirafJM76VbqarPKJr48=;
        b=kl2EpZpbilELBnVRFgqHST/lW8t6kgVH9RSmbZ04onIpF+ptcNEWIQzB0TVf6C00ul
         k6gcvug5osMyoY22MaNZa5gFy1uoscx/n6DdhYmK90zYnivCbOK7I3iTaeJPkUnKda43
         fwyQpqb1IB2/2ZR6CkFkObwuU9tAHLIhPpSSwZXxwoTSPy+v5+C2F48mW0Sl/z9xjpSz
         s3m+ySBgIsI10KkR5h70fvQjPEO/mbMC0WU7PIwMWcFYc06Yq+V2k8Uv/+lAdzFfO+nP
         gEPc8WawDI16m3GPZil117X0SqYAtpe0zM27+W6GKgYuPfVvfZLPtlksBsR+64hbl+Cu
         mSfA==
X-Forwarded-Encrypted: i=1; AJvYcCXgfGZk5bgjHMNob7pjR/+CZMQjWFfS7tuw3vaXxMctg54TrrmvswoOT79KLOVdHC5/6lP5Ipc1oZxy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj4X+1DiJ4B741RGiCA3NhAL+F3ULfeAd+nWsF6F18NG6tpLfi
	J+OCn4XUYRDMoUgael0hKzFJieGCVv7jidWLlLf1j4rGjsmCQEi6VhgqYd1cq2jdS0w=
X-Gm-Gg: ATEYQzyaTfm1OGTNsj7MWkJdJJUuHWM/mv4rSMyRM3yi/ffh6VVJQ+2VifnrS6PsG+X
	+6TB6+kBcWWcaxb40W4dpniuzJMWvaIGSZE068B3AK1IfcOiPsOpH/ioY0bu249v5P0VeasKazx
	zxBOEU0q8/irX5zeivdJSvFcCm3TRLqdYq76gzoJzxQOFFSjw83Xpk2MXrwbHbmT10OoNu3l1uU
	vtr06LLEGzKICT+Mno48QHZmZ0D3oSEpzhDeW2UT07ufCA0kXLfZUOpt1EbIzgybj29hjyvl4Df
	0Weoufdk5IyEmGlnzD51LMZCS/OU+vFdSfVEN0uVuhoKJwrJrEcPgZZk0dPRT/qqggfEqrgqkGi
	JH6O6CKLAZMZpdbB1YH9h+JxboLSZC1NgLiODoRFzivvxu+hsANaNPSc8oyC8DjTYcXXCsLk7PJ
	yDGYTIO54WZAbxm8BkR0zgIHvJwgJZ
X-Received: by 2002:a05:6000:4010:b0:43c:fe7a:4917 with SMTP id ffacd0b85a97d-43cfe7a4bf8mr5625551f8f.2.1774868355539;
        Mon, 30 Mar 2026 03:59:15 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm18943009f8f.30.2026.03.30.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:59:15 -0700 (PDT)
Message-ID: <abeff7983dc08c3aeee8b504f34b71b1a2fcdb78.camel@linaro.org>
Subject: Re: [PATCH v8 02/10] dt-bindings: power: samsung: add
 google,gs101-pd
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org
Date: Mon, 30 Mar 2026 11:59:14 +0100
In-Reply-To: <b66d7230-a495-40a4-ac75-378d0727afed@kernel.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-2-241523460b10@linaro.org>
	 <177409897339.266364.69715997034739052.b4-review@b4>
	 <6f0be0a71c74e7a7959e9ad02e93aff1cb8ef712.camel@linaro.org>
	 <b66d7230-a495-40a4-ac75-378d0727afed@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-03-30 at 12:55 +0200, Krzysztof Kozlowski wrote:
> On 30/03/2026 12:52, Andr=C3=A9 Draszik wrote:
> > > Your patchset is organized in odd way - first patch for me, then not =
for
> > > me, then again two patches for me. Please keep it consistent. Or bett=
er,
> > > decouple since there are no dependencies according to cover letter.
> >=20
> > I'll update the cover letter to describe the dependencies. 4 depends on=
 2,
>=20
>=20
> How 4 (soc) patch depends on 2 (pm domains)? What is exactly the dependen=
cy?

4 updates the soc-level pmu binding of gs101 to have gs101-power-domain
child-nodes, which are introduced in 2

A.
