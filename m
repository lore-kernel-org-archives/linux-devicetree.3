Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6583A718D;
	Sun,  5 Jul 2026 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285096; cv=none; b=YLNEeNF7XojK3wayu1wLX+NjxQ8YBR10QkGrVDRtY+hrxyWS77ARr6VkwqKa429LEsk0Ud+xjGR7Z6tqpARvUXcMvOIDLHw7671x5OZ6ijqDeEElMirl0bsgyiFOSBClJSVKLRbiUUz9LxQ9edrnAR5dIaiWvehku7RK+/qYsRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285096; c=relaxed/simple;
	bh=XFBlTIGkaWjoNx5xHMtj7Vo+7g0pPQ9tvPKD6GLGrDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FV7w1tCH0VDH2A3gIpX5r9WqKRBdUjsRQWJ8SvtiREBei/v8zxAMSaD0DQlloZZr3YzEKRcLXmDr2xFKVKvNxnFoNIrkV3LFzB7ZufNE/el++I6w/2LA+NbwDW/2OZ5qRnxPFk/NKSQoPtDz96eAU3BcrkjwBB0XdnwWgOD5zXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmr4EvLV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmr4EvLV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E971F00A3A;
	Sun,  5 Jul 2026 20:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285094;
	bh=JvZytdzTTPhNYDU4eJaWvR11B9s+mQ5rAWhVX+g6IYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gmr4EvLVfUzWATf/UbfHbX7YRgeBDr0VncCZW8H/9UYv+Maiyyw5x6A6N0tlDWPam
	 lfNiODjCnTUJ+Z0rv+yU8fzsQOC+JwOvW0eiI+OA4X+g49O71vfVb91GmgugScrMMC
	 uaJXs9xF1I2Qg00f2E2dUxXS+9E4+4ChctITfvPxofRt6FYWsq2706765R8S9SYQ83
	 V6U5r3JyKW+DY7qT7Zc3NkRQ5FB+J0qk6Atlx/dwiqr8VWR6dwpFDt7p5bYYxanAtZ
	 eEnhub35/wGfXM/2nqrB14z8ea80yW4CNPHLkcbvHXAsoW14nE8KkaUTXo2M9jEyya
	 Nlk5oT8kHfCdA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Recognize Snapdragon SDM850
Date: Sun,  5 Jul 2026 15:57:52 -0500
Message-ID: <178328508272.1157743.75958355725119817.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
References: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 27 Jun 2026 19:50:14 +0200, David Heidelberg wrote:
> Useful for sdm850 devices in tree and also will be used by Comma AI comma three
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDM 850
      commit: d529495c991a2b7d07c01622e8b3cb5ec066acee
[2/2] soc: qcom: socinfo: Add SoC ID for SDM850
      commit: 743af1d6a8b4bfa62dd01b5c2d81b1c62ea597f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
