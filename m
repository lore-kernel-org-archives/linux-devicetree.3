Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E78357D08
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274133; cv=none; b=kuUudiFXudk88bSTQPSYtjkOlI9QaZvFWs1WBH2Kriff59UV9MHhmPjybtCS0PgaYnoHGDoScbiHUelWftLvdur7DqGtLvoDKZMSiHmVM4pLQWs9pVf2eoJ5oQZM4PUYfU/HS5wnPoYGojdKAO+A6wnKQz0Hqat8kZLAPttxLrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274133; c=relaxed/simple;
	bh=RWVN/JMtGl5gb6m6yMJBGPsKu4w8fw6oeCXD6lI+c4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGUVJiRVJlo51KkNtGbR5HQszc6yRQ8y6i0bRh78SKc9sDXbI0Oq3W2Mfv1ZrQaHguVieZ+jiLQ2gRfTWGpwM+oVVfQBlQJBCHw08uY4j8s+utREKtDWmIy1WwgdwHB+SFOcsyU65VGt5e2e5NyVq16BzVz7XhVO2j8YH7u5YUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/hP15lH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/hP15lH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A86C1F00ACA
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781274132;
	bh=RWVN/JMtGl5gb6m6yMJBGPsKu4w8fw6oeCXD6lI+c4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c/hP15lHiBc9SIm41VlmCEb5//KE76RKxmVs6mvfDZiEkXi/NMtUvWsuN7uhe/sQO
	 UtNAcUaGqvIm5NaOYVUoIxV3XqiCYLoaqsGTaBNeCrUU2jqtMms5mD2oxqBzLwHdLo
	 kXuT8qAI8DwAC25JygxUKuv6H4Y0xVfD4oNKn4miOo2BhcJTODdbKstHtBioSRKCYI
	 fXMmMaV1e8TMA4r3i1dpKa6mVdtSAMtqX/KzunLZ2vhWWI4lI8Z+xfpfMx/fD02WKj
	 kvvT6JsO01LYNgQA9+QUa24lDVNF8Hu/kgxwTtANvqXiuVQq0jCdn4e6hIg1/bhTGS
	 TW/LJa1WfGp8A==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-69e7dfcea4dso1230478eaf.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:22:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+symq2bbJCY0y9cN/lFkyYZe7nHaSMbbchejxF6vZWl4flqvMbVQSgLZdgyh1o/LXK1U1HLsRaDG0m@vger.kernel.org
X-Gm-Message-State: AOJu0YzCPREPYwxPo9iDWGqs4DnbKFjbFVSSXI6wxDD4zXZAY4wMXX8x
	VG56mdmcBHQsUbQACz6jNBBqrcxlFJRWzZco0HAGFZTOXdUF1GZG1IxxWcxgDar1aPailDK8Aq2
	ajvxco9QXvVHtnGAb1pKxVKr8D+8RoFw=
X-Received: by 2002:a4a:e917:0:b0:696:1594:c5bd with SMTP id
 006d021491bc7-69edd5eb67cmr1082827eaf.12.1781274131397; Fri, 12 Jun 2026
 07:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611154105.3727-1-shofiqtest@gmail.com> <20260611154105.3727-2-shofiqtest@gmail.com>
In-Reply-To: <20260611154105.3727-2-shofiqtest@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 12 Jun 2026 16:21:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLnK7uMo5U4S5B_5_p2tNbV87AeHHfv_RT=rhS58AAtHBw@mail.gmail.com>
X-Gm-Features: AVVi8Ccuz3KDQ_Vg3ujhLp3cFGFufmf0fWJqodUBd6MOpMJDh8IOsxHx7Jd6OUM
Message-ID: <CAD++jLnK7uMo5U4S5B_5_p2tNbV87AeHHfv_RT=rhS58AAtHBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] misc: lis3lv02d: set default click detection thresholds
To: Md Shofiqul Islam <shofiqtest@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 5:41=E2=80=AFPM Md Shofiqul Islam <shofiqtest@gmail=
.com> wrote:

> Several upstream board DTS files use st,click-thresh-x/y/z (the name
> documented in the old lis302.txt binding), but the driver reads
> st,click-threshold-x/y/z. As a result those boards have had click
> detection silently broken since the DT properties were added.
>
> Set a default threshold of 10 for all three axes immediately after
> the platform data allocation so those boards get working click
> detection without requiring a DT change.
>
> The DT reads for st,click-threshold-x/y/z are unchanged so boards
> using the correct name can still override the default.
>
> Fixes: 6a7740c7f5b2 ("lis3lv02d: add device-tree support")
>
> Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
