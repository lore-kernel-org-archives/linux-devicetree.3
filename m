Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602435;
	b=wP8ZbY3O0YlDvbaumR8NtLLN4kFUny1ina5w3XjFh1KMo9vdGNeSAX3RF6g6LhnkRfG+
	 geAzjgT5CAghSaMW8NqIVWGP2FSsRjtWdSAyhi1NmWgFMPhxdfGc/8RVDBba2h9508vDt
	 7tcoFBQRXdvRWTpWu0kqOVY3jBHNWBRN9rsfTyEhJ2rZH7Gq+FCd7WPLjr8VdRUmpNgnk
	 W6kHlTW4Qbi+zo/VrytxMj1wHXwyRgXvGb97znN9CThAfY+Y0tkVl1fDrl7YycrAbAdSV
	 wI7Bi2kbfuveB2qDCcOUkSrCKppsqA1EyAbMsfWr/hRxmRcyB0Wwtq9VEObOFb3hceA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602435;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YqOyLeJF1LZn52GyfM0b3GDfTRLm5jSkYKCfEBCotc0=;
	b=3qm0NFqSnZqgVh5pj5l0O/m+ay9AHXFsz7JFH2dbyfyWRcc44U576xyik0S5BBeW9Df0
	 1ArctCwPde7oWr8vd9BDRFchR54MKmO/C4jszsqHcQGINf7m0s7vylnj1Szoca7R74flu
	 U8Hbj+Wzox8fiImtwfBhNxBfVdpxilIboMBWhajixOsIXro9WEIyAZH85l7w0BfaPbBFs
	 9AqnqmHwP3f4TlD/C6L9UwtVSpARgpuOm50cNa8VQFTv4x9sU4g5l/DcrhSwZqoNi9DUX
	 odMrVt29HB5qqKCJF2WhPbsaEi6uLIcAGCBiR4Y/hAdScty+0m1FDU4Zy0FN+n5c3yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84698606A331
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84698606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-716c0217635so2500839eaf.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602433; x=1795207233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqOyLeJF1LZn52GyfM0b3GDfTRLm5jSkYKCfEBCotc0=;
        b=Mb1JpnEp3NnIqa/LLHgeAAjtW9yPzWAqnHPOmrjm1ROPZw3uopeNdWxKwXKvR4+ZAk
         rw8gSry88re/t+gNa6n6UnHj5dYORaAL/Q8C/FPbQ8HVppeHfOBgfbbkTzRNCNT4P5L4
         xG+vWF7xn25BEHo5b1G3RoFu2cDEEse/tsgvBzY+DfQz694szLGZVZW2uU4MKVZL0Upw
         le18FOLPQ55WCa95zTQ5nH+kBAbzyPY7qu7Om75mgnZHkQoeYXgupSG144rnKagp0v4D
         8MGRWut9+H/tm0uLrJSKFhZ9F4BKkfyGDblPRNU9TTiULlxbHWph2lPX6mP0H65iUzLJ
         rhoA==
X-Forwarded-Encrypted: i=1; AL+hErFeaEcZ3xeniRvS+HO3pEVnEQVeHrCtymMUDDDZdyx/aIYWQQ3JWAw0XUGtQMrjeBmgaC1gZrDx0hrd@vger.kernel.org
X-Gm-Message-State: APuU4Z+tPmudvlKztWihbWwubKNwPzFFMD2tHq+XMbaLp3ghpVT/iXYQ
	id+7XU9+FoyUbLzm3BbqaiNxQSGLg/+m/mgoA8zPbNIUZM2Scb/HWOuxfs39Nmj9
