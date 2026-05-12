Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07AA3630B2
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552508; cv=none; b=DMron6lrdDUVBcpIlXtwfbGYlAuRcZlLvVoLlwMWzqJoqJ/wimBBiTU4Bs08a0ecnf+nEfIpVlsFkDmCXGyiQYVsxZ+9iIrJsOnQhIB0nQnJnrncyLyEhA4UQjHXAWrreU+PnqZ5XC5gr+ezhVPUu8nfiXrvZ8JSZn2Wfa0kJWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552508; c=relaxed/simple;
	bh=j3cRa79F4iRWIZJaJ0yhl9o30/kp0R2WvX6vE+d52vY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LNff3Ie8vtoxvR6DElhMrfMbDn54tTmL63oKFTRbCaWblHV1mRSraLVhr3/AaMsjB6G0dJ8Jxm941/MtbACNVr+vtfZAnh+K9N8DnnKmWExRtaYT5crTq5kq2ECxoNQrdQEx9UqxzXXQi0OIyfh2+vGsDi7M1hvzVSmvQVW8xPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pHfQx1oy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pHfQx1oy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD74C2BCB0;
	Tue, 12 May 2026 02:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552507;
	bh=j3cRa79F4iRWIZJaJ0yhl9o30/kp0R2WvX6vE+d52vY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pHfQx1oy0xkZvMd5s+diesZPLRpqu20qGdKZ5GacXap3706ys9JLQB4xNpSZQz9an
	 a7gDHUVDER+dMfkDEZRINUb0hjSxGtl+h+QpH60FhAm+1nFiv0n++dTnDcc2SzzrRI
	 /4xO0X2x3MMBZf0sX66Z+/7CDanLzaFsCwJ3am1RuEMd0eYi46iamAQ9CbHSwIR0K3
	 roMa5Qm9EapGaBk4GWbLeFZvIZDfsNSr5ZoZ1oT5v9j7sInG/Ugvxx7haSlZjx6hUx
	 x3l1INqd4KRdI6JRcXKvdR6Yai1jVOn4EsnRrnqpjxDFcFF/lGddlOzRCLM7//jrgc
	 mfQIl3xQGhaAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: document the Ayaneo
 Pocket DS
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511-pocketds-v2-1-299dd4247f2f@gmail.com>
References: <20260511-pocketds-v2-1-299dd4247f2f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:21:46 +0000
Message-Id: <20260512022146.EDD74C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string `ayaneo,pocketds` does not follow the standar=
d devicetree naming convention of using hyphens to separate words.
--

commit a683c6b060e33ed2160f67fb6b6b66afa0e7a006
Author: Teguh Sobirin <teguh@sobir.in>

dt-bindings: arm: qcom: document the Ayaneo Pocket DS

This commit documents the Qualcomm QCS8550 based Ayaneo Pocket DS gaming
console.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
[ ... ]
> @@ -1107,6 +1107,12 @@ properties:
>            - const: qcom,qcs8550
>            - const: qcom,sm8550
> =20
> +      - items:
> +          - enum:
> +              - ayaneo,pocketds

This isn't a bug, but should this compatible string use a hyphen to separate
words? The commit message refers to the device as the "Ayaneo Pocket DS",
and the existing compatible string below uses "ayaneo,pocket-s2", so
"ayaneo,pocket-ds" might be more consistent.

> +          - const: qcom,qcs8550
> +          - const: qcom,sm8550
> +
>        - items:
>            - enum:
>                - ayaneo,pocket-s2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-pocketds-v=
2-0-299dd4247f2f@gmail.com?part=3D1
