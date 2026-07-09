Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039D84195BB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620080; cv=none; b=CO/lVP6j5RfRaZQ2qtjtEIwekKPrVIDIKGB4ZjDjmqkGOBawuiskpJyCPV7yjrgqnGpzQcyDHZRG50TqMP6aDOvtAauAR/LULaf7cpjm2yInx8VbC1ZcQTJi8AbMijrV0m8qkuaAbuaNNP3d0VWN9fqZzJRCET4l4+JtkvsdhWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620080; c=relaxed/simple;
	bh=iorj0Fd+g02n9l1d7aDZ1AIWC17e1JX8CY+5BpI6vs0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RTVA1ee+RfluFo8zCIJhWnEn4Ydy/kGLXOl0yGxGkw4h5U7jAKhHun4x3xewNQYCLrZ1BeeHK2iwb2HNm8umMQhLk7KUdRt87dq5Saj1MnCF0EbD72ku6OFmpODI+CdNgualccEGupHQdxuQ3szcr+h2OB851bLX1xkyRV7VSWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1MRVtRk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1MRVtRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6935B1F000E9;
	Thu,  9 Jul 2026 18:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620078;
	bh=7IpjKhN+Fe2uZFmXQoIhNf/gp1Den1M+a/qfe7fscJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K1MRVtRko1whiyXRrKd1ZA3UzF+skvu00Dwh7Bx72o+zz/kEwgVl5N23nnnDorgBT
	 KeK+Ntfo+e5wsL+oq/YA/JEx/qJP/KNI7XwwxXsgM9z5GmPQxTYyUgs9I/rQccq/8k
	 9iDAPU0+qcvTNnKHHd9KAdxB9LUg5eakH1DButCFZ8qX77ikkqarbQ0zD6dvJWdwW/
	 EunMKI1OhgC1w6EBaNfP8JuFnbU6toboD9PZW3SQtF2aACcOgHsy9FXtl0gPIhCTo+
	 f6Z52Mi1Fa24RAO+wxL0napcvxAblJCs5/hjPKqzVfF2FWp7bkhyJsgs8T7dQuJt2M
	 5VY0uOlpp1Qqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/7] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-dts-style-checker-v5-2-fcc147cb697d@oss.qualcomm.com>
References: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
 <20260709-dts-style-checker-v5-2-fcc147cb697d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 18:01:18 +0000
Message-Id: <20260709180118.6935B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The check for excessive space characters (> 7) is not applied to=
 continuation lines, allowing invalid mixed indentation to silently pass.
- [Low] Dead code: Unreachable `LineType.PREPROCESSOR` check inside continu=
ation loop.
--

--- Patch [2]: [PATCH v5 2/7] dtc: dt-check-style: Allow space-aligning ind=
entation in DTS ---
commit a9c24c0264c4f952c0bab2866c36e42454e6fbde
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Allow space-aligning indentation in DTS

This commit modifies the dt-check-style script to allow spaces after tabs
in DTS indentation for aligning continued lines. It limits spaces to a
maximum of 7 and explicitly disallows a space followed by a tab.

> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -359,14 +359,24 @@ def check_tab_in_yaml_example(ctx):
> =20
> =20
>  def check_mixed_indent_chars(ctx):
[ ... ]
> +        if dl.indent_str.count(' ') > 7:
> +            yield (dl.lineno, 'too many space characters in indent (more=
 than 7)')
> +        for cont in dl.continuations:
> +            if not cont.indent_str:
> +                continue
> +            if cont.linetype =3D=3D LineType.PREPROCESSOR:
> +                continue

[Severity: Low]
Are preprocessor lines possible in this continuation list? The logic that
builds the list seems to guarantee that continuations only ever contain
LineType.CONTINUATION elements, as preprocessor directives reset the
continuation state and are added to the main line list instead.

> +            if re.search(r' \t', cont.indent_str):
> +                yield (cont.lineno, 'mixed tabs and spaces in indent')

[Severity: Medium]
Should this loop over continuations also enforce the check for excessive
space characters? While the primary line is checked for more than 7 spaces
above, continuation lines omit this validation, which could allow invalid
mixed indentation to pass silently.

[ ... ]
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts
> @@ -0,0 +1,21 @@
[ ... ]
> +		clocks =3D <1>,
> +  			 <2>,
> +			 <3>,
> +		         <4>;

[Severity: Medium]
Does the continuation line with value <4> contain 9 space characters?
Because the excessive space check is omitted for continuations in the
dt-check-style script, this 9-space indentation goes undetected.

> +		 resets =3D <5>;
> +	};
> +};
> diff --git a/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.=
txt b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
> new file mode 100644
> index 0000000000000..93146cfb51c78
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
> @@ -0,0 +1,9 @@
[ ... ]
> +bad/dts-mixed-indent.dts:13: [mixed-indent-chars] mixed tabs and spaces =
in indent
> +bad/dts-mixed-indent.dts:16: [mixed-indent-chars] mixed tabs and spaces =
in indent
> +bad/dts-mixed-indent.dts:19: [indent-consistent] indent mismatch (expect=
ed depth 2 * '\t')

[Severity: Medium]
Should this expected output file also be updated once the excessive space
check is applied to the continuations loop? It currently fails to assert a
mixed-indent-chars warning for the 9-space continuation in the clocks
property above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-dts-style-=
checker-v5-0-fcc147cb697d@oss.qualcomm.com?part=3D2