X-Gm-Gg: AYBFou0MHkVW1Cn+zwKkGc5fxPi1CxQjubyL92DgsY3pjQ2HkOHjbVkmCQ1tnNOHn/4
	AvPq+oZoj0rusF+FICGBgOB/lhOXX317XwtVDM9uketVyOMXerfG5+dXVsSwDUdrANOYONXq4CF
	WVGNZNBOzrSHyTebDUxq9EgQvz3Rnl7zJz/1SXhVfThvnLmA40YowWh7yHEHtoSrpTnBp5qWsmA
	cuDEcKB1mJK+vB9iJdm5cNFrLKhuN1lbMLu2XeCdthM58I4483duaysMOveSihCv4wMJU8SYB5i
	unmk8/PNAbqKbPEY4eK9S504jsMsUw/99sZ8ZLSJbtze4NjqBgSNTmlXAcMQlP/TkU/oSm81u9O
	gQP1GQmJ9GCTWX5V19oTR+nXJaXnPvCuBx3hOU9ZHSxeMRY0x9fbshJQ0kPno9ywHUpDNC/VynG
	lvUU/rKzgmd6MMNgWcLFQV5VPggYOimxiqsN5kLIdNqv8MaAHFl72M67BROzNMuiX/1+TD+ZT8G
	VdFq2oaBFdGrXigO6VsojUhkL/jkyYZIdYX/6arrRzllknRnPncLd/ZfGRn4lC3An/KF4ZAX5pO
	a0ac311+rGQtNcpyYbhUDDBZ2JCBDxk/o5pUHN/rb8f9hWpF5aWVBPKo5h3ijQXEk+uHd57dMem
	yygEe/1PsDPexVmTgx6QjSdHxhBWVbeFb2cwdW5Wb00/e6wFMRaFYEQKpcsSry4TsOgPaXdpHNI
	hT
X-Received: by 2002:a05:6820:1528:b0:70d:7461:973c with SMTP id 006d021491bc7-71974236384mr4596840eaf.17.1794602433474;
        Fri, 13 Nov 2026 12:40:33 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e779dsm3248659a34.11.2026.11.13.12.40.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:40:32 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-86156cf8a7eso2235049a34.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:40:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGYfSuuwSeg1z7FLQexHAM5+4QpVraUflCZGupgGfg/ueHoniT8x6eR0FatszxwchiERcuLSxL4AX/W@vger.kernel.org
X-Received: by 2002:a05:6830:1cc2:b0:7f9:555:1df0 with SMTP id
 46e09a7af769-86289878845mr2035460a34.12.1794602431926; Fri, 13 Nov 2026
 12:40:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
