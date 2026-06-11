Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E48155A5D;
	Thu, 11 Jun 2026 21:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781214554; cv=none; b=lORC3OVqhcxOOE1hbb9RGNyK2LzeA92/cAbMp9p6Djn+8Lmeg7Qw5dft5Wk53XQ1MJHFlPvm3yk92d4JhOHRQ+PNh0ZaNFex88j0Zh00Ok8QJKL6C24edkbac5ovT/bewqI2D6StIVoJzzQWC42f9ysAmH86ZY07ND8fr7Tc1Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781214554; c=relaxed/simple;
	bh=I4URXZTDAX0QX4GCP4W8fFsHSKtaz/NwacgObngP8Ww=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rKJuRkRhHTdkyZ+QcDIyWQTtahPI1TQGLFt6QaT0r563cKPF97eRsqVRwWsq6pdgYK4epgSpdCvYCpVVYa78Qpqgp6ym2WMj2y46fXBx1eSB7uYc+34ystA/r44YgI1TVYcvjIQVe3MpleUEVNVIWgOhonPJZv9PqQaR8bPOxMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RLz0tpBe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EEQlzAKa; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RLz0tpBe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EEQlzAKa"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E75D3EC00D2;
	Thu, 11 Jun 2026 17:49:11 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 11 Jun 2026 17:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781214551;
	 x=1781300951; bh=m3jKUzw1DA57ndb+qyd6HXvDCRAlgjXNw7DsDlmljVM=; b=
	RLz0tpBebAYx/pMK6JZiLzzgyhGrPzg2Jc1hMen653GiUmJXgFb9eP9l1EbT49Ze
	+7B1ykOjEqdqiPnX8iVTFvtUhQLME8KvGh6Lu0LOmL80A+WekV/N/z0KMzAYCSqy
	HPufn7p3rw5VfQ1lssemZiZVm9pW/uUHsWnUFI9OYjFUYLY7h14zvBOAK2MOY5q4
	Hf/TWs981pkgA5EUZLIDxVsyP6IiX1Fo2ZPokY9dqLhHiMcGSCQa4mRoq8+eKQuZ
	su0GfCWGUIobnDyaVceVOkde53FrjkO6tRlfO9jMZArN8fXK8EIAp7d2rr7aQKAb
	8UfgQuoXn+0yOi5KklGsSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781214551; x=
	1781300951; bh=m3jKUzw1DA57ndb+qyd6HXvDCRAlgjXNw7DsDlmljVM=; b=E
	EQlzAKazvoz+UuYDqGVSLlMQopR98anQWtKKX50sQrPShkLHF9l0GEbOcmlv009C
	RDTCxdFU/3e845e7hg+LG3gfOMhEOyEXe1HvEI/bfdA5TwUVflDMRyZmjRhjjdof
	OIiRpTqV3jE7sHnxUWE2V5485Qlg9SIeWB2RQVpAigJeI3XYPKL96z5K+9VS4m92
	F5qmck4bin/i2wAAPnonNYphXiKNknxJ7gBDZJpxaX9gR73tzr5OQw6KZYFNwun8
	e0lSojAZ+3YaxD1IZRvYFz1+QDPA8YdZeAVbG/tyjv5kGMbB+xNrhwCrhyJjihBz
	xEXf5Qlu6vOTHRlC7r/9Q==
X-ME-Sender: <xms:Vy0raqXmdhMDtxNI6Gh4d6BYTIh7eo7DGoHCzQVw521Q6-qch3iz5A>
    <xme:Vy0rahZGg65i9xHnsITqJzXlIuAjO-BpIOUe0a_4va3Z017ync6gS-lmOz5iu5Y9s
    Q6jfVCB6U76n_ab5BrpICWkJvJWTyF_f44iW86o1sg8Bhl5cEDKE0On>
