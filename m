Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBB8194AE6
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783862779; cv=pass; b=PNWb+7rF+UY7yPwGKvMzwZCY8FjU6QPC4NiJAVHg1puViM9RZlPdha1UsV+pM5AMtNGoFi8ymOvscC7JzWotpHDHAUQpZLg5hCDuVxsejMzIZXqoq0CTYOWcAdnuBsUPfOcI+I9FvtzHymM121UcTumjU+kAH5LnndNDBWspmwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783862779; c=relaxed/simple;
	bh=UGBqnk9ZujtuXQRWO/BbSzUobhHpE2AFBXipHVxZCWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwfVmlYQcn6DN78+gyNQsLWP9rAxLwRsho/SN745u++9QCu/HgNXW/GELF9ar0paGpVU8qfZDUM24V8yTvPatdVlUUuy9uNgTcdr7dupvFirXg3vMxqYRRaVOjiN7oFqAbbP8Q/mkiYkLha21BuDJYDoc96eI62SQDMK/4C2Llc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ldYDzpyB; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="ldYDzpyB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacd69a9c0so23301145ad.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 06:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783862777; cv=none;
        d=google.com; s=arc-20260327;
        b=NDVNoRJtQNVVmLFP+X2cOO/MPffxN7Vece/TZWpjJRk8YJRliohs6AicF4c7cyUWKt
         LNTq6DrS83F8sJgA06PNxdVzamiOnM+DbjWvNPsYBmv1oy0wYGvBw0pjtY3eQf+a5o1u
         lh7zQ6O9GIyK0XyqlYblhHvGhjQpB3Q5GbhCM0KStmhmwgsC+n50h9sYJNQhlnaHNCJd
         YDS0X71E3tIcv1xbGB2kyom4e8yv2jhnLzeBpo4mo0YKdQiRFi+8WLC0YK6hh23HGLen
         DDSH7qJAflVraE6FBE2KrF9JLKWtBJ2Vc2cSLok+gCB179nIeXvrUK+p8VbFz85ysS3/
         R9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UqNR7SXdW+p4t3J+3mUvjv0aIUfzr0u5I/hDQk2FBRE=;
        fh=ngNcvxM3beWWBou4TONqcwBA7Ik8zlNx/jojhmFKUf0=;
        b=aZXYdd6TmHCPYLvzMiJfHZgjDwZQa1HY7NAnx+KkS34AhHors0x+UMzPka+T+P+3i0
         9rtfP1DSKca2WNkcu1LZ6WMXhep+q1GC9ayPJ9w43tUCatWvZgEJFe4kZjcPwDZH7qNN
         tcG9vq9J6n5sAEADsOrfqN3odOlckLNeb1dILE1mmpqEtsge766190Q/GJVLJ0kR7yz8
         hv26k2SK6ees6XoX78/pK75OVhP/ob2TkuidW5IipCizUERf3v9nU7CG5kI9VQ899jrO
         MIoWlAeg//iPeZu1MdNtF1KOaKnbac4gCOEz/5Jb9ioyxwFExPy9YzT3WN1FM2Yp6H7p
         EVig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783862777; x=1784467577; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqNR7SXdW+p4t3J+3mUvjv0aIUfzr0u5I/hDQk2FBRE=;
        b=ldYDzpyBagaYSrXVfDwRS9Bws7LXfvBmSf4bKdluuV+jef9fUY+VxYB/41AbqZWeCo
         N3/OO4CCrq/sTEyHeiI+nP2x19Yjat7z0kIRWNSHe350pBRpP7gdS6sXzySowM1OfzTo
         OIPTOTxV4SJ95adQnUIUZ40PT7HixJ5u2Mf/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862777; x=1784467577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UqNR7SXdW+p4t3J+3mUvjv0aIUfzr0u5I/hDQk2FBRE=;
        b=jWG6CF3RFJJ/+np2TqwMpcu247VBoM9yQSc/ABPLlwh7UMqtHCMr/OsXZjZ1unYXQj
         WQkD5d32oMWCHlpg+RS9xzXHfk6ZOFK36ykhEVEFL+w/iXXpSbUIVNYyUFUx4ltiQoJ0
         dCgp6H2/y3pJtVGZup4+ScSCPO8fJW/u5T4ohjrUfleWxxAuG/19L708F2LYV8JMOGT+
         6cz/4Eo+CyIUHfy99jxgdTHLthiTyWoRx2hYOXFEKtj5roVkoPXhPjECkBTvF8yQFScI
         Ew8uuCbsSDDg0EuNfO7aT9woBRbvBsIshGp7tVIGIuOH7QNT35YGvtO6uc+jo1zpCQNh
         mP1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrgriH745l5KBE5+c452PBQhYdoFLTu8sys/eAB6inRLHoEMro7SBn0zWrW4dBUwjeSVqK0thL6MiA0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7RWwIARUC1WZUTMEyByqnk2R051WZhKin3YK0wuFyRRZqF5ZV
	g7lPInW8nSZ2Mz49fjJccZeTdiv9Jiu/bPtydUCz97jlMO61xHlIf2xiCot/rOJYYOG+FJ8dw28
	vR6YAzhgxoCL+xjaXR449nAuJpeFoSHJvxADV/9pKWw==
