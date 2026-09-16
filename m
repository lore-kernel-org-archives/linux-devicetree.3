Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A544AE13B
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 22:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596445; cv=none; b=dJfQtTqfbIow2NomDYF/BLOOVZG2CmqQbbx84WdfGFqoe01K5YaZrz3MOn3iWg4e7Nh8lXm4+Vud2vA9dvxKXcGQWlj+/D61xlV/1cchaLx5bStFUHg2ItgEG64EMK+iz5eMXKa4kTfrHVdIp/lcX1umTGlRPCTtPKQgWMeeLE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596445; c=relaxed/simple;
	bh=lt3BikJB93Zkg8UHHA0fVUsHS8vy+oVkjtAS1xezz34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJ4HvWh9zYWjS8MJoVsfD4M7eT2DetFK3uPYamgORip1GYspwS/qG0Qb22fE+j5zNy572sBG7l2VwDfcIzQ9BJfLcKNazTI/o0h5IdZUlLZMn2qIhIrykxsbK1v8vLZ0P4Xr+ZgEtH1xThGnzDO9K4HZ0jK71d7YxQKDTLG5MaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P8cuQDqc; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P8cuQDqc"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so420824a12.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789596432; x=1790201232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRx2j1EfmgsLJaRhKgwq7WbmeY6pd50RmhdABMQZV3M=;
        b=P8cuQDqcdLgxvB/k4fnsPuJf6rZeriFLX6hSwdl5x8/MCWrQORfKyhPpas+RhAJZbI
         82qYEQO3cqMVPVqtGI/g/YMvApkaHIdCddTlbDTUBDUifRUya6Koldaq8D0KyIdERRyS
         3eFeO0wv30j7EF5wqCliCO8XKwZokGCFhvpE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789596432; x=1790201232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRx2j1EfmgsLJaRhKgwq7WbmeY6pd50RmhdABMQZV3M=;
        b=jYTjQ5Mftq0RKYTOuRvj7RRD51OJpHzxHrdRl9n6KqKKaMJtinlullnYPPwAHuZsZl
         iJwPtQL04eGk66mTdnA+0pbQv4asqBTkeY38TiQzsuNgHLFCoXrx8RM/I8HPBAsVtPWn
         ErQ9UC2hvJC5PXL1g49jVgr7UoVjFY88SD1v5NC84qguO0KPY5ADPxQEyDuJrT01vWI2
         gs+AeoVsDr4ZOCumSP6FnwNjpM3NhyNglevx8QSuDrutrtb8YEvwa4aj6iNGOsDCMXtL
         rEDEcbz8q9bBBh2gKYWpwcVSzbowtqbIzHsLFRo8lECfxxPOx8VF009m9qC0rw/ZUG4E
         MKNg==
X-Forwarded-Encrypted: i=1; AKwUvBydmqGReker7AjrxuWIb9qHLHJSm5FraqRAEVi4Yc8RWuWJYqhp4b+bGCcO7qu4Vd1OVfjKUtS+Xg84@vger.kernel.org
X-Gm-Message-State: AFuF++k3MtEjyhfXk5h/f/RvpT/WG/S6D/5xry7Cc4Ifd65nVRnov4Bw
	SmWWqENnQ4JFofRExWp1RD7D8aO6WtQrqkNSLvUDEsfpMKcJrhNMFvCYRNQSqIGe+HACUAoIvPo
	vFbE=
X-Gm-Gg: AYBFou3nbmvAOmcT/W+t/6V+RoDigVNa7UHP8JZWtZUffaOs4tlR4H1XE6103mxwZpc
	zRHDnnm4y8VsncWOlB3CXMMP6VfJuRzNsoFBtjU5LybCH4Qip8tNMV82Ogl6nFcFKgRHsD9rYQd
	6qhKRovfP9KQNWcGTWO3cWp+btzG18XAqQ1iQCptBbKrWP1tduGLEpMcYL+SfHidfjiKg++7EVS
	pcPZto3T/9kdLTtOxzz6iafIMCT3R/hSgGIOOCJd8IhCY0U9JUe6mnC3hY7/YrkNHjo82jfWjrd
	K9+DxgKzCCBcVoQstU7+W0Ai9lwqyWmIuTkCDMPN3ZOO2L6TIea+M9dA2V2R1nNEnKDVOTEgqB8
	4a3ntCXN9Y5jEdstQIZdaf8/7cUp8WdAhktLBlIp+KShd79L4J/3ZRGzlNpCgiojt+/10xeKLwH
	BuB0MogXm8Li6k5jJ2DZllKtCqNcHCSQ2MZTN0+nobLu7d8tPoqA9Yhb3T8KZFyEhU1SqeZwqwd
	UmkfXye9jFdAG6SjY52DnEeN/2woxMJSYksUGo=
X-Received: by 2002:a05:6402:a0cf:b0:6a9:cd42:eeae with SMTP id 4fb4d7f45d1cf-6aa224192damr5942733a12.15.1789596432357;
        Wed, 16 Sep 2026 15:07:12 -0700 (PDT)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com. [74.125.225.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cfe037esm2653796a12.1.2026.09.16.15.07.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 15:07:11 -0700 (PDT)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so1276035e9.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:07:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDsRLZBNHVoLz5m5Q4WUrohE0HK2c190QIoQIXwoRbDz09vHaTC0S3Up0flO5HiSru904PjQf8GAI1@vger.kernel.org
X-Received: by 2002:a05:600c:3b0c:b0:49f:bc28:e8b1 with SMTP id
 5b1f17b1804b1-49fbc28e978mr56379705e9.14.1789596429113; Wed, 16 Sep 2026
 15:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916155730.2077434-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916155730.2077434-1-vulab@iscas.ac.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Sep 2026 15:06:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WU7yOQWBW4SEMcHTwXxvNTMqO4P0DABaeQ6mBw7h=+Bw@mail.gmail.com>
X-Gm-Features: AcwNN1W4bKNukAgg1BwCpMhcUy96SsDz__HwTsvy2JJtukIrTrTDwRV8nOIqNGU
Message-ID: <CAD=FV=WU7yOQWBW4SEMcHTwXxvNTMqO4P0DABaeQ6mBw7h=+Bw@mail.gmail.com>
Subject: Re: [PATCH] i2c: of-prober: Fix device node reference leak in i2c_of_probe_simple_enable()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andriy.shevchenko@linux.intel.com, angelogioacchino.delregno@collabora.com, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wenst@chromium.org, 
	wsa+renesas@sang-engineering.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 16, 2026 at 8:58=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> of_get_compatible_child() returns the child node with an incremented
> reference which the caller must drop with of_node_put(). The error
> paths release it via the out_put_node label, but the success path
> returns without doing so, leaking the node reference.
>
> Release the node before returning success.
>
> Fixes: 897261149d25 ("i2c: of-prober: Add simple helpers for regulator su=
pport")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/i2c/i2c-core-of-prober.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-p=
rober.c
> index 6a82b03809d4..603de487ee2d 100644
> --- a/drivers/i2c/i2c-core-of-prober.c
> +++ b/drivers/i2c/i2c-core-of-prober.c
> @@ -354,6 +354,7 @@ int i2c_of_probe_simple_enable(struct device *dev, st=
ruct device_node *bus_node,
>         if (ret)
>                 goto out_disable_regulator;
>
> +       of_node_put(node);
>         return 0;

Sure, looks fine. I guess alternatively we could use
'__free(device_node)' for cleanup, but it doesn't seem critical to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