X-ME-Proxy-Cause: dmFkZTEv68Te2GZ7h3XuEhKQ+ysSWDX0V9MP739tmwV8Wek3q0SijvWTpriLzYO2vJXOVF
    utFDHDyukerFQttdEeKhfVppRRlP1wr7wkFnFJTQsR286WQF23XLo9ielto0G4gG30hCk3
    sVpxmjf15NyK0BYGiTvSxGe3GaiP3ZpRF46WstGdSdADrsnLFUkBB6Pka7iealiMU3JR3M
    Nhn5iPMxcUgqZ51gBCk7tDP8B39S7p6REcv6UC7wdrokeCzZLG4bX9VIpssQe31b/qNQps
    Au4pDopG9XLJCEPB8Zb93Cfavf0fvVCa6XRUGoWaKWxK7f324gmVcE+Kh/l7juiAdGWHn3
    mP95WyRpVnpqqJ8/CBFLNtdjnNsBMzFmnEvZEKrpljSdf5paARPX5+X1uGwKvmX4R2lnHn
    bDh98MRs60pulOlDIyDLicrknyJOxEtTYRQVTCBw/dyCxYFjPFdb0UC6VWw6qD8K7QTN+C
    Mo05L2neB8X6Y6Yt9ZY2fp/GkWdUCmTKbjgfQFwcxu9lHog2NIFODzJxr2JcW+9lAVOJhb
    E9eI+yLpd5uzLiJKl/bCM/hNmr8uIw6WdZP973qC0XiTz6NIybb6aerbQpZEhEJAltTbN6
    cb4eeByDtJdfW8uvs7++XWm6g5Qn9YBN2FQe1mLoY2ZYNa/+d9mqD85L2PyQ
X-ME-Proxy: <xmx:Vy0raol0O6XfJ3uurxHVvBLmka-FpHWaUi9z7FmcswiHtmKWm8EZCA>
    <xmx:Vy0rarinFZ-SvZCrsatzAVkBMbyEugwwfTLZ8No-QibZhSpm9V29Mw>
    <xmx:Vy0ravQG_yV4PSP0BhRBIeaW1zB7Quc9FICGJ3CIzLKvNy63IRwjnA>
    <xmx:Vy0ral91RX_beBK_AmMgMXKDStpb9Z_XYYAtFNYKMUWcO1JFsEoRVw>
    <xmx:Vy0ralURSPeGEVJi-EUf0FbfQv1LFIWuUIO5pFai688RsJx_0-Xn4D7r>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6BF81182007E; Thu, 11 Jun 2026 17:49:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A7B3IU8_UIqB
Date: Thu, 11 Jun 2026 23:48:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karthikeyan Mitran" <kmitran@axiado.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Prasad Bolisetty" <pbolisetty@axiado.com>, "Tzu-Hao Wei" <twei@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Harshit Shah" <hshah@axiado.com>
Message-Id: <1dc47bbd-d13f-4e46-9d52-c2c94eba8394@app.fastmail.com>
In-Reply-To: 
 <20260611-maintainers-addition-and-axiado-ax3000_dtsi-update-v6-1-00bdcddc0c29@axiado.com>
References: 
 <20260611-maintainers-addition-and-axiado-ax3000_dtsi-update-v6-1-00bdcddc0c29@axiado.com>
Subject: Re: [PATCH RESEND v6] MAINTAINERS: Add Axiado reviewer and Maintainers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jun 11, 2026, at 22:19, Karthikeyan Mitran wrote:
> From: Prasad Bolisetty <pbolisetty@axiado.com>
>
> Adding 3 new maintainers Prasad,Tzu-Hao, and Karthikeyan
> Removed previous maintainer as the previous maintainer moved from project
>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Acked-by: Harshit Shah <hshah@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
> ---

I've picked up the patch now for 7.2.

For future content that you want to get merged after it
has been reviewed, please make sure to send the patches
or pull requests to soc@lists.linux.dev, and follow the
additional explanations from
Documentation/process/maintainer-soc.rst

Thanks,

     Arnd
