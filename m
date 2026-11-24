Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539726;
	b=niBHofWwL2RT9Vc+bR54e7kuP1Jd48rKG9/BS+yzciK1Le/0UhkAVBo+hC7rUxEMicOb
	 lwQsQ/+DRGTxQACCQRF1qagUx3nOWq+uQPdVKIgiM3cHYUW36+/UJSoozUiBwqMkOjJ86
	 FaS+eX+tF8YKvjvOCGmDjHs1UvqY/dLP6OtA7P7OLQ6fWX72ou/qhiC7bXLPTkUdNucbu
	 jaJi3VRPCq+z7Go/5qsOm1FGME8Vm3meqn2PLopOCzTZlM92mRJSd/RUdqQrGqTDXLeDw
	 t0qB7zQIqXcdioNJJLorHI1EmN1tP85UsgoudM4NsSjEAY6tOQaKgkEqwXAwJyGW0vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=RRiL4OzOpohN/ZafWfD+xctnmPPDVha9Ds90ZcxZC54=;
	b=ooPWLKm2PA6zNnT2iZzsqbOwgUPCoPFRbpTTW66jOxMQLyF+S/rUvluuI6vFNOh8AtHn
	 BZJpS0VXpJzoFO47e+7Gpq95oulyt+Tz6E9toR+kGsLlER7ej87Z4I+bFjWsP5+kMT8xV
	 9uk2kE+QtSC28d3QlRwNa9hWqlWa+yQUKqJvVejHPDov7xjnEMDWKEw/3h4avYU1hzTB/
	 61jXPoO0BNLhtLW+BxHFgvdCiZUaT7up3OGate1OMcPoF+H+cXPiPyf4mpdRYifr9jUY/
	 EM2wpxk8jSVrigNMcQOnQQ0CQ2z140FHCW83GreEDytZIyQXFfveab0QLPhCi6mCDoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VL+ku6Bl;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2CA606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD2CA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VL+ku6Bl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so62073435e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795539723; x=1796144523; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RRiL4OzOpohN/ZafWfD+xctnmPPDVha9Ds90ZcxZC54=;
        b=VL+ku6BllDctlQo0U1qeDvY67hZAq4is9jGArvHsy0JkBdB3d1YBir7hTpH6vyEJ6a
         GBBaoywovwgLzVyMI3yrvQbAPC13o4hra2oUfWKEw64n1bQchlQLRBKwR1TaYt5R3AWb
         XeOLwZ5I11Hxo6ppaxH8cot5HlBEEhBcuPzqcnE/usduUXJtGD+F1esZvhZ7kvIl96w1
         HBiujCsoMm0qZG9Sm1pLWy3mbT+fxsIVHdE2Dv7zycAJ31suKlNEpYCtDHKSQTFefFPp
         Bq+CQzBOP41oK6D14Q5wB5H+ZC8nkVOvYJw6CL9lEUsYKPwyGCbkm99BntjcQxYEC8au
         Hpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539723; x=1796144523;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RRiL4OzOpohN/ZafWfD+xctnmPPDVha9Ds90ZcxZC54=;
        b=ez328t8WwDtOF/aa/cJzi51lvCw3oFf7QxLFTkxT8pkbIyqDSsz1sz369LF5YLuOdC
         9be69SOTgkluua5gAw0VoytYZQyuiUbVWNtH8biqjc3GYoQnfF30E94NZjJKQQw0Ih44
         JMjIkJQgDewud3uJQEBIGtoLbv9GkL12NepIWU1CCKevVtvZbNSs8HMW1se5IB7uUaEJ
         Je37r65grkjUhHxrAfVYhwW1SxYCGPl9w/qBwMy3xPPWuNtRlMRd5kZ8XPoqytldqG7x
         ARi0mVcjtHUzVMIG0l6HoEcgSvpQpUwX6KnlHiQ36JzkK0BMZQSho93DX6kmnR/RcKUR
         eLBw==
X-Forwarded-Encrypted: i=1; AL+hErFe9/86sQpSjiGRgvQ51Yn+//Xn+D02C62V4MewzTDEZI/b3q8kOBH3SE4h0CiXcmuLD9/Yyp67EPtw@vger.kernel.org
X-Gm-Message-State: APuU4Z9r3zSZh1ILjCHl1gHdhMb6BIRlXyJ0ZIUO91/npZOkJBvWA/W8
	SWzk8ALv5uR/oVh/9T7dPlUc3fdadTbVE9qqy9oYyeMAmr/78BwbbR8S+6tunONN2KU=
X-Gm-Gg: AZFdTZcHf9VuArIup1BZ5r5wyTSxzamCMzF4bm5Aq5KSixHQJLxyMXU397X+gzq7XO7
	M2AaNh3ddP9wQb5ALNDOEtXkkYOUIJTq0AIgW27Fzpb5gsyxo46n32gAuSu/vZFHmWddK53jsKT
	vlqAjbkZsRxXOSokC8VvTros945daFGbq8t8JfDZnU163wnkKF0VxDvXKVQ/hwJijUpVbJk6fyv
	J55AbvPNs9hAcrWtNK/RgXxsuZE8woJezVvxdV+hhdpl+iu8pqseKfGSWqIUk6IYdTfRVJAL3wX
	1RNtJLibL62QTzKqLTHfXjjmgsFFuSQ2SSCUE9FtS22J6K0rJdP/iNUNEnCrn4AJr1gKx+e3ppy
	ZMNlGzZ05/D3V6PA+P9R17x5wHgZoR0Den1F1R5IFk5AdVkyynKaquZJ36lfqxj849w1oKRQNW5
	XoSk5KUv5MpaPdx41ux2AQ6oSakrXOOkoSEwAtuWa/OHauJ4XR25wAf9/eUdxAtbM2+2ESacy9H
	VJNcUvsTVUWPbldhadHYtY8cCN0jin9oYpd8yQj9sWEWgFQPJYxLCpZt+RM1FNCeq8qb/modTkt
	VJOfIJX6M9Ijc29zMJDZ/fDJxs5BrNRTnh103VJSVda6jGLoZgY=
