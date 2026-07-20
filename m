Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA123EBF02;
	Mon, 20 Jul 2026 17:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568079; cv=none; b=cfOGLe7EqbKTKm5T0/lpz/Wr1zKfbqrrzywBN/8uI7sKOI+uoIOS8o4GUCiokxRpY18EWrX4yxk/fHlp+9dA7xbFT/3DmVDmdkClUMdZoy7dulmvUZuBaxIkCRTZw23ZqeFTpbQd0Lsx+7Dvi/u8XLHMesEVz6IKhlb7lymKoSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568079; c=relaxed/simple;
	bh=vXeRsH60umyCWYIZCGYJrFhLrwa7jM3anYzovnM+Nk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWEO3Ue8ID1RTu+UywAB6tf+Yu19Dmy7ekA/XM0HSVHS/I1rAlcpj7bbf7P0LD4FTBR5mo93WJDoaWx0YGHwMPyXt0RBscnAbsC12trYzaV/J9L37g1s4PsHUD6uJ7idPRXRW9QItUHR1eX0OI/99Bw3ZL7LaksJW6GzvpBezaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YA4lql/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YA4lql/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0F91F00A3E;
	Mon, 20 Jul 2026 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784568074;
	bh=PigT22x052A5tMJwLUuXnSXh1jupbSv9Bsju33V7X5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YA4lql/jckHAm2em8GLtfH9gflk/KGKG1pLLXzPtlJWqMoyF9wYtryaDwY8Hors1J
	 EA9qmtMYzsflW5s1/v3/i8TD4W6ubE+FYBNq248ctMTk8PjFf2rAkGiqeQEjCUVfQq
	 CUFF26uZc77ncBEyVGk2nsI4UDkLplTpAXj8BbmZ+v6Hxe0pN36s5vncOK8Yt+gXqK
	 4E4bTWUjXha6mrYoQyL1culAeNhJa0Qt0GHCWR+naAVJDSOZvjlafCU7FHzxXvJZPe
	 dwCe5o/V049feZiSdmDxvYZ8xeNYmcFOvAm3SrPcpkg2DlRgYlCFQIKpb4ysVjOCLg
	 Rg+A0Kbyvg7bg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: enable ETR and CTCU devices
Date: Mon, 20 Jul 2026 12:21:03 -0500
Message-ID: <178456806276.1732507.2336611309821811382.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714-add-ctcu-etr-for-glymur-v1-1-791de63c0713@oss.qualcomm.com>
References: <20260714-add-ctcu-etr-for-glymur-v1-1-791de63c0713@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jul 2026 14:50:58 +0800, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: enable ETR and CTCU devices
      commit: 394b63a2bbf2d1e98d411ee5ec52d68f66bbf984

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
