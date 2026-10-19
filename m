Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFFE48E0E9
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397720; cv=pass; b=A/A0aQHEBOxsZFw6JEWLDlyDax8iuYQcFQGcgxS+N9Nc/QxZnibvJNh4Z29DDrrTSEmgDJTGI0MA7EmOlVReKKSg68/w3i78HlyAgd1BAS/xb4D7SZjbNgj0PoCFKsRakBHQjTGQOTAb6HMWl5ihD5IfCcOhXHhcdUTlx1FvhiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397720; c=relaxed/simple;
	bh=gMt+7JbG3jjSGNo2y6QC4ePJzR0+6YmVengrB6NbMjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTAHkgQtvzntAtZIdsSprPbS4sJSd6Cb2ADDNK/GkD/BkITzI/pcntLUDfoiToSU+7b+r3YlP0eQ+aCMylnXAmwL9s9LVO/h/cDa+BmVA0/VLDpE9etEWAjQgjgOo19RRj1cSFZPHQ5e6tas6tzNXW7dVrW35eT2h8L8G6l59/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwTUszms; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwTUszms"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-677d9c68d09so243997d50.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792397718; cv=none;
        d=google.com; s=arc-20260327;
        b=Cu0PaIlyRJ9DfI3Lqa50qj8PC2R+uTkvERvp2iZSPlxBWZRg/jKLAouaon4yQxbA0Y
         zNNvTUymYw9xEPqnToOSiXiLk97RxwTU2BN7xssaa2PAPI95hMilMA2/q8JMekElZs+f
         sybD5+Au4vdrOxq0pNw3wtSsB7GffuAeVoZKpa4tpM915l0DsRWW5yo6hlKQ6hdGtgvN
         kkx0ehBIgQWX5HoQI345xPjbhZtiMOLtGoqF1FM0bTVcftXeuAkGOcF9NJHzwdLe4pfG
         m8M9GjFNotvs3pRoCmDK2hTIfApt1AgmOnT+5daNWBPPPp80Cp9M6o9vtksPdW9K07WS
         9bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=;
        fh=Wq4zM2ZF0HgETQpqk9wVxZrWkYo8dEmiaOsLLE9mlUo=;
        b=AFn2hi5CccADC1lsQKAYtxr9ePscuSfPyv4jby4vWxm54R5XgvBQcqWaZSXLQhWl15
         jmsltDGGOcAr6pvDqZDcQgOZwXvaQha2nV5cpTOLM7vhY3NZnvkmG3tu0OAEU5Qr024f
         fUfWsh2gFLnnObvwEBOYJbuTD54zmAY0zA2GRjpxSazC92LQqWHM4Jd3PPx4h1lKhJfP
         m1yghA6055Dj3jBeZIeO+vrNiAY73TW4PqbfHxIFRk+ZyaT32bmnOJEoZufSJARlSVIn
         zdP1090Tn90qJG8XUOebBDJRXAyiseeGmgFt/szcD9cxEkIGOvSlgk9U3QbYKprnWdt5
         q3EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397718; x=1793002518; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=;
        b=SwTUszmskZQcVUL7kwqIprP3//2zk3++YAAFYKJt79fTx1pvT/Qno8qcw6nACNqjzG
         LHHPZQ+RD20no/bncTbnBY+LObhX2U3jZPjFL7yzUfNcEIykEsXUIhhhnoH3YKqPhxyS
         5xD2vI58TTtYEBg9L8i2NjCwvYG6iFfuWKRKl7Ioo1ws3zAzD4S8iggnHXsN4imhkwg3
         mLC7zkR1HrKnBHeoP2NULCTgGWVo8a1GBEAT5BF3MJJZuRXUZj3xQbb8Tq0zFD3ZAUQy
         b0ULDFf/Mw11Rai3MkIkctqPBRwkuh66ARKa1AjgtDteLFTMvODI9cSpguA+DvRnEWH5
         yicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397718; x=1793002518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=;
        b=f6YtnJLQbV8K7vY6+P11+ihBpgcRE0KHGzEqxbZIWqI5EXyCr7eT2pp0qnJcpCFJBd
         20Qqzh784a1uKKtAKaag5uUQ9d81/VO45t55ZR9ll8h7PbY5bhGgXdsSE9kPJrUVPG78
         oJJ/LJD5lIkCTIH6JBxxSqQUA+3JJxzvX9g1p7lPQ93Yi3y1ER7Bj9klaWwuwjAc07eN
         p+TNoZ6M6UxJzPNEUNahsZmV9iJ5DlcRrXuArNAEwSh90qv33aLWeRWpwjPcpRI5x2Fs
         V7i+YAZyQ6FN83u76yYdpMFnnv0YlPhDR5GiGFNA4UfpkzODMUmxibubSUpCVNp5A2sm
         zXBw==
