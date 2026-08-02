Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330DB39150E
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660848; cv=none; b=cxFJykSVJKizhAcckrIOM+puTDYD5NiQKrMSo161mQGvlMip2Drakiql24PXSfxLaqMRPFnszVlXss+qmsd6Kef/fwvN1wEjmzQPP7PdS6VmJMOJfx/SHSySc9/kJphIZ7O/6sqgBD8EezZ+J9JjuMnxbr8N27DNFT8vTuZ5QH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660848; c=relaxed/simple;
	bh=E9CNn2GDcebE4YiomBenczJ7B1ieaqgMQMRmfYKONTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZZUs2VXuK5E4D4yL9GEAdkKx4I3jOwEi5Pa5B0/g9QFWgqPgQUxTWsu85iYs3bnvS2XBVoSiGkods2azfVELGeqz/Y4b0T0Kg3vsynpX7j9JreLeGjXs4Z4ezuEs7j2TOdzZ/DH14Wtd6h5D5psbmZlMbzlcs+tvcPdX1j9QE84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8kObzeo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8kObzeo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEF81F00AC4;
	Sun,  2 Aug 2026 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785660845;
	bh=CT+rEtGcRLAMqCVVqXJ2IFFSsUMQmNovwxB/HulZ6Ok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N8kObzeotbRa0AM3fP8MkPWJqp5/09bfgp8QGi6GKxxBflu0fxhDuc/f6cp5u2aRx
	 bkQyLENpYPo7DcRhnfpeL3Yu5Z9JdQeSgjBEnhMSieWxutJ9yrcX9LMk6kAuopQrq5
	 7j7TgiGz6hK7BtHe3a/PKtngICmWSDfOetvtoX4gwKcnWbbXMv4XJKYhjRaXTdsv85
	 pjyrXZyZecd+q7O22X8k25JuOtPbCpes4mnlG4vR1tLvDBoidHpImNnvO2S2fgltZr
	 BpFCaONfIBckNFQ6nPr0sNEpTzhP6SlP+RJiQOsxDwhmhcuQlNaDjQ8SynKO31348+
	 ZtlfyagRBwtNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] dtc: dt-check-style: Consistently call 'kind'
 as 'file_type'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-7-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-7-6c5dbd1ccfe4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 08:54:05 +0000
Message-Id: <20260802085405.8FEF81F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Incomplete naming refactoring: the parameter `input_type` in `check=
_block()` was missed during unification to `file_type`.
- [Low] Semantic conflation: the commit overloads the name `file_type` to r=
epresent both the exact file extension and the normalized syntax family.
--

--- Patch [7]: [PATCH v2 07/11] dtc: dt-check-style: Consistently call 'kin=
d' as 'file_type' ---
commit c5a18038cd79e5838980fe5df33adfcd99b7d319
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Consistently call 'kind' as 'file_type'
   =20
Script was using different names for variables or attributes with the
same meaning: the type of file (YAML, DTS, DTSI, DTSO).  Unify 'kind',
'input_kind' and function input_kind() to consistent 'file_type'.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index cb3cdfda5e739..54e96ce04b209 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -314,13 +314,13 @@ def collect_labels_and_refs(text):
> =20
>  class Ctx:
>      """Context passed to each rule check. Carries the parsed lines,
> -    raw text, mode and kind."""
> +    raw text, mode and file_type."""
> =20
> -    def __init__(self, lines, text, mode, kind):
> +    def __init__(self, lines, text, mode, file_type):
>          self.lines =3D lines
>          self.text =3D text
>          self.mode =3D mode               # 'relaxed' or 'strict'
> -        if kind in DTS_FAMILY:
> +        if file_type in DTS_FAMILY:
>              self.file_type =3D 'dts'

[Severity: Low]
This isn't a bug, but does this create some semantic confusion by overloadi=
ng
the file_type parameter? The parameter receives the exact extension (e.g.,
'dtsi') but is then normalized into an instance attribute of the same name
self.file_type (e.g., 'dts'), which might mislead future maintainers.

>          else:
>              self.file_type =3D 'yaml'

[ ... ]

> @@ -1168,17 +1168,17 @@ DTS_FAMILY =3D ('dts', 'dtsi', 'dtso')
>  def collect_findings(filepath, mode):
>      """Return a (lines, count) pair for filepath. lines is a list of
>      formatted output strings; count is the number of findings."""
> -    kind =3D input_kind(filepath)
> -    if kind =3D=3D 'yaml':
> +    file_type =3D get_file_type(filepath)
> +    if file_type =3D=3D 'yaml':
>          iterator =3D iter_yaml_examples(filepath)
> -    elif kind in DTS_FAMILY:
> +    elif file_type in DTS_FAMILY:
>          iterator =3D iter_dts_file(filepath)
>      else:
>          return (['%s: unknown file type, skipping' % filepath], 0)
> =20
>      out =3D []
>      for text, base, idx in iterator:
> -        for lineno, rule, msg in check_block(text, mode, kind):
> +        for lineno, rule, msg in check_block(text, mode, file_type):

[Severity: Low]
This isn't a bug, but was the parameter name in check_block() missed during
the unification?=20

The commit mentions unifying the naming scheme, but the definition of
check_block() still uses input_type:

def check_block(text, mode, input_type):
    """Run all selected rules on a single block of DTS text. Returns a
    list of (lineno, rule_name, message) tuples."""
    lines =3D classify_lines(text)
    ctx =3D Ctx(lines, text, mode, input_type)

Could this also be updated to file_type for consistency?

>              abs_line =3D base + lineno - 1
>              ex_tag =3D '' if idx is None else ' example %d' % idx
>              out.append('%s:%d:%s [%s] %s' %

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-n-dts-styl=
e-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com?part=3D7
