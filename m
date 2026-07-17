Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0EE3BED46
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271551; cv=pass; b=Yl/6Bc9lFVgvsMx49qIuIA5YQLfL0b2RDegeDpXh5gRWmdwbx3/Bh8VExFJP6GEfCgKoyFBicGEp50TxuNIcQQman6kQIH30HSGEQ/aPaSACRX/I3YIkwIEq9AEqaeg1Bg+jfU2y1hJ4400/y2nDA0D0hyRo0LCxGM4FlxCRjUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271551; c=relaxed/simple;
	bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJGMm8w+SuY2DA8ixajBNhOtwF/M4mKkkW1Fzn48+qgPO+lHSjIHAQdPq56NfcT1K/vkODQfobYSwe1oL2i+JskTk8RwbZPpy8aYytOI7S/dULeUavubVvIMmZn4yX7649lRVgYmLybo4fpeIEWKJ3UhS2wEafdK/eQdT312YBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D26oLBW6; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D26oLBW6"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5218927884fso1246191cf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784271549; cv=none;
        d=google.com; s=arc-20260327;
        b=hUEFwijpJu0RtKP1pjt8rMkwh6FS2Qt9LV/tJDIAGTLGUpXN4AjCR1nJYqxTsMuZ+U
         QYbi9LBC8b0xMiDNAYE8I+52QEL5lgYfjREMgK4aKaEKGwgDzmg5BWato8+ouG0qa2FA
         5k6jAJxy6oGa3uff1RE+G8zqh/b8B+1bBEVG6jBZ9lLX1Bpo915ss5/M1O5o0ycIEG/m
         TIsbMq/K61U8rjLVL+M3gcr2qSUXrUxn56gEXwXaA4MCmmTXouTxFTNeJsMB1xgHtTQz
         UY2v9ay4GW8BTqOsmtOC8X/s9uAfd2E5S4Ouih+GDsrwZFS7LtTrVTbPnhT6wN1syrHv
         CIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
        fh=ZPc/sjyei24ba5X/gLN9ViN8F8xC7zTpHmyAPy7A+mY=;
        b=P0PiVq8c9gLxu/JqIjJhDtE3SGtqq4zI8wW0csyhh/3Ml3lsNjEAwPQ8NN2yt9TdLt
         JPo/i837omPsGhrEl3QZj8wlyGH+pLxsbjAN7MtMkA4FNpv/Nam2Xqc8bXmpuP9Sygsz
         bvFA/x56SeZkzKvwZCr3v39nTbgDdJMTaRjtcVdRVNycvgJ4OgfuvVpIMf62C7oVCaWq
         DR8xDI1XD144xcRIAR1+KFLvPI2w9h5yqt0Pl2uN6u1Ok7mDF6hgwlh14CRGztdl6kkx
         yFeE8MlQlokF0fehA4gWAlJq8Y6Eh2fpnc3ag7WY8MM0Ev0mfPYCgy6SXeAq4dyM7wVf
         ZsfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271549; x=1784876349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
        b=D26oLBW6a7XhYCRE7IYFQKGj6zaPxshFzUFEGZUDTkQJjv3BnRcWAjb68bcFdj5HBe
         ItI1JQvoqf5l41B9/YMNkIbjKX0gnsbQ8fZ0+YKtEveVJnlv2SoZMi7oYLN2QFUyraxM
         +LbLy1HbhOzKdbskBEq1mQSp+RGLDdmX2HDCSO/IX6v50jiVUoCzc+Iu8AjfPoKeyQ7q
         jM0exS/VWg9eWnISwxZ3aTsNe3iFy8DNjplJ2IrIqTteSh/yBe2xcPde6CHiEME6NJtH
         oZKqx8CqisKYGiOpnZ8RLuawwqv8caSjlwY4GpyMbYp+9fKcuh5cBoHBfzuUFmq8Fmh9
         HHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271549; x=1784876349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
        b=WneoNjxdURjS/7KskrOdtgKzHkIpXoqp74Z3LvTIIrtO4ylYqaiWbzTQajp6le3vHJ
         rFDGa6PkBh/OzQecSMNav3IzRZo7s4YfZAiSxCqrXkWDDYpIYdsm0zyIHeW5qwNojae9
         sqaPadw3qFx44qYI0fiOdcJiVSGThUVH087H/VETdLoKEObvsz6zXOZyWfhtpaFaCWcu
         7Cxm9wi9G6L1IZsxw4vT6X9c0tF1IE9wjiXZ2VJW3Fx3GC0Sy4iRxva3P8ozb6DirnjH
         /wlY7AO9z7rbFDlVhYsjB1WZHsTKBtOhCCIL1eftP98OMtgiokyAByxOYWMEl7B591VR
         zs5w==
X-Forwarded-Encrypted: i=1; AHgh+Rq5VOMLM5Ouhyy2pY/kSdwMkKq8W44EML35iq9Y6zF0NO79nZ5vJ4AHvstHspUJr+G6B2GdwXab6zOs@vger.kernel.org
X-Gm-Message-State: AOJu0YxiIB17dComFr5uQGW8DuB+48lYe9zAFohBAtOuYibD/9Ewx7Ns
	sCiRisjWt0P/xe7Atz2XYci/0ZETS7Uz/Uq36rXBwaiTOAKS4s/DgJnkqYiCtvL6G+rQcieTNz1
	7JmGuYPHhnAgTaOlHJbhsjnMfaP00ENA=
X-Gm-Gg: AfdE7cnq6PnT2BqJCT9aHCKg+cRZtEVWFhlsLVwdIejiouBglF6HaA7hIZu5XqtMYfX
	MTD1u+A1oMwH7nhAFtH54sFQfTJsWScW2qRfKmqHnF2EuLmnGkHuzfl3078Rp+nzWr0kYYxzt4B
	jZAeqzmQ/73GkHx/6T6MMmHILmCoiezF91YkjeO7GO+B158Wq0ZixbUplBTsH9eQ0hmOd73d0CX
	dutDc8SNWXmi+moe3awMP4bvp0CP0Cwe9Ms6J+VJgXKLGPI/d16as8E94elJVRB
X-Received: by 2002:a05:622a:181f:b0:51a:8c86:bd3c with SMTP id
 d75a77b69052e-5213c9d9a01mr11762361cf.57.1784271549319; Thu, 16 Jul 2026
 23:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716171733.300885-1-akkun11.open@gmail.com>
 <20260716171733.300885-4-akkun11.open@gmail.com> <20260716172730.089081F000E9@smtp.kernel.org>
In-Reply-To: <20260716172730.089081F000E9@smtp.kernel.org>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 15:58:57 +0900
X-Gm-Features: AUfX_mw-f0NpYAct72rPmUcEbtzcmaBSPm7yFj-EtAmmmokjNJ0yQdRy__B__oo
Message-ID: <CAKr_iV6PsWZ8MPsO2NdfS1ppy6pUCGjvn4MFF8UMz7updckW_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add MT6589 PWARP and MT6320
 PMIC support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 2:27=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> [Severity: Medium]
> Does using PWRAP_DEW_DIO_EN here instead of PWRAP_SLV_CAP_DUALIO accident=
ally
> disable Dual I/O mode?
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716171733.30=
0885-1-akkun11.open@gmail.com?part=3D3

100% correct review, I'll fix in v2.
