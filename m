Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B7947886D;
	Wed,  8 Jul 2026 14:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522629; cv=none; b=Thu5FBHWMDxcv1BXRvRpuzagbs0aVog/je7eK8pn/3winrMhCJTYEMmRHTEM9TTiPS7Nr6UAAi3bOUjFnZ9pVv8DH9XJ1woXK+/QGlXr5C4U/auM8DHUjicJYxD1CZr2PRgPMImRsPxsqrSxoFYz2LqrOwebfpzncWTTO047qSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522629; c=relaxed/simple;
	bh=gIeVNfBL/n1k1I6Kqw8V0OV9vhqiBPGbsrB/yeYBIm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTZS8mRcGLWWNT6F0P7lFIgY7GCPZ0BJiw5Y3CHRzuj03t5oL0KQPZetTuG/Lbk3f+Jy9UJ/OrcaY4rqg3Kxx9MIb8p/HMB8ZFubVI33i+JrUtIKwxvtBmLkTKK5R5jfcSRfqjAcSsUT7Kro33hfL2/BJX/OIJUhRvaPVAWKMgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMzxppiK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMzxppiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABF61F000E9;
	Wed,  8 Jul 2026 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522628;
	bh=16KRBVBRb/i56hxVEG+GEdxM63sdS1nY+MaW0YknO0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OMzxppiKaxpgMsc7vVsV70fc6592dfD1LrIsHmeZroqk9z7iL75SYGqduncR3Gg0g
	 1xb6BBmyjWHmBvlHcZiTaBhuhm/Bou0PHws1Lz1B1yupvEdXhzeeEknWEfcMFaQ2kh
	 Aydr1IUJOEDezgLxSfKBSfO1Lk+3UPGNRdPDM65l6CAbAQnUxdEp96z4nA1TqEeQyM
	 tAiV7KCGZvnWSkJJe1GKWhNwB4LryjlKEc1/RWjbpgWxJHReARqlbY44osNcgAAinM
	 l6shuw26zoBpAcxLkwlStxOkV2mUIQ7PufXnFQYWFg+Ar4pkI8eBxnvPhYO3LCIQ4t
	 Uxt2h3ez9JMWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
Date: Wed,  8 Jul 2026 09:56:09 -0500
Message-ID: <178352261567.2235436.2041468548247783824.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
References: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Jun 2026 12:41:34 +0000, Alexander Koskovich wrote:
> The dummy panel compatible 'boe,bf068mwm-td0' is missing documentation
> and gives a warning. The 'interconnects' property is also missing from
> the binding.
> 
> Dropping the nodes here and will just submit panel binding & driver for
> use with MSM DRM.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
      commit: 7d3670ccf61b99283ebe44ba19f5e4643ef7cde7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
