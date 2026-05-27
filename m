Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D591642668E;
	Wed, 27 May 2026 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894684; cv=none; b=uzcXnSx6RlIBD+btN6/FCa14799sCg93mJVALD0I38ng4Im4S/1vHQAVv9ruWYKgWhU/tRTpaxRge44emqcpcLPUO78VeRzB5amJKbfr9SGmIfnzxGKqq0JdwxCUk05y27hpuVcwwOGp5WXOK0H0KKTJUcSARQ5muQXICC66sKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894684; c=relaxed/simple;
	bh=MNPWYr+U4PLN2ZDtZblQotOFaQMgEcw0TOnbqnCmTWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mVKO6cPkvTwu+AJMgsWkdQ5k1KOvxlfD/l2UnUj3WZmlt+GqOeMaMv5N31EFXw2gRqYB24AKbRzvcEVxdfBHrcn/WzpxUFofSmaQzwPgJRZtkILTToNhmSY2V5tm44BeJBDVgZctmHatUhndXjYbrEBShbBE2n3fqPvKnjI5Rv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1gMdPNV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1gMdPNV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DFD1F000E9;
	Wed, 27 May 2026 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779894683;
	bh=/tzWFhSFGUKixfYv1g0y57oN5p1YPCjS0eSO2ifQkCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=F1gMdPNVADjhvCgtQPrWzwCq5WAaTDEYu+ce8pLgW04t3Aqh3hqViz0H88qpyfYDc
	 Wkswo9i/rpAYXFmeIkdeo5x13RdiG6h4jhjPd0fNd/V/T1x9wjZBb41XqkJTxMXvEt
	 4e8ynsnDeVnQ0CbjHWofJTcnpBuGafp+GYvnMgKHZ2H1oz2U5az3c/oFjlp7UN5tx8
	 BNlU5UOiOW9VcOUDKnn/HKYZizigBq9el4yHp/Qt+0p5KVgGYKfYAw2l1p4jNF0ABz
	 6k/w648tsIfsxaeD7Fuw7vDnIPhPTNDdJT91tQB+FfoaI0MvMPLY4gBP8qknCrAx5G
	 OUeY2sD0pBG4w==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260519-sc2730-regulators-v3-2-5bf0e02507e3@abscue.de>
References: <20260519-sc2730-regulators-v3-2-5bf0e02507e3@abscue.de>
Subject: Re: (subset) [PATCH v3 2/3] dt-bindings: mfd: sprd,sc2731: Include
 SC2730 regulator bindings
Message-Id: <177989468112.708163.11191837859858540056.b4-ty@b4>
Date: Wed, 27 May 2026 16:11:21 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 19 May 2026 14:06:12 +0200, Otto Pflüger wrote:
> The SC2730 PMIC provides a different set of regulators than SC2731 and
> thus requires separate regulator bindings. Allow using them for the
> "regulators" node.

Applied, thanks!

[2/3] dt-bindings: mfd: sprd,sc2731: Include SC2730 regulator bindings
      commit: cf61a18f7be9c41a53ec87db13b0dd58eea41147

--
Lee Jones [李琼斯]

