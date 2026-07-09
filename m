Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED483B9952;
	Thu,  9 Jul 2026 19:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625580; cv=none; b=t+tzoaYfPwktN5B3Qpf1xpx0XZoeSScBbb7JAeZkAwJAtdpAf+ooHlLJlmpR3BpyuXQMpr/3tAZTkYrqdWE3IOGxVd3iPi/qRimwj3SKoSPCwOFIGbCuZGBZ8lP1l7HmISX1KWFWTIB1xteB4m+JL+IRfp4H0AEhl7Uu2y1/v6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625580; c=relaxed/simple;
	bh=gVFuG7+vBpy63DDiHHNwlDwPc7yR8XEQeKmMBJcP2/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjHG/IobjztX+BSVktwKcimGl/9QCGLntQ/w6G9zqovkpgoiQGtK12DPkkjFxw8yTYRU9cdHdGA3+D4Uvz9locqlBhNZOiv6qZFuIsY/1qDbiIUmfzw8fvU31z/Y5AaaZKuQ5zo2MdWxUtlAI5fGV87f9OdQhKCw/qmkdrCyBbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8lLIwO4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8lLIwO4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAFD1F000E9;
	Thu,  9 Jul 2026 19:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625579;
	bh=sngdqUCXqTLY0/tvNdwEAQ4+9TiWOAZtPzmnzyZ5zp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O8lLIwO4anUEdTcDCgb4CrWDpg9PYVf2hQZoO1X5m/qt4HUVxt6ELnnYmgTCgtk9A
	 dXYT2j2dWANZZ2XkYBzC+8a67ph8x5yhI2JmPb7LS3Dftl4lVJKeh/W0WhAyP7i41n
	 LTc9JGLMTOFxVdSZCGVZveRabzloi1XwPZTdaZOIEZxIHiX5g/XONaWXKl0F2yKeeS
	 hOH1kMAAPAq/c8jlSfMHPPbFxk+7yJZx3U+2OYEK9kOn93kvHSyg73OqZkbLUCu8GC
	 gObTDtU37Rm1jsfXFR5HhamoWa0XbODGFU2qK/Bcw8ptE8vrsoUj/vg4lT3DMzBBtX
	 PrdFSGEBC6WMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
Date: Thu,  9 Jul 2026 14:32:53 -0500
Message-ID: <178362531886.2423236.15524151411935053875.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
References: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Jul 2026 15:29:23 +0300, Abel Vesa wrote:
> Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
> with the corresponding OPP tables.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
      commit: 4e967cad02bce8983c4e826cd13ef0e730692832

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
