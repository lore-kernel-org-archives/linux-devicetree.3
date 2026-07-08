Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00424DB569;
	Wed,  8 Jul 2026 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522652; cv=none; b=k07qPojbLcNycx2N5vqw0ZnCk8JxKda3TKG31Zn4fhQFtDbw11Gv0qo0DSmDABPLydp6J7dbsn7vlt5DAxuzo61pBNwrAXDKlKIXPK+8yPmx0OB+Mcg0Lgor0oAxqQOwsoUWLY0N0ybZdtZlntZ+6ByeFcN2evcFA57wUtCOINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522652; c=relaxed/simple;
	bh=mb5MRWshU5VmKUXNPoHpODosmYc5qDAUJPrRWCG33Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gEJ2o7WvqzKSVLAV+M3hFZW/syTMBD6XQajO+CM2ZlMeSnReTqWfPCfjfpL65LB1PQF4v+FMgx9nZ6yC5eycvkXvNKTmSPshCjAUptUdCwinVjwguUJISmZSNyxFK37QiPGuUMDKR3RspBPwWk7cDSKUAz9tAqi86UL7C28XVrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VY5Sx23D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VY5Sx23D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B2C1F00ADE;
	Wed,  8 Jul 2026 14:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522650;
	bh=MeQ6YpdgU9+ocIPTR5I21hd908to6N5JIkQBQ0IPhsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VY5Sx23Dakpt9Szvb94zwh3wBN3F4cBDBrhbk9H5Q+w1ugLU///FX/61Fx+ZgbvYO
	 RotN1O8ygu/OU4FbypBDwksWAN/ZXRyW5Bl2OOed+afmgN8orAAYyvyiTVcEyu3dRF
	 nzp4Fabjepx3lVcGeOTxJ4eBY1bJfNvzJiUsEKivfqgk57D7MljQshhMx8srX86Kep
	 wC4Y50VmRLm/Bp2sxkCW2bnmHtGktHrqNbj0GfTW6Bc8HRYzqToW6Y1uBcYUdbDtLu
	 5S11KjhqtVyyREDnW3kgxP4xwdMZGH+NqSDZjKUngsj74+t3qcEMPXQxtcLJOBuhP+
	 QpJRlg4zu+FcQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: cache: qcom,llcc: Document Maili SoC
Date: Wed,  8 Jul 2026 09:56:30 -0500
Message-ID: <178352261586.2235436.462264889707061973.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604-maili-llcc-v2-1-dd24f05bc197@oss.qualcomm.com>
References: <20260604-maili-llcc-v2-1-dd24f05bc197@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Jun 2026 23:06:16 -0700, Jingyi Wang wrote:
> Add documentation for the Last Level Cache Controller (LLCC) bindings
> for Qualcomm Maili SoC which is fully compatible with the one found on
> Qualcomm Hawi.
> 
> 

Applied, thanks!

[1/1] dt-bindings: cache: qcom,llcc: Document Maili SoC
      commit: c800e4c8a6481b4648945a53630907e414205cf6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
