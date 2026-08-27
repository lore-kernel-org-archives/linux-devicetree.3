Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271593385A7
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853764; cv=pass; b=DsbkG6/BkEW4W5rEuqqwZae2eMeAoR+VmexTWAWRHMq4XO+CV44dTa1aRcdYPVl/X5eadfPnpgyMsXuBRPoZHYVaNGXMBO4z8Cl1pG4S2tEzLJ2rvyZs1lDd7JST83fwZaqsej7weoLvqrYfQMmyAlz7BSdgb9HlTs9/2iN0VqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853764; c=relaxed/simple;
	bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCi8l1BEIYJSEA933CAAhlkKjW5uVk8QlNuJ/vVKiiiKdm3sUIjyvFJp97gvYHiEzdXohL1NcGr0kSW4+zCjC1SuF40oKamzBh3nOR8/5mkPRs0BXtn1S9+RwFVAMUJKZd0QmoOBtp0+SDct3ykOtrwSaLQUl/ebscAYWutHe9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2eTbU+c; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2eTbU+c"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a20f56876eso1065771fa.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787853759; cv=none;
        d=google.com; s=arc-20260327;
        b=ZRB+5AeNW3o9A2rnJBPBeyx/XjIeiAdeHECI3DAFBl802U2iAu3vww2+T+d+WLsXgp
         iMu6QsUXsh8DkaTAbeUtr9lcR1Rp26Bu/ECZcrUhimWBcQ+NHQvywnz+yf80B4IMFhap
         JJHBtInu0ltRLa5vjppbmtoltJwYn1nihvlPxg6aM+Gf7MHRdO1Ok6J+qp6H5N967oaE
         IfhNFocm4Hy/uOPkdrfQ6uuvpz2ZE1WSDB6o2Dxgp7cTf3Mtn46W200iL2kciTs6KUdQ
         z3MzfDBvJILwV5QsVV23j/NiSOdBtsE9xZomvorqVq6my6zzsE0q3pZ6eZj3CBIwXiBn
         NbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
        fh=ZrwFDRGkZFln1J8ozPQNXwqiy5BDcbxJt7d0L7773hE=;
        b=Mvg/ZLnbE7kTanYVOM4V3y/fl31mLtsEkRHAlXg1q7dWqvs0z69jIh6NCLHJnNIgpQ
         jZPKqKwYYOg/E06J7nd+6diQgDB1tlagOK/1ERF+6lmaQOisUj3XLIOfEtOs/EImopvW
         tYLdvBC8Lqnn+bO8lIwuKZozpNXJZTxZM9JLVycguY4jjfT7fqzHP9iPcz91dp3azWeO
         K7qPijS0IRpwMysLHfh7WcgMseABVXu625JD1u96UU9G5Kjk0vCxuHyrPveP1yV0xy/R
         s/3/taz9lwKNQX4PXegpKIG7EFAAVVRmZ21bkFF42Uxqzq/86pvCXwZQXXZxmb25oa0P
         NWMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853759; x=1788458559; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
        b=n2eTbU+cbSbMUPkABPoMoo/sPQBVCvk2x42AjW51PvgBG2QdJkfraFvAANsPASidPf
         hgKh55SR4U04ozjiNmctMMYi6DdS84DpFDoN2Dda88qInvjcUzOuiq8AaHJ1LjNrqYXd
         BAhTk8QE74rczrC8g2Jh+81993ycn/H9sglMjaRAEGLj3kDriJsfUGVhQPTBVWlfrmnM
         zQ9Wp/bpAoBBunLQ0c8S2qR+05WXHrFYD+5DAGN29/41yzzqdH/t6mpiJ4Kq+Ua+S6s2
         Miiilzi23ZCYmU1UCM3d56SBR7xCR6syP3wZvuI3HC5AgIaTtILZRsvwzhUPpXXaXyxW
         S6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853759; x=1788458559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
        b=cQ+bZrguYkme+QfBlnHjP9GIzMkSlxA5+29f/ly+Wx8wZssUw5rU+jeRf8v5E69vfK
         oGMZ2T0DMS4HZMrZwiokUyJQBsQKOWepS/pEccsQjnUE4U/SxhRheOXTn62dsB02Gcsv
         A7My0L8AhLffO3sEYdvr6A0HNiWiwM4dowbcb8u5hdl4OS+v1i4EUdUya/N+hnz2ho+h
         MG9ZNjHlX400FrV6wilZEKwtAwJvAeiCtK5Dpy1cQj1saalIkuVQ8oGXsOCLbN13+ttT
         Up8tr04bV9fBcyDrE+p8VltYZxgAJF1WlyfoGKOOIUjH+HUaTcTTBjK2OtoyF9hm7BL7
         Caog==
