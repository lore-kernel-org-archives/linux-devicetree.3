Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61FF2D1911
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642137; cv=none; b=FWxD1eMcF1oparQYqjSvjh4s0NKyLyhCB3DUVpovGayIg95FEpyuliDlVNU9ZbEIx3nk1sYQLmvK4mpg6pKBAX6v9dg0OlwpNrWqL2sw/c2CKBu0J4OJe/qrkgLusicaPMMm1r4lbuq0gZvtZgu1ADOKygEwdJtT94LnAaun5rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642137; c=relaxed/simple;
	bh=TMSjSdPy1mFMoDQ0bB+ffUgJOOHQfmPq1+pZYXoAxm8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VrH9H/bD9xShvaq3jJKojc8dQoRVK0X2rgf6D9uoSEjhmsK1MuQixCMWRB0EvBLrwyp+utPacF59P3UH2sjOrT6+/Pz66DvYL2R/BS52BiK1AlhAN3+gZjOBfUCiyy0NT46Pre8USyBGjJjq1anea47h1cRrDKaVVfZRYekrpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1oDSfDy; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1oDSfDy"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so8489b3a.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786642135; x=1787246935; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3QAmNckJusENFi3b8PAoUfCMcO2O6+LVywV/5dZdBLk=;
        b=N1oDSfDyGX5k8skW3yIOFQQi7bAbr19XBgn57Rm2WVnpG7SBd1SGsYziURHPQvMf4D
         rg+aWS2KZ+NUhT+QPwkcUp4kHDhK8qOGS/MRXkV8a2G3VH58yK+IWjZFjzZavGo8+CpC
         zlXpv7r5HaeTgTI+SfUnzYE37i+wCprq9j+9Uz1DilkKZmtodKwl8mAOzfCJH8sZmcf8
         eqZuRQV3GQKCWu2QkXjEQodkPQCy0S0Ivj6lchbvOCLBQAW6wAmQ0/6ydUp7TCOLuadS
         bfJPIkSUYkAvfZGpXdFsTXsqa8CUUTniI8tWjGSVFzfkiu/skeZiJ6gYUiVzPEvGeLtS
         YU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642135; x=1787246935;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QAmNckJusENFi3b8PAoUfCMcO2O6+LVywV/5dZdBLk=;
        b=dqZfB2hP+TkVAZn3qAzZchdqQI4Wu7JB2kJsRnVD+gU0Bl+z3hnheET/kFWfr/Qnsr
         GzTBeIh8pbIniLvecp2A8pbXLg7ThtKg1Wk8PYF/21fZ+Td+uERQGnRFTTgyn+AgzVe8
         C27k9kICO0BIclpEHf4dbwMtUuvC5RBOA/VscFrztyG7FAIogcTHRa1OG4iC5Yp6Hh0D
         Z8OJuB+5AMH4DZFLyPjUloaMBWSoMIJDbgEY9mnvjkZ84IqLw8gMNnYF6a5Hg4zKSsf2
         r40Z3Rbbr//NRfvC0pxZaWVEagO7kstggPJBUTR/L//dbOdoeVfcNPqCDWQghA8MELib
         jv5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqiAGJfNBaPnqtTLxnJjifrfCBa/hUfSmKO9f4zc8BbDHdk/JiXnqs7lZjTIwVZSHmS4/d9HhK/gOAh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8UP71WCmE2ccgdjVefGmmjgVMF/KzLuGIu0gxzASVO0wWMM56
	no8tRL2QwXt+nEh9Pv9OUnZxKqFMlNVVG/0Kb2RbcyLu9DzFLrC0wnI=
X-Gm-Gg: AR+sD12cwxHMnJ1z3huQJK6BbomdGBATBRUqgdaYD+L/FmXtHq4K2zJeh+kj4bu9D4l
	rjcWYjGBRn3BYK4mNWBr+H+MC7493zWekCX8XeO9eQfMl9+w5gjD0E6erNgznHZHQ0vPIXqV+KZ
	ooiKc2SetDUQf4yWrthSmO87nZq2Orn9qlPUetXHTv8lZXqw+qAcXBGV7TedZd2WjpQ54teVD7V
	uwuWKm+jqO/plN5hhD4TdG2dCfHKSJ6LtbF/tohx90BlKVSF3KA5VHNJBOqntq/tQgdPj0h8SgY
	SdZTdLGubiAAbP4zHyfcVlB4xwhlnkLhz+HC8b7rCm9GRUXyRTBkKArEnCpawvmq/a4V8iU5bH6
	JHGPTZN3H/sbqSCmNnMWSVR/zzDZzZhOwZJc+fOaP3jZhcpH9WWeijBEPYXZxm8Q81MOTPIE900
	xN30qoHV6xGd4pg5X8kNNTKIjAZwTbAM07/xfXUNgGi40MDobk5IFv5a4hCBDAid16DIw0+WdsZ
	7UZHLiH48MvFWiRBZZLMCvh
X-Received: by 2002:a05:6a00:44ce:b0:848:6b43:35dc with SMTP id d2e1a72fcca58-84fc767caa3mr8813674b3a.35.1786642134845;
        Thu, 13 Aug 2026 10:28:54 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc5a1bcaasm1251435b3a.29.2026.08.13.10.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 10:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 14:28:48 -0300
Message-Id: <DKNZRYZZVSEA.I0LC7DRPXFK9@gmail.com>
Cc: "David Airlie" <airlied@gmail.com>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, "Conor Dooley" <conor+dt@kernel.org>, "Brigham
 Campbell" <me@brighamcampbell.com>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Maxime Ripard" <mripard@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: add Chipwealth CH1115 OLED
 controller
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1786110720.git.nico.antinori.7@gmail.com>
 <cf9b02d618db4eca88e2d32b4bf779011fcd550d.1786110720.git.nico.antinori.7@gmail.com> <178611771198.882916.15330377894023589629.robh@kernel.org>
In-Reply-To: <178611771198.882916.15330377894023589629.robh@kernel.org>

Hello Rob,

On Fri Aug 7, 2026 at 12:48 PM -03, Rob Herring (Arm) wrote:
>
> On Fri, 07 Aug 2026 11:19:50 -0300, Nicol=C3=A1s Antinori wrote:
>> Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.
>>=20
>> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>> ---
>>  .../bindings/display/chipwealth,ch1115.yaml   | 73 +++++++++++++++++++
>>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>>  2 files changed, 75 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/chipwealth=
,ch1115.yaml
>>=20
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/chipwealth,ch1115.example.dtb: =
display@3c (chipwealth,ch1115): 'contrast', 'first-page' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/display/chipwealth,ch1115=
.yaml
> Documentation/devicetree/bindings/display/chipwealth,ch1115.example.dtb: =
display@3c (chipwealth,ch1115): contrast: b'\x00\x00\x00\x7f' is not of typ=
e 'object', 'integer', 'array', 'boolean', 'null'
> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml
> Documentation/devicetree/bindings/display/chipwealth,ch1115.example.dtb: =
display@3c (chipwealth,ch1115): first-page: b'\x00\x00\x00\x01' is not of t=
ype 'object', 'integer', 'array', 'boolean', 'null'
> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/cf9b02d618db4ec=
a88e2d32b4bf779011fcd550d.1786110720.git.nico.antinori.7@gmail.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.

The patch is based in 7.2-rc6, I am going to rebase it to rc1 in v2
(or wait until rc1 of 7.3, depending on how much it takes me to solve=20
some observations found by sashiko).

Thank you for the clarifications!

