Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0604382397
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718534; cv=none; b=DNHpCjlqdbj3jRtUQj/VCT3n1zMWrbBR/CZ3tLkklzZaIHnebjWVWp1tjuVZV+ZMFBwt8lBBLUcxH4wvJM59AYC5GRynnKXWHRGcS4whknduqfyCoS9w5F6yZRovyRjnH6jfLlXGQ7FKAMS/5Xh0uTZ3FmUsfkzxLygtlluk3cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718534; c=relaxed/simple;
	bh=hC5nFeXsdHVGRHsI+Ofkwxuvcw3qDkmRJEIXCdsrwJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PnPV6ngbZuI0HJAoFmApbNYDqnM+I7jwP9HGE5SxgxJltvpcRU4Kw3tXc6mczeSxMzLoGMtSn7hgIK+xwJKAt8Q2txLssX8nzJu5zH2Y631BDZQZ33CMChemRv55Vs+OqHd6VKFMSdvPhrtQvIRi5F2E4N66xZzvUPQDlM8bYGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBWTU1lB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBWTU1lB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203811F00A3A;
	Sun,  6 Sep 2026 18:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788718533;
	bh=zynjwGbirTkNSG29Px2+IQ5qLiZlyyrQgTuShAQ2fWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBWTU1lBDze3MEDw8wEgek+w2bHSoot2hDdB9dc2907YG+QTDo1LvY5RvQc9OvKoq
	 bAgE/25iRViedqb7f91MISEDPqemTnSG72PkWbIJPENnx9r5H/a694bJ+lPpbQuLMN
	 5hcXQaT9zuvZ4NtExeN0dWnl6z7LAKySHdPq3TpATJPByWJDsFDGdkj7Z65IJ5eTVa
	 Aj4Uaw/CaFJZ2PHfpOKhc2IH79Wliv0ClszNV3dIP3TlIttqxLu0fFqpEkPHbW2Dr3
	 l5wZzYcJxLapj3leoJlQZ1Lhrhl0z27poKmm7fpK5srBbOyriiznHvmNMvFI6I+AmC
	 PZWWiTML/BKlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dtc: dt-check-style: Properly detect comments in
 multi-line properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906180437.166760-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260906180437.166760-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:15:32 +0000
Message-Id: <20260906181533.203811F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reclassifying pure comment lines inside multi-line properties as=
 `LineType.CONTINUATION` causes them to bypass multiple style checks (line =
length, trailing whitespace, hex casing).
--

commit 86dbc1bb67649327675e097829b541fa2d7bd913
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Properly detect comments in multi-line properties

This commit updates the dt-check-style script to properly detect comments in
multi-line properties. It reorders the classification logic so that
continuation lines are detected before comments, preventing false positive
indentation warnings for pure comment lines within a continued property.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index eae933780c1fd..36e5b5db5e14c 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -202,6 +202,14 @@ def classify_lines(text):
>          if opens_block:
>              in_block_comment =3D True
> =20
> +        if not prev_complete:
> +            dl =3D DtsLine(i, raw, LineType.CONTINUATION, depth, indent_=
str, code)
> +            out.append(dl)
> +            prev_complete =3D (code.endswith(';') or
> +                             code.endswith('{') or
> +                             code.endswith('};'))
> +            continue
> +

[Severity: Medium]
Will this change cause pure comment lines inside multi-line properties to
bypass multiple style checks like line length, trailing whitespace, and hex
casing?

By reclassifying pure comment lines inside incomplete properties as
LineType.CONTINUATION here, they are moved into dl.continuations instead of
ctx.lines.

Functions like check_hex_case(), check_line_length(), and
check_trailing_whitespace() only iterate over ctx.lines, so they will
silently skip these newly moved pure comment lines.

While there is a pre-existing flaw where regular continuation lines are
already missed by these checks, this patch actively regresses coverage for
pure comment lines by moving them into this blind spot as well. The
subsequent patch in the series does not resolve this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906180437.1667=
60-4-krzysztof.kozlowski@oss.qualcomm.com?part=3D2
