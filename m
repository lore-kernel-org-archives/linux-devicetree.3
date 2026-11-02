Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623005;
	b=thVn+ERNZpODwTClAJTGCcFMkLB81RWegUfJ7WT3iFZrGqvEyTByrxNZGSiUnxzi2m7P
	 KWM466wPmwsxoBixHJjYHdkX23GFH2x0mxXfLN0/CW0T7UpF+9KdaLu8f74RipEQHT7XG
	 lOQvhAMBRcwbEhWeqKv9DQkU1ss9hSdydTCPbmWDlIzpdVrfMUBVyuZqocXANBIvmTrg5
	 GVFIwmwo3Wodh88J7YYOt2x6b+0dzftxvnlG8UyLAnyjU/YOejGVac4fcqqfY12wPfSJd
	 ogaZlFcyLHu2VSQI7XZamwzylIhiqAGnJXPRAklrnh+PsXTCjXTBjIIwbk7skc1Ycug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623005;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=kYoEHv1yJWT5CYnv9W1t01akAHdAj5zwmImIgwGqYBU=;
	b=gOfRwD0u/3k+N4bVr/B5h1kWE5Lk8s9CZ51/O9n5T38F41tNZYkusPm3jSjkhDZBRYLO
	 ZwDTuHFAJCAXyU+53SZGoOuCWY7L6rkO40jzyOyrXfLLSiibOYpXxEpJ84+aksTCvY8xt
	 e+jzZA/HWuDW1o6sFw4yViWfzh1/dN+wFQwE+TdLYbEsGSpCA4H+Robx3OPA9OctTKufK
	 S3X/7BG1+uq7pYxW3ptsUkw03C1oAQkDWKjYvBcK5MIjnAwCT+6mp7K2tdB9MRNTulkT/
	 iyViZygdNKbmY6K+AD67KZ2l41g8bYux86b1cj+x/Ti/tkd1w/o7SDbjEMBYn/bFaUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CjrtUWhV;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43542606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43542606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CjrtUWhV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793622990;
	bh=kYoEHv1yJWT5CYnv9W1t01akAHdAj5zwmImIgwGqYBU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=CjrtUWhVaj5/yQ3ZrffhUf3Bwz4ZRwPxkwqR1GGCMIxjiiJlLkKfIuct5GI+/7o5c
	 f7YFwpXAAb/OZ8WRaQPmpJKbkgYLLW9bSZKh5L8jzRgauCs/DMAiOs3SwLQ3mBwxJu
	 Zf0q8iDrTiWauVqUIK3fKcloE2ChtWvT/T3dSSbM=
X-QQ-mid: zesmtpgz9t1793622987t8aac8631
X-QQ-Originating-IP: VRQSXQNMmseZ1WJB/8l1Atpep7t+qRk3QMq+5jKqoT0=
Received: from mail-ua1-f49.google.com ( [209.85.222.49])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:36:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8229586968361777039
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9909e82513fso2662310241.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:36:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByUJlfRWwE1Gayv/aRPb8djPOk1h0laNWnJ+jDmDFqOW8TD5OKOCTuBOvhvgPOOqjYVcGAffUKIYINl@vger.kernel.org
X-Gm-Message-State: APuU4Z+IrNyscf8a+/Xh5yYwghiYXYva9rxOxGH/Is747q9vLS4NMUBW
	j0oBsM31aVmga9QgPU6L6RUFv2H9mLRxc3/74u5ZJYfZxlvBP+urfmqRPf2Xb1zmItqiDzXi/0+
	12Dpko6bB/+CvyncPvZguCnsU87SHQOw=
X-Received: by 2002:a17:903:1212:b0:2e9:fd49:64a with SMTP id
 d9443c01a7336-2eb3640f012mr65226725ad.1.1793622366169; Mon, 02 Nov 2026
 04:26:06 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
 <auYxFRtKWbGAlRTL@aurel32.net> <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
 <DMKIFFUY4T1C.TTDVVD0FOSF1@kernel.org>
