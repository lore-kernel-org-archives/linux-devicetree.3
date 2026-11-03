Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793717274;
	b=vnm70jAwyzb0dugrRaAV7+tVoFsPwobNqGoYJO/dprS16/Py1L/kNe/0p63m2pUDwv2t
	 QDLmt951DpMYVwteAGyer3BrzzKdPrGHs06fC8dzqakQobQaRcvFZQrzbuPZi399BxhmA
	 GoQah9qdpoXSAZjh96ilJ7+PZpd7aTqhKvnppdFWc2ttBg0f2GfntDYEtEGYLURoZUZny
	 SZBnbeP3edlTdK+vEh3AnDX7jpuIhCse2ZAvNrrFHbfnfNyW+NTlZmzLrdWRkK1lUHahs
	 Blkk8EGr6/lIVxt+8ZEtzAw97XLLuXsscgdfMhUSz96v+tydnHhvJcpX5GeHWv2pnCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
	b=IuBL2ZGweN5Cf4BL2hseiSwM5WpUmHT9FL1xbEIqG79K51J6qzAYeN0Tudj+TjdmLpkm
	 kFRj5AQFMr+Dft1lQ9H4f9FbnOcHlIAHyu/HEB7ND7awkBRDM3y6tcLxJNOMXfcUGIgL2
	 Ry3FkDfrnL2KtQTt2u3FfGvWb+C8bDmUIn7RynJOBMbM7GM9eyo0WF9jeFxjgT4x01gfa
	 2DdXkbLqMrsUlod5NdiTC//JyhQUO0+5t+dxsTp9fIUMjqJYJMTomxmRRKschmBTjusPR
	 +HMhcokLQD7bgP6qMg1o2ttlO7D3UERApmhrx9veiJOJqyP18joTKbI0ViKXsotZ6ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UuQVJ/sn";
	arc=fail smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE95C6083613
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 14:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE95C6083613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UuQVJ/sn
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67b9bd530b7so2863035d50.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 06:47:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717273; cv=none;
        d=google.com; s=arc-20260327;
        b=jzrhSEN9NZ/DRC+napmy0CBglCBp6B1vVynD0N0txAhbuVnX8XvuAPZkyiTyI3iRBC
         lOxmCN+bTkes0IRPDqK4v4V3syty7LffC6Hrk9zx8fWXaLS29UXIvgIKjige8pasU2wg
         TZunW2lLOAQKtOSoDrUGPcbsAoXcRbQSbryXA1JGcFXxKiOu8vT0tnyTfYuEJB8S/4j4
         V/mYTGPNpPPXhSmkrj14/5TzLncUOcxl/TZAjaBofZd1gmKTWH9kXSeroPyxNIYul2zZ
         XSpTLURVfDOSjexhMe3RQ/1aEfQIU2dI+ZERRsVNXwcB/WC6cViKYKpzNYY8nOiEQgow
         Ut9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        fh=ek37QmOzvqkyB3JZwuL/pJo57SMcEqKVWXiiSpAPQ1A=;
        b=BhIKbioAaBOroYp90jh6vZbzVduHqwA9RIsHpIQ+e80Ry10sF60a6q9gEwrpBlov+k
         DFDP1POQ8xA/XRVcwux/rTD8YP6S8ia8ycwlTLuiLXflaXObAi7Ot/s2MNK1JWJnTN+z
         iQEFyv64MTIF/cFS44W8qeDMgXaxlj11IdiyA/R3JENXJoFNqKtsnVWeHdloM/7ok+Gs
         3bogznvcsOY2rKbYaSb3cXskwgELmGBM/sTmwynpCosrPIApqrjMKnR2xbZk+WDiHVP5
         iPLcRnOq/81iUczMapf30Zie0pXdnrnwogNV/R70D2HcVe5kewHP+dH5xNIoR7RyB8Wv
         Mq7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717273; x=1794322073; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        b=UuQVJ/snCoXiCMQgJPntNY0UAtPaFizeOkCkDOcdqTJQ5p2n/Qj9kIChl6SRKu4wsV
         rg0nCEOCcuC4vPbWN0LsXKBGZuDZrktSsZizVPg5XKoeEYd2PukKc0sMmK7IMWBBjiPE
         O16dQAmFWCxU+0/lF5RqX0eL4ydrgQxdT/3SMG7aHWhpKW3cG/G6kP1AeIElkMF6FUZ0
         A8qjyl2Y1BeQIivNo0OaYmBTy0RcVOE792IA/cFSaHtlWsM01ao4/05drZspWy9weijx
         F1cBSklbK1VOUTxdTqhqZST/BUEfciUuDJvBGWRKODM4SIfGu1XcenuzBfxvHNpvGH9a
         dZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717273; x=1794322073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CkcRa/S6TgBl5CJi0anIsHEsDR7YTXBHcoG7SibQDDg=;
        b=Zf8xc3zK91KHsKZ66zoJ6GuO+OexTtvTPs4cfrxFQfrtwJmK5wphVwvCzpJX2f94ok
         MNLKwgvcwNHqutbupMOC4hYLwgZvbi7Aq6BXUVpY7dJRUtxN6uBnCV1D1Fht7S877538
         hasddZSyAN355sn3gJYk00wGsx3KQBOA4mcvN5yDSakgGiQVP8myfKX9dQLicT2dipiL
         BDb6wtgnaEimtc+5nj114fUKDEHy2+Q3UClkb0tzu/gfNw8bGAZR1amoYetTKEC+Qmcv
         SV7npjJukuQbu1vdZ3qkGe5CanHyExOS2sAqomkGncUxYCF6j7cX9y59WMPp7VxdOs1L
         p70g==
