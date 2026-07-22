Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEE1148850
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712131; cv=none; b=d6jp+D9HKVj7W815cDznpjlm5cX2dDUqhsU/vdb+laNPElK+HTmLZa673OPZFGRgr6XIoXZ357Qh3kTQnRRmJ/1AqMVtDG0zDomX4QZjjZeC01I8dD4oN06fhf8Uw5F1M+crp3rsF6rRLpky1cgNOjcAKBnfZOBbhYIpXB9sNaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712131; c=relaxed/simple;
	bh=ZQJtCmzrb0IyF9LYgGtLrsXxFDeXdK9wbk48b8X9duE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u7N8riQrfu1q+GP+qkzsi19rtrnRrW0fLokGlGtohUZDeMRCEfhPa4PrF7/YXLndnrVYN12vruzhdEYqR1pYzDoHcB0TnoXLMRsF1kxj5iYj69n+nbX1zUWL5uriFSd9tbMVmbGnp6xFwR7vmuq+MyXiwuAZWA4fJBtKbjxF9Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9Dv+s+F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9Dv+s+F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B24D1F000E9;
	Wed, 22 Jul 2026 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784712130;
	bh=jRjxrmLIfE032W1CimkQkZ6irPmlx9NgsrWY7RC39ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K9Dv+s+FCxu98ec5JpCoIWDl5PXUIrnWeOuwxuj9gegG7cOdV5FOzi7WcxfEgzZv4
	 QO2edAI4uNWMJv2YrFEJg02pVfTcEs8H1jVKVXFaWp0kWcs5ujZcfU0FNkKagwBh79
	 HG1mqw10Y+Z+2PUcQs6zOC62uX5DbjfB+lKNyYYUW8IJmlEaaId2moJOezIHWL2Wfr
	 7KhmNOYhsDjT+BJp1SCpceNIbXWazFBbgpVC9/d6YBSPVEU9SZ/CRue/50JdGY2C51
	 RSuDkZ0EDTcUTuWW+ANhMTAbrY7lTVwcoCtRgjsvDG5ITV0a3qGVstArj8UUsTSSwe
	 eja/+/T87+8og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: add driver for ITE IT6625/IT6626
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260722-upstream-it6625-it6626-v5-2-387e7584f2c9@ite.com.tw>
References: <20260722-upstream-it6625-it6626-v5-0-387e7584f2c9@ite.com.tw>
 <20260722-upstream-it6625-it6626-v5-2-387e7584f2c9@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:22:09 +0000
Message-Id: <20260722092210.1B24D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] IT6626 C-PHY support is broken because the endpoint parsing logic =
forces D-PHY, causing C-PHY device tree configurations to fail probing.
- [High] Concurrent ioctls racing with remove() can schedule delayed work o=
n freed memory.
- [Medium] Ignored return value from v4l2_phys_addr_validate() allows confi=
guration of malformed CEC topologies.
--

--- Patch [2]: [PATCH v5 2/2] media: i2c: add driver for ITE IT6625/IT6626 =
---
commit bfb7e6cd73b65d97c7af09ea2f5bbbecc5bfd67b
Author: Hermes Wu <Hermes.wu@ite.com.tw>
Subject: media: i2c: add driver for ITE IT6625/IT6626

