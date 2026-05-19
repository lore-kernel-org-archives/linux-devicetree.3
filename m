Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7512877F4;
	Tue, 19 May 2026 03:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160614; cv=none; b=fPRpcg1oqcfZ//g5uxcSz9M+tRze2TADdhGxeXZKSx1iE0ZSzwo45z5qWlgJ47Ir8JEbghD7S8QRVaJsoYpIizvU8OHMB/cUUKgekH+5tmFmR42tlmncNX2FMw56jr65KWQalWFKjrAVlYk8+faAl0VIym90PYElkEmip46K0AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160614; c=relaxed/simple;
	bh=mwbJ4J4WJAxGLphRKCZx+YipChrfMUscSZXO4QGvQPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Et5ZiRi205Eg2H9URtyuiO2NZY+2TmrC6j87hqeAgX9gOWiF3W15efYPOPrU/slIdN7foiHjrq7DfxXMpT0GPMg2E6AwtmumN5w1ZRWAq/FqbMHJY7E1GfbXJj6FqCp+p+Xjvq77RUL7hkLrF/iPKnoe+vN2jFe51l/bOc3b510=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gw8bd0ix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gw8bd0ix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9605EC2BCB8;
	Tue, 19 May 2026 03:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779160614;
	bh=mwbJ4J4WJAxGLphRKCZx+YipChrfMUscSZXO4QGvQPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gw8bd0ixl9LgJCaKNAVhs+2rauqPdZ2ZZ2VRVSjnRH5sF+IR8I4yQPFxh4QsJTueX
	 3g/P6tcn1ZOjPf3+W3OCJEga5G3OIXCu4EvBD20WCGfArjuOyN5tU78n39K38ti/Ey
	 jdl5igzsATpoANjq+pJelMB65KyoeC54V2dnnWhDCy9jWTMsboUvrfOAXS/GphfAsB
	 RRH5nVVeJh9MnGzD+6HLKpV7UVwLCrpH2UrXBULJsmk1LVyRqcXqdDnNZoXx3tD0ub
	 70+hrmbUGv0DbjfS9cUAQc9ABmlfGHruyPkEZKT3P4CDoCVCabZpW2wOUtAtC/kpwA
	 fSoXINshW//BQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	quic_bkumar@quicinc.com,
	quic_chennak@quicinc.com,
	srinivas.kandagatla@oss.qualcomm.com,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add GDSP fastrpc-compute-cb nodes
Date: Mon, 18 May 2026 22:16:45 -0500
Message-ID: <177916060470.2063946.7575716941183727563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-monacogdsp-v1-1-077ded36c7fc@oss.qualcomm.com>
References: <20260415-monacogdsp-v1-1-077ded36c7fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Apr 2026 12:10:46 +0530, Ekansh Gupta wrote:
> Add GDSP fastrpc compute-cb nodes for monaco SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: monaco: add GDSP fastrpc-compute-cb nodes
      commit: 32fbd42e6b56aae4587c76f53a51d187add4eec7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
