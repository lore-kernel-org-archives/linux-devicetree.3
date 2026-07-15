Received: from mail-ed2-f2.google.com (mail-ed2-f2.google.com [74.125.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F937A82E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784147598; cv=pass; b=mA6CWg9IDjzm5dKbf7Brbgx1u54pJQNG3Ib5txWdcxATqwzz5jOz8sXgOwKHhAPCQKn64SKN1zRB872BbOnv6Ngr2sJTnIhWA0NoKHPQs7H91tQtll/hOJ4XedcvrNiE3XSCXN5x+rf0DRPrVDXJ6BS2caLlvkIVNaLt99D91Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784147598; c=relaxed/simple;
	bh=HSzxeZhp2T25IO3LQKbxthYfzo4pgx22m+KFKX8aCQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+oZxykkicmOZZY6bE9kISHwBOSPydOqzK2lkCU7wdpZtnZR+P5htXK+V+rbWDE7zaJyC8FD6TJ1aJ9yLVQczajQ8er5zet3NSRgWBJQspxMz7vRKbeyMnEOYH1cWhpGj6o2k60rUD9+zyKEnmtP7Pq3tWABjYCd8vJkhcUbKEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQQA+AFs; arc=pass smtp.client-ip=74.125.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQQA+AFs"
Received: by mail-ed2-f2.google.com with SMTP id 4fb4d7f45d1cf-69abf68dc62so1434622a12.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784147596; cv=none;
        d=google.com; s=arc-20260327;
        b=n73Om9uhrjuV6HHyWjvDwJZQ95tsI35CbQ0hgpE0qbH14odj6+Byu8VF8e24sR8kro
         qEMPOBq8QwumhZ8FqdzaBxd9E506VUIfxpa5rn6W1vAouBvAJSOn7VXK88oMqPQdEZBC
         NIqaDnMQ+GdMO4yGgoIUnj4KRNKatvpr+9C4c1jMQ8vsLF/hAkjd3RYS1RU/bAIc6P51
         izx7oTVoQXVn6ERTmFuZBLwhsxyHjjAX4WH9JGkfGY1b4WT1b9uzPxMyKO+jdhvmWCld
         8LblZZVCFA5hLxKQh6uCBAC41J9H2Lk5othFm7I+KL7nSRB/GfBem3HdFtZCPFbkHauz
         gwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ChZRrIPY+q69QoNpgGM5mCWAZDJasoa0uEar2XXIlDE=;
        fh=zSX9ZiFdFOVVypvITGSicIVgM8uWp3W1/V70rkpnCuU=;
        b=oVc+Pni3JtY7/zeRIr7T4zr86Pc/CApLKX82tkroogITTHVFsG7NvpHETv4T7A57iu
         BaXhCuMCxAs7KzB1aBEehISdertLuh1eUWFI51bYUPN8Ul4cMloOpHR0gHptruS35J3k
         H4e/V1miNUNDCljiM0/fn8NV8Yx9ep4R40h+ZA9eRdl58+XePRdHve17cIov5ZDIQXgf
         BviRw+y8beRMPIJDPiREGoMJRgx1XcGCRL1HBHM1jJ1JDNRSMyAVUQjqvW9Y1KaGQNvf
         Vs7QSs/gaW5KFvxj77lpksgy3HWzlIw7yGtl9O56B9ubx3vVGjr8EX6fb+W+5q8RPJ02
         87fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784147596; x=1784752396; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ChZRrIPY+q69QoNpgGM5mCWAZDJasoa0uEar2XXIlDE=;
        b=EQQA+AFs8uOTeaOycdQgCbJ9Gy3963RWugVTQKS01v2weV61To0+QExD6hjEyUyE4n
         92m8aM3zSe0/GPLIhvsxvLXxPc1Eg2PW4JI+xSYj+nqHYCPFwaememe8fnabpyAHTSZA
         gtfImuVPgjckbJ4z5Nr7Y+zyAhKBeR379RZnX5q1s+a3K2TXJbW2cYspJGAXjkABirrU
         E5xysOi1cSgyeypMjjrAmtHShBXXhHoE2UTjvAH/FqAOtdlXQdZNjo9D6toRFMc/LvxR
         fmEt+kiOmSlgL4qTNwZxN+BNpcNmhprR+Nc9zfbN0a0PBqpMpl7dgR4PhiFYTDZ5LzV/
         Gqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784147596; x=1784752396;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ChZRrIPY+q69QoNpgGM5mCWAZDJasoa0uEar2XXIlDE=;
        b=ohMllWc2RLX9sVcXqZoVlG21MdHFzv3ydThfRku3uXlyNJpFSiawx2e/Jh+6Vvz8+v
         n7ajZv0fjRx3nEdJKoLeqij1W52ccieMb2lGOf+KCjwQFegr+zSmhx2BEXEb8DIghhvz
         CwrtSLIchjPWkAQxf8cylTT99cImsyi9muRVj1IqRR/+GymesBjor4U+n86RSfDGh53L
         MgloKTbSIhNCp5mW5XEE1u3fEkNQJwOHsP627GVsDLtThTEkvc5SWe332uYnpnLefcbT
         ST9u6LqJn6PPBGqEU+igj/XZVX0pvYeDWY9qSohB036CdaBkvxDJyHYtBjFdqKyRvDFV
         mFRw==
X-Forwarded-Encrypted: i=1; AHgh+RoGdsyrByVTj9yB0o2Nj7kzX3YFHq5+QvepQhTnLrrSFkORmV77/ZAEtZvhj9UgTvXxRz4Rh3Fgddqk@vger.kernel.org
X-Gm-Message-State: AOJu0YyeAqVCiLBVHZ4p0te9w604uL3TJ2kpIOMhZfMGW2NDVgSkA7gj
	nnNsyYjiNuH74KVZHOf8eXr9vUYsWdJenNRhY9bpBEP9rF+eWcTW9M2MwQan+dlHQK9aleKm5BX
	eIkVedhhSrMTWIikbyRL024SYLqamkiqb0aRj4Xyed4ullCg=
X-Gm-Gg: AfdE7ckuswcxIBzEq/FzHPJyeOKJCLNivQD32CjjMcBOFxA+YnpJrYSSWzTfX3Uvdha
	r+MazNyUZ/Shyj3cO+fyAoMwaVMDgHZa7fJMsI+ZX9iWhfKR9oaefQxH6n3Yj6DG+oeE1UMxsax
	bcoQLrVsZr0/BbzO+N93/xCREaMPXoMGkraqwkiagRYUT8fWSw4WSM7Q7SIhuq3vqgifCfLxtKF
	wfbpmdOqJxU0MRS2a8tajC+VsN1AsTDmJ+TYNK6zErhtoLhuoi570du6XmwV6VQkHn58rYVxzE=
X-Received: by 2002:a17:907:d649:b0:c16:5cdb:9f89 with SMTP id
 a640c23a62f3a-c165cdba195mr563594166b.64.1784147595530; Wed, 15 Jul 2026
 13:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-9-coiaprant@gmail.com>
 <20260715191455.D033A1F00ACA@smtp.kernel.org>
In-Reply-To: <20260715191455.D033A1F00ACA@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 04:33:04 +0800
X-Gm-Features: AUfX_mywQaSTkJvyJzv8XehCE-odr5e5YLAuGpoxeXM7OtZo7VSAqzu94NbaTns
Message-ID: <CALj3r0hjOBgRL21R9tRPDP+yrN0QbAXw=NcOvp4jiu_0PxFeWw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] net: stmmac: dwmac-rk: add SGMII support for RK3568
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [ ... ]
> > @@ -1379,6 +1441,9 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
> >       if (ret)
> >               return ret;
> >
> > +     if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_SGMII)
> > +             goto set_mode;
> > +
>
> [Severity: High]
> Does this goto skip enabling the MAC clocks? By jumping directly to set_mode,
> we bypass the call to gmac_clk_enable() further down in this function.
>
> Can this cause a synchronous external abort when the MAC registers are accessed
> subsequently while their clock domain remains disabled?

You are correct. The original RFC patch had this issue: the SGMII path
bypassed `gmac_clk_enable()` via the `goto set_mode`, which could lead
to hardware faults when accessing MAC registers with the clock disabled.

This has been fixed in the updated version of the patch. The clock enable
is now moved before the SGMII check:

    ret = gmac_clk_enable(bsp_priv, true);
    if (ret)
        return ret;

    if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_SGMII)
        goto set_mode;

So the clocks are always enabled before any register access, regardless of
the interface mode.

The error handling has also been cleaned up with a unified `clk_disable`
label, and the default (unhandled interface) case now properly returns an
error and disables the clocks.

Regarding stable backport: this issue does not exist in the 6.18
kernel that I am using for backport testing, as the code structure in
`rk_gmac_powerup()` is significantly different there. The fix only
affects the mainline version of the patch.

Thanks,
Coia
