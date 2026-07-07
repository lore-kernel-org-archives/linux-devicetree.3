Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1CF35292A;
	Tue,  7 Jul 2026 03:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394509; cv=none; b=jA0BaxXxAY/LLl23VvNC2mGosR1EWsjbVbXZfKw0wMHPESXLiuwNB1CmUbXUIXUN8IiA5gLe+Czdp1a0JVF8vVKp/Z+XEF8pKQjXBD2oADd2q7Y1jD0ysP7V3ApHef6jQAKLGg7aCJI7jUIsaCQjxOnzBddS5jFSgVuVrWAPBeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394509; c=relaxed/simple;
	bh=E7FnRCmSP9uiFKLqM64j7ytnN4fGFUPEDo8T6q0v1ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UiBE5z/NitMz0/XrurYYSSLV23itnuFgMYV05vHddCwn25p0lr1fvA/eVBX2cfQqWyGo1/D2Se54oJEIz0xo1Kk1/7YJAjEMebZXx7Xsznfd8yQ+Szl9kDlBbyJ3ZXk4I8Y9sOdCsDW4ng3polc0xHDteHmpntte4cisj8tjwrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fgu7b5/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgu7b5/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25811F00A3A;
	Tue,  7 Jul 2026 03:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394507;
	bh=P6UuuCij1HZCrkXCkw7PPJgANHocPuImc+fUzBa1NJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fgu7b5/ODvrVmwnImwk7Wl6m/E5Kn7r+SWVA0pGtnsIipgD8gbO12ElpYwTahnEtW
	 t+OAnBCZpMXOapOFJ1Xl95XwMQQWHIlQZ6hMU3Fi8oKVcNlGZmTy08JxHlaQOLbkht
	 ewT2R7chMTF/5txcnve3ptJHWrPRGIEcMxzqN2EMvxd+mZkKod8gr44DT71MLKSa8E
	 cHmOL8c09jEnOv38n1stTUYi57kjDmF3lJeWwpBA35vmzG43evuvRUWOlm8SHSMab4
	 pGW1D22n3TUYojAuzvqP54mDi3eYegclrKTOBTW8JMpO1vSShgKO4FVxR+N9+7/uIS
	 n7wdB7aRoRhoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix gcc clock specifier for usb_mp_qmpphy nodes
Date: Mon,  6 Jul 2026 22:21:23 -0500
Message-ID: <178339449918.1938770.9769683134904668212.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
References: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Jun 2026 09:51:35 -0700, Gopikrishna Garmidi wrote:
> usb_mp_qmpphy0 and usb_mp_qmpphy1 have #clock-cells set to 0 so they take
> no specifier. Drop the erroneous QMP_USB43DP_USB3_PIPE_CLK argument.
> 
> This fixes the following dtbs_check warning:
> clock-controller@100000 (qcom,glymur-gcc): clocks: [[59, 0], ..... [0]]
> is too long
> from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Fix gcc clock specifier for usb_mp_qmpphy nodes
      commit: eca50d95b60cdcabb82a8e1b727fad2547e52f1d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
