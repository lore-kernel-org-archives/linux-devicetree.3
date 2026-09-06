Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088A31E857
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 04:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670542; cv=none; b=ORmrC2vho73v0LwS50Z+O7Sb44La+F8QRXxKvm3Be1xu6B5ggeMwpKHX85W1PgBKULjk5sq89aWEci9Tyj5LOjIyhkJHZ+nCxzIIfakh+4YqWYbmP9sua5NZTHwZt4DWw3RY9Dr4fQrvKOvae1LdDeckw6nGcGYJZB9z1ZyAjNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670542; c=relaxed/simple;
	bh=s/i6eR5I0CUFoDoXKWcAyDhwgx35zRvVSlRRthKyp4Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DIS6MvLwVawhCF1knrKeajVIKx1wfpIHUzuEoY6cQDKAn2kE+xGtQG1qovkeLkUJTp97zEGa1VgwdxaXoDAyp0v6zybMBrIfHQwkmkiJVnL2JP+RjssWp3gCCo0lbNjhcEFYmzfd/Tb2wYllVDorU298TttVM2Z97bnnr9W8H8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Upc2WeFg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Upc2WeFg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F42F1F00A3A;
	Sun,  6 Sep 2026 04:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788670540;
	bh=HFz2DVASyfsIgFOjhAHbiTx0d0KXQOn7lz1AUQAKMwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Upc2WeFgd+D9heQOd/Q5k23LW6gWAoXHnvMejo8tY6mHrU7pLXEhgstcXv0OXTylF
	 4A/Mv/Y+HbUqTVHTZspJui2jwotYiw8Otjfy+qf4MZHaSYA6Sd27pQl0WfNVWLJ0s5
	 VDkoLyoSww04PXOaG2y7e3iLK9T8dyjDWlLydtWdXXgGR8qUvYf2pvTMpRfJhttF6R
	 PIfQH8X8GGSSWUys1rr/z7V1cI2qeREPUdT5m0Wi5hSjWC7En9ATPGoRo1Zx5UG3te
	 3Q+VyMlPgpPFeJnf3ln6JHOI36sK8R/6tkHQlKQuyctByySvzDNt6wUAplzNN6sl+o
	 +CJsnlTkK8/zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/10] usb: dwc3: core: Allow glue layer to pass
 reference clock rate
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-ipq-flatten-usb-v3-1-13e4e0f63123@outlook.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-1-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 04:55:40 +0000
Message-Id: <20260906045540.7F42F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect precedence in `dwc3_ref_clk_period` causes the depreca=
ted `snps,ref-clock-period-ns` DT property to override the accurate hardwar=
e clock rate.
--

commit bfd0f3ac4b25de50cc391001782d48a93da996fb
Author: George Moussalem <george.moussalem@outlook.com>

usb: dwc3: core: Allow glue layer to pass reference clock rate

This commit allows the glue layer to pass the reference clock rate directly
to the DWC3 core driver. This enables hardware using the flattened snsp-dwc3
model to accurately calculate the period and frame length adjustment without
relying on the default reference clock.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c595..6ff0e4822b493 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -420,6 +420,9 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
>  	} else if (dwc->ref_clk_per) {
>  		period =3D dwc->ref_clk_per;
>  		rate =3D NSEC_PER_SEC / period;
> +	} else if (dwc->ref_clk_rate) {
> +		rate =3D dwc->ref_clk_rate;
> +		period =3D NSEC_PER_SEC / rate;
>  	} else {
>  		return;
>  	}

[Severity: Medium]
Will this evaluation order cause issues for systems booting with a legacy
device tree?

If an older device tree defines the deprecated snps,ref-clock-period-ns
property, dwc->ref_clk_per is populated. In the flattened model, the glue
driver sets ignore_clocks_and_resets =3D true, which leaves dwc->ref_clk as
NULL.

Because dwc->ref_clk is NULL, the execution will fall into the
else if (dwc->ref_clk_per) block. This uses the deprecated and inaccurate
period-derived rate, completely bypassing the exact hardware clock rate now
provided via dwc->ref_clk_rate.

Should dwc->ref_clk_rate take precedence over the deprecated and less
accurate dwc->ref_clk_per?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-ipq-flatte=
n-usb-v3-0-13e4e0f63123@outlook.com?part=3D1
