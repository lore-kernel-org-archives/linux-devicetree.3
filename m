Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B2326CE2D
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781361888; cv=pass; b=J08Qf+O2ivxAMXL1Y/o5YhKTNYuNoix3nsE57wKJuuHbn6V4MBbmT0IYdiP9vW2gsn86uDD5qWbxciS/FJiCEpUYeZyMzAVsAoiymogiOg4waORPJneVXtnDoha6ywwkXW6+81EaEHRFr0R6BzAUwdTN/CV2MgYp0mO2zLvDoHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781361888; c=relaxed/simple;
	bh=86NTdW+NbCek4cKjhKk7s51TwDhFn7gWhVdpadA+bzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9XTjSiUSkYNTR3joFXq4iB9/Cf3dRw0NBsapMb2XVDAuTNNuR3GnqmJMM/v9sLx4sRULQwk29wFQvi42rkUoL3a7R06k2wbiR67eYaUMeMVSlWFZqThiiRwp4rkKEqdNoB/vz9joL2oyVy08zEya4Lw83VieHjxAZsLBXtgCuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYsN6kKy; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYsN6kKy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c40397e746so10013905ad.3
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781361886; cv=none;
        d=google.com; s=arc-20240605;
        b=f9OBcHTWTcdFeXRGzNq/Ihzghu3UrFVokLJjshWcXt2lRAWqSoGsERiKvejKQk+DYC
         EQQTxxqCNVvW05mpQ5Jop9/7YIOzT9DmCLeqy85nQDdbT2EzLdXJX9u5vvkxWqOxKBMM
         zRnP2cZV2/1u84Qy6TbAZthMZUtfxPSzMeTxeAFUdfJdof/cv0/NOuPP9WCnWTfXW1Jo
         nm68H1LELEXXB7BveS+XuKJjibF6DCNZIbUqLhAt0yNU0OtGFXn4dAF37wxIXycq2/F2
         cMcz8q+hM0GvMWVHK8AWyWNTVSbZZ2a4OYteAm5HOKVGbRgvqEi+65bjsIFe9p9zYoeb
         mVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LfIK2PZtJmuHODCnzyUxEkui098rwuKHvISY9CTcfoM=;
        fh=7GOwKNg8ZDpybM1XUpjM24D5MNn/O+WmvF6UqJI9BlI=;
        b=SjftDfIrBkULF+dnx92Jma6c6UAFgAxbi7HREuiEEFnZmdhf8HHXe2tjIgJ9QCrekm
         Bk+KyFa4dxTq68fTBERTH2VniQ8zNhiQw3sp7zqT2l5mwsmuKKjI1BXIp8jg82IImSvo
         T4xGG9a2RCDWtxAKkviootCb9lOopaKLtEzgwwECGEKiW90OaRJHk2oSjEK6JYRTahm2
         AvLmiOp/s9f3jtQC99KS9I42JNoj1qUYm5oWJ8z1/SEqfpwpzNmTQAZJ0yWRIGjqfNRW
         XG5s6N8BX1gTv0ZPZJbbcHX3Z5sA33RKAQDqtinxaXELIm4AUdR7vZUo890IV/XS4XAR
         BkMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781361886; x=1781966686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfIK2PZtJmuHODCnzyUxEkui098rwuKHvISY9CTcfoM=;
        b=AYsN6kKyNrN7vxTJgLueVqWQX3CAC00mOrdj4ckMej7K/fd7TFpA6/wBrvAk8rVrRy
         0ti9Zr56X5na+JI4hp+71RPUu1mdkh0AFQf2DLk6QJhR3KNCySoXDQH/fqAou9qXob0L
         fOVJX6f49As6mlSf9a4q8Sp86qVB/fmdHnffzF3KhkHJ9fX2rKSS8iRXtWKOmHfTVIyk
         ppcxt5Fgr+BLFOvOsBnoGWccvycPqc5oBB16J4goI1NyGQU/Zyyfg4MfONGDvv8h5F/J
         EX5jS1hSEU2UtU8P7hOTKeRbed/lEp2nzrmohAwcgjkBV5+kXyXWHXBFVTfAbA0KXQF4
         El/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781361886; x=1781966686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LfIK2PZtJmuHODCnzyUxEkui098rwuKHvISY9CTcfoM=;
        b=dX+40FZrmhlYvxB145JKjSc49uPnAagUNxhaBsR4IRKYNryO3mEvVi0SV4cXTJH9JK
         1wkyY98fiVc4nYg5u4ydcVvGJse4miHeZuR1kHJj8Uz8witx+0+TwYyMrUWpKH4Cc3Lu
         KPQgDMzVjSLYbw1XouoCzkxKm6n6AZpoR7QakLoMTrCGyrZZdWn3gHG2yDZSNF2etzCY
         d7GkuAmcMUGSbHB5ENtxODczAS7TH8Sm9mfqWQUZl3koNestE7C7vRF24dpESc3LKeGE
         kA8E+FbDPAxz8Fq5qYbh/saKfjf4y+uzLyyhNrEI6zBu3wxIGdgUpGttLuYmC7wqRmSb
         BUlw==
