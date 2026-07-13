Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1A03C81A9
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936652; cv=pass; b=Zascc1n/gB9qDvvNiNE74e/ixYgEfnwLF9dnGnqyeCf8S3qgqn1CX0ag/ZLV82lD2cFs4e943H8Xi61/to/P0+mRDS2clUEboG4pWYzIyhN1B6OfrArtAkkRuiRQC/hkt9OlJMePpWBacUJc3MJxQHkizTqtbObZzLspClMc1EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936652; c=relaxed/simple;
	bh=+iOLSTgUanaRtm9A0v0TMBC0fmd4CqVE5DXXexLAS18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8YfFp8cepq8esN1219Ueo8XEh4HnyXg4UQ+pwt9RAhuzCYF3x9vAasozYVJNrWVUmJowhK7wQAh+V+PAuBIzgsfXKnDzGCq7za46DbjUGQcjeGD8bUWGBa0DYlf6/nGbQYabVoyMHJqyhtoKPzMwXYShlUvKpqUqcb8SkSEwNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PqxXwVQK; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PqxXwVQK"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664d4478a64so3855272d50.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783936649; cv=none;
        d=google.com; s=arc-20260327;
        b=JkIdco5uVbBKpmcN2TR2xB96sypDBx9Bd2UpaxUCT/vXvZh5S/KeMPppb4Dxy9bi4i
         XmLIeI0ptRb7728ztTZQA3IA4ohH1BqQ64/OVIsk0nTk/eNFVcyyNtwam6B5gQXjNxXw
         Ow5XfA5FsSeK6qagzHgAgvW/+xExMqYYTibTtRds1EZDyGlhWggkGEP1XpLKdy5jhCVf
         X9wjaKfc3ghtaPs7pFuRyB+iOqCxb/iw8/UfnViopgIs3O3AQKd63uKmkpLW1aO/NlLL
         R819yrICYygPTUQZyZ5x9cw4uVSGjUuLGHU56u+aWaV/zBHZY5S4UP8dFZarG3thp2qu
         GAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4QXt7p8Vwl3VHBbUurRh8OkWPo7b1yKApjJfQ8E1MKc=;
        fh=UIURDnsZ8cIUbxdCLnKdS84nU+EcWmA5aHTNcy83wyA=;
        b=s3whb11vlCw6b3GXKcggP+x01jhQ3jgjIFfEb0deOd6Md+BXkdmvLdq6m6oxzRmAll
         AqmgKIuLkENNFjntecG5Jy+4nXQu2yq/+DpeyyDxJQhlun9J7oP+zVdyu4Ss/UpQXr8y
         WsGGZqXwF4fRzJJPilvyJY7q1z1X3YmDws6xWURmnxmZKsQ6/cTBb2AQgAP/oqQ5jLui
         ZLaxFzk+AtnmgcprP4atDXsvCDDT5+L4kaiZ6u73rbpjRs+0JSfDGhAEqFkFIZAl4t7T
         1k0PmB4dS6c98UHhKogZy9m5OO3jRUt5R8qLW8+0Z9dexhVfLZMnTBInxh4LYlodlych
         4tBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783936649; x=1784541449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QXt7p8Vwl3VHBbUurRh8OkWPo7b1yKApjJfQ8E1MKc=;
        b=PqxXwVQKgtRheNYg0aWlQYypQcATVDKQUMy+sTy96noJ+RogxJ/HwH/MbdaVXX65iH
         G0G4PDW1MxUNZwqpxnupk7GABlpx3hpN+ns/ae1BPh0zwZMNp7nh8mTENWF741BSela/
         Ny7Fzi0Rn/Gia+0LKRt5dxJC4QFcpVPRnSZTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936649; x=1784541449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QXt7p8Vwl3VHBbUurRh8OkWPo7b1yKApjJfQ8E1MKc=;
        b=lnZbuy+z8O8oXgSDqkxfg9/ETQ6Z0Rtrk7r2raxowBStU/hF/aU1Do/SifS+tbJLei
         VS4sdd5FyxA1LsUOScDSmW9OdT5fkhrugtmEE1iIQVASLdfRVCcC8WS9E6DIlvDsOg/3
         5LkDH7nI/DGbaD7W1yiNbxeMJT045Hrbrm2ROwQ8tu6/65RLOaT4Tj/mvaLj9ejufujq
         fTh5E2DUuBtxXKsK7l6G/qTco2CRb6L8eW89p3aNRohgr1a5NVTmDy5eKdtMYJBr7IA7
         MzdoKwpTUrYfHtwnJNlFIKaPYGNWAU9uo1A36j9xXly/xVtuHZ7ySgBzrA9GAKP4i54B
         7VqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtOYsZgrNgjFNPIkL8klANGrYk9WPq1Vg8OIVsdRF7vWNkpn3fy3mD80NBjHONGmHR8xy6gY5bP5FP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0PyKcG+lWZU3JGykx3LB+sVWIdOrckHXoDlbrCiJ9GJ9QaCmD
	4wbsf+iVVCLF8cTyhjVssXkCd9Xytym3xQNJU0UnSasq3NF6LHDW2woase0bodbGuycvmJROB5M
	7MI8HKGShL8Uno587wOuA1MROQq2RppAd+oBiZYXT
