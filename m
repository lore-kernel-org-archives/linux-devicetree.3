Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D096A313551
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492978; cv=pass; b=NM6v+GnVTVUqC/+DTJZ/NOaXfU5LBUZWpkEmSqCvSVIKSjN1ZaXebOq3QvsMojzNQ/nvM+nXbI+ePjz3jBiWMoDDsvd+Zj/av03BzHzToCanlytweEajLY0F4qfmrLmQOH1JvxwFCssVtODBdZJoX4uw3UY6Fmqw+RibUxEIaLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492978; c=relaxed/simple;
	bh=KshmJKh+TUxYPOLdNdAC5hbCrY+P9HCkMwuTQC+4HDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qeeb660W3441HkoETDfsXOlSA/wWHvHwshc0TL0k6bUv0i4it9LIUeaux2X/mZzyaYlY8YJGA2Ah1iv1dagcipF2wvQbaLWfw3u9PQPgV/o0tNIo6DvpCOWEqTtN/04rVR7FSnrDuxrJTxIDSy4yyMdxS8mSRpsyAbAKEKDU0VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gFVFBfeg; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gFVFBfeg"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e8292423fso27391251fa.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778492975; cv=none;
        d=google.com; s=arc-20240605;
        b=dBekKKYIJDpT14a6PPtGy5Q7bs+BZgTxUX76hoNCTgi/YOIzcWBwWVkXgI/eGb/Tc9
         gqYeQNP0jknfyH+U0mIWJFwI0rXCq276JWzW3no6flHcizihG59PRgZmFUHGV6PzpyVl
         wqqeY/gWUl3xC0vSE7qbI63f+092ayXOmYDj0yHWjx+6Ugt9tQUOyBnIv64Uw4jaUmcP
         ZMpCaU7ETlwcRxLlsbA512bujXuqmu0gIqBSxZrXrhGPCkYMuDfDmCErOBRUcoCvhRJw
         PHD2W/pZStO9QOWk7pjDeNkjc+1oqba50XDHi+qKN7n7X8o9USTObGbtvWusMhHajwDj
         FK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=;
        fh=UhQJ1rEviLokPgJ9H+NSYap/3N07Gut51MLh/wVy5Q8=;
        b=K1Md5HjrjRxbQlBAnS2DmqR6bOTPCZSuw/VVa9n392bGeIsTHwet0s3ZmTMOxKuOXx
         qSuWQMzMzJtedgSIvPmjiUytXDTWoQipVFQIOLKPx+ggeD/dORdi/HsanKOvSuWZvNjE
         ffR1VIULcUHLuW2RJE9ELYm4DdaQHhkKLYa6vNgLn+cqLGA56R/FK1kO+jTM0rIi6fNe
         MhvEoC4zbAm7wgD2K6/jgHHnZGijhwFzMLf6Kut5hrIUUw0bjR67L39byI13Cb4v8Mhz
         AjeirZaSjgL4Q/rZOFQBhCThalKKtOIrQKYEnAJ5pCm9cwyPE57q1vAcjvZ/gN8pvPrB
         z0Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778492975; x=1779097775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=;
        b=gFVFBfegXTUxbjF9Yu4kaJ3t4PJK6VI58iLgAPdF7Cn67csWf40GQMECKyfSudSX4Z
         6aRqIkQVSdnZN4x+o5+3e0bZMhetj056NRfqJl7+W9mnvlUTqWSokaqpq31OyMt/qL47
         bRi2SndtmcJqE2JngDHqJNBKvO2NL7uqAhdN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492975; x=1779097775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8mqtx3+0vc+jv90ZX77xIIPZlJiggKZDSroDOlfYZM=;
        b=RbXHKdSkq0oqli1ad1U0oTE2E5Sk2r6+HMKO8Kn45F4mzshFjHvwLncSIBmJQpyiTJ
         alXAdh4YOY7+y/ZWamSZWF4PSi0ucB+VGA9A0fb+TNxZoTaL8HnvWbPfcUBHCNmxP0gs
         IjQgGeFjoMclYzCbPzocXH2yRT33CoFw2lJsiK33srCqAkAInaMu38bAdAFt75cmQXK3
         zGqhEPj5ClynxGMgKgy6gZumfw0aAVrIsXJBnwdbU4Ej4hp3aLJDNJPn1kP1aX1x+99m
         agYU4Ztoi/pNpTbIjwbeplz8QAbsDWm/ST8o7vf6RTXMgFrHWFtrkptPMG8oBom70T9c
         RWsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9n/IFnNBwEdnxDBKCtpQoMFk6J3v7y3TF/8zytCDhooFgzjHI2nIMQucfQmIXE2zdhWBdK8tBNGgST@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdFMz//9VfM9dzEUOeN6e5Ky1Dp9zw5td+tp9HH51n56H/CpK
	+T768atLDh92OV0db2GseB/ApZCQktrj5nLx9e7dIBf5FNuG15Dhi+7AEMYsKIYcfQWLrO6Ch4x
	6gMBhoUKHRNhvUro9Fszznr4MownfM2qCv6XmS9Kc0TuuQew8uELlaA==
X-Gm-Gg: Acq92OHJy1ZzreQIzkjSvYYRWiD5oWsuoDWeGszEbWiFjki6q2mz+T00lRZ9vsXJRVh
	gRRxXmJRzwFEjwS5SmWh/WcQ8XV0NtPcUtOc/vX5ok8o7GLv4lOQuY6BoCMFSZ3KfokWDTTXzGw
	SeJ9wmiMhksUCoOGl09vt+8cbBUlpwo3w5ZmLkmInI1nhi8qlSEsiOF0HS5j6pJqyxPFcCuGZUc
	m/CKh+ibT86+7MsFu68fVGSfiRq3XeXaKLIwyoIFFRjWj2mEEhJpnax2/YgTCl8LX75kcAYFddH
	YLuOlPzGJKSiD2EyCfDcuAbppLN2BGiead4l0A==
X-Received: by 2002:a05:6512:10cc:b0:5a8:89d6:93c3 with SMTP id
 2adb3069b0e04-5a889d69612mr9222261e87.21.1778492974942; Mon, 11 May 2026
 02:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430120725.241779-1-wenst@chromium.org> <177849219930.115964.12285046748812181326.b4-ty@collabora.com>
In-Reply-To: <177849219930.115964.12285046748812181326.b4-ty@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 May 2026 17:49:24 +0800
X-Gm-Features: AVHnY4I2n3jCQB3QPukN_nmGjnmGT3z0Rt-UHUs2BJl19pmL8VcxIKApqqizml4
Message-ID: <CAGXv+5HsrUQ0wb_8cceGZywU-HNxbFehP-NzKmPs6f1q_He4Rg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA
 bounce buffer to host
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 5:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Thu, 30 Apr 2026 20:07:24 +0800, Chen-Yu Tsai wrote:
> > The DMA bounce buffer is attached to the PCIe host controller, i.e. all
> > PCIe DMA transfers should use it.
> >
> > Move it from the PCIe (WiFi) device node down to the PCIe host
> > controller node.
> >
> >
> > [...]
>
> Applied to v7.1-next/dts64, thanks!
>
> [1/1] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer t=
o host
>       commit: 0f91911b61d06fc02a058ff7fb0a27e53f7b1136

Sorry, but we actually have to wait for a matching binding change [1] to
land, or we'll get new DT warnings.


ChenYu

[1] https://lore.kernel.org/all/20260508063633.3894348-1-wenst@chromium.org=
/
