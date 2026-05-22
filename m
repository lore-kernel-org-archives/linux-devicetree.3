Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B34F360EF6
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430030; cv=none; b=MBV3yC7W8KtthDVajGKLaQm/Y2PsOfQ4tHiE+4oczrapPkzNsNq5+26/hHGl746bmpW7KoTPUj27Uj1R7HUopP7N+M1BFkwUaxhQLwq7EqHmHFBkpvmdDeLXmzV7ymAFOW47wp4AEoT8o9b8lKLeFdEd5bOD++NtBN/Rvk2ZCE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430030; c=relaxed/simple;
	bh=iHhwE2eVqf4ok5rAOm0fwHhxHhkcmCh7ggTtcpzcbv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VsVjyJoECG95hif4zrL1924NWzZO66W9zlfAB47f4sgTPJOUPe9Z3IePbOgPkr+zcNYbbdAjcb/azNfrqB0AlpUIQ331Yp/ZW0I5S6TK4qoGPsg+TAYjnA9oJOSeDCbwGO/A2bWnU6f+SQfvoMZxrZiq9Ja59yQ9f6n+97mVD08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5iMVgax; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5iMVgax"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so3840403a91.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 23:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430028; x=1780034828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Lq3gUXb9qkQGbBL6A3En/oIKNPxjfDzFOS4CLMToOE=;
        b=a5iMVgaxG+378ioLHEgw1Wl33gUydJQvdRFbwoZhZicwD3Wrro15tLsm/iL6yZ8tQS
         lUVKXFl64aimhv7PyA3+zLgdkndUUndpxe7VQ1cE+ZlQMt/u1BySUIsfPfBo34L3Ittn
         XRVxo88fEISiVXuRWr7F8rhrpYnlllyh4PXH8N6nAX0Lh5nj0+Ih30g84NIH8FNXx8gR
         aCTb3AHNSeWfRG3Ho0Ll8RAW/mCrAuStzYUij4MQKWdbL7NPIxj7jAMQQ5zKYKVQ0sdn
         VXb+Sh/HSGfhfRE5sFcHT8/Emf9yqojLb/MADIyvGvqYhCNiYnqnVibVjVaDfzsGlY+M
         XzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430028; x=1780034828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Lq3gUXb9qkQGbBL6A3En/oIKNPxjfDzFOS4CLMToOE=;
        b=Ck8A/bpPuKRwC7yPGNLWYZyqnceoVGn32HXUuwdUFazGDeAOHDED0X/FoHQ5bB0rf/
         Ed1RnVcPSGHUtrxZwSE0so7nbBVWxAgEWeazQFFqaBzw7N8FJWFKMdiq5MoN/+UTkCBR
         /vyxXWBCDuVe+e1Zc81EoNmnAAPYE0H3T3fZmZgm1AtXtVAoJssFRAiPOvz/I/hEMeEp
         M4wTtLwORpZO57XZxRmiYVjUQHllDe9qRrJAP1djYD59cFoGkmWO/GrANRVwbd1BqnVh
         Th6mlzAHhoq1Nbqc1wU0DZmB8ylN3J0R9XJjITW1viBbidTzIrLYIc1kL/lXnmEskNju
         luIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mErYNyalMaSoXlvZzGXIm/AcsEsk5VZQKGd6wJMMpW7+dgZbC+T7G1B5tpmaMBVH5iowi9RrfPKBo@vger.kernel.org
X-Gm-Message-State: AOJu0YzAVXNGamNkf7gBTtYFCztMn477DHCDNPeuzJ3yPkEcmQVr1yHe
	y0qcOv55DeYusqyPbZKTLHvnY7TCd1EaAsDZAEigDD0XovJGH5p/XdvE
