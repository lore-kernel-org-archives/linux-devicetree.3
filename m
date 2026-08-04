Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDE8474263
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860956; cv=none; b=YxRFtEJoukNvrIFbmfCe2/AqKk4R+9WOTUr74N37CJBNaE9kek9Ka+fTeWhD1fTXeo5Sk79wt9zwZOH9SiqXWWcPy4Ok6Qx5YkIyVOVlEm1E+JWJm2viPA4QB1fQvKbAdMH13nlbDi7/d0XtUtWQuLHfTBRuP17582vUBh1XuVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860956; c=relaxed/simple;
	bh=lBKktJJat8a7d3j3lPjbXgFxkvqjpUyC9QtxL/tRvKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cm2A2BSTsJD1d+AXn0jObTM5YIQIhOmiAdT6dATE1xyxmwY3EC+fkEYLoLb6bPdYhmwJBCrz3q6XHOYlg0podd+pEbjw/D7gtGjLwx5jjJ3M3r10amBct4fCuWqHSqc5aPsW1oPcydjVPeMvj6eKNjNXOzUbTyDnI/XAmHSsDpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0ya2Etj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0ya2Etj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D2F1F000E9;
	Tue,  4 Aug 2026 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860954;
	bh=mtFlEdMmc4L5E/PeSArH60DiCAgJ4NqbKTfsnBgZKLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C0ya2Etju97h8VOLn+Tww/lEDaZSRBX+W8AzhPjW8XrtamLe+Xw0wRV2yTVUZcxce
	 wb/byckMSh9xHwhC5njwIWiTl79E6D54iXKiseGKd44LZ7EI1Kkn+GeeFyZIYHODv3
	 ezCU2BUNHGcIBvmOaH7+aXo3U0iiNeCLENX8FDE5MQOqHgedM7VtyHFYDzehdXXHoW
	 32bwizkO06BBQlDmO+QdSG4aDRUCSZcai64OuYh0tWQzQwrgnyQeZy5XdxujLTDQDt
	 Kr1Uit1K6t6D3A3tsmJBam7H9MrTX5eXMU4wkdjzBsEQxlpH3fKmnT7ooTizmRC8/7
	 AAt6n8PMIeZ0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 29/36] pinctrl: airoha: an7583: add support for
 pon_alt pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804160419.3592327-30-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-30-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:29:13 +0000
Message-Id: <20260804162914.94D2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The 'pon_alt' pin group is supported by the driver but missing from=
 the device tree binding schema.
--

--- Patch [29]: [PATCH v9 29/36] pinctrl: airoha: an7583: add support for p=
on_alt pinmux ---
commit 3bd160b8a39fbe75c5055ffadbed0b4b260b0922
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: add support for pon_alt pinmux

This commit adds support for the pon pin function for the pon_alt pin group.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index dc88cbd8746bb..2e145ef5a224c 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
[ ... ]
> @@ -564,7 +567,7 @@ static const struct pingroup pinctrl_groups[] =3D {
>  	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
>  };
> =20
> -static const char *const pon_groups[] =3D { "pon" };
> +static const char *const pon_groups[] =3D { "pon", "pon_alt" };

[Severity: Low]
Since "pon_alt" is now supported by the driver for the "pon" function, does
the device tree binding schema also need an update?

Looking at Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml,
the schema restricts the allowed pin groups for the "pon" function:

        allOf:
          - if:
              properties:
                function:
                  const: pon
            then:
              properties:
                groups:
                  enum: [pon]

Will this cause dtbs_check to fail when a device tree uses the new "pon_alt"
configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D29
