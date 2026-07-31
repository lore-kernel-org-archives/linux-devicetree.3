Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13590404BE8
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492857; cv=none; b=rv9a3w/rvdwH/J2JkSNomuI6dpVYbccI7+eLO+7He/l7NDEw19uMVqK+0a6Gr2H7h6dYxmf32qjJK/ZurmDYrU7rZKl0Ew/MjqbOZpeU6GfPY3HsIj4IQJ/B+qQUJntIB6JiI7xmLBV7XptiTc8Bb2iaVpPeDMGRJW1i/jsTLAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492857; c=relaxed/simple;
	bh=2MrliWXxz1m1usVurvL7PCBzQ0anzMDRtAE8yxPCjv8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bdij5PR4DuJKVF7oV9rGwOdwhA9yeosCKYBqtgJYNBSESW7iS3fNVQsekCWEW9LMTeJFWmwMJsEMcBAAL0LVtn1Rf7nwqgvutBK47Omin7iE8m8cJcLhl3kLM+ypHj3+DEE95XZz6bf3L7g9zWSEr0Mj+jkPtVq5tvGf2gkYj48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+YzpzJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+YzpzJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5291F000E9;
	Fri, 31 Jul 2026 10:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785492838;
	bh=PJ63S5U6+YebaRGh6tGzteT4oIZYn3EekMrWIKfBlBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P+YzpzJ9nJWvVv9weWNLmQuBnmQMKQjde+27CkuLTKQIzURhsWF1AhZ7bdjl1Ozs2
	 1AnFfivi3ehY9v53Zc8oNoRnjC2rlr5uIpxdGMP0wssooL8N85MdUiGnhM4Uc62sUy
	 5ZXyQnQ+C/TawnRy0XfUF1l4yN4/Vu51C2wnlee9hxFAV5V7g7c5pbiXmNOx4Jz1SM
	 KTGKNhU9f7Kb6Ca8USZgygKJc7Ici/gw8ski8zOXLIFXB+FdN50LLkRIDFubb1GHlA
	 MecoaDla3ARJGaNx940H+cX8OIXTyKQRf+Fn003epPsJpRJLDspuCONs/tY8OFsPGI
	 NjWKokHrdD+PQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C
 PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amber Kao" <amber.kao@ite.com.tw>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-ucsi-itepd-v6-2-d25ae12b181f@ite.com.tw>
References: <20260731-ucsi-itepd-v6-0-d25ae12b181f@ite.com.tw>
 <20260731-ucsi-itepd-v6-2-d25ae12b181f@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 10:13:57 +0000
Message-Id: <20260731101358.2D5291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Potential Use-After-Free in `itepd_remove` due to tearing down the=
 IRQ handler after `ucsi_unregister`.
- [Low] The `itepd_id_table` array does not use named initializers.
--

--- Patch [2]: [PATCH v6 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-=
C PD controller driver ---
commit d3337d48cd9d0171c8064301690b4facc2758392
Author: Amber Kao <amber.kao@ite.com.tw>

usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD controller driver

This commit adds a UCSI driver for the ITE IT8851 and IT8853 I2C-based
USB Type-C Power Delivery controllers. It implements the necessary UCSI
operations and uses a shared interrupt line to process events.

diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi/u=
csi_itepd.c
new file mode 100644
index 0000000000000..a639b3d32535f
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
[ ... ]
> +static void itepd_remove(struct i2c_client *client)
> +{
> +	struct itepd *itepd =3D i2c_get_clientdata(client);
> +
> +	ucsi_unregister(itepd->ucsi);
> +	free_irq(client->irq, itepd);

[Severity: High]
Could this teardown order cause a use-after-free if an interrupt fires befo=
re
the IRQ is freed?

When ucsi_unregister() is called, it frees the ucsi->connector array. If a
hardware interrupt triggers right after that, but before free_irq() complet=
es,
the interrupt handler will call ucsi_notify_common().

Inside ucsi_notify_common(), the freed array is accessed:

drivers/usb/typec/ucsi/ucsi.c:ucsi_notify_common() {
    ...
    if (UCSI_CCI_CONNECTOR(cci)) {
        if (!ucsi->cap.num_connectors || ...)
            ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
    }
    ...
}

And ucsi_connector_change() uses the dangling pointer:

drivers/usb/typec/ucsi/ucsi.c:ucsi_connector_change() {
    ...
    con =3D &ucsi->connector[num - 1];

    if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
        schedule_work(&con->work);
    ...
}

Should free_irq() be called before ucsi_unregister() to ensure the handler
is fully disabled first?

> +	ucsi_destroy(itepd->ucsi);
> +}
> +
> +static const struct of_device_id itepd_of_match_table[] =3D {
> +	{ .compatible =3D "ite,it8851" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, itepd_of_match_table);
> +
> +static const struct i2c_device_id itepd_id_table[] =3D {
> +	{ "ucsi_itepd", 0 },

[Severity: Low]
Does this array need to use named initializers?

The I2C subsystem guidelines request that initialized arrays of type
struct i2c_device_id use named initializers, such as:
{ .name =3D "ucsi_itepd", .driver_data =3D 0 }

> +	{}
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ucsi-itepd=
-v6-0-d25ae12b181f@ite.com.tw?part=3D2
