Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1F736E489;
	Fri, 12 Jun 2026 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252472; cv=none; b=DxYBT+dT17ix1tawzfTRpe87Ctv7QPMJ0d+o+4+bdOlZM6Jf7UAcQHwlMcA+ry+KLaaLdViWVFyIzJxWz/vB4ai40uHVK+O7mvG4HZJU/PcSH+p9Bs2+byUwR6Ca3r4UIHuUyB6i+U7SSmJlHaCRP8AX59bg2dci3ieyGBK+m4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252472; c=relaxed/simple;
	bh=2fk5A7APxBfGY+Uc34bPTDrO05ybp9CeZsd9hq+Aa/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGA0ekHJz3CTku6a22qTPuYLdeO7QIahlmvWDqDudOJ6TunR3cIpk60iFCEaUjnfmpSfcq0H1zFZIlsUHhBtoWYPLPES6aOR19uEl1LVK3h2E+3D28/9/aYHYntGFu4BOK9MAgeImc3no8GeNfRezlHoqK2O6eWdn22mOqvgq/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxD4U3p6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxD4U3p6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E1E1F000E9;
	Fri, 12 Jun 2026 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781252469;
	bh=87jdAmviYLDeZfa++fixgb/NLJhsk3e7SaM4A5AzSy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KxD4U3p6+yW92beGADTrrCG5b0VPcJQVm2Rml0k83RHXa8p7/v1sQXnTTTFQD2laW
	 Vy+EgI4eA3VlGjpR4oaMu3CbMzqwwnJM7Sf+k2ew5oFjFzWoW45c4eOcFSYf0SVVYG
	 W9UDREx3fMLngftuDVfs/1oWPRb1EUwwJKnLc0K0n5z+z0e3NfXmkUJIjIHXyCvv96
	 iPMZ8drbxCmGjkXoMENblzjoa4lHR7fA6u+P2/c70n6J3BvNx2BLj2KRKAC/Xz8TRS
	 ERIu7xMOPnBEdIPtXGFKDJOR6fsPQYTN1O2myUazIJLE8O87Rxhi+sEhOWdX3UDp4H
	 kpA/LM/cEt1bw==
Date: Fri, 12 Jun 2026 10:21:04 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xin Liu <xin.liu@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm
 boards
Message-ID: <aivBcGQgeKGW45Is@lpieralisi>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
 <CAFEp6-2-n1L8rLv9zV142D_Q7io1G1ZuFgLHowsf8sObQt6iLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-2-n1L8rLv9zV142D_Q7io1G1ZuFgLHowsf8sObQt6iLw@mail.gmail.com>

On Wed, Jun 10, 2026 at 02:57:19PM +0200, Loic Poulain wrote:
> Hi Anurag,
> 
> On Fri, May 29, 2026 at 4:29 PM Anurag Pateriya
> <anurag.pateriya@oss.qualcomm.com> wrote:
> >
> > Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
> > kaanapali based boards.
> 
> I would like to highlight that when Linux/EFI is enabled, which is a
> common config, efi_reboot is used as the primary reboot path (see
> machine_restart). As a result, the PSCI reboot hook is not invoked in
> this scenario, assuming Qualcomm firmware provides EFI runtime
> services. As a follow-up, it would therefore be beneficial to also
> improve the EFI path to support such custom mode(s)...

I have not checked but we should probably put in a place a way for user
space to check that PSCI is _not_ the reboot method that will be
used, lest it would be allowed to send commands to the kernel that
would be duly ignored.

Need to go through the whole thing again before commenting any further.

Thanks,
Lorenzo

> Regards,
> Loic
> 
> 
> 
> >
> > These DT patches depend on PSCI SYSTEM_RESET2 support introduced in:
> > https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/
> >
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Konrad Dybcio <konradybcio@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> >
> > Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Fixed subject lines.
> > - Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com
> >
> > ---
> > Anurag Pateriya (1):
> >       arm64: dts: qcom: sm8750: add reboot-mode support
> >
> > Xin Liu (1):
> >       arm64: dts: qcom: kaanapali: add reboot-mode support
> >
> >  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
> >  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
> >  arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
> >  arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
> >  arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
> >  arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
> >  6 files changed, 30 insertions(+), 2 deletions(-)
> > ---
> > base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
> > change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8
> >
> > Best regards,
> > --
> > Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> >
> >
