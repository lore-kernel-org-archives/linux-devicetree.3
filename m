Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E99530CDA2
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285627; cv=pass; b=VLwpTHmAeVtWRs5hdEuCOz3ekxg/KyVmAE1JmezAHMi65q9bkpheteUD2bUnzUgVxnRe5zllv9tsFPDU9hEop2GUCm2ymY4u+VBLz1s1MeHFAYl+djgTD3AzbxRuTCGOh/T6KEq5M6dySfmQXsBQeMMv0jf4JjQ6uRBS92uqPCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285627; c=relaxed/simple;
	bh=ASawsjX7X/8urY08XtMTUeZsranJFRKht9uH7qNh/VU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BO+pq2gxPg6wawk0uNMd5ORbXeGJO4NegRIuWRGwpfREsGIjxjV7tkn+ou7OM3x2rnIKGIB6fo39GAgA/cWBdzeC0+cg6cKSI77KRcNWT+wg8b1Sk68ixSudT/Oi2vx8Sk8E1s20Pu0CsGLqBUwToS5pb2jYt9CvldG72XQ4e6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2EKBatB; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2EKBatB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d73352cf2so8447251f8f.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777285625; cv=none;
        d=google.com; s=arc-20240605;
        b=Yu4kA9CXcr5MR3Zudnprjp5B3BhoNSBGGZq0SIxN0nJwgY81N+osbD2ZpaIM5QnyZn
         l2IeH+WFly1BngVf+V4OeQrD/1SYSONMULdOEEISsdk/80vf6edvkbZX9NnxrHlfWQJc
         UndX/69EUHPYMBVEg4fahRl3i4bWgKDck6C9tdMNAhk2NqyOtkp9/T/B+xRnmesV5gHH
         Ipwy9urnwxZah+9NH7gh+4Qe6V8yPPRIe2V/EcyOVFbPEa7YlqI4Hcl471kMRczjmnDP
         XGVP5V9BlM0iXkbuY4msOl4BgfNgBxL7IgGc144wog0uddQY1FXMerft+TD31ESPhAKV
         R2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yy9TpvF4dvMsti6vWTJtuN6n13VJmg3/jzu0qnThAws=;
        fh=uSEyeatq/mkWRLf857MLzBbCEn6dExUwuxQ+33uwObQ=;
        b=d5xe+5i04yaAQ88UBP5Lm0r4oTzcOHizxm4olypvsCzGO9oXrWKDSPUEfx3kM8gmlc
         BfShaWAwy0G5OlAhjD8HZBnOvx4IDjcjpBcqewPb1M7hh9VwoXozREjy48H1OkN21Z7w
         681d5oLpJm60S+i0cfx7k5oTwtfEUwrvkqh/aruMZZ2xmYS1beG3UNTRF6ROkBcwRpN/
         avqmA+crW+GwUJiHjQDKmYd263CKufXD9+f4umtcE7rCXsEoCMYTpmM3iIpbvi37oRS/
         xmYp3c7SN6yhfyDIjoIQShbsRM7PDsVYhla7Ogri8BkOHMWwT0UhEu7usZl6w7K5jqcR
         HR/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777285625; x=1777890425; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yy9TpvF4dvMsti6vWTJtuN6n13VJmg3/jzu0qnThAws=;
        b=G2EKBatBs3pje3wFYrfwpv5cpj7I4tdZg9+6JxY8DbWNM5Sw9WWETwpkWPLqPZV8lP
         IRpkZ+smWAn3pvCG/VDYur2DBlj3m5tkwg4oJ2WhUQcR6KEVuehpMerXgrIjRjuFJAvG
         mvnmyo5K+6IU3CUgysj0J/RFNq8vjlrpYsUM8d8hfoL5srQksjKbTERONU+VZqQlwHUJ
         ddUt4lkabcYs5PJsdlykgDu1TqsyM39w+1iI5FdSYVDqiH3XAKAMpJ7dbIOktXJh3RpW
         PvVjRwezgESHjmeQprYA5C0xzLV+WtguqAfxxDXxLLaXQrAU79wjIqd+a4jR7gSkKOku
         Psrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285625; x=1777890425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy9TpvF4dvMsti6vWTJtuN6n13VJmg3/jzu0qnThAws=;
        b=dg2p0Wun+mOWe4AGbKozpywPXuHy52/vOxN+yE96MvYTnNzSkGbHTebvNBY963cHHz
         z2VzkH9H5Tvw5xmJGJgOpftXFv3NW1yl+b3yGxXB5zk/LIkozi2zqQ5LMq2rbPoaf/ct
         c/gmex8+U7h5DgPFxHYTOZWm5XjDXuHJdMK6ghBj+febfTN7R3n9LZmX1dfyOc43PTWU
         lJmgaOVRgu/iJ48ffNZuOqhhklvoUUpZy3jVQAii50vNiF8jFugpET0RxSWwkhtYPn6j
         vbTc6IaTYxvgTVnG9GVqnar4EHH5LFF81T9BH/eye7gG0K70NF1OCDQ8wOJUQdA/sApA
         upEw==
