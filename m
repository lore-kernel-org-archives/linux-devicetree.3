Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0D737FF75
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718413; cv=none; b=PQiiqpXj1/J2AkmYMDLSVvA6ISiZdSVdtsuF0j+J44r3VA20nVovBvg+YMtnXqwOckb6bRRXaTRm7XjqeOHwvlAHWJkXXEefhQ58f/si6UUswpDYG+K2QdeQonbCWQTiqZ+Xn3ZwggLFpyEyFv/K2p0YppGpmmDtGmdOUnqdZ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718413; c=relaxed/simple;
	bh=2t93jrQRjSbagp2IfjrDxn6k9tNmFJ/yHdtbIpcRHas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N56jvvoFuYR+ccBmBSLtoAhibY6eIVaD15hcBdqmg9TTTvTIbEaM7i8QTgkwPYBaQ+Mab7A93Dfvi5S3CkvNYv+rnX9VYhEOEA+OXDT5gMPF6FhBMZA+nu34rDtxTBolBKIN8DYn7Dxn80/QUbEV6kZByxHqLYxjdTrjyeG4Guk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zg92u5Qt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zg92u5Qt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280591F00A3A;
	Sun,  6 Sep 2026 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788718412;
	bh=YfzZFUio7UqBRXzDNBUmEGkmqaBDY9lPCuVCrUekORg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zg92u5Qtv+9bBmcEYpKQAV5rVAbysi9n3Bj+rDNbueX+R/LRvL7FMYG10Pmp10hSH
	 FB0O3cme4Sc9dSocj9ap2CgKWLoOH82trOmK1ZWMIME2jBRvTkyD8RC6qDL2Iv0GGJ
	 9ICiECoNK1NNCzjWhv5/FdO0wuKRorXn/7q5ZjHCBTAuyid+m8U11AlV/TcIe96iHJ
	 sGTy6azSMVy526dFJmB39NCJlMDzq87TFREKYz0pEMsURxbPEgkiv9ulk84s8p5jKH
	 qJLw2CCjpatZwR9rAUjvTju2L1oVj0E5L3Ym9LiuE5dNbgh1nuJ29BUF4V87H+tnsc
	 AJKwWAAdNtEWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] dtc: dt-check-style: Consistently pass same content
 as stripped line
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:13:31 +0000
Message-Id: <20260906181332.280591F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Passing `stripped` instead of `code` to `DtsLine` for continuati=
on lines breaks code parsing when comments contain quotes, causing false po=
sitive style warnings.
--

commit b0e5f002675043b5c126935e8c52f79036f0359b
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Consistently pass same content as stripped line

This commit updates the dt-check-style script to pass the stripped string
instead of code to the DtsLine constructor for continuation lines. This is
intended to make the arguments consistent with other DtsLine constructor ca=
lls.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 36e5b5db5e14c..49ced18895583 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -203,7 +203,7 @@ def classify_lines(text):
>              in_block_comment =3D True
> =20
>          if not prev_complete:
> -            dl =3D DtsLine(i, raw, LineType.CONTINUATION, depth, indent_=
str, code)
> +            dl =3D DtsLine(i, raw, LineType.CONTINUATION, depth, indent_=
str, stripped)

[Severity: Medium]
Does passing stripped instead of code break parsing when comments contain
quotes?

By passing stripped (which still contains comments) instead of the properly
pre-parsed code, DtsLine.__init__ falls back to its regex-based
_strip_strings_and_comments() method which incorrectly consumes valid code
if a quote appears within a comment.

This can cause the dt-check-style script to generate false positive style
warnings on valid DTS files when a continuation line contains a comment with
an unescaped double quote (e.g., some_prop =3D "a", /* comment " */ "b";).

>              out.append(dl)
>              prev_complete =3D (code.endswith(';') or
>                               code.endswith('{') or

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906180437.1667=
60-4-krzysztof.kozlowski@oss.qualcomm.com?part=3D3
