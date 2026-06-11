Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C7221721;
	Thu, 11 Jun 2026 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192131; cv=none; b=KTEIheJO09YQGKv5VxSkUnCbbigzSBJgkXwuVtMxcduo9hV2FpjaNZKxTUqLUQIE6pabviAcd/lEklTCMMPSEDuH5heLmRyiWS5I61Y7LynXjX2RzJV293QFxCIw5MpNCMVqJR5zz1GDq6fuEI4D3aL/pqWencMyn006rYGV4jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192131; c=relaxed/simple;
	bh=XEcJQN8qffhtnGuiZRjbzT9oYCBQ3g3mFvw8QYWTv+w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cw4GzeYr/TTZ2izD3zFtRCNSoQHHRjA+UB0irlaraPdraP1yaBfyTDr6NGjy4RMslC1AfbQG53hEI6EON4M9DquVuiqDtYffjqpS3ndp7UOC0s5S7c6C8XGcTx/SUxF+jcXstHVcjO2OQ7/4pjFDMMBGcQwACgME1vg2mdwvPjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pq35oQ/N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pq35oQ/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9402A1F00893;
	Thu, 11 Jun 2026 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781192128;
	bh=xnJQlXZOWC+jOjrcQkFBjbeYmjtNcm9aHaBpBxcxKqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Pq35oQ/NiG5weBjn9iQBl6YVhoixe+hd107D/ItX3lNTEu5ROi3tDqzjFw99ftlaO
	 RxiLbQE1R99E/K0EfmPCHw0ZUgRRPGInQJzsKOLasSqEHH5wQtHZoUPyXR8twWBJlZ
	 Jn5JyKxMvFLJ6JCLvh4ebjf+mgmlfMFMM/VHbCpNi8/ap/O0bgWBTgjn/ySCfvKd9M
	 d4PDTBszdpfLTOgj+nerbmhBLg6ZejRizNrKCgdxAO/4Nz1t7x+CIMdnFRTikqBjIX
	 ChRCWYICowIRcUKqeVO+2msjyVJ88dkcxxmb8cQp84A1EtI9lEaBEvN+9B2uD1wGIO
	 kFiyxF9AnymqA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 YijieYang <yijie.yang@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-topic-purwa_phy_shutup_warning-v2-1-951c1fbfe9b2@oss.qualcomm.com>
References: <20260610-topic-purwa_phy_shutup_warning-v2-1-951c1fbfe9b2@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: phy: sc8280xp-qmp-pcie: Disallow
 bifurcation register on Purwa
Message-Id: <178119212522.568088.5851258082110691034.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:05:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 10 Jun 2026 11:45:12 +0200, Konrad Dybcio wrote:
> Neither of the two Gen4x4 PHYs found on Purwa supports bifurcation.
> The PHY is however physically laid out as if it were to, since there
> are two separate ports (A/B).
> 
> Split out a new if-then block to un-require the bifurcation register
> handle to squash this warning:
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: sc8280xp-qmp-pcie: Disallow bifurcation register on Purwa
      commit: b3ee497970c63cea37976aeaa84bac39611fe0eb

Best regards,
-- 
~Vinod


