Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B183DEAFC
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872818; cv=none; b=ifWa0wpAIDG1A2jXRix9TSg8nJjgRy8E386Hum4F6rbTZLfnqBH+OFG2ALC+8VxAOpIFn+K3TwSbicqmSCoDmRSQIfmMkSSfZUHvfoICaVh6SFvYy4GnnW/z+oLs9EGf6BgOZvJbQz7nlWreXHjOAjQuHbEGfAKvXgxjPYyALjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872818; c=relaxed/simple;
	bh=R+L9rApsUvM114JxMJcVGi9mkkcwmIrklypO215KDrA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GKYf396xKKLjYo02Z3u5/zKExh11E50YfAYlReQGcSBebVaRDCRuZuE5MWbvZBbDAXW7NAPsCTpdcf5iwuqpa5vpqkj18VDf/BL7TUl/Zj95qj+shRbzqQd8tQXdW2JZ6jdy5XCUEBFDSXrXrajITaTOyBbOSW76qpZ/udTzyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qhPldFNd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qhPldFNd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 91738C2C643;
	Wed, 27 May 2026 09:06:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAA7B601A1;
	Wed, 27 May 2026 09:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFCD81088845E;
	Wed, 27 May 2026 11:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779872814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0a/+PfGMT4nGVYJzfWGP+b1yQsfSh6fdeD4bxph3NkY=;
	b=qhPldFNdc/avpvYFSkY+2yo8oNUvjDEcwBrLPde6M8Wn+S3m8zWI0l+6kBMV3YoeQsXVds
	KwZjcX8vWzXBa2paW9j/ZfQB55SKs2Ez/0jkXLU6I+u+Xo5aAeS4RazfcQ/YFCwokxsW64
	KtclivLVwIzYV3qoOF+22xFixwLc9wU1DEnQyopq7nxAP+FCtx5Z4cjYAQ15M19gpJv9we
	5W6x/mhcaliPJA3LnXzpvBT/cXdtEBK8+oq9fEISa1x5P45bRUMBFVSc4BFp1s9ob+o2xV
	LU7x87JCskJJDvbboB/slcPeC7YFccZk03yEUvDfB4QfYl4rBg6SbctpPN65Xg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Cheng Ming Lin <linchengming884@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>
In-Reply-To: <20260505013453.980249-1-linchengming884@gmail.com>
References: <20260505013453.980249-1-linchengming884@gmail.com>
Subject: Re: [PATCH v10 0/3] mtd: spi-nand: Add support for randomizer
 feature
Message-Id: <177987281081.3978880.9593755261770176193.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:06:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 05 May 2026 09:34:50 +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> This patch series introduces randomizer support for SPI NAND devices.
> 
> - Patch 1: add the nand-randomizer property to the generic nand-chip.yaml
>            bindings. Instead of using boolean properties, it introduces a
>            uint32 enum (0 or 1). If the property is omitted, the driver
>            will not interfere and will leave the randomizer in its current
>            state.
> - Patch 2: add the initialization logic and the set_randomizer callback
>            to the core framework. The core will now parse the device tree
>            properties and enable or disable the randomizer accordingly
>            during spinand_init.
> - Patch 3: implement the set_randomizer callback specifically for Macronix
>            chips (MX35LF/UF series) to handle the vendor-specific register
>            operations.
> 
> [...]

Applied to nand/next, thanks!

[1/3] dt-bindings: mtd: nand: Add nand-randomizer property
      commit: cf496ebf1380bde700c5d1790c31919eea2f4851
[2/3] mtd: spi-nand: Add support for randomizer
      commit: 874aa8e4b8307cd922979c20dc78df26c05f3c28
[3/3] mtd: spi-nand: macronix: Enable randomizer support
      commit: 474ef6c5196a2d923c75cb318aa83ba790bd381f

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