X-Forwarded-Encrypted: i=1; AKwUvBxRWTkpFsko3GFyGBVfm8+/W6eZ3eFaIPSW4zE4g3nBvRh1m3Q5Nu/Tjs6uDeDi1WL69blwBKOZa9D0@vger.kernel.org
X-Gm-Message-State: AFq9FYLA7VWB7JFwaDjrtJZfngl81rl9YdNTiL7wczJi0pQRBTE1QT4J
	aIKZldgJNf4kOgXDpWRjyOqx/XyAvGD0LWwXSfPooyxeUUdF/y5thH7L9pnUarIu2aA82F1Krrg
	W9Ed3DGAZB4DUV+DcNfPyARuHEozCP88=
X-Gm-Gg: AYBFou3Yr7MTd6HWyFFp6rL92PW5h8W/SPgK8lYC5lPrvOj6vF4rkJh0U8JqUNJIrI9
	IIo/GWLPhyyDF4mTpX7dFo2uLGoe1YHBQhSR7bNW4+E9ES4d7RQpTFjRJePsKog/G0DcadVnCrC
	o6lgZTpVfEhwBoACvHbzcnOiaZ/yjyZvHgjZrXpARrpzF3mxnIoBGDjyJgQk8zJSCTcobd85sZs
	lnriIt1pDJRDykP1Zv/N/LfVhfZWtOZJeFvFqabcyID9sajwzR6cmJEfXeiQqVMIxOMm44ooqBB
	QH37JLHpKWzNPo4Hl+LyFeJCJJ6zsFX9Efv3JxYnu+bZrU8604+wUA==
X-Received: by 2002:a05:690c:686:b0:853:bc96:d834 with SMTP id
 00721157ae682-8b0f2149354mr41098877b3.2.1792397717882; Mon, 19 Oct 2026
 01:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com> <20261016140115.GA1798470-robh@kernel.org>
 <20261017-gainful-goldfish-of-climate-bef863@quoll>
In-Reply-To: <20261017-gainful-goldfish-of-climate-bef863@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 19 Oct 2026 16:15:03 +0800
X-Gm-Features: AclHuK9_kQhXB8k-ejh4iETHQ_pbinYeRno2QSundTfXAhMLFdEsJrbL5fs5ZiY
Message-ID: <CAPwA33+bR1BF9KeA9my07Yz7gXW7TXq8EPhwQ4GvHMSFDk+uWw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof, Rob,

> Existing OS should ignore surplus cell if the driver is coded properly.
> Same as adding new properties or new front-compatible.  The question is
> how the existing driver behaves?

As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.

1. Keep the second cell. Add the patch as follows:

- if (args->args_count != 1) {
+ if (args->args_count < 1) {
    dev_err(dev, "invalid number of arguments\n");
    return ERR_PTR(-EINVAL);
  }

+ if (args->args_count > 1 && args->args[1]) {
+   dev_err(dev, "only the transmitter is supported\n");
+   return ERR_PTR(-EINVAL);
+ }

  With Fixes: and Cc: stable, the stable kernels maintained at that
  time (currently 6.18.y and 7.2.y) keep DSI working with the new
  dts, and the receiver fails cleanly instead of getting the transmitter.
  But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
  It goes in with the series, since two-cell dts only exist after it.

2. Use a flag in the upper bits of the existing cell, as Rob
    suggested. Existing kernels are not affected, unless a board enables
    the DC-PHY CSI-2 receiver on 7.0 or later without this series.

I will write the impact clearly whichever  approach is selected in
the related commit messages and the cover letter.

I think the cell approach is easier to read and more symmetric in the
long term,
but it breaks more. Which one do you think is better? Thanks.

Best regards,
Jason
