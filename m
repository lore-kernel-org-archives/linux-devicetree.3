Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E8B4457C6
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319753; cv=none; b=fcpTr4A9dvkD/Hsl7T/Mg85UiGtvF+flQZVXq27bwvcw82lFoZ510WXK38opGm/l6zXL+4abtj4MXLKMDPPRPgNTx4RYmtfSdjFkVjYiTD/cV9bxr5/aIITHwX6BWwnrq13GkfifCSGpR1HN5F111DQLqBn7xRvKSuVY3KSiO98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319753; c=relaxed/simple;
	bh=cSe1V1Dmq3Kejcc6aGi3LQ7jrgxlYr6ep914mbo7vOk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tyodglKgjfqbwBu+qh+4kGWT+7J8iszYpVLOYJYKtWCQVyChzgG/6sYOY2X4YZHxuIPIVmvRIlLxKnBCYL3DLJb5HkpFdQdk10+AVvZZWQRmhWpacKY8rSxryZf9o618mIYaU2mglVAk1opE+sIf+V1OhOrkaLuoT7dZXWwqUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=OX0hVFH2; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="OX0hVFH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1785319738; x=1785578938;
	bh=cSe1V1Dmq3Kejcc6aGi3LQ7jrgxlYr6ep914mbo7vOk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OX0hVFH2ZN2+b0M5ro/vMqmcgBAmxD/O6LiTrMnutfY8ZXjupSujcct+yP1BNGvhd
	 wO3A7JK3Dh+imMPJHPIL52LaGXyugweRMKgt9SPUVTk8/1FBiY68mo2vrBowBbFgs/
	 eec3UDeWptLbcptfc+uuLcPAGHyj3GVUZqQpsz3PXGh122Am9xpf2ZXJIkYOqTkuWl
	 IV/w47VT1AyRkqk7pWZsJFvPARE+l4fKXiHdi8XugkE8MKXAxvS0wsPbE8yUuwx2P4
	 j4RLpsQStrVbgLRq7efXA9dchxpBJKtKewzldKjir6CGbq/VWZJcOoLwjjnsXclnb4
	 GuZ+JHpquopag==
Date: Wed, 29 Jul 2026 10:08:54 +0000
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec
Message-ID: <cTyvVlG4njDAALGERZCnJMS54r5ZomPQ6aLejsdTWw3ifNJ3yuz38KU4j9_PrlabOH4e0Oo4XsuftZkODeXPg1ecfCRdlKHTLkw_JWXWnRY=@nxsw.ie>
In-Reply-To: <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com> <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 5442727d7ee7276a753e63241932cc42b0a9b833
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sunday, 26 July 2026 at 06:50, Vishnu Reddy <busanna.reddy@oss.qualcomm.=
com> wrote:

> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
> is a new generation of video IP that introduces a dual-core architecture.
> The second core brings its own power domain, clocks, and reset lines,
> requiring additional power domains and clocks in the power sequence.
> The current maxItems constraints for clocks and power-domains in the
> common venus schema were sized for platforms available at the time of
> authoring. The glymur platform introduces a dual core architecture
> that requires more clocks and power domains, exceeding these limits.
> Raise maxItems for clocks, clock-names, power-domains and
> power-domain-names to accommodate the glymur platform.
> The glymur platform-specific schema have fixed constraints for these
> properties, so the common schema only acts as an upper bound.
>=20
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Krzysztof's RB has been dropped from v9 to v10 here.

Is that purposeful - all of the other patches in this series have the relev=
ant RB's retained.

Using proton mail web thingy so my email may appear weird idk.

Anyway please indicate what is going on with the yaml RB's here.

---
bod
