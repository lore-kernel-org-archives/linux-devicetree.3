Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B313D525F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419172; cv=pass; b=nRJewZDTkIvYUjGzckUNDBMPJhIq1Lraa4q0K6cPIq3XERoEzGfMfPix8VUiMgcIG1KW81wG7xqS57cuTmwSMfY6Oo6UZ9kr0DqyXbxJk9ThgIIXbcF1rcooTeL5S8oetJux6iEgc5Pmij5N6RyQXQxCJYiayXj3GqydvXfX+wE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419172; c=relaxed/simple;
	bh=yKkjXnrOPWU2D0Gg1ecvBXfbBuh+4eTJIY1MHdX/fQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXvKgXk/asX9Cez/cY+9Zwx9nLi99bkVSlfyjmCMcHlPSXfCpYvOzNCBWKYVgZliVe2peaTYiPGCs39Efo2rFNYzTBzKf0fPSBw5LAHoQQRW7J7nybl6BdRjGSbHpwSKwItHnDCnVF21IJ1V1wS2IcRZggfIDlvdk6jTBkdcDhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=UMjhoc8+; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="UMjhoc8+"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8478a25f268so3042489b3a.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783419169; cv=none;
        d=google.com; s=arc-20260327;
        b=TLo8uTBKHYcC3ku91VfMYAmVzDwVVnIOt54x9J5vwncz42HeUAeX2XYn++6NEkzU4G
         gSMFWwfEVbZwE4q552gXBTWUM52fWzvCTYqmSAPbcDODa7VOU5D6uBbU7uhe9y6Bl0ZS
         Qbf0XG13zn5Dlyc3OwlGekeYhGP1ZLwf0SKzsQ+NhasZLGgV0+MaNUkqYC/JQ3jw7OnC
         4bzqCZ+MzmIAuKPDUdGJ1gbvGZVbqPPoo/3sPKt0GYLyaS9FyTueAt09i3vhLtCDiZuV
         8I5dLe3Hkw2fszZHDsTCBdiCauFcFwm4mP8WsPXSAdg4yOp1df2N8rWxAw8iAmJ7YBUq
         q2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mv6MwfHraXLOpOPByrf7lVV2PXLTdbCYScwhyOPZLII=;
        fh=Nfm059u4O2VXCvwg8YSDQNgQ7xcPKOVRxwNX3vSdMqA=;
        b=ZXJp65wWnXGcIR2211bEsKJ+DAy8Q43Qvf0U92kCvx1jeD4iEAUJdp8ygwqnJnMmVL
         c7FkaZMeyAdNTrntAv+CXbt7cBvSz2HOi/XHSZ3IENetGhcsylZNMmuZYA+/WtKc0GJL
         spGDo69M3K1UK6ekHnVysZEdrH/Hs8FGJ0BTXgNF+AxWfraP2ApC29vkK0tXNOq6sen2
         x0lidFifbTin/o56QU2SIi+PFwHMdA1hwZ/18DDyhrufzSTuDgsxyy///St7+MUfFoe6
         z7DwMQONaftaBkTZiiUWZD0cXnbdcC23j5mV7ZviZh5ZYVv6481TlmZ/N9ntm5q+sO/y
         L6Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783419169; x=1784023969; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mv6MwfHraXLOpOPByrf7lVV2PXLTdbCYScwhyOPZLII=;
        b=UMjhoc8+YZUJHMaSKbmo5keedHiIi3xT/B3p6yLAWr15yV8kVl4KY66/N1+XvAeSTQ
         0JgZmoDVrle4wJrGqXznL2UwM53SlJ/bbh045pTNxQcKY+70dMwo6pOzoS0oWNwTjTOc
         u2RzZW0RoeSFokGjqmVa6A7U1Weo+XLFnJPj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419169; x=1784023969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mv6MwfHraXLOpOPByrf7lVV2PXLTdbCYScwhyOPZLII=;
        b=XPTUrseHTu5k7MW6ZCq7/RRqX33I+hAPxwakPk6DTa6ZfnGq4/JhybL0EuKx4YELaA
         vVREKe1E2uaObgRAlgc3S+/mXZ3avggK8J0jOWm9cZzZnC66hIVDfO7ov6xEZPyDOKo9
         4OyMIdgpwf8Qlqyy9BrtAwGMM0f7In/ffKoCSXXhtnBxKqDjcALdPHG+h5FiRWy5RYAC
         mGYOLJr6zbnpPnpjx1XPr+kfvT4zgOENWF+VzNVYTn5xH66z5kKcwJow7AK/iJwyJ9Lr
         9KCFcooYo59o8nrYrJB80Ttvn/iKRCHIUMpO1MvFODtY1Zt5BjTgPfmX//tT4kSJlf5d
         rDIg==