In-Reply-To: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 13 Nov 2026 15:39:55 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9ffh8v9PKn-pRc7DLjD0h9oP64ZB_FR5B0K=YfctJx2w@mail.gmail.com>
X-Gm-Features: AclHuK99xhj_lrjZso--3IknqiDF9swsBuRbZJPQdiHng0qFnjGS4Y8OcMsuew0
Message-ID: <CAEg-Je9ffh8v9PKn-pRc7DLjD0h9oP64ZB_FR5B0K=YfctJx2w@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Add support for Apple Silicon DockChannel internal keyboards
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:25=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> This series introduces support for the internal keyboards on Apple
> Silicon M2 and M3 MacBook models.
>
> On these platforms, built-in input devices are managed by a dedicated
> coprocessor running an RTKit-based operating system. Communication
> between this coprocessor and the main processor is carried out over a
> low-latency hardware byte FIFO interface called DockChannel.
>
> To support this input path, the series introduces a few new components:
> - An apple-dockchannel mailbox driver to handle the low-level
>   byte-stream FIFO.
> - A DockChannel HID transport driver (apple-hid) that boots the
>   coprocessor using the RTKit framework and encapsulates the HID
>   protocol over the mailbox.
> - Minor additions to the apple-rtkit and hid-apple drivers to support
>   the TraceKit endpoint and integrate the keyboards into the existing
>   input-quirks framework.
> - Devicetree bindings and DTS updates to describe the nodes on M2 and
>   M3 laptops.
>
> The transport driver is based on an original out-of-tree implementation
> by Hector Martin, but it has been significantly rewritten for upstream
> inclusion to use the standard Linux mailbox framework and align better
> with upstream HID design patterns and reduce reliance on hacks.
>
> While the coprocessor manages both the keyboard and the trackpad, this
> series only enables keyboard support. The keyboard can be initialised
> without loading external firmware, whereas the trackpad requires
> firmware. Trackpad support will be submitted in a subsequent series
> once these base transport layers are established.
>
> Tested on: MacBook Air M3 (J613).
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
>
> Changes in v5:
> - Link to v4: https://lore.kernel.org/all/20260925-apple-mtp-keyboard-fin=
al-v4-0-304c267518f4@gmail.com/
> - Drop ASC mailbox and DART binding patches which were picked up and are =
in apple-soc/dt-7.5
> - Simplify HID transport reg-names from coproc-asc/sram to asc/sram (sugg=
ested by Rob Herring).
> - Replace the empty STM child node with the 'apple,has-stm' boolean prope=
rty (suggested by Rob Herring).
> - Drop the keyboard child node and move 'hid-country-code' to the parent =
node (suggested by Rob Herring).
> - Simplify the transport driver to filter supported interfaces in C and d=
rop fwnode handling.
> - Collect Reviewed-by from Rob Herring on the DockChannel mailbox binding=
.
> - Rebase on v7.4-rc1
>
> Changes in v4:
> - Link to v3: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-fin=
al-v3-0-e356464e454b@gmail.com/
> - Describe the DockChannel interrupt pair in DT (suggested by Yureka Lili=
an).
> - Serialize command transactions and finish STM setup before signalling r=
eady.
> - Keep IRQ flag reads and acknowledgements under the controller lock.
> - Clarify teardown synchronization and use the explicit-bounds HID API.
> - Preserve interface-start errors and allow waiting again for delayed rea=
diness.
> - Simplify FIFO writes, IRQ startup and compatible matching.
> - The command and IRQ changes address Sashiko feedback.
>
> Changes in v3:
> - Link to v2: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-fin=
al-v2-0-a5c685e50b60@gmail.com/
> - Fix failed-probe cleanup and interface publication ordering.
> - Fix report lengths/types and reject replacement descriptors.
> - Terminate serial replies and encode checksums as little endian.
> - Honor HID_QUIRK_IGNORE_SPECIAL_DRIVER.
> - Clarify the DockChannel TX byte register layout.
> - All changes above address Sashiko feedback.
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/asahi/20260630-apple-mtp-keyboard-f=
inal-v1-0-506d936a1707@gmail.com/
> - Rebase onto latest upstream and add M3 Pro/Max device-tree support.
> - Use an optional STM node to decide whether to wait for device IDs
>   (suggested by Yureka Lilian).
> - Rename bindings to match the t8112 fallback (suggested by Conor Dooley)=
.
> - Fix FIFO MMIO write width (suggested by Yureka Lilian) and run mailbox
>   interrupt handling in the IRQ thread.
> - Remove the duplicate report fixup (suggested by Sasha Finkelstein)
>   and redundant HID dependency (suggested by Julian Braha).
> - Fix teardown and the missing HID stop callback; simplify interface look=
up.
>
> ---
> Michael Reeves (7):
>       dt-bindings: mailbox: apple: Add DockChannel mailbox
>       dt-bindings: input: apple: Add DockChannel HID transport
>       mailbox: apple: Add DockChannel FIFO controller
>       HID: apple: Add support for DockChannel HID keyboards
>       HID: apple: Add DockChannel HID transport driver
>       arm64: dts: apple: Add MTP DockChannel HID nodes
>       arm64: dts: apple: Enable DockChannel HID on M2 and M3 laptops
>
> Sasha Finkelstein (1):
>       soc: apple: rtkit: Add tracekit endpoint
>
>  .../input/apple,t8112-dockchannel-hid.yaml         |   92 ++
>  .../bindings/mailbox/apple,t8112-dockchannel.yaml  |   88 ++
>  MAINTAINERS                                        |    5 +
>  arch/arm64/boot/dts/apple/t602x-die0.dtsi          |   47 +
>  arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   24 +
>  arch/arm64/boot/dts/apple/t6030.dtsi               |   47 +
>  arch/arm64/boot/dts/apple/t6031-die0.dtsi          |   47 +
>  arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   19 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8112-j415.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |   21 +-
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   47 +
>  arch/arm64/boot/dts/apple/t8122-j504.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122-j613.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122-j615.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |   48 +
>  drivers/hid/Kconfig                                |    2 +
>  drivers/hid/Makefile                               |    2 +
>  drivers/hid/dockchannel/Kconfig                    |   14 +
>  drivers/hid/dockchannel/Makefile                   |    3 +
>  drivers/hid/dockchannel/apple-hid.c                | 1167 ++++++++++++++=
++++++
>  drivers/hid/hid-apple.c                            |  118 +-
>  drivers/mailbox/Kconfig                            |   12 +
>  drivers/mailbox/Makefile                           |    2 +
>  drivers/mailbox/apple-dockchannel.c                |  357 ++++++
>  drivers/soc/apple/rtkit.c                          |    2 +
>  include/linux/hid.h                                |    1 +
>  include/linux/mailbox/apple-dockchannel.h          |   29 +
>  28 files changed, 2251 insertions(+), 47 deletions(-)
> ---
> base-commit: 1d368e025d7c4fe63c8bf68ccb4bc3c9772ab75c
> change-id: 20261108-b4-apple-mtp-keyboard-94f1cf08ef11
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
