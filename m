Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E23737BE8D
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356643; cv=none; b=lV6EDFuXr5tNBtdupgceiE3ycI+SPhKPe4yBDeVt3geAolnnYP8sas6H5IQpEtI6Bzkt/qbf9IyGHj2uJBXWuDQ1UtehRnzvEMBD/kgQzI2OBqkguxNsJC+U1df9voRLHi3lAZe1o/moiJsT2yJuDrN1P2LWstcNlP5FbAhITHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356643; c=relaxed/simple;
	bh=8ig7euf/6DYZks7zKKB9Wi1MjIW6Pwz0LxCZebrQV1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgBReqgZ9F7KbY9ozuyXycd7uxeNw7Vi+LBJzEv5uLY60SS0yPDe+VDzWiv6OWE5byDvMaaZOG9q6hvi6W5FLx/zNOzUmNAs9ZbdmLmngu2ojQC0JEHFlUwFL1Pab4a0ZdfMGBPJWassChi03XNoyzaWmfKZOLE7WTeO/uAFVdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMqQ7/8M; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMqQ7/8M"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so2531703f8f.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779356640; x=1779961440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jq5iqrAjPknTHn9C17DM3G4+YoEa9r9el4N8h5TTtu8=;
        b=mMqQ7/8MSxjoUAGiPo/IAqgJJBAMjXPRoY5ZQOE4knFWY0wFgSLh3uygpmr+g6sIt2
         sX2PNftgiOFPI3sfBTRMhzm0jMo7wUc/RjfveLKHCwawYGVIsI94k2WbWjxWzWU1p9j+
         fYf6Xxv7FqVIQrFBL/NU5VVFkoZt/9r3Zo0mdSmrGLK2bojuTs1AMEsdnchZVFgWCD3q
         zi3aIzBUCxgAb+eciZDXNUKUkgTxkSpOgdQ70j4Yb658S7oGIPFXCIpKNITPx9jgFHg8
         VIt4J+j8ODBK8vusmErLIBuB7GzbxgBEF37E6cCwqaFMhL5eU1RVi0bY3jIgfdRNiXA8
         gx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356640; x=1779961440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq5iqrAjPknTHn9C17DM3G4+YoEa9r9el4N8h5TTtu8=;
        b=IlWrFI55YzMRwZPBti5cHyN6UfisWT1zhZtm+jc1QlkyzIh+yd4BO0QzYxZwky1GIo
         zPuG7f2rS4Z8g/r91BT/zhmfT4Z33PZm7Ko4ifuB/NgPL91OMFomNk97WlAL8CAFjgoF
         UWRoThUys/ZfNBsSN965G36jQ6E3YTAT5qth6zD7orJzHrdTWWHX+ZUoVNQXkXGCUjys
         rmJhrJndCdKt1zhKaYNB8/udIRQkohjDYeDsR6jxYy9yGPnoYUfjFUie9AVSDu3qbt4q
         YZsR81wZbF6xZHOnaMkHGUVn/B81c9ie8rg6qQBS6EAW/bEOxmV8cmTYA+ZL/HAVIC7R
         rO/g==
X-Forwarded-Encrypted: i=1; AFNElJ+AbhUp0igvGPk8eIShhp8kvAw72E0GlbjiPtVRKGx9/7adsLSWOk1dEQLdMtK/x8u+N0MO64y5oF1C@vger.kernel.org
X-Gm-Message-State: AOJu0YyG7YLlbMiBHkpOVaSwSbzocwtiCE1vW5LBUTqdPA6wK0cfDPmG
	FJkHE4L2ITmf4WZnnxkPxACFdOiDjsy+1E3bBhH8qehmC4drf4/MruiA
X-Gm-Gg: Acq92OELOIjWBSmfnlX9V9E0zRl4YHmyhP/CpyceRnwA5f4COIKP1lfvGORNJcaAbeS
	LJBwp1LNoRlUEtjp8OslPgW0Pz08crD8FqG+SVSxqViLyNbhf0CPwXFdPvQRZdcSLZ1FHNNIsJp
	Tt+lMLCdH7gh1JitvheGv8IfUDi9fBCTg61yhXbG6XIVRaH3n3KgyczUWs70y4zTkVGjP/cRfby
	A0MZFzCMLKFIoNxUy5UnaeJ60WkiHGGmr+69vkyBknARe+1luh+O+uB9AhZzVDhlih6WG1ysiis
	AId+Ki+9v2mDwBhyMUmvJwySxkHSjaFLPEBJvEyES9obyaPDK7seelCxUbmeD23Xbz3dAEWDbYf
	GfNJNhDBY1ySOIDY4aRlP5ZH2TZ0Je6ZVzBFhdO4cGtaTf2Uw0Ya+mRljmCtBbTboNHXtExblFY
	WkMe4g9jmjv6fb8uDWZT+vuispeyndmoFsxXy0bBeIddSdLX12jT6ZG8TEEgBu57qGVnc+mwFhA
	cJXG0T1ledo1g==
