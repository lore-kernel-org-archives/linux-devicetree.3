Received: from mail-qv2-f38.google.com (mail-qv2-f38.google.com [74.125.230.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747F39DBCC
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162682; cv=pass; b=qR1tz2+srsFEjU30XfI5fJRwAEu5Ag0h6tH+IlLbmG2gdztFdLuksdyA83/CsyDPJ61teUQjFrfd4rB8qFLAoYusdrdHzqJmcwwDaYb9RskmgJ1u0tbJze0G4sChOFEuQyaRta0kTniz7U9fHh+g5X8rohPvGB1fQCeZhcqiG1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162682; c=relaxed/simple;
	bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmX4B2llnTEpubstTdCCvk/UX+tyAlOBYAB70phDa2YK9g0cxXg9yFjGmuRa8k3eWp/c8uVhF6BWXl+D+Z02G+B9UGJsa4pazJ/doyc4mVOqyLZzgwgNch/IjZKoZSNb9DtebT92yvNnd2dUHZAx6OlsOSICVjEzcamLzcx3lRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHojEQ3i; arc=pass smtp.client-ip=74.125.230.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHojEQ3i"
Received: by mail-qv2-f38.google.com with SMTP id 6a1803df08f44-9107051ba26so5267106d6.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162679; cv=none;
        d=google.com; s=arc-20260327;
        b=fMzbYFM92l+aeJjnEY2NtJ3QVZIIbdu5DszIPaP7V3uj3YSjHum2TgfRLZSThynfur
         ppcYj4vxJ+MkElZgaJd/1+yAf5AO/3RI1rmhzvamzmCX06onY9ld4dibhtHDRZ8H0r7c
         BeHD2MCJW4G2y9+9caiXFtIGWcvVq7bBGI7Wo6pu+cGiRqKbGjznlMYbyjIOxj+0uw57
         2/NYd9YE/3Vnogu95E2WKzvdXettI7oXI6jqfcALDmr+ZIhnuWbVAh8wqmHPTtOoYtuJ
         1jv/DH5yi8wiGhlLzeQoe/jp5/zDZeEVuPcYkZeKNmc5ZBsfIBq+iBldNrnFW54/joSb
         W+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
        fh=T2oq5z8+NLd5cO4cyAryIm2cTWAkg3oxWvRIf5Pd08g=;
        b=QZj4ta7s/xXWb+4YT9/zI+SbiAOZ5XgdFu6HNkDnYxhqPUcCigmOViCaH7fBLIPARI
         EAWKsQc2Uq977OG/asuQP1ebsQCbVaYbnvLoH7mda+UULXlE/dKjb0pPcrhLW0yaBDyW
         Hx8N0RmwJqp1WzzP/P5E72RVkGNuA4vbOOMBFd9m0TlGhAqvrKnzsBl9d0Ou3Yw8QBaf
         xb6sNcOUPDflIIfuauJ9+GWd2TQQXpQNMTyKAY4m/7O442dk+jis8be/i7nxIc1SmkQl
         01GgX8emnTUJ4ePm3ME2TxD2j3ECQLvN/KuBEqGFb3SwVK59ngujDle2UZlCnWntTHHk
         DPCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162679; x=1790767479; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
        b=bHojEQ3if/5ybWyV09dEhN72ox0ELNuswMJeTdkdKMsF/oIaLfPbqMHubJi168kd28
         pctjKiuCH2rVDGPiIfPf81AddYZedNF1nl+VD4ah3orE7eKg5qrzFtoMIQUX/SRwQKkh
         601iENsNRfoflnnLMJiLb3Sc/pbWOIKxEFXUu/0qZ1f4Zx7Un3K+PPNGW2dpn9f8QvMF
         ZRJLcDXYC6QtZXkVtZkGalxqE1AoR5I/rvQcVqX1wsam6G+P4cuTf26wtznLWhSqZ7wG
         jM9LczwEI+xqpudjeAXFxP4jIcIa0U80B5mk5+ZgZlMpWEsdkoBhUSq/5TRNVEtLSG6y
         UyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162679; x=1790767479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
        b=OuL15lFSf8HVbzMn/jJj0810fa0zH34GuMXcjgyzO9DoSsZ/xjDkt17IloaBaO3569
         1tTBeLu0JzxQx/tbg8h+/CT7dAuNJqPLIv4H/STF1+jz4hqogO+/7qqoE15tKBEGkx9p
         DBB+1w7BY4H9rAsGkODwRBRWFj0FFrpxx9AE1y3qjaW6dtYfHvFgq3iGlaq/srUAidX2
         tpFDZ3BbIRrZ8tK2ec+X3gPcPA1xAVvr/37RpWqkJc9iJ4k+tbZpgp6nHs3CWrItMY6v
         yX0wmenaiBP738E2QExYrdVrUGtjc/VKiSHL1kde5DShNScWX3SKVbccgrMbwch84ksJ
         wgDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/UQiCf33DIHOOIWhMxVTGG2x4nAHPE64HtXbJWb2ueN0nGzoFlOrjaTNop4WEGR7ACdAqVoF3BTT6@vger.kernel.org
X-Gm-Message-State: AFuF++k9QltXLzLufbPZb3/0maaQQfZZAgLGsEm/ze3nXWXZ4KqkDGni
	yO7oOCVsCMgCcmffAlWJRKt4DDnMjsDPqQ8gwBppj8lUloKsq7vGSvQoYY5trg/gCk1ZaIG2iY+
	GCblQ2IWUwXRw6gRrZNQxzMv4SJJlGXg=
X-Gm-Gg: AYBFou2nclSamwkxq3i7T7B246AwDDJY1t9YlVZlk1aHs7PhIWT2d50K6w7/QRnSd3c
	jFL1PVbC3dzfe8NJb2kBh9Bmb9uR91mC89p2GbXXS1dJiDhEbvTYSBatb+h2YTrfQUKthpwXsxo
	wNFLtM7BTXcQFNrlyt/75K320zTkNC4QI1qx2PZdk/J4BfTzAzUjovkqXP2SMb2UY8Xe68W52Ng
	9AKGu5ACyfLJRDAeWLv6hsyyNgGVHmg5o2D/XQyBfZ9Liz6aUuh4rzrzm4bFYawgC34LbVGdDJQ
	kD7drFjS0NrKC1nPXdFC4v9AzmXOh1vzsIDLYL1g2vAo5HwIQ+b9IgKpug==
X-Received: by 2002:a05:6214:2507:b0:914:44c:6346 with SMTP id
 6a1803df08f44-9140c3c38e7mr38390736d6.34.1790162679333; Wed, 23 Sep 2026
 04:24:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923105208.198-1-anykey196@gmail.com> <20260923105920.CAC761F000FF@smtp.kernel.org>
In-Reply-To: <20260923105920.CAC761F000FF@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:24:27 +0500
X-Gm-Features: AclHuK9sh5FBNarHLAEfVcm3oesc7H4_pIzHCxSA_Op301MlJ4p7eXIkEI6zvb8
Message-ID: <CANHPwARnF75UhVpW2UisXW3QVyPiyMqEnu=MGFkQSVUh2F32GQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin
 expansion buttons and IR
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks for the review - you are right. The two buttons and the IR
receiver are on the optional 24-pin expansion board. With the board
detached the LRADC input and the IR receiver pin are undriven and
float, which can lead to phantom key presses and interrupt storms.

v2 drops them from the base board .dts and provides them as a
devicetree overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a
Makefile entry, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.
