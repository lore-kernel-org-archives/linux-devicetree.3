Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5273DCD8A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011427; cv=none; b=DmOkpQKizy54+b5G5rb0oRvrWv+Sr3Zl4AxLAeDp2003xAH9wQM72sIja7zit7qfvDgzJiprhlYsQxKcgoeTJrbRdeILGRG4XE44b5v27qvRIYbuwP9qQwcJ5ZfdgfCZbb1LTlFV4POrnV2FdCRdpKPT7f/lVC6K35UBtbSXmnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011427; c=relaxed/simple;
	bh=S5A8GX72RWpODAWp0DP2UlA8eGNuqfvZzunEDVXYIRg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NXBC937DsgQGCo/W2ltSRO5dx7AVAnbV71wyCZTw2RJZfZxQ/tBAzqciWDZ33/kHBh+7nIHfhqY/qSMejs4582Uo+6AI2BOY30KZgKSCbfumHhZBWhEF1Ka5zl69LzJrrU2MnuPyi00K/Mgnzy/FFVlNfu+nnaeCycU+y0k4IWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNOAbFj0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNOAbFj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78AB1F000E9;
	Tue, 14 Jul 2026 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784011426;
	bh=S5A8GX72RWpODAWp0DP2UlA8eGNuqfvZzunEDVXYIRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WNOAbFj0TrLa1NnlO0/M8McVrI4Py9RJ4DIrSO82MVKN6osuD3cVFhg1EsWaPJIF2
	 UoKLeiwoLKVl9dYIQL27jldS88eouqtCJTi6e4tKEk8/jtcfeTjjr6Zvpid8KsNeKQ
	 xGslgrfdvEsH1jvvAwaSuZr2KPsnHEX14xmpmzhVnpbL+geHPGvBs9J6t2NnfRiO7W
	 Yhbk3CLLKQ2LQyC2sy07sWH5RzHkRiaj1DhgeSSFpJZtYCUZz8nkwznO+RAd/pSlr7
	 x0TN8VOxzSNmUog+IBUqxcOLV9Mx2mSY0NnmkLY0PHZ3bsTo1Vbwa6XLQErHelq9l5
	 L4Ut2Xk87dm5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 SM8475 QMP PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714-sm8475-bup-v1-1-b2871be2b4ec@proton.me>
References: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
 <20260714-sm8475-bup-v1-1-b2871be2b4ec@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 06:43:45 +0000
Message-Id: <20260714064345.D78AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to add a new init sequence for the SM8=
475 PHY, but the corresponding driver code changes are entirely missing.
--

--- Patch [1]: [PATCH 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Ad=
d SM8475 QMP PHY ---
commit 511fead6a1f7627fcd9ae2107b3dc71763bca629
Author: Esteban Urrutia <esteuwu@proton.me>

dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add SM8475 QMP PHY

This commit adds the device tree bindings for the SM8475 QMP PCIe PHY. The
commit message states that a proper init sequence is also being added for
this SoC.

> SM8450 init sequence for this PHY varies significantly and can't be reused
> in SM8475.
> Add proper init sequence and bindings for the PHY found in this SoC.

[Severity: Medium]
Is the driver code containing the init sequence missing from this patch?

The commit message explicitly states it is adding the proper init sequence,
but the patch only modifies the YAML bindings in
Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml.

Should there be a corresponding C driver file included here, or should the
commit message be updated to reflect that only the bindings are being
added?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-sm8475-bup=
-v1-0-b2871be2b4ec@proton.me?part=3D1
