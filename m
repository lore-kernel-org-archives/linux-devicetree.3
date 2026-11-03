Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793724551;
	b=1PeF0Ec7fOjR2x/bY+Lt84cU9/DBlKzZJdXnage38D11GlDaXRHOTtr3OsSHxwe5LudI
	 afU6x3B+QHLNyJrpe+OrDlMeRgQeobZmzx/zgoP3A1dI/nr3gC2V6a8AMK40P6L2TMZN2
	 nHCnguMHYyO1IO11uwPKq9+D/GJou3gmbD7B6OM6nRBUefgavurn3oEre2XTAk7Pq8I+N
	 oJXAAG81FcOuOsbbXX96p65AlmXkAz1lNZ0oHXMYuPdTbIx6GCaOEKcf3nvfnbGtP4B4n
	 egBU04pDmyTbTO0SgZJUy2p3DTDAMrUhPlms2+uN7V8GqvKCzk8UZWlHxin0wnBRqpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
	b=FXPLyt39yYESXYM78WjL425m5SZzZgcee7XwiSHeV2HLD4NVJHatxQoRoRY5ycq5ebLs
	 7+/s6yNtFusExz3KeY9ZO1NrdpefAZOxZooR68lWT5mnOiDdWcOQUWhXscRO0ycYe2aX+
	 03y7Q+jvye8E95mrh091HbOtt3V17TGV/gJ87saUUfb9CGpy9Crw+yWo/zSggMN+jaay6
	 5JdnsrixW4qLhlgoDUxPA+WRbu5cRs4LFIuAcXePsnK4bqWd0MOV5zBAA99tGNocpHjDo
	 8eNz001EAT1V1gbfRKAD5DYakMtQ314TP+GruVQhrx/VaqrgawoeZf4REhQvAehdtBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=k7gshdYH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79501606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79501606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=k7gshdYH
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-706113e92f9so2451955eaf.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793724549; cv=none;
        d=google.com; s=arc-20260327;
        b=ZpbsIX4yK4Pskfs3K3Fs6xjQQseSnnPhDm3BxOFDv3JcduG5F4Z40c8fz4pJ565HSB
         twOCfy+28EXFiaek3AMyf088twaqmQDY7hkutrkS/UHzO+JFzXvw26WiGYg6BzoU5Hed
         e89AQcIlBduzUahpFTjtDL+sNrapLSnemQCzjEKGVsT9ydAhLXZ635m06agRTfuhpTNU
         TG5kgQnT9di//VV4Z7oz9eC20Ne+VIIprMjYrYPKwvbp0jySlIUdhChMZGOCYAu6R4JH
         3kNZqfrSq+Kof05bnQpKtYnowmjuy3R89wLwpdfxKfXHIs6NgsYdEXmbp6kgkK8FNb94
         m5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
        fh=Ep/mY9a8xsyCA+MAU4ykHrQlU+Dzy2Dz9L+V9w6kQAI=;
        b=cyTKP9qK3hJ/IesdCBa8YBMiB6UliUnR7VzQAdXQR5MswBlJXxQO++glkH/ZWlMswU
         rRiUhHzSgbnbX4weHRS95WSqTYVnepWuqQTvB5ryBvD/xF4I3A4B3ZVH43hFXPtoLJ+I
         uhl6AtFC4Jv8MdirRYaLgGrqYHrqmr3KLB96CQWwvmqbJUcdFzPIW7V8dC2waRCQDP1n
         PF3Bdh9vv/OkOV8w4N/LqpqIUfuLAyRfybKGHi8zrMicE+0VYNwswBWv3iefvm5fRkzz
         4xa5KMgVduvkzPY+VhpTnEp0E7ZY8XiwCk6r7aV/MJ9dYv2qcGtvihHlPFUIajRlWdte
         Otkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793724549; x=1794329349; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
        b=k7gshdYHRpP53Q7yeUy/RmrSI399/OaEJ5JN3Z30FYBxMlDUTN0TzBgKJ0pQM2quGx
         1dTOArEXd95tQ6sQA8kOE/pWv2HFyTPcRMPpN6ghfaRcAZL8+7n9mThGi5g3gXK5HNub
         gHk0d/Hixn+fFnFpJEEYM9l5EWUeI4cw0l++x+RESBVSIfxuLJfj5FNl3YPjRdcdTt4+
         +RJP58CeAAnn/+PprgIHVGkedMLUxnmwMjAXLjTjlqzjbZTLUA8//jMGSv5VvUmUPOLs
         pgUTHs8aZ9D6rxKc+Zxe/QD/HeOQzXGK/lLXtb829YCh49Sfql+BxoI3MrTvC/x/W7GX
         CKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724549; x=1794329349;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sza56W2M4G9zJCLvoybSSjbXkV1CKuYe/xyw4UQY9AE=;
        b=dWhU8e1/f28UmnbmN5Bb/yDvd/7ZbFbfN/eqkvXU0E37Ofnamai0Ei8mp8j/6p+gmy
         2oScuwRzKOF3ny+w9p5pRgVNm/7KQQrUD8vuy2vQ9Y9EruFdJqD6ycZmZcyPvyFWe5Fn
         pGmCkEMYwKCI3o46l35Eduglg7HISoH7y0QlJWyvBj8SXXe8l5ORLSNjomNJ4E6t/Xhh
         6p9MgRx3O0lSKrLvEojPHWiVqGr5OVE6vXqo1cyC7MWZq2Ygk9ocd/JjX45l4imzUr2Q
         sbrnDOhe3Gs/LmWdsgHkrSIG9cYk5g+b3votlZjqkAvXVNWt7CKY9LP4hbcOqwclDHrO
         gwMQ==
