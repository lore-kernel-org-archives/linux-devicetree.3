Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517063BED5A
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283500; cv=none; b=aJmAVuwT/ToCpdw5Wx0RE1jl5JyT+5i5ploalYYOUvHOw5dKKnuf17igeEAKmbDJlQt48pO8a8ypwWsjyZOfYPAOlWZOoxpijL+SM42Wghz7R1/AZYQGXmfF1OsLPM90sBfnkkmFaZ/CGZ757UVoe/DbVBUfgDU2Y3GHPQfHsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283500; c=relaxed/simple;
	bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=NWDG6i0DT7z/kMSh+fP+nngJPJMwqdXXMUbkQGM/2+8F0+5tAlS75FzTeoppoUiC5UBhTKwq9G4IKNe6bZ47LkG0G8GPYc157XxU8zpsKerAQ1s94iLEjZJX+ddwh5iXiaR88cfALspGVTe85xyNQDzR2ITZDTyjblTU+3tY73A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R57vMpK6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R57vMpK6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so25533255e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774283497; x=1774888297; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=R57vMpK6FvpMXIPOpwNGKnZoODV0+EbqrYMiZoJa9JrWAixnFJLZ1CgNffQNuG6rHt
         HwYPn657FNzZeTyTGgRdyr4UaZHH0TecHiNm7R4GL3drwsMG4DD/F6rzZZdJkQop9DOX
         FBbqrjA1tG2GQ7lR8qgxf1eJAh5QFilnWR6qvrKqaTly8h/aAp3RoUjkm/OBk4Xi45zh
         MB8qGvGVMGkDlqtcAkEz6HN2btY30jpOVMv4lprBVGXRowFDrcwx+a7zcUkUnxZxV2Wv
         +cZPqyMX3BrJwvaRjLLkTAOUqCDXT551g7cgRlYjmoyF82xcE1OU4+k5MlJWKKk9P3c1
         EJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283497; x=1774888297;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=DRrcf7QKt1QEIz+fFdae3eQJnlqPEgUwTyOYx53FfJfUYl2oTGHqi3EOpRbYc1eyaq
         mamXjN9dUkCMuZskjK6s58NHd2GY02g+sqhtpkFIKpVgRwsADvNjAg3MBZrwwN14wU2m
         DwLFh6kodwIewv3fE/FzY7A4BTPedxI85lE44bJhugO6Mz9O+Cooh2aqPx5jOws5gPXO
         DujTTbd8TtgU5ORtMdX4wgEfRgTnymxWtBnBqiPrUXw71KHy/q4jFtrHs5C48DLO7e3p
         ylaTHq1eq1YTdC5ue2p1atWl7DAEQixW4uXjXOXuqdN/cHhAMlPK3KB4PWjRD108pB1L
         mVug==
X-Forwarded-Encrypted: i=1; AJvYcCWcES3rSIF9q9YXdw7nD5b2fwLT7yNCRTTXeHIe8YfuEe/CRhJtmf8YOc1gRmocWjhke1MKYiukDpA4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9R62yqcEylg2sk8KCn0f0f4Sk5D8M1p6RSfNNmfJX/Kt+9Ejz
	jhEfk5972I4LE5DNkG0NWK9wfF5Qd6ldM2P+2gGILBzi5NJohPhBAyy3ZALhAb0Z5sY=
X-Gm-Gg: ATEYQzwyxW0tbPOKnlxuc7kyzelJ+7PjKy63EyyS+WAfwVtOugOJfxukYXyVQsIYrN3
	VX69Na4re1adxULRGnb5FswaJ1z/9dJ63z3XZNWn0of2Q42bZVwVEG1fXM2eCTqO625ihs9f/20
	RgPOopqC0sV3ESixAQWhrqUb8ottYuTizwbL9dA8Neo8/h3ZDUnkxs1sqIYgYibsPGeIpl1X+uO
	BKlhFsOlaA8ZzWKBnH5TzhgieKR6nN8mnHRn2OTQL6+VnWcfCYb5AeBKLfnXgtowOZVdQoSRJzy
	jKxixLDt+WPNCUXTdGjVPB3eodhOS63xHTyvvu9/GCfJa43qcGjYl6pO+in+CkyjjeT9JX3pygE
	VHdjCCw92Xdvs1hOQ/4CfvOFb3stntZ5SsGy5FEnwt01za+nwCR8PT5hC9T+yiXCj5Wid3x7DLm
	cffjVueGp+Rvm+u+tCmhrziCDUZo96bhicA7MhLdaWc28xEbQ4Mai+1jfHSjPS7AUP66g6hOyvM
	GSHa6H4VYLG
X-Received: by 2002:a05:600c:a4a:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-486fee1ab20mr149439885e9.23.1774283496632;
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700377b71sm121384715e9.0.2026.03.23.09.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:31:35 +0000
Message-Id: <DHAB093OVD2G.3IO4C9P3ZI8HP@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "kernel test robot" <lkp@intel.com>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
 <202603222239.JTuBxs7K-lkp@intel.com>
In-Reply-To: <202603222239.JTuBxs7K-lkp@intel.com>

On Sun Mar 22, 2026 at 2:15 PM GMT, kernel test robot wrote:
> Hi Alexey,
> kernel test robot noticed the following build warnings:
[..]
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'

Thanks, I'll correct it in the next version. The warning is a bit vague its=
elf
though, the problem is comment that describes the mentioned struct.

Thanks,
Alexey
