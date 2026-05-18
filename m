Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768151ABEDE
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131036; cv=pass; b=UwBwzyQN9XX9dz4mT1BcI11brmz4ORXoTXV7jIhgC4/+ZOefJM7JvsFaS1hrtzDlZoQlqcWJ4t+vd+W2r+794Zww0vzXYniXQtOUECh8WxKaNrUx+zUnOCJ8oF4uHmaxZst4aI8NeWcKVUio5f17BJVG1Y8qvx5MOR4RJ3Sc+K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131036; c=relaxed/simple;
	bh=lkkNE21DnhhtG6iaFAWZoEa4LXoYOovTFQ/2iagHgm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEpBASBK6Zxc4DtJT63qii20a4t1f1hY1XqYxgVTeIjwWxGW4myi4TE8fT4+N1+vasqoFti0PFE/4zZmVJsD6kP8K1yc6Iuhi+xoBVyFYTE9FSV5JUYUDCv4IOHAfsoJvaS7CZwy5pHVIhOOcabbn+sxuz4HYxHLkYiqgrhKO28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTqKYor7; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTqKYor7"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dea20cf21aso2849520a34.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779131033; cv=none;
        d=google.com; s=arc-20240605;
        b=OCLACzLOvA/Jc0rhnfGbFjGYm22ykvxLTA2Dp0mp/64LGgafHgwUYoHMEI52yTdFay
         0PXfizC0bSj7GMd1XWfTS5u83azkuXus/piA+yQfGiy3eXGdUGe9bx+Fgsz1Tw5Dz/Gh
         ULJs6vXg3FOzngoSZyedhCZeIMqGkfeN2MDKkj7gc35+9YdmkGn0xLx/DxjXRGB1fgb8
         Nbs+6rx2tAGtuGVQResD/HOx6/Ef64YDqgxLWJ3FcHSj3lvFDufVkUiP3f8lkRGOoS1/
         WoQQmX5ouyNlIvCHkUX3KcXN3eDI7zc9rGiD4z/7ZxIPE5y3N6mdqE/xsD0lFeWFb18q
         J2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2A8KoSiO9BqS7JQnE+gxI1qQl29fAk9Kx40U1JkRcE=;
        fh=6R0dtpv+EeEUFOsMbcmHJK/w0Ii6RJlQiBVosMnquGo=;
        b=cFA5cQuzpW0W48Be7i7W2lNYWJmZycAUOEuIyBXuPP6fxXlfWcDHDObSe5ykMHYZie
         7hs4mWLhAGv6ff4YE2YegGqCmWPlLvf8WHYE0+Oo81DO2gEH+RXghWjCcDBNFo9A/mE4
         NXaQRIULvfMM2+zFQI8tNrnFuJD4DVrx8RVGwJbCMPW/wNr4qhOPgGnTpjVpVf4Zyv1X
         Q/fg6j3MDrIou1LZ4dGtM7NVL9mrY6W2JoF34YCGIMcMivApx0a5+7k3ZWx6PAZ3EdB2
         O0+o5LSzbzwTqbf0LGKDwkFWq9IvgZlrNHWRF0G1JeGl5986HCTNkPpChJ9WzQQRIfrI
         Sq2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131033; x=1779735833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2A8KoSiO9BqS7JQnE+gxI1qQl29fAk9Kx40U1JkRcE=;
        b=OTqKYor7dC3ehcQkfIjrXWB0auiDQ0kTR938IA5l0EnbV6jGiRoq0asU5ZyPn6jeCY
         rV0VoCX/Pa+jb9dD8TMpzyvOgnJ+PvRrv8BHjgfnOT9oIwYOwlqTVEW6DQFLjJwUXFb5
         ue0+LkSpGSFoRe6kdqzmf1vOTy8CMGeU/JB+ABNQ2EhasAdJcuWNjaHbSfnZSkCpc5Oy
         mSB2sj8cKJntSuOcn8EYp/KE83ILMfpMyyqIZA3lN0TnNwi0P2V6jIofNLhioeNbnv/f
         riDFNA/cL6aha9PCZMsr6pXKwZ7K0nTSA7QeycjsSwGv/xsrcVhNJcvpVo33ZLHxmBdV
         qr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131033; x=1779735833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y2A8KoSiO9BqS7JQnE+gxI1qQl29fAk9Kx40U1JkRcE=;
        b=RhMpSaT/uMI64JbpFo8PYPIlhWBnVeDBBzBSoBN3w/fKDBTLyUoRSFZns9NBH+TldA
         SWvEgpWM93NEU9m9jKTld9RcPAl/NuhH4et2swNiVegOLz+KxJNsjTwGGoB+Kh43Eebr
         LGlCl95Dm5iV6U8W5YxT4GclqJF5uoPDNd8b20OlxIzWc487eog+FVmutMkdBi0Ae/LC
         opmBS1QW42tV2IY994lNAZLx4qJEktF8dH6DJBc2Hi6O36eSkjzNtQnoXB/feIRywQF3
         gBnJN/TOlFhwxqqHOqpQe5btg3q/etKUGcucOzK7ZHcKPaOE1Zmi4sfTGKFoizp3twbS
         l92Q==
