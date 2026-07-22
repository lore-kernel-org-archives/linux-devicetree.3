Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B34233D9E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764567; cv=none; b=I5la5DO5ApU8ex0lN52R6fP4MsNCmHhn4X0+LZuPJ0doKM43gIHa9vkbcttKJq13pK91FJxbcd2jIN5upt+LDln67D2oeWjei7eAstL0/Y9Z50lYCNGmNlSySyxUIicaiH1lOxXkbF1FTNPlvdJyl63CfPXsOH3mLFwhOV2TTXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764567; c=relaxed/simple;
	bh=3FE6diUJ8CvLGgl+yBQAq62zkEa2+5kBog9QfySiARg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gE1gJFCN7KaB+rGpGdSRMePkiEhqf/f33EmxhP75Hd/5/D1hly4mlcZq6fmYbk2wamvZa83p6GLEx4H8gIt2CAfcpvLEqMGTgbnbHkVkKHAdSq/5ItUOt0Er9IkO33j7r8MZNJV7MiDHtgBQmKFCIOsnwQALXaKSg+uV6tFhRvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuMMgrIX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuMMgrIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D813A1F000E9;
	Wed, 22 Jul 2026 23:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784764566;
	bh=CEzOYGeM6cYSQkjLgIA1vYGp5PS0fwdcjKLLCk4OKDg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YuMMgrIXa0s14GbMMMXrXQ++fAof8fDjhS06AGeXVk6cHL55ZTNRt00jZt/dax4IF
	 PMXCXor5O5KvtzwJTQzimHdekbIvIPI1ZgLfdKINIR8ENxPtb0aEHcQQndvtCCcyfD
	 jlhEtYV3YmZDOQs0aaCZdwZ+hPd83y7rUEWBwp7u468jetcShmJm/CPfQvmC1jMIg7
	 srpPd+Rcb1adQZcoZVp6BE7mI+WlLYtTL61Nt7zS3gKuAiF+fJjWTfu5E0E0fX8cdP
	 t/GFz3bnwx4MkVm0e6NkDij55z8agXlEENNWeDgLXmMMnHgIt7vsWbQ/xccaC6YM/I
	 i8zKgQY9McdCQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 6/8] ASoC: SDCA: register
 SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722234221.884765-7-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-7-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 23:56:05 +0000
Message-Id: <20260722235605.D813A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing string mapping for SDCA_FUNCTION_TYPE_SIMPLE_JACK in get_s=
dca_function_name() causes ACPI enumeration failure.
--

--- Patch [6]: [RFC PATCH 6/8] ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMP=
LE_JACK in class function driver ---
commit 9826e21715fdea11e3c55eac5f9ed509d841b1d2
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver

This commit adds SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function
driver's auxiliary ID table so a SimpleJack auxdev is bound and enumerated
as an ASoC component. It also wires up set_jack for this function type so
the machine driver can register an ASoC jack against it.

> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_c=
lass_function.c
> --- a/sound/soc/sdca/sdca_class_function.c
> +++ b/sound/soc/sdca/sdca_class_function.c
[ ... ]
> @@ -621,6 +622,10 @@ static const struct auxiliary_device_id class_functi=
on_id_table[] =3D {
>  		.name =3D "snd_soc_sdca." SDCA_FUNCTION_TYPE_RJ_NAME,
>  		.driver_data =3D SDCA_FUNCTION_TYPE_RJ,
>  	},
> +	{
> +		.name =3D "snd_soc_sdca." SDCA_FUNCTION_TYPE_SIMPLE_NAME,
> +		.driver_data =3D SDCA_FUNCTION_TYPE_SIMPLE_JACK,
> +	},

[Severity: High]
Does this code also require a string mapping for
SDCA_FUNCTION_TYPE_SIMPLE_JACK in get_sdca_function_name()?

Looking at sound/soc/sdca/sdca_functions.c, the switch statement in
get_sdca_function_name() lacks a case for SDCA_FUNCTION_TYPE_SIMPLE_JACK,
causing it to return NULL.

When ACPI enumeration calls find_sdca_function() and encounters this
function type, the NULL return value causes it to fail:

sound/soc/sdca/sdca_functions.c:find_sdca_function() {
        ...
        function_name =3D get_sdca_function_name(function_type);
        if (!function_name) {
                dev_err(dev, "invalid SDCA function type %d\n", function_ty=
pe);
                return -EINVAL;
        }
        ...
}

Because acpi_dev_for_each_child() stops iterating when a callback returns a
non-zero value, doesn't this error prevent the SimpleJack auxiliary device
from being registered and silently abort the enumeration of any subsequent
SDCA functions on the same device?

>  	{},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722234221.8847=
65-1-srinivas.kandagatla@oss.qualcomm.com?part=3D6
