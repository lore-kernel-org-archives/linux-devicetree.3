Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD217C211;
	Thu, 16 Apr 2026 00:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299023; cv=none; b=HjTKHE4dxlaNZEWyL7i51HYrFScxVWdyOcfyzh3SUimKPydMOBQaglRts8z7mKKxgEXo5DeitoTNTOnXM/W1QMEl2O3rkU596kEtGPNxB6T4Vfv76XHxh53Qw3kpRervBm6sSL1zSEPVhoUE0YdGZhdo7FvYvMlz+1zV0vOSFWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299023; c=relaxed/simple;
	bh=t7V3EQfNXi+zUiRcTG1auE19RDqnd6aAKgkgSLJpf5M=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GrTAWPE4uIKIpDKOrGBxwvNXmBjq1VFJJ0XJcr71l3O0u6TdQLPQZjWa8G8nJrNyeATQbOwbAXojl6/TajI43Y4ZPBMTqaAbZ7Y0c79v4wZ0ojNh/feqmQ83seZenykUaPZt+Q3NouR8gYSywh4lHJoZEl+VT4T7g/IVTY9DhbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gkwF2/Ip; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gkwF2/Ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776299013; x=1776558213;
	bh=/kO5sLVWHV577778m/vBhxM6H4oMac6z5TOPbNkRp0Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gkwF2/IpjykiX+GMr/PnVgC2G90whGKcLRsmMCRk39A+Kw9m3mKmP29nxIrDl9dn6
	 Ovu1bmVck8s+nyJ5PMRdlS3NImzq/m0CRaJ5K26gIAXJfDBg18vtL0wa7LihfdDJ8a
	 mtHST6qK6YvpBv86d5bo3CDS/HmW3UACBf4g6h2af+ob0AGkem39M9r3TnczNHuGZT
	 J+vSOfN0xdvffN/+7Oi2/iLGPlNovwfd25+IRM3X+HO4+08j6985PsKJTBq55H0+su
	 QBPZItNffxt9nhdnXGreSgyF4qhxuGBidQd2kt/NVD4uhoWyBpPoD6dZyLa+J+ReU1
	 oqX6OiWeTsf+Q==
Date: Thu, 16 Apr 2026 00:23:27 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] Describe IMEM on Eliza
Message-ID: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 916f527443bdd0ad8a231961c005d737ed2ef811
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a compatible and describe the IMEM for the Eliza SoC.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      dt-bindings: sram: Document qcom,eliza-imem
      arm64: dts: qcom: eliza: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi              | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260415-eliza-imem-e791f44abf1b

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


