Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B59367B82
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641081; cv=none; b=Afan11rEevQnBRVmosTwKSjFIug2jP8/mOsdha+pPcvXZUVYNHETVm8p3DkwgdiCnDMIM0Ocn+ZI9F0pRjISawx381dmaxpeiZ79hsYiNfxXR/Lop8M26z8EOWJz3n/frroJ6L1XtH7nUk08t1TPtAl3vyrGROO0h9nFyHnLJ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641081; c=relaxed/simple;
	bh=zYkLGz8LaHBK93YkO2Jnjj9bWsEQgkjOFUKZVT/JzAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI+hxhlJUcvAygfFgKDKLFsHUcl+YW6eCiRkz1nhGym/OmheBo04ZZPELD8G2JzVP1Aa7JoJpmXMbf5dCYMClR+BHhGbJyerQC6/OXRim5qvwcoPmE/BHP0aKEBJLiPDVDkV+jFi4G3ivTNqx3jKvFq+oY2A+v5C4Tl7h4RaT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5Lhm869; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5Lhm869"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82131F00ADF
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641080;
	bh=YP4/vqdutrGL/bIDiQeS7YoHp1gn6m6cqt5nZgLyF3U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J5Lhm869HQu58FtN34iRc1wne6hRiuTlPgrfrWHbuo+A1mhESqvWRE0wzoc2dwGGw
	 4X/SG7k3mLtdOcLLAWycyCnltp8wRX6Im5qtxnB8bPxwIGzGDn380nsKCAPyQqaG12
	 yM48WMrb7qa+2yw6S/0CRJV8iOF9lgei1HSor9twe0vXJ3i+HDH1NMOdsbRLpuykEI
	 yyX3szt9SVqwtx3ftG1x5Zan1p/NWM274YzmoARt9EdaXr/ORfR2dvtE1+5UOribjh
	 5PiQU+eoTXzIvuWRyp/nsdOFzn9wfotul2vG1jns5mTslc8fI4xDI4b4lY/ytSIFxt
	 xjugTvl5GjGpQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso16580956a12.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrvxCPWZs2gLX7lEyPDOl6o+3yvIYC1cXLFKsrru0N34noTOF7OognXywEElxhoY//KxZUV8EPrtlBO@vger.kernel.org
X-Gm-Message-State: AOJu0YwaAOqKCq3yjx2Td29HTA3j2bs05XP0WBnpGCe29zrBU4ZGg9U9
	QgG31WIK9PSWTmRcc3gLKkFc5iejJ59kBy1PPTwHoFYfIYY5eOEQqnkFREntiUpYPU371ttch61
	5gReHWnlLv2O4QM/NTyBU3wbZAh/CsQ==
X-Received: by 2002:a17:906:7947:b0:c16:9043:7973 with SMTP id
 a640c23a62f3a-c16b46aa99amr711555766b.4.1784641079148; Tue, 21 Jul 2026
 06:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com> <20260721105448.2109894-2-xu.yang_2@oss.nxp.com>
In-Reply-To: <20260721105448.2109894-2-xu.yang_2@oss.nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Jul 2026 08:37:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKEUMW1UXmWJ8AEpSOjVuc5bL3wKY39Y1XXXNtk967JMg@mail.gmail.com>
X-Gm-Features: AUfX_mw_IZ04gL-ukacdb9lC5_5_rnK0WbBMa0rF554D56JU3H8XgFjQdsZn2Bg
Message-ID: <CAL_JsqKEUMW1UXmWJ8AEpSOjVuc5bL3wKY39Y1XXXNtk967JMg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] of: kobj: export of_node_ktype for use by modules
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	saravanak@kernel.org, andriy.shevchenko@linux.intel.com, 
	bartosz.golaszewski@oss.qualcomm.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 5:51=E2=80=AFAM Xu Yang <xu.yang_2@oss.nxp.com> wro=
te:
>
> From: Xu Yang <xu.yang_2@nxp.com>
>
> of_node_init() is a static inline that references of_node_ktype when
> CONFIG_OF_KOBJ=3Dy. Any module that calls of_node_init() will therefore
> have an unresolved reference to of_node_ktype at load time, because
> the symbol is defined in drivers/of/kobj.c but was never exported.
>
> This causes a modpost build error when CONFIG_OF_KOBJ=3Dy and
> CONFIG_DRIVER_PE_KUNIT_TEST=3Dm:
>
>   ERROR: modpost: "of_node_ktype"
>   [drivers/base/test/property-entry-test.ko] undefined!
>
> Add EXPORT_SYMBOL_IF_KUNIT(of_node_ktype) so that modules such as the
> KUnit property-entry test can call of_node_init() without hitting this
> linker error.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607181651.RnUuV8n6-lkp@i=
ntel.com/
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Rob Herring (Arm) <robh@kernel.org>
