Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B584E33F394
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 18:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561198; cv=pass; b=UW8v1KqdgJsXHyfSpP7C3/DuUPKfXnEW43MGrrWjKenp1L2tWUIi6UR2V3h34aXcHJeHHfHH30CF5THDjZy3Fo6pIo17CUnKhWnO2od4dnqzYShpNFaCglPwT0B8PlqEmzVdtM5JAqBxuuOXHcTtQ3/bxDQ55dBBcUSwiS8ER6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561198; c=relaxed/simple;
	bh=5YpsLrQd66mt/oElMkbWRCNsoeN3vBlsEy3jrovT8is=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hfnVHMn4xiQcnJayhEkKmjU/zjmqGMrAtS4nJxyPqdQ7yi5uagW7C9GOHqHr3NqywJmaenE2p0lW73vmHLztGcrdukRQOpKeHPbSO2EQ+V8ocvYyUU1MsUhZxfersp0ePT/1Ow8pPhkYkyCQu4BjyeW5KkECW3V269aAeW9OG0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtCHCBM4; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtCHCBM4"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c166aef4f02so79623566b.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 11:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786561195; cv=none;
        d=google.com; s=arc-20260327;
        b=aEe7cKai1UiN2U5/6Shgne7yky0dzpOpBnwsdZuQoUU1d+PU4+W/xiud2vOk+OcpA2
         XjBYgG/dSm6R7K+y8I0Hb5kfZUjg6M2lnCsadTk+lEvaxWySsmKT6UUakwVLkjAQIlOu
         tzWFoFZ8ngI1oUSTYG/W77UHtS/SbeZSWAXhF4Cu2P2omZo7fC0XyeqsNLxaAXsckLMx
         vBrqZpTrxPchzT/OvMMzSwSJgTf+QpqaDAN3v9uRFY8Kx7VOWBu7yBq0qa4VXjKw4A+W
         4ciQ3trNCN6K5UAninSADoe/addVg38nuyZbZNOhHvP20K67Ol7ACxND49W9gHkhrp0Y
         ze3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5YpsLrQd66mt/oElMkbWRCNsoeN3vBlsEy3jrovT8is=;
        fh=E5sfXT1cGmAtwuSmmSW0kNAVrNynQE0VzG6WnWIyhSI=;
        b=ZCZ4KJb+oWz41MjxpY/U25wIdeSZ15J/dNKBCUX3Qf/5BbFXH3SEUJWZijI2dE87sj
         E+bHx86eUMt3xEfCgeDft4DvhU3EUTpjvtFWERpP8wNamWGikqu69OqcK78hwr9mE+Js
         3GX36x3Kk3LpmzRwq0Wp24bmBjE4jqIiU1WKll8fGg6xayiYUHQ7wRTbOwfXZEPc7ZD6
         qxnRQfHxbu398hoOX3lSWO93GTbzLeQ1vHiVAed0nvSem6+7nhMpiCPdui77ZNYemzVF
         bdKF0xOUPjc0h9tHW2/7Na+JY5XelgKypTJZaHxaFuo5gX3HGtdvh6Ei99PJ5Wq3AtNZ
         zkhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786561195; x=1787165995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5YpsLrQd66mt/oElMkbWRCNsoeN3vBlsEy3jrovT8is=;
        b=OtCHCBM4LiYOH9ymaLv9fpa9fKBO1JdzlD7hoVceFgPUK42O7WbaYNSFj9ul1yqbOu
         IMRkkdEF8t5IMKZj1uqEhJJzZNlhKukekvuWrd0zfCIbZmOXnU2ZKAXknHnxlMQ31/R3
         PNfzQbjCd3kbGE5gSq72bzmnOk2COM5qLhJ2bSrt08zU6776j3KV0kW/wP4j6TOvaM/K
         BaZf0D1QVFl0pcVxqAvLyCkwY0eoRLHmyjdikZ3nHw54fJBeUyN3wMycfabMoee52kpY
         N3hizElaCe+/GHWj1wGvE4EEPmSLplg9ZSBUO8jU0J67Vuwfv8VqhS0iQbYwYoSk59VQ
         QOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786561195; x=1787165995;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5YpsLrQd66mt/oElMkbWRCNsoeN3vBlsEy3jrovT8is=;
        b=Lxb8JBtAbK9kGJS6p/AXeE2YgbsTHwoEw7d0bcBkC1jvTxtxOJgqy0LFx6LdaWW0/9
         I3nhqL9z7hWl7VCym50+7/lIqgr2Ki1f/wFkFTzB5ZTvKAeFMxBRVx1TeNiZ4mfOZ8cw
         IZXq2SPnnChARQulzFqWWNtohmEAEcs6RBif0fG+gufx/HNi1WmX8dXkG7jJ8TJk/Zf5
         APpwfYqmAPI7AuKYbos8kkon0Ssu9fUQwYALTtD5sxkTERihk4fmf599k9uqgK6KdX2E
         4xsoivM0Rz5YHX5JiGmPZWzThaoUbOH2OYkaK+EMkyFZuO6FEls9qEOOLjjleSDguGvp
         uAMQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9LtDulL9dBzNd1TcvIy7c9ogITHCfFEMrsCDZ9QDmzY/5HoJXGqbb+vlppxvWaa0cZ3ML4mIETVOk@vger.kernel.org
X-Gm-Message-State: AOJu0Yywjk+GsCwfQXDPudzLYF3QvybeBlYw6rVBkDKHMJxjybG5wIXz
	eXi9zBTGpfdQqBFm19QhucwpiPpolPEdjmh6EccsjJrHqzuSId2vNAiB7vvbfMpURB0HoZaWl4D
	1IPtEGc5+79iab7OqG3SgjMF272x6JBs=
X-Gm-Gg: AR+sD11WjfoD3YT8+0WV5LsFheKgBQoVSukkfyUdw5j1uPu26kwc2SgUTo8a/F85DAV
	UusiYE6P5pRfGib27TDBVK0MTChmUyGxlfHeiA78FV1dlhbSO37lezfr+LepsELtDdwyGlfUg+m
	ACZf5TAQBDe50LETpQjv55UlNNusUkWI8LZxK+ImrK7GmIWGq91V/5o6hQ+IPcNHdpy5k3tmHsd
	L273V+UvCYrMo0d7J+aPKJoRV/FzXxHHYLuacjbksaaddTwmiWzfwfNaLouObWxx5BMBxM0Txen
	pfQ5jMxBu6RTCqGac4HR6x2BqVo9cVcCRERX0YeEUYs5
X-Received: by 2002:a17:907:608f:b0:c12:1651:17b2 with SMTP id
 a640c23a62f3a-c2108e5bfb5mr20737566b.9.1786561194813; Wed, 12 Aug 2026
 11:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Shehryar Ahmad <shehryar.amd@gmail.com>
Date: Wed, 12 Aug 2026 23:59:43 +0500
X-Gm-Features: AUfX_mxI720OVCqWCabncilafTVACGGIMPo2NOHI0XObuFT7-5YQDH77NnxYQqk
Message-ID: <CAHR+CoTo3yX=1-pfnkxu_UM2jXx0Fi8j6ZU6T-vRR4Pgb95mJw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Move adis16203 inclinometer driver out of staging
To: nothingchang@mirrorstack.ai
Cc: Michael.Hennerich@analog.com, andy@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlechner@baylibre.com, gregkh@linuxfoundation.org, 
	jic23@kernel.org, krzk+dt@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, nuno.sa@analog.com, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sheng Kun,

Is this series still being worked on?

Thanks,
Shehryar
