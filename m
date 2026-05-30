Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A2282F0A
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780150551; cv=none; b=u2CVoOG88H/9wFT97c+wr+IxZ3cfRxHLy3AMxSGTeYqKQoq4AVLZq/yRmWxJoOVfGk/iQTj9WdQJh95ogwLH1CqmYpeFy/MwCFfYYCVVWgVyzj4fzSexTsXw+yPu07ZGqtWzUauEnPU5nS+sD6WTpEk0kSXB13wkSp43ZOOEbCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780150551; c=relaxed/simple;
	bh=4DwwLywD5azGfoJw6OawQwp41anb+6nE+790f+NAWak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bAS7EC7TL7leSrx8FD7CzUs/a4RLX2zQy1qawXkDgiBQXi2+YP/7KZhSTbrL6GbcW3ewt+0pNZcc+nuC9epz8sNo7xccE9c/GClT7LApPHSj5P5Nl+g77JED6052ut8fhYU2gugfJVhws1Kb/5fbbDbENP/oR5thgIANUuMKbQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANp2+XQk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANp2+XQk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5421F00893;
	Sat, 30 May 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780150550;
	bh=biUWvstyKVxk4EnKhd8SPpcBuJBLkErNtzv4/EwKl5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ANp2+XQkIk39ucTlCb+lNjdS54wLyPhag6qNiE5HUqpxkMLmCafMd2X77XZCikJm4
	 WQ6q79UYSJGNXt0el0dVkiwASqDpFfLTQYjcktx5BmqvFmXwbJ9nzG090hFzmBcij+
	 HJXJ+hmnQENjZrN30soUOGeiYCR2gORFyF1wQ9Iqav921aWH446tM9tnkHLseg324k
	 lmxG2FBdBJzdEnNrJrwhPXW/Ym1wyAIBDpCExQpyqTQmPm9rg4XfLvJne8UkWPXtyU
	 85Xj9dnbknygBv4JSCdxD7dfx0G6xd7ccRP8N4WVJIVv/hgDuGxg9+Q4DDrw1nUo1f
	 /5AgwjgHcK+qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: add lcc-msm8660 LPASS
 clock IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <942e4109a23de49ebd660272b9c6a5ac1677637f.1780148149.git.github.com@herrie.org>
References: <942e4109a23de49ebd660272b9c6a5ac1677637f.1780148149.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 14:15:49 +0000
Message-Id: <20260530141550.0D5421F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit introduces a new dt-bindings header for the MSM8x60 LPAS=
S Clock Controller but entirely omits the required update to the correspond=
ing YAML schema (`Documentation/devicetree/bindings/clock/qcom,lcc.yaml`).
--

commit 2ab7502c050fb596d568ab63294755ed48d68189
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: clock: qcom: add lcc-msm8660 LPASS clock IDs

This commit introduces the device tree binding clock-ID header for the
MSM8x60 family Low Power Audio SubSystem Clock Controller. The header
enumerates the LPASS clocks to prepare for the new driver.

> diff --git a/include/dt-bindings/clock/qcom,lcc-msm8660.h b/include/dt-bi=
ndings/clock/qcom,lcc-msm8660.h
> new file mode 100644
> index 0000000000000..d5d9b0d71a78f
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,lcc-msm8660.h

[Severity: Low]
Is there a missing update to the corresponding YAML binding schema?

Documentation/devicetree/bindings/clock/qcom,lcc.yaml currently lists
compatible strings like:

properties:
  compatible:
    enum:
      - qcom,lcc-apq8064
      - qcom,lcc-ipq8064
      - qcom,lcc-mdm9615
      - qcom,lcc-msm8960

Should qcom,lcc-msm8660 be added to this enum and any corresponding if-then
conditional blocks to allow device tree nodes using this compatible string
to pass validation?

> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_LCC_MSM8660_H
> +#define _DT_BINDINGS_CLK_LCC_MSM8660_H

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780148149.gi=
t.github.com@herrie.org?part=3D1
