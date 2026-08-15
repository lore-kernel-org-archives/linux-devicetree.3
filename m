Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55B3277C81
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 02:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759356; cv=none; b=GBc7G7ZC7PmkRaaYH/Ha/5+ryfYIX/keiJ6vzbd92qhCpFeF+KI5NCzaWlQMFZOH5LMocFZK0KsNo7UD11B4D3cD0jlQPpzfSHJfWaIquNpyX+C+1Aa9WHv8719zhEP5Ioaw7Z4zFOWciNddLNT/EaR9RgnheOSubnfgZvK+2fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759356; c=relaxed/simple;
	bh=EQUhwgbMaQKrQcpxcMvW6yL+cFZemAny/AJX/9I0pss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zf2PnX77F7r5iPSB+i1x2Ewgw1sRwiIPr67YinO8H9e9ZZ/ppXTzuBJK/P+h5WBHQ2AnC7At9EKqQfjVh1zP9FwI9lMAtamZVsUyT58lYAJo9QovRs0rGZuFk6NJ8SFZYujIhb57/+2IL96N8EIpHghUgpGp3UW6TmEBnkNny/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOl2evo5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOl2evo5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51F81F000E9;
	Sat, 15 Aug 2026 02:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786759354;
	bh=Rkyy1TtDFV7WeOCUU6bAUNP9eEK/RSQ4TE+BZV+uzbc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dOl2evo5w7kizM0RqYo6pmhe1wN+3iAvLTo1EFcIqfRhe72KNdMmJGzuFuCj5opBz
	 4Byd0mozp8yaWyAKxeILVtnbTFrTy7psSRmRhkw2iBKPxotPHtsFoa5SAVMvby9uBz
	 p97GWFjxjz78tp3LV6E4DU8iTrmBpQ+rgU/lwKpwE3XIxGLj47UBZJEmnrFQ4aeN2A
	 tmsrJppBV7rhN1x4pdh4UY9O0Rcjfrym81fBkSxv4D/CHUM1MVCckTW6yYY8I3hayQ
	 LrTB4+YzQ1qZnMGWysU8debY9aalWl6mt6JnKIBawe6hi48fpyJlGoW+Hp/u90Spgs
	 fXy3HdxA00YAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: riscv: Add Xuantie C906/C908/C910/C920
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guo Ren" <guoren@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260815015722.1736831-3-guoren@kernel.org>
References: <20260815015722.1736831-1-guoren@kernel.org>
 <20260815015722.1736831-3-guoren@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 02:02:33 +0000
Message-Id: <20260815020233.E51F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `xuantie` equivalent compatible strings were omi=
tted from the `allOf` conditional block that restricts the `thead,vlenb` pr=
operty, causing valid device trees to fail schema validation.
--

--- Patch [2]: [PATCH 2/2] dt-bindings: riscv: Add Xuantie C906/C908/C910/C=
920 compatibles ---
commit 8fd8dd2156e30474207bea785ee6877565dc1eff
Author: GUO Ren (XuanTie) <guoren@kernel.org>

dt-bindings: riscv: Add Xuantie C906/C908/C910/C920 compatibles

The RISC-V CPU bindings currently use the historical thead vendor
prefix for the XuanTie C906, C908, C910 and C920 processors. This patch
adds equivalent compatibles using the newly defined xuantie vendor
prefix. It keeps the existing thead compatibles to preserve compatibility
with existing device trees.

> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 5feeb2203050a..5aba1e8ed1952 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -67,6 +67,10 @@ properties:
>                - thead,c908
>                - thead,c910
>                - thead,c920
> +              - xuantie,c906
> +              - xuantie,c908
> +              - xuantie,c910
> +              - xuantie,c920

[Severity: Medium]
Since these new compatible strings are equivalents to the existing "thead,*"
compatibles, shouldn't they also be added to the allOf conditional block th=
at
governs the "thead,vlenb" property?

Earlier in this file, the schema restricts the property like this:

allOf:
  - $ref: /schemas/cpu.yaml#
  - $ref: extensions.yaml
  - if:
      not:
        properties:
          compatible:
            contains:
              enum:
                - thead,c906
                - thead,c910
                - thead,c920
    then:
      properties:
        thead,vlenb: false

If a device tree node is defined with compatible =3D "xuantie,c906" and
includes the "thead,vlenb" property, won't the allOf block evaluate true
and incorrectly enforce "thead,vlenb: false", causing schema validation to
fail?

>            - const: riscv
>        - items:
>            - enum:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815015722.1736=
831-1-guoren@kernel.org?part=3D2