X-Forwarded-Encrypted: i=1; AKwUvByDbT4idGUpBuQpRhhAZObvB+QTMSkNwI5uhq3x+L1yoTk3hXGFGulljm5O4LzcCpfZ+LaVGGKreMuI@vger.kernel.org
X-Gm-Message-State: APuU4Z8KM3iayT7KftIZ91w/ScnErcZ+aakcZpuptfwhxVXMHA1oldwC
	mUXvZVdeo0xVOT+Nw4MSBqLgsnUQF4dQvZlSDZRR57w4taaOXsWn2YBLawvP/yzQq+aKiqO1byg
	IgMY+wpCfLerO8NwAjn+9n1/aK1+/qmer9U/DKsUQSw==
X-Gm-Gg: AYBFou33X4WV0rV3u/zUVQ4/oc87Dz/GWblQudzkAorz01c02F8V1yaavFwHxo1uddd
	mhf+I2G+/VFkrc/V628Cs4r/d6fIfRTbgSNPy/uSc2reJcOx2C9VYWN/ga4wNqdT12i4pRp7mxv
	7mOws80Btr4CtbCmKP7YWyiga2+zrNg66Etqm1UtIEqusAp0kKIucyOF2hH95BZQwWZth/0p4sF
	4mFwMv17q+r8htSShoYHlkhiUT1+du6l7uWEttCCqOFnwJpkLougH1+03eGV9A9O1/xafakMBhf
	9FBaaqB7KIQu466xIonRnpV99jkCemZ1KbNcDFFMSubJlMOm2RDpPH1YwhYCsBSz5d8ylJ9HckU
	HhlY12VEg/g5VkEJH6rokNYcpbfFDAAUywhIvp1GmRlhreT1sQMaj5z68ZgBcaN7gYzVmtDjdp3
	rfu45bSrIBq8abQKzy0IMVR09jN8r2WzpHSUbbd9HHXG+1iHD/VqbI
X-Received: by 2002:a05:6820:1794:b0:714:b145:a2fe with SMTP id
 006d021491bc7-714f2421901mr8082390eaf.12.1793724549410; Tue, 03 Nov 2026
 08:49:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com>
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 3 Nov 2026 16:48:52 +0000
X-Gm-Features: AclHuK9TxGbcB0r3JV185lrcPtsBTW6TG2IE6iERGadxyS8js5NnWPr-6g7jlJY
Message-ID: <CAPY8ntCZgp4_aaYim__XrmfL=gW-e1dnu2CjBG3n-VzbghYgNQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] dma: Add BCM2711 and BCM2712 support to bcm2835-dma
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Peter

On Mon, 2 Nov 2026 at 09:07, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The upstream bcm2835-dma driver only handles the older BCM2835 SoCs
> up to the Raspberry Pi 3. The later BCM2711/BCM2712 add extra channels
> that support 40-bit DMA4 channels so add support so this works upstream.
>
> The first patch updates the bindings, them patches 2-5 do some
> refactoring and add the support for the newer SoCs.
>
> Finally patches 6 and 7 add the nodes to the base device tree and
> patches 8 and 9 enable it and configure HDMI audio to use them as
> per the down stream device trees.
>
> The series was assisted considerably by Claude Opus 5.5 based on the
> various downstream Raspberry Pi patches and tested on a number of
> RPi5B revC/D, RPi4B and a RPi3B+ all running Fedora 45. Checkpatch
> and dtbs_check pass clean.

cc Phil Elwell as he knows far more about DMA on the Pi than I do.

> Peter Robinson (9):
>   dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
>   dmaengine: bcm2835: Refactor control block handling
>   dmaengine: bcm2835: Support controllers split across several nodes
>   dmaengine: bcm2835: Add BCM2711 40-bit channel support
>   dmaengine: bcm2835: Add BCM2712 support
>   ARM: dts: bcm2711: Add 40-bit DMA controller
>   ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio
>   arm64: dts: broadcom: bcm2712: Add DMA controllers
>   arm64: dts: broadcom: bcm2712-rpi-5-b: Enable HDMI audio
>
>  .../bindings/dma/brcm,bcm2835-dma.yaml        |  31 +-
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |   8 +
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi       |  16 +
>  .../boot/dts/broadcom/bcm2712-d-rpi-5-b.dts   |   8 +
>  .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  10 +
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  40 ++
>  drivers/dma/bcm2835-dma.c                     | 496 +++++++++++++++---
>  7 files changed, 534 insertions(+), 75 deletions(-)
>
> --
> 2.56.0
>
