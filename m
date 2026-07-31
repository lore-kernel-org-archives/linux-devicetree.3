Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C87357D1A;
	Fri, 31 Jul 2026 03:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468283; cv=none; b=tEDTmPesGOzF5fERUo/915b0yfKONaXf3D9yXzwmosl6dDsd3RYStJV/NsFnoN8qOUpIO3Kp0fPWdE2C8dv4h6i5UPz5pJ+HioZ8ChAcl+8YKSuK0HcsHQaqRANFtFVvCxz3ntjlLgsC+5bc3dNpvtd3TS2oqtkEwXSox88iRUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468283; c=relaxed/simple;
	bh=yzF6Yap5dXC8Oh+L2hc5SZtU6nwOqwV/KS2ENpCbaPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rzWXUAVUP8uN+MEa24bj2cyVkwB6mX8XBeKgS2gJP1sVcVbcwhha+2UBg2D8I/+sYwP6iVKmzy8J8X/oK0IUOVCdGpeBicSEcju4+VLmQMyU/0dQ0Z6wFq8SAqryvByUhX1ykko/fa0mfFNne3srJjT1818tkF0MzfaWtoxbxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lfhia0Vj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lfhia0Vj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E1A1F00A3A;
	Fri, 31 Jul 2026 03:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468281;
	bh=6g/Qn0ERIYcipUD8p2g//qsrcWME9GYuXNe0QpDooIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lfhia0VjKfTVFYsfOZpFmFEhk0sqjqHC1vXSqapQsJkeCH2GFEj/vILJyKLh9nOkS
	 BP3RkjLU+VAGvEUGOFghe0EyTFO5niA6oWXtT87EfsIf6GgZVRcJkm96qxy/zIIgDb
	 PrjRA/jsLF/WZqOzN2HTNPl6Ok9Cm3JIVijBgBBY2NU2Kw8ke6HW9nZXeb/Mhsv05u
	 k4dP59tyDTnVawtWqC5fGvxqMsRmdPiJBDUZOY9Y1/zYBq3kMxV9QTTIYCik9jHN8h
	 xzo/iHL7QtAn7Di/nfozFLB6cTxp0QGyJlIiQhOLtty4iGS7WSXL4DzLCnuOUhGz0x
	 H7KpxG0W8jC2w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] Add ADC support for lemans, monaco and hamoa.
Date: Thu, 30 Jul 2026 22:24:14 -0500
Message-ID: <178546826830.316815.16612213655482300317.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
References: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Jul 2026 21:19:40 +0530, Jishnu Prakash wrote:
> This patch series adds Gen3 ADC channel macro definitions, with basic ADC
> support for lemans, monaco and hamoa.
> 
> Patch 1 adds ADC virtual channel macro definitions, which are used in
> the "reg" property of individual ADC channels and also by ADC clients
> to reference channels. These are a combination of PMIC SID and HW ADC
> channel number, which are parsed in the driver to identify the intended
> PMIC and channel under it.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros
      commit: e418346f4eb314a4b11fc7eb46cf2b4825d15aee
[2/4] arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      commit: 4a118c175bdd93198961320111642c66693ed26c
[3/4] arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
      commit: 198bb8bf8b9053cad7dfc6553c46d112ae2a9a34
[4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
      commit: f969097d49663c1943b39c04f8e8b7c57bf8a456

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
