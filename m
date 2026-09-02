Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE7647CA88
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349482; cv=none; b=InaTigqyWkaI7hEzdJJhriUJRq0U+zmHOzX40Jal0N0CCmNDIrPLlVQOcVsS3Sqt16rI6o0DBvbBJv11geN54Xh8L6shJb4sAYWf6s5t5o7wyKB8OrflkD+7VqmwXAcd3m4Jm+DUl4+mCXn3Z7VynlJiK/Q/Nn6CKH+jUPAgC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349482; c=relaxed/simple;
	bh=endY7gqq13GqgdJ/KG96fwZoTEb/cAVplHkhFQcBGpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulA65/xXuX476Qo75EH+pq6fIsOqjVAEtqaRDC1WBHKX5w9pAZxWGaZBcbTakbPrVWjzkoF+hkAm3q/KuyOMvPgdmhoDmYhznTWtkYSQURE0cyPIjy4mphGM2IDqezufmM0FVC3cqUWCjbop0IfZvnZXVLo2WE2RhT5WYvPE2BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-966e7380109so512507241.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 04:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349477; x=1788954277;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d33A2cRSMy14qLiB29N4dNiBSipjfdSlz1gXIdUUM+M=;
        b=iwi/zkdCkdOw1ZBzUoz42JZol9c0qAyHDwG14Uc9Vf3u19HPtbqVCzF6QsnirlXrnd
         CSVvhPMQIWlm0UAiMJrw1CsYYNy5oyWVOIvJCmsLv7Tatxd/2nSTjU83rxBYRqvcTh4A
         w9lbCeI0X2Bhb6XWO0Kjfd56EIAmKnNogfcZ43Rar+GQCcuG2v6WVtb1oUuVE762QK25
         Vle+9G33VESx+0OTU12QjnZ79/ckr9ZTQ9mRblT009b6mzhU9J/VAQvKZ3AYGsrEVgBp
         n55E0BRj/n5lO3wZcDchnjuKHBECvqOl9BWmCqZ9TMq0r0CSRxm0gHA8fBEEz6QOcVXQ
         4Tng==
X-Forwarded-Encrypted: i=1; AKwUvBxBPKY1tNGPY9nZwbTnThBbjS4EGSBDMzxCMM1JJ2uaOpUD1POXsUZm6/WETVkMlza0P2W6c1+7yTnF@vger.kernel.org
X-Gm-Message-State: AFuF++nVyyDRldYc15xYx20PAD3Y/IXPX5jvk/yaJstFAksEP9CKQtgN
	IWHY7ValKDZn7QNpiB+J4ZYQKtVIPomeCqdvCD95pFaNcaovRR7JBSgHARilKRbv
X-Gm-Gg: AYBFou281UWtPb5abPf9+t39SrcS8Ollp9C/HMAWkLMHnov2CN8fc0oF+92hrtbQjxb
	VZWdeTmjPVny/6mBWE500S3GEE1a+33zf0kXEZoVN0068fsNDXZtx5uL8ji4XWAK5eKGbRE9Nzc
	t9J2Va0oPRzU8ubVT9yLAPbeuHMFw6WLKPToWhcGk+ajEggtNUD2/uFEu7vCEUNql0uNb/4gYi+
	Zk6r9yujnl8yIUE+hkMAmcVQxpbF93ScovmT2aRtFmsDdkBiPIHJcUSlsaDalHNklKse/H4Vo2b
	6iIaIDtW3L4w2pogVG1jQqy94F2HLYSPCNPMSNxzYygbaS4dD1uOEAuTxi9yYftdYle3juHHN0q
	+mRlnTrqrCwWmvd7QHgOEWuZXr9ZD5FQ/If/7kh2BpKHhlqQMIk7QTlK44BPJ+bZFGnY96bhxRJ
	rmoE9HDJtwB9qFzoVBVFLrQ5V0ZQm+RxiezTI/AOfzLv38ZbH3Q8hmY/Z8avwslNWViwkfSj8Yg
	+ZW+wld8rp4SGSpZT2j0Y1xww==
X-Received: by 2002:a05:6102:3a0c:b0:789:3bbf:2dd7 with SMTP id ada2fe7eead31-78a1ef4aeebmr1543947137.0.1788349476591;
        Wed, 02 Sep 2026 04:44:36 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1b89ee0asm1595315137.8.2026.09.02.04.44.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:44:36 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-786aca87296so794870137.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 04:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByzLSTlO6cW9mc3/yK9Pw//cm32vXyqk5J59+GPl7RSpT6Me/UaXEB/lojxSrLJXua737zHzhGZpzEU@vger.kernel.org
X-Received: by 2002:a05:6102:2997:b0:784:a169:194a with SMTP id
 ada2fe7eead31-78a1f437b62mr1623913137.10.1788349475087; Wed, 02 Sep 2026
 04:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
