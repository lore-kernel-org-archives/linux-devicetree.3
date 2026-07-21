Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC6319871;
	Tue, 21 Jul 2026 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640134; cv=none; b=LMS+G7Qyd1P1mOCuUYtRJ/MZjIeC+UF27D9e2m7GQpt1piirkGvstNhxE5FxN3INxujHdqpjznLYlkyA2r8UEtwXCubme8CvpABQYaoNre0ggA6z2FB/zBITCIGfpZXkiqOqkhXQrsjYGZqC3fpWpCqBB//4hOtSdsoI4eSJ6eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640134; c=relaxed/simple;
	bh=GRtjfZkFhHNd7namDnbIx71A39MuKJND0bayFpRhBiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrLe1nhj4sQr2ARbwZGNrXjSm2B/89rOclaykfw6jaZuyMJkes/dvf+OprrlFy2eDTkBKe7Znf+qhFaq3P0Xyr50PGNfof4fqEIGkWIfr/fDJwH56RiBuRu8cJaOR/CVqIuDm6Grvsq83ygpHmZFMKN7MV4lXZMT43QuFzG9EZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NY7tt2Ti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NY7tt2Ti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13D31F000E9;
	Tue, 21 Jul 2026 13:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784640133;
	bh=LJJ6Wk4w/zgbO1sIzZ0OdXHE0+GWsUYtydfAWC/yWqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NY7tt2TiYtHqXpFHFRtSdQT5VMysUEvkgtvpI5xlDDcWpc17awbzlwJxwbcCdnd3I
	 wCoFMpmbnksnUe8mOKy+HNQCIxuzbK4W0t7BL4Hvv2El8ktENm07lI3LWifT1Xp1RU
	 TOqEreEwWpfRPs7aHZPbOaJ6XYKSZX5Bsz7IiOJIZ1lhfHQpc8X7X1HWB7BoYuLtjz
	 10+DLQeYLXHqLrYJvLBn3k4ETjbrGHBUPuGBnapDV16ZfvBhANqN1gJ/gCA/THVAl+
	 6CaPwPbhgU7s+EdxcbTlNz5Y4GD8KGGCcs160Cwhbpz7tf4WBaaH9oJlNkFv0BIFVY
	 DcUeEQf2YdgGg==
Date: Tue, 21 Jul 2026 08:22:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-kernel@vger.kernel.org, m-chawdhry@ti.com,
	Conor Dooley <conor+dt@kernel.org>, goledhruva@gmail.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>, devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, simona.toaca@nxp.com,
	daniel.baluta@gmail.com
Subject: Re: [PATCH] regulator: dt-bindings: tps51632: Convert to DT schema
Message-ID: <178464013125.3249732.10917160634713369419.robh@kernel.org>
References: <20260717-ti-regulator-tp-v1-1-a49d41dc56d3@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-ti-regulator-tp-v1-1-a49d41dc56d3@gmail.com>


On Fri, 17 Jul 2026 02:54:03 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments TPS51632 Voltage regulators from legacy text
> to DT schema. No functional changes are introduced.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/regulator/ti,tps51632.yaml | 55 ++++++++++++++++++++++
>  .../bindings/regulator/tps51632-regulator.txt      | 27 -----------
>  2 files changed, 55 insertions(+), 27 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

