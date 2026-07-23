Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F113387569
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843276; cv=none; b=OEZvDp+se5N/J1OeP4BD1RRCTWPk0rL9RmpjVsUQ9RjFmLLPzFBoEiMwqOLg4yn3e/suSAhXG2/z8BI93GHPRi0w/MgnubCOln6SqNjeZcrFA/ouVIi5/cFAtW+kFtdSynBeDEGfwOVGUq0+ekX0UKS5Nv3Xp0wxkmdI+MmuP9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843276; c=relaxed/simple;
	bh=iV0DB1IMnoBJFnSPG+BJBYj6LaiitsOcMqjwyNRMcSA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rypmBDKqGg2e8njMFnE73BPt6wRU4wwO7v6JXO8T16hWXr9oV76Fun3+ScBxFtvyvUGjSovjTVYOA5hbenlxt8836icyTprtg88atsok43u+J1tmBOa5fpO5kfmWr26eG3e0sKC+Ik3tnhYvlylKZ+T7W9HDwvqXwvNHXKITmNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0C8C6bU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0C8C6bU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so11904915e9.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784843273; x=1785448073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVBWHG8ESuMad3qr42QTUda7Z4q11ujZE8cB+I2e/yU=;
        b=d0C8C6bUTNh/9oG6a1caj1XPTXLttCiqI7KhBzk8XQKS3iwV1Tb8IF2Vk+TZC8xV2S
         acSnI8QWNHa7sOT8GMkXpNGLcRevcH5KRm3g/GXDBYGn8ZHQXs3f8tWWnYoHJiSadOSJ
         UAODMeIL2zKCqAg8oNFrkgikW7Lc4O7vezmkGRmiFwg5j3QjbU9AdGJMQeVaxLnZr0qn
         EHnWHbfbMMfOONovUYZT8q9qtkUOqLZ4IYbzbxRait5sSg2zET0QjkYm6Rpu+312cRxK
         E5yFwLgYx/D44RGGyHerUONIdzxZMuM22JKE6EnpF4ZYUd/Q3e64n/xpM5Lt1+APVgS0
         SAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784843273; x=1785448073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVBWHG8ESuMad3qr42QTUda7Z4q11ujZE8cB+I2e/yU=;
        b=Czle0450DCe7xoOHRteHq3YBGlopZTBZGBGaoAgmOUgITnybUsrJVOjRUdSWsBNff/
         pij1aBgknt4WRmJDD832hSEtn4i+DX5ARDD9lrFdVAZlbLBeTSpB+gcRtM+oPOkWqHl1
         InPS1L/eYeIGq/Aw679NOM4vnJy5MG51GrDABCdLXZRLZFszV485TN5/mH+JR2254a0e
         7vggQUxaFHpDS6w7ca8yFQN9LxSGtWDBPe/AKTd3XQC9duZTrmWsEkqR5fhJ8Lg9llZ5
         Lx9I4hMQ26KJ3DetCCeE+jH9QG7VrF6M5cMgXqn9KGpTe/jfCN7L0RKJgePCzVymeTeA
         JvzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGExpK9yM0/GWoIvDc+DGlyw/OJzq+6DUfqaJV9VFvaAcEZ6E/symWg2xZadUai4JxY2SC8WoCpOU8@vger.kernel.org
X-Gm-Message-State: AOJu0YwCHpfg0Pfgm0itPSDweUpcu4j5ZubeK1jNyHsWFukVfL4bsFus
	lWuLgv1cgu5t3641kQXxYwgj48zvJ7sYAVcO6tyg7ASXcWbgvM5dYX5V
X-Gm-Gg: AR+sD10PuZq9gLJtqoK0p3BvMt/euSGvZ1xZzbOGz4KTLvecKDsN8sMsT/d6Aoqv8JX
	o8Ff0TqvzYFLT9ZVBycDDH1ef54t58olD1YNhgBfFosgsvtSyB4UUU+2ieFLl+KKuVZnxJc0tix
	Kg2iDqwQnK0zr3cQ+DBQt4EX/lE//J8Bg9Q1dnYzPLwOPZsAaBRIkOVDaLh+vk559E+Ub5UvmCC
	7QgGGhUwMe2471sPagzDndoaGeIjacrmMUkyv0Od8yDdVtPSuUJJ1oupNyLRDyQBby6QwXds1Eh
	Q/gL7ZyF3NaPezhve3RVDAjkOynVqNYmv2aBLkwzhxwLYfFJHeA0+hihbZs/iIj08Uo9v2UJP8V
	+p07fWrFRdvKPdmxH2dTJvKttas6epZj6QT9hbkD4+gB8+Nb4yNNvPg7hPLjiyp/8lom/8Jggdf
	ffAJKQzxFfZRGbMr+HXa0v40yxytbYjqaXquLmkzAG/0p88KqF9M7GZmLb2XwIBf/oofNoEhJ8X
	dBYZmOMx9tmWMV5CQJ+n0KfnEyKPr1YBl7oiWCRGL34wUTTfp5v87OnNJXfQuZyKJBqkZioI8eq
	fuZmlDS9T560tP+PQA1AsHU3BvbdMx5KFsdinNpMBTo4l/RFD2bpEABukjpnjxn2mZpr20CuWfI
	K4l5RvfrTTqE=
X-Received: by 2002:a7b:cd14:0:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-49573cbfb7fmr37428135e9.2.1784843273372;
        Thu, 23 Jul 2026 14:47:53 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bd9bbc4sm13559335e9.3.2026.07.23.14.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:47:53 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:47:51 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
Message-ID: <20260723234751.5ff138bd@systembl0wer>
In-Reply-To: <20260723-gp2ap070s-v1-1-b8ca3a4c10dd@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
	<20260723-gp2ap070s-v1-1-b8ca3a4c10dd@disroot.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 22:58:33 +0530
Kaustabh Chakraborty <kauschluss@disroot.org> wrote:

> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
> Corporation. Unlike the other GP2AP* schemas, this is strictly a
> proximity sensor and NOT an ambient light sensor.
> 
> For power supplies, it expects two voltage supplies, one for core and
> other for driving the infrared LED which is used to measure proximity
> distance.
> 
> This chip has been used in production mobile devices such as the Samsung
> Galaxy J6.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---

...

> +  vdd-supply:
> +    description: Voltage supply for the internal circuitry
> +
> +  vled-supply:
> +    description: Voltage supply for the IR LED
> +
> +  proximity-near-level: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

vdd-supply and vled-supply are definitely required.

-- 
Kind regards,
Joshua Crofts
