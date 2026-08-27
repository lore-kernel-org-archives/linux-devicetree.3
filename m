Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F843C769F
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818400; cv=none; b=sPK4FzEq7JpO6iWa7ApZbQqNWdiAczbTU04HNDVBlYhfM9wjJDwowMhqvG59melqbLy7bkWl3O3AMbF/F9l8gO7abRdcdb5HkjxnnN9ASH9f3qQ1cYYnYsTLvvXxmApQ2rlQMr1WFHL5n/Jyh4Mm7HKYK31xAZV+MJq+3/vDc28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818400; c=relaxed/simple;
	bh=QgDQcRWdp7wzmWhqp0NtzJdAzoJJR65LFfz/ib46I0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MtVkuJh/zV//MdpLwDs1yl+Cqm0ywjpTVuicBl5maFH+gBG+tKRY1Cmwwr+42sWpaW6zhPy7mQpUWS3sVigd00yrOmnr4SPYWkesfSotUWuZlA0dUIpVBBF2moNy4GsByUHbAesOGIfn7lmMbItw16l8TDFXyJFOAnrYmEc4EGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QstjoYJO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QstjoYJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE201F000E9;
	Thu, 27 Aug 2026 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787818394;
	bh=pT/wiHe+X4tZF9oyW3Orhb1oe6zNmaZdN1LlG/cruuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QstjoYJOzYr8urVbTp3ylkUVWzQCR/B7gcKTs1Biso9umjoRtwwT8usfqMngv0G8k
	 Qesg1AHM1lr8LKUMs8PEkVi5NprUX0CzSMzrLJXqs4+yIDI6PXf1YYoQyzUhwPDpat
	 iAvx/Xp0TEeNDSNIAzbF8+KoLREiRJsQTV1ngrz8nTg6j1b9HTaGn46hv/F+FFOTUm
	 Y84MxGIhxjcTdEnZPGFNJQCnxl2h9kjTD86qK0pifSioy2Ai8MEiL/C8/SSyua8A7S
	 h9fcb+7GSlc/U1aW2NY7eTz9JDxUNvaA10UGiidR1Ou1vo63frnpCDHsmnxIpF+e5F
	 IGuxfl1/UVVfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] greybus: connection: Add
 gb_connection_hd_find_by_intf()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, ojeda@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260827-gb-uart-transport-v2-2-a03bb1f5fbd1@beagleboard.org>
References: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
 <20260827-gb-uart-transport-v2-2-a03bb1f5fbd1@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 08:13:14 +0000
Message-Id: <20260827081314.6DE201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Returning a refcounted gb_connection for external use enables Use-=
After-Free vulnerabilities because connection teardown ignores the refcount.

Pre-existing issues:
- [High] Race condition between `gb_operation_request_send()` and `gb_conne=
ction_destroy()` leads to a message being sent to a released or reassigned =
`hd_cport_id`.
--

commit 4b0f9446338941774da275dbe57306c7d950598d
Author: Ayush Singh <ayush@beagleboard.org>

    greybus: connection: Add gb_connection_hd_find_by_intf()

This commit introduces gb_connection_hd_find_by_intf() to look up a
connection on a host device using its remote interface ID and CPort ID. It
returns a reference-counted connection pointer to the caller.

> diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
> index f8fda22bc4667..dc9eb49a69bcf 100644
> --- a/drivers/greybus/connection.c
> +++ b/drivers/greybus/connection.c
> @@ -71,6 +71,29 @@ gb_connection_hd_find(struct gb_host_device *hd, u16 c=
port_id)
>  	return connection;
>  }
> =20
> +struct gb_connection *gb_connection_hd_find_by_intf(struct gb_host_devic=
e *hd,
> +						    u8 intf_id, u16 intf_cport)
> +{
> +	struct gb_connection *connection;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&gb_connections_lock, flags);
> +	list_for_each_entry(connection, &hd->connections, hd_links) {
> +		if (connection->intf &&
> +		    connection->intf->interface_id =3D=3D intf_id &&
> +		    connection->intf_cport_id =3D=3D intf_cport) {
> +			gb_connection_get(connection);

[Severity: High]
Does returning a refcounted gb_connection for external use enable
use-after-free vulnerabilities?

If an external driver like gb_softsvc uses this new API to obtain the
connection, a hot-unplug event could trigger gb_connection_destroy(). Since
connection teardown ignores this kref, it will unconditionally destroy the
workqueue and release the CPort.

Can the external driver subsequently access the torn-down connection,
resulting in a use-after-free of connection->intf and resource confusion
of connection->wq and hd_cport_id?

> +			goto found;
> +		}
> +	}
> +	connection =3D NULL;
> +found:
> +	spin_unlock_irqrestore(&gb_connections_lock, flags);
> +
> +	return connection;
> +}
> +EXPORT_SYMBOL_GPL(gb_connection_hd_find_by_intf);

[ ... ]

Looking at gb_operation_request_send() in drivers/greybus/operation.c:

> 	/*
> 	 * Get an extra reference on the operation. It'll be dropped when the
> 	 * operation completes.
> 	 */
> 	gb_operation_get(operation);
> 	ret =3D gb_operation_get_active(operation);
> 	if (ret)
> 		goto err_put;
>=20
> 	ret =3D gb_message_send(operation->request, gfp);

[Severity: High]
This is a pre-existing issue, but can a race condition occur between
gb_operation_request_send() and gb_connection_destroy() leading to a message
being sent to a released or reassigned hd_cport_id?

If gb_operation_request_send() gets the active reference, unlocks the
connection, and is preempted before calling gb_message_send():

    gb_operation_get_active(operation);
    // preempted here

Concurrent gb_connection_destroy() could cancel the operation, wait for the
completion work to drop the active ref, and then destroy the connection
resources (setting hd_cport_id to CPORT_ID_BAD and releasing it).

When the preempted thread resumes, could it use the released or recycled
hd_cport_id when calling gb_message_send(), potentially causing the host
driver to send data to the wrong endpoint or panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-gb-uart-tr=
ansport-v2-0-a03bb1f5fbd1@beagleboard.org?part=3D2
