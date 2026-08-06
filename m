Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35357274FD1
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019841; cv=none; b=UTAlU9ueGbJw9WKVNBBykncJa+qcjsnxRTDG3wTN4Cm1jfGGSwpSPMZx16zpDm9pDH1zotu5NWa1/XZdts09bPhP7jOO2ozXh0B+r6TQpIESMaBT2zo5k5gHhAVVwUZX1pGkn5IGK+zqE6RT2i6dWcfD8+mlMMZgQKoZVJcn+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019841; c=relaxed/simple;
	bh=yej0cML4ZjW8WdaSpYNqRumgccxldqpLErdRC6CatdA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IdqZKF5/oIwtKSQOHw23hxoz64cQ9aVNHsa5OWLt5GnNOPs3sohYtsdSWGDU7+jDOMbYKwAN1E0avQKhgDayQxVt2ec+SYSf1vKNov8eIeilYxG2FQyDvaxDFkhqmAu0I8LfJKG6N+9Pw7HkKSuAHCvrkBWLt526eU4bN4BtxnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZYlH057; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZYlH057"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0651F00A3E;
	Thu,  6 Aug 2026 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786019836;
	bh=Y7Nij1Xqgwevwl9hUVQd2aDU93mqmMSsxcNfE63EqVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AZYlH057l2MlJIiYkw9BQ75rPJkrbh+yGwpK0ruU9eRnJ1T/3V2nn9I3jOCTMlvSq
	 iOQOeL+ufdhKGNxWHSGyvy8d5DaLRdNXTVuHLyZ4WrR7zWVLgam5rbXusS5AvMfgue
	 5ZbntXaqeJo2oEK3PR8BAW6+ApEyi3k3CkeizhhKcCX98tdAzBfpkMW+joY2OEg1ls
	 DgCnx2erV2z/3GzouqdX2H1EOEL6ZiNBi2kXcNCemPRXziIir2JtCM6wuvEKC0Y2rv
	 KVPH+K0UjPZdKbKgAd8XpuBD1zCGM6nNnXPQQ0BeXj/dB+DZAtd3Mq+3v100DgdKiy
	 nr5A2uRJUTCqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: serial: snps-dw-apb-uart: Add
 StarFive JHB100 UART compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806122553.182449-5-changhuang.liang@starfivetech.com>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
 <20260806122553.182449-5-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:37:15 +0000
Message-Id: <20260806123716.8E0651F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing Compatible String in Conditional Block
--

--- Patch [4]: [PATCH v3 4/5] dt-bindings: serial: snps-dw-apb-uart: Add St=
arFive JHB100 UART compatible ---
commit 58551d4cd9febd373c92800fceea07e37197bb0a
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

dt-bindings: serial: snps-dw-apb-uart: Add StarFive JHB100 UART compatible

Add "starfive,jhb100-uart" compatible string, with "snps,dw-apb-uart"
as the fallback.

> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.ya=
ml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 49f51b0028795..bca297c22fda5 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -78,6 +78,7 @@ properties:
>                - starfive,jh7100-hsuart
>                - starfive,jh7100-uart
>                - starfive,jh7110-uart
> +              - starfive,jhb100-uart

[Severity: Medium]
Does the starfive,jhb100-uart hardware also require 2 resets like the
jh7110-uart?

If so, should it be added to the conditional block earlier in this file?
Without it, device trees specifying 2 resets for jhb100-uart will fail
schema validation because they will fall into the else block which limits
resets to a maxItems of 1:

allOf:
[ ... ]
  - if:
      properties:
        compatible:
          contains:
            const: starfive,jh7110-uart
    then:
      properties:
        resets:
          minItems: 2
    else:
      properties:
        resets:
          maxItems: 1

>                - ultrarisc,dp1000-uart
>            - const: snps,dw-apb-uart

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806122553.1824=
49-1-changhuang.liang@starfivetech.com?part=3D4