In-Reply-To: <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:44:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVstZYufZWdD-ajwg74kU6pWtQE3WueCg-XUw9Lye5DAA@mail.gmail.com>
X-Gm-Features: AcwNN1UuztEnaQfQ-OMWO4Fx0VqCWe7sLpxq0iVHzvAi1AhVOPaRJUxDUVxmfIc
Message-ID: <CAMuHMdVstZYufZWdD-ajwg74kU6pWtQE3WueCg-XUw9Lye5DAA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] reset: Add reset_control_get_from_provider_exclusive()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 13:30, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> When stacking two reset controllers, the upper one should go through the
> proper channels: request exclusive reset controls and use them via the
> reset_control_*() APIs.  However, unlike the clock subsystem, which has
> of_clk_get_from_provider(), the reset subsystem does not offer a way to
> lookup and obtain a reset from a reset provider.
>
> Hence add a public helper reset_control_get_from_provider_exclusive()
> to lookup and obtain an exclusive reference to a reset controller, based
> on the recently introduced __reset_control_get_from_provider() helper.
> This will be used by the R-Car X5H Module Controller driver.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Replace reset_controller_get_provider() by
>     reset_control_get_from_provider_exclusive(),
>   - Add kerneldoc,
>
> v2:
>   - No changes.
> ---
>  drivers/reset/core.c  | 37 ++++++++++++++++++++++++++++++++-----
>  include/linux/reset.h |  8 ++++++++
>  2 files changed, 40 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 8af7cd2e8a5029df..6d4c95b3edb18248 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -1141,6 +1141,7 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
>                                   bool gpio_fallback,
>                                   enum reset_control_flags flags)
>  {
> +       struct fwnode_handle *fwnode = consumer ?: args->fwnode;
>         struct reset_control *rstc = ERR_PTR(-EINVAL);
>         struct reset_controller_dev *rcdev;
>         int rstc_id = -EINVAL;
> @@ -1154,18 +1155,26 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
>         if (WARN_ON(args->nargs != rcdev->fwnode_reset_n_cells))
>                 return ERR_PTR(-EINVAL);
>
> -       if (rcdev->of_xlate && is_of_node(consumer)) {
> -               struct device_node *np = to_of_node(consumer);
> +       if (rcdev->of_xlate && is_of_node(fwnode)) {
> +               struct device_node *np = to_of_node(fwnode);
>                 struct of_phandle_args of_args;
>                 int ret;
>
> -               ret = of_parse_phandle_with_args(np,
> +               if (consumer) {
> +                       ret = of_parse_phandle_with_args(np,
>                                          gpio_fallback ? "reset-gpios" : "resets",
>                                          gpio_fallback ? "#gpio-cells" : "#reset-cells",
>                                          gpio_fallback ? 0 : index,
>                                          &of_args);
> -               if (ret)
> -                       return ERR_PTR(ret);
> +                       if (ret)
> +                               return ERR_PTR(ret);
> +               } else {
> +                       of_args.np = of_node_get(np);
> +                       of_args.args_count = args->nargs;
> +
> +                       for (unsigned int i = 0; i < args->nargs; i++)
> +                               of_args.args[i] = args->args[i];
> +               }
>
>                 rstc_id = rcdev->of_xlate(rcdev, &of_args);
>                 of_node_put(of_args.np);
> @@ -1257,6 +1266,24 @@ struct reset_control *__reset_control_get(struct device *dev, const char *id,
>  }
>  EXPORT_SYMBOL_GPL(__reset_control_get);
>
> +/**
> + * reset_control_get_from_provider_exclusive - Lookup and obtain an exclusive
> + *                                            reference to a reset controller.
> + * @args: Reference to the reset controller provider with all the args like
> + *       reset number
> + *
> + * Returns a struct reset_control or IS_ERR() condition containing errno.
> + * If this function is called more than once for the same reset control it will
> + * return -EBUSY.
> + */
> +struct reset_control *
> +reset_control_get_from_provider_exclusive(const struct fwnode_reference_args *args)
> +{
> +       return __reset_control_get_from_provider(args, NULL, 0, false,
> +                                                RESET_CONTROL_EXCLUSIVE);
> +}
> +EXPORT_SYMBOL_GPL(reset_control_get_from_provider_exclusive);
> +
>  int __reset_control_bulk_get(struct device *dev, int num_rstcs,
>                              struct reset_control_bulk_data *rstcs,
>                              enum reset_control_flags flags)
> diff --git a/include/linux/reset.h b/include/linux/reset.h
> index 9c391cf0c82298a0..09ee47b27f88d3b1 100644
> --- a/include/linux/reset.h
> +++ b/include/linux/reset.h
> @@ -90,6 +90,8 @@ struct reset_control *__fwnode_reset_control_get(struct fwnode_handle *fwnode,
>                                      const char *id, int index, enum reset_control_flags flags);
>  struct reset_control *__reset_control_get(struct device *dev, const char *id,
>                                           int index, enum reset_control_flags flags);
> +struct reset_control *reset_control_get_from_provider_exclusive(
> +                               const struct fwnode_reference_args *args);
>  void reset_control_put(struct reset_control *rstc);
>  int __reset_control_bulk_get(struct device *dev, int num_rstcs,
>                              struct reset_control_bulk_data *rstcs,
> @@ -173,6 +175,12 @@ static inline struct reset_control *__reset_control_get(
>         return optional ? NULL : ERR_PTR(-ENOTSUPP);
>  }
>
> +static inline struct reset_control *reset_control_get_from_provider_exclusive(
> +                               const struct fwnode_reference_args *args)
> +{
> +       return NULL;

As reported by Sashiko, this dummy should return ERR_PTR(-ENOTSUPP)
instead.

> +}
> +
>  static inline int
>  reset_control_bulk_reset(int num_rstcs, struct reset_control_bulk_data *rstcs)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
