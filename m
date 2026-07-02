Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CA83D0BE1;
	Thu,  2 Jul 2026 23:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035653; cv=none; b=L++B5pdQiRp/CIkMbRu4D4LheOvTSoMUCcf53XCeIuuLsptZepQYZdFBmMsmFpazFb/Hp+naWovxfEiPo3k0Mgzv1r+mPuYBxwYjZuSWfyUEa8LhIn7GgQRtb1dEgfJ1eoo72PX2esyNYh3AklCEdBksaGyPznJqgbpJJ5zfB3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035653; c=relaxed/simple;
	bh=HvbELMq7ISPfqslk2/mUbTSL4u2IYIdSkb49Tr3BMR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kezPkzM/3eBezMSYnja7AazLMjED28P0P1UeYjZ3pGUmVVHLeA6yme4uUwb75Vm9+xm33/xjkM/Me+nyoCDC04MEFszdIyGDntz/tuOxJ+8IzM4tIKVO+gaY/BcUL4zjgy4fl5SVfajQN2jt+cdLzKBBpeJwtkCzO90vlqsC8Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huoTh3DQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huoTh3DQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF311F00A3D;
	Thu,  2 Jul 2026 23:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035651;
	bh=pEsxl+SQAqfXnopdDYCp8eBwJkEWaZnY3gq8g8Mwtis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=huoTh3DQYLFQ28umQTve0BAFE2XeUXvlje6eSD2oTaI6c9+7YuQejtHnTDXDpPAkv
	 t8plZODMuu02c1Op6KaGieIR/uhMPNedm0fRi0sW61BabKb1T1zg6SqoinioiMUda2
	 k59QCAtOHr2vpPDLmqtTNbxZoFUaSXm1NbAvYmX0q9PdFJS5KSO6M2ikq6X3KeBTns
	 /YxkE2QZGU/eoGKpktGouV/+Sz4dD5yap7Axgdrd27nwmmfp6o+umGYDDgBiOZ8iLt
	 c6tI31kNNtmfGTGvyfHL+P+IoX3W2oXYVu+Qq4p29GQTtvSpjHsbdr6/Vk6IKnVeOm
	 F2gNC8amii8Bw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: add IMEM and PIL regions for glymur
Date: Thu,  2 Jul 2026 18:40:26 -0500
Message-ID: <178303563662.359079.16563239156520939989.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
References: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Apr 2026 03:36:12 -0700, Ananthu C V wrote:
> This series adds dt binding and node for IMEM on glymur.
> 
> changes in v5:
> - updated reg size to cover the whole imem region instead of only the shared imem
> - picked up reviewd-by for the dt node
> - Link to v4: https://lore.kernel.org/all/20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: sram: document glymur as compatible
      commit: fdb2f446c4e6758802d678858b5811d46709d0e6
[2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL regions for glymur
      commit: 4c53f51b442ae8cc4545fc5ec349ce6ed7afb4cf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
