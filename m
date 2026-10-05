Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B84834D926
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185458; cv=none; b=ZVDetILHaWqWablVWZDxei7RzwdHNBj8UUMkof3aJ47FqbPVyAiRDGiguRM4VYjEMwGe85zAqJ0xoKjBEwi0VWLC8sw5LReyzWcsc5PoirbNh22Z+qPwAA9BwzXY6a0toxW/ogmySmDuzqieBz/RlOu2oUl6D8H3qSNPolnq9vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185458; c=relaxed/simple;
	bh=7CKypa1eG3nh224BLIYxa0+BSpWBhSz7yVfDfe3HmBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vey06iEbxnB75Mqvj+07B8npoaNErHm+T+4I7uKZcc/AWd9DysBs6cBz6UGO6/hLC+pH8fX4V1xrkGJLsRhPzmOkczPtgMswwBhOB0SojxydfmR1nJsDJIk/B0qX/aVNPtJFJ77xzkxzi4CjjEgyM16katifdC0rAUe+za30kso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6bX2wkZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6bX2wkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55801F000FF;
	Mon,  5 Oct 2026 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791185456;
	bh=B67tVQ7h6pfh19O8cSKSRT4hoyZ6AtWBqomZfcAhMmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a6bX2wkZg1smFBjHK4WAOyYxkmGz0ph3A2FmST3qm8r5VvoWy83qeINu+3LoyYCdO
	 FVKJ4exyj6pqY2xIhcLbNhrhWo62nHks88CtXHLUJTPn7yf2nsejEWLWOBdOhVZjML
	 fy+d/9pWeXnEH7ll4r4o3IoYznoVUSTpnpKGS5uHlrx0uVjxtfTX9ZJm7r+l9A9gQW
	 J/ciJ3tZALzf8Rp3X2RdmBKSQzi2LHqBfV5peNrGl5CLmP4kcq6+KMbPEiPDfttC+8
	 1ENfCqyCZZkBkp6Cs0ygG1/VP793Y1lfDjJoW6lfNeW4zyYMuIHFUMw9XRX6t85Kmi
	 zxUmTi/8N8Jgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: dp-controller: Add
 Kaanapali
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balaji Kalkonda" <balaji.kalkonda@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-kaanapali_dp-v1-1-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-1-6faeac3a6d59@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 07:30:55 +0000
Message-Id: <20261005073056.A55801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: display/msm: dp-controller: missing conditional constr=
aints for Kaanapali
--

commit 120c2a5db230d526e6a48bd35eae767dbf9663c7
Author: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

dt-bindings: display/msm: dp-controller: Add Kaanapali

Add DisplayPort controller for Qualcomm Kaanapali SoC which so far looks
fully compatible with earlier SM8650 variant.

> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.=
yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 094a6383bb779..8bb0f6e15942f 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,glymur-dp
> +          - qcom,kaanapali-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp

[Severity: Low]
Does this new compatible string cause a regression by bypassing the stricter
hardware constraints defined for the SM8650 variant?

The commit message states the Kaanapali SoC looks fully compatible with the
earlier SM8650 variant. However, qcom,kaanapali-dp is added as a standalone
enum item without being added to the existing conditional constraints.

Should qcom,kaanapali-dp also be included in the allOf conditional block for
qcom,sm8650-dp to enforce the reg property constraints:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,sm8650-dp
    then:
      properties:
        reg:
          minItems: 5

Without being added to this enum array, running make dt_binding_check on a
device tree containing qcom,kaanapali-dp with fewer than the required 5 reg
items or 6 clocks could silently pass schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-kaanapali_=
dp-v1-0-6faeac3a6d59@oss.qualcomm.com?part=3D1