X-Forwarded-Encrypted: i=1; AFNElJ/kDuHSpz1F+wVMJFfooIp9jau5ZRvqV5HKZ3GCm9CDG8Xwb/X5YgXJE69hAM2fodn5+0Xpt86DzpCA@vger.kernel.org
X-Gm-Message-State: AOJu0YyX11zNAMMYgF7TAF+5PFRrhA0NtashbczZ56PwPEL6W4fQ0Ofc
	YHMsZ+QTHX/AlyyBCUAy/FhCsU/bg5kaceYHipJOVCtRq2vto8L7cnOvHETKTc4PIEn8p4DbLVh
	PmIS3+1L5vRT27gWr5qMRRv81l3CCIeY=
X-Gm-Gg: Acq92OF6n5su1brKMFkGMh5553oXjT/b+r4EIaUhSxN8cpMQKgzllqyfA1fITbyeMQI
	glKr65YNTk9VhOo188Hb3RhhYy98Zfhw0MEnx7SEayuDKJDsKScD2sAohSUuDbZQQFSA4jk4IOE
	x65Tfiy6+AoWtW4sYJBjcHh0vqobC1WgA3fhggM+kqjrl2fibVJXLnkRPyLE/2G0mFljvAOn21a
	VX8WLBKAg/yL5FrzI6l6lcEN1Vmbl7x2tnxSt/DrFF/yIs7+gFhjWjZyyq+wywx3O6OhKsmBhfV
	ufNqv9uRZc+nIUgqJ3+6lHzqJYs6Uiim9hZCQsSp3A==
X-Received: by 2002:a17:902:cecd:b0:2c2:27be:39a5 with SMTP id
 d9443c01a7336-2c412749c19mr77866635ad.33.1781361886080; Sat, 13 Jun 2026
 07:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607183542.368184-1-jakubszczudlo40@gmail.com> <6305149b-d334-491f-85c2-085fe42cae98@baylibre.com>
In-Reply-To: <6305149b-d334-491f-85c2-085fe42cae98@baylibre.com>
From: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Date: Sat, 13 Jun 2026 16:44:35 +0200
X-Gm-Features: AVVi8Cfz4IX_TpeH5YZd6zac6lnjft1zg9LNtxbE1kCwNta9wqCoKYgUnsgN4x8
Message-ID: <CA+gq5Jifvz-cvcB4hS++W0_ELY7rPbO-u33M9f7ngAtgVgUUoA@mail.gmail.com>
Subject: Re: [PATCH 0/3] iio: adc: Extend ti-ads1100 driver
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com, 
	andy@kernel.org, marcelo.schmitt@analog.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mike.looijmans@topic.nl, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jorge.marques@analog.com, antoniu.miclaus@analog.com, 
	mazziesaccount@gmail.com, jishnu.prakash@oss.qualcomm.com, 
	duje@dujemihanovic.xyz, wens@kernel.org, sakari.ailus@linux.intel.com, 
	linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 9 cze 2026 o 18:10 David Lechner <dlechner@baylibre.com> napisa=C5=82(=
a):
>
> On 6/7/26 1:35 PM, Jakub Szczudlo wrote:
> > Extend ADS 1100 driver to support ADS1110, which is a pin-to-pin
> > compatible device with higher resolution. This patch also updates the
> > device tree bindings and Kconfig description to reflect the new
> > supported device.
> >
> > Signed-off-by: jszczudlo <jakubszczudlo40@gmail.com>
> > ---
> > jszczudlo (3):
> >   dt-bindings: iio: adc: Update title and enum
> >   iio: adc: Update Kconfig description for TI_ADS1100
> >   iio: adc: Add ti-ads1110 support to ti-ads1100 driver
> >
> >  .../bindings/iio/adc/ti,ads1100.yaml          |   3 +-
> >  drivers/iio/adc/Kconfig                       |   6 +-
> >  drivers/iio/adc/ti-ads1100.c                  | 165 +++++++++++++-----
> >  3 files changed, 131 insertions(+), 43 deletions(-)
> >
>
> I assume this is v2 of [1]? the subject should include [PATCH v2] and the
> cover letter should include a changelog. See [2].
>
> [1]: https://lore.kernel.org/linux-iio/20260527164312.355729-1-jakubszczu=
dlo40@gmail.com/
> [2]: https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml


Thanks for all reviews, I will work on implementing those