X-Gm-Gg: AfdE7cmqdPkS6NstiQv9hahjEf1qc0RvXCeKN9PQxvArlMfxSyKq7dnZJnf1y7pgq00
	ogu8sDUvannIdch3UiukTz17VBJCx9PqATgNvaAQjTn4M/Yxlxm7KB9w1iF9j4196JI7SbnRE6M
	reN8ZJI2fXNA01iQnz3rSWafxypbstdu9bCMuMrZ3Y5WGATngGBbWqgXfjj+v+AapoCIRSEFZPA
	XvcHUYcWlIkBwjCeQe0QKYE0jbSMkKSesTsXUUA8EDqF+MyrFaKgO26x6pZVpjOi4qdQHDqJFWZ
	4dOlkc5XbDN3qewLAc7ruqJSWpU=
X-Received: by 2002:a05:690e:c48:b0:667:f1d5:b364 with SMTP id
 956f58d0204a3-667f1d5b81bmr2295373d50.63.1783936649263; Mon, 13 Jul 2026
 02:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709095726.704448-13-wenst@chromium.org> <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
In-Reply-To: <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Jul 2026 17:57:17 +0800
X-Gm-Features: AUfX_mwq5Qa8EaAFziCQqQmKzQg2wnKp5lbTV4kofMKUdyLtgA0yJkFs72KLWb8
Message-ID: <CAGXv+5Ew-_y4Ui8LF6sbges-nVi7mgB0HjQtZAUTHzPh6Vwk=w@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
To: Wei Deng <wei.deng@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mengshi.wu@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com, 
	shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	xiuzhuo.shang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 5:43=E2=80=AFPM Wei Deng <wei.deng@oss.qualcomm.com=
> wrote:
>
> On Thu, 9 Jul 2026, Chen-Yu Tsai wrote:
> > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> > UART for BT. Currently the driver only supports PCIe and UART.
> >
> > Add power sequencing targets for SDIO and USB. To avoid adding a
> > complicated dependency tree, rename the existing power sequencing units
> > "pcie" and "uart" to "wifi" and "bt". The existing target names are lef=
t
> > untouched. The new "sdio" and "usb" targets just point to the renamed
> > "wifi" and "bt" units.
> >
> > The "unit" names are internal to the power sequencing framework, and
> > should be confined to a single provider. The names are only
> > informational. Dependencies are tracked with pointers to other units.
> >
> > The "target" names are the strings that the consumer uses to acquire a
> > descriptor with. As these remain the same, existing users will continue
> > to work.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Expand commit message
> > ---
> >  drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
> >  1 file changed, 27 insertions(+), 14 deletions(-)
> >
>
> Hi Chen-Yu,
>
> We tested this series on the Qualcomm Hamoa IoT EVK with both USB BT
> and UART BT M.2 cards and found an issue with UART BT power cycling
> when the USB hub is active.
>
> The "uart" and "usb" targets in this patch share the same bt_unit_data.
> The USB hub acquires the "usb" target in hub_activate() and never release=
s
> it, so the bt_unit enable_count never reaches zero when hci_qca calls
> pwrseq_power_off("uart"). As a result bt_disable() is never called,
> W_DISABLE2# stays deasserted, and the BT chip cannot be properly reset.
>
> Observed on Hamoa with a UART BT card (WCN6855, sub 0xe105):
>
>   With your patches:
>     lsmod: pwrseq_pcie_m2 ... 3   (provider + uart + usb)
>     btmgmt power off -> GPIO116 stays HIGH (bt_unit ref 2->1, no callback=
)
>     btmgmt power on  -> "hci0: command 0xfc00 tx timeout" -> failed
>
>   Without your patches:
>     lsmod: pwrseq_pcie_m2 ... 2   (provider + uart only)
>     btmgmt power off -> GPIO116 goes LOW  =E2=9C=93
>     btmgmt power on  -> hci0 UP RUNNING  =E2=9C=93
>
> USB BT card (WCN6855, sub 0x3374) tested separately works correctly with
> your patches.

Thanks for testing. I haven't gotten around to doing the UART based BT
in our stuff yet. Though today I had been thinking about how to reconcile
this with the MMC pwrseq stuff, if the SDIO stuff isn't moving over to
this. Still no idea whether that would happen.

> The testing was done with the following Hamoa-specific patches on top of
> this series:
>   [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key =
E connector
>     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-1-5e7=
25091266a@oss.qualcomm.com/
>   [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART =
BT variants by subdevice ID
>     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-2-5e7=
25091266a@oss.qualcomm.com/
>
> The fix we verified is to give "usb" its own independent unit so its
> enable_count is tracked separately from "uart":
>
>   static const struct pwrseq_unit_data pwrseq_pcie_m2_e_usb_bt_unit_data =
=3D {
>         .name =3D "usb-bt-enable",
>         .deps =3D pwrseq_pcie_m2_unit_deps,
>         .enable =3D pwrseq_pci_m2_e_bt_enable,
>         .disable =3D pwrseq_pci_m2_e_bt_disable,
>   };
>
>   /* change usb target to point to the independent unit */
>   static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data=
 =3D {
>         .name =3D "usb",
>         .unit =3D &pwrseq_pcie_m2_e_usb_bt_unit_data,
>   };
>
> With this change, uart_bt_unit reaches ref=3D0 on UART BT power_off and
> bt_disable() is called correctly. Since a M.2 slot can only carry one
> card variant at a time, the two units do not interfere in practice.
>
> Would this be an acceptable fix, or do you have a better approach in mind=
?

I think it's acceptable in that it works, but it needs to be properly
documented, like "this only works because on the M.2 slot only one of
the two interfaces is used; do not use this pattern in other drivers."

It's also up to Bartosz and Mani, since I believe this is a slight abuse
of what looks like a shared resource. I'm sure the AI review bot is going
to complain a bunch.

If it's acceptable to the maintainers, I assume you want me to fold the
fix into my series.


Thanks
ChenYu