X-Forwarded-Encrypted: i=1; AHgh+RpDxzZBxbrGf8R+3WJgnepBXJb1R/7IITP+R5v6rFPq3BoX3umc7tBkTdEeoP9wl/DPBlvUr2robFJZ@vger.kernel.org
X-Gm-Message-State: AFuF++mF8C+Dn3P/uCovWlnsTKFVlWUImRycx3uTwYvOm18y+vArEx4K
	DFpThjovbKuhOBH3sPYKu0QVGL6dcQFIipl0ryBvIcXJULe6Isoc5A6NsmsLIxpyZQyz5wXQB+S
	6c2COsd/xdcf0ZEOsb7IzzUrEy8qU6Nk=
X-Gm-Gg: AR+sD13uIS1mL5jeYsoPvLv1oKrc6dsTV72xlOAiqzCVjvvr/HWgHR9cx8U8Rll1yA5
	zQwSi378PxipPU3VILmtzgD47LAiNrivu0PwlyV2QzcDC9ewCER4nhVQT466kRsweXc/LIjWoOG
	Xlr4tNfO0HEsOQQu/MbHxdhqFWIVKjOg8c11u3yV7ip5Hwv11wJDk2QH7E+5z6GwYqk7rB1YfwC
	KJamcGXS8qEZvjnRQyhBWnHu6DdbmpnQq1bSyD4qE5thFOSjB/yUwVOjX+59b9GVhboSVPQWxdd
	FhStXnGRz9EEeIGu32oWsU3y12h1xO91rWrBzB0HrCY4FO+l6UEc3S4CoC/qxxXWq7d+D3zNTJ2
	zfc0jm51vCOMW7iB5eHOOUuChFg==
X-Received: by 2002:a05:651c:a11b:10b0:39c:9241:af65 with SMTP id
 38308e7fff4ca-3a301ac1f3amr415741fa.11.1787853758715; Thu, 27 Aug 2026
 11:02:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827171937.28878-1-gvalkov@gmail.com> <20260827171937.28878-3-gvalkov@gmail.com>
 <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it>
In-Reply-To: <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 21:02:27 +0300
X-Gm-Features: AcwNN1WhcJL-nGDx-lqXbkS4JNH0Ob2Z7Us1EwrenTLfU7VSU-Ti3TpW8tZnfmw
Message-ID: <CADOrJmae24XCgxFwtHssdoWc4rv1Q743hfgjG=kUrVPgf6urmw@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
To: Francesco Dolcini <francesco@dolcini.it>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 20:40, Francesco Dolcini <francesco@dolcini.it> wrote:
>
>
>
> On 27 August 2026 19:19:37 CEST, Georgi Valkov <gvalkov@gmail.com> wrote:
> >WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> >from the mwifiex ROM, which conflicts with the platform regulatory
> >configuration on units sold outside the US market. For example:
> >- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> >- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> >- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >
> >When the system boots, it detects a conflict between the user selected
> >region and the radios, e.g. BG FR US, and applies extreme restrictions,
> >preventing phy0 from starting on any DFS channel. phy2 works.
> >
> >Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
> >WRT3200ACM device-tree, which signals mwifiex that its regulatory
> >hint from ROM conflicts with the platform and should be ignored, so the
> >platform regulatory domain can be used. This does not allow the user to
> >change the regulatory config of any radio. It only allows phy0 to start
> >and operate according to its certified configuration. All radios in
> >WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
> >they are certified.
> >
> >On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
> >partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU
> >
> >The Linux kernel sources do not have support for WRT32x. An equivalent
> >patch for these routers has to be sent to OpenWrt.
> >
> >[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >[2] https://github.com/openwrt/openwrt/issues/9956
> >
> >Cc: stable@vger.kernel.org
>
> This whole series is not material for stable. Please drop thia tag from all the patches.

Dropped CC: stable from all patches, and sent v9:
https://lore.kernel.org/linux-wireless/20260827175850.89395-1-gvalkov@gmail.com/T/#t

Thank you!
Georgi Valkov
