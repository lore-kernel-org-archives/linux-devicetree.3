Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636EE36A004
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374826; cv=none; b=kQpptBLBcPCEKMgjkaWce6LwShwF++2EEqtQ3/s5x4djOjZmiYxrlVCcNlnjdf6TGokliwo0LlsRwrUENd+/dSuzWYkHqak1JRVtKim+aEc29YKWLGAjuMcS7/53uB/uxrhXkaBSO0kPy3l+U13gCF35yzkRRdjgE2EpadgC2jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374826; c=relaxed/simple;
	bh=mkr0K1mBT5RxN/+YTqKfY48rfoOCEL8C2meJua6xkiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/wOwhvQ2+iCLCzb3vzc/UcgcdcVhYosLtJqLO6pmpSXDJYsR8rorAJbBg2wJyTJn0BY3WQm4tdMV5Zr+jYG22bLp4DhcRqDMYT6K+r/IWqGISu5zCfSy73Bvm/i64y1/Ar4fIbavxJL5kjY0dNO01RAr6Mz5m1bVA+fi4fdi5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IsCNdlw0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IsCNdlw0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so6633421a91.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374824; x=1779979624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2YtFavMCVSChLdyN1Eu3nk01mQaCAGqqLzhDnGc7Wo=;
        b=IsCNdlw0YkwyEwEkCwNGSjCvqKHpESTdJGuWuHA2j9/9cJlnCQU7HGh6Z2jOhasCb7
         yieom6BxuTFZIBC+VLhVU0OhsUkXK0hSs7n4AyfeEHwq4wXrfcaYK+IxP1OUCMIPhbs5
         0MOu2QJPC0Ys1FjTg9Wh1DtgdiFmoZGmFJ4iRlYNR4ERMOBvOdPBri2Hrhf45IXobDDJ
         pahlkwiK5Mvey+ZWBZ46fFzI599CoHMfiixWMW+fSk+L8oIe123j0G8miciDm1Lks41Z
         DO2CT7Zzc/Cnlb/EjfYJz/dY6GgYk68jpXsddF7XpjgnL7SNsaTF7jXFiSHfIhmYWFeI
         KkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374824; x=1779979624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2YtFavMCVSChLdyN1Eu3nk01mQaCAGqqLzhDnGc7Wo=;
        b=NhWv7cIf8r0z/QJOl9xkrR21fWTo73lNZFpqcIaCYD39vREBQLGL76zODgBEusK3q0
         AtHkc+P1SGWC6VK7ODUaWvFtVroHOvbcCmkUdO3bAgxRLTPCKS/6SaNR3NvUyugxsSoW
         0wT88pEO0v7y19fr08YhtV+WlYhdOhs2BdTknaGXvPRNKc1xTapYJ9huOjS3V2+Syp4e
         9GLC36q82J0ZEQW3uTJcu5XZoreCRRBkxybSJxFpyBFXaiWX9CLpP8DA6prw+ueBynWW
         oe9ij2n/wV/T1IFmdH0SuEevtE6Y4YRIGh5ti2ihwdx1nuTWhfjOBMeSizs7HN+gw4wL
         I3Gg==
X-Forwarded-Encrypted: i=1; AFNElJ+3ah6+KAjjW59/ukCHwgbawXpRqFgHoQhra9wVwt5J2xX5GMTnyJ9Hx6YB2CN1quAgOk9psM2keouV@vger.kernel.org
X-Gm-Message-State: AOJu0YwRhPcPzTpxGSb+oJsDMDCq9WUmYK4yW0c0G65sAcRmXPI97ZsI
	JMwu+KcAbaFlOcnywkgBvOv6t1futjU09FzZTkd6234NM7gykP2NlobOq3zrzO0pByk=
X-Gm-Gg: Acq92OH1eN1NOKcJJmPfnqhhiFvLIBYJrFnDdL7wueTZqHKUMgAEzwtnqM7Q4MD5psQ
	w1pl4zPjUOI8rh/x8Hhss71q39QjbMwpIBbxdqA+9VCO/BseN2cWPUTOhPCbbF1xfHlPl06ShDN
	fggbbuChMTeZKnNgDjCMtjQjXS9u+gbrEvIdl9EZJm6/Np7vJn2xH2Sesqhfy/aulmQ/UIPt4hP
	NAM3e8xfirjGYJBap4dWS1rdM5B7f/O1O5GYlDhqhxds8vd9Ld7gBfRF2ronGNp4UPtTLHJk/Bi
	6J56Oe1rDFfpi3yYxPBS7myjlQ+NbksGR1Sgn/UHSYrNXIIh7yrZ7UKSWnXMYZZrtqN8fFf3qeh
	r3X9QTDNa9EilJ3nfUuItt9ieUCPSXI7uUiySQy3umDT0200olt6Nh+0iGkpzxHsx5VonBVemOx
	Dl5PXk
X-Received: by 2002:a17:90b:2e4d:b0:368:b176:c5a8 with SMTP id 98e67ed59e1d1-36a4560d3femr3288287a91.15.1779374823731;
        Thu, 21 May 2026 07:47:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::109e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5bff3ef3sm476527a91.4.2026.05.21.07.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:47:03 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 21 May 2026 22:46:04 +0800
Subject: [PATCH v4 2/5] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-sm8650-7-1-bonded-dsi-v4-2-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779374785; l=1347;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=mkr0K1mBT5RxN/+YTqKfY48rfoOCEL8C2meJua6xkiM=;
 b=5+BFUHgumhowsBls/J2rN2yIsZQXpzOQS6/+y+2Qz3iGix/P7ZytH3k3y+Mg9h5wKQaqlauaP
 LhU3lmKnCkmDIsEMKF+cgBAlPUlB8yMWgxQTqBhhZg4H5n/7FtZgOGS
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Some devices treat two independent physical DSI panels as a single
logical panel from the CRTC's perspective. However, two separate DSI
hosts are still required to drive the panels individually.

Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
allows a panel driver to inform the DSI host that it is part of a
dual-panel setup, enabling the host to coordinate both physical
displays as one.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 2ab651a36115d..889ef1421207a 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -169,6 +169,7 @@ struct mipi_dsi_device_info {
  * @host: DSI host for this peripheral
  * @dev: driver model device node for this peripheral
  * @attached: the DSI device has been successfully attached
+ * @dual_panel: the DSI device is one instance of dual panel
  * @name: DSI peripheral chip type
  * @channel: virtual channel assigned to the peripheral
  * @format: pixel format for video mode
@@ -186,6 +187,7 @@ struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
 	struct device dev;
 	bool attached;
+	bool dual_panel;
 
 	char name[DSI_DEV_NAME_SIZE];
 	unsigned int channel;

-- 
2.43.0

