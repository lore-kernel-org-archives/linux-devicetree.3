Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13773EDE4A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145164; cv=pass; b=Jy3e7808ESBf7LLk1+jNjhPhs6rW5HnGoKN5nk4D0cr8KELlDMvRzrd6vMahpQ+b5JNFtK3H19Ddv7II09lhgzSp5LnjJmVOR/5XUV53jS/vYtAtqfIOZTVl8D7VREPxBoWVDXoGrSx3DIuPm0jcMMhm8PcUrn+7+W6Bzm2ay5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145164; c=relaxed/simple;
	bh=EWE0XNGnMSCN5TYj/XunOP9DnmXi029IzHnshfp+Alc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSsz/2LFtrYP54gi+IANgr0Nf3J5XviPDfb+H7vAWS+N+yAWbG8tt8vS4DMv+LjfRFwr+KrGkd+TzbKAFyZFJCUSJUu+lnlMvzjmBMWsOSysl3svRC+GXuzt9DERIb20k1GVRZg8iDT/iOPFPibWQ4Eo19lrNqD2aV5gCFqVQcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ibDZ6kVl; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ibDZ6kVl"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81f3b227a4aso29568797b3.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145162; cv=none;
        d=google.com; s=arc-20260327;
        b=QFVPE5PQnEZAJAtyoAoV4pJ2VjuJC4MMv8u3DTBw0M5ibzkmW/lVxI/VEWpdoVlCpF
         zz8PA1zx6yOTNqJD3P8ENcqDOipWXJgRXrYPvuF0zLxF+KX58Xzbn170CuXstbY4nRqz
         GTMVsP/B0xmbzqlFwXpJPezh5lcaz9pczFR7OFgN0Jff3XYEXIo1Vyl1ycwr5iKjzIi8
         0ENxU78trYABSsIMTIr85AdRu0dtnNnYUTCONKucqMImZCpia1+1w9JQU4f2+m+agLZR
         3SmqnXS3XNXGYcnTexcS+74QSkhAFkmuICXkJLILEGsYR1DZOOeokC1b51AayLKmKIU1
         yyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=;
        fh=L/cM2FuX+mUPsWytsboEtp1/BP6ruPUCMVqrOI7B90E=;
        b=Z5uwcv8aCD+s44TDGqrmQ64GYgEEiBwUfs0Kc2NXfF46DSWRdIy/Sd0yhZBoyzbQW7
         NOnje7CKU6fDtAITlVX2itRMyFkuAY+lqM3mk8x+YnPrfy+hHZV2vlY6Tnk/uaTqnLVt
         OY1rsbVKpYWtQ+p2OgQ7Qr0RjY243o9IsyGxHCNum9+bQSIZwFpujXVmfMvZDrj6Y8BH
         Dh+qyNox+uPpqKaOVI3vGCnU76qMZ/UXPCTsvnfXxi5i0uRtkyqvkLShRa/c9GXH4lOT
         41/4fW5H0Y7lKIFTMl4eBIYSsy+YhunSreEC6p5HUO3nIrok2DNnBsE4WbyCHvMBhExb
         vi/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785145162; x=1785749962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=;
        b=ibDZ6kVltxORFb4IhrIIL4xGkLpv1q2atW04Ba3UbV4zbgV7TSCQUoVtRScf0xjI8e
         K3g2vCqotc6xhAv7Ld0HYax3lBMCzxnw0CvLxWTJW9Pm0NBZDZT2DLfY4isdW+MexaNY
         JFTWPtnMXY6jBVnKwnnvk4AgpoMcMVFbMTgs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145162; x=1785749962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=;
        b=sj+oWJJ78mYYET9mTJrcRiSIlT5YDTPXjWquN2HJ+lR7uUS5Tpr/m4/lZ54qN4ZwH4
         HWRK7ErGAMIcGBtNG5YDGbD7OyCsG+os5zcSYJqTYuik9hGbX1si2kHf3rW7/WirkptT
         UzZEjhdmKA0t10xbbSSJGIev0j4yUO181FWt47uTbfTtHUetuSpSs1K/rjm/OKisdMbH
         W7RvdSWG8AXG124wO8SaJO0ZPNvUcWwXIhdb5OnMuU8wY/Ey+T2U+b2EzOdGodGKzOON
         ikHq22Jt7L0oo9kb2dwe+hbhF9ZNidQa17tRA1iR2CFL1AUeU50pu/XD7ZfDzcEacjhn
         Ge8Q==
