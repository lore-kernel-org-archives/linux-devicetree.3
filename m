Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD993783AE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739009; cv=none; b=DNApKnj9gE3ZanKdac//3r9eClEO6z8Frs7bB3LepKYbVhRd/oJfA/yJd60xqQ7j4SDSMRXLFor9JCgNOi+Ev6MQYAhM1hPW6bP8xiky5JRABZMWIdRnlSb1QL+TWoBBwyuVBTCzS2YdaQu57K78OsnGc7CdLO+9JWm4MPHige4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739009; c=relaxed/simple;
	bh=49Hk1lqKGHsK9LdWnShaP4+H8Z27EY1MyHJGa/NKb9M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lsnl45VxG/hkteOZHOWg5dLOu6Wtm7mqPmSuZBRP49HP6bi4kSTsnxLlL0NEpFT+ANCtG/+Rxen+t84G+mhljL1TLNFfhN0vqBFaAEl+MAfmh1BsNbD6qGREiOWdEGFBIY4NgSCZmQ4VpuPxlB+ou/P/7JRGr16vg3lIkleCQB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwSRWoGF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwSRWoGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26D11F000E9;
	Wed, 22 Jul 2026 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784739005;
	bh=49Hk1lqKGHsK9LdWnShaP4+H8Z27EY1MyHJGa/NKb9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZwSRWoGFj2Y+8t+yEPwKlBHON3rUWh26/8tK8g7xVaW5gfZUxXBedpm+OAFN3d6iq
	 hcGLRJVUvifBXGcvKGklEwSvSO77EFXv0CtAIEE1GxCZlO2H1UNjFzJZaxdtAKWnE6
	 /zUnCphSD5l0Ui8JOZaBH39N3/UznyPOWoAgjQEbeS0fVhDD1AZilkeRRI/Toq4jmf
	 JFaSHXDFS1+xFjHsPDV/TnT6pCux9k8rFPU2xR1SV6sopQGplDstoDoT4y/x+LqNbe
	 MHtYlYz6PTA6BpgX5ac4NMAvWiYYwGB7qeITXsTAwi5vBmANFAl5bDGXZjZrT9Wng6
	 rKGW7cwQfEnkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 16/17] iio: ABI: add docs for ad9910 sysfs and
 debugfs entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722-ad9910-iio-driver-v9-16-459d1df5ac56@analog.com>
References: <20260722-ad9910-iio-driver-v9-0-459d1df5ac56@analog.com>
 <20260722-ad9910-iio-driver-v9-16-459d1df5ac56@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:50:05 +0000
Message-Id: <20260722165005.A26D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the commit message: 'evalutate' instead of 'evaluate'.
--

--- Patch [16]: [PATCH v9 16/17] iio: ABI: add docs for ad9910 sysfs and de=
bugfs entries ---
commit 6cbf23ac724fe7ff961a74139e07818e61cbdebd
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: ABI: add docs for ad9910 sysfs and debugfs entries

This commit adds custom ABI documentation files for the DDS AD9910 sysfs
and debugfs entries.

> The debugfs attributes are read-only and
> evalutate into source channel labels for each DDS core parameter.

[Severity: Low]
This isn't a bug, but there is a typo (evalutate) in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ad9910-iio=
-driver-v9-0-459d1df5ac56@analog.com?part=3D16
