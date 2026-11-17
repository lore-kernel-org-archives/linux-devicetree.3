Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913193;
	b=TJCjz86FT8O7G8oSOu5t+pIn6b0aiISlsSA/ZT2zsyYdKXmYZGCMNWRSF9A0luaWunhA
	 XOmVn1yHbvxDb+cFca5aGY2LQWCv4+L5uF4QFbib7/DTmm+F9qndjTKCerSOmdairYVpL
	 F6KRNS9ZntrMhOnMA+1/wnmzaIJw0zWKo/8u7WW3uZ7MzqOTLiLcrBgRptOYhXGj2ZFBu
	 O54gpL4Q1+nwT//Thpol1vZ+7nwPOkpIQuaQYCVUYnEUPjh2iOi+oYRCT5w5a+8Z5WabW
	 HKC8w+pYN9+ggI5DNVFf9SL4dg4nLdwitKREsbzP2GxSnpSm3aXwR1vegQKj7RwDtSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913193;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=D4QzFqb7Zz3Kw4h7SEQ1KpGp9R9C8saFgSFJQ/eAjQ4=;
	b=Z2siGMeHRPSoKcjdl0vwckWzsh2oXC1f5nV53uvtH+7SF4sxVLI7HaDe1K+1A1STd95U
	 FG5eS3groZwkFeS0pcTkmA098mPgyUhMkKUEDLHLynu5HI9zrEgcLV1w+KmZ4IKl5HivV
	 BGpI1guIZ2qrJyasE5//lyK/a9d/iEFVom/RMJtwXoFs4qbdSWWxU6dGdMs/bEs9eXZG9
	 ClYB3M1gpmt9CO7coR7odoMHbZiw4dp8Ms22q461ZP/sqVHzj90CGRVKoSRk+WIUhZH49
	 immlHsaMumDW4ZbuZstvCyXt47U7vc7tupIenSKMSUgWyg7WpuSjCIjqurkP9A49e6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Yp6Nk3Pw;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64BD606A33D
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64BD606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Yp6Nk3Pw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913191;
	bh=4sqjQ5xqn6KI4BUTRNYtOb2A1Sg7FKy/GIO5i6fVqRc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yp6Nk3PwHh7DyyrBFd7rnQo73o45y/B4M0gC57HkBcUbfMWfNRxCgC/ZcLJIANSdM
	 u7KGzQ0cqnKQ7UDEHXwzc9BtFwim1qQ28MVLdQ7Yo7Wb6ubKLT9cLl0wJFbOOLw7yc
	 AiPBhTqcUNlwrjiixVDZjluP/bkANgIK8v0Pkj4ID8z6BuwN1mnCWdjwGdxpJ9Gfui
	 Zc+0OSZGkoBq6A/t54DeqeqXwD+oFJm0AKlu6w61696g4AtKz7ldOJbooHQ9bM9/E/
	 dT4EiuAIElInY79kYRZlG9ccnZJ8dCVv416YvEQOWViT3tMrHUlpraROpusyGRJcHS
	 zCqlwRPoTeHjw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FD0717E00E8;
	Tue, 17 Nov 2026 11:59:51 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261106060621.2706658-1-wenst@chromium.org>
References: <20261106060621.2706658-1-wenst@chromium.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: mediatek: mt8390-genio-common: USB
 fixes
Message-Id: <179491319100.156320.17530941908872114428.b4-ty@b4>
Date: Tue, 17 Nov 2026 11:59:51 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Fri, 06 Nov 2026 14:06:17 +0800, Chen-Yu Tsai wrote:
> This is v2 of the Genio 510 / 700 EVK USB fixes that came out of the
> MTK XHCI binding fix [1].
> 
> Changes since v1:
> - Patch 1 now also switches the type C port to a source-only port, and
>   limits the source PDO to 5V 1A, matching the hardware (Sashiko)
> - Patch 1 now connects the SuperSpeed and HighSpeed lines to the
>   correct USB hubs
> - New patch 3 fixing swapped USB hub labels
> - Link to v1: https://lore.kernel.org/all/20261103083335.2944847-1-wenst@chromium.org/
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connection
      commit: 1e821a4fb9e852d027a3167facce169f124f4dda
[2/3] arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable pin mux
      commit: 7c5f621c2bae8b84f24460e83e73e46cfd9e315a
[3/3] arm64: dts: mediatek: mt8390-genio-common: Fix swapped USB hub labels
      commit: 272559211b361a38789223a0ac75875b37f55d7a

Cheers,
Angelo


