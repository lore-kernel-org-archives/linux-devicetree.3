Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84F5189B84
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398681; cv=none; b=CB3F5QTbzzjHfC2tzuYJLOZNmmFKCNAeoHZLleMOU4B81+hzAQXhdJgnSAj/ade29Dq46oiehENc2geal51C5UOGRS4Dr7akMcI42sR4Kko4Ppu9h0WM7hn4q+A4yiNTlT6sCxGi/OXjec0tlkYe5NPl64AEPn34H0gGVK4uKKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398681; c=relaxed/simple;
	bh=NwzPpDmwj9hCttbRfYAfKIIUGe5wCoRiVoOHsvFK2y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1CgkSwoDnzJF/LnbK8e99o4J1wBcRFuMu5eNlAbjKg187AEykcOgYDAXMkqdvKJkGvhfWpPW+xXsZnZST/U8S38bsKLHDgII9mYQL8zD7yQmGfOawufvyD4LKI4sCJALzUw3QB1kd/OFreBOSsh9/DjBETRbktRT/Ggi3WbyQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsYeJlD9; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsYeJlD9"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50b392f1846so72164431cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398679; x=1775003479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwzPpDmwj9hCttbRfYAfKIIUGe5wCoRiVoOHsvFK2y0=;
        b=NsYeJlD9xfJC/mLoAXt7wZ6wfTe72tRMSQvaTiYxHMXYLdnhzLhsKiA9u5QhuyDRuw
         7FZfawnToLHaCJ13wIY5LICnPdsG1zbvRhOScEowePEKl42Cuf5tcvttx24KdtDuV8dv
         YwTue3TBm2Sq1aPjEuVOv/dEzXYkww3GFEPPvxXr+EQzCQIBNsZz99YzlQLb5cHbr5m+
         T2FK0rMZFgl6dkC0AJo/YaoLURiZISYGjk2JPpG4doMaY0EWmPPSkFdbuK6NYNyEoPUt
         SZkNRLOLRAhevnh3P1KuuFvAqGMj4GeI2Fja1zwVyVwJh/EFexQsiJKV2sFXgK+uxC5L
         qzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398679; x=1775003479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwzPpDmwj9hCttbRfYAfKIIUGe5wCoRiVoOHsvFK2y0=;
        b=C9j+wYWRDxylX1vsa4uQEvtmDCVh3UyTs7cOsJvdd6dRC5ixENmBDDaMKsTGJxkElo
         ea37o892MdJLHJ1bD9yFGYfe3ArZsZWTWL1cvHHwY/shS3KEh3IkZXolBGsm59MGdqJ7
         a8/CeQIHwGbatxFFezClqITECdfbr1avN/rqWWNbqhjkB3wxCir2RpOzPK1u254RMzXR
         5vEqbhvzRDSwOZbRPDvTfJ7pwbU9jC7eBSSsw/E9BF2JvxkOt6DTiGbR6gruuJhLi2t4
         2dfWyP3yMA8tUUTFw1usm6XQ79gwqh62GorNKnJNPm9V6K295OLb1J1KXB8owMCciwj7
         AUMw==
X-Forwarded-Encrypted: i=1; AJvYcCUyH1RFybNdqS3vzVFDM20sKTFFQr80y0SWDFbfG8hNCF4m3t4G1Rsgfyg7a3I4Q4uiaia+PlWRXgE/@vger.kernel.org
X-Gm-Message-State: AOJu0YwiYrANjoV+uID4Tb+Wkcp6im0jofJPhCLJaeRp3TRVh1xHz7q/
	T4qalEr8fBkWu2gT78ml45ZDg5a6bQb3ywEX4F3hw4AvlhPm7JGICHFn
X-Gm-Gg: ATEYQzyyk92djFZaRbIZ+HnsQ45ZWPxwT5C8TxaoVjlKdwOJnuChemp2M2ftzaa380A
	N6n9EGg5ZDS/e61dfc7EhDeljV0C3mWoJYVO6Jzq4KvLefYvLUsqXSAoAm2nyc4uO2Xvt8q7AOX
	v8H23N4jReU9pnu7qj0HMdpx5e7jCxKUc7sTbWeOm8NlWKX+i0clTLxtehTommAN/m8BPrA1Ztl
	aYmX9qnMrFMUGlDwZ9Q4u1roijNo7eX42UbBcrEAx9ghb80mvdEa0h/bi+sluVLLmBunGvQsUFG
	Iz8O5TmIQiSEMjDYd6Z/gRVgrvrFq/FGLTq77QqYN1Y81FC4AI5xhgO0VApeWtC0JFdgDddrLXn
	QN3GcFtW7wUsMKgr0oOLfbmW+YkJYgoC8umvVjdP+GMsdVDwB1JMuOHoYVrw/ua2KsM57dtfNZp
	6QAe+QKdQ2hI0Dd1GEiwN8/y10nqhJ4hEf9KYtjo7/PdTbnzBP2aN0CUrJ28+V8jzIdLDtF9NY0
	CXWn1BRYejCSQtWylGX83Xa
X-Received: by 2002:ac8:4a0d:0:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50b80de1f5emr18883851cf.40.1774398678791;
        Tue, 24 Mar 2026 17:31:18 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cbda0f584sm20056816d6.14.2026.03.24.17.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:31:18 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/2] arm64: dts: allwinner: sun50i-a64: add UART DMA channels
Date: Wed, 25 Mar 2026 01:31:16 +0100
Message-ID: <1851851.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20260324161930.1602083-1-wens@kernel.org>
References: <20260324161930.1602083-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:19:28 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> All the UARTs support DMA and are hooked up to the DMA controller.
>=20
> Add the DMA channels for the UARTs
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


