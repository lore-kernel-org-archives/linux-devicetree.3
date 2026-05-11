Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EC93B47E2
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485916; cv=pass; b=TMcx9yi25iaGVaQ+MzU4MlGnLj0dcN59uAqgrfn0blp6jO+LxBCkuX9Z9y18cT/P3EPppZl5t57HNygkFZmdeUqilTrIW9Wqppeio0Lj8zpSiCOe4kwFkD5v2hV2acInkuoXJHTMW8fWE/kzvwNt0dtVQfC0r94dDLpW87nxXsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485916; c=relaxed/simple;
	bh=bCx3idiUgw6FJ/orVDV8cPd6ZVl8C6kyuoO1CVbDxWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=losUrlVttZafjlQwDzHO5PVrOaCpEucvxugQdfSArB4BNL5LwN15GFkvKeCAjdttlX5CAw63t2oQ4w5cMz7qFzd6FIZMLCjvwRAhHg11zSz/g4SwqPBK8BiQt9hA6a3ZoMJE5GK/rz1odMgNG0uEA/l8LSEMVJZe/V4TjWkXMYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqEcliXn; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqEcliXn"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso2310453eec.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485908; cv=none;
        d=google.com; s=arc-20240605;
        b=jXzHli3+4mU/5PhkZJ5P8n9vxK7RCzVBeOX7u7XGtaYuj9D1/W+e+XnKu7fjsIWKlE
         p7Nt/6lvrB8NpXRadRwAiC1vMTzjDqew5eMOSaldrrdaqUtLS1LnAG5NWb7nQzd6YD64
         bcWXAxcjixiKxK7XrvEAl/HtOVUihvXawJIfoddZO27nkfnjKCIRqjEcxDAE8SbvaC64
         n1fb1qQ8/a+MJADvRgaVygciBijypqB/u3MCFKR2FdUiK5EKQCemRQc065JseKeYfSRu
         DGLYVa/uDYsaouNqD6i2RzP314+x6ReRAp77+nCX3gtC2p2sNsCHAVmXI0EQWz/PPKtj
         GagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HfSXgZ6aPkpcMY0bgCjU5DFBgjmnCeqKhXkXLLdbLpc=;
        fh=MIIjKpfBEZwWPv16oI7u0/9951h5hOfDd2WN5Rc6we4=;
        b=Gswlw7eZ/fQJT2uAqRWINq/mopp9EHN3m8zYZAaIQ+kaKEpaATSV69CzYHWL2cwuD8
         /KGGtrieZlQm2ftPvuwLx69wHvulOZzGzka4gPldnOsuCMmmXTW28Jo68TZwD9Byjxm7
         XBq8axrOQTk/RFhNKBJeGcx8amKzkB3sOlOWxL9o8X65BO5+lJi+RBwTyT88oudlHVXW
         yKUiZXf8mf+TaiHV7z1Kk7jJQLHe1Y1y53DR63OKYEwuDHW2XL5ijEHI+Ety6RmNF+Rg
         5CSRVKdwQ2NfhfLkoelIphutsEED+cIInv53Ob+ibhqEGiAhKdkG8YGEVZSPWnhHPKHV
         iTfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485908; x=1779090708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfSXgZ6aPkpcMY0bgCjU5DFBgjmnCeqKhXkXLLdbLpc=;
        b=OqEcliXnh5R3VBLlUVzq4/J5A3grhtY+4qJFZr3CYtqcI64hxeyZh2dSF5vv0cU6o6
         Eykk5DtmU9t5u8MGWohv8ZMKwvBeQSYFpjudIcG+HXM4QdjFhoT4N3PhMsLY0eovH8J3
         zbHYbGcRD49VVvMK/JR/eQdPuWFR7bM1TATIFyFYYDhDwYTKrF+Eq8Vd44lJWrPcpn5v
         5TPF4sBHilYJIxcX8F4jBB+lEE5020+WYK0gHLAo4yT6fiiqfqy8yk+2k2vMcLRrGu07
         sY97dJ8N42BtXFDpfGLG7TmvLla3dQfrf0vUVXtRQ1hKFL2iZbs6e+XxQ4haMf/GfwCx
         F3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485908; x=1779090708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HfSXgZ6aPkpcMY0bgCjU5DFBgjmnCeqKhXkXLLdbLpc=;
        b=cHQVWZMtbNL+547A+osJjpqFVJSYIZ6pk/17UENLz4HrFSn4JPYoMyBpG76AtwejE7
         ubRWu1B4WbH0bhKJHtaQrsWFcl1PfWcHCkeQrj4yO3AGYjqe40I7b1hFaoQEIzwBFg4R
         neam/Q1OPJZeZWY5ahAKl5EWjNYRLNEQjYQqvnFQmH4yssvKHsWrbCDIxsJcZwdmoOrk
         iv6iJEME35ClzRpunPhQufeLqqPB6ufQYPvkltuxFmB+rUTmphkp9WqIfCSBunmKuCJ6
         cVBcaM8mQajNZRJKsKySG6VBWP4zxCgp8Qp7hPTfsLqdDOSDhVtYVtZ0lp6mgIqqbsek
         o37w==
X-Gm-Message-State: AOJu0Yw4r/K9qLmpZtgL7IZ8fRz/ucsKnZHdQFoUHGYO+yEn89to8z1s
	s1c5UpXnSUHzw6vHSjarhm8MNHFcJDFhMSIvS2RLM0JrLA4TI6k8t56itamF3Xdissf1iVXmY8I
	W7Jv4VEJBO9pYVQ8d2BdpqKKESIP4A5M=
X-Gm-Gg: Acq92OEqxoWNjHIVRiBNrxStbXpdUvhVBN/nD3U5P3vpUBIM514hLbL9Sh94MFycaAg
	te13+WbnT2wvPAmSpLyT1pvCSIPbiDGsWSnaNLq9INLE+3YtcKitlCqKDAEP6FhgpjScc7O9AK5
	zsvD/7bK5fnc1C60nkSWMY4gF5WB4nVevKpkSjsxwRzwZkiJSmDTB27CPfz3jukQ9abye1mwA2q
	YurYLIgIHrgDpw1AZ3yzo+dsklvQIps+TBNZtOujVV3RtSy+Mzd0LXWbrM1ffJVnUbCNfczFNvZ
	QLppxJYKVHaUnIfuQEI=
X-Received: by 2002:a05:7300:bc83:b0:2f0:c593:986a with SMTP id
 5a478bee46e88-2f6debcee11mr6739515eec.0.1778485907772; Mon, 11 May 2026
 00:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com> <20260511074752.24745-4-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:51:36 +0300
X-Gm-Features: AVHnY4KL4_Xj5WSC6cZ4ru0Vt3ilf_DPaUiiJoBVqluNaOn2k_t2uTZaJjI3xIw
Message-ID: <CAPVz0n22wg=71LkMSP-_N7opwdLU5yxRBbXYboh_x6WMvDFL2g@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI
 calibration logic
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20/Tegra30 have no dedicated MIPI calibration device and calibration
> registers are incorporated into CSI. Lets reuse Tegra114 calibration
> framework and add Tegra20/Tegra30 as a special case.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/host1x/mipi.c | 82 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
