Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D9714883F
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019114; cv=none; b=NDpHT1yo7MM4UOWDgxJPzZi1Gw5YLidFGhLjn70P1y7CDbSF3GxynQyNVH0UvOmNXEDKUjOiv7W0adKoAG1IdNOs/ICMe4BaWAepttZAnUfNON/cfQcLwZut8LBYLhW4YL/xG+6aVGn7zfSTEmA1D/nfpH+aH89+zWJPlDQqFDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019114; c=relaxed/simple;
	bh=X09O51d6zYV+byPTmo2J5X6BBZkOeutokPTDkk10BJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WeyTSCNXkzvG1lArkL6vXw4FEwAtlP3wWX2J/F7waNWpXlDQ2pobzHN+JOf/Q8ZuN7ZqCQ1SbIB0Ul3oEfE9SIU6O3B07l/GmhJ9RZRsJl5O+eBGyPGtVXZ+VejPHkSVP/x+pT8oRaur5SLJ+7qMjwYx0Q8itUvcDmX82bGqOyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISvnw3YD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISvnw3YD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E9B1F0089B;
	Sat,  3 Oct 2026 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791019113;
	bh=0gHzKlr+JRtSfZ6olTbs5i+9Rkgo/wToShRtzGa2Crk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ISvnw3YDt5O3Ghb91cx5TpmXKxLfmWTHCQP5hlXoH575w5A0pMFn+zAvbKsYyBNj+
	 En9iRY5qGntLRyRmTpHDj1DHURBU5NdvccIkPxP3E+AwfLC6tXJ1gN9NEkCRkIih1Q
	 /CVSMJUiNtvQQ/AQ8z45vm8QaiZqrZ4CxSGoF1qqMR3StzIrhQaESUJ0fWo+aPzBOq
	 qylNtzsU8la/mY3sbPLPuudlcL1YZiGzyFrQQHrBvaS6P3H1jLoVgz1x9uGZIhyWbJ
	 TsZzdB3m83YNX9cgJosGaCH0mkjA+EY3Fdr2kOz5xKxa7zOiuyP0sljR7RW+SVgPsf
	 6/AJlS/AKYQ8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 06/11] media: qcom: camss: csid: Add support for
 CSID 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, vkoul@kernel.org
In-Reply-To: <20261003-kaanapali-camss-v18-6-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-6-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 09:18:32 +0000
Message-Id: <20261003091832.92E9B1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Data Race / Unprotected State Modification
--

commit e1475151b2b7806091d8fbadf7603ba11320d02e
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 1080

Add support for the CSID 1080 hardware found on Kaanapali SoC.
Introduce CSID 1080 hardware resource descriptions and implement the
hardware-specific register programming, reset sequence, and BUF_DONE
interrupt handling. CSID 1080 splits RUP and AUP updates into separate
registers and uses a SET register to commit the updates.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
> new file mode 100644
> index 0000000000000..46e443e05195a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c

[ ... ]

> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +	csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}

[Severity: Low]
Can these un-synchronized read-modify-write operations race between hardirq
and process contexts?

When starting multiple streams in csid_configure_stream(), RDI 0 could
complete a frame and trigger the BUF_DONE interrupt while RDI 1 is still be=
ing
configured. This would cause csid_isr() to call __csid_aup_rup_clear()
concurrently with __csid_aup_update() or __csid_reg_update() executing in
process context.

Since these updates to csid->aup_update and csid->rup_update are unprotecte=
d,
a concurrent modification might cause bit updates to be lost. While this mi=
ght
only lead to a harmless redundant trigger or prevent a redundant write, it =
is
undefined behavior in C and can trigger KCSAN warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003-kaanapali-=
camss-v18-0-87ba4ebe0db1@oss.qualcomm.com?part=3D6
