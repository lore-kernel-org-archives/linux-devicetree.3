Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD82FC01B
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783270653; cv=none; b=e6E2iq2o0YjFy+AOj059vdDjp110s2E8Wz/3gq9U25dDTrNTEjFXlBW9LBnBUSyh1aYR6mHXyCAg1nBngySvrnw3U5ioI8VmaW7VL0OmLQMV7/4DG3l77iDePdIxscQuM7TS86d7neRzyUY2XvuMCvO/EyWZWMvdnqSDQe04duU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783270653; c=relaxed/simple;
	bh=P3Ks4mocpdIEXUivuFMkzFbV286Z/TWBxR+6eAPxe6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q14OQiycQF/04cpcaEkmVobQFmAdWpf4hNCBNC4CHCFNW+DNVoJ7Oix4agxrKPo9KxQTJXo1UvHIxavwHAO43qvD1GEi1LBAAQf63nEEueNGxIkMRWc7zBpkKSj65CBzuX9wjtRVTG6jqC9e/PyHgr2C1uWDK4Rgztgvf2VPFvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDZeRDNx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDZeRDNx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b27c7451so28958805e9.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783270650; x=1783875450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3Ks4mocpdIEXUivuFMkzFbV286Z/TWBxR+6eAPxe6s=;
        b=gDZeRDNxDFZOE6TNPzBNHeGmvNoo9fJTM0voyDlRuuk8gfwZvnfWTZMN1Ze8+mfaTL
         oLRcTObQrnDCemv8WoT0gjd4jWml0MTTMSqKTTf1t4cmoq/6SZYuCkN1pQgs457OkVuU
         pqyyarnw8N04oFblFGdvd4ghSq0AD5M8swRAprnW8LgkNdbhe5kg+Xt2vhZEjbhw9w5m
         5TGWfbqMcuoEBVgMKdUJrOOxT2UYJQGf4UfB4v+neHUo1d+NHTmc3ASOTPVKZvhKZKt/
         1tpnCEhbRIKkSILvKSQi6QSvSl9XHCSuC0x9opRTJ9csAcJiR3opmO4gbCTtFm1DWdXG
         olYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783270650; x=1783875450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3Ks4mocpdIEXUivuFMkzFbV286Z/TWBxR+6eAPxe6s=;
        b=e8YhwrjVcB6jb0ysjZY2eXbJKVyhe/jnpucdjPDHdpoDXfGikwvC3qgQZxH4frOpcq
         EHPqq+YyZAkgxfTO7ZFT7VRce34IMLBQ+jloKDu6gQWnq7+lwgAjIbQWTHeI/TO352dA
         tc+YxQPCXr6N6ANoSXemqLLVmv5NTyeCFJMvx1bRyZXZZldg8P7II7V9GSeLI+GfWR8w
         a5Zch/FJac5t7+6bjsvCBiVc7mxIYogPyktPJzcO5v5hpaJNm+xqm+DDdjCgxflbAKmo
         SUE4KNZO/MrWeGw0p3B6gz/6xe4Uh4R+ozjfrzPMJLR9BhjsDy86fjOiJ7EAkRB24hey
         726w==
X-Forwarded-Encrypted: i=1; AHgh+RqGiUSA2dyWM0nMwezgC9sXce4zEzSuBr5KONdSe0dDRgeuv/Zja1KbxRsDH7VsyGw3pr+gUtRP9oQ7@vger.kernel.org
X-Gm-Message-State: AOJu0YyMBOpvLUi3y0vU/IxC2NooXqRwZgaOOunwxzJoFMhoG+m5/5D1
	BqGSTVLoVQbM4YmiVQ7hNweOXDw5ryE8if3Pe/YPKnJaxIrR16bKnDyL
X-Gm-Gg: AfdE7cmXy11mYzgSKgH906Nnf3trBVDjqjOOTadvNYhYHxFMjNc7C8O+qEeM7LZnndQ
	qEswG130/GdSwNssqAnfoxMx4ddzzzKyglLLs09nTbbBUuQQey37B2yVz5yh4oR8nG6G7CvKD61
	Iq3Ke9XC7y9bbUH6nfyvrg4fhSdKjW/GqOcio0SX+PRBoPgfmuqW6a/fxxCz8La1lkrvkvHaa3F
	vx19qTXA5Fb65LGRm5zznQz8UTq2IJopbHUYtBM/2WHhDozOw8pAdEMTU75GVeehKt4aHfqVTzC
	Hkg2UtLIJZWryW7kqIEdp7OxJschSSV1dduYxNHbwcVX2VXwh9fZZHcJz5BCOwwIgN7cvewygHB
	DyeKiNSeqIkgEl2IGR3Uq8gsxvvVd/YbQfyIW6pvJKLQPNXlRrNjtGL160tn96Hr2sbd7R2/6Hh
	oGEdfuk0MKQ1cJaDRl
X-Received: by 2002:a05:600c:46c4:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493d159b8fdmr65120135e9.17.1783270649788;
        Sun, 05 Jul 2026 09:57:29 -0700 (PDT)
Received: from avermoal ([185.13.176.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm363764965e9.13.2026.07.05.09.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 09:57:29 -0700 (PDT)
From: Mikhail Lukianchikov <avermoal@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: convert Xilinx XADC bindings to YAML
Date: Sun,  5 Jul 2026 22:56:20 +0600
Message-ID: <20260705165620.9818-1-avermoal@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <d7607a98-f5e1-417f-ad64-d0029c9de662@kernel.org>
References: <d7607a98-f5e1-417f-ad64-d0029c9de662@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> Convert the Xilinx XADC binding documentation from .txt to YAML format.
>> This conversion is part of the ongoing effort to migrate all DT bindings
>> to a machine-verifiable schema.
>
>Sorry, but what effort exactly? Where is this effort documented? Do you
>have a mentor if this is some sort of mentorship effort?
>
>And if this is ongoing effort then don't duplicate:
>https://lore.kernel.org/all/?q=dfn%3Axilinx-xadc.txt

Hello Krzyszof,

Thank you for feedback.

I'm the newbie at Linux kernel developers community,
and sorry for my mistakes in sending commits.

I'll answer your questions.
I am not part of any official mentorship program,
I just decided to try to contribute to the development of the Linux kernel.
Yes, it's a ongoing effort, and to be honest, this effort is the general
community initiative to convert all DT bindings from .txt to .yaml. I didn't know that work
on this file was already underway.

Tell me, should I continue working in this case?

Best regards
Mikhail
