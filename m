Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454B0389110
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466279; cv=none; b=cMWEBJhY/eEdmZaneMbaVOYqFayumvEOVX4hewv93qQKItQUC3WwqgvSGsmwnR3UO2eYNOXZY6JKR/yLmRcts7MFbaAI3H8qsWEa7LPeSuqZjtUbY7iUreFVaR53HiCBb34WP2HXUMHgQ+pvab2aqV0BdSXwxCazfdaxEzhQtC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466279; c=relaxed/simple;
	bh=rpux6yDT16ic0wS3/2Ry77dxAooCngnSjhcLkmuwQiw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDvua74U3Ft4OrUVnyjTI3rp4q2MhMSzqGR9chMoThRvTZkmcxWqrspsZoh1jeOg/kvBwpclVslwQd8w8gWw+G5PDy1/dlugy7xMQ1GJ9d30MtX1p74uBUT9IP3s6z49jARBqa6PudT4txjyP+EHYjGju8SdRgB6eS9p8gOobA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDQuGtnw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDQuGtnw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19C41F000E9
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782466276;
	bh=rpux6yDT16ic0wS3/2Ry77dxAooCngnSjhcLkmuwQiw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=hDQuGtnwR3ps3zQIvEb2J6W6uU1Kwq1lxpQ3sWo2Qf925+HiVIxsJ00GCxCkdZyh5
	 tYDDuCZyfXWLHAT2QlhOEEuAIDCiUPXlfYQY4ZqfNs6zyr+uroZIyz2rSFXDP7ayZL
	 34Nm+HlcRO3/rgdb+HUlxwn4QBi+JSvp/DR4PjwGTv246nD2VkPiQFmznv3B+HcJi7
	 +xCUYXceGxhiTbBwA/FlvknLNoxBaUImfFDknasg0z4J0rglUxJlLXbgetH7YHnN+9
	 hOrTPCDOt0fEg90jHsFsZOB2qXsE6syH545TxXubpADCTFz2sNkHHzoA7jVEB/KXNo
	 L87aN7E8srVqA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ad578c49afso711357e87.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:31:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr3SmAf5xuSboQGqr/d65CQjLamL/8PmIypQ/i2KtkzAhwsnSOlVzF3Hqk7uwScQ+WNFYI1zON5zstn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxan/5H9eIioSPUSxVQYKtqHI8Jf66BVMz2rV773aB5o5Y+Y2PQ
	H8AmSjmQ5xXz8FARLWAGzq8EmmIboiZcrYZgOyGgcgeFxhlcf0ORZCWFRTMMqYRVuVElNCNwJmR
	0BfICHQ25k/OFooB77ios/yOh7sHPtHct9dSr50sLGw==
X-Received: by 2002:a05:6512:70:b0:5aa:6f89:9378 with SMTP id
 2adb3069b0e04-5aea1f4cc51mr1390413e87.33.1782466275655; Fri, 26 Jun 2026
 02:31:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 02:31:13 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 02:31:13 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260624-wakeirq_support-v11-1-120fbfaebe59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624-wakeirq_support-v11-1-120fbfaebe59@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 02:31:13 -0700
X-Gmail-Original-Message-ID: <CAMRc=MenARGtsG9EhF7zVgcOeQGAYVRZc906j4tBDHQzzsc0hg@mail.gmail.com>
X-Gm-Features: AVVi8Cf30tKZqffjS3ZAp3xIi5Kv5KtWMy22eC3tfJBlDmG5o9u1ykXsqyuQesk
Message-ID: <CAMRc=MenARGtsG9EhF7zVgcOeQGAYVRZc906j4tBDHQzzsc0hg@mail.gmail.com>
Subject: Re: [PATCH v11] PCI: Add support for PCIe WAKE# interrupt
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, 
	quic_vbadigan@quicinc.com, sherry.sun@nxp.com, driver-core@lists.linux.dev, 
	devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jun 2026 13:25:49 +0200, Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> said:
> According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
> two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
> hardware-only mechanism and is invisible to software (PCIe r7.0,
> Section 4.2.7.8.1). This change adds support for the WAKE# mechanism
> in the PCI core.
>
> According to the PCIe specification, multiple WAKE# signals can exist in
> a system or each component in the hierarchy could share a single WAKE#
> signal. In configurations involving a PCIe switch, each downstream port
> (DSP) of the switch may be connected to a separate WAKE# line, allowing
> each endpoint to signal WAKE# independently. From figure 5.4 in sec
> 5.3.3.2, WAKE# can also be terminated at the switch itself. Such topologies
> are typically not described in Device Tree, therefore it is out of scope
> for this series.
>
> To support this, the WAKE# should be described in the device tree node of
> the endpoint/bridge. If all endpoints share a single WAKE# line, then each
> endpoint node shall describe the same WAKE# signal or a single WAKE# in
> the Root Port node.
>
> In pci_device_add(), PCI framework will search for the WAKE# in device
> node. Once found, register for the wake IRQ through
> dev_pm_set_dedicated_wake_irq() associates a wakeup IRQ with a device
> and requests it, but the PM core keeps the IRQ disabled by default. The
> IRQ is enabled by the PM core, only when the device is permitted to wake
> the system, i.e. during system suspend and after runtime suspend, and
> only when device wakeup is enabled.
>
> If the same WAKE# GPIO is described in multiple device tree nodes, only the
> first device that successfully registers the wake IRQ will succeed, while
> subsequent registrations may fail. This limitation does not affect
> functional correctness, since WAKE# is only used to bring the link to D0,
> and endpoint-specific wakeup handling is resolved later through
> PME detection (PME_EN is set in suspend path by PCI core by default).
>
> When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume() to
> bring the device back to an active power state, such as transitioning from
> D3cold to D0. Once the device is active and the link is usable, the
> endpoint may generate a PME, which is then handled by the PCI core through
> PME polling or the PCIe PME service driver to complete the wakeup of the
> endpoint.
>
> WAKE# is added in dts schema and merged based on below links.
>
> Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
> Link: https://github.com/devicetree-org/dt-schema/pull/170
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
