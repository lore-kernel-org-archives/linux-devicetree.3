Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE3A4343F1;
	Wed,  8 Jul 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522673; cv=none; b=rWXOM8SlnRdywP8b11gqUt/Huze85SOy/HwjkJLSpJG4ENyBqL5rjSEdYyfIzDVjETvZ/F31KTDTsQnvSnhnUzqPQ6UxxlazBP8HOgEELhE421Rg989f6ohnTFJT+DKJxiSZ64/dy4p7oJjnGAUrdGs0Lky6wOkvyWN6SBnHAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522673; c=relaxed/simple;
	bh=U5S/YiRi/3tgNM9x6G2f69v+REfmpT1uYoIgUerDaDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Si+YOVDXJMLaI6uPACTK9WrFKtYoygW9lWat7YwdW2Twey+4Onv/EWgfTzF4b28QVzyBRcHIc0IpA78HKJAk9E0dJr7saIWIeEAtF0TvSeq9sziQfgtj0lvaUmOwXGDfUOF/qhC6diuVEBOCbEuGtv/+UMtTlpdwSZcImnaO4Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n86my4xW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n86my4xW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E941F00A3D;
	Wed,  8 Jul 2026 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522672;
	bh=pDk7JZvek6Wa8+duF9L5o3h5GoZgz6SZRsJfOait/4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n86my4xWY0oRxgZyGlufudhBAr4UqIq0TmjaaLX2vUFDopfZ9m9rrPXhvRFLpoB+E
	 0M1yCEh7NCgE2wgTioVRmtFN6zMMwfENZPbp4dEJCscCLmoG4Hd2V/jj//eMIKjDhP
	 DCQ25hVnvRStPQ5iFbFmwS00ETe8a542cUZpIyILt8g3Gpc56egQFBKEvndlqsDpbt
	 eFlOdrE6/EI3yVP95McTzWn5oU+RVv4spWkcciovBip7sMjMailpCZwmG9EOzfiRa5
	 Xd7K2VtCKK4VH9dZzZ9Pf4tcEXts0QfG8afrlaAKlI+hFh5GjCmaR7J48YchjlhL/7
	 EkAWvlkagUNKQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: qcom: sm8650: misc enhancements
Date: Wed,  8 Jul 2026 09:56:52 -0500
Message-ID: <178352261621.2235436.10047342474988179608.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
References: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Jun 2026 18:48:55 +0200, Neil Armstrong wrote:
> Misc enhancements for the SM8650 platform:
> - update the cpus capacity-dmips-mhz
> - add the CPU cache sizes
> - correct the soundwire ports
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
      commit: bb016ddb9061a89c72448f4dbe356350f5cac0ea
[2/3] arm64: dts: qcom: sm8650: add CPU cache size properties
      commit: 884ff1172a70f47697c5033701b4c86f23abdb57
[3/3] arm64: dts: qcom: sm8650: fix soundwire ports properties
      commit: c0bec4b58b8e740236d9ac338821f78dbf784546

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
