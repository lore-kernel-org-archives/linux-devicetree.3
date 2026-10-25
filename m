Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792908485;
	b=UU5deVPQ7RaJKHbp7nxSjPG3FEXPv9zSzTxRnt20tHjV/stp/htTaQHN8vn2Wra5yMWz
	 JTvXo9CZyPN8uaWzs2N0qr3g2jkn9SLRqYY3XTOH1OQYX3B8slHj0aD96EBeywo9z1m+8
	 90mH+qJdXaK6E0qYfMYOccQp6ejZ9CR4NblbWxMJ7hNpxWOF8sXgavIyKnx9ASo6UvR8H
	 xKIaknIm3DEj7XItnJQjLpJ81RppYR5KgX3mQPN1v2WwzTo09cii399Jp60mNig4rFVFG
	 spUe36R2FbaQmUrurHfrZJNs6gWvMqK1qMCUUIb5w5BaL/XII91pyHYLbeKkq75aKfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792908485;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Envelope-From;
	bh=lOhXtn8WBrq6j4Lq15neSmhPwS5pSKiwq0yB7vi8J3w=;
	b=ZtTg4GBgwHJ6SblCSM6D68XyBkyZi+BWbHdYMofIn2LxOr2lu17hgT/Uo56jT/cn+Uf9
	 T7YdRMdLcuLtz+pSCmkSjAC7FmvPyNeEtgLlGINducQfrgHm25r4opFVg+h3oGboVqva5
	 sHsHOvWOW5q1vq9PlGlGT3zQzN/3kvco8RP3i34Y10MVKjIhPBOnsgWmDGmm5AT0OYkAS
	 fRQw2Hnx5jP1aN+r+x6s1SdSZP4X5dK8Yw32R2GUfjaVVFFpV5uC9jHN5WV+T0ooC/M2g
	 NDq6mOtWRTAak8C/iAbPvEIhM7JpYg9t4Z090uHH0Vxfc8cksVHppBsFqofH193qFEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gurudas.dev;
	spf=pass smtp.mailfrom=gurudas.dev;
	dkim=pass header.d=gurudas.dev header.i=@gurudas.dev header.a=rsa-sha256 header.s=spacemail header.b=NKqJXhMl;
	arc=none smtp.remote-ip=198.54.127.134
Received: from out-2z4y-a134.jellyfish.systems (out-2z4y-a134.jellyfish.systems [198.54.127.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4924F606A31D
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4924F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gurudas.dev header.i=@gurudas.dev header.a=rsa-sha256 header.s=spacemail header.b=NKqJXhMl
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jC5rt5BxRz2x9B;
	Sun, 25 Oct 2026 06:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1792908463;
	bh=lOhXtn8WBrq6j4Lq15neSmhPwS5pSKiwq0yB7vi8J3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKqJXhMlqwydruELa3dYrS+zfikP5NXPNFtD9Ur25pJLF6i4WrwTtn7nJdEDoo7iZ
	 2ymgaFg0Ej5A457+VsV4knUXFO73MDqPOoFboAd29/FgdkAE7CAVxVRBzsaG6Q/7MK
	 KQa29zc38XMNp5emk/WhbBA0gcoKXhOju19kM44C9CxHx/oMaqgmdrGh1QV9mHJJ49
	 Z25coEl6F/+BF8c2TbrS951ZbFcsgj9SKa0V/Hm3QdNwcitW9/aNi6rCXbkLOOnEmU
	 YaTBBwJpX7DoVhm4QgYAbumkv60dklhC37zgl9SQ9KyztPN7UGW3HRQlyGuIhJ31JM
	 QiLID1LRbnOMw==
Date: Sat, 24 Oct 2026 23:07:37 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
Message-ID: <at2cqUU635ALFX29@gurudas.dev>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <atXJp5ct5jANeo0T@gurudas.dev>
 <6f7aa923-e67b-4bd5-bf8b-085623d094c8@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f7aa923-e67b-4bd5-bf8b-085623d094c8@oss.qualcomm.com>
X-Envelope-From: linux@gurudas.dev

On Thu, Oct 22, 2026 at 02:12:50PM +0530, Jishnu Prakash wrote:
> Hi Guru,
> 
> On 10/19/2026 1:11 PM, Guru Das Srinagesh wrote:
> > On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
> >> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> >>
> >> Implement set_mode/get_mode support for PM8010 LDOs using the mode
> >> control and status registers to allow clients to vote for LDO modes.
> >> Mode voting is not supported in the PM8008 LDOs.
> >>
> >> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> >> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
> >> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> >> ---
> >>  drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
> >>  1 file changed, 74 insertions(+), 1 deletion(-)
> > 
> > ...
> > 
> > Patches 2 and 3 both say "Add PM8010 mode support" in their subject lines and edit
> > the same file. Could they either be squashed into one commit or have their subject
> > lines amended appropriately to better reflect the changes they are making?
> > 
> 
> The difference is just one word, patch 2's subject is "Add PM8010 support".

Indeed, sorry for the oversight.

> To distinguish them, I'll update patch 3's subject to "Add mode voting support
> for PM8010", I hope this is fine.

Yes, this is fine by me.