X-Forwarded-Encrypted: i=1; AKwUvBxtydUvxn4apFL8+sC1IwIrPjVybIvawMuJnyrx286Xc4p14f7/P1duGNQDKyBjo2j5++AQ/1Ebio/X@vger.kernel.org
X-Gm-Message-State: APuU4Z9PA8Jw5L7lzfKKlPYcPjtNkP+ZyjUPILJwTPQMQq6/F5cm77va
	9rAvwyeP9az/tRS9MWrMZZbG8dwY2KRPazljPALt++rTZ0EMMVE2y03eGOR7PZsL4fgRszKkxRg
	38SL9VKHs9U6LsAM4sXO+a5OQ1tggFQ==
X-Gm-Gg: AYBFou2DcsqvnfaLghvWLqyI420r93RGtQwfpZ5Fti42rKpRgd15c3phj+8DgulPN9b
	Rl5D4Ak+WIF1tX1/61zCzpXO7G4uscrsxM3k/ZHpNjRoTpUPMjrEAbBNvJF+c7WC20AVtKX3jHT
	g1ce7zZegrLEhh+VyOvQJF/EDkrQTXH34/ELD8XQHKMQZvEBVjhvBTq2FnYHE7ALhpmnZqIOnCm
	zGzgTlETqvnMrJFQ/VlS5Rm1O59YmdX6GJr0JMGhVwXMixf4SrVceq5bYjEAi1fhsgZFGQolVvR
	3bnCJFREEj2SFuTHhq3ghXkwmLsICEg+oVXrzREX2dMgntVGgaRnEsNmlLXQaQV+bzOXHBKVHv2
	d3135JEkZ5c+spaAqq5ikqy4TZ+LEOxwcBsZlabaOFhp1dfYXcqZX0EYdUKa9uzFJHavys1CJuH
	gdk6hM3PmSNfqt0Sw=
X-Received: by 2002:a05:690e:4088:b0:67b:e1cc:ca6c with SMTP id
 956f58d0204a3-67be1cccb74mr681732d50.47.1793717272964; Tue, 03 Nov 2026
 06:47:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com> <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
In-Reply-To: <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 08:47:40 -0600
X-Gm-Features: AclHuK_bAiiHjTrLk6BAhfSIpWQ6uON5mPRZGYY15ZS0axcuvmvGLmO8IscHRKY
Message-ID: <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> Does the downstream BSP have this? It would be nice if we could port
> it over. Then you can properly use the power allocator and/or the
> schedutil governor.

Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient = <190>
on cpu0, and sustainable-power = <1200> on the CPU thermal zone.

The energy model uses the OPP voltages, and Andre points out that the
current OPPs are A100-only and don't fit the A133. So I'd like to fix
the OPPs first, and then add the coefficient as a follow-up, tested with
the power allocator on the K5C. Is that okay with you?

Thanks,
Rajan
