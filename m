Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A0344F563
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852033; cv=pass; b=hVgrEPJSoGpL5hwBbL1NiL8mj4GRoUuy3nU++Mx7lE8Hp8J5Zou1wDUPlzKTeXdr+rcz0ZRjCvm5WihU9+2/OTPwtNeco2kIO9Dz7NxPsBu/j69tjWANN7OfuZ8b/WEhdNN54jggiigwsDT7IS2d8079BcSuF8ySyAxFAqF3k9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852033; c=relaxed/simple;
	bh=Fs1edfuHx1in4X4WdK3upBMt8kh7e3INqc862LZOi+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndip085rKvbXhmJ/B6a4EBO8AC2wOQ9aQpvbCIISen3B0WOv47+l009fhCJqDABKhdizNzjLs3azTt/ERXlC4V1cn+B+0CjbbH9XRPuls+yRiP+iFSzD7S8J+iu0+Yr853w/tDT8Fwvq9wbbNF5yPGSQhYpiqTmNAS4cjNqylxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FAbj7CJM; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FAbj7CJM"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67567ff2e77so2541076d50.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 03:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852028; cv=none;
        d=google.com; s=arc-20260327;
        b=e3V9sA6TxWsp4sr7neQXRddJaFSd6vMraAv0GB/+DgkPpOfWEgjl1Jsg9i54S1nZJy
         JvhFpmjhN4brM7AwQfK6v4w3IRPccUTylvXrNyswuNUUWBOeZ9ZOmROiTHnsza2RCUVa
         6oyH9h4goO2MJ81HMnVRmlwreVlHR974EuWpVxkebEV1IAVUnv3Rn8Cws+rxA341fKMO
         itsoSNsV/qtV72RjZ83TOHuBH5gQScdPfVyWWhn5sxI11yw1D5eUGau9GXkBFWWcz8K9
         UPjjBL624rvAKL5yT5Fu7uYGqpy5yRIHAtNxNe43/bqfpVJm9epRyVJR9ZcyxJvBJJ2/
         u9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        fh=rfSWze9Zx2fA5cWqhxttFXFZ8LLZaTXABtQPtGyAyGU=;
        b=Sfnk4AUbFegWJ5ClQuz5s3VFOwXnW1QurMejl2lZDXZ/z8eq6LOsvY7236RJQh08wP
         CQ/vRPzAWOc1BN8Xk5p7giIIej2jigv1pQSXk0DPHiOhk//KCBRqf+I1l2VaVt1zvquQ
         k9DdoaGbiVJSBRAu/mgf+CO/PGDSWbqwFFvPMS4My0sxrNUUsCM2gwNenD/p9h97TEVq
         MUWc5nusbxzJthv6G4UgQg2bf+Y9Ma9VoJEPHSqS3oK3aCzVXgVM3L6Xwep+9HEfZece
         nyNUlVX8R6n+v0XyE7BAYo2cCPjm3FeKqvf4FzHueufbw6bR8OfVcwVdDRcmefzQVG8a
         B4yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790852028; x=1791456828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=FAbj7CJMgab72MHHmfF2iW2O3xqNR2anisVVFAtjFiL8Qh2Pe5qy3EyOrrPogoYZG0
         bHFeHvcH710U1lLtLuR3jI9u641NZFI/ayhqFd8MJYamxB6t0hvhIGtP6038fE2n9VNh
         aGUR74pT+Qqo5mbpidnVPdUTQ8clM7IBi2Ymc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852028; x=1791456828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=1T6SY9/YD//NWMlYr9qhMKX2yPyRFiYKx3EZ1n/9IMsL1n90jKPKt956lj9+pFeUsk
         V/HMYP/mNNd30UBZFx760ZmZVK6CjmTG4i+v7ORxNBDB2dZE6l9tyYoXV7ecqR5NQWQJ
         sdDaYCGjNmoBXSGrN8bcpmlKCeDwThZy56hCGX5ASZQib3qAKbqsTvxZMnjPWUDVfXH8
         K553pb7BQEmX11wRPnio7pWe4Dq/DstH9QJ7EuUMpQlzho7uU2WT4/n7tBgp+MFlSLG1
         zBR6iiA47TxUrh9EAxyeORQbD1kMu7Q5+S6Wxn/rkUp45kSYeNUrAtumkH0eF7XPOmCQ
         +pPA==
X-Forwarded-Encrypted: i=1; AKwUvBz+JhjlRp14jZV9vuHWN/oaCUPwu2xymyxn67+s52+7ITceQCPjLwN+zWqTHpmbMVjfKbRu7z4CzO85@vger.kernel.org
X-Gm-Message-State: AFq9FYKu9Amq92QPcDsbrqlL3HAXQiofUN9cdAcAu6U0Vr3XJv9UDTAT
	5BJdaSZCo5PxOK8OX1R76owULpatQ5oRNmWLjwL6zoF7KrmozF1ECzI3nVaRGQKBn9T/fPrJBgI
	xaWWLVGESV4FgmcaJzT3DhmVPVxuWOCV+D0FNjB90