X-Gm-Gg: AfdE7cm55sLaQzOgiakvGWlGwL1y3hS5MfVa07QXSn42L213xXq8ZFglfIG2J6mmVWH
	dtzBYIe7nBq+g9+CIbBQLYzuzMCmeZVeA6tYGP0l8OsrFc9vADdYqSUo1ZEZI5q/JKTOvLwVX0C
	R8GkWXV2J3meQfxFtNaC4NJmOJMWJtPIn+oVsdAhCz5S5K6u60Z5Zv8JIzi92IwQIfTchAT9H2g
	AqCyh4c4Hm453Mbasv1iawF178Dmpikvwqb+o1+g1MIbaytWcVheJRIdzgIn3SXpv9W+nSnhILc
	KDJWJR+v011wtaYI3JSmkkCo85zyKVznFQ2VGSsvQKSvZ6cYE4pphzFPzt0LwWtNxF8raF63+fR
	+HvfYoonVms+ibtT73zp7EjX136NInZDsKEv23+wBGP0sWsKfZqLZ/Vup7T8jH36vURfS5SDM0Q
	WUlXPMpnpMeTniYi2ypQjW1P+hPEBfMybddffgL7lzBUbEtISYhdFjqOq527IPq5F6ydH/f8w=
X-Received: by 2002:a17:902:f68e:b0:2c2:cf20:213 with SMTP id
 d9443c01a7336-2ce9ee1142emr64188895ad.29.1783862777565; Sun, 12 Jul 2026
 06:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 12 Jul 2026 21:26:05 +0800
X-Gm-Features: AVVi8CcSrRWGUCKgP-qOLOT7aAQyJKXDMD-z2g8-SgHYdx-u7MOSLDSuRtVid9w
Message-ID: <CAMVG2supxy4H5L7xV52HzA6JLsAyTLa8PixmK7p9HOyZRPpyig@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] x1e80100: Enable PDC wake GPIOs and deepest idle state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 17:21, Maulik Shah <maulik.shah@oss.qualcomm.com> wrote:
>
> There are two modes PDC irqchip can work in
>         - pass through mode
>         - secondary controller mode
>
> Secondary mode is supported depending on SoC using PDC HW Version v3.0
> or higher.
>
> +------------------------------------------------------------------------+
> | SoC             |  SM8350, SM8450  | SM8550, Hamoa   | SM8650, SM8750  |
> |----------------------------------------------------------- ------------|
> | Version         |        v2.7      |       v3.0        |       v3.2    |
> |------------------------------------------------------------------------|
> | Pass through    |        Yes       |       Yes         |       Yes     |
> |------------------------------------------------------------------------|
> | Secondary       |        No        |       Yes         |       Yes     |
> +------------------------------------------------------------------------+
>
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC, PDC only does
> inversion when needed for falling edge to rising edge or level low to level
> high, as the GIC do not support falling edge/level low interrupts.
>
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
>
> All the SoCs defaulted to pass through mode with the exception of some x1e.
>
> x1e PDC may be set to secondary controller mode for builds on CRD boards
> whereas it may be set to pass through mode for IoT-EVK boards. The mode
> configuration is done in firmware and initially shipped windows firmware
> did not have SCM interface to read or modify the PDC configuration.
> Later only write access is opened up for non secure world.
>
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
>
> As the deepest idle state as the PDC can now wake up SoC from GPIOs and
> revert commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup
> parent for now").
>
> The series has been tested on x1e80100 CRD with both old and new firmware
> and also on kaanapali. Test conducted with tlmm-test module after
> applying [3] as test module needed to be fixed first.

Great work Maulik!

This patch series has been verified on a Lenovo Slim 7x (BIOS NHCN62WW
12/02/2025) with X1E80100 successfully on 7.2-rc2.

Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks,
  Dan
-- 
Daniel J Blueman
