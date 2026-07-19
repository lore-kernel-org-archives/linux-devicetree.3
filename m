Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF339936B
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470733; cv=none; b=pG9xeJMluycCpvDsml/aquSsTeOItkGVrfdocV326V/RYjnrd/vSS6g5/vdMvQgyDniYqXAhqdufNYK7DWo9HbRqXizHmeADULucnbbPVnHhnRaEgBIqzcbBWoi5yZvmaXrzS4vAHw9tp3Gyk283wMPJmkUPUWGivhBsE0LqeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470733; c=relaxed/simple;
	bh=MH1eckPMZzz2y/yUS5p3C7hdriX8ZbXO14RSpyisvCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VryyAsgAsDsGfZz/v7+MmYucaOpxOT9jYMSon3i6KoNPQ0w0o40y0vwp9R+3OxNriBRUl2PPMYcbXdcbKd83nt0fGP4d0NjBr2TmyrI19juYGveHUi8bi1czWh2i6u82Octvy7YkSTn5N5b6i0iqo0sPjwub/j0YUeWxdggKkZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPHNBZp6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPHNBZp6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so3895928a91.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470725; x=1785075525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rlngx4eYA57A6MoNforZqa90xnpEvIJzU2ucYSS4JxA=;
        b=KPHNBZp6Ih+XQDcv6T0tQ0dKpzYkyOffHGyQoUz2SMti4jAPTzPcCuf+S5wViM9myo
         vQz6ij2xJKCzBR/JXSSKc8+WtHvSHJfHnTvUhHC2gFkGis8+6VzNoG2UAMonF2rrFcbD
         G6WRJ7axOed9oTzUEi9Qc4Tw5QZPQcod+tMmSEZO46C5qc6Ky4snyfnNqn3m0IqnDTLw
         LJYapzuU1SCznLM9/uiyW5L3EhDsF/OEA7qIZQ3kosz5f3inPyA9Tb4GVXOQkNaP2p1l
         YOc2D1aChXGMGNjzEFhTwwvNo4Ya3ATs/kP9YAnYt7bdGOt3UDMmugS+JbxI6007PMbG
         ItDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470725; x=1785075525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlngx4eYA57A6MoNforZqa90xnpEvIJzU2ucYSS4JxA=;
        b=muFkWpgmr9+BP5CZkTZzUttCsgtZjodMvxNonZYhTvyARM/1QIW22lsVFBigG6whWZ
         LgQtqNFzstRyMNF9iFRzFqiHunNXHYda8GJwefQ3NZl/PCX3NkoeWNkXGQYskQELpLwh
         r9n9S6WgZyvvdFsWwy/vpNLKf1AGOM3XI2G7Kio+Mhrdv3B+e4KH61NyxYznPFCXuOv1
         IMl++u2e/eL55Ik8ylEEjtFfikl3G2jFEPRfrbU7i0EkeVq77ZS0w01Sof4k+gburJnb
         bQwFBWflBPjw4PSd1McwfIMgRlQTiiimYf/A6Q81nlJChQjuInA6jNIJLoDRj2xRC0bj
         8BQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqu0/gk9YmLGC2H1R9sg8+5nIheAL97fugh9B9qXHAONe04iDFL/lpynk2Ewp62XmhJx8U6t2cWgv9o@vger.kernel.org
X-Gm-Message-State: AOJu0YxqorsyQx0P1juRu44y2dSu9Iezcku85LN420YgiMw4Lg8cYCsb
	cGOwjNqsdOE1jZZY2GaGR3y7H1SFtpRCUp9WEP8kPcRQthg0/Ea4pKn0
X-Gm-Gg: AfdE7cmBC0ahKMujbohzNh8m7z+2cA2dvbjDj3LoTvAaKZOUFydAQLTa6lEJXb7OcvH
	KEaToAkAp/uj9dMydpGpD4Ny2+iyk6RdwZMJWqKWRid4H2olkdJeFFtxT2eP2fsLmQSE9AbsUYO
	iUBeNck5cBg7ah8r/JWFwavJQ3lwCFweXVAWkhAObeP2xEGwOTfH1jh252GmgfNJ8R2KmaGwqO6
	5F18FLkgDN22GOtskBrzmSVbEgQ6vlLpJB7nEFFiN2rKeuJK7ylGsxzQNsNhwkLXBveLpQTplif
	6Ihx0gaB6CymOKXUzjA4X05uI0qhyaau+JoyOFbV5q7bURBm2u+misjPSfGExAbh41cmYOCdzkg
	A5Og/kTAoqis9sFuqJyy6eKOC8WIeC++MSGKO2/dDPVVxo94yaQgdMTVeiGD8a/KDlZUP3//Gk9
	HqD6x85YnF2pU8txU=
X-Received: by 2002:a17:90b:1c02:b0:38e:5e2:6dce with SMTP id 98e67ed59e1d1-38e4b57e964mr10388567a91.39.1784470725519;
        Sun, 19 Jul 2026 07:18:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm4147810a91.1.2026.07.19.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:18:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:18:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] hwmon: (sht3x) Document support for GXCAS GXHT30
Message-ID: <eaa54c0b-441d-4fec-a374-5f1d5523f5d2@roeck-us.net>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-5-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-5-zaixiang.xu.dev@gmail.com>

On Mon, Jul 13, 2026 at 03:45:59PM +0800, Zaixiang Xu wrote:
> The GXCAS GXHT30 is a humidity and temperature sensor that is a
> drop-in replacement for and fully software compatible with the
> Sensirion SHT30.
> 
> It is handled by the "sensirion,sht30" fallback compatible without
> any driver changes; manual instantiation works with the existing
> sht3x device name. Document the chip as supported.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

Applied.

Thanks,
Guenter
