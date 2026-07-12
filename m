Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7F33537F6;
	Sun, 12 Jul 2026 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783888467; cv=none; b=OPWa8uMATzSWB7JefaEFa0QsoJTd+BPra0lVyZFG33jVOAAAuUwgnHu/a2NvRFaroN5QNyOZKczWFJh622UlHZFR9gooBi6dk42PQBGh0hGuOCoWZ5l8TfniqYqhdhNPs1fDCpsz6trFEINR6c57LvkzxsMCGMPkljQUdW/LPJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783888467; c=relaxed/simple;
	bh=n/MZs0TuoRYJSXw670fFFTjsIp/X92i9iJFBSSHN99Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BLHyYPbL28sk+X/uN1mmxKm2h6UhqeNBujxrJpKoMkYEZ6AApUdT6vyMEjyQbLwSrUbt2zMiD+bbc1FEt3sdTt1+g5Bbu4f/QKcMvS7HvEAw6IX71BPiMeyenr32AS9EL4oWvv4JY1mkKYTR8iGOjWDFuTLSnFa3W4VnhKBstrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=oVOaDuhQ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="oVOaDuhQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=seILppKGTil9XvVHz2w8WcGUv3ZDPAQ7sc+x9QORmZY=; b=oVOaDuhQWudRoQ1btoqyzMjwZr
	Ih8XqMdJdiPg0lwZTHw2qHwAYZfdPgCLS6yDrgOgcy+iLZwgX0OrFM7RGO7Pm63rvjLn7dmUMr0jp
	E7ruvubyhDcJ2+5Z/saUlyVokTaP5XqQ+klKy09x++PUa0qEs7jkpgK27444FapNGXt03v++0IuMA
	OAjQm5GZGJGlHLH0choKlZ3uAdTlmoZNrWqhuVJM25asp8PDZHRpix+Agvxz08QvlmbUcnqsi4ed/
	ev6j2VoyzLP8ortF56dCfvDAPoKlEPWkVT5PKUqdCAoPzmP1EUdW+2Dk3N+VJFBeUbwHER7DU49NU
	K8VVuhAQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Coia Prant <coiaprant@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add devicetree for the Graperain G3568 v2
Date: Sun, 12 Jul 2026 22:33:55 +0200
Message-ID: <178388833988.1396294.17990564182339450982.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702204628.2407308-2-coiaprant@gmail.com>
References: <20260702204628.2407308-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Jul 2026 04:46:26 +0800, Coia Prant wrote:
> Changes in v2:
> - Fix trailing whitespaces and other formatting issues.
> 
> Changes in v3:
> - Picked up Acked-by tag for patch 1.
> - Fixed text wrapping in the commit message of patch 2.
> - Replace the legacy 'gpio' label with 'gpios'.
> - Add the basic WiFi child node.
> - Add the Bluetooth UART child node.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add graperain
      commit: 8885a00d305166fd6e1ba0699228d015424d3bca
[2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
      commit: 441baa62ea364c168dac79b804022154abab2ded
[3/3] arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2
      commit: efca3937b84cbcbcccf88b26a54fb8efaf8bea73

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
