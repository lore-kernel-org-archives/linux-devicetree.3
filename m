Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A942E2286
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102217; cv=none; b=IuEr3e26+pupJYWbefrS0I7Ts9MlrLECpX1yBi/GKrjSY26chQz5Ii13H9n3Rtrqeub9yOhT9mypQ0T5GZgx5InAp6tQP4FXWo1eeML6jNYENR8AVslEFBiZJgaSvQEXlE/zKBUXW8tH0QOv/2izAe0fpGsfGQFn6HEEem3J9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102217; c=relaxed/simple;
	bh=ZfHIdYTtmFT6RTrcSTLuIUPUxGei08AQLeM5kM56Hbs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F9TLWmV+47Pc84v/dSMRn1pmBL7CnqMVy8KjEFstYNeyACkmJqHcFcjeA5gd9mJbPN9iqUCcpWyWVwPbKUBhg48qM4v5vsBD5xK+k3Sr9GCWBmgJf0c8ibvL+buzbSP0YChs7Vmz4tkyDDYGvb5geeKPJKwAdQmo7o7BdLST3Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bI0JB6hn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bI0JB6hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73E51F00898;
	Sat, 30 May 2026 00:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102215;
	bh=cjjBdll82J5T2Dq2J0DGgyJcXIyO7JPMN7eXdRbIrIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bI0JB6hnGiHsC32VEFulqdkStMqBbIUXuIZr31P2g4im/FQIp7zoo6pS760PmiV6A
	 Ur/+WvuClWvj46Adrj9GInIbhnytMDOp8uniYzyuv2TXWWz77WgISliyGbV0Qel9CG
	 MpHWyGcKR3mPA/x/pOE4UTiQk/Xuaziaw7LW0T6SYFdhKOgOo6szIPxY6SQ+NeBbLy
	 S+zEzI/B7vRapSKa7J3m2HTnx2kAnp3hTKJfIoPY3phxfBw9tiIn+ZeCDaD5UJ0IbV
	 sfs4MdSXT6fb/TcBPTtV49SeLtEapisKhpP0ZPDUp0pHumfiKh2qSeg+ZmwLvM4ebe
	 Kb9UP3phusxDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 8/9] net: dsa: lan9645x: add mdb management
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527-dsa_lan9645x_switch_driver_base-v6-8-4d409ae64f3c@microchip.com>
References: <20260527-dsa_lan9645x_switch_driver_base-v6-8-4d409ae64f3c@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:15 +0000
Message-Id: <20260530005015.B73E51F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `mac` array on the stack in `lan9645x_mdb_update_dest()` is pa=
ssed to `ether_addr_copy()`, which strictly requires 2-byte alignment.
--

commit 96e0068b5c80a051af89df2214f42e04d526551d
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
net: dsa: lan9645x: add mdb management

Add support for dsa mdb callbacks. L2 multicast and IP multicast is
handled differently. IP multicast stores the port group mask inline in
the mac table.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c b/drivers/=
net/dsa/microchip/lan9645x/lan9645x_mdb.c
> new file mode 100644
> index 0000000000000..0ba3e0974dc08
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c

[ ... ]

> +static int lan9645x_mdb_update_dest(struct lan9645x *lan9645x,
> +				    struct lan9645x_mdb_entry *mdb_entry,
> +				    enum macaccess_entry_type type,
> +				    struct lan9645x_pgid_entry *new_pgid,
> +				    u16 new_ports)
> +{
> +	struct lan9645x_pgid_entry *old_pgid;
> +	unsigned char mac[ETH_ALEN];

[Severity: High]
Could this stack variable be placed at an odd alignment by the compiler?

The mac array is passed to lan9645x_mdb_encode_mac(), which uses
ether_addr_copy() to copy the MAC address. The ether_addr_copy() function
strictly requires both pointers to be 16-bit aligned.

On architectures without CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS,
ether_addr_copy() casts the pointers to u16 * and dereferences them.
Dereferencing an unaligned pointer can trigger an unaligned memory access
exception and lead to a kernel oops.

> +	int err, pgid_index;
> +	bool cpu_copy;
> +
> +	old_pgid =3D mdb_entry->pgid;
> +	lan9645x_mdb_encode_mac(mac, mdb_entry->mac, new_ports, type);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-dsa_lan964=
5x_switch_driver_base-v6-0-4d409ae64f3c@microchip.com?part=3D8
