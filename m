Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B5D27F017
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017060; cv=pass; b=dgFAN+QupLI7nUWiB7nrgJU2R+vXL/LdNCxWC3PNrQrLCpiG2XVgymIqDCjQttI1EekJdNhxHjLTSgxcOO0nrvXq8Xfoc8//3tx5rcBbnMm+JrFrUV6QchDJ5jsO4Gv+mh2fpDFzp3aGnu9tyGpPdgAAj8b2yt7nOZu8Qk8fmTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017060; c=relaxed/simple;
	bh=EHOcVotzmswca7blERgdhlJds1/4RTVDDpMkg2edbZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7tp7WI5maHk+fwVihGKxr+q6pq+3o6MTp2oC1mhGT/IZkym4n2e5UEGz/bLM5NRZt819CEB0ihLoBF4uKqG5rmDP9xMD+Pfdwswmy2L/2RRbhQr//J2/gXC3XCekZ6SejMEb78E7AyhfuTUBmADLQiMo0+s0NBUtbWQIyFmQQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMBeuVE/; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMBeuVE/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69e2266b07fso1926440a12.2
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 15:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785017057; cv=none;
        d=google.com; s=arc-20260327;
        b=au0xDrH78UWwf2LlM7gYtRKqZPzKh+KtUZJKY85c6V6D/jSqenfavWJKWx1yetozT4
         jweCaTrUGX+J5JVP8ydCTjRd5eNU1rHrcxJJdI0q97VEi5aEFU6epZuTT9WTl4/X544w
         CFpJ65292QRD4vOPhTG7YjY7Ctk9ZyHLE1pUj1O4/1iAH+n/Zc6+9u1bijz3/7dcVQBY
         06J+f1MBw/B3MfLbew9AApniBJ9VLx1VjjfhNQnBqSoLhtNuX2d4fQejmueDA/kdvtg2
         B84x+tIxN1gxE4/GEFIEZqiOgjJHqiT9JqnMfm5/vHay/t40S3juYtwXDuANvgFi6dCK
         vVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uV2SviPa1CEOIwcRUlU4A8uP11ac2KavmHu34NNJkAs=;
        fh=VEDd9i8isoaQ6Q0jCi3gLV9qHVglfClSjEnv2E3Ph34=;
        b=HYj+x0ixII5t0qORlfVTzDh6Vf/ImdkNKJvxaFZEGpqZRzRDl9uQ3uJ6rwVEvwP3Wz
         PlySipoFsqIezkcUxb9rJq2K+Nj2qlTEjlR2IVuHyhAj9RXSEZkf4zDEPT8oYbXX5Uxx
         ckwegLajxv8BkyipE+UKsRilX6WlpKi+S/e/pfhcEWc7WtQL02uVuVfOf+TcKsmPmxx0
         ikvXE/9kj18CPxcFF2cbtFQxhUGvH3ewdOlpYaSOWhNXy+Sqa5+kySNf0eICZ3KOxxn3
         g6Zc0O2qz86DsmwxNd/bpwr5naseW28p2RNCB5nolIP0cRzcvAkTrV9GRhD/wNmj863Y
         w/sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785017057; x=1785621857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uV2SviPa1CEOIwcRUlU4A8uP11ac2KavmHu34NNJkAs=;
        b=KMBeuVE/jGj16p7KLl7alI4MgtBldTC3vfzlVONsYaSTOW+5+u+03/+L8xWXcr6XiY
         kiUuy5ENh3v2e2X2AkE17zZARTUQxqvichpJRrj78roNPUEblbtTIUnd4GMk4qyOE2Dc
         S5Q4KrtQWbAMsBX8mN27MuMEhHrbQ6zQpW+JDmFbPRxRRqs+B2Xhee0iy4q5SeP8seMv
         6kvqcR9IARU1hqLs5q+xrWUvk5d0/P8qyZ+/mDECu4g/G9YcK0vHP5zFkSAl3tgbvVC5
         mFmrcGziOC5phTDUz4tj9W2EdFsTVuiqem/xioh/4McdVsykm2IleZJQLwLek4muPXow
         NLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785017057; x=1785621857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV2SviPa1CEOIwcRUlU4A8uP11ac2KavmHu34NNJkAs=;
        b=ZkByesd26omzHUBWhis+hul7b3m9bEnQoWrZ+KQ+n5qF88YZQbS1SNfyO2OTJnqiU+
         eAQ1w9uovDuWWR63CvcxC6BmtsrULzxlPG1Wq7zkbKOJODGBmrxeYdMU+yNLqVC9zI1I
         xEBt07+cA59QnIkXldnJhcIyA62aNm6Hm0VhOQoKncJNboCU9PSftA0jvnlGfUZyQ1Gp
         2e3YM+zuyr4Zaa6DYhoTUqrNM9AiC6OVmtjuNQ+yeW71SEGgDwxRD8AWfzwekHGAiRBe
         +pUAFDAR5cNtvAFGX4NqiltdZbVQwA6Qmw6Ne7Ld0cNotXTc6K3X2QTHUFEpiyAC+tdO
         SKAA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7IXtMY8xh3jouCVxUsPh8+52v+jPBmq9cJz9oNSUc7YZc3GnvwLX1vO+aIP0a3TcXEELuk80J4MtP@vger.kernel.org
