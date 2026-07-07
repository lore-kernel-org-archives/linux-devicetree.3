Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152E13A1683
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452836; cv=pass; b=O6xpJeicgn5JTFZ1B6RlzHhl1FzX2j+2CC8amopACmkysI3oQhwsDmYh3JtEiPW9CiCTxgspdDGz8Dlo2bu1gg7fnzdDBQGkTzz2kK/epqvf4sb95mjD3diM51OiHA5n2sNl2S1T5lI8ZUkstdqZH/C04heBQDzyQsDk8p26vxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452836; c=relaxed/simple;
	bh=VEGGv1a/IFZ3v0HtmfoFwrukcxyKwWkD5BqkFnPRmn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSKvNrpe94dsDlgC1O91CQc/8AyG7oIxCJNpwltCkn/Ua2neIb9RzX0YwlxKgf+s9vJ68TL1+D0RzpgU3bO1GGNMj506EDvME9EOwt8kqFPvqn+M2C57pTQscTLqyMBIF0LsxeX8Yva03Z11dpxt1pwCzz8eGVOzzoJCGmu7Eik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=VAZMsBbW; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VAZMsBbW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ca7aaa4b85so44168165ad.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452834; cv=none;
        d=google.com; s=arc-20260327;
        b=ZgLz2z20BAqjvaZmCE6ZX4p9Bw/pIKHfh5rHYbjs6ZgAzLFBr4WcjAfWe+MtNybccX
         P+FN2ghqdi/4Fihu5qn3QZ4SQaCzifYFAUL8UyQphxAvqYUXRxExTxNnLpS/Hu8Pqd1X
         rlZY+NL7apfN6/MbZEsBDROFwx9JaC0pAR+2CELaM57nLyNfAW5aIzoa/gb58zeGoPyO
         xVuO5+Z7rOmWvtRH0MH/wWNgpuYvJhpmlACZ3w7aK+IgP59cLjiq8Q5oI9ylJaYVYmGS
         GRxrOBZqjkv1vimiGSzEzc7RdRfoUMCEQXvXWU4V6dMIxo4WIWj2vMCSQshyXjOwRbLf
         5t9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        fh=Ktttf3nTrnO2CMTBqsA0inuil57zWG7sWRWDSdpJ4Ao=;
        b=A3XfB1hI06Wz1VJZYfDQZY1eu/ygw1x6XjIHPJUbDuXqXPR+75tffxaQMvuTC7vJx9
         Wy0Cp5vfOyjXLncMJaIKacdc+lMXZkZ990PiCFXdRT0m0k0QjZK5tmbII05f0gvydr2d
         k2kbgQMaOoW9Y654+Sm3X/sVGtIacR0fv0mDTQqroSa4GryguhGrbtsb/OFz6ZepQ5a7
         KO70cBQ/AFkBsXsJCzXdzR46PveOuhK6fBLVSuyfP9oQQxXHP4PfqgjldQjD+T35+Ezj
         +3A4UUe7pDGa3ytrdbNZ4k2TFLGmNmF22avRtraBC0r6zEkUW+KBKaTtueY31Gkq8i+u
         gJbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452834; x=1784057634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        b=VAZMsBbWkKiD2UdqgFG5coIy62u4m+12Ko+L1Ei4PIiwWV/SLJiN9fhUU0YPDMgadG
         IzU23sd/0IURXVFgfTwD3e+q1Mxt2pmW82P/Vq56ZCaz3e08Prlq3gvtK+zZxq5uwEv2
         H9QAT5Xw+bRH0yXkCuelDTWkpvzlEF+KGwDibQ0CV/waMP904hIr5SvT37J0Zz+6Upfh
         yqxHDZ4r9aE2pU7hcDdVB0rvlS8d6/WwxQKlEK9ZBhzsIyg8oNot32pfbPjLdygMXYfe
         Cj467FBh8I9WOe7W0BxIaPoqoXjWwdfMhlEq2PLW3edDIzlfiCj/CZ9CiDjwmNm17s5u
         2Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452834; x=1784057634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        b=WvmYD6kcN025WO/UE1Sp7SKPsr05LtbqRyoS/eUes9D327ejp6Mp+QH0dpYa+pVDAJ
         Cg51+jTtoGSA6Xye276D81RewfRlWGUOirj1NSwhNEGKYOw/cm2ZjCmot6zvXuYNIYHK
         9tQjwOWWQd3C6+uit/h+jHszVIwgHtYPN6Fh8K6e3w2r9kF+QDu2+y3IrZCytDnmIJL6
         7/5wKU939aDnWYLbNwCIPysV2tt7ZO/PDI7xbgrsUjs2cBgymXzaoBdBiqW7JG3QUPxL
         ylB/ZVGjXU2bkEaZaMWRZa+1JjfsFNGbKAVmKbDnX3zP5IQexDKfNjikS/M7hZYJcu88
         0+/A==
X-Forwarded-Encrypted: i=1; AHgh+RrYKbBvyEN3Wl0xXnZ9r7J2XWx7QLVBnUBiI5KuEMhNlGPbbfVpbJymGgzU3IpbGjWmoaSWsm12+GE/@vger.kernel.org
X-Gm-Message-State: AOJu0YyAxCkAn/Gp3deqbTF0dEZfAfxwpSRV2T7VhW0E/MwtsXtmcIrv
	SkwWu/IStqWV2tBx0k3WlRu5UUhTQTePC73I25w2Aih/y5DVI/XX6YQox7LjpDw5QMJP9ctkmCA
	bt40CjsaEG98gnvsznFPAWFZgx9kiirM=
X-Gm-Gg: AfdE7clQ7p40hm8Oi/v/yzvB31pSawOufA8ExRm4tKdj6nSAHTf9KBoWyZA5B0aAHIx
	e2YeUsigZQYCSIxna1ioOlNDdGKiZsW71RN5Wq2530YGQ9z5NL2y8jBdrVZl37eubMwBqDXDp5W
	DP6lgYpFT1y3nONIt1291Z0BlHLy311tWwndaMQiR3beExmFpMyt9FdRP192fRGk9bMhHKGetl4
	jKy8CSH0ZQGxXKm/s2MasiHGu/H5/jrG67yq6YkTQ6m3eFcXz5wABslBXAJ9M+yZrT1jJNFKv1B
	9HomI382B82l1TZI5kBo8TctriHu6KJiHxmM
X-Received: by 2002:a17:902:e88f:b0:2cc:307c:51fc with SMTP id
 d9443c01a7336-2ccbe722438mr59133075ad.21.1783452834318; Tue, 07 Jul 2026
 12:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:33:42 +0200
X-Gm-Features: AVVi8CclFQkx9s_G2Hys9qfZAMuAY5MfDBKVgSfmmojs2V4cbQk8rdJWoP8wXjg
Message-ID: <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: xianwei.zhao@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei Zhao,

On Mon, Jul 6, 2026 at 4:43=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
[...]
> +                               func-ir-in {
> +                                       remote_pins: group-remote-pins {
Can we keep the established naming:
$ git grep remote_input_ao_pins arch/arm64/boot/dts/amlogic/ | wc -l
37

I'm worried that adding IR blaster/output support at some point will
then lead to confusion.


Best regards,
Martin
