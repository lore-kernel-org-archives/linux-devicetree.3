Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD0837E310
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747728; cv=none; b=nx6maTtr5dRmdvjlsGuKluHl5pFGc9ClJ0c+GLj6wMWzIb73jHCmYnEBOhq88TDW4DZBiedhQyRkFhHHo/r8U2WaBIMvhWLK9TIJ25YPqeYSsVGK5mCpALCYb1xUtxeVUwYNh78dTXT5s5xPPNJup+xIBaAKDjFkdLClhlFCK+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747728; c=relaxed/simple;
	bh=V6o8/Gq5JSA1hvsuomub+jf7dy5sMCVKfGHckD5JYt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc4LWTT/UkIomPsDYCIP1VlcqsA9CUaDxNuS4JC08gWcvl71XFo31DvrJZQEZTUhSVGKClziChigUlDtXdDHh3bxgmGml1i8h4nqEduX17fl999oA9XDDMO4Z6NL71P5gZDZsSCzdsxyCEIPeUKgAtmh8Yi8oXRUVS62MNJ87xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z111cfjF; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z111cfjF"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso529931a12.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747727; x=1788352527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=;
        b=Z111cfjF+MIKPOo+mF/4D/10UEfDu1XdcB8CJnwatfN1dz49BpPKFVpq5n+cWrAOWH
         Y++XjHF4LLhii1STKj83qeFbMC33I9EghPcu9t/+TGETi5hag+6dp+1XC3mt7s4pu8ll
         uQ3s34axfLzoZDjN06f6V0sltf7Adajt4S/Jdbww0unvhw0LrqjBe2xFA6MSDCmNnbba
         3sncFvmgrVXX+jhFAbUa7gpO3AoFhOgwXvVUwfVYohxjCQr5LxVX16WkBSLdrmPdwtQ2
         KZraVZalZepBr6mirTUf37HjsrGUc38l/xTLx1czEpOqNGlGF6/sMz7Ki+lP/mHzmYE3
         E/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747727; x=1788352527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=;
        b=WuY9i/yApunbiXGaH2Vo0hGlEyRwvNAxByMrf9wexOH/bnb54gqNZgTEpjDCABCvms
         Wq8Uusofw0p53pvZYY3eUWLMCKcLhqzKVP/NRgi7+9relurTIEr4EmZhmGBntAFLRJ+T
         dg1GenkTj17UWhGJWCXlyvlSQa3rOjswrgi7tKGxEBvoHh2FzIcSqx/xzXgprszzKp1F
         6142rlLNMYDonk+Ixf9OT6DRY0aEjAKPbFA0zNtFwDi4VvEtvEeLktXw1A19AYU8VsMP
         UscxgFOs/TFPyNGakfmPgNE4llFAzM0Er4lawFOO/t4avWLqIK61Xg39FujODEgBJaiY
         qoMA==
X-Forwarded-Encrypted: i=1; AHgh+RqBPMqwkAsboEamFhSssbHb/D1wrhMhuSrWEKeD5mTvv6DGKLhHZ1U0oJYh3qI6CmpzVa2CsiMXk9op@vger.kernel.org
X-Gm-Message-State: AFuF++n8I+5vAWMd8GUIMhTN5aaoF7CF7RkDVyqWjaAY5BgjHmXmDhH/
	l1tUCmUtSY1vhepLiZ/tobDpWGtIiNwlA6Wzy5y+2iazov0RtXZ2A4h2
X-Gm-Gg: AR+sD12YVYtqfL5aLvU1CmdA7kSfCDWeGeyLIhK1Yc4G5PAOPF0n9Cn0xUjTzy2YXqc
	0I9W2iIj/K7zOI477orCXkxqpC/MV0nAjs5C7Eqm6X8chw+xUoNwsLHuO9DXFMCIEanDwXTx0mQ
	EcbA5VG7mQFiRmwJYIwiOpbbrDVPJQGeCPUvtH5bnnjqYvafrWyxv5pp0yB1smK4ugX03/g+8xS
	PGvN5iWOctOSW1evogdZh2CcFz1LrS0jmtoPUIsuNQ2c31dv3xWlfklX58t6MFo3+7NEi5y6U/X
	O5/sF/5Wcnbo46Iea+yJoS+Ul647xcLuy2RTCsnGzlKacnLASi10wR1aVwc6Mqag2BcwrV/cA74
	Nb1uM/iMBMR9WcMibeqjXXbEPh3hbZkOhIXCtTEt8KXBz9lk5kjFBbgw4LxqFnex3oPRGzT5ZcH
	DrGbdz/+Ta0W/0Q59Y0eKUwhHxVwgVtRpPNP+s5NEPMiNf0FEwgytWKdEnFGQBdEZe4SIjwngvB
	yBdIUKAoEYuR7uEbOz8rew6tw23IA==
X-Received: by 2002:a17:90b:4b04:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3966d5f900dmr13609817a91.8.1787747726840;
        Wed, 26 Aug 2026 05:35:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5877:641:857b:1318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20095sm7925744c88.6.2026.08.26.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:35:25 -0700 (PDT)
Date: Wed, 26 Aug 2026 05:35:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: rva333@protonmail.com
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6572
Message-ID: <ao7dfxkXtbt9BybP@google.com>
References: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>

On Fri, Aug 14, 2026 at 04:13:52PM +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied, thank you.

-- 
Dmitry
