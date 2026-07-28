Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA8640D58B
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228414; cv=none; b=Hx2yg4AKABtviT/GONgLWyblfs0tEyGzMEZ7CHhokNHC+6CSkVo/a8HmE3QiR8fnAT8FMQShDHfG1Zh4R3iiI09HS2Iuuq/1LP5IjEd9SENvC7Qcn+apEtgtQ3xIT12AXMWKB+AOi0MfEzJ07JUMKgHFBjXRMiRuZ4JSeANg6DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228414; c=relaxed/simple;
	bh=sHs5xySGuDN2Xqec2Tl41jmiL1sPHuObMTPhDLc0Mrs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dkcyJZbkvj0gcjZvtYoS7x6u4Jmqy/iO8zZhKZunTdWhEA33y2cCixVLtN1533uQmkSlqmiPVbRy0xOntMDcN+KDln7Iw0uCkX5RPR1GstB687XsVslzZVvyRu+ZFrj5R8WNvq7jNvIbdU4TWjiGJ7a1wjkf5P77uoDT4cGfaBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qYnW18jU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qYnW18jU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so39767115e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228411; x=1785833211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WbYgWOqEqy1rmlqrA90GT53N9i1YD4wuNMRoa3lJxZw=;
        b=qYnW18jU0cTFxPJEaSLx1ns0iwCDgzVMMwVFywOKO2XRnURmhHdQKWIQJnyUau4EJ5
         jBeeR9vaG2CHxJJ8BR0yVrr884QZjXpG1lluteSxXay4rpA8ZaGrebxTx/VvF85RejQU
         4QwF+5zbX2xEC7NBiBnjMODO8m9E3gSM93WPe/BOk3sdhFGtHM7hQ6fKIjgtghHLe+Vl
         hDp2XbCGmvEtFRkKTU8b8q5/EALXiewc24IszOChsmX2m4NfnAmOO8rz8bzhq2Wu5V7o
         F0POT7mKG0LtSOEqdZEgxh/4BSoKrb+U0tygaAlr5HYTx7Kp9I2CHMJ5/Pis/q+GizL7
         qgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228411; x=1785833211;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WbYgWOqEqy1rmlqrA90GT53N9i1YD4wuNMRoa3lJxZw=;
        b=Nt0cfz+ymyea5L0LcAaBmA2C4VjHSzujReAITls01aNhZuvHJWAieEmKuwUc58bwK8
         38sfmfXPfCiVM4VJ9gdZMBCvmcr/PHRQiYWyedx05oM5e9kLCiN9WhRVhawM5EQshvlA
         RFJtEbsfpAmb9w3VQkCiBsIzzEc4G0Iece+uNctUKejNlA/8gB5s/WFSF973mqFUC79H
         UripEyKJkOtR0hAhcL/dynXxow2AlYQMrG1mRYIdMn1P808qJ+7iKnck0IFerGLbfpaT
         B47mbS2AYaLMni/OGMRBUEhOTr9itYGqddFrXR7qSYjazT1YArU9oJM9/AXLV3SQBeDc
         jt+w==
X-Forwarded-Encrypted: i=1; AHgh+RrWgVqgpUfhJSodWHmt+gf/5VxHxdKJuaSv4wRPePfhvWcJZ1f2u5Bayy81oQIHTo7heF2OoTU0M/tC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhl9WrX2ARdsWS0w/oZK1Gc5jYlxEvlWZuuMQNhXPpaZvVECeb
	z4TJTuPAUysTjBJU/mI3vuWEdQs8Ao8pmHjP16g9RM5yDnx1cE8neKlAf7/gHQZ3PKE=
X-Gm-Gg: AR+sD12dexr4kHqaK3/DzAHVJZlFMbvpez4I/+MO0TfpSIoM+1WYcFbDWinSOUjya1F
	EzpecVPjUHHV0v2OhljPMeFnpPl+0KHmugXNdG7uBAKwbsD7Ym7DdKGEJCX17gEY80XUwABfBxK
	mXbSCfhkZ6bQESkG67XHsRUKJA2ifzJdV9hnoEMKE0WpJ2EriTLbrptzPsFXVwzAI10/c1TNHGO
	kjS7FRy+0wxBXFqHR2hLpVUsZ42RDQRVi/blcPaNFGslW9MQpIZbccx0D1zjwpiCAdUHZjwqZ2r
	rUfk1c2feXl94FrDtFnKbUfwMr4IEJNcWYBkIukf2W0EoLnErGcACJQHZYxGERul4p3X4o5HMVH
	G7sYqSiAjHTfoMCHnqcwM1KFXLTzN6NgTrodaKZtOH8xS0mymDVfSqCyPUs/oqUyySgxRyVNpbs
	BmW5NpUy2mHM6F4cXH8VA5Io8=
X-Received: by 2002:a05:600c:154b:b0:495:4859:8f9b with SMTP id 5b1f17b1804b1-496c6420e39mr15126845e9.9.1785228410812;
        Tue, 28 Jul 2026 01:46:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm64658175e9.15.2026.07.28.01.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:46:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] ASoC: qcom: audioreach: support WSA speakers only
 on WSA2
Date: Tue, 28 Jul 2026 10:46:42 +0200
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJsaGoC/42Qy07DMBBFf6XymkF+xE7cVf8DsbAnk9ZA4mC7g
 arqv+M0SIhdl3d0dc7MXFmmFCiz/e7KEi0hhzjVoJ52DE9uOhKEvmYmuTTccAslzgEhj53RHNz
 FTRRhjvhOBbKEr+wkDOEbyFuuTTsYdJpV2Jyoju+il9ct57N/IywrfW2cQi4xXe6bLGLt/UoFf
 1S6COAgOu+FRY1OysNHmFyKzzEd2Wpd5B+35fJhrly5NHRIvkNL+I97285J9Hmu7yvbjcy7TIB
 xHEPZ70SDvcPWqA6VMi0q6wbJTaMN9XKQvWpJ24aLCrv9AMpURKmTAQAA
