Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5BA54EEAE
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 23:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602840; cv=pass; b=L6jJ86JGoPWKyafuHm9L57KHeDjb3594spdXassXflIK4ke5XFKfZXuFxS6M2nbLvekIffPOtSYfu8AlYfY+6XBo37ltaMPsQ4KpSubQbatsCsfeFhWwStElzipDwVA6IshI853THRA5tdvpHPV0yOyijLczYLQJwuMDA7yIWKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602840; c=relaxed/simple;
	bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfwpqrqCIMjn9iuoVoBZYYOkGwlvKkI6pSFZwRx+xHNIB8E8fsjnPK9JA54rOAK3wAOv5UA0yA500F3CwCuL7KWMuAMN1dPpy/V0H7iRajbxjbbYGCIpRsgaT+nEeOluALxDLlXL1nvCfC4fNAPhl4FguwPk7MvawmCG32ADxyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArOkzrg8; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArOkzrg8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91064d2d54fso2390496d6.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 16:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602837; cv=none;
        d=google.com; s=arc-20260327;
        b=qzApsLKBPEWNeMWbyIKgo/fzh9lT5majnMSoTsg0ao3dY0lKlfwPrwwqIUda0t+gpa
         +EkWcNHW1tbvSmMPiXC6sLZo0lMDcI5lrVCkXf+eLLdxUUDd/iZ+Uq/QsumWvNZ+BBLk
         gv/Z3t2omeyla6A8rtABwwsxD6wHO+OsTjSEQV+1mhkiRHEk39RuRE4v4uDFrCdFLGRG
         kfTRD/zqWuy1wwkpuiWIxnY3T7RZxvAEpyUOR70PyJNnwLw0FuQ0r5V/hi0+7xV9dk6y
         Ngh1yQd0HLwQfoFXaGTUVX7JuR28uvzuJR6/egs8dKfNa74KiVGDONA9EIi6ePwlNp2W
         viow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        fh=7eXL5eq5KijA/29iBjZBl4Zhg/LUDY2tpwdhiqfOuKg=;
        b=d1JEXw3+X2Peh4vw+gR0zywMuojv5IDp7+aSI6hNrQEDfjomE6Nvb39WypK7nsvk1n
         +4Fx2HGeOFd8laqlxBbiuC1GiN2IEvaEFr0pxLytp2YbOx8CP9n6i81lbYAmlksJzadQ
         DbKyhvLZzk0saUTtGw+5qZdFnRH6jhGVfyBN45ZSs16bQ6jErjayQiZze5u7FV/zRS6c
         2J4IQQRxN8iZQUGSxMKKEujP2/2YNNyeLZwdAgxFf+JFMatgY1kcjcisoBqsCf/1IEFk
         3pHEPInCOTL3ZMSkItWnpVcuddV15Zv7bN8nBVa1wzeZnlTwZ9st7ZK4FwsgrdDXO1sK
         oagw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602837; x=1790207637; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=ArOkzrg826arSO0VE1NlwbWu/vL5x0ReoqjRP8VxbLlXBDnsEsuU+pXazae/taCubh
         X5LqWj8yiH5a2WMQDp0lsLoarEtA1B50vqLDtT9LJ5D6RHafupLw6/8yEMNj1XD5B4Rw
         vXpGOsHrYHjj9zo0PGYT3hd2DcjLRnfCpWNzn5AYb2q+wdVKUaLnyNk+JTcgqb/tnQdH
         PgH8IqL5q8MXU8QJ8NJGK9bwSfaKLzLWUBLx/7UXOWiJpG/R8gPKUJGvXiTHIDSugIFT
         uvBHT6KqjBuqCp+qpri2oO5K+rmPhLLdhcMGcRGE2pj2aFwA7i8T/QBZj09J7bkjEEg+
         VRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602837; x=1790207637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=D0OUgjZG4D27hb8NbEPfM9gBV74hPSimmlXFPhv1iYiG0TUr9HeQp+cePAXH2AXjgF
         u4bKao4BnXKGIowKKY17WAo0IDeTcmyOdV091OSZgb8Wl+UfqMcvPm3Y2pbSu1GWv7rA
         lC7NCAHPqR6BwfYEhIaPr11+kkyK4g87fEUTe6Rw7xxc8u7L3wRjidMuDbLKqAqzBS4H
         rH2yjRHuLnecLD8ZsolIH0fGIPcSHGRdSQigvpaO61cII5g0fBeR2QCKswWFG3DxXILz
         29nmnYobkmgvAQavqHrjDYXcjWp8DGp8IZV4iCprrlz2zuJNRGoSWNp7jTdWmchir7zO
         7azQ==
X-Forwarded-Encrypted: i=1; AKwUvByqBdl2rq3AHlYIey3UJi/NpY9sgk2IDzff60+6gQG505DyLYLdvVNGxE7tUwIi6ularNSxR5Bqvpjs@vger.kernel.org
X-Gm-Message-State: AFuF++kPS5WIYvvzu6nId/hh2kd4T+q8dGdPQKqnNnhEugG8jpKGERRd
	2E/mV50sxRUSHAa6EUObbz/oROTddGZyfTAn/sQn7HJyl5IZWkErjPsJnVujR05MKhc4WusP8uI
	pofLCwVmKhENge9x7DDrHt0pKvnLuBBg=
X-Gm-Gg: AYBFou38Y9UhTac8cnAFzpdHVgF0SsvnbVqZp251iKrb//jCqu+W8ZHS6M+JyMT2kTG
	CuEV4QcI/7Zud5B8CJbO1YGgLm8GB7Ch94VtoX29nKX9ZJhssNjx70w7vILKaa33//HUu8QQfHU
	3JJRRRsE9Es+J3FgE3Cvhc7/gjvDBjqaDGy7/71+EY6UDLOn7tzJpjz2kBJ0ZI8QQDAdBW5i3hY
	ZfqwVRctD/k0sEynpCgaqNSwC6sRnOsNhwHx1l8x6xiUVE3fyCYZhvrKumdZ8vaSBg6Wm47mMNj
	aARWPYjZDa0ezJ2ZSCXcHJfeuSHRpQCWMdyt2nFvJzxjzTPhNX/oIuMHen/cpak27Q==
X-Received: by 2002:a05:6214:cce:b0:910:94c6:2ea1 with SMTP id
 6a1803df08f44-9123d7318a0mr91642006d6.12.1789602836616; Wed, 16 Sep 2026
 16:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901083001.8044-1-ansuelsmth@gmail.com> <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
In-Reply-To: <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Thu, 17 Sep 2026 01:53:44 +0200
X-Gm-Features: AcwNN1XEi8i0bR0p6V2XML1oNL1EMS0XGZ-YJo8qlzp3ByfRA3buomyIp2Ok6rc
Message-ID: <CA+_ehUw0KK8mHDmaH7UBKxq-By7CvXCaWDUg9NvoMPzSe5cgHw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 16 set 2026 alle ore 18:20 Maxime Chevallier
<maxime.chevallier@bootlin.com> ha scritto:
>
> Hi Christian,
>
> On 9/1/26 10:29, Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
>
> I tried to re-rerun the mvpp2 prototype conversion, but it looks like the
> series doesn't apply cleanly on net-next anymore :(
>

Hi Maxime,

yes the conflict was caused by LRO patch on the airoha ethernet driver.
I just sent v16 with the series rebased.

Also Andrew had something to say for the mvpp2 patch so maybe we
can discuss how to improve that.
