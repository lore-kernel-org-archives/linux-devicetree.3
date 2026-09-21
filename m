Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F73D3B3
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950812; cv=none; b=aEfuSgXLLnGt5qXbAeUOo3F6SdszpPxUWSQn91pEhUG+whEJzJvNts1So5bggmCX86tMzgm8ucTTBw5wVkJjYXtcvRMesO12yywfd73DI8VD1QSM9XzLjoiKARhlCI92IvAmp+AbImI2n+BVM+5zhXemhv80JnshgkyT8Wk4Ii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950812; c=relaxed/simple;
	bh=uPqxB5L8THw8VkvHTeP0YD7oRDc3H8yAHSmbF9B4TkA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l6/PNeXhpBadURUDC6DI39ZMlDmnAl6kSOomgj2kY+yyvawVjw/UslWyJraG1XEipoOU1j9Jgji6mPfiaKuYOGbM8oiwR2QVVMMNLILt/4PnJBzmWVvFvJag06LnqmJTvyGy8UozP3M7eX8Z9KUEWz7oe7sejTmbI/LIWqVKZYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BY1mJND9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BY1mJND9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5592B1F000FF;
	Mon, 21 Sep 2026 00:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789950810;
	bh=pdd+SnsEGpaed7bEephy20wzab85hcbrZMl6eWa0vv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BY1mJND9NT5PFDagXG6bHWHS1t4ZAAZyAMGtuowcpBVqNBSXd1i2tOHdi+JHsSgYJ
	 4dHdrqq6rUhDbAqZR3q+VOx9n1mvUqRci3SXpCIA7LVt5AHHjWcbUIKCRNB98pIczd
	 w2V4UYhnfpy9Lu2oR40BVPEA4ElU4cG1aEHPepgds2oIV7BDVkXN85lDCTh0HKyuqg
	 J0wIy6zuL9Pi80u/4JskAbNDL9ffUuIreQ24Fi+lx/x7XOsGBFkV+fK8C1gr65mRYD
	 OFwjRT/d4z+//Ktt7yT0QZjWvFMwGWtH3hEhgDcPYztIPs2Y4yDQYjEnXtL2Fc2uPN
	 OqrrkiCg2eMnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w
 NPU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolo Giuliani" <nicolo.giuliani6@studio.unibo.it>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260921-send-dt-v2-2-fb6b81002ad7@studio.unibo.it>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
 <20260921-send-dt-v2-2-fb6b81002ad7@studio.unibo.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 00:33:29 +0000
Message-Id: <20260921003330.5592B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: incomplete compatible fallback chain for sophos,xgs107=
w-npu
--

commit b3e0e1fbccb36ab57b4650e23b8463d430afac8e
Author: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

dt-bindings: arm: marvell: Add Sophos XGS 107w NPU

The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
separate network processing unit (NPU) using a Marvell Armada CN9130 SoC.
This commit documents the compatible string of the NPU board.

> diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.y=
aml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> index 7e77310da626f..130128c46219e 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> +++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> @@ -118,6 +118,13 @@ properties:
>            - const: marvell,armada-ap807-quad
>            - const: marvell,armada-ap807
> =20
> +      - description:
> +          Sophos XGS 87/107 network processing unit (Armada CN9130 SoC
> +          with an 88E6193X switch)
> +        items:
> +          - const: sophos,xgs107w-npu
> +          - const: marvell,cn9130

[Severity: Low]
Does this compatible list force an incomplete fallback chain?

The items array strictly limits the compatible property to exactly two stri=
ngs.

The canonical definition of the CN9130 SoC includes a three-string fallback
chain (marvell,cn9130, marvell,armada-ap807-quad, marvell,armada-ap807).

Limiting the list to two items here forces device tree authors to artificia=
lly
truncate the fallback chain to pass validation. Running dt_binding_check or
dtbs_check on a device tree that correctly preserves the full sequence will
fail with a "too many items" schema error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-send-dt-v2=
-0-fb6b81002ad7@studio.unibo.it?part=3D2
