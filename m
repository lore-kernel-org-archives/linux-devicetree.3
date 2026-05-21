Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18552E889C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376386; cv=none; b=tK2dzNQAZq8ty7WZLwjPb4Vx0f70PRp7D5TtlvVRzDjkHyPcLV9gPwz2VYy3Xfu87e/AiaHp33YyuWVfyCOeDEhxe3xqMQp4EXUVIilM9ISOn9T/Q4CBIm7HlLaJFtAAvNOK3isvQ53fyTNkJ630I/pC/pqpECk7jmAm0aLb5cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376386; c=relaxed/simple;
	bh=So2hwSNctjqkRGUlnG8H/y3Km2z/2jUtn0BrgsomQpk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GAXdZuSviOET7TzUB2ZaWaomXD+Pi01LYxMZdwTZtDJ411kXAywpEQpKPR90PT7CaQ+bPm0B6fk3KoquedI3Fm6vN4U2soK4ZC0wEuRBL0I6mVscRxR+Yw+/YkPhNwtIj115jKhWkHNNR9IMdtlLJbxMukqlZRMsz3jUmwA/anY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVpjxITv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVpjxITv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186201F000E9;
	Thu, 21 May 2026 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779376385;
	bh=So2hwSNctjqkRGUlnG8H/y3Km2z/2jUtn0BrgsomQpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UVpjxITv/mcpichzTqUidcFzaS0Y9nG+ArkmrSWTVP3brpYkFkTW8o2N5JtLjfK9I
	 IEeLHbzOvyAOAuu+9nJWHjlsCcUMrZ9ymJ/mJYTcnF6yc/fC8Y/WovZQBpq9/nzMtA
	 xmpN62OD75P8Ydlm5jaBpaAPN2Ej1JtLBhpTKEsP27LR5mUanwQI/EG1BgbpOC5bIh
	 /gT7E4SfviFvivmB7I+nHxD+TYxpSQpC+WzxAX/C9K+ZMxBragwMQPeL66U0KOqkEg
	 09Z8epa1XLnARNMBDlQCO7I4cO27wA6IiF5scB+JLRUcgpzMcW0EgchI7Z5w6Fkr41
	 TFQ+IuF5m9Hfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: serial: rs485: remove deprecated .txt
 binding stub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Sukhavasi" <akash.sukhavasi@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521150748.4816-1-akash.sukhavasi@gmail.com>
References: <20260521150748.4816-1-akash.sukhavasi@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 15:13:04 +0000
Message-Id: <20260521151305.186201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Deleting rs485.txt without updating references to it leaves broken =
documentation links in the kernel tree.
--

commit 40946518dfeaa6ec990f95ec2dc5dbc4c289791f
Author: Akash Sukhavasi <akash.sukhavasi@gmail.com>

dt-bindings: serial: rs485: remove deprecated .txt binding stub

This commit removes the deprecated plain-text binding stub for rs485,
which was superseded by the YAML schema in an earlier commit. The file
now only contained a redirect notice.

> diff --git a/Documentation/devicetree/bindings/serial/rs485.txt b/Documen=
tation/devicetree/bindings/serial/rs485.txt
> deleted file mode 100644
> index a7fe93efc4a50..0000000000000
> --- a/Documentation/devicetree/bindings/serial/rs485.txt
> +++ /dev/null
> @@ -1 +0,0 @@
> -See rs485.yaml

[Severity: Low]
Does this removal leave dangling documentation links in the tree?

There appear to be references to rs485.txt in drivers/tty/serial/serial_cor=
e.c
in the kernel-doc for uart_get_rs485_mode() and in
Documentation/driver-api/serial/serial-rs485.rst in the References section.

Should these references be updated to point to rs485.yaml to avoid broken
documentation links?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521150748.4816=
-1-akash.sukhavasi@gmail.com?part=3D1
