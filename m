Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865853546E2;
	Fri, 31 Jul 2026 03:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468289; cv=none; b=DuI0Vj0ufzJxArDX32RJ9ZJhHa/A7t5TNG9BIzjRO755Q5xiWBEMLkJ2dU03gB48YP9TbCXd2XYE+cnx0Vwsz79aM2JE2kUvyxyp56he0F6PHJqfHf7CIfCrbOVeGQQKP9o55N61hfUczJH5vzVD7+JgcQfVjSEmKMWBfLNWaOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468289; c=relaxed/simple;
	bh=8cHb2L8dXhOp2zBFI9DZowAilL9Ya9i2PU6qL+qYSuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uWBZNpe+jOUWB+yOcXf16HFLXejcPsnWA7bUQEI+xBCnU4NeWuRvraRAM4MFqMDo/no+nJDVvYOvoo3j9G3AoHY39gHNwNd0C4TWL3+QHX2uYjkDNdfPNBPYBrtkutZjbgiv3OHgxg4V9VvLzDRmZEczjBlCYWo+SgO6DrXBMzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dev8m3VF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dev8m3VF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9313B1F00ACA;
	Fri, 31 Jul 2026 03:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468288;
	bh=AS1UzT3tlbko7KUR2HQ3SB46KaPr0xYEgD7978+BuAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dev8m3VFGwC3jroxsX8LLSHaBw/TIumJKoEwPJ1s03FzsLHWsypXeL8ZRT6e/4lNC
	 t6DKB0Co5U1TfS+82X+cBUvnpGIfgw91Xw6GL8piGa0cH3jHFsWyJiABZMrplevl3O
	 236nA6B0dKqpot2p854F1whb137VNarqG3gytlDgpJnpfwQvg0kS7XV/xEzoo02zQn
	 InTmHKo36BZWP2IIKOaAgkeez4IGj0co4y1CM5k48mTF8C62vLhC/dCmkfBed5ZrJt
	 k95BQ4XmEGmWPcZV4ywDIFCkxjg5KzxTCrDHZNFWX35unVC6JdUlHFgZ32qu8qGzr5
	 AWLOmGbfLzoCQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Luca Weiss <luca@lucaweiss.eu>,
	Gabriela David <ultracoolguy@disroot.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] Minor dt warnings fixes
Date: Thu, 30 Jul 2026 22:24:21 -0500
Message-ID: <178546826807.316815.976580167864370663.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717-topic-june26_dts_fixes-v2-0-797cd46e5d9f@oss.qualcomm.com>
References: <20260717-topic-june26_dts_fixes-v2-0-797cd46e5d9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jul 2026 12:59:57 +0200, Konrad Dybcio wrote:
> Nothing particularly of note, mechanical fixes
> 
> 

Applied, thanks!

[1/5] arm64: dts: qcom: msm8998: Don't pull-up I2C pins by default in sleep
      commit: 58ce9a2b9099bb26aed55d4e350c32af94930532
[2/5] arm64: dts: qcom: msm8976-longcheer-l9360: Fix accidental node override
      commit: bd0bb7d97773026c9f5d5f8ff1dcf987f8051045
[3/5] arm64: dts: qcom: sdm632-motorola-ocean: Fix LED default trigger property
      commit: c82ea31fb783d9ce4080eca1a7bb855f4648fc28
[4/5] arm64: dts: qcom: qcs8300-ride: Fix BT RFA supply name
      commit: a3b31d7e12e60f40cd4ea1f54126c38dd666fbe4
[5/5] arm64: dts: qcom: talos-evk-som: Fix BT RFA supply name
      commit: c680d03c73d17235b8e5fdaa9086e35c15855146

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
