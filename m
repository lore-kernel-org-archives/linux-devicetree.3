Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4293354705E
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669736; cv=none; b=KXkm84YHTTGyCZ8ygX08OqfJOsz2yzSM449GH6u6D1PlxxuTnBfYt2kqW+SI0nxjUeqSGNgM3q1SEDbey7736yNcW0bQE6bO3w7pRyFWhnE33G6oon+jKxAWZjZ77GCQsFeq3IbcupduCj+tg75IDMp4FWatPA9B4fPytOb+LmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669736; c=relaxed/simple;
	bh=2SpGKqTp/JfwTgeFMmRyNuW7aoTJomcaZ2jk3HniGKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0VnYr9+WYyRMv6DThx8KZ6hVDqxPRTfjOI24Zt2ZLHjkLPdU+b0cRf3Wn5rzPhV6q/aLPRu7y9os0EcI00REfbxSgrzC6Z9v8mfm5KA1feWxY0K5mqGZ9tX6R9EQlmWR4+bAu2Ywl264Pe3FJQTSMcysMLDDV4/Xc7aqEVyU/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRncQcJY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRncQcJY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso435343f8f.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669733; x=1790274533; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=eRncQcJY4sMUbwzceyh4B0YQ5s+BD1pI7g/eQQnIuKvJIog0PgF1BHuODVFIgavUNY
         EWJWSYdQ1g8noErj9sc8OLN1Zoxan7iHLFRNTL7m3ItL7EShAU/lyIgkRFHzh3Q1/FHc
         0rz3StzGzHAOkoqNMCjCctgBpgVPZgkhKMA5En5bEgFFvsCSR2+/m6TcjheErvWk/2GI
         vCsl+AHbAnKrmovi1OuG8NOsBIFrKP6a4lGQ2hls0c2WNRiliV4/6aHpQT11dSxyjrfm
         JAEbg7GqmnyftjUD1w8nZlOYmfk35dUhFdkiwcgiuWSrvtCFblhxaZzOiI30llauaPpI
         A/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669733; x=1790274533;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=Di3hucijXa0j+mDwCTGoy78vRm6MTwbAKd/pCmQBbg7Spalkidh/sH7WJ2V0R5q+ba
         G/ZkQSunGfdZUIyyUdL07y8CFN6ia7Eee6BXMVp2hRIAX17A4R+Xt4ff0GLfH2GOLjgV
         9f8NW+mV4nMopoBUJo6Rm5pvzRmVo381cp1NdqCiF7XK2Tg0eaw5ZEHBPS2t3kXsaOt5
         k7uw/i0jFxEgNXIjKY1CPM/L3t2QvVz2xJFm5rNUGdkZL0Vni6H5M+TD0vy/5SRVwB5k
         nOyQ7wLVGPyov0EQbylf3UH2AaVjU7YNMEah+YqYVZZ6TQ/fuLs6GLJD/2h/3nVR45bV
         TmNA==
X-Forwarded-Encrypted: i=1; AKwUvBwvHW7CexiPtBxN4xNuNIdiHQMy2V/EWqtXg+tSefHKQOo3SM24U1HKvAhWNEPD2/iO7YrG2xFds4/c@vger.kernel.org
X-Gm-Message-State: AFuF++n3s7j/pzixUYMuIlZV/dcdvu1gtfAECvfATtMrOqP3L+n9NtvH
	shrxL1AxWCboFntZ1TR4OHGMRI3elTnYTDVafc/hMdqBLJzbvQbOn4o2
X-Gm-Gg: AYBFou0HkTA8U11EuD/q7z9uheIPUZWMIhacJWetamsqLjdtMm4niyMjbb6AeeAGi6Q
	3BrTu/iJVOdazQTE2cWDGuwVDa1pWAWDpIGoVLviSDDxx1Wr2XYidR9NIiselYgJyUThrrmdn+F
	p6FkF5TKS5mXai4sL47HfmY9l0pLPS1qVDfqUT8crq+/9J3/rp3+DxchN5Mw3Gn0Ohtf2ieSKFp
	mBOh+XGvnYzMgWYB7X2mVQS1hDNnJUZedCrmiC01Fd0WoMahj2XhJzR5vGR1afKBFbs7DXdBIb3
	/RqKIuw0a2JIgxpp+fi16XMGCotJ1Ckb46gNWZFQZSv3Uba4AMAVbeQ8OxCHm7onAc2WYhn63Dt
	C4+k3244WixglLf4iC+dIpwG44UgVT+bJJtaQTcV/p/EAbin1zkWdt5xaxkynYPgpgjp56k+RdH
	XsD3g/ubuipfDD1yWQGyP3dI0bq/HqhZnPJsV7MfibBW3BVnALV9vtrm3WdBkFlqD1Ovb8MEWUU
	alcHQ==
X-Received: by 2002:a05:6000:708:b0:487:11:d053 with SMTP id ffacd0b85a97d-4871d915c41mr24943f8f.0.1789669733272;
        Thu, 17 Sep 2026 11:28:53 -0700 (PDT)
Received: from strix.localnet ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm17422129f8f.14.2026.09.17.11.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:28:52 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject:
 Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
References:
 <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com> <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartElaGoEJaRnaci40IYCPnGA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
MIME-Version: 1.0

Hi Lee,

Am Donnerstag, 10. September 2026, 22:14:54 Ostafrikanische Zeit schrieben 
Sie:
> Hi Lee,
> 
> Thanks again for your review!

This is a ping regarding my reply[0] to your review from last week. Do you 
have any comments on my responses?

Thanks,
Stefan

0: https://lore.kernel.org/linux-arm-kernel/x9tzyTnKRAOyrdtSGnka0g@gmail.com/

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmqsMVQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiw48P/3we1ILZFxaaGd9dUpM9
EPNR5ZVYal8qGKGBQRRFG5L5iI9qCAETVZTl5UuYFjjcs3U9+f2t8HbH5pd6hZSt
C2F3WDGrsGddEGAPArMF7962KRKHHPUDoEOokUhrdp0/J7XFAZRDjCPJJdZxTHZD
cpnqNPNwoTUAWYs4kLINKy7fY7PW+sJqUmAqvnB47RLoFURA9/DYcNxa/1esTScd
Vyzm0NEsRFuZVSYTSjbBffTn266IrxNRSBnCJOxRAEv4edO2dkkqy9OZBDQLkcYn
LJDrdJY/bAPJFapkXGuowmd5kVtYjG60V8+0suU1m+2HLlSipyfl4XeYHAS8gT5x
UbXlsxgwtxCnMHWed3RbtXUGsYuBCsuO2HRz0Rv6Cduc2qY4XeEtgFxShiQbtq4w
bxxE8DTlxoYjflISxEYYp/fD79irBB3hsp7oeSzP8PUyHsuFfCKpb2kfwnUtwRIQ
Ov2oPm29JViaAFvrF1h5FQEU2zLsdNBquOIlsqamK07yjEPcELwlAByNv9e65/Zn
3HUXepbTgovCaAofjQsggxDdSLLb4O5FjNn26DgHxz9d6ONWOjyqOIalTG2SbujQ
ZDmnp3aIX6ETZBue8mBr5Df9zQTmCwYmmAh4PtqvOfy8R72pr+i3SSUdTXIj8h4X
3h6c3+ubcO2oiEqVFEPbus5o
=NhYp
-----END PGP SIGNATURE-----

--nextPartElaGoEJaRnaci40IYCPnGA--



