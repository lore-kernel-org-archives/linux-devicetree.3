Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468341;
	b=D6i3bnueYtjJL6+yBti0krEHZl3bnp6HRllt7OypzNUGSReEzVDRhrfj1p4NhM1Sc38x
	 6OT9Z4SrTkCAOnIYr3KAFqw3xBK0CS6vaAsDnDzwCePywrRG5b+0Qube3QMFyVwz44MRh
	 W47f22jFR6jEHdU9DM7DLgptejbBSR2SnROf69mcj9Ziuybd30nvueSKS97lBSzyN85eq
	 A/M6My00lE9ijGTDxjnlxRfx4Cs8gEYolIXkkhBlRf67cFiO7wGqH4ORwiQwpLBDAf9W3
	 nadVuOamGFaUZIxl0SJ4yEQlkjNwmSY38om4x87/5uBoId10hx7J/K1YyBADVIpR4CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468341;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=THwWWjucJLHrTSc8VPkQZeTqtfJVV5aJMHAoWWO0YH8=;
	b=Tvoseqz5bebBoJ89y/09DxSN9SHg3IiG/UNsLW7LNprZND9rv4FuMI+z1uW3oFWAlf6G
	 iGJQgmoT51TB9b+xTKRK2OOilp4z/wZVQq9tO/VoPg7llvEI0hxxSeg4NALEDMbRRs8h6
	 5g375569qu6LTs0tOojz9g/UPGgXQE05Zw0vGduk/0IDbcZkT6gCjRXCv6RFY3IwByD/l
	 ByTyiDBH2/4eYHT1A3UbdtTbYkx5vd6qjWmpgQ7ANq5NIwVSMw6w8izc26lRihRcBXUEy
	 lYvz6ZslFyq0bMVqGidZ4da8DypHa9NPV5OxedNeRNDDBwm44Gxo2pq+gCXyTln6eQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3+VceWB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD8606A31E;
	Mon, 23 Nov 2026 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3+VceWB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B0F1F000D2;
	Mon, 23 Nov 2026 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795468340;
	bh=THwWWjucJLHrTSc8VPkQZeTqtfJVV5aJMHAoWWO0YH8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l3+VceWBOJiFskUO9JkxVGsiHVwM+MDBSm97ESFObDBCxEgMMH7Uhn0EyYibrrBdg
	 7ooOcgsGL/aB3oAlUMZXet5io1Gwwl7Tlz9JB0LEU4qJWP7ENmZgEIxjxEswe/ws3i
	 KJipkh2mLyBd9UTbPGPHKK++sbtYfFn37HRzY/bmFf4KO3IY5QJNHBKcgq/kOZdICH
	 uEd465AFvpOrudbndobnTOjPbOIGTcgdIv3Q6h9PJ+V+IugqBPA0iNXDE4Cv0KkZ64
	 hG+ByfUB1wHy48J2wDCtLWUuu3FbTKpJ6Nyny3BU2n923STfUrMB5KVowsn3b9CT2d
	 ngMBZl+YLDctQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Demeter Barna <me@fromdisposition.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
In-Reply-To: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
Subject: Re: (subset) [PATCH 0/5] SM8350 GPU: memory bandwidth vote and
 speed bins
Message-Id: <179546833676.519617.18442308019433292321.b4-ty@kernel.org>
Date: Mon, 23 Nov 2026 21:12:16 +0000
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
X-Mailer: b4 0.14.3


On Thu, 05 Nov 2026 13:29:59 +0000, Demeter Barna wrote:
> Two things are missing for the SM8350 GPU in mainline.
> 
> First, the GPU never votes for DDR bandwidth (patch 1). This fix stands
> alone and can be taken on its own.
> 
> Second, the GPU speed bins are not read, so every part runs up to
> 840 MHz: parts validated only up to 738 MHz run above their rating, and
> parts that support 900 MHz never get it (patches 2-5).
> 
> [...]

Applied, thanks!

[2/5] dt-bindings: nvmem: qfprom: Add SM8350 compatible
      commit: d19de535c5a8e041840e5399d0006a105e806fe1
[3/5] nvmem: qfprom: Add the SM8350 keepout regions
      commit: 7fa27a3057a750d30cfb1603d377cae38b146530

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

