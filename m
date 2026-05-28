Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C859D3EFD02
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971817; cv=none; b=XWGKiZQj3ZCoAyvUIcfp6bp6yJIefL7Gkq5Kzqtigv83otRCHJyYqd/c+FTVQZe4IJE2Etv00BcPnXck1hhEm5/+K2WmVI8KSOV9hBd5IChJO9bMJdJAAE9OnpLjfPsq3W+wDDU8j8OrOBEIk2qtJUi7oLpA2MUgLjuufwb4Qew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971817; c=relaxed/simple;
	bh=4Bw5PQSNIb+4cHUyfspc5hYuIAlRiJlq+FeHPVBWUuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bIZbXpf31fog+b9iQHJnyZT4uVApSuw81ODdoTgzJ/F23mbGRYsR1ROYMjMrdZq5Mn2akvwdrfeLC+tpzRmaAaY9lXuKDa1c4tXD9qEzdsE9bluoVDDAtGicl30+mw3CIPw3BOmJ4kMM9NCEuyy8DgkgAsGcZICTeAG41Wk8NvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwPMPVQT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwPMPVQT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F44F1F00A3A;
	Thu, 28 May 2026 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779971816;
	bh=4Bw5PQSNIb+4cHUyfspc5hYuIAlRiJlq+FeHPVBWUuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UwPMPVQTBprFrBRPCoPiJ7cJKSY/5Cc3DAw8Yoo9lkLiMl2Bbu99t7gjTA6sqo9WU
	 rAKOvL1yKAWp8Ed3AOIea+8pNFCsvVqsIkAA1/nNAuGPvqA+PZ32dEVop5i8rkemQd
	 5ebdrIVJPM8yjvtTabsewbwxteA2Cok2GDrkadHSdjB5myGw770K13JgbIXzzNl/ss
	 XQgv5yYFxI2TctlNfDVfROofQUY57Rsx0KPgmesktDbo2P0ZsSyfOv+Mcfo9uLgc/w
	 M94XLakRayzm6y8QJaKS539P7bQP3w7x0SGvLZrITOj+q2EpwbSUQXtZCHgzyg4bTy
	 7KcAcKLSOFTuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 12:36:55 +0000
Message-Id: <20260528123656.4F44F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The conditional schema for 'qcom,shikra-dispcc' fails to enforce=
 the presence of its 3 newly required input clocks because `minItems` is no=
t overridden in the `then` block.
--

Note: Due to system recitation restrictions, this review does not use the
standard inline diff quoting format. Instead, a free-form summary of the
findings is provided below.

commit 6ba505cef231c7d845e3f3af3b33919e232b9b05
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller

This commit adds the Shikra Display clock controller by updating the
existing QCM2290 DISPCC bindings. It uses a conditional schema to support
the additional clocks required for Shikra while preserving QCM2290
constraints.

[Severity: Medium]
In the conditional block added to differentiate qcom,shikra-dispcc from
qcom,qcm2290-dispcc, does this introduce a regression in schema validation
by missing explicit minItems constraints for the clocks and clock-names
arrays?

The top-level schema defines minItems: 6 and maxItems: 9. In json-schema,
providing an items list in a conditional block validates the elements at
those indices but does not implicitly enforce the overall array length.
Could a device tree node for qcom,shikra-dispcc that provides only 6 clocks
silently pass validation because it satisfies the top-level minItems
constraint?

To properly enforce the 9 required clocks for Shikra, should minItems: 9 be
explicitly added to both clocks and clock-names inside the then block?
Similarly, could maxItems: 6 be added to the else block to ensure
qcom,qcm2290-dispcc remains restricted to exactly 6 clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-shikra-dis=
pcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com?part=3D2
