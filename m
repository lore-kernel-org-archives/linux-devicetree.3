Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018307;
	b=4n5HIeOpEDHKKAwGVPTK8rZOGD7KNyW7em1eGH2Vvtb36+A2i+8Inu+bv/BluGXcq5fI
	 enFw2I9wHpMpVZC9PYu21q0DcyCDWl3VZlSdN+ofAeU42uzPfQBb4Y20I8sRGym7wiSQ1
	 jnzZOdHU4/jIV5+n4yErJlzCE7gcZVj7oJROiKQUIgvp/m3jzeAwyYtc4MDLW/Q+mcPJU
	 Gv8W3f07Ac+rkyxVEjkpOsaHVSh26AmzUi5XcRbc9wHiCbAQ1JDxVsAIuYdfQdjT7+sU6
	 X/BtnY1i26TOwUte9Mn2MlZl5qEXj/POPh1r6VYFvbAaj7dQk2BX/QmK1VWCW8CPXbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=di1VRLm1UqWBNtntlKfBC2I8DVMPkZ+84nIHrlZ9/j4=;
	b=gZrd1E7CJoTYugTwTgBf5FKvWcN+bSdwmqCxJVW9nZhaxDX2EV6QyHXROSCJseFXHXrM
	 JhKo6ciu0V8dWvOIqq4XZh1RWQu2H72zrdiZ2uTuwYXUiLVvTrByp4tBfP02NKkdYrsO0
	 JTlL+CDKwvCyDpiNRhToNKmUoBhpEZ3qatXWn0v+0Qi9aInMjsKb4zBPC1m90NsPfmCQp
	 mUNLO0h9xbmtWKFtX06I4XrrFH5DPTf3moDhTFo8kKEhIFSvxcPkYDVM9/pC4bvb4q0A6
	 aEBqO9axU6A7n3xvMEMeLXhDbQfCIkcYvz1fJn2dxMeSM7jjBGfgQvsMVUyzN5zOqDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBM5NYlb;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1A1606A32D
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C1A1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBM5NYlb
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-980c4258105so656606241.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018306; x=1794623106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=di1VRLm1UqWBNtntlKfBC2I8DVMPkZ+84nIHrlZ9/j4=;
        b=GBM5NYlb/2KYIN4+6oMVOLhLKYe1LYH8PoQfIrk8eZ6FQAl7UVf+/C81j/j7XppFWG
         z/T8GEY3WGp8Vwq0ODHSkuO69L+H4C7HtJSSmeI/KAuWS7TTiWEyAww+ReZbMh8CFCig
         moUIluGJDFdTlUnZA5r5NwsxOJ0n5zVtuL/1AaRv3KtSxvKKEndg/SWSVhBkrWmljX5R
         eY30JI4smany7tVNErBkmoacVJ1goZyGnHKqBH8k+bP7GHHsI7Av5XSBG73zILOL2Ytu
         r7+tAt2NrDpSJXsMr+w6ZBiJtwAFkrbTQ5If9mCUy0VKqh2DreVuukW2Cy//e9bb3INR
         Az5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018306; x=1794623106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=di1VRLm1UqWBNtntlKfBC2I8DVMPkZ+84nIHrlZ9/j4=;
        b=aDOO0c75hWRBAAxW+gYLN4N5KYLFKvTNvWjoPKxhk+7AT520fib2d+CjXyfGvIVQDa
         fFskyfRMZUFZavmgwx7yhO2nO0MjJvMM/2MQIA9Z84KR7fBohSE+qcHfFzudn8vMr9pi
         +n0WnLxcX9gSbc2GgoHtZFMETeol2eV4RdkGK9xUkXXMUvfoUJvPe8A1RWTfQ8TniICX
         U+BCuolK1lKp4i8IZjcNum0d3E3MX4/Pt53QFOE4VEAT92frAv+hlGKQ8+3CxKsOBRmt
         9nqtaSJ6MK4x8ggYOtGovnSCyjvGz6k3X1Pk46iX773DbOokdDAC9LIThr4r+Q3JE2L6
         vgtQ==
