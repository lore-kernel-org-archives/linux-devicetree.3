Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12073F6C30
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175816; cv=none; b=Cg5gj8Rm2N7AFIL1FYwVjXWyKU5lpSDDWS6pi+xRNNM/BXeqSrwRVHECXpdjYCkmcQ6YMO+R+wGfXANuaS2fb5X2JTXaqx60u2dU+OPwR4/bn4E3RZbNubCtj08CcAziek4WaM5FqgEqGV4oEvKKWLuMcMDN8tw5fVuUCqGjUo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175816; c=relaxed/simple;
	bh=0XmQ6+BWeKu3fLMHE+l330i9JS/9LmzjTJbM+pXzBaE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DTTbyU759Kf9HuPuh1YU6Tj1W2LYgUc3oLmW76+lsvSyZhdvnyUPWNA1kcmPJYwwUDcyA5mZBWPkw1JT44iPjpqgP8ySpefQPXYsUUCSDTHCckqLhAZCHtR1uhbWN0vaoHiZHR5cL7HPyzEAse9noNk+WJxJCG4IK3WLkrhy0xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEGPfH6e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEGPfH6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E4A1F000E9;
	Mon, 27 Jul 2026 18:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175815;
	bh=lwalr3e6YNvYBsf84YNxzgWsKw7F7YlToDyHQEaayD0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JEGPfH6eO0xhuJiWbWl1VTRJn7BhxqYoiyXPA8FoUtJ/WhO0ySNuCz4Qg6VzaVWWn
	 mlFGX6qoH5M07BmoBtsKDgpns7BpE2+TIptNtCCHGD4VSLxkFF/gWR8DEbl3GrmdvJ
	 ziKz1g7WJ6aVdedAfu33NscC2Qz3RDvcBPh5gQnJZ92IqeSIte+cV89aPdSu2EwvI2
	 6Mo9aahS8FO8FiYZgBGpPDwKrrAN/TAKKdlV8yDBGi2UdyZ1FtefDCPv13hBSbWWW6
	 r/Fcj2aAom9rtvAQ1cKG6QRRE6zn10TZ7dLeCcFR9ktZg5KXky7RUbHx4iylj1WsNz
	 H4h40pCp70csA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 27/35] pinctrl: airoha: an7583: add support for
 pon_alt pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727174141.664933-28-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-28-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:10:14 +0000
Message-Id: <20260727181015.12E4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing Device Tree binding schema update for the new `pon_alt` =
pin group.
--

--- Patch [27]: [PATCH v8 27/35] pinctrl: airoha: an7583: add support for p=
on_alt pinmux ---
commit 6152a6dd487be0b56d85b79797eb3d4c570fb786
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: add support for pon_alt pinmux

Add support for pon pin function for pon_alt pin group.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index 9b5c7ea5e5472..7e94dcb3b61a5 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
[ ... ]
> @@ -562,7 +565,7 @@ static const struct pingroup pinctrl_groups[] =3D {
>  	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
>  };
> =20
> -static const char *const pon_groups[] =3D { "pon" };
> +static const char *const pon_groups[] =3D { "pon", "pon_alt" };

[Severity: Medium]
Will this cause a dt_binding_check failure when using the new pin group?

Looking at Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml,
the binding schema strictly enforces the group for the pon function:

          - if:
              properties:
                function:
                  const: pon
            then:
              properties:
                groups:
                  enum: [pon]

Should the devicetree binding schema be updated alongside this driver change
to include pon_alt in the enum list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D27
