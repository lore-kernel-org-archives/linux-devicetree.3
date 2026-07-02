Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2693D9532;
	Thu,  2 Jul 2026 23:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035667; cv=none; b=A6vLPd2JzdQf1XNU09Zxjf9srMgARqqHJi1TA7huGFDvXUWsgztNf9iliHYPO022cExXVJYupGjJOGHfVZRDFgVwC603eK/BimBSLSRjrwzEuUnyUmCzF6uqIZu0R7buZwKyVoqJnayoAKX/5JEnQDXdWuIxpONg/kHPW4Ln3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035667; c=relaxed/simple;
	bh=aGAxY1FdQYTnz3CDTkY/tX0nlrTTOjnsIV+UNqpjE6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2dsJjnmD5KvFkkYn/aWiJJ7nubOQTylRLveLlQfnKyQlgcLUjBOdJlGENA0rU4XnLaOvOCbN89XsTjwCZIzs2LssaIDouAFlxCRU5K/2KYos3uLFcsa99v65aGaLgjiFes803HrEQ9tpX+Jwm44e+m7WE9KrZffDEyoq+LGCpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kC8/VT2M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kC8/VT2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CA21F00A3D;
	Thu,  2 Jul 2026 23:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035665;
	bh=rDkA+ndU7z77XDHB+OxSF0A3MJ+FBONElwBRBczNxAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kC8/VT2MyZKzd9iM1DlZf9h6Op2JTYEFdip0IZSGMNzMZv0MNZIiGdjABqCeLikzs
	 0HOMg4A09mTiRyjm+8magUr3Np1Mz4Jsj4O1EcZ8q/cuSRFbqOX0iZ8lOuDBN+e70g
	 exCR21dDyyplwBexficArtv+fi1COT1uxyQ0HjyRwpMDti24HVXoRLNRfxWqBs6zUr
	 u4epYEXtmktu6+NAtejJ0WzE2WZiBRtlFkSWIcfhe5WiGc9kv78UVqxHucPXHyz7MP
	 YlojzlFcjFcizZG55YsIF4wK/fVwhNxJL5PpjPx1XzQqTG+aR+NNz0TQ+YqXeYw7v/
	 bjMbor+grpBwQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane DisplayPort Alt Mode
Date: Thu,  2 Jul 2026 18:40:40 -0500
Message-ID: <178303563661.359079.9150820789126381547.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Apr 2026 15:30:02 +0530, Mahadevan P wrote:
> Add the mode-switch property to the QMP combo PHY so that mode-switch
> events are routed to it, allowing the PHY to enter DisplayPort Alternate
> Mode. Expand the DP data-lanes assignment from two to four lanes to make
> use of the full link bandwidth available in this configuration.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane DisplayPort Alt Mode
      commit: d5e3237dafb91c87e0204decddd22e6378b32769

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
