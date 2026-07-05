Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B5129D265
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247612; cv=none; b=i7STXWnE4ic8lPVzvmhzmZGXdO6JXDoQcInT5SCvc1m88n2odVyqWg5SjU41bLqdysgruX/v+AiY07vW1/iS41YjuzAB32B7lLbRHxudjwaw+vreDjmA5cs/Fn0H55urEXm9b5Uy50c7NCLxgUpP/NlbQdJVz168SFsYkgrybtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247612; c=relaxed/simple;
	bh=bu1fS0oX7dHNs+wurhgW//kmjpqn8TGeWtYQtwdTXd8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l5mEPeJ6yCm57Pck5v2pF13M71DnILfPwdlprjdzTgsW9OH5UxO2vdKuJHNb0USSRyeKIJsdOyinZy/v1i7LA37+Y9OClDBe5tYsn/D604jrHfCAie5LhQPbVNgdEWo6BqZ2efyN5J5GI+hSFwLVjjfg3t2Zm+vWptdi8hBDir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mggj5VuF; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mggj5VuF"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81086f7abaaso23643937b3.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247609; x=1783852409; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFlSarO5yq3CKZw8naaHIK2dGzGG8Hq12CE1DthI3y0=;
        b=Mggj5VuFYhwKGIBDA2o6cIoHVsrHCKu0pTpJWGwrKfYJqazzxiSyOkx1IRduNIsYO2
         Nyu+nNjvU2COfPzYTHW7Epk1eOxO9yEKtYFIIEnAdv3401w47PHTFMaGm0EnL9dK7sFr
         o5PL71DGONA5o85lJkzxFGGnLQeCW/nN2RV9e/4CRoJsc+yBYG6GOx1dn1KXJwpQ4Bn6
         3Hx9XSPIo3D9qGbEJW0ms/zo0pLqYKNU5wo7JxTuGhbJiIW2RDYQIYusdZi7i3Z7+lXy
         Y/AzVgmipxOOG1SRgvCtikXbx3KFgmZSWggHQm6/5eq0eOIfZ0D1WiPqb0ydm+GQURkL
         aW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247609; x=1783852409;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFlSarO5yq3CKZw8naaHIK2dGzGG8Hq12CE1DthI3y0=;
        b=kuGPHqm1t+37YgLyZ+mWvvBLnpPzdtxDUY+KFAtEabepJ0FMbk7jJRPUrIpByYWapL
         RhSa/Xrrr9+KR2EKt7SoQaAE5Vl2gNVKiWKMUfILaeBxddSv15Gr2Vtvi35iJin8Ugnj
         X/P7jT6GNAQZyOhyvNCy6wDnMEhRRjdyYU2vmYI+78NWW8yz3zh203na1maFTQtkPO2e
         Gzn5uHDGxmq/OLPKk3YbuaiTRjHTT0YgCUtUPFkkNMEJR2rWk2e6AGqNdIOwvzCwMeUj
         FKfeocHwSc0sfM3OUgo9jJOdQh1pjgp+QdUa8kOWiul+7AaSXOhOwiksuLHy7EpKPkuv
         vhQA==
X-Forwarded-Encrypted: i=1; AHgh+RpTj4Hc1vZfObw4DEgJ/kdldUTc03AbSkQeVUo/nxsr+cKfC5Y9L+0FDALMrrrgHBgk8WefJD19bfQ+@vger.kernel.org
X-Gm-Message-State: AOJu0YzXvpGTdIt0ikUM2YKVPUTxE9OjXdgLBSfE4Rj/i4WoggmIXGkM
	Qb1ErUGtsyBtOVXuduDu2gQB/CR2VgNq80goFe3CrXIb+4JefGRktKuQ
X-Gm-Gg: AfdE7ckaeW21CdIHWelmHCCqfzEJhQhkCpB3+iGgWaDPv+T2QfQ4WewTxq0lPxXyo5w
	zoc1J07G5jrRuGNTqARoa+EloZ7Zy2nQ2p2z3JAxdT06BhP5KgBgToNirsqF6WT+2okqlWTSzxb
	ckNlkaBmu03FHgxn8zEaPo+PyAiV1fOl7zQpf1SzcH0dpoLKWB32IDX+B8AwpqwgBUsyUa48uOJ
	ProIxdrL4xOangoqqrSphTIm7IR/2EtHJkn1aaiZ7WQy8xyb+jr05sjJQurGCfvoR6A9BHu8RxC
	jX0NAa7wGaugiDgDII5LUJDwaUS5LuFapdusYVTRaBvbffMI/VPIu7cy8RCKNbqr1f/hdTvZH8D
	pa4FMvfJog8rWLH2Unp2MITC07Hrl5GuineP/wZhIamFw4Vx2mBm3RoKtB7WGvaGQYtoo1P03/K
	bQ4agur3eUgDOAKCECUQ==
X-Received: by 2002:a05:690c:d1c:b0:80c:cad:c4f7 with SMTP id 00721157ae682-81738efff00mr68964467b3.47.1783247609000;
        Sun, 05 Jul 2026 03:33:29 -0700 (PDT)
Received: from crusty-box.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144ba2665dsm44421007b3.41.2026.07.05.03.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:33:27 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree for SM7125 Samsung platform
Date: Sun, 05 Jul 2026 13:30:26 +0300
Message-Id: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Nyw6CMBBFf4XM2pq2UIqs/A/DAsoAYyyYDhAN4
 d/lsXN5knPPXYAxEDLk0QIBZ2Ia+g30JQLXlX2LguqNQUudylRbwd4qbQSXnqe+FVWamTqrbq5
 OJGyjd8CGPkfwUZzMU/VEN+6V3eiIxyF8j8dZ7d4ZtzL+j89KSBGjaazRMsmcure+pNfVDR6Kd
 V1/OkDjiL4AAAA=
X-Change-ID: 20260627-sm7125-samsung-b685d8b9cd40
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52/A72 are smartphones released in 2021 on SM7125
(atoll) platform. This patch series introduces support for SM7125
Samsung devices with the following components enabled:
- Framebuffer
- GPIO keys
- Hall sensor
- Vibrator
- Regulators
- Reset input
- Real-time clock
- SD card
- UFS
- USB
Along with that, SM7125 was affected by a hang when launching SHM
bridge. A similar issue was reported on a similar chipset:
https://lore.kernel.org/all/20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru/
Add SM7125 to the qcom_tzmem_blacklist to avoid hangs when booting.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v2:
- Renamed regulator nodes to satisfy dtbs_check.
- Renamed pin configurations for SD card to satisfy dtbs_check.
- Moved rmtfs_mem to the common dtsi, shifted addresses 0x1000 to the
  left and added "qcom,use-guard-pages".
- Converted decimal 0 to hex 0x0 where applicable.
- Pinctrl names are now listed after pinctrl themselves.
- Renamed vol-up to button-vol-up to satisfy dtbs_check.
- Framebuffer uses cont_splash_mem instead of retyping reg.
- Removed pinctrl-names from vibrator.
- Added a blank line at the top to the comment for &pm6150_pon
- Added a comment explaining what the reserved gpio ranges are.
- Added a blank line before "status = "okay"" where applicable.
- Link to v1: https://patch.msgid.link/20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
      arm64: dts: qcom: sm7125-samsung: add initial device tree

Vitalii Skorkin (1):
      firmware: qcom: tzmem: disable SHM bridge for SM7125 platform

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 536 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.c                 |   1 +
 6 files changed, 581 insertions(+)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260627-sm7125-samsung-b685d8b9cd40

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

