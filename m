Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CF94BB815
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447323; cv=none; b=imEkwZAWA1Tfo5W2fCUbNxOkPpxYMMRfb0aUYwxfSZ1jxoMi4h515PnETeRUQipjzED3UIlFTg9TwP95MFqsK82Ukd/K+VaSMJBk7adR1pIQ+nH7Pwl00t9rGxSay2Mgty0X7IMMUwkXbR4nfsneHpzX1THPPlpTHNDo0y8e2ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447323; c=relaxed/simple;
	bh=+H2EOp5Fi3D0NA8DNxkPWlcu5mNPCH1s/JJTkBM2oWg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZeKmK0ovcfEshr9PbLgbXbZeaXHpQZaSdwOFswzZaoKEcB66W5qKm3Q38EyS8Glprnqkf+I3RvEfkPXTTZXFB72K7+sxe2YIZcDvO23nAau06vQMpTg+hj2Bv3TigwCc9wCYPkeSf7brecgdEBXGWGhcMJj8E7UBjAeteM3ixtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VHEuRk3/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VHEuRk3/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso18716405e9.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788447319; x=1789052119; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+H2EOp5Fi3D0NA8DNxkPWlcu5mNPCH1s/JJTkBM2oWg=;
        b=VHEuRk3/ZZt6vUVUB3HsqLngEXn+r7nBqBZXbr4rsmN9KV5tBTgnNOwvYsu6y5/mvR
         2F3E1umZhO/pALrLI/KuLingt6xn6kCY1PsXLgn0s7ujUoPJ3r5MReQmC1gFWuJbf3eY
         L1x5LJ6hfZgMO/HsftvlPuZ0IlEPc81WMBWp6yNeoj6GrLT6127UA4YlfD6PuvdZvz92
         3w8QuccQjdJ2DeuomSeM9zQnnI6aY6jBPNrfCo05JSV1xHceL0+BUUFmTs4fVpxR4wI3
         fFMs+jPVTQ4S+k66t+7Maopip4d0oTBK/QNv3IlJlBLTO9iTjWPkKPOaIEOn0kAyOscU
         Ziqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447319; x=1789052119;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+H2EOp5Fi3D0NA8DNxkPWlcu5mNPCH1s/JJTkBM2oWg=;
        b=YQXm32laLMedSWNOzH/1f3ti+XXhAG/8QkwEM3XXZatEDiMu5QXXomUiTNfktSnob9
         bGM1Cw+eVaHZ2xrvvmdQWLmcI+RKzM08xbNzMqwjAAmvP/gyktJgKnCm33MGJ5CfqM8x
         icRQFgrB2e1dFKa98xZtu+D45czjExHwZqQpGx4hMOhZgIGs5SkdMna80Qp/E1n6GqOk
         Vt7j2bEettt2eIKdGwpohx8BnGvTlm4V8P4zuVHKP3DxiJBJmFibrnFYQ10SWrGyDepf
         hZnrY2PN3avDya0ymaQM+tENWZ9xrLUa2ZlN1C0Nc7Zbvv/hLHHramLd5tK/6/4nL6Dp
         lEcg==
X-Forwarded-Encrypted: i=1; AKwUvBw8lcrskzBjAPqJsyGC49sg5j50jsslfqo+oncml+JqOJxNY2Um4hXVJ0Pv93cfC+BCgL7PbSHjZJzJ@vger.kernel.org
X-Gm-Message-State: AFuF++lZHzqlXH2G7JTFNcLG9evUMpgxLr3xhzK95h2A7tSGEGg61kn/
	HiV/0rnpC2PM6xV/3YloUGKOpeVTrffvMhjnsAEE6cPwTy2KGcKiTpQkvM9mItyshfo=
X-Gm-Gg: AYBFou2j9KDhhw2h0CUixTMKArclbvdBG35p9iyoZmASLYjz8XXe4OeckCAV19tZkOy
	sIDiOPxDoFJK7OhC9JGan319dZVrY08D87W/V2AoQi2//ipZSj30hrKswDEt9CYMkb2ko5E13pw
	l/ct9YKCTYrP/v67DyHwP/lUApTRS3wjjuHlr5l3/HFLonTdgooa5/rNVTudZNURBkM8oO5nBvs
	LVB7BXip7Ji4TEqdsRMHUT60VENzemAseJKZHM+Uaion0ykpydL3KoL95OiiEhbUcT4Q2IIxBd+
	G+T7ASPkuB/KvnePI3KEWk/QD4u5a985vyltcsmWAR+7xs8ZYsaJfVXyQMTvpcVER+rA7Gbp9kT
	whE/Te4tl7BHJppwdqt8oETA8yUjn3h5Q2PvaYK+iUNPq8K7mDL4wxlIGfl+3dDTvelCoZR1Up1
	6Bh6h8PGBWrRZjNndtLeh38fQUeI680OK9AUFsJ/ObYg==
X-Received: by 2002:a05:600c:37c3:b0:49c:f5c0:aa79 with SMTP id 5b1f17b1804b1-49cf5c0abbbmr9145495e9.9.1788447319577;
        Thu, 03 Sep 2026 07:55:19 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm75862735e9.15.2026.09.03.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c74f06d374bcc0063b4971e7e70a63dbdbbbacd3d501b3bcff9aae8712ae;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 03 Sep 2026 16:55:13 +0200
Message-Id: <DL5RNTPIARVY.10YJNQ9AH2DDR@baylibre.com>
Cc: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 7/9] arm64: dts: ti: k3-am62a: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: <sashiko-reviews@lists.linux.dev>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-7-74c650dfdea6@baylibre.com> <20260903125534.48D651F000E9@smtp.kernel.org>
In-Reply-To: <20260903125534.48D651F000E9@smtp.kernel.org>

--c74f06d374bcc0063b4971e7e70a63dbdbbbacd3d501b3bcff9aae8712ae
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 3, 2026 at 2:55 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] ABI breakage causing monolithic firmware loads to fail.
> - [High] SPL memory allocator overwrites DM firmware due to missing bootp=
h-pre-ram tags.

Both of these are not issues. The firmware load in uboot ignores the
devicetree.

Best
Markus

--c74f06d374bcc0063b4971e7e70a63dbdbbbacd3d501b3bcff9aae8712ae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapmKUhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNz
dwEA8VM8z4iKQe16SYr9A8dbm1O50RDaLSYaXDfl44AulxYBANXrSJ8Q1JfZXiht
b86yLKyUJbt+O758WHHoQrEPBAQJ
=Ddbj
-----END PGP SIGNATURE-----

--c74f06d374bcc0063b4971e7e70a63dbdbbbacd3d501b3bcff9aae8712ae--