X-Forwarded-Encrypted: i=1; AL+hErG2TXi8ReYK08r2xUGnXgm0Q23BJ0PNEGsbbuw3iGuxz45InKCy+DXtQkJQM9G9CPv4iTF1eL+wKHfx@vger.kernel.org
X-Gm-Message-State: APuU4Z+CFC5ka+S1N9+Yw+ElrGQJjH47+T53ci5xs6HfqwvvIVZlURek
	AwNkjCa50EqKrTdrwlDRvia/jsRqjDfa78LLro3oGQ8Sk1RCG+tFsLzA
X-Gm-Gg: AYBFou3ocyZrn+CY7cFEMioP+6/FMoWPZRF3cAN6ll19Dz9RzX0fUiB1jzP8OA6j8s6
	8+0TZN8Cr+y3gCCLRNHegwrpTG0/62ktb644SwERr6pCJioRFbat8wOOsBLnqHnMPzRB44EX6qs
	Pecm7sfP0B4D8/OsnqdXkwjaIjzZjbFQOLmm95f/TOw8YkzoVfQwoDd/ccn0pYXBLFGxFKUyoJv
	m1f1EJpCQ8DnadlSJuQOZNYVus6KcTfkGd/5Qz42hjRrJuUflMFFNXMNXP+0JAMG3eja7ukJVIW
	he1OOGM9j2dpnPjIjZ1Yh0Qg6lU0/PQzJUCFsKoxcWdNRObHG5BQlOQQPaMX7R95HXYIUKz2i4R
	2lRcdmoSmkW/smyTckhpJnnJh8aOFmCxDWzuf0ffQ0Q5i77FYjjVwR4QkQ7os/87AgGlaae1Gb6
	ZcntqE5jfVRlI6uDhgzXCiuvBljnTU/98gKiXfVWj1rc3JDrr503Z5Q0DxkBbgP5CEYKUG+eNbY
	CN9CAnVJNPSqorU3t8P+nri1nRUiosQzJF5PIxDrBE6h1D049eDG955L99+vWBCTkhpyIGU0iB4
	ufRo4yFfTpU2ynkMJVS6Oj+KxByk
X-Received: by 2002:a05:6102:32d4:b0:7cc:3eb0:6ece with SMTP id ada2fe7eead31-7d2a166319amr2396569137.33.1794018306156;
        Fri, 06 Nov 2026 18:25:06 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a89412besm2641941137.3.2026.11.06.18.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:05 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
Date: Fri,  6 Nov 2026 21:24:44 -0500
Message-ID: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
- stop using fallback compatible and add lcx power domain (3-5/9)
- move lpass codec bclk from sdm670-google-common.dtsi to sdm670.dtsi
  (5/9, 9/9)
- reformat q6dsp dts (5/9)
- set flags for codec interrupts (7/9)
- move "qcom,..." properties to board dtsi (7/9, 9/9)
- add review tags (6/9)

Changes since v1 (https://lore.kernel.org/r/20260922015801.32373-1-mailingradian@gmail.com):
- squashed sound card and device-specific codec config (11/11)
- converted to fallback compatible (4/11)
- added compatible for WCD digital codec (5/11, 10/11)
- removed sleepstate comment (7/11)
- sorted subnodes of dai link (11/11)
- add review tags (1-3/11)

Richard Acayan (9):
  dt-bindings: soc: qcom,smp2p: add sleepstate support
  dt-bindings: soc: qcom: aoss: Add compatible for SDM670
  dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
  remoteproc: qcom: pas: Add SDM670 ADSP support
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: add sound card

 .../bindings/remoteproc/qcom,adsp.yaml        |  15 ++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 .../bindings/soc/qcom/qcom,smp2p.yaml         |   2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  37 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 142 +++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 199 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |  16 ++
 7 files changed, 411 insertions(+), 1 deletion(-)

-- 
2.56.0

