Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF3F3F1ADE
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126568; cv=none; b=fPj4RQnDaSAtMLEAmIj0bAPDw0mESHCL5B7ehxBGHiU9iSoyOkuE9syicMpS1prUdnCzEXsHoGuefW3qAmjhhnSbELtcFl6nmRSpOaxQABZuBpA9n70LVDywy2d98IfBnER6X3h59EkYDJptjTSREpOyzL0ntTdmyTamMz2m9jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126568; c=relaxed/simple;
	bh=ES/kxhSrcAfYRfK+7CdB1VBngwwtQV8QNC0XOOovA60=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ui5YXXib9qlzXRYNxBLFeORJoqStoDt8DJsnj7pSDIQBVBlEPAUGl98J1LsKLDhGhFgihkupu8MccN4NtAf6T9pOckBNldknNHlLo1RhBhh3b0Ol6Mam29P4nEaH/oD5oudEFT5Poxz5XhqfexzZ8zvOf7y/IAybdoCUKCuOwG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5JuDnJh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5JuDnJh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f71156e1aso298351f8f.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787126560; x=1787731360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n84akRWrYp771T5DP5M0T4nRXTa96uuJHFpXgEzxzNU=;
        b=O5JuDnJh54+KFZrENN9G+H1nPoE8y9FDsvUUsM8q2HSs4skChaoXW1SR09MFBKY6j0
         Z6aQs/ym7lk9WDzYhWTKM/4vfvz+NY7oQ2slRdJxSa1BCwnyfhaOCs+QNXFIBFt2hLdk
         C4xt7b+pQQrPGaTTDAiIlFOhrIs3s34AVJzGTJXQvS1uq/nYY/hYs2etBzQfb6U8lI4B
         vLv9mUxpXupXrwEvUrgaXWPCT7y70CIzy+Ho5Zx/RkdCSoYutzaGM8NyMGabru8W1mZt
         ifw0CQsi4c576PtL10vJk4AyZ+ggusw4tSTFHk9E4NUPzHMgQGPQpvQrRWQfcPHUjkp0
         hbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787126560; x=1787731360;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n84akRWrYp771T5DP5M0T4nRXTa96uuJHFpXgEzxzNU=;
        b=DSUfLLSFx0KAt6hDsJvemNuYCmh80AuJFRMPUJMDjkgDeoPc4TzvVWJOnrfafj31te
         /uiONGsdMPTkY8+AbR7gsyEy6YR7MUodF+GqGfI+5b94dAjnPk6iFE9T6QvApr8nB67k
         Dh5+7vTnD8aiQkQ0UswPy669rVwfPMcrNi4QQWXlhptVcKL0BZk4CdU/fS+E0Sfow4Aj
         q5MY3t8gUKWgiX4Rv53rHzhVwaKXIh597Brr6kow1rbvpCnKoWwi2NZkytJ4D++MWDRN
         xa9C4KzwAM+vDbE+uESaLTW/Fguax04Y2pGBTSH3qoGRfptJsTSnR0XaDqkoQmkTFrXM
         MX6w==
X-Forwarded-Encrypted: i=1; AHgh+Rr+jJtT019ccrwVwydPqjkSaD/hYbEkiswEfGc57xWGXm1M23YXDKs2ybUiMnBwn3ry57csA6VPyE7D@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mFHnt/iKl5hInMIZe5WKdma/UBOHo+r18R/JB0as4X9KRNbi
	wYUFdM2PFneqXSOt61L+c6CPra06azifv7RFTxz9DSl7JXFIp8YpKjM5
X-Gm-Gg: AR+sD10OrKzlbf7R3qPANgfwgyY1QgSc3d+R/BzIgPYPs0ZrN8xYPdEV8f262OeWXqC
	GIXyy2YiDgtwFxKMqjM/hlEZEjOihvaARqghKyfdfhByTsiwzj9BpJZM89M4IucGFlL8edV8M3p
	9caBTPkWLGZ2dWpOvyJvxZ63gm8FGBMIFqxVmatn34mAD/eNNaXbC4xF7irzkO7qKXSFp0qtAtv
	C+yDCN462134SiDjpDNpbT5InDNtTiMNn+je0pBJISzGPSpe2YljmbD7Wswo9QMsR2boTOINCNj
	cUAVU7eRyaQ6ejD/j02CA5kBjipMjB65gdn2H7shOQ3wF+0XMj0aVthKrDaWfqM8wiqzBfZXQEK
	dbkCuNKLNlhCNybu3VaIbdd0MfNJbOgO6/rqRTxoxPhNulzAFk3N8HU3TdqpuIdfD7P6HwJFST/
	hIgEAtlgP56M1dQaN01EoC4xzCAhTXA9nWgNSy9+VY2QlJf9nI7qv8wgbzj/J92x280CnD6uLZr
	n36+ydJtVTCE2wZlmfAtUpZ0FpqZh2Swqnv+ZVnaTovaDI98bbgaFbS3Fz1W01kBVJetjhq62gK
	6FYCCJguOqaIRzpJpX5w9CDY/Zeu5RsmObn6Ug1YirItX8JskB7bQjZs1Yvh8Kn5bfJp7xEXaLq
	vrUDlR10ZOa0tDl3IyyhjsPlP1Tsvm23lh9uGHj/2Yzt9KYXRkXJ5y4pM77mNomx6ESt59g==
X-Received: by 2002:a05:600c:468d:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-499aa17d5a2mr43992645e9.8.1787126559565;
        Wed, 19 Aug 2026 01:02:39 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9aa3204sm31743085e9.0.2026.08.19.01.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:02:39 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:02:34 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Vladislav Leonov <vlad@zlab.su>
Cc: andy@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dlechner@baylibre.com, heiko@sntech.de, jic23@kernel.org, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, nuno.sa@analog.com, robh@kernel.org,
 sjg@chromium.org
Subject: Re: [PATCH] dt-bindings: iio: adc: rockchip-saradc: Fix RV1106
 compatible
Message-ID: <20260819100234.0000355f@gmail.com>
In-Reply-To: <20260819075921.14356-1-vlad@zlab.su>
References: <20260819085255.00001e60@gmail.com>
	<20260819075921.14356-1-vlad@zlab.su>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Aug 2026 10:59:21 +0300
Vladislav Leonov <vlad@zlab.su> wrote:

> Hi Joshua,
> 
> Sorry, I forgot the Suggested-by tag. Should I send a v2, or can the tag be added when applying the patch?
> 
> Regards,
> Vladislav

I think that Jonathan can just add it while applying. No need to
send a v2 unless explicitly asked.

-- 
Kind regards,
Joshua Crofts