X-Forwarded-Encrypted: i=1; AFNElJ/8YtHDN6ImiYdmwkHLPEmBpNEpWEkpjOeZH+xiaPSnGJPa7HgMOBwqLWhOIp4b+mVu2pYrMr4TNa0p@vger.kernel.org
X-Gm-Message-State: AOJu0YzreC6zN7Q1qjNpWEQ8jdlz8yaSmvDSk/IlpANV8eR71hKUI2zW
	a9s2kHRW3eu8mfI5R0l/KDJRcjXjGLwqeh6+VGiYz3x0Gqt6nVj7xwtPXhARk8o/OjWB3Zw/m+7
	wUgufktmt+T31sBQA3D72qxkUA8xLBfg=
X-Gm-Gg: Acq92OHSOLifxTTtutTipzdRhUbUXuySZk2z9QAICmfXkmKmMUOZDKt+v4t91sl4r+6
	4sNU1jjJ6EIGXfdv0bO0TSww8h9wXMafEiIo6I95mrCFTOTcF+bp0jEsld2wF1DF2JaXadDTZPg
	wLcRMQztGGk/Vo99wx7YD5BUGcnZ1//LrpwpDwA/3qtzqYmnKsSKUghXbfrFX5ktXOT7qSDxTqV
	E/zTmRgNBz7KTpYbIomrIvUnRtQ7FOD2OsYUdZ/B3GzYb8TOFGfv4XVDvFuyJbS27l2dSWf5goy
	4cu21HudvOY9FB44FsY=
X-Received: by 2002:a05:6830:6010:b0:7d9:b58e:55f2 with SMTP id
 46e09a7af769-7e4f2bb0184mr11881138a34.24.1779131033436; Mon, 18 May 2026
 12:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com> <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:03:42 -0500
X-Gm-Features: AVHnY4IffK_aHDgASE6NLu5ss9pZv0QrcURDgMI5IHP3klFX-tFlfaWiO0EL67k
Message-ID: <CABb+yY3bJBV4S5na2HCiLCV=1gTFVJEKLp_WmzM=UMJ1PibTWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP
 mailbox controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 7:53=E2=80=AFPM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>
