Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DAB328B4B
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349932; cv=none; b=BDnTfGbl9AGO6h4xILgCMQbIB+2wrxm2L/RDq5CX3oV+XUOByQvA67Z5PwJ5rWnrZCXNcbb8atPPOnA1AW5sgw11QJzSvuYLubcO7AsdMV2crTqNu4ugVAVewgfKQzmKLQGuaOwJGJpf2bTAN6MEkmLnuG8MyBbiG89r3vIB0vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349932; c=relaxed/simple;
	bh=D4exzn2eQsrnSVOKTxBNcAdQOkZPbUWOO1eVm0FrlRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGHpEuDXbdU+afyczZNy56pScYjYBC7LByMXgZ7m1LPIM9UKgYmDtlQ66AAqNFFM485V7GS82oWHhYjdYqRUD8sVtPkZhSnJ73gsi0ZeoS4kLiO69wNU+Hj5f7DLR0UnuGrZENa5SUI8MKRMHBjRqiTnq1uVhWqIVYnF1ivKnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qX/+evee; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qX/+evee"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4903974854dso2257325e9.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779349929; x=1779954729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nMUrl25nDEi3Kq1mfkKWfvdC3P4YU+O18Vu1NBWrWVU=;
        b=qX/+eveeGsw6GFdF6Pw78+4sS39sd8t8OKQmwPsyYXjexU43a+Ov7PI+2KbctLFz/w
         F+MzhoG2JfqPKxNvyT5tojq4RgRkc8yww5vwHmb2pUMyIxJ2zhjX8D5R6nLfwFPZG+y/
         AVvwAtdq81n4KAAU+n6aYy2GKK5I0jvW7HzYqRgNfRrRzYxZG/+kr8W0xOkG4kyY3mqY
         VF6j0YyEtjcvsf3AythPfW8duEvcpT6E+YVV+8jgn1zy9K8hDP+J/60flmwQbMg61rVB
         KiVmtjQVQXmxTm4p47aABYgjmgzUzjP1awIiCuaSVMNI6nlQ/PDdSulGnLMBCL+rZH6t
         jqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349929; x=1779954729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMUrl25nDEi3Kq1mfkKWfvdC3P4YU+O18Vu1NBWrWVU=;
        b=b5ey2ohb6nsh5d110Htj5eLDEwYQ0UiWbZTflJpq8tawFOoqlit44NCvk24BPPAeP7
         BWDXPBK8cAjbZ07zpRjFWiVoWfxFmboFoAg10dUJblKUY476Gaej7FLfK3Vw0pr4HrSc
         pkxLlJmALnmESkhgoL99wSO80kYQGPIyLB6DJIvHEwjW8JTfze5qSu55aF9s9Ntg9omA
         YirsozYtzjfMYyTlccY7lBUxZosHDouvWWJKDy2Bj7wR64PlPo/7brZPerDccd5S3z4N
         C3TXMYs4dWWsULQCtF8WlvIOecWjzPdFfncEZ44qg363P9oHIAQSt5Dxr1a/CbWWdUXm
         wWJQ==
X-Forwarded-Encrypted: i=1; AFNElJ83O0AKeJ+12+kV1Xj9un+F8vt0E8rfKzDj+Eub/nspyvtbfFGqppN3kSRWbR0bFXpVGrw7rAUfOFgs@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/gcBF6Jpd9dX8tkO6JdinpPHBSCsmlxD3F0EOGDR1C1oqcQw
	5brJwPcYKBwDimhQ8qcEXY3jSu+y5vF7naePxjRoxqOVx6oFq8wCZx/W