X-Gm-Gg: Acq92OGxaSKBjLA5xrzy21aJBppNoA2HRBDbQ5xpHlv8+KGoD4j4IlXm5uJCdPBbfb4
	vauNggZ52fKwiAY6npJhJ0yGErn++anrbHDSty9JIQG97Oyx/p+tEBzK9JJbf2rhuJ7r7MMYz0w
	tGQQm7NBtUggxYu/L8VOGjFpjQOKoVq9MyAb9vpeHzGTI8PREWkqVZKbMCKeYASGKxy6fHN1DiF
	RBIX+60dok/xQDI6ZggNazMWgGTNAc29Fb7Luy5UvcDPaFYRkG6fq+u3UdLFA6IJEbS/GMWEoAt
	fFlMFbtVU/ibYqS6QLGSJ06xd826q+B/e3khywyCtGJoPJluntPVsK5pf+TCWh6IkOVH2Ya+Tk3
	Fk/h4KUjpz5VUPve3Dcbzu/l/E33p2rFZCYyTdjwjjEpUcWYOXgTWG43ZArxmQomhfIgEq1riPm
	KGONKdgPDgX/9ASEOJn9QLVtlmH/nv3huNAUDA4sL0CVz4HDYTMAMKpzeAhM2tNOBaKQ==
X-Received: by 2002:a17:90b:5823:b0:366:aba:4c86 with SMTP id 98e67ed59e1d1-36a676931aamr2338804a91.27.1779430027543;
        Thu, 21 May 2026 23:07:07 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:06 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 0/6] arm64: qcom: Enable additional hardware on Radxa Dragon Q6A
Date: Fri, 22 May 2026 18:06:39 +1200
Message-ID: <20260522060645.4399-1-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Radxa Dragon Q6A is a compact single-board computer based on the
Qualcomm QCS6490 SoC (sc7280 family). A basic DTS for this board
already exists in mainline. This series enables the remaining hardware
and fixes platform-specific issues required for correct operation when
booting via UEFI firmware.

Patches 1-3 fix platform issues affecting QCS6490 boards booting via
UEFI firmware:

- The RSC hardware solver is left active by the UEFI firmware, causing
  a security violation if the kernel attempts to reinitialize it.
- EFI variable access requires the board compatible string in the SCM
  allowlist.
- The RA620 DP-to-HDMI bridge does not complete link training at
  voltage swing level 3. Capping at level 2 matches the vendor kernel
  behaviour and allows HDMI output to work correctly.

Patches 4-6 add DTS nodes enabling:

- GPU (Adreno 643) with clock controller and GMU
- DisplayPort output via RA620 passive DP-to-HDMI bridge
- USB3 SuperSpeed via the QMP combo PHY shared with DisplayPort

The following has been confirmed working on this board with mainline
drivers:
- KDE Plasma 6.6.5 desktop on Wayland with GPU acceleration
- HDMI display output via RA620 passive DP-to-HDMI bridge
- USB3 SuperSpeed (5Gbps confirmed via lsusb)
- OpenGL 4.6 and Vulkan 1.3 via Mesa Freedreno/Turnip
- Hardware video decode/encode via Venus (H.264, HEVC, VP9, MPEG-2)
- Audio via WCD938x codec (headphone output, microphone, HDMI audio)
- FastRPC interface to Hexagon DSP available (/dev/fastrpc-cdsp)
  though inference workloads have not been tested

With the out-of-tree AIC8800 driver for the onboard Quectel FCU760K
WiFi/BT module, all remaining hardware on the board is functional
under mainline Linux.

Tested on Radxa Dragon Q6A (QCS6490) with mainline Linux 7.0.9.



Graham O'Connor (6):
  soc: qcom: rpmh-rsc: Skip TCS init when RSC is managed by firmware
  firmware: qcom: scm: Allow EFI variable access on Radxa Dragon Q6A
  drm/msm/dp: Limit voltage swing level to 2 for RA620 bridge
  arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Add regulator supplies and
    disable EUD
  arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable GPU and display
    pipeline
  arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable USB3 SuperSpeed

 .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 176 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 drivers/gpu/drm/msm/dp/dp_link.h              |   2 +-
 drivers/soc/qcom/rpmh-rsc.c                   |  14 ++
 4 files changed, 192 insertions(+), 1 deletion(-)

-- 
2.53.0

