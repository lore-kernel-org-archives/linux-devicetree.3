Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453FF331215
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625288; cv=none; b=k5YOfvrnm1qACh/HBDSvwulo2aWyo+wqzavb+6yEnjVkjxZjzHEKRXZe55KyZyb3N+Yi+mU/lP98U3x0bOkhAOoFxeiCnQlS8m0ttVJlDfO0PkFcAyMcb+e1i7yiumKg05WjC/R8PXSBCJxOLKaJOIJjXQcR1I0FwShNZIwy0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625288; c=relaxed/simple;
	bh=tDqTIVkiTFJiqijG/Buix533hGKeGeSUnwwj0SyqOLI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=CcoG3q0kGwiKXtYqOQcLaqAxas0IvssGR8NVcwsnogNto8qKAmXNTnU+cgqgty2cqTrNjKTbfxZ93nPPr5aZsvtqGf+yj31nq6/FvxSC5ZoQrvykRtuk4Co2gtP3PeHxYW6kl+WY8pk4WAxHQ25SPtk0/BplUkb8NM1eIUZqKyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E97qNW0h; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E97qNW0h"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so27964551fa.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774625285; x=1775230085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tAuB14KY8sm1zyzklVI5F/AGlzK5GVbWoscRV5zS/Eo=;
        b=E97qNW0huVLJ/+n284XvWtt3sCvNg4OkattEU6Yutp6kVTvf/NB/HCzgfDpmb4pVax
         S7GLu8XQXWSC+t2N45hx0oj/sRI5acPGEb45MiFx2hv+7FJHm8OshO045VxAuYimft5a
         O20biWu2fW926t94O1TzNgseRRfYME4ykiWmU/YCX59Ew2xdAUs3IAlrc0bjGgPisvuN
         igroZeyVmt0EU8Pm5JQo76crJp2tBvY+iUWsXwfnNGxZxisz6k1UkftqCzOIK7Tr7WUZ
         cp1qC1Xr7WP9wgfdV9YLzyF8ffxFy2MTdme5949SkS10+3YRjsj8vW1hgg4zpBJR9BYn
         G/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625285; x=1775230085;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAuB14KY8sm1zyzklVI5F/AGlzK5GVbWoscRV5zS/Eo=;
        b=fe/o/gnTARwGYLvmTnuEYMzdx0C6T/umD5j623wUOSLYJPVbFxbuH0GGb0jUbuJt4g
         3VWdu45h+BNmntDLKSwRHFZiwLEcrDzqDxmm/HMSij7xeInYpy5Ro8400VHf9mFhEi+J
         Zl7XMzIuf33Y0VZgZrvJFDwVrTQBD1JUtqkSsUH/gHewpkTE8Xfo2UhdTUNUOX9jjn+I
         O9QprqhBzof6zjC5B6agE4KaoNCYsQiTe2RkH4q/lGpPrNUAVcrMEOmt+6n/wVe0pZO0
         PC1saAisrecxsejB9YefGSI3Y62GHouLXj3sOM1gtcUcPtPi67XzaV5NmYlKHXiGFjQ5
         6Jqg==
X-Forwarded-Encrypted: i=1; AJvYcCVyGkZeHmxSN1VFrjMBs/P8/VdfB2tb52oBwARkws9ERCFk+b/yahu8Mc8qGz8cISlGW1+QsXy3Ngeg@vger.kernel.org
X-Gm-Message-State: AOJu0YxczweEwqxRrhOC7zPfDXoS3q2iPcGvvzh4lbkSXUybrMeusFsc
	Zo8eZ9EmH0smvfOPt2qmAPr8G25hZVWnmyRzYrmq6MlUZUMBLVOyyOCq
X-Gm-Gg: ATEYQzzCYzshWnJTPBZbwCtsKlIWkHY6bejXibrgJkwkBNwTBh5ikvoqnOa9zAtd3UD
	g0jTRcchpuYtNOWXh56jPY+g3IpIPKlzwp1M/Jv+jEUaR+UVSHqixmBt4rnYp6UnOtIdYuTL21q
	Hkh1UkKQfxaBthRg2eUJ/nDMph3Usy9ILjLzWuCdNfCXBKPLwbDQGUyQsm4QBAmUogEoHpwfDFp
	qhmDH2lEOZwDo8LWYBNYqGSgCngVLcN6XvpEtLpvptAdvcaKzT1Ng3ZOJ0gHyum3EpLkdK98DcN
	calTA2sysKMF+Af+1M+OWdqBG2mEhn5tfF80fAEUrhGF6TwjnoJ3ynVa351m2ayyH4j92Pi6+6V
	HO4Ii57ImGzDBb3RngaGVLk04qzRzV0td8E9/9ZOj6b0nhUdfwrA6+dNXTrmerd/jkSdOXL1zPE
	JxoeMHvOaq/9jGAmP9felFg6vcHbRLJBi9
X-Received: by 2002:ac2:4bc1:0:b0:5a1:355d:674e with SMTP id 2adb3069b0e04-5a2a505c5b6mr2257466e87.9.1774625285215;
        Fri, 27 Mar 2026 08:28:05 -0700 (PDT)
Received: from ehlo.thunderbird.net ([178.137.189.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a0699011sm1439422e87.77.2026.03.27.08.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:28:04 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:28:04 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
User-Agent: K-9 Mail for Android
In-Reply-To: <acafk7munaGrCTK3@orome>
References: <20260223065500.13357-1-clamor95@gmail.com> <20260223065500.13357-3-clamor95@gmail.com> <acafk7munaGrCTK3@orome>
Message-ID: <546AC4C1-CCC2-4C69-B563-B29BC1D865B5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



27 =D0=B1=D0=B5=D1=80=D0=B5=D0=B7=D0=BD=D1=8F 2026=E2=80=AF=D1=80=2E 17:18=
:42 GMT+02:00, Thierry Reding <thierry=2Ereding@kernel=2Eorg> =D0=BF=D0=B8=
=D1=88=D0=B5:
>On Mon, Feb 23, 2026 at 08:55:00AM +0200, Svyatoslav Ryhel wrote:
>> All ASUS Transformers have micro-HDMI connector directly available=2E A=
fter
>> Tegra HDMI got bridge/connector support, we should use connector framew=
ork
>> for proper HW description=2E
>>=20
>> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo=2Ecom> # ASUS TF T30
>> Tested-by: Robert Eckelmann <longnoserob@gmail=2Ecom> # ASUS TF101 T20
>> Tested-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom> # ASUS TF201 T30
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/boot/dts/nvidia/tegra30-asus-tf600t=2Edts   | 21 +++++++++++=
++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>
>Two things about you commit messages that I have to fixup every time:
>
>  1=2E caps after the subject prefix

Prefix ends with ':' which does not imply using of capital letter as '=2E'=
 '!' or '?' do=2E Linux documentation does not regulate this=2E

Even more, examples use lower case

[PATCH 001/123] subsystem: summary phrase

>  2=2E wrap commit message at 72 characters
>

The body of the explanation, line wrapped at 75 columns, which will be cop=
ied to the permanent changelog to describe this patch=2E

The commit message is wrapped by 75 characters, as linux documentation req=
uests=2E

>Both patches applied, thanks=2E
>
>Thierry
