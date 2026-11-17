Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913160;
	b=WkvYmr/POpi2HaLK8ffkw4SppqMCQ4GEyaWN7XDo4hisxgp5Y0XygY4cLckaNqm9eU9H
	 gN92dhiHgwwfWHeArl/JgT+5LymVV9gCfAx/QgApXj/xf9/lijv+Tb5WB/ijkHQip9Qkd
	 xUZl7OBAz8r8CgKR5kZY495lBxxk63XxESufz9br8fTH7L9GbfjoKegqz2b67/eQIlYXl
	 CwZu3Pq8dFVrdCcmmxDsBG1KeENEhugEO5T/By5waKoIW3QwXXOS+iLhxnsFyf3fxlU3f
	 a0Le3yJixHau2PDZV7CQVQdnXBeIDuieB3eV5Qbc+uEQNlu+ZfpaimcrpxrqWlSfn0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913160;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=YhC7LMQsZJcFBItk5rzBnnu116ZCqPDPAdrEnbFmiXE=;
	b=tgJbQils65BaB/TnhlAOrPVE25eS6rWQTl/WquBujl6WuaaTt2CHQfl4b6S5PFkuIGKI
	 +iO7PUiDbp8f8Sz7CJeoyLYaAUBciWflE90xsPdpHVKViSNGm8oTKoXHkM6DGLXTQAvuF
	 /mJNKaB4ELg3L/1WOIBYL2069m3eVbRKg2gPlFwB9o7azCcK3PSX0WJ4U6WHyC3iWgy0x
	 SwSaNjALHzrVwlLvCCoXQS6XQuGhlBJJz81is1c8Ci9HrUGyyzAkWKjzT3qIkuDpIZ1p5
	 K5r5xqnS1k6FME+i6lJaoFVEXww12TTLkr2Kkw7rod8R/mwHBYsG3/bEXqJKMxiVz/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dy2z7c0V;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D6606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F5D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dy2z7c0V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913157;
	bh=TNPoh1km3RiLkwQBgyHz7qvbpEpaEwiiICoDpf0eB/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dy2z7c0VuQ79pLm0D14yDXpjXmOH662JG6Nidn/5yWAT2HeHmYfuDWKBSgDdKheWb
	 cm7Va7bCYdSZEpFd8RE1TJzSt1SdzXFRsbd5caCwn//ww82a4CaT7sj0gkU087ZKvN
	 3FgiC5SpX3fK0scmLeQnuJt7WgvJV6gdU7iy/zpjgJA6cx2HDdeuIFX8vY9OiqwvDo
	 67rU2473FAon/iZ2+JbANwzqhxAXMl9oBp1NzGcEcBnPVT4jFDsB/q0j5Gzwiqo4jV
	 Zi5GyVEFI68u/TnN/aWk/4xbHf2nXb8mDzYRpBxy4sfHtRxFoegWB3YVIgWyRKz3gJ
	 qmTJPeqLxACIQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A13417E07EC;
	Tue, 17 Nov 2026 11:59:17 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: mediatek: mt8173-elm:
 regulator cleanup
Message-Id: <179491315750.156157.4493365052621090774.b4-ty@b4>
Date: Tue, 17 Nov 2026 11:59:17 +0100
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

On Mon, 09 Nov 2026 22:12:27 +0800, Chen-Yu Tsai wrote:
> This series aligns the regulators in the MT8173 Elm / Hana device trees
> with the schematics and datasheets.
> 
> The comparison and digging through datasheets was mostly done by an
> agent. This was an experiment on my end to see if it could understand
> schematics and datasheets and help with the tedious process of comparing
> all the documents and device tree files. I think the overall results
> were pretty good.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[2/5] arm64: dts: mediatek: mt8173-elm: Fix DA9212 compatible, node names and labels
      commit: b94b23b176a4f358b91610399bcbedc6a85328c0
[3/5] arm64: dts: mediatek: mt8173-elm: Fix DA9212 regulator names
      commit: 2a3238d299a3568dca7bc8ffb6d284364c96c18a
[4/5] arm64: dts: mediatek: mt8173-elm: Tighten MT6397 regulator voltage ranges
      commit: e3c69f848f95979487d4230ce59ccc8efdc207d0
[5/5] arm64: dts: mediatek: mt8173-elm: Tighten DA9212 regulator voltage ranges
      commit: d3551416f5b73a7360e5f1c004a62eb174b82953

Cheers,
Angelo


