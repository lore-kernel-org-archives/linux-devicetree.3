Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D0471264
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657087; cv=none; b=O+tpA/i8CLZTDnmAb1WWEF+zDdB0Wv7B5YrMGVjcuvClJuuHQ3QbIKOH/TKVgH9mBdFPoDPxsuKgqAUy/7Y5v1WDsnH8HXNZ6jGB4rjMQOwoaPAhDY6K00nraR5tUaCx1SFZzx4Z4M4ZOjUKx1y9ziJcQ/843L7ccJ2G31hptPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657087; c=relaxed/simple;
	bh=8HDBdCQhalR9k/pmHGLfQw3fOqFR3/PHdO9qq1CqRNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WSJl31H8dN79WGvgxme6q7T0dkaTbTqPIisYf1VeoDmEMzzcH1/z9VW//gl8J4fVNFzg3frk1JMFCwHh25U0+WcjCjDjJjxre8GgJV1jRevCA11qOAbPWJ9FnETDNAdjwFRXltdG5j15oCmaKUS433TEZotigljikA8niqh9tK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNSkP9qB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNSkP9qB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80641F00A3A;
	Tue, 21 Jul 2026 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657086;
	bh=/8FUeosdQk08Cs494C3BgTjpofp8hhN+3nRYSFPm5Cc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fNSkP9qBaHUT2wWHZ9hrP+eBF+w51nUJnqKzA+g/6ZMgyCwR62UC62jIeI0XcXLZW
	 8fpGApPOz2V1OEF7gkUP1eyF1+t8Ovc+0o1uxefSeAbXkx3MXYeXgHp8hGlgOsmg+D
	 E4+v+S2uA/qLSshMxurG4pQ2Uo0hKaQ1R5+dOVS2XihHo6Pd8rkmaf3CsHFUwGkKtq
	 YMkR58apY6E4e4wKEFLKQffEOboly9Gokz62Nte9qBVMufEhI2Kd/uMqbJHnFdj/SD
	 bKFQiGsX+bK8gTOvN+N9VtlPGWfoFy9QxhnzXIA1qrU3jvrH9ZFNUumVMw4wjuTgwF
	 5qLHiYfxYAadg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/10] drm/bridge: synopsys: dw-dp: Add follow-up
 bridge support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-3-f0f4a4ede712@collabora.com>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-3-f0f4a4ede712@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:04:45 +0000
Message-Id: <20260721180445.B80641F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `hpd_work` workqueue item is not cancelled during driver unbin=
d, leading to a Use-After-Free if it executes after the device is removed.
--

--- Patch [3]: [PATCH v4 03/10] drm/bridge: synopsys: dw-dp: Add follow-up =
bridge support ---
commit de5a52e4cba577233c79861335c4c6a6060e2e33
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Add follow-up bridge support
   =20
This commit adds support for using USB-C connectors with the DP altmode=20
helper code on devicetree based platforms by attaching a follow-up bridge=20
from the DP controller to the USB-C connector.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index aca6816febe67..0e8ecd73a0002 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -2014,6 +2033,7 @@ void dw_dp_unbind(struct dw_dp *dp)
>  {
>  	disable_irq(dp->irq);
>  	phy_exit(dp->phy);
> +	drm_bridge_put(dp->next_bridge);
>  	drm_dp_aux_unregister(&dp->aux);
>  	drm_bridge_remove(&dp->bridge);
>  }

[Severity: High]
This is a pre-existing issue, but does dw_dp_unbind() leave pending work
items that could cause a use-after-free?

If an HPD interrupt fires right before or during driver unbind, it might
schedule dp->hpd_work. The unbind function calls disable_irq(dp->irq), which
synchronizes with the running handler but does not flush the workqueue.

When the device is subsequently removed and the devm-managed dp structure is
freed, could a delayed execution of dw_dp_hpd_work() dereference the freed
dp pointer? Would it be appropriate to call cancel_work_sync(&dp->hpd_work)
here during teardown to ensure the work item is safely cancelled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-synopsys-d=
w-dp-improvements-v4-0-f0f4a4ede712@collabora.com?part=3D3
