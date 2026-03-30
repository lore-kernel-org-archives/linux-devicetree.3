Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A62ECEAE
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907920; cv=pass; b=Oljyn+JzVo6PX5P5jfpCf695KAE6Jhm1a+Sz51VN9faSvhid1MwcdB6cX088JIbm7+3wgav9vxpPhvo+i67ssWeVtCSIEgqfygvP8g7V6/F1zK2mx6JBjFu03rm5CU6+BvJTscAMmlzjaTI1EkHLD9aUCroRTIhLt/xbZJFfn4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907920; c=relaxed/simple;
	bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EK8qcw+7pcs6OvUgicWL1AcpjjWv7DvTz/J8vcrVq+ggxDE4gy5WnT/2poLJJbGFM3oEPMZ+EZLaYffgAIG9bQTXHKidcyQPa3+b9MqxVysgomlti+XDwluDWZ0ceimfS3dIs7ZZAaeeo3ScruT6g3a0zhZGVft8fgqGR5YKv/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=rN4a+tcN; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rN4a+tcN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b23f90f53aso27520375ad.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907917; cv=none;
        d=google.com; s=arc-20240605;
        b=FOzf5I590h1723oLVRo8n2KISojiZ27Yfa9axShy896AqBsPFUkWALFWojqAgEp2wx
         +rZnNlja7JtWpULHYmb4Vv0c+Z4ecsuqWnGQStTJHsQrbq5BVGtt+m+nH0fGD98udH+L
         WhuyUMmPAfzyZVeqF4nf8yCVQ+9VXLL7jQk1bwyfnHOiGHXpBTH/sOzgjISvn2zDLaIE
         zaKup2yZ6Nx3QXHwvr0Fr6y6YMG97huZroj59uG6K6N+2iJ9nMLGEN3TdThmSLF98Xrd
         LHbXqzy8E9DvdRTzb3nBNrVo9chP1obVMyWtUpq2nSE6WlcB20dk8LTFABT2v+IYFGn6
         1jKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
        fh=ThkafKXJYJ9t4eIz6kwjoiPWJPnLaObcN8smSc/x7Oc=;
        b=F0Ovjc34gG3aWBfm5XexvGlPdJgUDR8NACG9Fgom4yzOLsHtjnYlsIeEeRdx2V7phW
         ZTdHg2c3UuLs1twm6F0cH9j0wRfSfiWcBo4KosYxXq1j+3VFBQGTIcRUrHONndS/KAmI
         EEMpTHVIp+evNZR15PbHVt6SyYjxq0OQ9u0DmS+csD0+Hyy4v3s4NRQF98hdXydAEnat
         AGnfmOKQnio+1MiAWrJsAC4FIYHED0u2osKqGOguakEWMEXxJwRKMQ+OL5nQslSKF0wd
         oVFcA5tkTm85EW/RXKN34XsB9Xp2lOYdLRegifkIwN4LoflWDBslmTOFbk5N6irXCYef
         jPtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907917; x=1775512717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
        b=rN4a+tcNQUOeBJZSd5LF6RJXJ4fgX4SDROS2G9zkSVx7E/KCh4/TXkoidPckf6I0EY
         W5keqH8R/JDCIwOlsiwNOfu+AGLjBdN+3Nlg07JG9pLYVxGU1DTlGkm2xKAaH1hOQhiH
         8bbDTfwhqdUti9VUYXrzQN04vin7Ekaby3Dn//M+fnDTZF9YGGn22isnnEq8w6LqxF9W
         BBJiT4d8Gdd2SmItSf03g34El6/yRlbeFWIu9iuuZp2Gn7N+idyVvk7gZb7sLWsxDnkw
         Y53hvh2YwG8AaGd1BlhmWvVrzgEtePk8pRUpvvzN80P4lF6nAz2gjDRP5nCPsMWWEzu7
         k0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907917; x=1775512717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
        b=HYkDbIKUBA23dRfGbL4Rq9Gs8tkzIwj2wBlK4m+nnPSuWFV3ObVeHMolv7DBvQfrmv
         c0TP2sUIWs36nQ2lcuBLrdRn8HqkDPdOGUsaCoH1zpprLKA/vlK5+wW8z2Or3ybQXToV
         XklkYwyi1jp9ymuYR6Q9DcihIV3SE8Z1/J08LbageHpMxWRQpzmNPq0Jff9uizY5JbIX
         XXYZ+bKUPV0YOI1fDmxriKniP3flUn94YYfdvY1yTtfM3TcGQf6WuvDvC8mzQJ1iry/P
         Rv4+YNsSpTJxg+cYLdrpsCVAoFkwiw5LegPp55+gCJXHK96zplQAnW3OIofPu1C+otQI
         1kIg==
X-Forwarded-Encrypted: i=1; AJvYcCUBGjolnv56e3SfKw758eGjY+7QB6Z0zpG3DGvCAPN2fbJeFjwR7hOYejG7R6F30u0onOAWImZK1H0x@vger.kernel.org
X-Gm-Message-State: AOJu0YyVeQdFWLqu5be+PDjVviohv4z1P5ikgqkTlF4o4rYJpbVBeQWl
	F7fIYta7XrIvmc3f4HA9RukfZOZADs7WY/7SJOAWhT7BV4QICrzT0YeCQ5q/fbjg2V+7s0R/5j6
	ERjyrQhBTCN0zkd4jQUMnaROV098RcPg=
X-Gm-Gg: ATEYQzybljsb2nPeSyGoKClTbWlrVsu/y/YUz97bmbDmgF1LL9JJIPk3HRlgH3k/amf
	fXadOn2o5AEMd2XZcIVuJ+OAYd+9X6kVYmizGObJfULJwgXVcRA0Hoi5CAZmnNMPmvxMzVm+zb/
	p7jKJcur6eM0jiO869vmn1LaRWABMG322Ummjso1stRI1yuxEdCVhHC+sMpn2j3nBh8CPyt6Lf+
	u69uLLBQjspY+lpiztcB5rSCP9TTxytR618krjFRsy9H2L6kVi+8GJdL/1hQyDHb3ZvMKxhp73t
	44M2PVPB7NyRPjSnqQC3SpV83/31022wRRN2tDfdwLWmS7mSX7o=
X-Received: by 2002:a17:902:ef44:b0:2b2:58c7:2cd6 with SMTP id
 d9443c01a7336-2b258c73377mr34992175ad.5.1774907917613; Mon, 30 Mar 2026
 14:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com> <20260326-s6-s7-pwm-v1-1-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-1-67e2f72b98bc@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:58:26 +0200
X-Gm-Features: AQROBzC9sJkgJfCVL7Eb0aOMXTr94-EjxC4gSLY0i2t4mSqOPphK9W4gxOQsQKg
Message-ID: <CAFBinCDOd_Xp3DqqFNDUEfJPq0U=f9FazNAh_=k2B2eOcUeu+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: amlogic: Add new bindings for S6 S7 S7D
To: xianwei.zhao@amlogic.com
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Junyi Zhao <junyi.zhao@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 7:35=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Junyi Zhao <junyi.zhao@amlogic.com>
>
> Amlogic S7/S7D/S6 different from the previous SoCs, a controller
> includes one pwm, at the same time, the controller has only one
> input clock source.
>
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
With the two suggestions from Krzysztof added:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
