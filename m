Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051876;
	b=Wqv6HTrwREqLRlBXrTpYuBI5UwZTXHP8KEoYXBotSlzaVzi94bkrW7Pb1TYpRqZGx1ih
	 idNZp+AXsUIZ7jR1RjFACpScLmjlh7DjCbr+UEtV6laSmmVlr7TDGXdu6ZOjBVpunHSF+
	 qIls6M4HHbMdKeOYRiZ4FrI3pwyYv0HXTwiKskQuwYAqtHhBj/HFT3E/MvdgViJt4M5Yq
	 AN/dOgqP+d6KZq0mOXA1An4UcM/vNOTl8xeR4kSY0bi2jO6wVIaooPHT/dnhny/TGpo0D
	 JD2K9JqVxH09y3+8PB8M/W208qEF0gJqEYmNWmyTHhw0XSvff9YM6LVIybrOTkl9FDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051876;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Kzl1ZAv7cZa8GOddkLjuda7BV1w0chektIixjhktA/c=;
	b=LzEpPLCbaQEnV9cG3tkPKStrTQ4nj5wIa1svnUQkRTmDSQwJB4vpKHVY2TE2YEJ68klP
	 4XoL+66JOsNveuf5zLRLFZocjF+IEIORKqIAeDzaEI9YYpAk3sdhfV4830taEgy8RjXQ8
	 utKdnXa3SDeRp9MkIgPWinranosqxjipDJzy/QbO9XM1MEav3EkPiOIJESBXjpogK2OUQ
	 LdRkqdDvroxl65YkU49JbovtTJ3f8hDjRJZ4b/X5vKA1r2vWwtgPBNh8dpB0PLhchjz9f
	 qVxDKUs0/u0a6+3xoQ09LB+iKY1A4kDEgyVQv4uu6UeA6IUV3DqwciSAtfJfeA6P3lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Y19sIOva;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349E2606A320
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 349E2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Y19sIOva
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793051872; x=1793311072;
	bh=Kzl1ZAv7cZa8GOddkLjuda7BV1w0chektIixjhktA/c=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Y19sIOva1HYoQbMteC6++7RCKBcbrE9U7onug1vWs3QZSrVK0uOhe3bFdmWkWKVeQ
	 FE4xPQWV4GEZXNgc8PrxnruH09giPnsGPc4uorKDuBAwOSTJ777nKYPTuSI5Ae7AP1
	 Pq4G+TclY7hUN7/z9tKtwdaBe8o+aHwwYXYVst7rz/Nbhjcrl/7L1pRvQWr41eSdYV
	 3pF+WEyfPdNBa87ihgr0DXKJBCdRnQS788LMjr2OCzxPgqHZQzPL8C/7gbjpQGLm2f
	 Z0jmgjKcPPi2hL3fZ+Drb1xjnsm5thshGz9vj6Fz/oK1at0Ieioxy46m9QTTzHEHXl
	 ZmA8hZYDw2YHQ==
X-Pm-Submission-Id: 4jD6th3rj5z2Scmj
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 21:46:23 +0000
Subject: [PATCH v2 0/2] Fix SM6115 MDSS register access during runtime resume
Message-ID: <179305118390.93309.15055947565850813746.sm6115-mdss-ahb-v2-0@michaelmcallister.org>
In-Reply-To: <cover.1792852079.git.me@michaelmcallister.org>
References: <cover.1792852079.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

This fixes garbled compressed scanout on my device (Moto G10, SM4250)
after display power cycling. MDSS needs the DISPCC AHB clock before the
DPU child resumes, so this adds it to the binding and shared SM6115 clock
list. I tested this on 7.2.9 and power-cycled the display 20 times.

Changes in v2:
- Remove blank lines between commit trailers.
- Add the received review tags.

v1: https://lore.kernel.org/all/cover.1792852079.git.me@michaelmcallister.org/

Michael McAllister (2):
  dt-bindings: display: msm: sm6115-mdss: Add missing AHB clock
  arm64: dts: qcom: sm6115: Add missing MDSS AHB clock

 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml    | 5 ++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi                         | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)


base-commit: d053e38e614fb2e383b298ce8fc308a780d7f209
-- 
2.39.5
