Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F195143D4ED
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905208; cv=none; b=RBLtl5WnH8TMHo26qt71PrYyupyxLfJ4h8piTTqNEtX2Dz1aEqhL6QHfSFJVrongajwzH4Tyur69orWXZYIxkBjpoVxH9F1yS+//gyTAMuLJJxfBPqyrJZygOpjMiUDqTHld+ystAoEN7PNMD6IlIIp68nHBxvKAToQapbOm8XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905208; c=relaxed/simple;
	bh=UGR7sklv+yVmoPff446S+Uk9T/WEgf0DNWiolB+wQp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aCIyeeysTjGzH3GSK3M4YdOcvGrJ5p//T988dUYOpfHAiNnR9EM47k5o9hMz74mhQipHP/lWLSZdwZ9Wku1T3zsYhCyHYGcGWCdwsva2hM7LlCuwH4GaRWGanKF/d6XLJcmL/igqkirZSbSMczJJFPFWcp+bBslAK+TvXsv+bgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4gE8m2T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4gE8m2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0331F000E9;
	Wed,  1 Jul 2026 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782905207;
	bh=UGR7sklv+yVmoPff446S+Uk9T/WEgf0DNWiolB+wQp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d4gE8m2TSE220UYDkcmZR/tYpycEQ8157/JYVng77H8k6FA0e/hEAcFZl+U3NuH3A
	 re45U2RWEne95BJd7vC96SgVrPX57oFQmWoBGeXlJ6y9cXOn8bFpyBkqHlxAJdL0+y
	 WBY9qQx+vF/2sxnINjx5GtgqD5lfGFazgIjKJ6k0w7lFKaf/Ab01MpkaLCcP+x4gcR
	 nKJXv8tPWbKdu/GNjxiI0929pIF4lErNAD37z13M1PdTIfuzob1j9v2kqgtL+Bnc/l
	 mmqjz4OrK3YE7LK6cmDmmDDKEy5dTA2XfpvG8KB/7aSr8teTo+ZkyMmnf+j5cYuT6i
	 WkhwiAITsTGCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] ASoC: qcom: Add QAIF shared data structures
 and variant interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701105757.2779738-4-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-4-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 11:26:46 +0000
Message-Id: <20260701112647.0D0331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to define QAIF-private MI2S port IDs f=
or the senary and septenary interfaces, but they are completely missing fro=
m the code.
--

commit 8d9f33afe0d4dfdd253d758e8763fc39a3c80578
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF shared data structures and variant interface

Add shared data structures, register field definitions, and variant
descriptors for the Qualcomm Audio Interface (QAIF). This introduces
the common headers needed by the CPU DAI and PCM platform drivers
for DMA channel allocation and interrupt handling.

> Also define the QAIF-private MI2S port IDs used for the senary and
> septenary interfaces.

[Severity: Medium]
Is this description accurate? Looking at the code added in qaif.h, it does
not appear to include any definitions for QAIF-private MI2S port IDs for
the senary and septenary interfaces.=20

Did these definitions get left out of this patch, or should the commit
message be updated to reflect the current code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701105757.2779=
738-1-harendra.gautam@oss.qualcomm.com?part=3D3