X-Received: by 2002:a7b:cbc8:0:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb860f6ae9mr268381825e9.2.1795539722932;
        Tue, 24 Nov 2026 09:02:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm30778526f8f.1.2026.11.24.09.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:02:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] clk: qcom: add SM8650 LPASS core & audio clock
 controllers
Date: Tue, 24 Nov 2026 18:01:53 +0100
Message-Id: <20261124-topic-sm8650-el2-clks-v2-0-8086440e2c09@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAHDBWsC/32NQQ6CMBBFr2K6dgwtUtCV9zAsyjiFUaSkg0RDu
 LuAe5cvef/9SQlFJlHn3aQijSwcugXMfqewcV1NwLeFlUmM1VqnMISeEeRZ2CwBag1g+xBAi84
 fTZqjy9Wy7SN5fm/da/ljeVV3wmGNrUbDMoT42Y5HvXp/PkYNCWS6SL11rjp5vLTcuRgOIdaqn
 Of5CwDhyS3IAAAA
X-Change-ID: 20261113-topic-sm8650-el2-clks-c6caf4237ca7
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8xldoLxtezJbtP4/pZjzbhRupDGzWKXysrmDChcvVC8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcMIp2x3vV888qJY+E4xqRsaVgLOWlpQeahOJ5se
 +FWi/PeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXDCAAKCRB33NvayMhJ0X03D/
 4gc5Vfkq2Dp2ipO/vLvm+21a13LPwtYQA+apcvS75tSREjNxdehlRHRMr9ZdgbzdIxSF3F+1bz45sI
 I2Cjn9QEW9et7g8H1IMPOTNnmctzj+i9b6OkFsbH7sMeH7RuNxxwsVhZ8GZSpkpyufvTI8pyR7CR2g
 +Tap74pdXi+eY3vnvz+GgMUyH8PgoG9wu/OAcQASVsU6uwGern4eYzvKDVHWbPsMpTDVxczt9Rf16x
 NVH442uQ5/j+VqH8ciNlQP3BM/Ct14y/xzWuCI9dyu9VdKhI6OA/ImKCVLlLiVFrUqePWaAn4HoZn7
 5uPhehbSERAFjjgu1hwVWRqO30uzx1C48p6w1nsBmEnn8Dgs//msQcFDx8vJmH6w6IatMKMMxdPTz0
 t5hZkf6lT5j5Oa6hOf2EeSLjBxrV8MyVwWyxtr23FL0bVuuNMPWMQwWE7oGxFbdC3tWAn7bZ6eVmeO
 UrrbGfEDNbEgKJGPDX9qH6ZAu3sTsUb4qr7dDR6gcWq1RyaKOmRDLAffTVx14P8L/O7eJKaVvWEZjo
 ajwI0mIlCFnXeyZVC0ED026gNwxndzjgp3/ZBaljFgEYXl8Q7w1l54CaXZKX6L7CPndQAcm/wET9ko
 xMAIKLpsuTFhgH0mU4M76obL8UR4j08HlmGtgqKrrtBr1xP8lhij16Vh0yuA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This patchset is part of a serie adding the necessary plumbing to
drive the SM8650 audio interfaces directly from Linux.
This is required for boards like the Valve Deckard that boot Linux at EL2
without the ADSP audio firmware, meaning the audio interfaces must be driven
directly by the application processor through lpass-cpu.

This patchset is forked from the monoliothic v1 at [1].

Without the ADSP firmware, the LPASS clocks (MI2S bit clocks,
codec macro MCLKs, LPM memory clocks) must be controlled by Linux.

[1] https://patch.msgid.link/20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Fix qcom,sm8650-lpasscorecc.yaml example
- Correct lpass_aon_cc_ext_if1_clk_src parent map
- Add freq_tbl to lpass_aon_cc_main_rcg_clk_src
- Drop comments
- Drop useless lpass_aon_cc_tx_mclk_clk forward declaration
- Add common probe for  lpass_audio & lpass_aon
- Use correct PM macro
- Use pm_ptr()
- Unregister aon_cc if audio_cc fails to register
- Fix corecc pll user_ctl_val and ops
- Fix parent data index
- Drop pm for lpasscorecc-sm8650
- Unregister lpass_hm if lpass_core fails to register
- Link to v1: https://patch.msgid.link/20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org

---
Neil Armstrong (2):
      dt-bindings: clock: qcom: add SM8650 LPASS core & audio clock controllers
      clk: qcom: add SM8650 LPASS core & audio clock controllers

 .../bindings/clock/qcom,sm8650-lpasscorecc.yaml    | 178 +++++
 drivers/clk/qcom/Kconfig                           |  12 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/lpassaudiocc-sm8650.c             | 761 +++++++++++++++++++++
 drivers/clk/qcom/lpasscorecc-sm8650.c              | 506 ++++++++++++++
 .../dt-bindings/clock/qcom,lpassaudiocc-sm8650.h   |  47 ++
 .../dt-bindings/clock/qcom,lpasscorecc-sm8650.h    |  30 +
 7 files changed, 1535 insertions(+)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261113-topic-sm8650-el2-clks-c6caf4237ca7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

