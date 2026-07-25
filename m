Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCC13F4DD6;
	Sat, 25 Jul 2026 16:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997173; cv=none; b=n58Q+n0Yu0QFkrdHJ+EN9QfFv/uuZJ11QQzr3EQJnTubRJoApy0FP/Y1nWg4vgJstq/CO0jtIGBPk/Qnbxno24jxf67dnq3Z/oFjMnDCDdwWcDRjQjC+CKL2QH9Ki0w1Cl5kd9Ke1W21zL1DahvuYki58hXrRA7crfybH5My7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997173; c=relaxed/simple;
	bh=GQtQfB4RzPMEszkisQWizQEqdGjpr4G0KxJVRjC3lZA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bi2o75sSQKjMbhUclv8mHahCDJoOmIfx3t9wC41e7BlOtIcKntdo0mgytTep+CBqoXa9vuirtXZo9oXDTusBJW+k+sOCqHX4vFhCegJhR4wJZ5T8tyUJJH9kv5njceB6kymIF14lJJp62qo2ZmahpcWkvz65zQG7dVC5zU3r2Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB0IFhhC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB0IFhhC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E361F000E9;
	Sat, 25 Jul 2026 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997171;
	bh=lgX4TZwd/q8I9GfoBn2GHUK8k1wrjatw4FjW65ynwbI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=YB0IFhhC0yLDypt31DK+w4LtxBJRIUCbWT1JJVNn3pXVBF2ZKzP2ZUFX9oxRvOt5d
	 dVxM+wbV30zuqBV+8vHOhfNJ74ZyrlZS+KeJZyBJHN2q2ZtSSFHsM3Alh27kiNpezJ
	 J9bgeEn539BWWQ/l7T6UwNExvRjzq1R+26Q/P/I3eNvDXCwtPZev0NGKew6fhf+ZkV
	 TBF/iu66auQDYyK2tbrDeyC9EP/8WvE+vDmf+UpCCAfqISrRQMIt2zQmgJnKJwuuf3
	 JVSpdPJb0kRSRUDdtffOz0CHZGZc7uFF86sti5zjBw6Xsr7qyTrmpmfzKh3QDlqqCQ
	 9BDxjBtQsFYRw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101805.341103-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101805.341103-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: vt8500: Correct indentation
Message-Id: <178499716871.107055.15917286098671074404.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:32:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 06 Jul 2026 12:18:06 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: vt8500: Correct indentation
      https://git.kernel.org/krzk/linux-dt/c/eed86f8c39a2f76c1b0b017aecb63b3a8a53eda8

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

