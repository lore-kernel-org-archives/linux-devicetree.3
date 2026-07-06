Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A0A3542D4
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333872; cv=none; b=ryOCI5+NpmqGzuvALZM3LcXbmJRpfxi6434UpbXCXkglJGMZ/5x4eIjlfW1UhW7H8CrEZLGtWrp4hQJNQsl3qEFvr7ZxVmttM25bDOJ/tTk2dhUQUoUcWURsZSx8MY1JAXmyViIZgi+GhS9zQrS5KbXN6mbX9kD6qY/0aHFDYyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333872; c=relaxed/simple;
	bh=xAzcZXHZvXfralRCRIC73T8RqYiucmRK4PJ8vUt9gsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sxep6HamNhVj66gZNn7HQgLn/5zzR8pXtGIy8TLt5/AOtdGsnl7ePpioxEvqU7ogjS88CbcNX79y2OmBixPhNqNJEUJQ4zJBCQ2vYsnVKB3egldYPqIph36XQsIFuYkMIvw98o92nt/UuRt8Sw6zUclKkqCwLaZYQ2bmlVRPwyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWbn3NfG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWbn3NfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D891F00A3D;
	Mon,  6 Jul 2026 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783333870;
	bh=lwaZFgVOx/Rn1E6DVGSq4enErdjIv110WDbWDDujH4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HWbn3NfGsQaZ8VXv/GyD/yF+IzmO9uWnLVMIWZaG2hS27WL6tnhQaVTZnHX5SSKiT
	 im7dDFUzRLMjaXwNYEvFyng0JrCGX4J8Glrsr0yjNnmIpOb9WD72fMlDKrAGJOMoN1
	 OcGwvTgLQTJ18+c1kW8IlnRMBWnZETh9TxToWJNlwcYnQA36au2nIqOCsgg53j5lQz
	 MOg+zYKF+Gvmg79lIal4V58vYqvSB/+7Izonc5t00MJU7a6W5VUg/TUtSwriwnAou1
	 KUIDiGl15j3dp1igYN4gSCQ5cIIXIUXvsuT1W5Q0Zg+9V3CTwaNqErQYaW6YrB5PJ3
	 QOzB04igdnatA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706102421.343639-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 10:31:09 +0000
Message-Id: <20260706103110.31D891F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The use of `re.match()` instead of `re.search()` or the `in` operat=
or causes the script to only detect a space followed by a tab if it occurs =
at the very beginning of the indentation string.
--

commit b4c995f24f81e6a677f411361809325fa7fa3599
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Allow space-aligning indentation in DTS

DTS often have spaces after tabs in indentation for aligning continued
lines of comments or list properties, thus allow such cases to avoid
many false positives. What we can easily detect is a space followed by
tab or too many spaces (more than alignment).

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 34e0f7e2a57a4..e49b7446a2f72 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -359,14 +359,17 @@ def check_tab_in_yaml_example(ctx):
> =20
> =20
>  def check_mixed_indent_chars(ctx):
> -    """Indent must be all-spaces or all-tabs, never mixed on one line."""
> +    """Indent must be all-tabs, except for aligning indentation (comments
> +    or continued lines)."""
>      for dl in ctx.lines:
>          if not dl.indent_str:
>              continue
>          if dl.linetype =3D=3D LineType.PREPROCESSOR:
>              continue
> -        if ' ' in dl.indent_str and '\t' in dl.indent_str:
> +        if re.match(r' \t', dl.indent_str):

[Severity: Low]
Because Python's re.match() enforces an implicit string-start anchor, does
this condition in check_mixed_indent_chars() fail to detect mixed
indentation if a space precedes a tab but doesn't occur at the very
beginning of the line?

For example, an indentation sequence like tab-space-tab would be ignored.
Would re.search() or checking ' \t' in dl.indent_str be more effective here?

>              yield (dl.lineno, 'mixed tabs and spaces in indent')
> +        if dl.indent_str.count(' ') > 7:
> +            yield (dl.lineno, 'too many space characters in indent (more=
 than 7)')

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706102421.3436=
39-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D2
