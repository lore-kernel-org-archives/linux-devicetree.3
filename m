Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B013D16F4;
	Fri, 10 Apr 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831191; cv=none; b=W4AQKsiI7nZz+wrgzDfBCVgCQQ5MjLkz5dzB9Q8lgvEHR9nu76Qmgv1cdaNTwyAzLlkeTuRfFf4nfwXwgxcz+h1OSP3+yY3bKZoJo+SWgXhs/xKCQSnsEWt8ijbLZf61TJQbSKwrAVt1+RFD3c3YotWWKAAxxfKQlOyq5UmuGqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831191; c=relaxed/simple;
	bh=mgU7ufWgyq5CVWYMIYcZpQp/Lw4+Kvxg3axiC7VuNX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=juwFZZeBdNwtf+B0PE/Pq+vuPG+BJ5bD3uoqsRfKpBjPpRzuInQ9tSVDbeJJQCzUE5e4a7bgnVabF7NB7q0oVRyTen5qX6IlalXvcdVQDiFNiyL9lVYEscxs7P1Aty1jvt+PXP/EZgEn2pCkCdklBq4Ndovy6IQ49Wu8oBsi1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q10meThx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q10meThx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD43C19421;
	Fri, 10 Apr 2026 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775831191;
	bh=mgU7ufWgyq5CVWYMIYcZpQp/Lw4+Kvxg3axiC7VuNX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q10meThxM8vviyNV//BrdxCA3+xM9EXbqlFRxU0K16YF6ej1U0t9gUx+COufYLryh
	 J5RaA/8yVfIkNfCgU11eVkWrSlGZP2T/RpYMcHjH7wPPxwzITAQr3fS4DZoZqG0BjQ
	 cjfBlb3daqmOS0vwxWaTx6NjlTZ3KiUKnuRSpeBGeQ0wV7JQNrF0k4jRyvKjX9b9jq
	 FtzbNehub4MY9XUm+RmipXJmEaKVgUveT3Rc08w3Vnl+nuzNP6c7MaO6n14jcauig0
	 U5dL+Fdi59XCC9QwFrUQ7vJXStfoF6KLQt/Ciljv3f23XVz+87A8zijH+Rtnl63vQO
	 3AQ7cwqjLBuIg==
From: Thomas Gleixner <tglx@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ley Foon Tan
 <leyfoon.tan@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 2/5] irqchip: starfive: Convert the word "jh8100" to
 "jhb100"
In-Reply-To: <20260410090106.622781-3-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
 <20260410090106.622781-3-changhuang.liang@starfivetech.com>
Date: Fri, 10 Apr 2026 16:26:28 +0200
Message-ID: <87cy0628ob.ffs@tglx>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 10 2026 at 02:01, Changhuang Liang wrote:

Please use the documented prefix scheme, i.e. irqchip/....:

Your subject line might be more descriptive when it says:

     Rename jh8100 to jhb100

Thanks,

        tglx