X-Gm-Gg: AYBFou2RNzTIiexR3fdqxP3u5TEk0pidf4sg41VMjwmX8HL25qBoV1miKM+2ZkkaaVV
	dkGPfBpchjiM3RwuX1OSZlMn+VPKL4I7aWLT5kCXznw1ERwD5yjXnxzc7T6N29KMG9GqALbyyjp
	oJkAYsiXDSpA94J7+Wkz42WkR6ehWMmoo3LP5mHw8SGd6pX/asXHy6b08sHdCPaI1x/m3NPBKGD
	Rik3L7hcYEPzyVvr64DDz9ERuX4MSuC2bH3mj2oB0uVwpK1rY/PciRM8asVUYc+whVgnsaw1x4b
	RtkpB3eH66q6+c5pc8PTcLFvu0I/2u0QjgdXNywQmgC5AXaiokN4KNpJ0UsI9VOog0936eUEhCb
	fbr4shfdiMw==
X-Received: by 2002:a05:690e:4105:b0:676:9954:81ef with SMTP id
 956f58d0204a3-676995489a9mr323421d50.14.1790852028003; Thu, 01 Oct 2026
 03:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916075745.3549953-1-wenst@chromium.org> <20260916075745.3549953-7-wenst@chromium.org>
In-Reply-To: <20260916075745.3549953-7-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Oct 2026 18:53:36 +0800
X-Gm-Features: AclHuK_wafiRDk696txMZ3q8q7Qaz4NsP-wYkipLMPcHq1r5tW6zotnKrD-_NRc
Message-ID: <CAGXv+5GdBUafk6niG-UMDx=z6LJQ6iHAWhDpm1Ly2ce6CQDaxg@mail.gmail.com>
Subject: Re: [PATCH v9 06/15] usb: hub: Associate port@ fwnode with USB port device
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
>
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
>
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Added extra |struct fwnode_handle *| local variables to shorten lines
>   (Andy)
> - Added comment about passing fwnode_graph_get_port_by_id() return value
>   directly to device_set_node() (Andy)
>
> Changes since v4:
> - Dropped unused |hdev| variable
> - Added flags for fwnode_graph_get_port_by_id() with
>   FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
>   ports can be connected
>
> Changes since v3:
> - Added missing fwnode_handle_put()
>
> Changes since v2:
> - Skip assignment if hub firmware node is ACPI node
> ---
>  drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f59..c0a51d9b06a6 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,6 +7,7 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
> @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *d=
ev)
>  {
>         struct usb_port *port_dev =3D to_usb_port(dev);
>
> +       /*
> +        * At this point ACPI nodes and swnodes have been removed by
> +        * device_platform_notify_remove() in device_del().
> +        */
> +       fwnode_handle_put(dev_fwnode(dev));
>         kfree(port_dev->req);
>         kfree(port_dev);
>  }
> @@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, i=
nt port1)
>  {
>         struct usb_port *port_dev;
>         struct usb_device *hdev =3D hub->hdev;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>         int retval;
>
>         port_dev =3D kzalloc_obj(*port_dev);
> @@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, =
int port1)
>         port_dev->dev.driver =3D &usb_port_driver;
>         dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
>                         port1);
> +
> +       /*
> +        * ACPI FW nodes are associated later when device_register() happ=
ens.
> +        * Skip assigning one here to avoid potential conflicts.
> +        */
> +       if (!is_acpi_node(fwnode)) {
> +               struct fwnode_handle *port;
> +
> +               /*
> +                * fwnode_graph_get_port_by_id() returns either a valid f=
wnode handle
> +                * or NULL. Passing NULL to device_set_node() clears any =
associated
> +                * fwnode. It is effectively a no-op here, since no fwnod=
e has been
> +                * assigned to the newly created device yet.
> +                */
> +               port =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNOD=
E_GRAPH_DEVICE_DISABLED);

After AI hinted, I found some dwc3 hardware to test this on.

"port1" needs to be remapped using usb_hcd_find_raw_port_number() when the
hub is the root hub. Otherwise both HS and SS ports end up getting the
same port node, which is incorrect.

Same needs to be done for "usb_of_get_connect_type(hdev, port1)" some
lines above the diff context.

This mapping is currently only done in usb_acpi_get_companion_for_port()
and usb_alloc_dev().


> +               device_set_node(&port_dev->dev, port);
> +       }
> +
>         mutex_init(&port_dev->status_lock);
>         retval =3D device_register(&port_dev->dev);
>         if (retval) {
> --
> 2.55.0.1032.g73a4cd73de-goog
>
