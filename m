Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BDC446BE2
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543568; cv=none; b=rrAX4/KkSM1Vw3AQxSwhSrg4yBKvbeNhojb+w9TMf+Ql1NaN9bVQmDDjfef1F7IBKbCuL4vbBLuPhlmg148N15E/XrrksfZHqIFyxop6l6HdvJz0K8Rxz0eAbDlmz/IS+wYLaPBru0t3J1yrFPN/1SEC1B5n/hZyFmkXLnOcIM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543568; c=relaxed/simple;
	bh=R65PTaPsgvbDB+S3Q9B47toiU5xEl2Xc9KVg8eNHXJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AfbPi9ec/hydA7+9CBQsBYL0fvBExA6QI390MTP35d+ACA5p2YH7TMta4b+YUK5EvIyjK62t6/HCdrWKjTSWtK2i2Gncp1hST1k4lKFDWdZpP/PtIf3Kkeiu3KPy6MieWND26qrFyZLRJUm8DIIjlwCbS7by/p3BCX9caYHjwfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln+SPFS/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln+SPFS/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770B91F000FF;
	Wed, 16 Sep 2026 07:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789543556;
	bh=1PfFTsIevggcVqLRkFwiay2Rq202T00HsUqDekTEDpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ln+SPFS/pBjcIRe3GZz7svXkHRWa4ND7JTL/drJrX18AS4ROuJW3FPvjaDsqNiB+I
	 tSbWENRqBQkhrXHC/1+ZMggoRVheFNvSMmZD11646PJaMjIEBLNKeWCv3IK9bK9g4/
	 Mja9nYTrpVOPzDQt7yKwyCSECqB7cf7cALXOj2bwK5JbyrRRPTjfRiT/V/Xcw3MUMA
	 GDtsu2a9Klq+gvR7E4DO39twVKwA1k+dhjwf+3Rg/ceuiIGegfbC6QKj7cPEMwMUMf
	 m6QWKa5sa0smP1sHUkpFakGdxQvoDmj1Lx4Lpd+k8z9KTXaXckPUkEqZlxF631aZqV
	 PZsI6qgw6d5jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916070728.1088801-9-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-9-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 07:25:55 +0000
Message-Id: <20260916072556.770B91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] i3c: p3h2x4x: lost SMBus payloads in p3h2x4x_ibi_handler() due to =
status flag race
--

commit a382968ee6c58bbb9c6a6ee774af81bb351f2f46
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: p3h2x4x: Add SMBus slave mode support

This commit adds SMBus slave mode support for the P3H2x4x hub SMBus target
ports. The hub SMBus slave agent can now receive downstream payloads into
target buffers and report receive events through IBI.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> index a3324cc365956..7fdfa79dfeb6c 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
[ ... ]
> @@ -15,6 +17,178 @@ enum p3h2x4x_smbus_desc_idx {
[ ... ]
> +void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
> +			 const struct i3c_ibi_payload *payload)
> +{
[ ... ]
> +		/* process data receive buffer */
> +		switch (FIELD_GET(BUF_RECEIVED_FLAG_MASK, target_port_status)) {
[ ... ]
> +		case P3H2X4X_TARGET_BUF_OVRFL_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
> +			regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				     P3H2X4X_TARGET_BUF_OVRFL);

[Severity: High]
Could this silently drop SMBus payloads due to a status flag race?

When an overflow occurs, this block sequentially reads and clears the recei=
ve
flags for both buffer 0 and buffer 1 via p3h2x4x_read_smbus_agent_rx_buf().

Once buffer 0 is read and its individual flag (bit 1) is cleared, the
hardware can immediately receive a newly arriving SMBus message into buffer=
 0,
setting bit 1 again.

The handler then explicitly clears the overflow condition by writing
P3H2X4X_TARGET_BUF_OVRFL (which is GENMASK(3, 1)) to the write-1-to-clear
status register. Because this mask encompasses bits 1, 2, and 3, writing it
clobbers the individual buffer receive flags that might have just been set =
by
new incoming messages, clearing them without reading the data.

> +			dev_err(&i3cdev->dev, "Overflow, reading buffer zero and one\n");
> +			break;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916070728.1088=
801-1-lakshay.piplani@nxp.com?part=3D8
