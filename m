Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A2A3A8738
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782560781; cv=pass; b=WnhAjxC72iJRoJXrIW91wRVxHk057Op9tDDFxCuVwr5XqF46eragub1DxNKQ3n2S07ZixqK1WFxym5vxw1cnLVrrjopHznzIaJcbdvvXG0uWk9DP+cTaFxJ6PlirNlQMg9dyqQM3NvZtZ5YQTY0SZvnslzm0A7Vd70JFpUm9U/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782560781; c=relaxed/simple;
	bh=8En6EBLgZ/7Y9RpK8TSKSbvJhwFJjH5l3CmH25wjlz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=E4TxhsXjmoyO+gT6ngAOA1JAdiRoRDjoMODX8BdFqKHoorU6x0peNCkNbvn3gkGuxQQqIA0ZJ5TKnfV52eH487Z01THyaBg4YXHwgLs4Y6EM3WVuM34lwpNHP+STDuWebnwclvNvHA27wPVK2N3DgGX6LFv43lnhTFEIwwGaKyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxcvuWdJ; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxcvuWdJ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-519e7faecf1so27481621cf.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 04:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782560778; cv=none;
        d=google.com; s=arc-20260327;
        b=CGaJo8SX3Ih5VfFbV20t+y6xa9vs/iSnrd1l73fyi8LvWd/AtL2sQbLXZ5s1wjD4kZ
         NBHxPSrvULUjZy7nxBlaWyNW1XxjfnoTOUAEAeoNjisyRBJAd65AIPRzFQIiy23mIVao
         o0N7yCeFCYadFabwCov/POR/BXWGRNLJn98tEy2zTluAi0sevKp2cjd143NqmoBDoHJ0
         SoUlSySkTs8DltjtPWA9aEsi3nSXzurBGzagaZCXazTquOnXBwKuhFxMNGKLRonN5Fli
         j0kur4YTo++BHVS0CDlYBA+Qe3NkExCQH07ICKSBkrtumEbEzTtzsK8WbuSksddN7EN5
         z5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MwgmP+AIkwRVqsKscXw1JvJ/gpEoo8Dz+/YrGyTigaI=;
        fh=wyj0XRMCAI5JnE4nazGqGqRd0a5W/PTYe6eZSac/jCQ=;
        b=dm7c829/ZFeQxON8DuLkkgSvCGsCFtmfZPPBDImAUcFfS9KzNB32zO57rNvCKX6kAN
         BpXvjRwBUX6iAJv72rjZsfrGi0EnuaskDeqzOgUxr4clRI5micJW1L8CpaCiLW5ySL8Q
         OPtX6+sCGZoZWarC6OnHWhVK0RDfcAy+2GvuIPgfQkXHceogITCHJZ3R6vRvYZDa1Ekh
         6P/52Av0v35sBEhe1sDI3WMuPK7YeDu3GWZkHfeG/RahTTXDztNNkBzFvT2aeC0m6o0B
         q/U8QW4iAtmWXVRWtvXifElKtm8OeqTvvozWqCgtZ1pLznn98jeV8/QMMFZhTMRLZ4Sx
         OwqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782560778; x=1783165578; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwgmP+AIkwRVqsKscXw1JvJ/gpEoo8Dz+/YrGyTigaI=;
        b=JxcvuWdJwbH60EE0DX+qlY1haRVHiUaE3g7jNcU2S3O5Im0stTOFu3wEmH6kZea8Az
         pXsu8ZPzWsjcqEM0QXIkpIn2kTaF+ujdokGlWZ95wp8xwJ2h8GTLcIgT+bgbVqlYQjv8
         ogWVBN7Je8XOnk5gnCdvyD0OMX86Fc9Q+m7syncRkruK2gMI0oxz/0ZhbpSff4LTWdz7
         u7o8cMNWL3+DFI+QtuE9J0s07tgTl9oEDIyFy2kZTXsbBXfIQ6uxmiWLr3WMCD28gug4
         DjdrA4qtfgtFJUP+nkyp4tBgRJ/wUW9s8UOQURxT/rnyK/Amgjr4D41jLzuwAkDcpxM8
         XAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782560778; x=1783165578;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwgmP+AIkwRVqsKscXw1JvJ/gpEoo8Dz+/YrGyTigaI=;
        b=a7Ze3UeUX+IXj+LaLb2M9ITMoWJlD4aGwofxZqbkwsIR+gpqIZNtXLNgeiLaJhM0HS
         R1h6y49sLl6Sss4lEi0i6aXsZTO2EPYMZS4Yvlm3JjSKPgBy+LqV3phaDcUKwWD+4hd0
         RSZt1N8WvR/AiRcdujYeNkpn246p+TtKDlY5zI4f+CmwKzZWuzdn9BCQYYK4RX8jkP8W
         noqxO/TQfDzWBZhiMGMCkSy7EVvQId2lkQHuB9t/61BRUbp99VBpKIPs0GlSfx3x8Z/W
         puFHNMLrYWuEO3oAVuvTGerQWZzRAR1sEUsUjIYX9ojaqsHWmmNvGhM1+UPNsPjLV+kK
         II2A==
