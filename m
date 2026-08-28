Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC133AFCE1
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895283; cv=pass; b=YkSUS/iXCy9QPUzCe/sHhp+6a9A9tH8rFMzDt6svltioFZrwPsHCLfzy4SB5YIbu6NoGYb6J79pgSGWnwPOf58Qojek1/YRowf0JmLfrUDiSBPAxsIRG/kDssY1DKVjY53fmKzQIx/bth3XgGzWiWgMXhXkYR/e/PDLInnOWWX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895283; c=relaxed/simple;
	bh=cEY/7F6hxlj2M33/z9kYfEixWJEkSlqFR7ES9U/Z1II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imFpwZVxdzWxnOBaRYr/lcJEWuHl7kEsejvEoKHQZtMEtkiCSJyHXO+Hi8QuW86j6rrgTremELy72rsB4gwzmyFA8UTd0Z9zDOjfczHhFMarUwEpiG0/xAK2ZrC8grFknDSEKEhfVjkBb5v52AJ+BMfqpMx737h3GIFNUr60YVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAIC50n5; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAIC50n5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceaf8a1265so8935455ad.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 22:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895281; cv=none;
        d=google.com; s=arc-20260327;
        b=jjM682rCzE/NHev5T7t4ZXl8R6NPBERthzgfZBWUsxUQRrTW9ogQHdBsCpYIrzSRw5
         dSKdkXf0TnauUdzwFdJFMJTb7rPwKmkbJHF3Ic/NhjWw4YDw3dcsIWJ3YZ5v8F27X54U
         OpYklra9kRIFfb4uYFl+J3ZHOsF6EUvLBPlKt1PGbbbakRi1Zq5YN6q6tN0VxrYKRnRS
         CnZiZQvNUHDr2qi5ky2HHcFSker2hiuXGPhx8Xbjlf5nMT3l7G6FG0yGw0/FerBiMsJn
         1QbAq5gl3BH0c+fNepB5p04ZAHlr2jK0Lhcf11jHwdplmEYefXVWQBCebK8iFUUQbD4f
         VOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FvFIIR/g5aSuLYP11ok5JtcGs4xSiTP215uJf2XZbHI=;
        fh=rbdqnFscPeHsn/lt1Whre09fN9zWhb/NMgkNvTKnT8Q=;
        b=NT7jJRwnY7qQR/5SeAnsoFTDfPpFJZagpjSjVayWrXinCPUd6W/tZeFKXLcZVNbS2W
         C+UPM5EcBJaW+p+fzUK5CyPdkqVE1hAPozK0OYzvhtZwk3PDu5A9EuY5MSbrpLAK8JEj
         ks9qmi/LmdNwp3aKvSZUch58akJ6Pemg15NwNmKlBaTl/QizsbhaOk0F6YVH+zd/T+cl
         LXvnXc7KNHcJ9MKSdZ8LS4C3JAu8BulgPSwCWlPLTrrU+BWe8Kjpyy4sYf2O9KnbfpK1
         I1JFa0xRsTX1HbuSU2NwVeCuuRHY2Q/fJyOm1npNngvj4agzMvq2nvUyGl4+IL5sZGWd
         NujA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787895281; x=1788500081; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvFIIR/g5aSuLYP11ok5JtcGs4xSiTP215uJf2XZbHI=;
        b=XAIC50n5oKWUMuSEMY9iP6fBb40Fj4R2P9rPp5JhEJqV7WgHxCqfhC9hZjJr2EG6T2
         B6W2UnDu/ixZbWpRh1+dNEve5ONDHVt9i2b//wEZwoWO+tU4eDFtLPB+B34cpdfGn8L9
         XAxg/mjPbkYS+H4fSAPIJQtN4ltldNPtLxjqAWVGy1ha1fG7RdeaFul4YuluS+cFGTFF
         0Nmq8wjKbVaMhqj6lz/Kgmeeh+JUCLVPWmWmipGg5bN42tnH2qZ6UMKgTPRW/rcDZPlh
         7U5Sj1lbVHTgHn/kkSq8uRqBeEt2eKS1ryhagkRIIhON4FH97E6phynoq3ze2aNVV0xV
         8aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895281; x=1788500081;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FvFIIR/g5aSuLYP11ok5JtcGs4xSiTP215uJf2XZbHI=;
        b=csGVljTI/DH2EUvJ4nZdjrboETRL16L0K69kgOzm9opuy33I/27rgDhOwZ3x0O5uGv
         +H5CRNWNS4mHYOjDA3+l85QwmeXtpT4734jk2LCltgZT+INv/4rxlORwqNhJfHOR1vBO
         43DPuhhoMDiHyNwaJXvd/Rrs66XPZTnT/SLHsywxZu1jA7wHcAB/9kK5jFXNEH9LIUY2
         pyijWrh2ju2tVbbEtFl2dmoXhRwg8USEoH7kzi2/FyST1PuxY892S3gLYtF5VnBOm7fj
         7HIsI/TXQjEkTh4asTlwjaDWV9PYD8Fw96nyofpLaXVLRS2rwu3Abcfl8Zjhif7QNFhJ
         BgjA==
