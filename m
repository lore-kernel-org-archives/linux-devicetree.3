Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C047DD43
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984720; cv=none; b=fwSgG1/cohu/k080eswej9lW/N+ESz5/M9I2lc0j5pJShuk6Z0lipUYKNqBhjtaerbqHoY2XVsf46t1B3b4clFhTt1bfJoCKBxeshjvb/2R2Zj2dJXkjKAbeXonjGUX6LT2LjhTXEMrsqIB6kASHSbqsIbc/tkpqljLxbL3Kck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984720; c=relaxed/simple;
	bh=+fANNshveHDBQS7nfrmMdFaYS0j37Tv9RT4C9/65hAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otL37TWRHIirxCLL60b7cYAo5SXmDPghistFDs5Wb+xMxEf9Lb/FLpGDsb98f0/FIFbNkhF/0Vuj7fgqA0uprY/GsIAhma2FWOaWlKy9/Nep0Dn2+rGAN68qAlGnZPcW/v63iqmK5CI8jFCH3R4dK5cZmM/dbpmh56KWs6kRNhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOdgXK8w; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOdgXK8w"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso900369f8f.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984714; x=1783589514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=080J4XQHWy2JRItkUs2O7FVFK7xVl4fc0pDCjHsxwTM=;
        b=TOdgXK8w/T1gYeaP5A+oV+yo6uFCwaLwj++al1Bce0d39fB48MG72VBdjjuEbEhDif
         lO+xmXGDZyzMtpV4v79PR5stecXKWhqbKQYtsHBvk7BWQARpfJ8CmQVSMD1JzzxhRF1K
         uPzxNEEfiNS+wM+l4e/ra7RYfizxZOr5juGkcZ9B+q8INNJR6uIhhY+baSYmz+kzcUXe
         Zme4312rx4VwCR715p+U1YU+DohBYLjF+IXUcyeWuUEAJCT1wbWzDZoChRBFWMwP/l8i
         rodR57IVSZE7+j5Bbqa763rIHq4k4UdF7JHpLxzYYSQ89Thv7LqxsdIGieudIuhzcVm9
         N1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984714; x=1783589514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=080J4XQHWy2JRItkUs2O7FVFK7xVl4fc0pDCjHsxwTM=;
        b=ahDdNAImL070QtaG62H+EvZkUU8rO9Dh+Ib5A2PW9gmNU+SV6PYL6Zl4aQ4N0WDene
         34GiCr6Tmj21mRgYZvgbQLlvwprFg74XaAa92P8o4aOZOCjB6Rtmc+SRd2qXKqloQ631
         kNupGyF0EgR+BeU2lZvGVkFxf4E+abY6Cr+OpDwFYEiCvThhMXzrgCSjGOsycy2h2+hx
         bH8CgWAR3akr6CRA2ZEhwP1VdHKSW4j/+38Tj+YbUID2LN/1MRjSNi8+WXM0B4p/ydyG
         wQ8d2c+Ebcw+LKh+7MNpic1is3Ht/9uLiBTMlKasI74IEaF0o2g6Ewa4nqE3t7l/ca5X
         iU/A==
X-Forwarded-Encrypted: i=1; AHgh+RoA4NIN7cB38VT9wltBEuHRYICicF6JjSPSNMCLYxISVFHWbMuohgzMMIVDk1WPyznOY2tGyVbGEWXY@vger.kernel.org
X-Gm-Message-State: AOJu0YxhzGvIxLQvvh14an5ptix2/3IiPna9a71wAWQZ+YzZORamBPg5
	HrGkD4w4ty2vZU2fWH+7Gv1UCnBR+0izl0AqNNhehUPxvIRXkYO7V3M7j6o0Uidvzgw=
X-Gm-Gg: AfdE7ckEztifAtp1t6cAibyotb8H+hPILoLU6Ii5cViKTJziyqPL9sPDbY5pfnpRf9z
	u9ribDKxNivUxIpVDVTunXOLaRNpvE8N2iUd1fAoebFlH8wml4GtoiO97IY/LvvExyUL+hBoSff
	GuV2OewbNWDpMOaRS+Nf/J7En6tcWJT2D2krflEFkWaUvD2HgKGDwsU5megTBUf5xMv8cYzWn+C
	xPeeBam3dIos4xutei1kbMzOD3//BioIkLxLFk/pf/fUVrkVJKQdZNgRD+TBcsTeqD0LOPI5Tmc
	LgmYXcvQkkcBT6+DGtVdGRQrepPkDlOcPCT0b3QGIDtAQhYq6mwbVaKwr5bcbGMH045C7ba0gdC
	2uYFBwhuu38qj7gqDJT1uPyKveMMKER+szBpERpMqK001Pd56E25ar9ld1JguAkxJSs7zROkttX
	gCxeo8ttP5rsVfo845mKvQUvA1tmjiFv2tMQ==
X-Received: by 2002:a05:6000:288e:b0:477:3986:9b54 with SMTP id ffacd0b85a97d-4775779805cmr7487313f8f.20.1782984714078;
        Thu, 02 Jul 2026 02:31:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd53fsm7102571f8f.37.2026.07.02.02.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:31:48 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-4-1ef8ceb8c9ec@linaro.org>
References: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
In-Reply-To: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+fANNshveHDBQS7nfrmMdFaYS0j37Tv9RT4C9/65hAA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjADFLzF5KZqGVPPEAOzPgOuI5gyIc4TuZxR/rFa
 cLeYhGuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwAwAKCRB33NvayMhJ0WXtEA
 COv/10jY0WihPStJbOhVh/DFSXa+kbEeOhCCk7+X8EVDDILc0+9OglJMkv3/FdVITRjEDF1JSplESZ
 rGK3piyzyjz4oydec+VSLPvq1N7oglkCy7I1R5DqSA5/f0lxIyjEqQAte4YrY+31P6dPuSCx4fx24Q
 0z236PVgqEV+zJIXUNp5WRTOqhzP1Uq625zrZOCf+1uCwmlFVvvVqyLAOYoRD9kpohowg7qVbW6aw2
 6KPOG1/i5+cte4enlZiEtVEclhkStsARlJ2cho3lhPiRkJCgcPjNwQvhcwxwCFLCLMv6Jv30E/eP+L
 5FVUg7k8UIiw4GiawF8z5/P+UszJKC+9TH1jitz+8a4M6qEEm8hbaLbQm4cKf0c8M85irJFBaN0foi
 gNWc1FSwA3iFFRnNj1NF6ugp4gwzeGCdES69WU/H7Nwu7sBVf4D2YOjWfkom4i/zvuNkbPj4UFEsth
 e9g3SE6R3jtw7iO7nCxi6rL7V54Nw8tGWskQnMO+1aWSVQ9qabGC1/KrHbhEw5QUJcJggpV4iCUzuv
 hfV96ovrDxZJK3qZJTBCyOZcZp9Ox5e6Y2Zm4BiKMH0lxkcJe8Ep4xE1G5onbr+O4Mb6WyU/7rBElZ
 hUjMALdpMS5aem5Pqsfw4N7yocnsVzWLTDFVdnb6O8K+Iq0uUATArGes0sjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Switch to the ayaneo,pocket-s2-sndcard since the hardware connection
of the WSA speakers on the WSA2 port only makes it is incompatible
with the default SM8650 generic sound card.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..508d1445bf21 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 	};
 
 	sound {
-		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		compatible = "ayaneo,pocket-s2-sndcard";
 		model = "SM8650-APS2";
 		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA_SPK2 OUT",

-- 
2.34.1