In-Reply-To: <DMKIFFUY4T1C.TTDVVD0FOSF1@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Mon, 2 Nov 2026 20:25:29 +0800
X-Gmail-Original-Message-ID: <648788BF6233AD63+CAAfSe-uMrrX2Y_mzt5-Hhr+ssfwLVhs094PBb-ZTgKFLPwVjgA@mail.gmail.com>
X-Gm-Features: AclHuK8Nf_Wjx0Fs3iSP6YTyXDr4sshL9mP7vgixNBtorqmmqEdGoXFlzXEdNkY
Message-ID: <CAAfSe-uMrrX2Y_mzt5-Hhr+ssfwLVhs094PBb-ZTgKFLPwVjgA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
To: Troy Mitchell <troy@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>, 
	Troy Mitchell <troy.mitchell@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NNwl29PiX6fKF0sFcmLrzBfMhlnUAYlJ0iQ4NCU2+0Ew99rQBmZ46y12
	bUcm20YmPIyayzcMMA5ytCRlqbLS2BXpjERCtbStrw81BQR8t3t0igNVEUA7S4OxdjGnUZa
	pU26WAkxmDPITa1vQv7DqZiAPlMQJefAmUt50ImqABZ5Np8NQbV51/eYTkeQjJdhpYLP228
	G/O6i0eRvgYiajDu1qt1kwmI8hW4jwKLh8WJa5mAtB+hb+0iQL3roGZmIPQRia6CrxWpuLI
	FULhvrmp6CFpZQZvADtvj8tCAiRSY7VFzBeqhxxmrh9FZPZHsWg3zqIgXiHOer16KZTQcyv
	VhRSYd6mwQuRkpIKhsfwDNGdojoB1FR9R48YDLLcuoSZDzG8tayEubdLx1aBnw/T0AeMmNP
	/EyDyxCyzamY9mzreyPWUxaA8drK8Ik7U4hQdc8glJr0WxAdNbFZNZeue1NziHHI+E3erP8
	dFDvenlYFw8viKCO54DkcZYk3Bzzy7bPC6HCg2CWmIQUen3FatJFzVjm50foun8Bq9c/u8G
	Vk92EuOml4ho2XPckUH7uwP9ozOzt+HNS8KZz2y42zUSJZSK1ZpK/xfFlglHztbEZ6QVDxH
	D76MumznzUC8GBnyDy41Tjzl7VEiEQYiTYhV5Tdzov/f3r2Ymz9VZ9oOM7Ca7Rip1upU3zF
	1RCfLH9a9fb9160gXdC81kTDHX77UZSR54sxXeA1lmbGMbUicP8PUt0qOWDs4+GYASbEyWm
	PjDGaXIg0KojIz4POan5mWHn5gUwCFkqiPRyHoFfrQ203zH7lITn8yPu7SGp29Fp9UsHC6G
	Ru0pr4qCCiQ68Ijagbmxi2hRQmdAOO3C4BR0xNawM8c6tBHLeGLbZPMLkFBsLDCdNDdtdn0
	+Uma+SsBuXQZPALTO2lzlwq2U4M0bUweoP5T8WWNEbs3j8+AwQ6gYS3Pc0p5edc+id5JvgM
	lJTAD/rCanQT3qtwjwKbpnHlnslT6wpWM4Ejt6JS7p50uuMreifP13f9SEvUQ3TlYnASSqv
	+D8T9GQcAuNpLesaYw0ednUr5m0V/bbyupNpibxeruHs4AB+xmd78pI+MXnB9zmKmCz7vu7
	FecL5wdzJQJGAl8fOG/7DxWO7U6NAJXZA==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Hi Troy,

On Mon, 2 Nov 2026 at 14:27, Troy Mitchell <troy@kernel.org> wrote:
>
> Hi Chunyan,
>
> On Fri Oct 30, 2026 at 5:40 PM +0800, Chunyan Zhang wrote:
> > Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> > of the K3 SoC.
> >
> > Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> > yet, so the port runs at high-speed (maximum-speed =3D "high-speed").
> >
> > Enable USB3 port A with dr_mode =3D "peripheral", so it can be used as
> > a USB device.
>
> Port A is a Type-C port behind a FUSB301, so please note in the commit
> message that it's device-only until the CC controller is described.
>
> Was this tested with a C-to-C cable? That depends on the FUSB301's
> power-on CC mode, since nothing configures it yet.

Just tested,

On K3:
~ # ls /sys/class/udc
cad00000.usb
~ # cat /sys/class/udc/cad00000.usb/state; echo
configured
~ # cat /sys/class/udc/cad00000.usb/current_speed; echo
high-speed
~ # cat /sys/kernel/config/usb_gadget/g1/idVendor; echo
0x1d6b
~ # cat /sys/kernel/config/usb_gadget/g1/idProduct; echo
0x0104
~ # ls /sys/kernel/config/usb_gadget/g1/functions
acm.usb0           ecm.usb0           mass_storage.usb0
~ #

And the host side sees VID_1D6B:0104 with no error. This is not
guaranteed across all C-to-C host/cable combinations =E2=80=94 will note in
the commit message that Port A is device-only until the CC controller
is described, and that C-to-C behavior depends on the FUSB301 power-on
default.

Thanks,
Chunyan
