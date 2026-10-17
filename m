Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24B83AFCF0
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256873; cv=none; b=tUlNQGeliX1OQCEZbLolms4jSbvu6/nSfYbTcYhAzVVrOSzVRnMTzyemW6hbONfAvYtCRGclm4AU4EPHnkVlve22N9F0JB17egpCqAdNoyl5zPnSijgNYxxOOWB/6pcxfFuZJs0BsSO1ABtuVXYrGfXF84BVqjYSYlke3/BW6b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256873; c=relaxed/simple;
	bh=WW8xCJD7nNdeCbefvPC+6aWoxmXajHGcmjfMPTOiVDw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FHViDewoWAZ1kKcKzrSMDAwdQQOK9n/zXRPJiJUTABoVciFRrRyzQVNyX5LElAfw3Ps7ai1DmjnCxtQZuGcrv0Xgv/3Hn8mUwDrIniJad6kOamPfbE7l6EbjXHal3byvpnULhvUtD/3/EmrVMykjcM3r1ZMEASAXAa6+y54uAaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=du/RBsXB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="du/RBsXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546961F000C4;
	Sat, 17 Oct 2026 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792256871;
	bh=PZQegev2rXX+/QVIhKzOPACB8SUl2DoDDA9DfULIor8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=du/RBsXBEgHhappW0Ar0rnQD567UVIr5FeZ0BlULoRUR9HU5MZP+TBkk17V8CKhPk
	 J0ZTFSuGyOn98qIHf/e/jES2VISihq5HLkl3344eHi2VQFkM8g/Q7i4dX1tCym3bpy
	 PB5+rBbxlBD8XpGXpoy/CMCSfIqk5hL8onoSU95FG2SUEAL6h6uPzh5oVSfAV4fSYk
	 FKYpB8CIvqXchpbhZQL1v0vYbQIWe1l04VZqkRFk5IJHfCvV1X9B/0GhZBUJNGgsvq
	 3KCt++6Xa6ab7nu87KqDMzCfY09HiBKWnTKGQLomdCk8lrXtYobAmtQnW1YUf/pFhI
	 +J61kSmkZiOXg==
Message-ID: <sashiko-outbox-175687@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] cpuidle: psci: Allow skipping the suspend mode
 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Reza Kurniawan" <imkyufie@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-psci-fix-v1-2-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
 <20261017-psci-fix-v1-2-dedae27e4a31@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 17:07:50 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] cpuidle: psci: skip-suspend-mode-switch ignored in psci_1_0_init=
()
--

commit ee7d5d7e060784375912b91f91b344ad1eecb0a8
Author: Alejandro Tafalla <atafalla@dnyon.com>

cpuidle: psci: Allow skipping the suspend mode switch

This commit adds support for the skip-suspend-mode-switch property in
psci_cpuidle_domain_probe() to skip calling psci_set_osi_mode() on
platforms whose firmware reports OSI mode support but rejects
PSCI_SET_SUSPEND_MODE calls.

> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index 5722365b943ea..cc9f14769ba20 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platfor=
m_device *pdev)
>  	if (ret)
>  		goto remove_pd;
> =20
> -	/* let's try to enable OSI. */
> -	ret =3D psci_set_osi_mode(use_osi);
> -	if (ret)
> -		goto remove_pd;
> +	if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
> +		pr_info("Initialized CPU PM domain topology, keeping firmware-set mode=
\n");
> +	} else {
> +		ret =3D psci_set_osi_mode(use_osi);

[Severity: Medium]
Should psci_1_0_init() in drivers/firmware/psci/psci.c also check the
skip-suspend-mode-switch property?

During early PSCI initialization, psci_dt_init() -> psci_1_0_init() runs
on the same /psci device_node and unconditionally calls
psci_set_osi_mode(false) when psci_has_osi_support() is true:

drivers/firmware/psci/psci.c:psci_1_0_init() {
    ...
	if (psci_has_osi_support()) {
		pr_info("OSI mode supported.\n");

		/* Default to PC mode. */
		psci_set_osi_mode(false);
	}
    ...
}

Because that call is not gated on skip-suspend-mode-switch, the kernel
still issues PSCI_1_0_FN_SET_SUSPEND_MODE at boot and logs a FW_BUG
message in psci_set_osi_mode() when the firmware rejects the switch to PC
mode.

Furthermore, if a firmware with skip-suspend-mode-switch boots in OSI mode
and accepts the switch to PC mode in psci_1_0_init(), wouldn't
psci_cpuidle_domain_probe() then initialize the CPU PM domains with
use_osi =3D psci_has_osi_support() (true) and skip switching back to OSI
mode, leaving the kernel in OSI mode while the firmware was switched to PC
mode?

> +		if (ret)
> +			goto remove_pd;
> +
> +		pr_info("Initialized CPU PM domain topology using %s mode\n",
> +			use_osi ? "OSI" : "PC");
> +	}
> =20
> -	pr_info("Initialized CPU PM domain topology using %s mode\n",
> -		use_osi ? "OSI" : "PC");
>  	return 0;
> =20
>  remove_pd:

iala

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-psci-fix-v=
1-0-dedae27e4a31@gmail.com?part=3D2
