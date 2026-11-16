Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869994;
	b=Rr7fb9MAs6yoKhbRNo1nT2nTXoI+CIi/krN5MIwatOGZMjAOGRlIHhvoKFMcsmQFDaSg
	 HMcdlf+LZW9y959qmN/H7q9HC0NW3SH0cKnH/sz10yRjFtjH4ScDnPfUYRgVbgAQkiV3V
	 RHwClsHrDjYR19mFqxpIk7jHaZkxRhldk+99UQb6eeuKSppmo4w8PdHlXgCd4+GcXU0eg
	 eo3OEw35ZWshTnZSceP1lEoLyoJ31PFbQ8F7tML/YLbB1ytSlA6AVH15gr3ENIPxcckxJ
	 CRxKGX0hkBMK2hQfAGk/mm1BI7BrFlM3gvnU1FfJVPd0snIWUDxVyy0HVX8LEL3bKYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869994;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IfyJ6AVcbEU3tV+ZGhTklX4g9T4Ofirk+LjAfVx+wFQ=;
	b=ka3ysf7BalXUyWYzuSrOAKz3XMRKFcT6tQ+QODDekta+vLqIYGHxl9WfadFMUaMR3eQI
	 3duZiaTC7ib9opPfHxleaz815ibJo3K3qPkZqTmTF2DUmYQiRHFZdyP+GfuvqLM9arW0X
	 IUpalmayB5mKzQKbFyoXIKQ1ua7qPqO98QNX1+nrInUhAKHE7bhqHlv/kVS3ChTGVUrJy
	 8rU4cKQCPS+30EP7S0FHerlhPLwAG3q1IgAHnO5xmzfqKD16CdpI4RvkOD8vUsxxN1twh
	 36zJKbWVdBpEXCxcPhn9EPyfiHvOPn/fjUlJR9tJNQIhRrVPkGgpayV9vJetdAy9fEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Krb9myh2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385D4606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Krb9myh2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560261F000C4;
	Mon, 16 Nov 2026 22:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869993;
	bh=IfyJ6AVcbEU3tV+ZGhTklX4g9T4Ofirk+LjAfVx+wFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Krb9myh27CInfMjguGoVMixJ4Lt2aqe0vwhsZUW92lX4s7YyBNAPxJmRl+4aKZtm5
	 YzDdDRsy5cvR/Inav6NGZlxRt7VqEbiR7pA/gC+3TxlLQpUxmv2ojJd/lxtseC7sGF
	 RkkL0Ov3c6T0tyozcPgtPQTKkTV3ErjPz1szsCbIHPrEgDRItSfqH7aHw82I1jlyjy
	 YCTA9xPEfA0m0Qd61QTBc3wlsrq+fb4rliThojNZgnZZ47Jgb321TvPKFtHzkHUhP5
	 Kcme1i8qhWN7Wggh6Y2iepP6liAG2o1k7uNTWpXBLmutnUwtZyeRvNWWyGXraVFJO7
	 p8TxHn8e6hf2w==
Message-ID: <sashiko-outbox-217831@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable
 remaining i2c busses
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:59:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: handle used instead of real name in
  Signed-off-by
--

commit aa50f38e977106112fddebf20e119b54f3aca941
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: enable remaining i2c busses
>
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Author header and Signed-off-by trailer use the handle "erebion"
instead of a full real name, which is required by the Developer's
Certificate of Origin in Documentation/process/submitting-patches.rst.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D12
