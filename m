Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73040BCD0;
	Thu, 11 Jun 2026 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192156; cv=none; b=ORQpiKWdPByiwHreU5Z5r/29aDgAUZdoTnCEyv6LnGjTwWn9VO2OPWSvI7wfZWu0ATC5y+mkHJcOITz0Ltw/ukSfV4tLtSlm2VQRohK4wO6YN8PMQiRkwipXoRchKrp9+V/ljLMX9FlQdKyAiS9Mm8D7iMSzXrVsCUOhIakuaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192156; c=relaxed/simple;
	bh=kRgy2f2X2db0/MJBsAxfBWhVYjxj58x10FeAWGpoIOY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OD1LqZT/nUF4oMd4C+BdeXu8EAp8oPFVqyWoug7a5RF+sz/yt/SxTQEYcAGmBvXfU6Yl1MmGrG+v+kzYf2EaHbRp+YXW8zMoV0MvQvOQPMTpd48UtwKrnp+JTfKc+CJ5rZzGsBK5csRHrGSDq5ZP3KCp4lCefBRiLucf5bMHqpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8tiSgNI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8tiSgNI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E701F00893;
	Thu, 11 Jun 2026 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781192153;
	bh=yHHu3KmrI9zJ+e6R4+US0jxvIkq583Z8aVM5y5adfUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Z8tiSgNIDM/EWWsqzCXO6CUWe/YVGFxQI/lJHr22emjHju6nvrJDfixrn7lCuYlIZ
	 weAWYEvzyXcB5CmYparzKJCBsz6cBKFVgepl3UcydJec1z60DhCwp/Bv3wmKnnijXU
	 BQHQSm7QIzbNr07jYlkto6o8zdOPtmWLMUdKL/klgAuIKJAiBHvW3lun+LUr33hfTv
	 G159nBqXm5wLiUPfLJTQDb29e2xDAFniBaa6lshHlGLFG08pOB1yvxua6T/PM/Zzle
	 CA4jEThbR7zisHOgnDIrbmBWWkkSsHZoskoxwmC5dnPal7DeRsUtIP7tITnwr9grwK
	 4eVei0Cg84Ccg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 lee.lockhey@gmail.com, Marc Kleine-Budde <mkl@pengutronix.de>
In-Reply-To: <20260602-tja1145-support-v6-0-0e0ffc8ee63d@liebherr.com>
References: <20260602-tja1145-support-v6-0-0e0ffc8ee63d@liebherr.com>
Subject: Re: [PATCH v6 0/2] phy: add basic support for NXPs TJA1145 CAN
 transceiver
Message-Id: <178119214911.568088.18225085446293272381.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:05:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 02 Jun 2026 10:25:36 +0200, Dimitri Fedrau wrote:
> Add basic driver support for NXPs TJA1145 CAN transceiver which brings the
> PHY up/down by switching to normal/standby mode using SPI commands.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: add support for NXPs TJA1145 CAN transceiver
      commit: baacd0af457c2505137c4774e71efe044c11b26d
[2/2] phy: add basic support for NXPs TJA1145 CAN transceiver
      commit: e5a9c1c917b59a4aff066b9f317501834c6d5af2

Best regards,
-- 
~Vinod


