Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3544F30C15E
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957476; cv=none; b=EZjPYfpeICJ/v0y2tJhySWhYId4Ar+MYagZ30+UlQooNNbl69fppE2lHRqGqDlhJnG+Y9014hua8yZa17iwnr0grimCKXtkta65kca5vsR3ZEEW9k/dHguhXwGgjiAFefd+uO/bkln8eqWg7WlJFW6j1c4m0A9SogiFiaJSa5RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957476; c=relaxed/simple;
	bh=QKi5IsZ4kDqK3bTJCUVUH8uPaBM+aMUIRIwU8R179U4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H47CmzS1yvZaG+O3hcIMIybz93CS6YqEYwQvm7tHJV0xLj/M3GuRbTf3cNWCotjNeG9hcAKcU6DgWMsm4pKLPMS+Q4nNXGkczqo5ZbdTLHH55WHd5CXyuD2eSScnCBKsFoXxMjjLoev2bGtjzx8h+wwLFN3YavqScUtPwe9Q99g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9Sr65ln; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9Sr65ln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD531F000E9;
	Thu, 28 May 2026 08:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779957474;
	bh=QKi5IsZ4kDqK3bTJCUVUH8uPaBM+aMUIRIwU8R179U4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f9Sr65lnvtWblIfAE6h+oH1dUKkyWnppwPko6ZzCVUw4yNKBuK8IWkklIFPkI4aYU
	 ikNfCoWmhi2uifrNBRYLC8nx04BjXG/1R1DsFHmPmr1CEAcou1VCp2t7bn6iTB3qQQ
	 cTcmls6LBSEdKOmHua5xY1Z4If5KCzqNTdHM9V57qxPrR3rQ15i+/aPl5x65/2Dxz0
	 f0ehlgDXkBSMkrxJrQ8QVlAL2ubZsKDgzby5j8AkrPpNqdkUXzXLmXQfPDCdsInp4l
	 78igUZHiDYEiYR3vpv0eePfGz/xOl0qoZeN7SXHiIVUJQF1XH7+EybLYcGy85Sroou
	 CwK3EVcGz3BHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ARM: dts: gemini: Fix partition offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528-gemini-fix-sq201-fis-offset-v2-1-f594d3072fe6@kernel.org>
References: <20260528-gemini-fix-sq201-fis-offset-v2-1-f594d3072fe6@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 08:37:53 +0000
Message-Id: <20260528083754.5FD531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message contains a mathematical error in the erase bl=
ock size calculation.
--

commit 3498d075283f73f081890402c85d101fe06af7f5
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: gemini: Fix partition offsets

This commit fixes the FIS partition offsets for Gemini devicetrees by chang=
ing
the fis-index-block to 0x7f, aligning with the expected eraseblock at 0xfe0=
000.

> These FIS partition offsets were never right: the comment clearly
> states the FIS index is at 0xfe0000 and 0x7f * 0x200000 is
> 0xfe0000.

[Severity: Medium]
Is the block size multiplier in this description accurate? 0x7f multiplied =
by
0x200000 is actually 0xfe00000. To reach 0xfe0000, the multiplier would need
to be 0x20000. Could the commit message be updated to reflect the correct
erase block size?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-gemini-fix=
-sq201-fis-offset-v2-1-f594d3072fe6@kernel.org?part=3D1