X-Change-ID: 20260609-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-eb90567f6ca5
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4204;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sHs5xySGuDN2Xqec2Tl41jmiL1sPHuObMTPhDLc0Mrs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaGx4H2g8Z9PDfxFXfsSyklGITDxAFBTuUTDNA/9e
 Z5lrLO6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhseAAKCRB33NvayMhJ0QgJD/
 4jmw7Cued79rXnGsKLFJ4p5uNPfOqMbOrn/lxIinMiOd07Xs6zRHTNzKvPsjWKgsYAJh19GCBiAiDq
 UtJvwuSaBQ6KkOEHly6Rz1PDaGZ2tL1YPaed7IPwTPBD9KM2MQ+vOPl2PX3HCktwvRITXc6IQjVC0/
 XuI52Ji5d+0nyc5uPmdopTNEZzmreMKCOAyMbkSzl96TaxfDRmoK3o2/PiGvvpvW5XH8ZiharMc8wf
 dw+V8I9jOfuCNIrz/oOMEStN2MDbqGRfPvXfj1VioO1Fbwyx8Ip3kcdyf/CI+3ni4jH0jvU/f16BjI
 oi0KHU6SrULwm6AogHBePdjB4yvC1o7zlyck4XEPlxtMpei7GFV8o2W6eIJzkhlEVaARUgeRxWe5If
 NnGNHUPqjvxj8JMjNIwdW++NjwuEwm/nniy8r/86RbsnT/c3R4evF+kyHvpg648gdaECEZUkNTLXrP
 P6fTK2d9BJsQJSdDBYTuRbOLSw4osEINx6u21nVgzrOPHlD0K0nYyjgQ9WcAb1UJmYp+OZVGQmblWg
 4voyzIpDJZ0NrnHJwtAw3vgfqzaWCQIX3lndknNo2nKTzy4Ln1HP6e2c7sh4+fo5/njPm8rXbGgbZS
 b3mInOz8+VOY7bHNYHGOV5uPCd8ABxV/BHe5kKIY1y65zz5Skz75tv+U8Y8A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
of 2 WSA speakers connected on the WSA2 lines.

But the Audioreach DSP only handles WSA2 in pair with the WSA
interface by using the upper bits of the active_channels_mask
for WSA2 and the lower bits for WSA:

 __________________________________________________
| Bits  |     3    |     2    |   1     |     0   |
---------------------------------------------------
| Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
---------------------------------------------------

Setting only the WSA2 upper bits is perfectly valid and
functional but the current Audioreach code builds the bitmask
from the channels count with:
	active_channels_mask = (1 << num_channels) - 1;

In order to enable the WSA2 bits the channel count should be 4,
but the lower WSA bits are then also enabled and the DSP errors
out when trying to play on the disabled WSA interface.

A solution would've been to add a fake WSA2 topology element which
would be translated into the top bits only, but it's not clean and
add some special exceptions in the generic Audioreach code.

The solution suggested by Srinivas is to use the channel mapping to
set this bitmask.

This works but makes all the other calls using the channel mapping fail
because the DSP requires the channel_mapping table to start from index 0
and using num_channel length in order to apply the mapping on the
active_channels_mask bits in order.

So if you have an active_channels_mask like:
 _______________________
| Bits  | 3 | 2 | 1 | 0 |
-------------------------
| Mask  | 1 | 1 | 0 | 0 |
------------------------

And the channel mapping:
 _________________________________
| Channel |  3 |  2 |   1  |   0  |
-----------------------------------
| Mapping | FR | FL | NULL | NULL |
-----------------------------------

Will need to be converted to:
 ____________________
| Channel |  1 |  0 |
---------------------
| Mapping | FR | FL |
---------------------

And the DSP will map FR on WSA2 Ch2 and FL on WSA2 Ch1 as:
 _________________________________
| Line    |  WSA2 Ch2 | WSA2 Ch1 |
----------------------------------
| Mapping |     FR    |     FL   |
----------------------------------

So we need to skip the empty channel mapping entries in all other
users of the channel_map to build valid channel_mapping tables.

This should not break any other usecases since the default channel
mapping always start from index 0, and will add flexibilty to allow
some special non linear mapping for other interfaces as well.

Finally we add a special prepare callback for the Ayaneo PS2 sound card
which sets the custom channel mapping for the WSA interface to make audio
work properly on the gaming device.

Depends on (applied):
- https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Rebased on broonie/sound.git for-7.3 with the MI2S changes applied
- Dropped DT change to be applied separately
- Link to v2: https://patch.msgid.link/20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org

Changes in v2:
- Collected review tags
- Reordered bindings patch before card and DT changes
- Fixed DT patch commit message
- Link to v1: https://patch.msgid.link/20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org

---
Neil Armstrong (3):
      ASoC: qcom: audioreach: compute active channel maps from channel_map
      ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket S2 sound card
      ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with special WSA channel mapping

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 sound/soc/qcom/qdsp6/audioreach.c                  | 47 ++++++++++++++----
 sound/soc/qcom/sc8280xp.c                          | 57 ++++++++++++++++++++++
 3 files changed, 95 insertions(+), 10 deletions(-)
---
base-commit: 14cdac7638c3367c39af206456ed2f2d37e59401
change-id: 20260609-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-eb90567f6ca5

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