> The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
> x1e80100. The existing driver hardcodes the channel count via a
> compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
> impossible to support hardware with a different number of channels.
>
> Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
> carries the channel count, and retrieve it via of_device_get_match_data()
> at probe time. Switch the channel array from a fixed-size member to a
> dynamically allocated buffer sized from the hardware data. Update the
> x1e80100 entry to supply its own data struct, and add a new Nord entry
> with num_chans =3D 16.
>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-cpucp-mbox.c | 35 ++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpu=
cp-mbox.c
> index 44f4ed15f818..862e45e8fbd5 100644
> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -12,7 +12,6 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>
> -#define APSS_CPUCP_IPC_CHAN_SUPPORTED          3
>  #define APSS_CPUCP_MBOX_CMD_OFF                        0x4
>
>  /* Tx Registers */
> @@ -26,6 +25,14 @@
>  #define APSS_CPUCP_RX_MBOX_EN                  0x4c00
>  #define APSS_CPUCP_RX_MBOX_CMD_MASK            GENMASK_ULL(63, 0)
>
> +/**
> + * struct qcom_cpucp_mbox_data - Per-hardware mailbox configuration data
> + * @num_chans:                 Number of IPC channels supported by this =
hardware
> + */
> +struct qcom_cpucp_mbox_data {
> +       int num_chans;
> +};
> +
>  /**
>   * struct qcom_cpucp_mbox - Holder for the mailbox driver
>   * @chans:                     The mailbox channel
> @@ -34,7 +41,7 @@
>   * @rx_base:                   Base address of the CPUCP rx registers
>   */
>  struct qcom_cpucp_mbox {
> -       struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
> +       struct mbox_chan *chans;
>         struct mbox_controller mbox;
>         void __iomem *tx_base;
>         void __iomem *rx_base;
> @@ -53,7 +60,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void=
 *data)
>
>         status =3D readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>
> -       for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN=
_SUPPORTED) {
> +       for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_cha=
ns) {
>                 u32 val =3D readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD=
(i) + APSS_CPUCP_MBOX_CMD_OFF);
>                 struct mbox_chan *chan =3D &cpucp->chans[i];
>                 unsigned long flags;
> @@ -112,15 +119,24 @@ static const struct mbox_chan_ops qcom_cpucp_mbox_c=
han_ops =3D {
>
>  static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
>  {
> +       const struct qcom_cpucp_mbox_data *data;
>         struct device *dev =3D &pdev->dev;
>         struct qcom_cpucp_mbox *cpucp;
>         struct mbox_controller *mbox;
>         int irq, ret;
>
> +       data =3D of_device_get_match_data(dev);
> +       if (!data)
> +               return dev_err_probe(dev, -EINVAL, "No match data found\n=
");
> +
>         cpucp =3D devm_kzalloc(dev, sizeof(*cpucp), GFP_KERNEL);
>         if (!cpucp)
>                 return -ENOMEM;
>
> +       cpucp->chans =3D devm_kcalloc(dev, data->num_chans, sizeof(*cpucp=
->chans), GFP_KERNEL);
> +       if (!cpucp->chans)
> +               return -ENOMEM;
> +
>         cpucp->rx_base =3D devm_of_iomap(dev, dev->of_node, 0, NULL);
>         if (IS_ERR(cpucp->rx_base))
>                 return PTR_ERR(cpucp->rx_base);
> @@ -146,7 +162,7 @@ static int qcom_cpucp_mbox_probe(struct platform_devi=
ce *pdev)
>
>         mbox =3D &cpucp->mbox;
>         mbox->dev =3D dev;
> -       mbox->num_chans =3D APSS_CPUCP_IPC_CHAN_SUPPORTED;
> +       mbox->num_chans =3D data->num_chans;
>         mbox->chans =3D cpucp->chans;
>         mbox->ops =3D &qcom_cpucp_mbox_chan_ops;
>
> @@ -157,8 +173,17 @@ static int qcom_cpucp_mbox_probe(struct platform_dev=
ice *pdev)
>         return 0;
>  }
>
> +static const struct qcom_cpucp_mbox_data qcom_x1e80100_mbox_data =3D {
> +       .num_chans =3D 3,
> +};
> +
> +static const struct qcom_cpucp_mbox_data qcom_nord_mbox_data =3D {
> +       .num_chans =3D 16,
> +};
> +
>  static const struct of_device_id qcom_cpucp_mbox_of_match[] =3D {
> -       { .compatible =3D "qcom,x1e80100-cpucp-mbox" },
> +       { .compatible =3D "qcom,nord-cpucp-mbox", .data =3D &qcom_nord_mb=
ox_data },
> +       { .compatible =3D "qcom,x1e80100-cpucp-mbox", .data =3D &qcom_x1e=
80100_mbox_data },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
> --
> 2.43.0
>
Applied to mailbox/for-next
Thanks
Jassi
