Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6D3EC810
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218371; cv=none; b=Hw6iZSSE8rGusabLqnHh+03gsoJNwAtrAp2ZSmgSrm6rxt5UkcXxPtoEb82rmetArRXxk3ebCWupjaj2E4Z6FtHzNoHcrRl7tg359lV2RGv7nrgKaxRQ39faJzbqR7XcjONfp2ewMzNmgBYKn+Xuh+vk0Q3UT2tM20MemXYaBbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218371; c=relaxed/simple;
	bh=5JHdcpKHqG/KaF9y4x1pehYTCMsIsBNsPuHSTMzvG5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bhOLXDQltYCX7zoPjyFSOjZgYHqOo7b1p2Kf4UfCSYyV6TMhVP9kOg5U1lcYqHJ9iP1hU/bKDVop0yuOzcwAAc0TQWY3aoYwoHw8mGJRtLH45YHGCYgYX8S6O30N2uhH3IrAQH5V3vTg4mcaaYHQMpaqby+vEU5BlgUpzeGIIbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agd6wEKh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agd6wEKh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E40D1F000E9;
	Thu, 20 Aug 2026 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787218363;
	bh=UWPzF9etUPSc7JWGhiuM558jE3eNmEVXAnyPiQubWLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=agd6wEKhrQ2gvej/Rc7zXtAyQeE/oTrhDwlAdRQWBOAVs9VYsrJCA3WbH5Fh728wi
	 PSVb2+4LAxXVvZlqc+8tKLlada3BXpPSXX8ak60d+vGkBLSBo9QqxjUJbvZsYPeP3b
	 G+saHVHlsTm38xwGxCJcpXRStlIg4y1MMLm7c885oikiSaskIWHZAynbdw1TYN5Gvy
	 OrutcoGoXRk55N7/NIdMKhCFCNX1XMtkxzuMEajNNX4PMhmlObFAYvo3i8AVvaL7kR
	 9O14/hizyC53KwRVoLZPtzjeDT5kV0o/QOK5PbLVQ//EDJEycDtr8WMNB6F3DJTjqh
	 eoKW8yGhX5BMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] greybus: connection: Add
 gb_connection_hd_find_by_intf()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org
In-Reply-To: <20260820-gb-uart-transport-v1-2-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-2-282da14ab7b7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:32:42 +0000
Message-Id: <20260820093243.1E40D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional dereference of `connection->intf` in `gb_connection_=
hd_find_by_intf` causes a kernel panic when encountering static connections.
--

--- Patch [2]: [PATCH 2/7] greybus: connection: Add gb_connection_hd_find_b=
y_intf() ---
commit aaa6e0238f2ed224615968bb243b01db7948e7a8
Author: Ayush Singh <ayush@beagleboard.org>

greybus: connection: Add gb_connection_hd_find_by_intf()

This commit introduces a new function to look up a connection on a host=20
device using its remote interface id and CPort id. The function walks=20
the host device's connection list and returns a reference-counted pointer=20
to the matching connection.

> diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
> index f8fda22bc4667..262161fa4721c 100644
> --- a/drivers/greybus/connection.c
> +++ b/drivers/greybus/connection.c

[ ... ]

> +struct gb_connection *gb_connection_hd_find_by_intf(struct gb_host_devic=
e *hd,
> +						    u8 intf_id, u16 intf_cport)
> +{
> +	struct gb_connection *connection;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&gb_connections_lock, flags);
> +	list_for_each_entry(connection, &hd->connections, hd_links) {
> +		if (connection->intf->interface_id =3D=3D intf_id &&

[Severity: High]
Could this cause a NULL pointer dereference for static connections?

Static connections, such as the core SVC connection created in gb_svc_add(),
are instantiated via gb_connection_create_static() which passes NULL for the
intf parameter. This leaves connection->intf as NULL.

Since static connections are appended to the hd->connections list, will
this loop crash when evaluating connection->intf->interface_id if it
encounters a static connection before finding a match?

> +		    connection->intf_cport_id =3D=3D intf_cport) {
> +			gb_connection_get(connection);
> +			goto found;
> +		}
> +	}
> +	connection =3D NULL;
> +found:
> +	spin_unlock_irqrestore(&gb_connections_lock, flags);
> +
> +	return connection;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-gb-uart-tr=
ansport-v1-0-282da14ab7b7@beagleboard.org?part=3D2
