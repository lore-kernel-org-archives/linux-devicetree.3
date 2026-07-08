Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E2D3EB7FB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496778; cv=none; b=tlD5HhKBjXoH1aW4qQwL1wSutFTvqKt+2x+Mft0Drholjp/Z6OXC9QZda5IiQMYYAluz6PFSlQ77Bj5OF/tqzfvw4/89f3Y/tme62uV26nmB0juvXWHyYdRhuveTchGAiuWy8n/6AZVNYZ4AmQO5ZXXO1rIpEtgjhnmtsZiE89k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496778; c=relaxed/simple;
	bh=6AIR5h2TkroJ+Ka1Td8LPQc5yeyxixWnx1KCtoxHlX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NLcINIKCNpxrPZ+YRczWKBSsg6IwPEdVRyHkVkvGmkdo7jXWGmtimCKxTVRW+NPntMwdqi5vkp3TFqRnkiCo+yO9KJxLcvnYZzOIVlY6qS0P/0e7eY3cJ80deeh3bIvGPF/nktZI5O+X6wf7uFdg9s4TN3plIpUpNicmbSvIVVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDC2wZR4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDC2wZR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B867A1F000E9;
	Wed,  8 Jul 2026 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783496770;
	bh=j3BdqeuSEtjSzyh4YHCsbzj6UbeaNzancPx0+E+tb0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WDC2wZR4DmkV7b/54lG9rS08dhKzrg9peqs50lpzmINSdfAiEM8cjFMR8QpyE760T
	 zsE/CWCXBQg5j1VGu/8rqIJCR5buKlTMmD4b+1Cj+ngUJu6+RBAkLQSFJGio2uaIrS
	 ykEBzHbKxTZ+BUBRwv8Z4ATtpxt7X3IWGZKVgwydBn/S0nkjIaN4mHb3kFKmwkKoH2
	 wuZ2EXAqvd5aNkeRPv3gBt0zq742hQIiM2Hin7u2sZfanKTDcVOU6nmxnYbcL8OM1g
	 5BeAIx0Qf88g9bN6rieK4FC7eGFrstWxXPAQs+pwfYnjI4wFF0hkY2Db3NASnErcLY
	 hrAk7QzVvP2Mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 5/6] firmware/psci: Add EFI runtime conduit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-efi-psci-v1-5-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <20260708-efi-psci-v1-5-9efb3abf0e4c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:46:09 +0000
Message-Id: <20260708074609.B867A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] State leak and memory corruption during CPU suspend in the EFI=
 PSCI conduit
- [High] Early PSCI call to set OSI mode fails and triggers WARN_ON_ONCE
--

--- Patch [5]: [PATCH RFC 5/6] firmware/psci: Add EFI runtime conduit ---
commit faf63cfc78f9ee926dc0d221e33d99624e0fb74d
Author: Sven Peter <sven@kernel.org>

firmware/psci: Add EFI runtime conduit

This patch adds a new "efi" conduit for PSCI firmware calls, routing them
through an EFI runtime service. This is needed for Apple Silicon where the
kernel shares the highest exception level with the firmware. Early CPU
bring-up queries are answered directly from a firmware-provided table before
EFI runtime services are available.

> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb23a3..af022bf2cb9f2 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -131,6 +133,63 @@ __invoke_psci_fn_smc(unsigned long function_id,
[ ... ]
> +static unsigned long __invoke_psci_fn_efi(unsigned long function_id,
> +					  unsigned long arg0,
> +					  unsigned long arg1,
> +					  unsigned long arg2)
> +{
> +	u32 fn;
> +
> +	/* These are called before EFI runtime services are available */
> +	switch (function_id) {
> +	case PSCI_0_2_FN_PSCI_VERSION:
> +		return efi_psci.version;
> +	case PSCI_0_2_FN_MIGRATE_INFO_TYPE:
> +		return PSCI_0_2_TOS_MP;
> +	case PSCI_1_0_FN_PSCI_FEATURES:
> +		if (!efi_psci_fn_valid(arg0))
> +			return PSCI_RET_NOT_SUPPORTED;
> +		fn =3D arg0 & 0xff;
> +		if (fn >=3D efi_psci.num_features || fn >=3D EFI_PSCI_MAX_FN)
> +			return PSCI_RET_NOT_SUPPORTED;
> +		return efi_psci.features[fn];
> +	}
> +
> +	if (!efi_psci_fn_valid(function_id))
> +		return PSCI_RET_NOT_SUPPORTED;
> +
> +	if (WARN_ON_ONCE(!efi_psci.psci_handler))
> +		return PSCI_RET_NOT_SUPPORTED;
> +	if (WARN_ON_ONCE(!efi_enabled(EFI_RUNTIME_SERVICES)))
> +		return PSCI_RET_NOT_SUPPORTED;

[Severity: High]
Does this early call switch statement need to handle
PSCI_1_0_FN_SET_SUSPEND_MODE?

During early boot, psci_1_0_init() can invoke psci_set_osi_mode(false), whi=
ch
calls PSCI_1_0_FN_SET_SUSPEND_MODE:

setup_arch() -> psci_dt_init() -> psci_1_0_init()
    psci_set_osi_mode(false);

Since this happens before efi_enabled(EFI_RUNTIME_SERVICES) is true, will t=
his
fall through and trigger the WARN_ON_ONCE above, failing to set the suspend
mode?

> +
> +	return arm64_efi_psci_call(function_id, arg0, arg1, arg2);
> +}

[Severity: Critical]
Is it safe to call arm64_efi_psci_call() during CPU suspend?

When cpu_suspend() is called to enter a deep sleep state, it eventually inv=
okes
arm64_efi_psci_call(), which modifies thread_info state:

arch/arm64/kernel/efi.c:arm64_efi_psci_call() {
	...
	efi_virtmap_load();
	uaccess_ttbr0_enable();
	post_ttbr_update_workaround();

	ret =3D efi_psci.psci_handler(function_id, arg0, arg1, arg2);
	...
}

If the CPU powers down, execution doesn't return directly from the EFI hand=
ler.
Instead, it resumes at the hardware reset vector, calls cpu_resume(), resto=
res
context, and returns to the caller of cpu_suspend().

Because this bypasses the cleanup in arm64_efi_psci_call() (like
efi_virtmap_unload()), could this leak the preempt_count increment and leave
thread_info->ttbr0 pointing to the EFI runtime page tables when returning to
userspace?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-efi-psci-v=
1-0-9efb3abf0e4c@kernel.org?part=3D5
