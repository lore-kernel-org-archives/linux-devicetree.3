Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1B33D9DB5
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175373; cv=pass; b=gsDuu07/5ZlC+shFP62kXzx+wiVqrXMiCs0THbrBswEMUJKC1ZX/U1PxptchW+f+0xePF+wXefHS0Tk/gyiXrXgI6YOnkLOhpUBZefs9fK1Fik77EoUDDu5+NKZ9AcxzEajVtKXbhOVC2KNEM2s0lLpKEVSpUObn5KooF7+DAzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175373; c=relaxed/simple;
	bh=luwhS5VkVprOXRSpKOHs4TEOxJfjtiFwMOP/OMytiOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsup5um+MbVBQsDnMaQ8mnhID6RB1U01KWJc3MS+p9917mlXCG+OBQn1DPFlSWIt3Nzj2Ee3GGPXsuqszqqsxkeg/IOVAOMv/HUDC1p9kvu7SZ7lyjNNWBXQJ8sHfUWg0MN+XBScnfTziMDUflMC+00Zx16CxYpLGKHEN07momg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjiNWG/H; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjiNWG/H"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so14728536a12.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781175370; cv=none;
        d=google.com; s=arc-20240605;
        b=lCCI+DPdjlQpjqLKwG8sbYUZj/5fo69XYwetWvdde9bcMILZGg/OCsHUNjUx1fN/Dh
         FUZPG3RMZTHB7kxWwGMrwPNcGoFgNnX391x0mkTUHjFbl/B8yMAELKDJ2G7qHLF8xbjE
         tivmK59aifYi1awmmGnqRUQQviKJ0MB5zeV8mWHQSphFuC98dBqMij1N78HSbREGEsd1
         N1nfrLBh96yJ/mugISQ0scAFlJmSc/6zohMCJ4UCYOELTFAo4HuOSBEjVssQmM6SP39T
         vc1WLSzp3/LVyQN0ZVeqz3r32HLZ9WbfXeTgZN6sJ4wkWwJc9moQNGEVNv1QI6Jk8hvp
         cHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=luwhS5VkVprOXRSpKOHs4TEOxJfjtiFwMOP/OMytiOg=;
        fh=vpdUHBtIz2LmnfVkilUt5wXaGx6q65aRfDKj5YR+CHQ=;
        b=k7Eb2Bq8uhH+Dp+oayFkwq/VXV0AnAiiUFIrDJIJ/1M/KwXy6tRZPZDREnr2LqA/7N
         OUD972V+lWEnSa5AMCcY4lZoQDbWKL3LZDuMgZLR70uG9oSbDOaNNZvt74ImfXRkpKl5
         e3gOnwqWW8P+xf0jr0grNmXiRgr0tqYdUxFEhPQNSgTtnOG/e6XyH1DKO7wZwNg45NAq
         5kVuJL3k1+3lcv8OoVEGt6QeyTwcyGlcQNef3H6oovTHWGWEreQcaKebcBtwROIVONcP
         Ri0BUeXe8IvR6rAWQS2PJwlUfMTAbBaR2WnFtY88umHeKiZfZv+aYEjH4Wv0xL7FsQ0T
         MaaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781175370; x=1781780170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=luwhS5VkVprOXRSpKOHs4TEOxJfjtiFwMOP/OMytiOg=;
        b=XjiNWG/HKl11GxBEljH/pT4h0OIKpvBMwaymPl1yCDeBzSQGr7e68n0PZStPwI3EmQ
         5/n8KIAUkJaEwVnhU9Jx3gWQjlvc24LNktuqD9Ga8BJfo/QW8YJOM/AllV5XfHBtVJ/q
         4zmAPeSeeJ3rlmQfcAFdeZd0PutFjXSA6pU9VmYmss/0s6VB8oz8CfqCsS9HDsMO0p2c
         Clh832MEooLeTul/r5B6AFuLSVVUdAlyttCB0Gdh6KgPLVZNeA6aVyWbwI2UdGwhury7
         vO7VZL1VuqsERRdPoG9yN+UoitYR45+kA9kZu8GS1TqaUqq2hu/N42lByk9sx1lyV6Yw
         mpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175370; x=1781780170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luwhS5VkVprOXRSpKOHs4TEOxJfjtiFwMOP/OMytiOg=;
        b=T5Ggp6OTDt2FnQb9t1H9RXEsVoSFhKzBUry7ZI7oLEANaYk3WMsZ2J+98SiCZgA5Wa
         uMmhS8F72fpFUU7T94E48B47cbge4Lx2vUeXKcp6EZTivCE6CHECglGBhdEp5MN6W2xB
         2bw58eP8adqviziqZmVFFldYKxbeK2p6v1yG634wpTDMtozuq0DNIyKq/s9VccxIB+rL
         dtvyNrEyC5pCqp1o4jljtQNGHPu2HJnwEuzg6IH+0Ltwt8XmTOeNvtjrBezWOxhKVhfC
         /ElzWKrF8voe7bvXrzIwBEORFl22cyYa4sDZbrYDMob4EREu60G9NnlnItETBenJdg5b
         gvAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DtRMq+kIC4K9CIHgjegsVK/HyPkdGRx4lg64Wedgs+fG06BeLhrb176Ep35ebJ46u2RIhExeCSWAI@vger.kernel.org
