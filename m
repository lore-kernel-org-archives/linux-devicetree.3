Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814B134F24C
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788720350; cv=none; b=h6hoJ+Ykj2HngqhjP7j/FOcIssva9SHuI1BEQjlAmZ5bf7sNEzH17ypsR2yr80CYW6nT7kqnSWJZW6mL1//I7m/m25el80/NGLvL6QaJ67PNHxbEwmBhjkax9kgLXqUc3r2x1cT7+O+77+JvIAm9IJNp7Hzq57AcGlevbPwqL5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788720350; c=relaxed/simple;
	bh=xy99FnelZPIq11pUH97Ifyg2Tolqmjoor2xc/NPbisM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lxT0I3E19pmN1gyRJ+howZOzKk5PbIy9mZub6KzqeemIRexTQtrAwYWgaE3rCnvPsU/2qpbFqvmLWV4TcUPo6ebZ5a5KypWWOKQUziMuMXlM2f658pJFZeGmgesX/Ch+e+39V7/QQVRmp7m7+6AW3hrlsf0Xm3HVj63iR/RKKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGd91YjY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGd91YjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88121F00A3A;
	Sun,  6 Sep 2026 18:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788720348;
	bh=ipucYeNOaDaLmtcVxU4yprllEpns2x+cpfydEn8IxMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gGd91YjYwtuibkuLF+vWMje2X2VlKAuLhDDKWWWJo/g+Qrzr1COBaXmTL/GA+mz/0
	 wArMMmUE/2KRZWeFHRb2vYFV8h79oGeSofjhZrYHjeN+nBrZt+YPzBjUO0oC5ymxdO
	 s+hGkP2D0knmjZjyG7dCosIikMqlhZBmRpFQjxUFuUCozrl/y6kytheAgxdL85vpng
	 j0YxwZwg8ru4K6yv7urVUzgIJBpyi4yHrKANW65Gt/NCclAVovZNUdIH9HWzB13zdN
	 XpbAlSbMNoZomoqtBvk2MHTpGBmHQ7G6PbcDHBF5105I7E0eBOwqjOBwsfiPzQaTlC
	 OQTBZ+GdYOx+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/22] thunderbolt: Find Apple VSE capability during
 startup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-11-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-11-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:45:47 +0000
Message-Id: <20260906184547.C88121F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Infinite loop in capability parsing when a malicious Thunderbolt d=
evice presents a config space with a cyclic capability linked list.
--

commit e6dace564d4bffbe73d0c61815b1d55831634e86
Author: Sven Peter <sven@kernel.org>
Date:   Sun Sep 6 18:36:34 2026 +0000

thunderbolt: Find Apple VSE capability during startup

This commit looks up the Apple vendor-specific extended capability during
startup and stores its offset in the root switch. This enables the Apple
NHI driver to program cable information without needing to search the
router capabilities itself.

> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index bf1c192ec10a5..d2832323cc360 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3025,6 +3025,10 @@ static int tb_start(struct tb *tb, bool reset)
>  		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
>  				     "failed to allocate host router\n");
> =20
> +	ret =3D tb_switch_find_vse_cap(tb->root_switch, TB_VSE_CAP_APPLE);

[Severity: High]
This is a pre-existing issue, but does calling tb_switch_find_vse_cap expose
the kernel to an infinite loop if a malicious device is connected?

Looking at tb_switch_find_vse_cap in drivers/thunderbolt/cap.c, the capabil=
ity
parsing loops indefinitely while following the next capability offset retur=
ned
by the hardware:

        do {
                struct tb_cap_any header;
                int ret;

                offset =3D tb_switch_next_cap(sw, offset);
                if (offset < 0)
                        return offset;
                ...
        } while (offset);

If an untrusted external device presents a configuration space with a cyclic
capability linked list (for example, where capability A points to capabilit=
y B,
which points back to A), this loop will never terminate. This could cause a
localized denial of service by hanging the Thunderbolt hotplug workqueue
and pegging a CPU core at 100% indefinitely.

Should there be a cycle detection mechanism or an iteration limit added to
the capability traversal logic to prevent this?

> +	if (ret > 0)
> +		tb->root_switch->cap_vsec_apple =3D ret;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D11