X-Received: by 2002:a05:6000:144c:b0:43d:7b90:fa23 with SMTP id ffacd0b85a97d-45ea3be3772mr3377859f8f.29.1779356639760;
        Thu, 21 May 2026 02:43:59 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93d291sm1325006f8f.36.2026.05.21.02.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:43:58 -0700 (PDT)
Date: Thu, 21 May 2026 11:43:56 +0200
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
Message-ID: <ag7TenB3GrdLABuk@orome>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
 <ag65LXrLLbbeTbTb@orome>
 <367bb557-81a0-4286-8788-0e7272cc4d02@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kyo4eqmpt3lalhdw"
Content-Disposition: inline
In-Reply-To: <367bb557-81a0-4286-8788-0e7272cc4d02@tecnico.ulisboa.pt>


--kyo4eqmpt3lalhdw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
MIME-Version: 1.0

On Thu, May 21, 2026 at 11:23:11AM +0200, Diogo Ivo wrote:
>=20
>=20
> On 5/21/26 09:52, Thierry Reding wrote:
> > On Thu, May 14, 2026 at 04:47:21PM +0200, Diogo Ivo wrote:
> > > On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
> > > than the PSCI SYSTEM_OFF call, whose firmware implementation is:
> > >=20
> > > __dead2 void tegra_system_off(void)
> > > {
> > >          ERROR("Tegra System Off: operation not handled.\n");
> > >          panic();
> > > }
> >=20
> > Ugh... sounds very familiar. We have similar stub implementations on
> > Jetson TX1 and/or Nano, if I remember correctly. Luckily newer platforms
> > seem to have proper implementations for these.
>=20
> Yes, on my TX1 I was encountering the same problem. However in that case
> is it possible to update the firmware with a proper implementation?

I tried, but there were complications, both technical and logistical
because of the point in the product lifecycle. At this point I don't
think it will happen, unfortunately.

Thierry

--kyo4eqmpt3lalhdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoO09gACgkQ3SOs138+
s6GuSQ/8CPg1NBYsjjKRV7KIC6rIuDMgYyusSWnMeTTINGkRyrRTQ/29IQ/CDaW1
Fqb9aXXWRjpk52os2I5jf5cZaUuQAzZadeXENiiKb5ExxLxeu1zF8AHaMjEcZilh
zTcD9fCQplEPbwr7iDz61gE/4qfEnYd/5Zi4lCq8MdPE3UNTfXnlFHxjoIYkqbqw
XO82jFix9weBG53lM3QbhiM/96GpHKFrTForciy0bytmXC/EF5skQMdM/gSPyrTo
b3dTmdSOhO+KYmUJlGoOTRmb38hNQyx/Ymo70W3H8V88J8MR5rFPMQm7TI4QfzAt
gEeD1SQ6EupOblWkF0dWYQFSuDJrQeUw2c/CHu5bLj2Ci6sSjOIVdf5/XuUmdN/B
SFZhQ8t+5fchGNYR+/3a4HlHiu2OoOqHoAqayN+ifPuCNTwA92dOCf0875YW0e5l
wvIRMgOR89ywTaY4Thb09RXmiTA/tNK93Dulv+iv4nsefVJ1UD0MBO1a/4r/2aJl
6L1jVljbWHkq+n3hgFnzAUIuXGJIKAMqHljJ5pFWuNz1EP0E3JEOnARv8Xachzze
cc5LNxHTB3/XxZW5KXmj+gHitoWei4d9szdP31JDHhrdCZTsHsT7miZXB1i8FYQB
B7Ephp8VZY4jSkK+pX1czf4apy7bs2hmCedC8hva2cEuJXzfXbU=
=MWck
-----END PGP SIGNATURE-----

--kyo4eqmpt3lalhdw--
