Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BFA3A383A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313410; cv=none; b=ACg59KcHTifc4BzYdZ5WuYikGKWOaMlIhJFLkLVFzmIvzDfevW0/I0RUDO156I7LZWdTUKc4LVt0yUsU87BPJ2XLhm7x8Do3v2UJdjFxF1aZ1VVbs+9IU1DvXx8UpQYMENcJzaJMz+UuDMqmunPS2ZfWzjSYnlO0GbSFNeDsvT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313410; c=relaxed/simple;
	bh=t6Hl9ATR0uGuRb9P5JDb1AmFXqKi4NCWgmaVQjxwMnc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q9+pPq6elPFkxOKmVoB37WlCgg9YpuLt39kxHdXAcrEcygo6bwREKf3ivGaGPs45ME3iXTI8HZDJVLURrcde2W+1FztXnF9gcN4wJlcJreDv2tZGIdk3cuIzhT7RwnYIskYTgQxArg81P+g7XYtDnhwCR1OGUSAbRTd/n/wGys8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZml319N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZml319N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FC81F00893;
	Mon,  1 Jun 2026 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780313409;
	bh=48gncTs3h9JEUyful3IaYx+cxmFuabojTvOp26rpXMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XZml319NGLCVNYIaAVrVDlssjCh/j8mCb4farMOLfotY5+Izd+NrgVuuPjHHK2MAh
	 9YgpzE9rsCwZK4E6c4RJAFWkEI9b/NcFvdmwLqB/r1/z4Q/BdlPqOYN3gXXM4gry5D
	 b9D7/BsAHMt5jlQfPikOMfR3Kc/6enj/LCeeYWt7DysuyWDT20vouLTnmwKLG42Xk7
	 ueMWFoyj9rEZB1UU4TNVZ5jCYcQ65m92epHJPC8ODEmDXSBpN2o9feQvigTSXkZWSF
	 60nerKcNnOyXMeRsgeE71T8X19mjB5OzkRAwtjzfyzLCGS2V5/Rg3aAzdE1p4ePl2N
	 4ivkixTZUtXOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sachin Gupta" <sachin.gupta@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 11:30:08 +0000
Message-Id: <20260601113009.38FC81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The PMIC schema restricts the standard 'temperature-sensor@' node n=
ame exclusively to the new MBG TM binding, causing false positive validatio=
n failures for standard-compliant legacy nodes.
--

commit 1c6b45c4d32f87b04fb868a977041acc92be3854
Author: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

dt-bindings: thermal: Add Qualcomm MBG thermal monitor support
   =20
This commit adds device tree bindings for the Qualcomm Master Bandgap (MBG)
temperature alarm peripheral found on the PM8775 PMIC. It introduces a new
schema for the MBG thermal monitor and maps it in the SPMI PMIC bindings.

> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/=
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -193,6 +193,10 @@ patternProperties:
>      type: object
>      $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
> =20
> +  "^temperature-sensor@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/thermal/qcom-spmi-mbg-tm.yaml#

[Severity: Low]
Does mapping this generic pattern exclusively to the MBG thermal monitor
schema cause validation conflicts with other thermal sensors?

Since temperature-sensor is the standard generic node name, other thermal
sensors under the PMIC (like qcom,spmi-temp-alarm) might use it. If a node
uses temperature-sensor@a00 for a standard SPMI temp alarm, wouldn't it be
evaluated solely against this MBG-specific schema and fail with a compatible
string mismatch error?

Would it be better to structure this using a oneOf block to allow multiple
applicable thermal bindings to share the standard node name?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-spmi-mbg-d=
river-v1-0-b4892b55a17f@oss.qualcomm.com?part=3D1
