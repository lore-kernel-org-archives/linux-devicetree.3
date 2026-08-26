Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4931327D
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787728709; cv=none; b=YgDlFkt2CGysik1KLjSVXIACTEO+2bJT51NXsvl8M6PcUbz8mRsVBYMufHj9D/FBfYTxYBxP8qFTkyFCQCtMQy6+JZ3PgOkWI7s14S3WnvfwHIQdgbzXs8GcjG2/VnCP9Rxvm2s3vcfaNdGkFtBEBxjrWnNbGNAFBBzp4uk32co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787728709; c=relaxed/simple;
	bh=USO5XK8kES8yz5yfA6AocMu+abFo53pehzcVpbEt/Qg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hi8HybXuOaz/CYu58RF8Xg5+Z9jDXJteFs2TENJFaDQ96ri4oshct8pRgyS/R8cvu/T2Qsh/Ry2DbHR/eTPoB5xmA0wRN8xhJj7c+0XH65zEBWOy+Uz2CF2NnlHZU/IcjFn+y9YdxahUCK3DO9PR6DPIp3KldwUc5lxqYOK3Reo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7H2rtCc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7H2rtCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867DF1F000E9;
	Wed, 26 Aug 2026 07:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787728707;
	bh=MomhPxRrCZfnitGFiBkV75LRfgHZSNtAtX6vid/P0Gs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K7H2rtCcFcTyliO+5bzlPn0fJszhV5MxCySjpEAEM5z5kS/CKPgAxhHkTIsfVnDu6
	 h1taqLcdJFpR8iJWZvwi9nDJtXUpQkYpdDIn/H6hR7CbbPL7O38TC+5xLNiioWy25z
	 2esDk/sVdAWHGv7nZ6U9byi9CVZ7p3rCzuL9qN94aOdEgG30H8e9hboI2j1up7UiRi
	 BynUbByKWfTaLWcoUPLHbJblFYNx8JaakwjTubeeGiO5lOUWKRnUKmPNxhvecdvQrz
	 B3KE/mmCqEQc9NcRqLVOdEiHJ0Mg+gobCBzfYqgJGCd5NHgEyeHmpwmh/ZPnujBVqH
	 RFCCOrzYqgmmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/10] dtc: dt-check-style: Add warning for redundant
 white-spaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-9-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v4-9-022e60091965@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 07:18:27 +0000
Message-Id: <20260826071827.867DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The regular expression `r'(\s\s+|\t){'` uses an unescaped `{` char=
acter immediately after a capturing group. In Python 3.11+, the `re` module=
 enforces strict parsing and treats this as a malformed repetition operator=
, raising `re.error`. This unconditionally crashes the `dt-check-style` scr=
ipt upon execution.
- [Low] The redundant whitespace checks do not validate continuation lines =
of multi-line properties, causing them to silently miss styling violations.
--

commit 2e1d4b87b1d575d09206e54554a02623ac0f7700
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Add warning for redundant white-spaces

Show warnings of too many spaces around '=3D', before '{' and ';' character=
s,
or using tabs for these. Both in-tree DTS and DT bindings have many warnings
for the first case, thus keep this one only for 'strict' mode.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index dd3828b146385..e67ba1e5164a7 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -349,6 +349,36 @@ def check_trailing_whitespace(ctx):
>              yield (dl.lineno, 'trailing whitespace')
> =20
> =20
> +def check_redundant_whitespace(ctx):
> +    """No whitespace between brackets or other code elements.
> +    See also check_value_whitespace() for more checks."""
> +    for dl in ctx.lines:

[Severity: Low]
Does this code silently miss styling violations on multi-line properties?

Because the loop only iterates over ctx.lines, it appears to bypass nested=
=20
continuation lines (dl.continuations). If a violation, such as extra spaces
before a semicolon, occurs on a continuation line, it won't be checked.

> +        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
> +                           LineType.COMMENT_END, LineType.COMMENT_START,
> +                           LineType.PREPROCESSOR):
> +            continue
> +        if re.search(r'(\s\s+|\t){', dl.code):

[Severity: High]
Does this unescaped curly brace crash the script in newer Python versions?

In Python 3.11+, the re module enforces strict parsing and treats an
unescaped { immediately after a capturing group as a malformed repetition
operator, raising re.error. This will break the dt_binding_check build
process unconditionally for users on newer Python versions.

> +            yield (dl.lineno, 'extra whitespace before {')
> +        if re.search(r':(\s\s+|\t)', dl.code):
> +            yield (dl.lineno, 'extra whitespace after :')
> +        if re.search(r'\s+;', dl.code):
> +            yield (dl.lineno, 'extra whitespace before ;')
> +
> +
> +def check_redundant_whitespace_strict(ctx):
> +    """No whitespace between brackets or other code elements.
> +    See also check_value_whitespace() for more checks."""
> +    for dl in ctx.lines:

[Severity: Low]
Is there a similar issue here with skipping continuation lines?=20

Like check_redundant_whitespace, this strict check loop ignores
continuation lines, meaning violations on multi-line properties will
be missed here as well.

> +        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
> +                           LineType.COMMENT_END, LineType.COMMENT_START,
> +                           LineType.PREPROCESSOR):
> +            continue

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-n-dts-styl=
e-checker-continued-v4-0-022e60091965@oss.qualcomm.com?part=3D9
