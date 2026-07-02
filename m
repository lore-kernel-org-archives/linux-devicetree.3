Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B43C3F86EE;
	Thu,  2 Jul 2026 23:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035668; cv=none; b=n03WvUdD3nfzQ39W1uDClD+Lw5OCsxeKH0Sx3288Tvcw8CJX2O7tTrtAS2z8P9uZThaj6bwDqcXWHtb5CnXoJfdoxshXxCvSfq5CO7wcqFZLNN9J3tZK0+Uk8F4GMvTQjwysAF6mOcPgh28qQw6giwqDRTq0utZKpQrYD0+jLo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035668; c=relaxed/simple;
	bh=oDAuran5rWAUK2aXIW8B4THXnsk2HdpP5XpjNqgeTWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XMwOEugupxraSJ2eBkJ2gK/sgYVi7w/qk6NIDkiUymmmwA7PuAeHjNjD0SrC0oh9DvaED9tHB0GGfnhh977AF6qVUWXJoQQYqtdtukdnElN8TzE0LDIFwLtdfMmDNIxy+crduF0tvmXABkDzblNeUY9UlWsqy0p/KTUTceDRWqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mt60bdGp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mt60bdGp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B741F00A3F;
	Thu,  2 Jul 2026 23:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035666;
	bh=bGnmPvJowl+CEcasEwog1BUjCkQ7CQc76zasHkD3eCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mt60bdGpuRMsyPsTHGLwA9cdBE7H/BKKg/0eGcmI0esZXhS9Rs7qKS5417c6DYB3J
	 KLIpsNA9iJy9iE2NaM5QUqaJuJEbuczoRR/xbEoYJRuRIlaqtHsKXpsikLOD9YGXEL
	 MUfDixp603dBJeY8MyEVmBc11AJjMC51AUkG6DvujjqEWe89NPaoS3WRD0YYA8dBGJ
	 XqxUzjhnULbRmt+/1sSKxR3eOCjLKAXnzfQ1MqNpdTx2Buk5m9p2U9yx/y8oaAAdCg
	 vCX+bi3yrBf5OFKbGPk5gaOiPGC3SZGogEiWBGWVtvVVt9zlIRcVMkgnnE7RfoQYq4
	 5HciabU/o1Hog==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc map entries
Date: Thu,  2 Jul 2026 18:40:41 -0500
Message-ID: <178303563656.359079.2329248138300631847.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419173251.1180026-1-mitltlatltl@gmail.com>
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Apr 2026 01:32:49 +0800, Pengyu Luo wrote:
> pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
> are mapped to them respectively, so add the map entries from pdc to
> gic. These entries are reversed from .data section of qcgpio.sys
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sc8280xp: add several missing pdc map entries
      commit: 96f65d01f3132a163a8c0e84aca00f2acdc75e9b
[2/2] arm64: dts: qcom: sc8280xp: gaokun3: correct EC interrupt pin
      commit: 6267f93eac9aa6963797c5bc1a18de9571ccac26

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
