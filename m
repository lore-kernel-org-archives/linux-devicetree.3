Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1729C423EAC
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007198; cv=pass; b=WyCqTVbHJe33sqkxVuiX2Nq+1KiO6YogZ2N0/StlrY2x1RuDDEcBqeYFOvucEwU8Mfq/YOYzfB+ygd1OvL+bCuqWUVTKCV4+1JmFCvI+jn2igpLoaVJrozNc8XggNhNJlBdeXu598LcmxixPeRS5AyeiD2L6x+QfHnhvhFlAgwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007198; c=relaxed/simple;
	bh=7crgwx/ciSJ3YxNEg04ALNNE/ZCRr2ZUG8UeoFiokmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZcOV3IGnYw4K1HNrfxDyzEi8qQuMIQt0ZwuAtVIYtgPANgOWKa4DGBff2socmlg8xiHq8+dznc+evfk4SY6+ELwYrlHl6mJxsluyrvyZ/Fu1+zs5iOL2ahU9p+IEbULeXhoKg5W2xn0rxL2zpE9GFQ0LaKWMr//7IJLTa1Ck6Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESlfHpwe; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESlfHpwe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a10b20634fso3485674a12.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786007195; cv=none;
        d=google.com; s=arc-20260327;
        b=GI9llxAmSa476sfBvdqKTARy08/96MgZB9ZX+DpHbBq1NE6LU9BiUanvHHAymonoBA
         npaVmkPB8C48xCuCHdsXVXAg988QEHuWEaMEcNP6fe7K6VtIxEzJWE5My/7tSGrmLaAN
         Mg+ZPuUWnfHUQEzfV4Y1+O2qQT/GvBrOyrzleXPdGg7wNeUAP2On4XbF2Xn18AFpbSDY
         ym9yXuCsw2USb7MBI3NHvyGM3nCtmndcKJswVhv2vnCPkPQyeSL0xd2pmjdzmXAupYS6
         nr/l+7lmwYNiOMaRefz7lpEX1mjcZWKqXHXg0YHFoo8BipjM0eHcGgRJDMZt1z9yJTGO
         tbrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7crgwx/ciSJ3YxNEg04ALNNE/ZCRr2ZUG8UeoFiokmY=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=EoHn8igQWjkqdSG0lR0o8DeKqaqlS0Z/WELAsProU/Yac15ooEX+ZyZugSQGYzI/iG
         nJpW/b6xN9S3sAH1teIgAyyWNwiZPDBxhx+OiO1JcIvWhHeq2zLWo0EcKU2SXg+XNc5n
         ggzTaCgsERAyomNr0f1oHG1WRKwxmpAGAhiXisNBQslIXrM595IvSkg2wKnradnl7bH5
         Op0TI/HEOrFD4nk/p/BMgx0uGo5UO1IiOFlm+afjBiY0MQxu/MXleFiIvCHx3edP0vat
         BKx89YEWO8sNXzTERS6qxCSBMcFEpplw8BTn+BQd+cHuPJlV7fs0a3K1ScjPS6T6A4i9
         Du8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786007195; x=1786611995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7crgwx/ciSJ3YxNEg04ALNNE/ZCRr2ZUG8UeoFiokmY=;
        b=ESlfHpweoAFkkq+NJ9ZzScAMpwRE323ryTkcuz6okG9uHvu6HUW0fjfELV4ngkAkcF
         uT04ZrVyIwoL4Ini4xtt6Q5CLIIB2n1KHbUKdVeszgHDWTJp29ZtkvJVkxSeB+1N5QYM
         TmLxacwueOIK8HsVvWDagHo3pOaLSyVc3ohmpi2riHDoEPky7jWpkGmn2JPOO2S+uYLo
         zlCgnXMW480a71/jnPPQfiovMp51L53xBQElyw5IjAKOjGCMMQge0oYbe0CIcGUOs8R2
         6hhmdI+FlDt6xvBRtc8ZjvFUL+gbzsaKyOoQIK7ltSpX/mkyQxcul9KnU7KNXy+oksXU
         TCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007195; x=1786611995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7crgwx/ciSJ3YxNEg04ALNNE/ZCRr2ZUG8UeoFiokmY=;
        b=ARnv+SGV3EFR9sUhx6Ck7SjOZLg4VKv2O7w/UiAx0GGEgVuAZiV1KZSASiQm2704Yu
         tns5OV3kOKDA0PN7m+lVCQhSqqpaDmuai2NmDeJR2erDjDE5p5a1C5A17hgRzrIHl8ag
         F5cDbDlg0UgN9AGhV2cNO1VdYnM72XRHsqr8jWcTAXy1tw+cM+rw1NGqaB91Vrgjq7Lt
         SyJpdaN1dLEGfl5q/kcowE3iJd/CPs7YV23fG2KZAm6O9PMEPMMDv4yCQPw0GDIeVFeB
         pDNIQBn6eBzMCbgEQFRsktOF+bkaasZ9uvnZPsZL5/1QSPbReNEYKSvzXoflpHPPG4Ue
         r0Hg==
X-Gm-Message-State: AOJu0YysTbJj1Fcn0DGNjGY6B8EdJWMNM5stmxABq8FkME2WVI2Exl+Q
	sdf/JQKyDnKgIXqWykRuPN1xC8FDSoIy9XZYhIpEPKBhK7pkmcDmTU5pakzdaJstyXyCTG6Xk+s
	xuwKglUUM2O383gvVUMTaeuObdkBgZfs=
X-Gm-Gg: AR+sD13B7Kss/CD2fjf9TAyv/s5tEB77WO23Jc7R150DPOA4lKXBQzdqnH7vk7aNiPO
	QJLGG7Gsc6qJIh94ezLh5/alS6Ap9wUcvePA9MbhpTAm2P2kTNP2DkiPlvkEdgiWXfcof0TM19o
	K9vAFcop5sPIwXRXeJ3Wh09/Xl45TFz0TVLIe4f5LyMa2W5hBN697I2RLxnzpz95lhGHSSytQ0w
	FdNNVU3kI4b/Bi+b2xqLg2qZsjtY1iOrruiB3vVJZ/+96uKg8Xwy69Gn8BVf/DZV2lWpQNnLLY/
	AWlfhqOya3hS12O+/hKcf2RdxkghzWjOm4kM/C0k6kAMdQ==
X-Received: by 2002:a17:907:1b24:b0:c12:8b1c:454f with SMTP id
 a640c23a62f3a-c2039c0264bmr718944366b.2.1786007194846; Thu, 06 Aug 2026
 02:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805085540.452260-1-a.shimko.dev@gmail.com>
 <20260805085540.452260-4-a.shimko.dev@gmail.com> <20260806085705.319D61F00A3A@smtp.kernel.org>
In-Reply-To: <20260806085705.319D61F00A3A@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 6 Aug 2026 12:06:24 +0300
X-Gm-Features: AUfX_mywS_-Ap5-a--PJds67KA2ZnUqnVz73jHQni1dDTkW7W1PRCoPmEm1NfiU
Message-ID: <CAOPX745QvyfneEwr4aHCCF6xqYzfH5UTDg0LyBWTC13vVro9qw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/3] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 11:57=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> Should dap8211r_modify_ext() for DAP8211R_RGMII_CON be called before
> triggering DAP8211R_PHY_SW_RST so the PHY latches the new delay values?

This was already discussed. The reset is active low
and self-clearing; RGMII configuration is written after the reset
completes, which is the correct sequence. Verified on hardware many times.

--
Best regards,
Artem
