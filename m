Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB113E7151;
	Wed, 10 Jun 2026 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091836; cv=none; b=MXRen1ZoU2ILEcvp4hT1h8CqY+nZX1y1VtkOIody95LamDi2wq8hpTpNQMT8OuguPFJKWh4pCxj8matxNhvsk8/U/v45m6m77Gy20ZJVVVYPcB4Qq6bue+Rghu2JIlIq1mC9wxa8zdpbLtV1FpRZdUZnQnwZQSVXljNvbbVqvZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091836; c=relaxed/simple;
	bh=SJciNBh7LnFlvh3fdRZnp/K6ls8TzZ8lRCkYY8f9feg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F5ohod5HJ6aArxhv4zeOAfWMnnqBIQ2uKqpYUgax3qGqMrfLzgBq4XN1d7N3E8JY6bosjAWGMJMSIKZocdUwyoVI/a/vDCbxKdaz3IASpFKPsSpgnFsBGUKx+E4bSrwZArX8gg5AOYfyG5Gb8hCa7USVycqRM/rZMg5ZRFBoRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNG21yOM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNG21yOM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63ABF1F00893;
	Wed, 10 Jun 2026 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091834;
	bh=yBbFOYe/R4NV6/nWE1BHBKyuDpmXSjFDOiX1hGkPbq0=;
	h=From:Subject:Date:To:Cc;
	b=CNG21yOM+JEmSryCkQh9vYiysMkTy8ImDyeA8+GtxCGqWuO7OofkIbK3AQX/FqnrL
	 M0suFz2lpP+fcuXsu829cgssO7GXwLNZxrC5LJh32x+iok8rj1neMCnJz0M/yW18Ri
	 /+y5PSJm0RQldOQ4DULNXA2iM3/I5hUIc/q7EvHBPVewHIQ1oggLsv1Lgdbp0A1YhA
	 EUOe7w/JAf0Y+bUwX6TwfbCnnum/dJj5rV8+EgYHeT/dvWfwvGgrAIYt/al1KOnWbZ
	 HpVSpA//NZTejvvOUFWQvxm+83lIsznYUA+H0RtxOAPIwGwVWmIsL0WumcbXZK6Rvm
	 Kv3t6FNP4kkHg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/5] Minor dt warnings fixes
Date: Wed, 10 Jun 2026 13:43:45 +0200
Message-Id: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPjcQIw3Fq0iRdjNp14co2VgK4
 t2N7ePH8M9GiixQ6puNMj6iMqeK9tIQvx/pBSOhmpx13vrWmjIvwmZaE5wfQ9ExyhdquHPoON6
 uMUSq8ZLxG2o73P/W9TmBy/lG+34A0x4UhnoAAAA=
X-Change-ID: 20260610-topic-june26_dts_fixes-c32e3cf85fdf
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781091829; l=1074;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=SJciNBh7LnFlvh3fdRZnp/K6ls8TzZ8lRCkYY8f9feg=;
 b=mGI2AQh9KpM3CVJYXG/IKqekqn+53xiVM4sxuAw699+GmYnELE9OoQA8Gd9UPddWK/fz7vDvY
 wdKoC5U6+0hDMp6r8lnrZZzj8MjuJ8Z1ikBaLK9nrzZgbn+hc0vJEth
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Nothing particularly of note, mechanical fixes

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (5):
      arm64: dts: qcom: msm8998-sony-yoshino: Drop extra bias-disable
      arm64: dts: qcom: msm8976-longcheer-l9360: Fix accidental node override
      arm64: dts: qcom: sdm632-motorola-ocean: Fix LED default trigger property
      arm64: dts: qcom: qcs8300-ride: Fix BT RFA supply name
      arm64: dts: qcom: talos-evk-som: Fix BT RFA supply name

 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts      | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 4 ----
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts        | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi               | 2 +-
 5 files changed, 5 insertions(+), 9 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-topic-june26_dts_fixes-c32e3cf85fdf

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

