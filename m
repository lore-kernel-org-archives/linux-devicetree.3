Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530536;
	b=EheOyb42Vi7REz9TRJdNZS5s45aUOEVGjE+XuJ76TEbs4uIzhlafRwzQUOuEt2tmkBKS
	 Zrip6Uw0xrlLR2ksXRE2JrEDMx8CKueS8QYfitlOv2ohtGbDuRv4bq1xKeNitYzf1i7Uo
	 9mKuKohWPNHKqboUkVLUAfh2mYRaBlVYhSdzzbuNeowTnEdzsBO4e/jcxQjSkNo7FGy6d
	 8igmRCviAU0qsYAP0CnLqQEHS5xVAhIwuOg83EYgjZZUcHUPAdzZ2Lf9yZctSct7jhgpt
	 kFActWo4J1H87icfu77XBeqRa/rilHiu0SOwUitkqVyihmV5JtSGTjOQlxYRH5dGBMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530536;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=VcL3rj8UTzKfvpsBbOOp/bQe6jtFGG5Kxst45YH4cQY=;
	b=KnXK2aLKmUw9qHzFnx2BBTrYWcX/N7hKo0j9QD7+wCG8SxI/IcHBv8XjFhfw6UkQu64M
	 3F7cf3YJHxC1dqbofQxiBI9r/yLeiMv1fiFFGny3RNGJmYszK7erKHh7aj9LVrdigkz39
	 wgsj2DAVUhajUt33j8RFl1/HR7mH9Zxn0IUq0PVRJbh/F0fTFoEYePBlToxYykoWGNcIL
	 C+HelfFTFvhELYUfuUsvuP4+c9O4k8DYGOdxbRJ4q1geElBmAxCkhVEd1F7cQC/lhDda0
	 i3dIaGnOyH2nnq+l7B5uxXIgZ/fEtHpfb/SzHVBpD93aXWQDgEI7GHDzLn1IpTR/JeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Dk6Weovo;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6D606A32E;
	Tue, 24 Nov 2026 14:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B6D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Dk6Weovo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795530534;
	bh=1WrWwuxr1fE+LJ5lgDYFWIOOScC5de9NtjpElFZEmR0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dk6WeovoWPBai4ppzYY2SnCUUYvaEOpz+GGKM9GdvmoWIbIPv8fcofauohVz1pk5G
	 kvnKvnPsEk4e1newry8sam1klQoIqOGcUudih3i6IHAso+TYMyBxiZqmU0AAtlMgMD
	 iyZ1mZzpGTIHye0jAU9uEceuKNUSpj2ES76H9E/BMY74dLldaSf3jNTeOKA2C8Ec9J
	 F1YJTJ/3aSm2FCtAwPM626+B8ggEWuhLAxrEXa8S87B12HODeapT8vrIx82jmsXsGz
	 UGeOtb9vuJ3e2dRtqKXIKkkThMq/6nc4tD6ATnoI6IZCo6pTPdBOiVH4OgyegTFX+d
	 4r6vjecYAuDdQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB3C817E047C;
	Tue, 24 Nov 2026 15:28:53 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20261119-mtk-genio-boards-wdg-fix-v1-1-a2d23746a07a@collabora.com>
References: <20261119-mtk-genio-boards-wdg-fix-v1-1-a2d23746a07a@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Move watchdog disable external
 reset to chromebooks
Message-Id: <179553053384.64247.14935970528940939897.b4-ty@b4>
Date: Tue, 24 Nov 2026 15:28:53 +0100
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

On Thu, 19 Nov 2026 17:42:51 +0100, Louis-Alexis Eyraud wrote:
> On Genio platforms, the external reset (PMIC_WATCHDOG pin) is routed to
> the PMIC, so that once the watchdog is triggered, the PMIC also gets
> reset. Meanwhile, on Chromebooks, the PMIC is reset by the Embedded
> Controller (EC), so no external reset signal is needed.
> 
> For this reason, Genio platforms need the external reset to be triggered
> in order to be able to properly boot, but the current DTs disable the
> external reset at the common SoC dtsi. Move this property to the
> Chromebook base board dtsi instead.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Move watchdog disable external reset to chromebooks
      commit: c9b3683042200620c60d4b89c4a95628f676d9c4

Cheers,
Angelo


