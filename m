Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6A5442125
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111731; cv=pass; b=URuIGSUn8KWWosTybdiuklIaiezTmDS7YN6BJgZke7pUoBlZ10BfGF/elueTeNOuHfaDFt0bar92sfTbvJlugDkOgqiPqQ+cbnrw7mvSgGB8Ou36stnOi07jNjVyqzJXxHwhrU4e7ShoPOfszMT2diJxOPZaBbYvJ8sE0ijg7UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111731; c=relaxed/simple;
	bh=kiVV7/RlES4M6tS1dYHeV4wBsNp2yBuTSiq+ZDxp/90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3n5iFj9FPsV0wXZxYkcyqSU6eL/2RJMRtEScvGjxsT8Zn2MK07NqdG1hMHoFi3oE8WO3kz01Bw7b1k9N3Zsx8AgIAQWD00ENU0A40QS/3JiqUXVy46LJl+5mhQS6G4gURWMaDQcDtsNfo+G/PUbh2Hv4I38j7mt9lMcJDUv0eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxCuD7uS; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxCuD7uS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aea0fff535so2140479e87.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784111728; cv=none;
        d=google.com; s=arc-20260327;
        b=pVYQ2ac0irhxqXHH9leuruipreBM8vfnxYGwFu2q831OXkAbjXZkRdYVGLkRMnw1h5
         RmgraAryf0rCLZUD18IdgZXz/D0mGJPUQ0hAbnbhIQKj1D988VTbZcvGjuyswLhAiDPL
         dFOFNQkzzo5DJE+RFV3hF36yKH3xhLQmF4fcw9DijgVvjmVQmRptYBm163XKUwxOSZiF
         WCyZSTv7PvcF6FRfimsB03SEeUZ3+27JX9DIrxu/aD8Kj33K2MIaHnpkkgrgTO28xSTY
         MbkK/myLn7GJZX6ilXAkzLC2zRpAOXzrGlHIcdYXwZTaH4vvyv555H7f0hW7DXfhNbaA
         AG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iOHKuZbW25+DRFBnpvEBB3nedoJx5g0E4eZS/T2EFWI=;
        fh=qjAI044skRo09+IIbK0VSOIf8FkBxMggQzeSlzoL/+Q=;
        b=lrXatASU3BQRlZr0HyhdYwDEveEPnm87egx5B57wgCChM+iAPiPjHTV9lFgOZlKjNy
         cjUDH0VZbtt/Qujpui+Qjx36VLXSnYvpSUc56VTihasscQZrYrwcTT5vlIOCEUIY1q6h
         jXBx4Erkfvn2Eizds0Z4Z8y18vwzpA3axKePdT6Bf7S4dcZPcv8fmY1uStTPfCcYhpX+
         MivlbeztbbQ3JogahU8GfVGj5OEIX8T19ftapMbK2bxH1i/j+xr6MNWHyt05P+HXBTkf
         QjAogJtfzChd+RkwkwwsoFyiW/hTLu9lP9IjUE69oXpQyngeCx1CKaitawv0fQaaCsqd
         WKlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784111728; x=1784716528; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOHKuZbW25+DRFBnpvEBB3nedoJx5g0E4eZS/T2EFWI=;
        b=BxCuD7uSryFghPkF+bPpSreTNgmZWNP6LKaw+xKmujG6DNunbbLhp2ZX5TPZd4LdKD
         TI6EU0IVedoqxYoMXB5vaFud3TLg2/6mQJZNQePwQTgXtJyMl92suf+2CRCz/67c5DFY
         MyVdcq5m1QMASiQFd1JRUWH8+pbtkklKUwgI+uPDVA7gkQhEhjvim2qZAXvSzyPvmvUU
         TEIDKItPNrWh/NHEC8fC15fi6y1xe53kF2BQF6Bx1LnzL1N4FPcswA/qcq/i1uLeA9aj
         PAJb0Tchk8Nr22iIIubX83r7xxkU0XwXHTliHAfzCxJCh2oPBUgt9Zmf9tzN3b0n04mr
         SJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111728; x=1784716528;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iOHKuZbW25+DRFBnpvEBB3nedoJx5g0E4eZS/T2EFWI=;
        b=cvFKRP0svUX62F8yZOzeexuEQyXf/AoFAvr1x/0TZ5HFS827nA+nUQkSuZgB2PxGR5
         9FguhffuTDGX41gVc6dttm4FGdPA7ZDiY7+/aYaMwLgOfjyTppt/h1Zl8FXWWMghSen/
         UBmiIzsOU5IRnMyVZF3Lq+heFkT82orOQH3dHG0VtclFSy3e4XFfBac5+fWIRUhtpK2s
         htT/2ODT06SXws3B5la/vHAKFZPTOIAV3HDk3yDVmIUpcXuhQ0AkmyDtfJ/Dz/KCEy6z
         pf2hFh6wH9OIdWAzK018PuNjWaqLmnrrwLEuPBnb+cxX0RCZwGRoCCIbdD4SeMaeAGiI
         0Ckw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/3OWNt1YRCddq8M5xHB4qbWeZ1nXbaj950s7vZDnER8NJ6vrjzqMdmQ6FwL2v/ZCdfcCZIRbFMHaM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy21juDPSwDi54qKBVQ+ibIkhaOFCjtQKlzZ61RKRtBCFJ4DQJQ
	5QLew+sz1GZZVX3+k/8A+BaZLOWRGa69CW/ak9sf26bzW0vbMsBj/p0A8uiDwG10KBAU5L7kmYw
	zxkqZSDt1mT9Gdo+r8p7rsu1K8/JpaOjx1j9czj9bPw==
