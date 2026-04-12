Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8C53D76
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776008561; cv=none; b=ZwFASeOvdT85baYiVByEoSZCbM2dIAQfhTzpNbDN8Q+ngVVn1heaDmGAMBmdyogvdr2Q6d2afzapDacyU/Yvht6ndVZNUto66MeKTCRPGOqSs9zV8/4c6JOuVjxh0uttnf6YdDsxbtbWKskFFnCICtsBIjp2UhLg3OKC/EQKVhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776008561; c=relaxed/simple;
	bh=9CJk1t9F5SlcrGWRfmBpqYFSi3T6SQXOkmV4qt1SDp0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M3wKR8tAJ7QYRtdxGUdqnK4A9a/1mxeAB+2p1jYeKmwO20Ual+x46pfGu8xqtTBJ0TPJ45HIgdTqrr4i+4kyzyrqmOnkQPmbPeLV5hbpv8w2MCr6IsWFJtSr1tiQza7boeNWuS580mYOcf8RVHYY5OKzBJnhikM32PPaIMI4cIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gAUnYHhP; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gAUnYHhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776008558; x=1776267758;
	bh=Bew5KmnMorYR9Zy4h2US12KItYTg2WZYjqhq27DwyJ8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gAUnYHhPlCE+E7gw3mtMPsgFK2cide3XojrrNiUp8f9iJQBvBNhh6JHmEERdXjEvx
	 MR8FEmWV6P+uBzWo9+Q7A34fcEvidCd+NiiB7KEXwNjZL7CAvs4o6x0aTZk3TKqEFp
	 7YfxC9ygz3WzXcLXnHg5XIigcHUNXVuIFsPl3PQfkS8Lp5L0qC4Unz0+S+swFBlMKq
	 5pEbIZ4vUlD5lLq3kgipufPdgwnx7+Gf4ISpO9KZThhBuNlUlb2okcHgyWeKGRVig8
	 b6EyGdtvJLrgeJAuMTLOaAKniHB3lExwEwF0WaVGcmKdvmrJZ2OXdFOjfeK68a8T3F
	 G90so3nrTZ6ag==
Date: Sun, 12 Apr 2026 15:42:33 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] soc: qcom: socinfo: Add SoC ID for SM7750
Message-ID: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 4e8e6fdc8a05e68b6f9295d76e263b00689f5864
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the ID for the SM7750 which is a variant of Eliza, and found on the
Nothing Phone (4a) Pro.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7750
      soc: qcom: socinfo: Add SoC ID for SM7750

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260412-sm7550-id-271d5875311c

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


