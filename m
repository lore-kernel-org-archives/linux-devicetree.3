Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784074E1408
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450839; cv=none; b=DyzkJJ4USaWLzTFLhIkc3/GfhkgaCgnLgnu4GChE7hqK1LdLLr4onrjzqbzAuq+Ua0o2s1tSkkE59Y7AFRp1+5SJkmsh/zjEnSBhle/8VDsq93ifpFlE1XdjWK6oKfPuKoADj94Zia6CTeSKR6boCpMEfuwLraQzEnrIMKjCPk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450839; c=relaxed/simple;
	bh=0hguMwtnR9d2M/DyIipVrWyM2z57mQu+BY3qOefLb/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SPsuLnSMM7n82/UYSC5qL+poeIT0kOwWFTArJJ7Yrg4BlZm/8lNFB81bG89qDc/GObJzG4Zz/vtPT0aj4lEFcXje8n3q0dHT8RyDEx44XMxgUk6NODxUjjCLVIp3lHbi2Mib1bv4jVnbSEh5PpUz9CzJC9xRW40GJbIfIigcd+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTHrT1Pk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTHrT1Pk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CB61F000E9;
	Thu,  3 Sep 2026 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788450838;
	bh=dohr8Fu6mQO4OkEcpB+KgEEIRybvM0OAqar0j5HYfeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nTHrT1PkryH9M+q3aEI5hXiyJ3h+xcnwr8seCk9q7kUlYAMprqasIsFrH9yRZU7Z2
	 B7h4zvdY1vqFhDuotV19fSaKeWdDBI5rWHzFrGMTfiOHZcqL+UodR0EXpY5XT2VLJb
	 IB/J2Y1AkaDwasWN0sah8LAiD8Ica9rDB0zeQlAnuqflyzhpABdkxpTE7dZRMONgfE
	 NKp+0D3k7QT31EshdtCviYXGj5rjLXfZKT5ZrHKn2xHNQubMIf50OP08zcimOVV9rP
	 VhPcWzo0pDDiQmz0SbA7lAE5Z6dyQUuu8MTQXhht1M7ik2DONUCSV/vvujseVK8m7s
	 WWYtEwNetUPfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] usb: dwc3: qcom: re-enable wakeup interrupts on
 failed resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faisal Hassan" <faisal.hassan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903153827.3463313-2-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-2-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:53:57 +0000
Message-Id: <20260903155358.04CB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Re-enabling wakeup interrupts on a failed resume path causes an un=
recoverable interrupt storm.

Pre-existing issues:
- [High] Using a read-modify-write operation (`dwc3_qcom_setbits`) to clear=
 a Write-1-to-Clear (W1C) interrupt status register unintentionally clears =
all other pending events.
--

commit 04b120125f0ae65d0e301d68751f219b8e9f86e0
Author: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

usb: dwc3: qcom: re-enable wakeup interrupts on failed resume

This commit modifies dwc3_qcom_resume() to handle failures from
clk_bulk_prepare_enable(). On failure, it jumps to a new enable_irq label
that re-enables wakeup interrupts if they were disabled earlier.

>     dwc3_qcom_resume() disables wakeup interrupts before re-enabling
>     clocks, then re-enables them again once resume completes. If
>     clk_bulk_prepare_enable() fails partway through, the function
>     returns early without re-enabling the interrupts that were just
>     disabled, leaving host-mode wakeup interrupts masked after a
>     failed resume.
>    =20
>     Jump to a common cleanup path that re-enables the interrupts
>     before returning the error, mirroring the success path.

[Severity: High]
Does the success path actually re-enable the interrupts? Looking at
dwc3_qcom_resume(), the success path just returns 0 without re-enabling the=
m,
as wakeup interrupts are meant to be active only while the device is suspen=
ded.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56b..49698a31b2f41 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -382,7 +382,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, b=
ool wakeup)
> =20
>  	ret =3D clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>  	if (ret < 0)
> -		return ret;
> +		goto enable_irq;

[Severity: High]
If we jump to enable_irq here, we bypass clearing the hardware events in
pwr_evnt_irq_stat_reg (which happens later in this function). Since clearing
the register requires the clocks to be enabled, jumping to the error path m=
eans
the pending hardware event is never cleared.

Will re-enabling the interrupt line below without clearing this hardware ev=
ent
cause the interrupt to remain asserted? Since qcom_dwc3_resume_irq() returns
IRQ_HANDLED, this could cause the kernel IRQ subsystem to unmask the line,
resulting in an immediate interrupt storm that hangs the CPU.

[ ... ]

> @@ -398,6 +398,16 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, =
bool wakeup)
>  	qcom->is_suspended =3D false;
> =20
>  	return 0;
> +
> +enable_irq:
> +	/*
> +	 * Re-enable interrupts if they were disabled earlier, so a failed
> +	 * resume doesn't leave wakeup interrupts masked.
> +	 */
> +	if (dwc3_qcom_is_host(qcom) && wakeup)
> +		dwc3_qcom_enable_interrupts(qcom);

[Severity: High]
This is a pre-existing issue, but earlier in dwc3_qcom_resume() the code cl=
ears
L2-related events using dwc3_qcom_setbits():

    for (i =3D 0; i < qcom->num_ports; i++) {
        dwc3_qcom_setbits(qcom->qscratch_base,
                  pwr_evnt_irq_stat_reg[i],
                  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
    }

Since pwr_evnt_irq_stat_reg is a Write-1-to-Clear (W1C) register, doesn't u=
sing
a read-modify-write operation like dwc3_qcom_setbits() read all currently
pending interrupts as '1's and write them back as '1's?

Could this unintentionally acknowledge and clear every other unrelated pend=
ing
event in the register, causing missed hardware events and stuck states?

> +
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903153827.3463=
313-1-faisal.hassan@oss.qualcomm.com?part=3D1
