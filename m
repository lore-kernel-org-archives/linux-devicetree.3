Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281803;
	b=cjX9iU+8kzcGAjnY++QFmpmNw5JKnHA6kFz+iAPyUSruSk3HGcWNSlXisjHROy4r6myh
	 9g0ULTT0ICN30/802btXp9Ys7pH8t0KywxnT3IgRu73owfAwl9CKWSeL2hZZtfxYsWc2G
	 VqV9kHjwAGT0g3/EYtiF/C33f/hbUO3mQPbk2Nar69Rti1huvebmbsPf3TTjJuyT6UhHV
	 6q1/38mDrP17pZ94i5QAgnu3JOXADQsyDjzamT4JP7Ayk19JlJcLA5kwaM+P7E3GP5qK2
	 hFgsDO5bixNS7HyCnus8an1NVOVkQM2VgIjsqsglhvU2WtIY8K6JEQBuKFXo4+/lEtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rf6nX6z9gFornN9cf7tozfwyaeDZkmjs0vcNKXrirVc=;
	b=studfBqff2gxnQS8EnQPLuxdBcM/HvKMyAeBxZd040mJvbsNtDFGUtoMONrXGntbAXOJ
	 HIGDwW0FjVY+a0gtoNtKkO4ma+9i/aLVRn63Hp8Z1HojIU6Ioxde1OFKn7XSJfv78KhyG
	 bf6nuokCIsukWH7gqtmP0bBAwRpwxOGsxrF7NHWZsUifCNcXc6c1q8wqdGukJDDmAlmud
	 IlZFOQ1YCYGLqly/W0FVcHVj/XFBe8mVkMxItqHbLulrvfzMc1TgCfp359gVeuh4ZzmVR
	 TemtdKj1kDINhkRaHNJVvZflc/5X6W5IPkpMugB0UVp8LBqP42d/G00VwCubL7TJ69A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W6Jv14/o";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D6C606A32C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 17:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D6C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6Jv14/o
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so3859237eec.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 09:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281802; x=1795886602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rf6nX6z9gFornN9cf7tozfwyaeDZkmjs0vcNKXrirVc=;
        b=W6Jv14/oX0BcPQYRsaHnsjvBVFH/SSg7Gw+531o+1xtwGe18j35J/O6ym3b9t3qaEg
         R5vxdpl9ZdOIH/GNu411QtlFPkqwmkdIaG1bJSH6AKVJGZbjD7gOP2akjNuKQzMP0MIE
         58YIMpkv0VpPCGJ/yPUN19tRQD/+Mrk5o++6cuTYB5u/WB2wHiOrTj4M9F06SToA+ZYz
         nJ4fRL31Mz82ERRYvkszKqr5lUnEGKE41S2pQLr+iw8eiQdbHKk3JvK1WfKrg1ITOmxk
         N1EyniCz1Tkxve1sSB1eZzAgU9OYi+hvfcxSlrK9Hu6UIQhlFZytJTVP6PyK+i3GlYG3
         s3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281802; x=1795886602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rf6nX6z9gFornN9cf7tozfwyaeDZkmjs0vcNKXrirVc=;
        b=vdrYub70uvLnQ6j8m1B73wge6zqSJRqctd+MOid8a2x3Ey856EeZmCUsyW44vvGZWF
         I3yJFVBHxyhzMhRnNFxJNQmIZycvF69LVdzzLi6L8GinbjesUzSC2XJG+fNZdlcfEGR9
         mxKQGIVIr5dGj28J4DJcbtJK29fFlkXHDGJVSFQxrRTqJSKP4fVky/u3dGAZY5FmfckC
         MpeL+StoL7u8FGInAUBimkCycOLC6Tz1okfJ2GqMC9Rgx9gBQ6Ml6bV9f0gmX7CYpN1w
         mF5Gt2aytXN54rLG2ybDHaxaOzMnb+jKJuQIBbkHVw13kwIQbtaE0DymrGy+9JpPR5l5
         U4jw==
X-Forwarded-Encrypted: i=1; AL+hErFA+SAqCUR7uHoaXvVCBnbJETr/N9MjA0Vw1xfPxm9IVRA7Y9SRwFodA1W0tWTv6muqSkTWX/JF0hhx@vger.kernel.org
X-Gm-Message-State: APuU4Z9wx0WJRrFAUKmro1WhsvEkkOZGvzM7Qe3cUWN7C6OhOHeUnMJb
	04dIoz0HClIJ67NkTX04VCZzCO2fpaIbEka5JXIUprcTO223fcSfJmO2
X-Gm-Gg: AZFdTZetOvFiMNTGOJkq/DiOkAGfavyJm5IM72BCPOPd9s3HsAQElEGUTCxEQbd2JJ4
	xI1e33lNpfIejxbOhNbuVpxOLNv5QqP3c8NxBtb4IWGThvvO2jSg4QtbeANpL4OtYX22zCnqlPG
	iGFy1Ddv5DdfhqZ2i/S9aixJ2kCu2IyntZ1WswZnNZIy6JMaCf4StLrWRuCfZYMHZBnFLCsDjpI
	ZRwDELjjnewGX9TUDR7I9gRkgxhD6k9oUHusR1kjojSrbNFFDrwvuwBi2BCyg8/BJrROqHvZAeY
	8BvuwzmBOm5NHMgXOA9N30J6Q8Z3qrnVG3l69Xr7KC6fRFif1pceub+V08jJzLpK4aDlAYsXv2o
	jTFxABEBBpg2VEK0LfaLD52gl+TxoNpPHfeSWZ9wDGIrZyPPoeh21oGYywtMS/zpJizIj72VcKo
	oCImrbbNAYHsh6bK/IhMLScFEP/jcZ4PWJtrw9gYUeNabK7y3mOSxchPicCjAp9EUZ7nELlH3/T
	Kx7p+tuKeMVSez3sD2TSygiS5pVtq7w7ZlfNHJziPGeRFhhJhAH7zKPyWIYxsPkOm+Ug0LM8z8F
	Rsfk/Cv9Lgyge8rLJe+mHz7ociZ3fUddfkf1
X-Received: by 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id 5a478bee46e88-3856f7563b1mr8528080eec.17.1795281802311;
        Sat, 21 Nov 2026 09:23:22 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm21227439eec.27.2026.11.21.09.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:21 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 4/6] Input: aw86927 - add support for Awinic AW86937
Date: Sun, 22 Nov 2026 02:23:20 +0900
Message-ID: <20261121172320.829-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261117052112.32527-5-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052112.32527-1-xiaqinghuan@mail.ustc.edu.cn> <20261117052112.32527-5-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 17 Nov 2026 13:21:10 +0800, Qianhui Xu wrote:
> The AW86937 reports CHIPID 0x9370 and is register compatible with the
> AW86938 as far as the boost setup is concerned, so it joins that branch of
> the haptic initialisation.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with two AW86937
(chip ID 0x9370), compatible "awinic,aw86937", "awinic,aw86927".
Both probe and a force-feedback rumble on each drives the matching motor,
before and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