X-Forwarded-Encrypted: i=1; AHgh+RojJ60BJzF7vcel5Jg3Zy1NdUDYkmH7II6kJCUSSSevFPDB7B2TiRksktmebD7e7hwKZwg8tI/Ft6vi@vger.kernel.org
X-Gm-Message-State: AOJu0YzY61s2QkjYySlu0fm+veKp91XjT6Ej25/Ay57bIiLAhNsrCF2n
	y8qMwxMFV4X1y606CmRZmteaLdjyUIglZMDysKjrYsPyAcDOn7/trkyf4kAMTNPAmip1H97Msba
	joqxZCKfqa7wuES6oL52zXPn+7SExSvT/GCs5oLZy
X-Gm-Gg: AR+sD13goAzQicqcmCIgPUQ3bQFqI1fbEQvtaVHuyK/FdJcm94xZ0mNoGt9ImpY2Lid
	mTFDaFdRxYqR5Lb5na83pMGG2QyhMSzXfGJtktgLX+86k8ssKYZb3vkVoZ9MPpYRXbzm0jtMiDC
	haW7SISWhDkpNcdALVakqS5P7jOTLROJbSbP16qXAvQ9DpJqSNn4vUtW4i5kY1NRR3TdIdt1z/+
	dRB5aYq3vx6tKwCa+4ld7h58AZ+SXZX3IiR87kXUZeysgeIyMmY4H+SqqzUCd7hS90V+xf3TQcp
	s/ZsGLhGEzQNTgA=
X-Received: by 2002:a05:690c:22c1:b0:7ea:809c:2af5 with SMTP id
 00721157ae682-81f69dec43bmr26374967b3.37.1785145161730; Mon, 27 Jul 2026
 02:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
 <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Jul 2026 17:39:10 +0800
X-Gm-Features: AUfX_mwlgcUapUfGZW2dMAil1rMukXcM2pCT5Z8U-x1BRJr_pwTehuo1NL79Xlc
Message-ID: <CAGXv+5Et=hVYp74v8p5FhdrifjUotPbtp8XqyNuCV+NvJ_LMGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] serial: 8250_mtk: honor DT serial aliases
To: Carlo Caione <ccaione@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 3:40=E2=80=AFPM Carlo Caione <ccaione@baylibre.com>=
 wrote:
>
> The Genio board DTs provide serial aliases for all enabled UARTs, but
> the MTK 8250 driver still registered every port with the default line
> number. If uart0 deferred and another UART probed first, the 8250 core
> could still assign ttyS0 to the wrong port despite the DT aliases.
>
> Read the serial alias during OF probe and seed uart.port.line before
> registering the port so the 8250 core reserves the requested ttyS slot.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Matches what is done in __uart_read_properties(),

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/tty/serial/8250/8250_mtk.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250=
/8250_mtk.c
> index e6a56cf54ae0..841d64f6a707 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/pinctrl/consumer.h>
> @@ -521,7 +522,7 @@ static int mtk8250_probe(struct platform_device *pdev=
)
>         struct uart_8250_port uart =3D {};
>         struct mtk8250_data *data;
>         struct resource *regs;
> -       int irq, err;
> +       int irq, err, line;
>         struct fwnode_handle *fwnode =3D dev_fwnode(&pdev->dev);
>
>         irq =3D platform_get_irq(pdev, 0);
> @@ -575,6 +576,10 @@ static int mtk8250_probe(struct platform_device *pde=
v)
>  #endif
>
>         if (is_of_node(fwnode)) {
> +               line =3D of_alias_get_id(pdev->dev.of_node, "serial");
> +               if (line >=3D 0)
> +                       uart.port.line =3D line;
> +
>                 /* Disable Rate Fix function */
>                 writel(0x0, uart.port.membase +
>                         (MTK_UART_RATE_FIX << uart.port.regshift));
>
> --
> 2.55.0
>
>
