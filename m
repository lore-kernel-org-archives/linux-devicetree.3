Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9032ABCA;
	Thu,  7 May 2026 20:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186080; cv=none; b=HUUPQok1trD4ITPKflrKUK/ZOhfZx+KLUGtKaY+dHDsN6wI+qV01jxB4vR3sddjNZYy9e3NyLiks0WP8Qu4+gujPY0gtDtD2hKqpgCwoR0nC2gYG9U6lzWxFXtu3x4wWmwMetYua1ynNoZyC2B1+jr5bRG9Qs40aJuQb8yKJoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186080; c=relaxed/simple;
	bh=PFN6HSDL0QbN3oYr2krGY3YfjMt04WbKOzcQN4n8n1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C49YCqlbMRA8dWVgykOtyWQIfotXFl+BGGxZCLMrHMfIivsaXZe4W76jd3nYRY15N/tWu6MobAotqTXt9OSKi2xtPZwZAe7990t/9H4xNjqvZ8YH5+E129elh25Eg8HusBMzPBcxthFeR6e0IkYeQwUEXwd84LgaY50nMZSHAKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdkGKJBt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdkGKJBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F18C4AF0F;
	Thu,  7 May 2026 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186079;
	bh=PFN6HSDL0QbN3oYr2krGY3YfjMt04WbKOzcQN4n8n1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AdkGKJBt6Xinc7dxtg381/7DRbQZoAIDCmtF927O13FrI5G2XAQj2yH3M0q5acBvc
	 sAd43s6FnQeJXOqzx1ZZhT1owuqKOVwGe5Y9HoBP0ExmAWBpgboWywXnYZoc2jCnTw
	 JZ72nHjW0Nv53+XnH1UAaQ5Ezlv031W68AIi+5xALdb8p01QRvcUlokLNpqdPZ159v
	 fKxW2OyX6zQ0dLQy5GdlSOm82zLqcnClLqtGQRvnHJyHsNQF1aQnLVFu/irD1Fu9t4
	 UwNNePXXFlV95M654DFvD0aBjhDkXDvvEkVAB/ShT/aHEoT2aGEjRnZe05Yvw/ZcPV
	 ByP1gR+npIfdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable cpufreq cooling devices
Date: Thu,  7 May 2026 15:34:11 -0500
Message-ID: <177818606020.73000.9883037715234856640.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403-cpufreq-v1-1-9d465988c3f9@oss.qualcomm.com>
References: <20260403-cpufreq-v1-1-9d465988c3f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Apr 2026 17:26:33 +0530, Aastha Pandey wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Enable cpufreq cooling devices
      commit: 2552d5f2e51bd7e449b495d518e1f2e5252baf56

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
