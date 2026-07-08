Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC273F12C9;
	Wed,  8 Jul 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522666; cv=none; b=ZwE06bM5b0eCKzmfAD9eYyaX7eWroe+903IVHUczmM245KUiAon5Csvq9FPcr9AjhjVbbkxgdU+e5Xd7aLx7/JrXHEknyTzY+DedqEraB67RECW4LRzJdSbVo/31VtC/SnQA0kv2eF4erX+lKStkSJktlNHGmE/OzVMc5kUVNoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522666; c=relaxed/simple;
	bh=kU4xSznuFl8uM+V/D740o0dwPvvezhGu5J/RYfPw6EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V5QYv5r21rA/KncY15SmxDr1Uy485oFQso1EJ6WhBVDFL4Yb0Zorm6wAxbOH77avnD4oFQ1hWvnhrgA+9smMlWAS7XjNmcfsmwhsz9XlJmyI3FdssozPoSDDSlISf537h6x0iwmK8QiZFxrL6DBavNnTYa1rQgd8eQmtTGc0BEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cloZf7/H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cloZf7/H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD43C1F00ADB;
	Wed,  8 Jul 2026 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522665;
	bh=8ch4yZqPCBcSimke4UhZ/cKB24eMRKtvV+Ug9A6IshU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cloZf7/H3zxW0nNpvL+VD5qbqwPCIP53w8HydPYGRqe/0zb1Fe3Jk1YZL3XnhCEsx
	 C3Dl5cmtK55Kt8ZBuF9wk5UUtfZlI0WWuQ0u15iakHk+4n6cwcUi8W1CeefIxhZ5Gr
	 VC9dWfVlLKZXld72QYQUaaXnzrByXTiirA/ntgNRCfiSSdJfJRtXP9xf5d+4AF8vtg
	 hLji6D0luCssMWofC12YUArhEPMib14A7kPVN3JWsVOu7eo5dhXF5CL1Dcyart99Nw
	 TPhUQ0teY6Z08ORW/9Pm4FKVRsdTstBdLn8yKo4RJDu6dtDxsNuD2nQyKe2XnChwhJ
	 08bYz2fMY4/fg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: sc8280xp: fix and improve pinctrl
Date: Wed,  8 Jul 2026 09:56:46 -0500
Message-ID: <178352261645.2235436.7506953794540668934.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629065905.15651-1-mitltlatltl@gmail.com>
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jun 2026 14:59:02 +0800, Pengyu Luo wrote:
> Add camera mclk pinctrl definitions to sc8280xp.dtsi and drop local
> and duplicated definitions, as this is common for sc8280xp based
> devices. Since the correct drive-strength is 6, fix it too.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
      commit: 06f07e693cc33d5d9695652f679c6321a751020e
[2/3] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
      commit: 6e2f2454640b21db48d1f1bc8a068a8862d6cf1f
[3/3] arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl
      commit: fbe4faae9869fcb03884c078187f985db693298c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
