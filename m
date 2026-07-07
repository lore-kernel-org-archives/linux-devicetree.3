Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E193E4C6B;
	Tue,  7 Jul 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420015; cv=none; b=FcbDO2760GedZrARWxzHbS3O46RJekREVqk/pEiKqPMj+MBsg03gD6haoCU1CGJyLWQ506Y18hkH9ITwr1tmHJCo33KuOgnTFNbBz1SQYc1OCEGMU6o+pbgPn30OCuoxpI4jYGA7dsjt7JvPpntDVY5FqTsQHgF1KMQwylJP2e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420015; c=relaxed/simple;
	bh=iAcz364t3FoX2TCUAcAuduxKI3QdC831V2IbpTjpXDg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E/tuBNzib9IXnSQQ5CQAmGcHwwFKcrxU8TNI6HWj/zkGo7WL60svAr7KDF2ZCzPi0xq+Rdl/O9XbR4J8CRfxt10qW0bhtb+2HT1QOCEaMu+Rwdb8IMkZcLxvFfczRMJK+JJJ34cxTXqZ/8rw58+2Irz+WhffAIhZwI6pmbdWbUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Dw5HJnB8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Dw5HJnB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783420010;
	bh=iAcz364t3FoX2TCUAcAuduxKI3QdC831V2IbpTjpXDg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Dw5HJnB8WUMYkDGlVIpeW6r4tT5en5+h0xhLD3OlsNHH1qFImBajZ8yZWLLvCQ2BV
	 jIZK2GEeruorK96gOit+0EJ6+6ScZ13z8LHTcmsQ5HkpqfMhPoNcYZZkOiPiTGtMcL
	 mGxnvYNB4ZvODMuVTyjRiyNQkmcqKysn4zcjKC1PXys4BkoAZFrhFWoGjNzGjGP38P
	 MJ50X787lPu3dA4TK5iDkm4CEbD3FuDyjq29pw7xQ81N2QSsolMvlnrXTCAspaATS7
	 O0d5QilA3AjlsPs7Qw1n243gCBdvWRPEJ2a9TRVqHnS3rEroXjSwR3IdcmkjbCAKcE
	 JDtbcPim8k0sg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEB3817E0C88;
	Tue, 07 Jul 2026 12:26:49 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101850.341418-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101850.341418-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: mediatek: mt8127: Correct indentation
Message-Id: <178342000992.174135.12358017773363709915.b4-ty@b4>
Date: Tue, 07 Jul 2026 12:26:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 06 Jul 2026 12:18:51 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Applied to v7.2-next/dts32, thanks!

[1/1] ARM: dts: mediatek: mt8127: Correct indentation
      commit: 1ff741220d7b11993569b5c3572e96722026bca4

Cheers,
Angelo