X-Forwarded-Encrypted: i=1; AFNElJ/MRergah4E/dKLsbcyp3xB3ZFBMjDpICB6oUmEDIMbaOFRUrT49SYJN1TbXCmcSPWt0sK/AZNQK17N@vger.kernel.org
X-Gm-Message-State: AOJu0YyJrZHJK2GfG6HZV/fLQh8lViIrWOYEtnq1/0LL0zsGZDfS+dh4
	vgIkq/tumwJcHQjNiRXcYQRtBbuPxALq6vPgeBJ9MPRuZTSzGTK4YhexJz/MpsW20KO7GiaW0Gt
	QK5GrjTMJRzozGLi9Yj50cjzeJb1h1SA=
X-Gm-Gg: AfdE7clAqaEGcmWEb34EjB8BKU9aByLIvrRGTzsRsldZNvnikQV8mETwJQeeI3V4/67
	3LsE7sYf6KIMufBQ4ugvbTKfXoBG8QQkqyA96nJ8MgVyP42mNJvMiuQukfG6DB6sBjB+J9F4bhj
	dPxrzi4iV9iuOh3l1Q4AiBP/lQp6pG+5ZA8mXi5NJjrVy7PlUUFHXydM85CY9vgEpwCfAc/NUm/
	9ekgHOslpsFqNVXVEdIvwchcoAoct7m1WbyP8KwPBImKbupu9jhCUriTjg8dSSw5XDDHzQ=
X-Received: by 2002:a05:622a:15d3:b0:517:6804:3732 with SMTP id
 d75a77b69052e-51a727f36e7mr140180601cf.55.1782560778293; Sat, 27 Jun 2026
 04:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520155525.22239-1-ansuelsmth@gmail.com>
In-Reply-To: <20260520155525.22239-1-ansuelsmth@gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Sat, 27 Jun 2026 13:46:05 +0200
X-Gm-Features: AVVi8Cf_0TYEuahTO65ACteREkW6yB49hgA0BclLT9szcFa1Y79hU8GGc7i-Jso
Message-ID: <CA+_ehUy0tbLR+dt2QQAj94AYCnSvmUgY7OEV9a+ums7WrGe5pA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] thermal/drivers: airoha: Add support for AN7583
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 20 mag 2026 alle ore 17:55 Christian Marangi
<ansuelsmth@gmail.com> ha scritto:
>
> This small series implement all the required changes to
> support Airoha AN7583 Thermal Sensor.
>
> The SoC dropped the Monitor subsystem and only provide
> temperature reading. Some generalization was required
> to at least save the common code with also the help of
> reg field API.
>
> Changes v5:
> - Fix alpabetical order in Documentation patch
> - Address suggested change by AI Bot
> Changes v4:
> - Rebase on top of linux-next
> Changes v3:
> - Property use chip-scu for thermal sensor
> Changes v2:
> - Update DT schema patch to implement dedicated schema
>
> Christian Marangi (7):
>   thermal/drivers: airoha: fix copy paste error on clamp_t low temp
>   thermal/drivers: airoha: fix copy paste error for sen internal
>   thermal/drivers: airoha: Convert to regmap API
>   thermal/drivers: airoha: Generalize probe function
>   thermal/drivers: airoha: Generalize get_thermal_ADC and set_mux
>     function
>   dt-bindings: arm: airoha: Add the chip-scu node for AN7583 SoC
>   thermal/drivers: airoha: Add support for AN7583 Thermal Sensor
>
>  .../bindings/arm/airoha,en7581-chip-scu.yaml  |  14 +
>  drivers/thermal/airoha_thermal.c              | 380 +++++++++++++++---
>  2 files changed, 327 insertions(+), 67 deletions(-)
>

Any news for this series? Can someone check it? Every patch have
a tag.