X-Gm-Gg: AfdE7clXLWlzZ5iM1bvUzmJA4cbx2dYpLEvw1gQOMb/jmgqLSUzu7tf+jWSSgjw/MhW
	bCi7tRZYqaCfQtjPtd0oAlRKZwkkqHszTmo9I/RkgGFFh1zoiUjq4/zSIe+lgWa5NqND7n0RIIW
	I2N/hU9r5U8boM4MAVfKzXLU/5JWsJZSJSZjhXpUmD5FBGTHZt1526y5z5dlywEiPK69a25QNQe
	5wBSB5iQu/Ge1uyRu4HuAcXhuXB3XbBZJB9oYFWalxncud8jg6/kiWqCZJAFgImFkp4jbDcerK1
	l8emBMGN0wYaLkROiHeVrarZ+LsxLPjz4ASm/3ucCIcr1G6vHZDf86yxPm0KBVfY+rMsGn2U49M
	R1/qoJ2gzCYOLbr0=
X-Received: by 2002:a05:6512:61a8:b0:5b0:177f:bebc with SMTP id
 2adb3069b0e04-5b0236b3aa8mr5253760e87.52.1784111728064; Wed, 15 Jul 2026
 03:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714101146.200416-1-kieweg.leander@gmail.com>
 <20260714101146.200416-3-kieweg.leander@gmail.com> <alYnPYdzBRUHBCIR@monoceros>
In-Reply-To: <alYnPYdzBRUHBCIR@monoceros>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Wed, 15 Jul 2026 12:35:15 +0200
X-Gm-Features: AUfX_mzGlrZdQVnOUco_-kFWi6Q1y_dEVDD-OJaFL1BIr-N3QyuhW7ATUqn2OOs
Message-ID: <CAMwcS0iFOo4OY75+PyMVaM9JBsfDwmGV-pMSU8kcowFLDUaNJg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] drm/glanda: Add initial DRM driver for GlandaGPU
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Don't include this header, I plan to get rid of it soon. of_device_id is
> provided by <linux/of.h>, so you can just drop this #include.

Will drop it, thanks.

> Make this:
>
>         { .compatible = "glanda,gpu-1.0" },
>
> please. (That is, a space after the opening { and no comma before the closing }).

Will fix in v2.

Thanks for the review!
Leander
