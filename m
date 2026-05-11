Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C601E9B3D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532472; cv=none; b=Hne/gSbZO7FcH8QU+rfJrwnMv46iiecivM7b1vC8vISN6JRwIctxYwQsxErNtKWb36PyY9UrEdPftopBqRyYvAfx3j/GIQNVb8gLs/uaopTservdQhqH0xxfGnGh37ry7TgIWY9VqX3q/06RSSsAd6e6xSAfyjGmLjV2KrNWEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532472; c=relaxed/simple;
	bh=HOOstmbO935LIcdIMmBMDWrwbQ5zoNTtFohMBkVFvEE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mB+DsasU7Cz/8Pem1/fZV1j01e3tUTU6DWLSDWeq1pGgcCBhD6Pna/L4SQzlzYfNYL9UIQu3HV3ddnZ2b9m6C6TBIuFHyCYZFYsod4n0Tkjjcz+2woRwKUHnTT/j+JZzEivT0H/tbec2QTA1Gys/Xq/FTQivE3Zd3w19FkNJskI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPA4Ra9Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPA4Ra9Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DFCC2BCB0;
	Mon, 11 May 2026 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778532471;
	bh=HOOstmbO935LIcdIMmBMDWrwbQ5zoNTtFohMBkVFvEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IPA4Ra9YPlGvv0/laTnUhrem5ZL1rrB2JX/J9z1OPWMlBdq3QDyLGY9cAv93NlCP2
	 2qnL/6LAXNaBxXw/fNja7KbB1paz82UDE48gFmptXk9CkiPYJMPh++YlCjyuboIf8C
	 crAZ5sPJSMF960vVobDlmoQ/+KTApLd4yW5GIjBkw43tzlRQuEXiJcmllVAbqjwA0m
	 6knx3by8LJ6deSN+pYcB0xevAnz35Oca2NFMULRTJGOOYnjyPmumLgNRknfAlXClZb
	 AUpykO+3cNVlyLgoGSbGnD/XdDlYGKJbfymZvRn4wAHXzHE5UOcBmqH4f9ktayuhAx
	 swgO4g3MI2JTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logs when reading values
Reply-To: sashiko@lists.linux.dev
To: "Antony Kurniawan Soemardi" <linux@smankusors.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-pm8xxx-xoadc-label-v6-3-49700fd03005@smankusors.com>
References: <20260510-pm8xxx-xoadc-label-v6-3-49700fd03005@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 20:47:50 +0000
Message-Id: <20260511204751.61DFCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The timeout value passed to wait_for_completion_timeout() is in mi=
croseconds but the function expects jiffies, resulting in a massively infla=
ted wait time.
- [High] The timeout error path in pm8xxx_read_channel_rsv() fails to disab=
le the ADC arbiter, which can cause delayed interrupts to corrupt subsequen=
t readings.
- [Medium] Removing the error log for -ETIMEDOUT hides legitimate hardware =
and driver failures from dmesg.
--

commit 24271541e5551b415dc4bb4616582d63863e0096
Author: Antony Kurniawan Soemardi <linux@smankusors.com>

iio: adc: qcom-pm8xxx-xoadc: remove redundant error logs when reading values

This commit drops dev_err() logging for -EINVAL and -ETIMEDOUT cases and re=
lies
on return values to report errors, reducing unnecessary log noise.

> diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-p=
m8xxx-xoadc.c
> index 31f88cf7f7f18..282a67b46a5eb 100644
> --- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> +++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> @@ -535,10 +535,7 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoa=
dc *adc,
>  		goto unlock;
> =20
>  	/* Next the interrupt occurs */
> -	ret =3D wait_for_completion_timeout(&adc->complete,
> -					  VADC_CONV_TIME_MAX_US);
> -	if (!ret) {
> -		dev_err(adc->dev, "conversion timed out\n");
> +	if (!wait_for_completion_timeout(&adc->complete, VADC_CONV_TIME_MAX_US)=
) {

This is a pre-existing issue, but wait_for_completion_timeout() expects a
timeout in jiffies. Does passing VADC_CONV_TIME_MAX_US directly result in a
massively inflated wait time instead of the intended microseconds?

Also, while removing the log for an invalid channel addresses user input
noise, does completely suppressing the -ETIMEDOUT error hide legitimate
hardware or interrupt failures from dmesg? Would dev_err_ratelimited() be a
better alternative here?

>  		ret =3D -ETIMEDOUT;
>  		goto unlock;

This is also a pre-existing issue, but if the timeout occurs and the code
jumps directly to the unlock label, it bypasses turning off the ADC arbiter
which is handled later in the function:

pm8xxx_read_channel_rsv() {
    ...
    /* Turn off the ADC by setting the arbiter to 0 twice */
    ret =3D regmap_write(adc->map, ADC_ARB_USRP_CNTRL, 0);
    if (ret)
        goto unlock;
    ...
}

Does jumping to unlock leave the hardware running with its interrupt armed,
potentially causing a delayed interrupt to fire and corrupt a subsequent
reading?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-pm8xxx-xoa=
dc-label-v6-0-49700fd03005@smankusors.com?part=3D3
