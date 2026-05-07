Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12214ADDBE;
	Thu,  7 May 2026 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186117; cv=none; b=IdMnUlIbB1fcQSxgpgeIMC6ukV/7WSPC4XtjGkACcCItWqiXK4et0z2AvEIy7KmelO9t+RzhQmLZZ3scsJZtXnimUkgYpMBTcXGUMGIngCdAAiBWy79neyoIhHHET7gC/xJl9izClVzfxW5MreGE3q94oHL34v+JJ2aTQklZBRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186117; c=relaxed/simple;
	bh=tYMHYKHGPiU/wp5Xw/osgdSI5u6qMUaQvLA+LsnnP28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibBjcxOzUF7GXCmcRPYfvBMclk1zzaCCSLIHN7YlC8VJ90o0Y+yazcplKiuvAOCTbWo311rUGEZX0AiBxzDG5rnl+mtk65jI/9BhDkTDBO9jQXhoisdJE9VmDcCw4S3Q0fxpjjfTj42dXup8snNq1ZWs5xv/uSLEn+3m2HHrPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6ZnWlo3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6ZnWlo3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB55DC2BCB2;
	Thu,  7 May 2026 20:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186117;
	bh=tYMHYKHGPiU/wp5Xw/osgdSI5u6qMUaQvLA+LsnnP28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B6ZnWlo3AvtdXXDRvViM4LYaOjmMOf1w5lFobUd5rGgJW2Tk2dPItqsiS5gqmQEj9
	 SYxpuNDFYL78vARS+PuJWNijsxHCytPJFt9bC/geVA020B5/i2D9+b6RGsa2wi3BTr
	 4tsqy+WeeDie4eek1hpr3N/oNnIDvmRoXiYdCCha49Cu1I9ZwluT7DzzrbGClvlTYc
	 A4tsk0ILQvYSQEANx23j+Y11qJ+uVlkvj6B69CYbgZs++du0O1JXuf/LLh+gn3kS5M
	 3CP3MQSUFGa8jaz94dpod34hRqJzXgHCMzqpc19U/wqanPPk5gU0N1xp2kuKDL+KNb
	 v9biVclzznp8g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus controller
Date: Thu,  7 May 2026 15:34:31 -0500
Message-ID: <177818606042.73000.16485184758101718037.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
References: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Apr 2026 12:10:34 +0530, Viken Dadhaniya wrote:
> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
> The controller is connected via SPI3 and uses a 40 MHz oscillator.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus controller
      commit: 3b28947ef1f7630d272c59c0251dfa4e5ce7eb63

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