X-Gm-Message-State: AOJu0YxcAg5mLRXP5KGaR7JPe65sze7aZBmH8+5tlWOjJRojFDgJt4aK
	VT7iDNWvSi2yytPiBjvNWToBlzBqsD2hLrgmGNWTlNsYxesBF8sKXFdwrYoX+9iQC2cWzloU4n1
	wdw2CiPFcw+cjn3iHIDdKjNAkugxl4WL4NuF/zwo=
X-Gm-Gg: Acq92OG1yrTfzhxvYCT3yoajYb96en2CoqMRB9E5mZeovX/gaFYXDrl8ope3fbMO6wW
	AUngipRqx0Cw5Hl4LHNHZe8001hZIwhHEkZ37PGdnjiKwM/9TlhucKdfaT4Sfm8Xg0xCVxz70kt
	uyhoWtQEgcvQNByuazsneq9F09fpqkhgb0Ht0+USTHJXZTnquTXiXNKPrqGIJd+tbMKviSgHbH9
	h58yCM9Hs6w66YOy5Zm28C1cxw0XqvhcXgoTaFdEvu+q3tVndijT44sK12PjAhtoVbSL4qpfCKU
	sy/AboUri2lF64HOw9/SRejBhcRpKuyNNwLZ3N/Z/s3mXYIrngOtEqptMI8VkG7p6oTHcnRkDYT
	7mt0ufFQ19cb7tA8=
X-Received: by 2002:a05:6402:1469:b0:68b:31c5:86f7 with SMTP id
 4fb4d7f45d1cf-6930e32ca54mr1052454a12.16.1781175370165; Thu, 11 Jun 2026
 03:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com> <8be0a964-e2fc-4c0a-a5ca-0e9e42b3d747@linaro.org>
In-Reply-To: <8be0a964-e2fc-4c0a-a5ca-0e9e42b3d747@linaro.org>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 11 Jun 2026 16:25:58 +0530
X-Gm-Features: AVVi8CeoYZl3tGdsy3kf7c0CBQMbyXc8Ifs4B6x18dtA99RJC4z5NJ6-soBhOkM
Message-ID: <CAJTcUFSLoQN0Opn_2LY1QT3EiSo7+nybebbOoscUSaTWF_HGAQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] media/arm64: HM1092 IR camera and ASUS Zenbook A14
 (X1P42100) camera support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Aleksandrs Vinarskis <alex@vinarskis.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2026 at 15:31, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
> This patch should be removed from consideration, since it is not based on
> the upstream codebase.
>
> I'd suggest you to upstream the sensor driver only through linux-media, which
> is patches 2/9 and 3/8, all other changes should go only after it.

Will do, thanks. This is my first submission, so I hadn't realised the
sensor driver should go on its own. For v2, I'll send the HM1092 binding
and driver as a standalone linux-media series, and then I'll post the
A14 DTS and
PHY enablement separately once the driver and its prerequisites have landed

--