X-Gm-Gg: Acq92OGPkbr6m1ZIKKo0XA3PuhOe2wr1wCXYrP6QMjmDK0Is9RkIYE8OKHpXWV0RK3m
	zU93+eCHfgRgpn3hoQ4txpSeDbzIh25TIbMKyhVUEn5+Ob7jdlTl+Pc4M0MHAXH3mA8dyVlCLrS
	n0mUneYl+udz0dkiAJ9jpZLvTZoZaqJnDWULKGM1d0CQGdxcDRdO7wtqgUSM1NQdwZVE2JQnwDK
	1mCpO8tL5Ujij8vWYdB14yIi7FRc1XDrErcjhCfQZx70asjTWn+qtiUcspU3wUhuE2QJTppCiC/
	MhqszKA4+WKc6ZH7rDND9sCQqaa6HgtPdKfkiyRd9KG3CS5u+saAPm+301AllAN4pbENpV6tUTR
	bnbms/0SJF4HS5zyoOQ23eYJ/RKs5W3rlxGfSxIkWy4VPmJJCF348YyThHb84PNprzG5V1IbCBh
	C5y/FPur5EbNd5b0Wx3ebxAi31WG+kFYjiuuoY4Nc+B0wx9cjM9tynNiTFaAwebUwSr5GdHOxDG
	J1AehDc5mR67g==
X-Received: by 2002:a05:600c:8b45:b0:48e:635a:18d2 with SMTP id 5b1f17b1804b1-490360341c0mr24368705e9.2.1779349929073;
        Thu, 21 May 2026 00:52:09 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cf23bsm715799f8f.5.2026.05.21.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:52:05 -0700 (PDT)
Date: Thu, 21 May 2026 09:52:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
Message-ID: <ag65LXrLLbbeTbTb@orome>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="krmmkipqxg3oqi3l"
Content-Disposition: inline
In-Reply-To: <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>


--krmmkipqxg3oqi3l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
MIME-Version: 1.0

On Thu, May 14, 2026 at 04:47:21PM +0200, Diogo Ivo wrote:
> On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
> than the PSCI SYSTEM_OFF call, whose firmware implementation is:
>=20
> __dead2 void tegra_system_off(void)
> {
>         ERROR("Tegra System Off: operation not handled.\n");
>         panic();
> }

Ugh... sounds very familiar. We have similar stub implementations on
Jetson TX1 and/or Nano, if I remember correctly. Luckily newer platforms
seem to have proper implementations for these.

Thanks for doing this. I might want to take inspiration from this for
these older Jetson platforms.

Thierry

--krmmkipqxg3oqi3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOuaMACgkQ3SOs138+
s6FV9w/8DRCSz66gVJF4N5xzCi2lxEIEK+/vKp04alHhNYSDgZWEhz711gr77nPk
23QWW7KrWzLpZOXMosGXjLpueVHFKG33h2Y2DFU1R9F/OBmo+dKXrUa1IYL8ZSfN
XWrIj73/Tz69oz0IolCgu+d3KABjueFYtVaKLK/wowfKA20rqRtU738i31R3paGS
OVc8DJdjr/KoEjbD9uWVji+nBJ589U9LE0KXFecU5O78CmQcIdcLlwoxNO770/Qz
nasdyLEs04OK/26z0tKVDTZayLjtHVOq0/pYQboaLhnNDuwL01TeOKc+//PytEO2
upOwtaigm7v0UZQTRko6b/4y7s5jC5UgY6Ww7P1nRKSLz6C80ZoyOaC4YSCVgrJo
vyQR+L1l6mfR3cePUbEx9/EV70A84T3je9CIZfZK/n+OP91wTKbf6giSzE+dEt32
zavGXDz2/4dGo/WymGxeP5iVGdeRoMCqdbEwgI2ie0CXEHm/jSY0OtNpy7iVlhEC
qETtwmlg20xgSMQ4eYw4NEJhV/6Fzi56rs3v7arDC5tRB6gtj13Ykmfjh9f3aMXe
Zpzpx46jqSsf3A2mtT7dX3KIdL9EcKrj0HFtIbXPIdJkwiJ3UK/WPfSrMCLmJaAk
m14wdYqrwoLn/hBcFDmpr5jZmalP268Mz/pBGQm+w4Vr/F8NQyY=
=1p0U
-----END PGP SIGNATURE-----

--krmmkipqxg3oqi3l--