X-Forwarded-Encrypted: i=1; AFNElJ/onkp2N1mqsvxk3SCrRavpuTFzLsiAfUECNMB05pRV/t+k5Rd+XvyxDDnX3j7IIydVST5pnVkkvQ8h@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc09jJ5O6kbL+qAJA9rO00pNL5gV6K/HEeyr230/BiCv31R5SH
	WbMzIUc1vCJnUvQHxvINDyN6ike4IfnFgBwksGenRNsWXMpZeePHLbq2RlaoMoMVhf2EJ9tBsWC
	ACC+pb8SmaN6novr7FpLhe/AI0gWyUR4=
X-Gm-Gg: AeBDievW6TLzkqNi/ha2YPSBGRaBWxShlxGyVLgeRzLbucNH0oU5GINtLE/xameSCcE
	PtMA23otTFDan0bHgY/yw7VQMEvADkD7JyfWIsOHQHShKOGGy89J7xZcYY5UJiWHwG7TLxNHijo
	tu25/dzL3/ZNygtrxdropV0rM9IDO/894niEiVvj2hwGJ6we8QWyulIQi6gJCRh2mfYoIPdpQRZ
	PwY6eV1EOAPGGaN+YlkdhOa+fodWFllLsDutNJ85Ku2Wv9BKgEs/a51U/NH1fpmwRRXZhTknwWc
	MYiweTWDMSYfhkwXFkl0Wj6A/njo8j+/bHHVndnOBoxc9fQmoByaDVUPuHN0x82OjGlJM6kD7lK
	1Y4UTAd55tN+IfwAAaeUGyBAQRN7zeOKV6i1dhLs+BJcWb/mMFJaColqNlbkK18kk407LW8/of1
	LjrCDZEAZb2NNZZ46n
X-Received: by 2002:a5d:64e4:0:b0:43c:f7e5:817a with SMTP id
 ffacd0b85a97d-43fe3dd4b72mr64580748f8f.19.1777285624674; Mon, 27 Apr 2026
 03:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427100950.33936-1-piyushpatle228@gmail.com> <20260427100950.33936-4-piyushpatle228@gmail.com>
In-Reply-To: <20260427100950.33936-4-piyushpatle228@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 27 Apr 2026 12:26:53 +0200
X-Gm-Features: AVHnY4KLhM9LmRw6U_pxzl6g17NRKK7HGlQhT2QlACTV2zSAWMDHtjGAu-A9zqo
Message-ID: <CALoEA-wAUpZ7_2_3kB33mNB_Y_DAc_p7QwPR9a5pxL1iET_cdw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] iio: adc: hx711: update Kconfig, module
 description and file header
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: ak@it-klinger.de, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 12:23, Piyush Patle <piyushpatle228@gmail.com> wrote:
> +         which are used for bridge sensors such as weigh cells.

Typo here.

-- 
Kind regards

CJD
