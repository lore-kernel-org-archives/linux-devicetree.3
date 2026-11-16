Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866434;
	b=gf2+a7mPxnxTd/ORFlA0VFD2Bwj6NvENH1q78Z0XoxfzW2KqSaG76zlkrN12LyhqhAY9
	 S5+VlVEUNVOXTvOLi8Zwu6qjaR90r4joL90u5VKuSBX88SBFPp0gCQnBs6eSDkkd8WW2y
	 JySg+wXQRtRrCDbrFPKjVacaDcnrBXBF/MZNCNgD8WfpJE+z5dex3fr4ARgAGnQPNpjh9
	 8cHynR3oPeG7HB8W9SQj5KufGXk74QHGbz7aieAbq5bNs64c2/nDX26rj8rainnzTI9Z1
	 8Ze27Nu7eYHZOlAXao8cJpebK001I4LwM3JDwf4bocxa+CN4KAd1hEiUgqva12Y16Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZqVAm41tblC8KUx+ymwmm9M7gFeW83F6GB1B3bf8apc=;
	b=dVQkGy8GpfyffwbNUipTEjrwZ8s/glz4OVuL1SbWA6RsOoToI3qeGgOKyC/uRoii5pDQ
	 k4lzKyTSbQoT9Qi9a4mLKo/erp9b2x6Fa/CZHz1RJ4PjMz9cwvZ5QFrpu7cH1GCzKpkzy
	 8H5A6iTKynmEIVOMz/zxCz82sZnupxo4UTW86Ez8n131M/LeRqjeRlL9+x7Q1wvsBxq6c
	 +m8ME6LtwKvW1f0GLwQUvPTiCcxaZdjn8Tz0HkABnk+FUIheUiiP1Jlnqb3W98WqkxEmG
	 42wGpuMRQGLy2uuLosB7McsImUYm+Z4P5xIwbeXzMqjvGKbeH6+TRzy6AXFtTI9q3gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irxqm7Hg;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA9A606A33B
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA9A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irxqm7Hg
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso25619565e9.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866431; x=1795471231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqVAm41tblC8KUx+ymwmm9M7gFeW83F6GB1B3bf8apc=;
        b=irxqm7HgplpcN+02tbKqEnRQeFtC7Ge5/DIoxIwH4O6Ve1jM9FFI3qn/zjcV6Xm7jC
         t4R5mH8o1QhJITlPinuIUXzYvTsoQXhJZD+9qelXZLRkj4IXjV2s0vvLW2ClB7B8jce7
         eQdnaIli8BZcvDSYFXYD0SRcmL6OgJBYVjzY/FNJFmNPpyOmdNa/oXvxKAhqIPyedeKq
         o8xqMGBvyQnA+hDSEbzI4zpb3KWHK2gaTQ2NxA1jQGhZXHFY9b2sHFqdnOkwK2t+/DC4
         t9yavAvb3b9Nksi+6KeBKJa5TAypibfDXyjG9Z8F6IaHAhZMf/rmDFyoB5ngTdjH2dHl
         d1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866431; x=1795471231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqVAm41tblC8KUx+ymwmm9M7gFeW83F6GB1B3bf8apc=;
        b=KdttyRggebGXvBwJhhFCOHgfa9eg5Um9XdUOjqzlgCLPJ7+2jM5plkMCkr/E3PAWDR
         HRY6F1Q/JVtj1SzuCgCyFEOZ2DmGrO3IpzX0L73YTEaU1PzCihC6A5MS6sWbIpz66O54
         7aTjmCJZqaDVPE7VO3nTdvnNR3wgxZzwvnH66NEudt/Kff7G+ymd7GOCJKWhjXJBDF7y
         f41IhMrXvW5DmFUzF0jRwjGGSgctxAlx8b0HUUjDS81n+J27p9IsX6AdSrdOxWIvv3vE
         3nalaI1f6GFA52DlrYdkAAAn4MFwMl3jQqar+RHs4doahaRvoXJ03P9TYfFys4zA9FPC
         TfKg==
X-Forwarded-Encrypted: i=1; AL+hErHEurS9R0DduP5/gkPZKACMzuXiJamT2GPZevC/WWvVq+P8NlVXx6uADVpguCe51ci1fBSUZ9ZqOHA4@vger.kernel.org
X-Gm-Message-State: APuU4Z9rNLUb5Lh6cpQgW7gfSQ7PZ848OniG1OjB9VCHucso5X1xuPFF
	LKSp/VhiK+WZDV4z2bpYdPfK+Ttr4L/Cr3RsQDb4xqYYJxgCPT/G9pbi
X-Gm-Gg: AYBFou3EUY34Bnia95vAK86Xkz6cQIG/ZVHs92PYBtDrDTX4H27IE6+e/93CrNAZysM
	NQXIFrYiEUVBfb8TJJfkYykEet5+41Q7DwCVMepM0o1Ug92witHrI4gVsgL+OHeEB6jlVD5igLX
	YGp/orBdUZkQqe7G/6AO4xmutAQSGWv4NON0G++Gk8yvQoNbCjQGlY2qDQeSpzufBQcLCA7ZBax
	j0eKp5ejLdiFYZpnYeUMjD+0qIP9anqidgWjo2n/bMyjhanSzAmAFgjyY//9b1xTVDhRSsX5rqz
	P016cZ6qUDYbBoa81IpfbEOHCSjIe2jcR/ngTj1XPrc8OhgSfD6iLUKmFSeBOpB5iUBOWiTjPF4
	KGnDcAaDKw02KDsOvOOFPQjWLtEXIn5hDo5lzCh27O5R8EceWPfGtZnTZ0+C/+scagGrbP5j00C
	E3aTDGkoyUhY+xqC5KSnRCop0NlDwVb2SZj5rJnIDQ+5z3ceZDiO2YojuoTADrzR2RrWX7r1VaO
	Ou9znGOjEK57wF8O2FuJ9XLYEox+seXmAkisfcCUVg825VSgDpz7cATrwpsdqJBg+tX0peO7ozG
	3Pxm0d6x6Z6Pw8WunpciQ0Gxr54=
X-Received: by 2002:a05:600c:8b34:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4bb559f7039mr250487985e9.3.1794866431031;
        Mon, 16 Nov 2026 14:00:31 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm25960175e9.2.2026.11.16.14.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:00:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 16/16] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Mon, 16 Nov 2026 21:59:55 +0000
Message-ID: <20261116215955.3784340-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-217738@kernel.org>
References: <sashiko-outbox-217738@kernel.org>
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

On 16/11/2026 21:40, sashiko-bot@kernel.org wrote:
> Does chassis-type = "headset" fail dtbs_check validation?

"headset" was added to dt-schema recently:
https://github.com/devicetree-org/dt-schema/commit/bcb597bbb0c988b490fdd6ed08d023d6ddc538b9

Stanislav
