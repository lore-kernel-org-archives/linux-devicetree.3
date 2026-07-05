Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9933A9623;
	Sun,  5 Jul 2026 20:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285100; cv=none; b=h+R+cb+SlAYISMTbAhW3zuNSom2wKbzEwGF4wxTAEVlXUd8sqvuFHdcZmBFL6GQ2R4u83H3QueObM2I0ySgiAb75t1pg3NGCAXomy/5NujxdmfI+QvlOwiy1ACFD7uPJvcSC5TGwurIwzh/1IcIE1iGS7Nnh2CNuDew9Qq1ofyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285100; c=relaxed/simple;
	bh=wsLABcejmXc9/Wsauceef/SOVdnRnCFU9zTA+TE/0DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jpI6EEpyfYZXCTkdvIJdb9BYYnh+uIz9MkqO/kZgl4QqfPhbyl6m/AiULb5DEf0ctYgdLwjPGfU6Apj+mVAn1mZZ/vGBqCG2Y2Shrl//wysfXeWIKloASJgWZSqsFF3GTOgyWIlq/pgFteM46PzLtXbd6gUkaaDtsDupn0krvCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYYFRAH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYYFRAH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6B71F00A3A;
	Sun,  5 Jul 2026 20:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285099;
	bh=7kljczbnsiMeibqBYT/BHbhR56EX7ZTpb2kOUq6DmaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TYYFRAH5WmM9WUD4rDR7WfbUFMnqgXy6vz/JW81T9J36WCS9CaqO58OZfFD5rfHKe
	 yxuK7CcVVWr9+o09fsktR2U9R9Zs0owvKNAvlrBoidgE3RguiDsTZ6xQE94y3U2mrP
	 isa64Gbwmnn0V8969IA6exIOkL3l7UT6zxp4tN7eFKiuYPafUCr4D1mKGmjLg3tU1E
	 D8dx8LMqBW3oaJDKJdkFdI+WLMOnjpPQ2rZ/iM3DJAidQAC2heck01g005anlpJGgm
	 xgzPx6EvW8wBAldJo/+iKKXZmwbctN62Qx/jsh0eJU43HmFPAw7icMb+bM9chnroLD
	 Xb/0jyTy/x0BA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: Add label properties to CoreSight devices
Date: Sun,  5 Jul 2026 15:57:57 -0500
Message-ID: <178328508291.1157743.10674786439493609885.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Apr 2026 19:35:58 +0800, Jie Gan wrote:
> The CoreSight framework and userspace tools identify trace devices by
> their base address, which is not human-readable. The label property
> provides a stable, descriptive name for each TPDM and CTI device,
> allowing tools to refer to devices by name rather than address.
> 
> This series adds label properties to TPDM and CTI nodes across seven
> Qualcomm platforms:
> lemans
> talos
> monaco
> kodiak
> kaanapali
> sm8750
> hamoa
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: lemans: Add label properties to CoreSight devices
      commit: 8d52cc232a3c951492a7b90c4172b778d6de1568
[2/7] arm64: dts: qcom: talos: Add label properties to CoreSight devices
      commit: 422f5eff44d89367b700235bad829d1430f798a2
[3/7] arm64: dts: qcom: monaco: Add label properties to CoreSight devices
      commit: 9ed9c973c6213bb4880fc44dffb266f0330586be
[4/7] arm64: dts: qcom: kodiak: Add label properties to CoreSight devices
      commit: d1a21366e880051e453e99aec217dea3e1ffa441
[5/7] arm64: dts: qcom: kaanapali: Add label properties to CoreSight devices
      commit: 39a2bf8662412df24ec00378ccdfe667d0529002
[6/7] arm64: dts: qcom: sm8750: Add label properties to CoreSight devices
      commit: 9dd195e59a479ff6d605935d78e9e9bc0877bc02
[7/7] arm64: dts: qcom: hamoa: Add label properties to CoreSight devices
      commit: 310a5d6a7b65ee161c91bf1cd3a3bf19074275af

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