X-Forwarded-Encrypted: i=1; AHgh+RptVvK2j6dHr7dJgXXpnReQem8rw1SQpSKcxXqBWVY+trLIDXShrV1ov7jdZJ+MzCUfwWFn5Z+ELCBR@vger.kernel.org
X-Gm-Message-State: AFuF++nbnwOoyVaxGkFf2NCWF7rLLTp95bW35FFUXdcP1IgHduABDktu
	glPVtI5AOwnX7IemjUAd6+3TjogiR7sS/+6ONOBufmgn5iPuQ5tqssynvRJHegjOwiTQ4Ki/IlU
	asMX5Xl/gGk5M30KcE+h0Bh3tuYrAp5E=
X-Gm-Gg: AR+sD11hXrbPVvLDXFah8ou8XRpvzSPB7h7M/xliuIxCffHT8AsSnyvTqYS+PjWkl8G
	o9kTpQIzoy76nkHbg+zZaFFuHskruDRpIrYcfH3jlr1JD83KCQXR3Do7VpUhKIqV2UBjyAl4l6a
	Ld5mfDBBTUZLZDFkSji81UujIf/QZDx5P8099uwRkr29DY7d4GnIIFXwbY6ovI+qrF0UxVtwEvN
	S2w6lNmcCrXBy1STamQt9tn1HkuT4/gW/tbTp9u/7Boj89nrT+g36ZKEgL2axhnXTw5OmSGf6MX
	pebhGEmdaf2JKTkjrV0Nle1KW3U3477UlBtVS47H6Uj8lsActmu4IynL
X-Received: by 2002:a17:90b:5747:b0:393:1d92:db5 with SMTP id
 98e67ed59e1d1-396d0ebd946mr9212807a91.10.1787895281176; Thu, 27 Aug 2026
 22:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com> <20260827-chubby-refined-partridge-2efca6@quoll>
In-Reply-To: <20260827-chubby-refined-partridge-2efca6@quoll>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Fri, 28 Aug 2026 08:34:29 +0300
X-Gm-Features: AcwNN1V7x3xE7UHCZlm23CotOK8dmsPPSKaput6Ehokphr6OrHpi0DVRxlOIntg
Message-ID: <CAP1tNvS1nKEh=O1e6NGXFu0L2DWgEcC-kmRkfPXqGOoTvdFLsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Quentin Freimanis <quentin@q-lab.dev>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hello.

> On Thu, Aug 20, 2026 at 10:55:23AM +0300, Alexander Shiyan wrote:
> > Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > ---
> Plus, there was already v3 here:
> <20260306103614.3208182-1-eagle.alexander923@gmail.com>
> so how are we supposed to compare this?
> Did you address v3 feedback in this v3+1 version?

Version v3, which was introduced about six months ago, was labeled
with the 'RFC' prefix.

> Drop second/last, redundant "bindings". The "dt-bindings" prefix is
> already stating that these are bindings.  See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

You're right - this will need to be fixed.

Thanks!
