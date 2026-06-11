Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C41377544
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166525; cv=none; b=gU4iYBooRAiiVL3bCdoP2GTMK8tw6netSOkk1SWRVRr2Tp/j01snCFUJv5bXKhbP1Sx0+nfzpjjARHkHMqr6Z6ZtfkQiZdUwyytm3Y5IAYHHNpyP9F0SU/9WI+I9uUns3pMNfg8cunddsCM6ad8/3nJvYDpCnz3+uxXhRE6LdFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166525; c=relaxed/simple;
	bh=dqfJJcuK+NHrnsdYmQGXSUI2EuRwRPUVRYfPPBsk5yc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fBDQM4XS6Rj1V5sQTjCMydlvrjCmy71n84/Q/DHLP8BFf8RY/IAWG85RDiLmnyAW1kpeEulG/3mosI0jjIO0YuR6D+5odj3TE+um6DzgMhIInegGjTOGN1atWcGwCfmXVjYXRwDrXvvyHMu5qSTarkgwOO+eKnQ5inUnhDVwIdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByTlEPw6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByTlEPw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30CA1F00893;
	Thu, 11 Jun 2026 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166524;
	bh=2m3qKVrl66xnT4PrKYQt9UTffmezHXZURcTEPuSKp3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ByTlEPw6EU668XSMz7DWtuVUYL1SiLEuuAq4nMQ+Hdp6dSpiZKuWfk04WZI3fYaTP
	 oNz53pnJlA4VNOGLUSYaOP/2bfoH/nRYzzkL7dOAm1ui060XGLC5SdgCbEGHxNAmgQ
	 IZk0VVzbLO1lBD+lXhSlK/xQJwf/po8m9bKmaralqNKbdeuVigbzjZj3jyJgQqDNp5
	 94p9n33ZIu0uYLPzXUP8Miwg9g2MObdjBcqReQ7oVHYFcOANhB1Ra33Bd15kayTIuy
	 zf6KSsCZLS5KbKmkn4k99SOfQJu1QIfRvvNLLkHFERO+IM4vFtvCCIDk7X6iNeUcGi
	 UXIfgV/h5JabQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: Update nominal max votes for qcom usb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
References: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 08:28:43 +0000
Message-Id: <20260611082843.E30CA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] APPS_USB_AVG_BW is incorrectly defined without the MBps_to_icc() c=
onversion macro, passing a severely undersized value to the interconnect fr=
amework.

Pre-existing issues:
- [High] If pm_runtime_resume_and_get() fails in dwc3_qcom_remove(), the dr=
iver returns early, skipping core unregistration and causing massive resour=
ce leaks and potential panics.
--

commit 68d35d27d1f598a1e07e782bd412e6f30d3c6fbf
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

usb: dwc3: Update nominal max votes for qcom usb

This commit increases nominal max bandwidth votes to improve DDR performance
and handle multiple USB audio use cases without glitches. It updates the
peak interconnect bandwidth from 2500 to 5500 and increases the apps USB
average and peak bandwidth allocations.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff1..aa43a03f3c7fc 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -46,9 +46,9 @@
>  #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
>  #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
>  #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> -#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> -#define APPS_USB_AVG_BW 0
> -#define APPS_USB_PEAK_BW MBps_to_icc(40)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(5500)
> +#define APPS_USB_AVG_BW 40

[Severity: High]
Should this value be wrapped in the MBps_to_icc macro like the other
bandwidth definitions?

Since icc_set_bw expects values in kBps, defining APPS_USB_AVG_BW as
just 40 without the conversion macro appears to vote for 40 kBps instead
of the intended 40 MBps. Does this unintentionally starve the apps-usb
path instead of improving performance?

> +#define APPS_USB_PEAK_BW MBps_to_icc(80)
> =20
>  /* Qualcomm SoCs with multiport support has up to 4 ports */
>  #define DWC3_QCOM_MAX_PORTS	4


This isn't a bug introduced by this patch, but looking at driver unbind
in dwc3_qcom_remove:

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_remove() {
    ...
    if (pm_runtime_resume_and_get(qcom->dev) < 0)
        return;
    ...
}

[Severity: High]
If pm_runtime_resume_and_get fails, does this early return skip
dwc3_core_remove and core unregistration entirely?

Since devres-managed memory for the qcom and dwc structs will still be
freed when the remove callback completes, will leaving debugfs files
active and workqueues (like vbus_draw_work) running result in a
use-after-free if they are accessed later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611081831.2743=
464-1-akash.kumar@oss.qualcomm.com?part=3D1