X-Gm-Message-State: AOJu0YzC3uNIha0NasSKKpcXXcY0qfYEI9gD3QgcyX3oPLXrq72adhVs
	LjixjiSZgYlYj/v0+r/vOPfZshbWgafF546HxesQ936VfTKKUPx1l25oGPD1XoEWGaCGrr4c8wS
	QBEVAZXX2rJsUtqtfZ9gUtiH9QtsL5t6yhQ==
X-Gm-Gg: AR+sD11rQzglwUuv+tOdkpLA41ySTlaQppol/bwrVP6OqMvVgQTlwDeeKawJvrloM4X
	3g+/sEh3jg/dlbs6E2F5WIRusTamemrWRPoTWZlzBJjY/Zpc6s1wl5x13oT3Ot1osW+4y7MtFSn
	8NZzpjbiFwNEx7+QCYWR38/dTWrVgezrX8GJk/24tFurjprxNQDWkqAZwmm6LHDvBJpB5irqq0Y
	vm9COi+EWLHGEoSD4/k9CrIdKquIqkT756dEbloi3HRgi5oRwRWU2lGqx7uRxpIO4TNi8CtlIf4
	7FywefK/zCtBX7Vye9cWnKI64ZR/UxrHOP0m6xUsEKkGVxjiBLhklfLfpoe5xQLsw2Oj8tg3+ad
	rWveJQDs5VRzs1HFtt5Ly4CBkdJ+G+noyhAwgQTpqR1WFwfgBA1ysnKiS8rXB/okqR+kusVok
X-Received: by 2002:a05:6402:388f:b0:69c:3ea3:6d39 with SMTP id
 4fb4d7f45d1cf-69fc1181147mr1270091a12.35.1785017056792; Sat, 25 Jul 2026
 15:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725215722.9323-1-rosenp@gmail.com> <20260725220058.902C31F000E9@smtp.kernel.org>
In-Reply-To: <20260725220058.902C31F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 25 Jul 2026 15:04:05 -0700
X-Gm-Features: AUfX_myeRw5IGq3UI6EfkOOKMLXsB3UMp4GkbqGL575VjBHuPUCc25zRaWi8oaw
Message-ID: <CAKxU2N-vts0NV9HkfSLA1-CvzgnkAU23z7T4q1EHECfVx+qVyA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 3:00=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The commit message inaccurately claims that PCIe controller 2 =
has interrupts 0-4 mapping to GIC SPI 138-142, omitting the mapping for int=
errupt 5 to GIC SPI 143.
Quite pedantic.
> --
>
> --- Patch [1]: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second i=
nterrupt ---
> commit 61d1b598a171b93e277ba55c095b09aad8291a33
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
>
> This commit corrects the interrupt mapping for PCIe controller 2 in the
> device tree. It updates interrupt 1 to map to GIC SPI 139, fixing a
> copy-paste error where it was previously mapped to 138.
>
> > PCIe controller 2 has interrupts 0-4 mapping to GIC SPI 138-142. The
> > mapping for interrupt 1 was incorrectly set to 138 due to a copy-paste
> > error. Fix it to 139.
>
> [Severity: Medium]
> Is this description accurate regarding the number of mapped interrupts?
>
> Looking at arch/arm/boot/dts/broadcom/bcm-ns.dtsi, the device tree explic=
itly
> maps interrupts 0 through 5 for PCIe controller 2:
>
>                         /* PCIe Controller 2 */
>                         <0x00014000 0 &gic GIC_SPI 138 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 1 &gic GIC_SPI 139 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 2 &gic GIC_SPI 140 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 3 &gic GIC_SPI 141 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 4 &gic GIC_SPI 142 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 5 &gic GIC_SPI 143 IRQ_TYPE_LEVEL_HIG=
H>,
>
> Could the commit message be updated to mention that interrupts 0-5 map to
> GIC SPI 138-143?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725215722.93=
23-1-rosenp@gmail.com?part=3D1
