Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36852388E5B;
	Sat, 25 Jul 2026 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784996943; cv=none; b=rqMkNxCNQtid52+J7N1wT0gWqDmOwGg7R+0PFgsGGNZXF9pM25tqXA1KIgP2riWfm0d5v2Gki2AnePLiXAVBTqumTNREpyxrkyyjffzGaTcVdJNeGCnq9cPQtgnvd8SIVMoIY1hJTMCjFu1ebN+MCHmePBiQNLb0onI2iKJiMZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784996943; c=relaxed/simple;
	bh=lQoTRCyeM/s0/ewmlmMb4KYfoKaIfG82M4EXn7Pt0lQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f93BpIvhsfVWZHOUN7xkSI+HUtUb2AVBogccL/huTIE6eSBopKBiqOOYGagG1FNsZTAAaahO1Y0VT0W9f6wApP02TV3W44XB1WhUn307ET+OuJnMA7pkyuCS0uw6guB0NdUFZLVbjMQ5/v06V5TAAYyLvgYj4Hiq9muyD5oFx/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlBWyc4h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlBWyc4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A364C1F000E9;
	Sat, 25 Jul 2026 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784996941;
	bh=rNViOu0bmdlKvCzP7R188Vgz0v++cxxXh9hKKsjaDJE=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=LlBWyc4h5AEbwreKkBN/bSuSwFWWU99XSq29oDy5lDPuL7I4a9X15bo7+3/A/WEXb
	 g01GWUxyxrE2jvXUEu+7Ls8cOvhlirHbXjvE1bD4mjCPxMD6G3tNvBUVvbtXHO1vpw
	 iMPt4noT1UIsQCYK3p+nq0d6K+A7/HMNhBF0GoIzvw0ORPwUuWQft9PamsPifOql5K
	 aNAetzbkHjuGM0bDjGo2433BPRhzv01VgmjnmqIp7y4ice9vTq7FgV4Nw+Ai8KkI+U
	 y5bjfqqSaZ6xY0zf+N8b7kQzQztDxkmfoX17GzgZV2Imq6ObPBAviu58Du+pRRa3LS
	 /1pPD5x0RQMRw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Palmer <daniel@thingy.jp>, 
 Romain Perier <romain.perier@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: sigmastar: Correct indentation
Message-Id: <178499693837.105383.1427085500014255717.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:28:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 06 Jul 2026 20:04:05 +0200, Krzysztof Kozlowski wrote:
> Correct indentation to one tab.  No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: sigmastar: Correct indentation
      https://git.kernel.org/krzk/linux-dt/c/fc87f5285304b51b586218d22f7d1f01e72d9328

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

