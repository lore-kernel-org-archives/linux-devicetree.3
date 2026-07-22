Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1FB3A48E3;
	Wed, 22 Jul 2026 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734025; cv=none; b=D3qAL5iM6mCbAHfz67xN3dITzNjKfEyH0HZIZphajjCQhFzInoFAWSuVlxqPIMUQEjo+I8Eo/ZNWSAnM5lAduEjMfp7ProlkXHh6Zatw6ChpYxICzn5mp9VLFl2CitB4Msh11KOPEjsY0VPCnYF3mEqihKBElbeE51uo0ar4RHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734025; c=relaxed/simple;
	bh=O3tyYzx5FdZ+iMHQcuQzMAgTrDyCaJT/z42fO0EuaRw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pax1IZU8gCaglD5NGhOd/QSiwjGaZSOWhLdzuUCrWVFVtA0zQO7FISUiRpEwjwB2T2OXVWJtrFYZ0ZwTba/1gxP6T6g/UODvRzxNvmAxiQ9/CSkzRdQ3c2v6C4tj+y6i76KQK/hdeQJNLYSJ/TsPHI9pm7+VdXr2YkDyr/eATnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=lnCHSx6R; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="lnCHSx6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784734017;
	bh=waIuGDxzOof05Vhn6AjjPmoLjfrUS90zPIn5MbLu1PU=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=lnCHSx6RJJJ/FNMGq6GCjXdFeUZFW9bzPLhcrXaf5K21B+BxKMAc1VUoJZDPvHn4k
	 h1Jf/kBPDawh3n2oXk1KvNNcbm9jpVHPqgdUkEwuql1s0xJijctTgmaKLYTTeJYnWt
	 B50j4tPhWLJanhtinsmYfKbnEORudQRL0bhPj9EjmnN5RAYpMqmcYNhnrmt3fUAioe
	 abqR6ClYwXtG2v+/kG+F/lgKCt6uEdOl8xVs4Uz85OCbIG62qf+8ECUSXH100tR/nI
	 y4/Rnt5hqxKKPLLgyBEUEjbBiIGr0zZCH6CF7Oc3qafgnmGM/bX0VwyDK/2m4D/TSX
	 4f/yIhcWArxgw==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 715DA656B7;
	Wed, 22 Jul 2026 23:26:57 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706180307.635369-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180307.635369-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Correct indentation
Message-Id: <178473401740.1970914.2575839372513973839.b4-ty@b4>
Date: Thu, 23 Jul 2026 00:56:57 +0930
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 06 Jul 2026 20:03:08 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

