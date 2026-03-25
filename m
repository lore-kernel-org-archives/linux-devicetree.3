Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0B26159E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427020; cv=none; b=d7GraD5duqyBe/MDfq/8pt25+AhpeQImwL81QscEZWk6X7MvHxiXmezeqcwHWqG9nLwKyGlRrBY+7MUoVBB6feMM28J1+4XhPKTRlp1vJbP9OTjl5lsUcYvJsXBQyBn9xLdbiaVmVehwy7IwgEe0HW7g68HXm18lvrajZrSjlIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427020; c=relaxed/simple;
	bh=Hg08va1NfeGii59zk2DHu0XkPiNAL/Bra9Zqs3KObiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPCn4zdTqeSgGJWcbdxY0xgzmUWooWw3fLOcWyfNIV5AENYFcmdGdehLpH4TU5K5AY0Hv3RSqUPQfwNVxc/4XGtgbsbcq6Qj0G7xUig5kgyn0NFSm2tuGLTd5pSRlu5QOoiyWHAQzkBWl7T+cvIEsf/L87VKdIjKwWR14i67ctQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64937edbc9eso4558758d50.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774427018; x=1775031818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hg08va1NfeGii59zk2DHu0XkPiNAL/Bra9Zqs3KObiU=;
        b=GUFMHZ2BQecD7rAeUUapYHN3NCdzNRWJ8iH7SQ6zE431e/k9d0rp3jH9DQRXAtsCtb
         nKHyv0MvhcPcsZc89nRSUlquTOE2et9xRdGPd168QVMLq6cxP3fhCQ2W48gQtEIVyeww
         KXJr6YLAosq/fSbUkK0HFERLpyuPzzX1CEmfCfthG8Ekq6C2XanfeDgZMLgf1Yi0W/Yv
         s5pzHNs+JYzdWmo71guua3U5XGaQMGmaQTf3GbmjCv2/clHeGB5TksPOcs1CkxkBWMVg
         pjgpAsD+c5nK80U4nVx3dkT4B0hS+cCtBcW0MyfVtEjlEhNeIXnUpcgfNDFn5PDWI6DU
         +VNA==
X-Forwarded-Encrypted: i=1; AJvYcCXEnzgG5Ho+tbX2Cg22cqTAH0l1TjjfdDD4nVIYauh4BLXlEUVy2JVHuQjjPPSGgllfhiiatbunJYaJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpg7C0uSNyNOS+/e8pZ3U9osOzV05e84VgGlHHa4NrgRVaJiTa
	LqEgYqC6Tq2zyXNlT6XvwQF1okyT77qkl6T4/I6gllKDzry6+jc9LQmrn4Zb+fEE
X-Gm-Gg: ATEYQzySomnvuxvGW3poEdrJbBdOZk003Af6qST1ZkgYCPASipFy/z0yE8OJZPy6Qc7
	Z7IR0cVsKXT29svkUit/pNmMrGrFB8QDFZT1TltfAIREr5qdIHDClnxWiyCwmzUogenbEJv7DIP
	vwxqkCE/temsojzk8ye9JhvT3RQ4Cw46Xj9y27DcEimckpMM80Pa3DwCAnbAR2EvBgN1g3auqRN
	yQ5YCGvvrCxlAg4GPNmP6ycx6N90xf2aXCAyrKv6R2ifCt2d1YDqW8j8mxqLwm7Hr3x3OLAJPqJ
	iPx+rJlRdyiYQCl5dvqQw5pPolyKEeWBzDf5fMuBv2/VHSOuidM4CgZED0nHke8F9EYGeygztjy
	8blNZcaNXEYrRn03gHtn5cI9hwXdhO6l73qcqnWogeE95yZJNDS5OziSItXhyJ0IIBYe6+JUI7w
	TYYuXCviOTl397ofXKiuKw10Etrueds0gwgeDGFofMC0LSPMx+WNb/zKh0zGfWU8slNwfoi9+ch
	uwKfE87ew2Z0qpErL9sdH0g1gcze4DtTBIOCFIujdvcOQ==
X-Received: by 2002:a05:690e:1241:b0:64d:626a:f4fd with SMTP id 956f58d0204a3-64ee61670efmr2253412d50.71.1774427017813;
        Wed, 25 Mar 2026 01:23:37 -0700 (PDT)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com. [74.125.224.45])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ee6c7cc02sm891388d50.0.2026.03.25.01.23.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:23:37 -0700 (PDT)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64937edbc9eso4558746d50.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:23:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKmDHjcVmjo4fKhUZb4mJ4Mr8jCTfri9oOTiKZnJUGvjFL8BZ4YJe7XkAGSc7kBn2rbvxzlfqOxsxw@vger.kernel.org
X-Received: by 2002:a05:690e:dc6:b0:64a:d672:dafb with SMTP id
 956f58d0204a3-64ee6073950mr2268673d50.8.1774427016800; Wed, 25 Mar 2026
 01:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325063254.18062-1-email@sirat.me> <20260325-perfect-locust-of-serendipity-b0cdfc@quoll>
In-Reply-To: <20260325-perfect-locust-of-serendipity-b0cdfc@quoll>
From: Sirat <email@sirat.me>
Date: Wed, 25 Mar 2026 14:23:25 +0600
X-Gmail-Original-Message-ID: <CANn+LW+_VPJ12ESR61xmq2Kw5+q4x=++C_uXckf_YGR_Lxms8A@mail.gmail.com>
X-Gm-Features: AQROBzCb0c1yCGK240KD6g6MkgsnRfjcUsb6bd4H2kW3AdpCENOoiKdIVAWTitI
Message-ID: <CANn+LW+_VPJ12ESR61xmq2Kw5+q4x=++C_uXckf_YGR_Lxms8A@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] iio: proximity: add driver for ST VL53L1X ToF sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 1:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Mar 25, 2026 at 12:32:21PM +0600, Siratul Islam wrote:
...
> > ---
> > Changes in v7:
> > - Add VL53L1X_REG_ prefix for register defines.
> > - Use iio_push_to_buffers_with_ts().
> > - Use continuous ranging and drop postenable/predisable.
> > - Add comments for XSHUT reset, default config values.
> > - Drop vdd-supply description in binding and comment in driver.
> > - Add ABI rationale for vdd-supply to commit message (per Krzysztof, Jo=
nathan).
> >
> >
> > Changes in v6:
> > - Make vdd-supply required. Add descriptions to vdd-supply and reset-gp=
ios (per Jonathan).
> > - Check reset_control_deassert() return value (per Andy).
> > - Use volatile table for result registers and caching for the rest. Als=
o mark write-only registers.
>
> So where did you explain dropping tag as I requested? Did you read the
> exact paragraph I asked you to read?
>
I dropped the tag in v6 and I was not sure if it was ok to modify the chang=
elog
of v6 when sending v7. But I will keep this in mind.

Thanks,
Sirat
