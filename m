Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699641;
	b=ir6Uz3zU4qeN9VipKOQNb3K4ovg3I4tr+3J/nOJrPB/7WQc7kt13NeyYmh+I2Kdhqw+S
	 RGcD6ahzFAh55He53j7x0+FsbtXZeuXiI89IUs2vxgBs0CZtlPjAz705oXU+axeDVhkrR
	 ce6oJMMhl9mAh0f3qSbi3uOBy+iKRZ7Z/vNu2nEvpqqExzgKSutKvliHmdLoxnzByQdcb
	 Bo7GNcrrTdGwhCJC7EHG45IIOwZZSxYYdNSOcGjZ685bdC7vKAhUHZBLzeLsSltaOhtVf
	 ZvnWxERJERb2zXABuKnSux+8ytG91PUFclsCDeRNFV21a0G83vItum/s9IjuinWyIUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
	b=hVDNIL/puFDnuVWZ+vKIRqEcIfNHPGVbVAvfGASdMznc4/93xOl22fWLnznXSQDNX0TS
	 VlwWrSS9Pi50kpG6MCrCtLf6b4vcDnKSq5tfHF1Z77nytnG2qyBULMEqar3+P//Q/VhYB
	 JS8FQZz7/+D9oJYQx6rCnd8uMk5gTmO+dHh32oRcljN2bEXTrP/iAA7v40hyFeToaswxx
	 MzPKQQiyZxQry3iIVxp4esbfL9wJt2hPJLpYIctIGOXNV1G9fC1xRvMYXWeJkUtomybt7
	 NoUPEt9iIZXwRHltJNaQHzl9SzYnWdsBM9NUb4FwkBx8mZoRCP4a6z7Ft7M2Oz9tIJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TVKimARu;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF28606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF28606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TVKimARu
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c45111bebso1708401f8f.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699639; x=1794304439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
        b=TVKimARu1D1Qdeq8B1f1CqmcI5JTnkuYeA4DFQQFHQPM47oZTLs5Z+NA6c+wO6AFGg
         jvifZfjJDS+sSTe6x+zhJv06cvRejmIuxXFIwR0yUwQDZsmvEVGAk0Pd7r8uQZdgsBbH
         dJJuCgDJG0CrZAdvYdeKkwf+fczYyw9U20vGp9sr64jzNwejRpaM0PkY9GXly6WlwLq+
         R3+XQ2uO4UnBzDkinSlIDB4D+VQGI+GCHmDax7QJWhIpblQlOkb0ck7UQmotM8Wid5k5
         k+HdhqxXXSfszQzLlS5TQtQqwgT1u4EECVBFnU0nwnDPDGjUWQMsMyKq5O6pDSLZFn7H
         SLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699639; x=1794304439;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM0Bfw5qWLCibuKINiRXLguaJCuUziBZJgJ0xQf9uV4=;
        b=Cfg4mc/ljyhYlAXsTUm5VbSUuMmiMinWbScp8ojveYn1JsFuomdXoPFTpqqJpNKNj4
         0RG3WBAm39yobTutY4UkaqJ7J45uP4RguFLgRZt5T2ZwymQByuzP1nsvOkuKc7Jmz0Ee
         QoIHGaBtn7Piup921vtbLTLhrdzNG9ETzzGmT2JMG/xMQvuDXr7KFiUPXJrjvD08hHfe
         4rsBA5jqDFdAM9rgL9YO1Lqr9VaHibQsDmjrR6eMa58Lkz/Ludy4uq/V58RA7ZlGlzdl
         tbCBzGq10OrbaVyOplleEd1N5zhmfUW4yjfQgfMort60OXlXo4czN3RCKXOg9b5YH976
         di5A==
X-Forwarded-Encrypted: i=1; AKwUvBy4vA4sR3Ys9GoUjMYbwMSGKtkC7kQcRvfLTYC6/MG88PxCsSRyjgExq5L008VsrxVyM57DAcOHy4r5@vger.kernel.org
X-Gm-Message-State: APuU4Z+9l00vyXHNffdw6OHNX7jmlT4+eWkqZntqOpgBTC7XG+bwADxC
	ZM9s5irHZ5RUhk+GjolNIXZ+uVVIiEzMIYHnCibPoTBZGiL0+/Ongz1UBdX6oe2f60Q=
X-Gm-Gg: AYBFou0S2tAd5DDKTCvpT+d8PiASz2rbEZp7mFTV0gQFrMMtZkhvoY52MhCC7Vi0b7k
	CZfpo8PpYn8J8UwEwqKmeLrvCGkh1Fd31aVKwpe1Ktkw3Q7HZlv3AG14Logdxvao0f9scrpWng+
	cu79gwb2XfzvaTZbUtFrQDIXXriJ4cSycmg9kBgDt6rS4N+XRaL/bjBUsr9Y1ai+eumea52m4E6
	LFRZ9xZgckWdF+PFMU0AvdiSYCnK47jChFJFQuPbDIiopiXV2j3jhNP9cELs12sCTqA4bIkjESN
	KUz14SZScIMtlKhPb/9ZaOT0xCwrgzAFkOm6NX/n7GXnIUqZumFuZZibNZ3UMK83x855fnANROY
	8K9Bmqyw9i5QKiC+8GXSAJ2exBudzrBxoXrGOBsmIVScSK7WyK3LGU1d45TqSPFk2yEhAsrImS1
	/T0v8IHBodbiv1jMGfwOACBTeqrn3F5KsB4QuMu0LNDQNPj4aZjGX8h9dgQ29WxWmflt5KerSgc
	NYpEbV7ViXNTYT5LZ28SCs59fSG9ks42CQXH6msCyBO0JN/uYyT/+2zXgTZjIzklNFurOfjmHup
	w/FlUGo9zIy4h9YOoOYrGS9ewGa/WVSlIW5O5y1TKuTnw/upr3C/zk22Rggx3juKzIgPHxg=
X-Received: by 2002:a05:6000:2211:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-48e6e5161admr23618701f8f.49.1793699638798;
        Tue, 03 Nov 2026 01:53:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm24029915f8f.23.2026.11.03.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:53:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
Message-Id: <179369963832.2329937.7183164129825631720.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:53:58 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Mon, 02 Nov 2026 00:20:11 +0100, Martin Blumenstingl wrote:
> The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> identifying it as a Synopsys DWMAC 3.70a core.
> 
> Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm-dt)

[1/1] arm: dts: meson8m2: add dwmac 3.70a compatible
      https://git.kernel.org/amlogic/c/88da0c14921c8def2775d5238ecaa5934e603da0

These changes has been applied on the intermediate git tree [1].

The v7.5/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