This patch adds a V4L2 subdevice driver for the ITE IT6625/IT6626 HDMI-to-M=
IPI
CSI-2 bridge chips. It supports EDID read/write, DV timings detection, and
exposes an HDMI CEC adapter. The bridge is configured over I2C with HPD
control via standard V4L2 operations.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> --- /dev/null
> +++ b/drivers/media/i2c/it6625.c
> [ ... ]
> @@ -1167,7 +1167,7 @@ static int it6625_s_edid(struct v4l2_subdev *sd,
>  		pa =3D cec_get_edid_phys_addr(edid->edid, edid->blocks * 128, NULL);
>  		if (pa =3D=3D CEC_PHYS_ADDR_INVALID) {
>  			v4l2_warn(sd, "invalid CEC physical address in EDID");
>  			cec_phys_addr_invalidate(it6625->cec_adap);
>  		} else {
>  			v4l2_phys_addr_validate(pa, NULL, NULL);
[Severity: Medium]
Does this code ignore the return value of v4l2_phys_addr_validate()?

If a malformed EDID provides an invalid CEC physical address, the validation
might fail, but the code appears to proceed and pass the address to
cec_s_phys_addr() unconditionally. Could this allow the configuration of
malformed CEC topologies?

>  			cec_s_phys_addr(it6625->cec_adap, pa, false);
>  		}
>  	}
> [ ... ]
> @@ -1627,7 +1627,7 @@ static int it6625_parse_endpoint(struct it6625 *it6=
625)
>  {
>  	struct device *dev =3D it6625->dev;
>  	struct v4l2_fwnode_endpoint endpoint =3D { .bus_type =3D V4L2_MBUS_CSI2=
_DPHY };
[Severity: High]
Is IT6626 C-PHY support disabled because of this initialization?

By explicitly setting bus_type to V4L2_MBUS_CSI2_DPHY, the V4L2 fwnode
parser might strictly reject C-PHY endpoints during probe.

>  	struct device_node *ep =3D NULL;
>  	unsigned int max_lanes;
>  	unsigned int port;
> [ ... ]
> @@ -1659,7 +1659,7 @@ static int it6625_parse_endpoint(struct it6625 *it6=
625)
>  	ret =3D v4l2_fwnode_endpoint_alloc_parse(of_fwnode_handle(ep), &endpoin=
t);
>  	of_node_put(ep);
>  	if (ret) {
>  		dev_err(dev, "failed to parse endpoint: %d", ret);
>  		return ret;
>  	}
> =20
>  	if (endpoint.bus_type =3D=3D V4L2_MBUS_CSI2_CPHY &&
>  	    it6625->chip_type !=3D IT6626_CHIP) {
[Severity: High]
Will this C-PHY check ever be reached?

If a device tree specifies a C-PHY endpoint, v4l2_fwnode_endpoint_alloc_par=
se()
would likely have already returned an error because the driver pre-initiali=
zed
the endpoint bus type to D-PHY above.

>  		dev_err(dev, "IT6625 does not support C-PHY, only IT6626 does");
>  		v4l2_fwnode_endpoint_free(&endpoint);
>  		return -EINVAL;
>  	}
> [ ... ]
> @@ -2169,7 +2169,7 @@ static void it6625_remove(struct i2c_client *client)
>  	if (client->irq)
>  		disable_irq(client->irq);
>  	else
>  		timer_shutdown_sync(&it6625->timer);
> =20
>  	cancel_work_sync(&it6625->polling_work);
>  	cancel_delayed_work_sync(&it6625->hpd_delayed_work);
>  	debugfs_remove_recursive(it6625->debugfs_dir);
>  	cec_unregister_adapter(it6625->cec_adap);
>  	mutex_destroy(&it6625->it6625_lock);
[Severity: High]
Can a concurrent ioctl race with this teardown and cause a use-after-free?

If VIDIOC_SUBDEV_S_EDID is in flight and reaches the end of it6625_s_edid():

drivers/media/i2c/it6625.c:it6625_s_edid() {
    ...
    if (hdmi_5v_power_present(it6625)) {
        it6625_enable_hpd(it6625);
    ...
}

Could it unconditionally schedule the delayed work after it6625_remove() has
already completed cancel_delayed_work_sync() and the devm-allocated driver
state has been freed?

I noted the commit message mentions this residual risk is similar to other
peer drivers and was discussed in previous versions, but could it still res=
ult
in enqueuing a timer on freed memory?

>  	media_entity_cleanup(&sd->entity);
>  	v4l2_ctrl_handler_free(&it6625->hdl);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-upstream-i=
t6625-it6626-v5-0-387e7584f2c9@ite.com.tw?part=3D2
