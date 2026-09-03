Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA24DC550
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452029; cv=none; b=qJkr69UrKzG8P5jzuNkPCz8QDj63axgqHrNOJt6uyXigm1Apc5b7Aj+LdDQM9+e/vfCCi8w9MnttKM2B7yNfUAGZHi1WCASgeq9K+6dyFoCf2MKNxjT64xuX46kAA3AbycdeQ4msGdGUgBYBVF5s/Jiz87hBEKbzckmrv31fgtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452029; c=relaxed/simple;
	bh=k6nv1+TDWkGgTQ3foO5watBZrScgWOacTtkqKCbecUs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ihk17JjBFP+i5z8cJ2+l0cSYn0IPNRLQEHuREKazhGgZyoZB0WOGe8Objr1v643Inw4P8fn4wmGw/eQOM+7SbTres9cfOfLpg/WL6V03oxLWHQauXt4dTdcclQ25VFQbZ2KgoZ3bjuF+nGf1Xl88hpZpZ586JRwYb/UBbzY2C0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egiCh1Ko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egiCh1Ko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD92A1F00A3E;
	Thu,  3 Sep 2026 16:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452028;
	bh=Vc6ksC9ScYvuwJT/rjp9H29aXzEZ8TLkmD6r+u8qYho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=egiCh1Ko+QziegiOFVUEkUDVNMhIAQ0+zLvwprn3sxNLug3Bf0TcltdzY579ipgRR
	 2ZnQKlkdbhkTcta34mYY7MfLAjzjHXjAcB1ngBaSBaR7EUZCYK7sXQrP0tqz47466K
	 knfwMnfmV1l6ZERvlHlbUsqMs+o8L5D+qgryeSGRZHsimY9v4kYKuKr3pO6DywXcBa
	 YnD75xSsROk2Ye/eROBMdfQ5tcJATxMMUGTUztFV0DHcwfqjaOM1LyFeE8+P/QQHks
	 sqVYP/uMVGFoHlrD+yAImkX8ckZt9I+eDSbIYAnEXJKiAQI+h86LhRLXewseewYxHD
	 H5pX/4viPlBQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] usb: dwc3: qcom: Support broken suspend for
 SA8255P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faisal Hassan" <faisal.hassan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903153827.3463313-7-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-7-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 16:13:47 +0000
Message-Id: <20260903161347.DD92A1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Qscratch programming is not restored during system resume if devic=
e wakeup is enabled, leaving the controller broken.
- [High] Flawed boolean logic enables device-mode VBUS override during host=
 mode operations.
--

commit 62abc776630f8d66e2fc8e0f35ca6edc55d04a4d
Author: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

usb: dwc3: qcom: Support broken suspend for SA8255P

This commit addresses Qscratch programming loss on SA8255P during APPS Susp=
end
by restoring UTMI clock selection and VBUS valid signals after system resum=
e.
It also ensures the controller is properly reset from the POR state.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 6d25f81800a7f..e58a9ca23b009 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c

[ ... ]

> @@ -388,6 +416,28 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, =
pm_message_t msg)
>  	if (!qcom->is_suspended)
>  		return 0;
> =20
> +	if (qcom->broken_suspend && !PMSG_IS_AUTO(msg)) {
> +		/*
> +		 * Only system suspend fully powers off the controller and
> +		 * puts it into POR state. Runtime suspend does not, so skip
> +		 * the reset on runtime resume to avoid needlessly clobbering
> +		 * state that was never lost.
> +		 */
> +		ret =3D reset_control_assert(qcom->resets);

[Severity: High]
Does this unconditionally reset the controller during system resume,
destroying Qscratch state regardless of whether device wakeup is enabled?

[ ... ]

> @@ -415,6 +465,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, =
pm_message_t msg)
>  				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>  	}
> =20
> +	if (qcom->broken_suspend) {
> +		if (!wakeup && qcom->ignore_pipe_clk)
> +			dwc3_qcom_select_utmi_clk(qcom);

[Severity: High]
Could this logic improperly skip required Qscratch reprogramming after the
controller reset if wakeup is enabled? Since the reset wiped the state abov=
e,
the clock configuration shouldn't be skipped when wakeup is true, as it
breaks USB operations on resume.

> +		/* Make sure vbus valid is set for PHYs after PM resume */
> +		if (!(dwc3_qcom_is_host(qcom) && wakeup))
> +			dwc3_qcom_vbus_override_enable(qcom, true);

[Severity: High]
Will this boolean logic accidentally enable device-mode VBUS override during
host mode operations? By De Morgan's laws, if dwc3_qcom_is_host() is true
and wakeup is false, this evaluates to true. Putting the PHY into device
mode VBUS override disrupts normal host mode operations.

> +	}
> +
>  	qcom->is_suspended =3D false;
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903153827.3463=
313-1-faisal.hassan@oss.qualcomm.com?part=3D6
