Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519208;
	b=twkhW0StSnEeZwYdsqCb8yniKNqyftadasUFn+TNg1K6XcxWgJHz35QaKevEbzL+LeAL
	 MUNxUVDZU5Ck2md1ILwzRalT3oM1/dn3NBgxVAlurQiixvWaRkMdOEl4Jfz4PCefZCvqK
	 wBA1JG8ailJMboTmNQdl55KgohjIwEZBCCsWDRPxMlOGT3OrQaUpWFdm/3a1NDb2VEmgB
	 ovx3xGpYX0BD8Z/ASCMXI5eq+ORmjiie9Z2wm21T2eAxJgaJoICbiOLOH4YSMZ3KWDN42
	 g7/4+iDVL/B2l617SVFQGSsbysjI+m7x+6om3g6YUMpDcuN3ssmCvtl8qkPgrgAignQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519208;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=VNPjORy8JoeEXMa1Lz8mEB6eal9NS2Wh4zVR/rld2fc=;
	b=srFLt6KumvItbB9piRq3ZvWIyHs0CHYYSeWmCcsGrhQZ/AElRmy6+A0FuKjAtrdXnY6L
	 ZJqlPVRqNNoSKu0XlPouBNPa+rBCSuLUEOnTjCWQpzTweS+VeslAzldlPp5cwI+FjXbzI
	 mD/ZGYtkrwVWmnhnZQXfD0TueZyQBMKx1G1s5aidYEErigekujzYh7/H8EGTTNYYMXdQB
	 tJFMfHdu7+KgjdKET8GKU94NhHb7a5I0dRqQ5ahPs3eRHspz2QUUdSP/YoVzNhiYGFnCX
	 AXCb+DLhjaLe+tyx/GVCR61VHIioXdM91sCnZ3e9+pHnnRnH7KPqMt8bHpoPyNnE69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WrnYap2y;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF71606A332
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF71606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WrnYap2y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795519206;
	bh=6fsXMJmK4O/BNhpvy+vd9EhR2CA7pbhjshCDGJBlbG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WrnYap2y/eiBoqLt6q3N+O1cDXj6lKMu10KA4dmA5GcjMr5pKzclng0X+X1wLnXsO
	 xvQFeOmx5z88zKaM7TNoZY8PiAce0waTradrQxQqdKsN/WWYTqqFlE/Rnlu05ZKEk6
	 y2GDuDWPTz6j8PEtFcf8YKp1ipQgSlzFwxRV3r/5bfTWZT8vd8YvtPTdYH1gKn3/Z7
	 2v+SirkcTe1clM9hdX043Pc46VAMjApFLjY3Au7VvH7VNM6XxgU7AaOWCeShnbW62W
	 4BJNo3/rhcvrV0Yb2IOKWeUeBKgMX/QP4D1ih+BK2eiZ4MmC0ohpsE1Hk6WMu2qbSx
	 F+W043sSOMyjg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8F1A17E0309;
	Tue, 24 Nov 2026 12:20:05 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261124100420.613422-1-wenst@chromium.org>
References: <20261124100420.613422-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Fix swapped
 regulator ramp delays
Message-Id: <179551920584.37930.10948459664476157710.b4-ty@b4>
Date: Tue, 24 Nov 2026 12:20:05 +0100
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

On Tue, 24 Nov 2026 18:04:19 +0800, Chen-Yu Tsai wrote:
> When the ramp delays were added for the MT6315 regulators, the patch
> had mismatching context (due to unmerged patches in between), and thus
> was applied incorrectly. The result was that the ramp delays ended up
> swapped between vbuck1 and vbuck3.
> 
> Fix them and swap them to the correct regulators.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8192-asurada: Fix swapped regulator ramp delays
      commit: 12820200fb1898f10589c1cf1b70ee64218b66e7

Cheers,
Angelo


