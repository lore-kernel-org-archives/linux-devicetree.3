Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D672848BA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778800784; cv=none; b=PA2M+hdRR56/t5CcyM/k4fHj0uPCFPrrqyExg9NniSy8gdXgox2E3HGwGZq0CNKA3K6izWaTZ+E56FcXxDdh4I09B3V/D2XIXy+zawLTDC0C3LO0spOFbl6TWz3CtCPwe8LPW2DQu2stbq1/fGRoFV+rEUCefZvNkpqxR2tmYTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778800784; c=relaxed/simple;
	bh=v/+QlnGyscBj+KE6+9u/TF14t7e4JeLsgcbuglvErMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jKiFF2kVVFhAEdiupgu+nb4b3S32gVkifGpoMcG6wteSctTGH/l+RDG0YjsxZ9VLrPT1QhN+h7Pv4tGhJI8knoVJ01+ZayRUL5wL0txv6IFu/h/yFMjo1O+2VsezLMJxfymHRLy5K7GpITaNVt9/NlyZB+8SEKSrVYOBHRbpNdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9DwBho2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9DwBho2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B30C2BCB3;
	Thu, 14 May 2026 23:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778800783;
	bh=v/+QlnGyscBj+KE6+9u/TF14t7e4JeLsgcbuglvErMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=u9DwBho2AcyTsJd1GB+nqMOEQIbIifEFF/IRSi4xo8hOEj41JjXk1qYVKwdb8lDo8
	 vOwUronPRQeB5bg/ryo186R4vlHaJG+9nTg+ynXxnCeR1z15VS8C6EGOG0KGhKK5n7
	 KKL3L9a73s5NwzRiLR4BkQgNVX9eKYzQFZoDV3oV6PggCfds3h4h7QoBYi+YPIM3bg
	 twn3kQ1aIQ6lpIP1G/NTzoqNQG1KjCwlvA0Qg0m7M2USU89YmOJdgRD4MlzikVP6kl
	 kT4UiwIlJiQaynCvO36iSmokIn0Sq4Qu/qHKGj5oA82x3Uci8Ve+XUl9qka8hjA8H4
	 8So+tk9qLzL0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 23:19:42 +0000
Message-Id: <20260514231943.93B30C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-After-Free due to incorrect lifecycle management of non-OF fwn=
odes using devm_add_action.
--

commit 346fbcb3dbf6a1ca28eec9135059c21e18423182
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

mfd: core: Add firmware-node support to MFD cells

This commit extends struct mfd_cell with a callback to allow drivers to
provide an explicit firmware node. The node is assigned to the MFD child
device during registration if one is not assigned by other matching
mechanisms.

> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c

[ ... ]

> @@ -224,6 +231,29 @@ static int mfd_add_device(struct device *parent, int=
 id,

[ ... ]

> +			/*
> +			 * platform_device_release() drops only of_node refs.
> +			 * Track non-OF fwnodes explicitly so they are put on
> +			 * all teardown paths.
> +			 */
> +			if (!to_of_node(fwnode)) {
> +				ret =3D devm_add_action(&pdev->dev,
> +						      mfd_child_fwnode_put,
> +						      fwnode);

Is it safe to tie the fwnode lifetime to the driver bind and unbind
lifecycle using devm_add_action() here?

Since devres managed resources are released when a driver unbinds, if a
driver binds to this MFD child device and is later unbound via sysfs,
device_unbind_cleanup() will call devres_release_all(). This triggers
mfd_child_fwnode_put() and drops the reference, freeing the underlying memo=
ry
while the device still has its fwnode pointer populated.

Could a subsequent driver rebind trigger a use-after-free when accessing
the dropped fwnode?

Also, during device removal, device_del() calls devres_release_all() before
emitting the KOBJ_REMOVE uevent. The platform bus uevent handler then acces=
ses
the fwnode:

device_del()
   devres_release_all(dev)
   kobject_uevent(&dev->kobj, KOBJ_REMOVE)
      platform_uevent()
         acpi_device_uevent_modalias()
            ACPI_COMPANION(dev)

Will evaluating ACPI_COMPANION() access dev->fwnode after it has already
been freed by devres_release_all(), causing a use-after-free during
standard device teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-arm-psci-s=
ystem_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com?part=3D8
