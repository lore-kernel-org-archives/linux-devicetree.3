Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBDE3F483D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278696; cv=none; b=HwAsmDJZuLnpyppkQ5POR+96UhCTh48NCL0xwXME3pWSfvH80i/aXsKXyPoDuxmyfAHOuBKVRuWlv1Iv3mpV7oi4XUtO9wiQgMfmmKHQ4orRlhW/IoLVA8NR0on2HhqHCU+9gB5otlUZ/5Pv9sRAbHrB0giemz+Q2g76Th6HZ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278696; c=relaxed/simple;
	bh=G4B6iJmgEii0PH5wrXFpz5ZH9/DJYvlE8R+/jj0Jmbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msHAOIZVbvT+CVjfekfzwlZAqA09HGtUcBNwv8Gu0vJbd7f4oEXuA32ZAWHlIspy6Ezkf/H13ZRTskCI1qhFYI7CjZ51RJlf6n9eGZvknasTbpSO4wKzpzTsV3E3AlbUGCg1uiwYXW0Oo/rhhvlRXCoXGy8pna9hhUHwidrLPXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=VeqZEvld; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="VeqZEvld"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9FB4B240029
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790278688;
	bh=BhMwdc9kU8ukM6cqNNgzURr/onUpQKjpmPkHjzx8HYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=VeqZEvldUg2iP/sD7aheKrIlc51Lbsu7WsIuLYwdGF4xcWEgXdIw+HDvvV0UTlfAe
	 ee8XLHZkHfNC3DUZf8nFbpzC5FnTg3haFg46NNO5zDa51xR+x3y/YA7gGfhbPHsehj
	 0XjJle/df8qFilEjwvm4jUHFg3YPGT+iRGENGZ9cE6owCjLwyVcWahdM7R+7RKpCdJ
	 OdOQH7BdlkOLIzDhzcw/nn+PFYNisAUFC+0dt+mXgCpkDGaTIAgfvXG1Ck82PjwW1l
	 sFbsu4jkYwnRvHoNbn65lSYbGQtyBAEgbA+AoBbLcYZK2qTXNeUzI8shdakoiJpuud
	 Phxd87x5aOnog==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrPJF4bCjz6txv;
	Thu, 24 Sep 2026 21:38:05 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH 0/2] arm64: dts: st: fix sai3b unit address on stm32mp2
Date: Thu, 24 Sep 2026 19:38:07 +0000
Message-ID: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sai3b node on stm32mp251 and stm32mp231 has a unit address taken
from the secure alias of SAI3, while its reg property and all other SAI
nodes use the non-secure alias. The reg property is correct, so there
is no functional change.

The typo comes from two different commits, so each SoC gets its own
patch with its own Fixes tag.

Mateusz Nowicki (2):
  arm64: dts: st: fix sai3b unit address on stm32mp251
  arm64: dts: st: fix sai3b unit address on stm32mp231

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
-- 
2.55.0