X-Forwarded-Encrypted: i=1; AHgh+RqQft29fhwxEvoa5Hn+JpL04Y5S5n24EBfMCZZLval+N+sjIxfcSoY5j6XoAsiQuBqgtaDE87pD3o+n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2VCNrTJhAqYU3pmYn9xmQNKmraIMSfshR6371WAiwbv42acV1
	N3XOEYw4EQzj1xWWMVqlvlQBCH42qPH3bZe7Rht0y9m+BmokAgNgp0zQiAXdXORjR3bQneyw8JU
	5UKVT7490mIiGO3Ci2Wq525VBYEkcPdhTHpXQL06zvQ==
X-Gm-Gg: AfdE7ckTOLFtL/jCDtqC2q5I0L5XYLmy4LLx2sbRX1vQ/k+xkFebYI0xo9SbBAok/Q6
	Fsb28+Mw/y+QrkBizY4Y+vVoeW0EoHsnQJDl3FDVAxA/bIyLdyFsk3nKv/cyAmUn57fikxLmr2U
	Ft4EqFMTQHV00QTsXSXjfSbBzS/bJp5RRpdtXCV5Yqd6USbPjh4cp5YlYsxX1t+BzqWJOsRVW8d
	66PTLYoil1IZDnfkqOi0JzQxqAzgFvsZS4He/0zG9SKos6iYQ0EIMSynHgo+cSksoddMYweGRBR
	P7p3qzHjN4jjxumU/Ll3OxxtKhAVmCs=
X-Received: by 2002:a05:6a21:3a45:b0:3b4:6026:6c5d with SMTP id
 adf61e73a8af0-3c08ec75571mr5952541637.5.1783419168806; Tue, 07 Jul 2026
 03:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 7 Jul 2026 19:12:34 +0900
X-Gm-Features: AVVi8Cf_5970hyt1ZG5xAv0cNZTBqqHYxE2V7YDsUBypVXjTuHCC-S79emDaMzY
Message-ID: <CAFr9PXnosZdL+DA2K9_jOj2QvrgmTL++44UorwZ--BuKOFNsGQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: sigmastar: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Romain Perier <romain.perier@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 7 Jul 2026 at 03:04, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Correct indentation to one tab.  No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../boot/dts/sigmastar/mstar-infinity2m.dtsi  | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
> index 1b485efd7156..437329fb912a 100644
> --- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
> +++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
> @@ -7,17 +7,17 @@
>  #include "mstar-infinity.dtsi"
>
>  &cpu0_opp_table {
> -               opp-1000000000 {
> -                       opp-hz = /bits/ 64 <1000000000>;
> -                       opp-microvolt = <1000000>;
> -                       clock-latency-ns = <300000>;
> -               };
> +       opp-1000000000 {
> +               opp-hz = /bits/ 64 <1000000000>;
> +               opp-microvolt = <1000000>;
> +               clock-latency-ns = <300000>;
> +       };
>
> -               opp-1200000000 {
> -                       opp-hz = /bits/ 64 <1200000000>;
> -                       opp-microvolt = <1000000>;
> -                       clock-latency-ns = <300000>;
> -               };
> +       opp-1200000000 {
> +               opp-hz = /bits/ 64 <1200000000>;
> +               opp-microvolt = <1000000>;
> +               clock-latency-ns = <300000>;
> +       };
>  };
>
>  &cpus {
> --
> 2.53.0
>

Thanks for this. Looks fine so:

Acked-by: Daniel Palmer <daniel@thingy.jp>

I intend to fix up and resend the patches to fix the other outstanding
warnings in this stuff but I need to find time to get around to it.
If this patch could be added to arm-soc or similar without me sending
a pull request for one patch that'd be great.

Thanks,

Daniel
