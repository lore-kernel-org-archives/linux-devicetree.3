Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1C4D17A9
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742417; cv=none; b=fZyQjGNTBr2x3OTGj8PnkV/YZqltJedtMOgbw3HH2p2VcxZJS0ZqiNUrIo7L5+s5cA3NmbJty+prgpWnG4bVe9O/WezkIl8wxIVpOt81Ac1lBZP8xK8/0hlGRLBIre+dVNzJnYmCPlPUdGmCdoqCB/6fs2L5TW+vH8DKs8cg8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742417; c=relaxed/simple;
	bh=3l/OQDwilslojwbD5BIFc247psV75whhicTp80W21k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g7wqRoFZ6LzVuQkZbSK2/+71N3ZkP4hnx0WXbEFaZhKDexlZgotE+38A7Fp13f9ACXmUJvYE9taKppXwWeihZPxx+S0qGkkKG0Mh1IYXodpEcQB8E/WW51tlH5d73cFWbBqT/AjRCJE/3bW5mxR8mxts5OnNIe9B1nczuCJtsy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mGXQW/ha; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mGXQW/ha"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so51092166b.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742411; x=1790347211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NswcxVnJHltqSQeVprb1zCpwdatT8Ku5jmJgLkP1CTk=;
        b=mGXQW/haFJ8L4Zxx9ZyDk6vrHPZhwTsoIA0B2l0CzcNBY6ScYlmRbCnlDtVozEzeeC
         k/k75CQtpmf7vNXe4o9c1lQQv8I/AJVgjBlO0nIj1XDYyQi8B3x+PjSLyk5PR0YLwll/
         kUimCcT4lv533FFcA/27s980FF7rlpuA1LsiXUJW67M8HIzRtMQJxRtpkreJS98kcp8Z
         zpjqecHuaQqnm8l/kgYZLCbD6B5YKdCkbl2RSHs+DklzBr26AAS7Bcd4TH6Xf2kU7M6d
         UEm8enq4WJPkMXimahu0/8ykjTGenQU8swr47JL+WvImHvEKhQ5pv5JjI2XSsZSk8Fsm
         PXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742411; x=1790347211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NswcxVnJHltqSQeVprb1zCpwdatT8Ku5jmJgLkP1CTk=;
        b=U30AxBrDezzkor17lo7GZTqRlF5e2txUSlCkiLr4zZ1QaH3S59Vk6JSu/CsvXtzpAU
         C060uBhg9ocYY75koOuQ6cn8OdvAUqCHa1w0t9Bj7EuWCieaZkiE6w7q1cEOes9ZhkNs
         33mmwH/rc6s2lo23nSuz73de2isP6XSD+UPIqXFEY9TEvCwjb87eiNbesOfK83AeHYca
         /uaVv0iF4luH1P+tu0V+FnTMwuTWOVyBwcyOe+6dktpmflVouQSrQtlQDi7lmbwAZzIm
         fFKYYK0P2kfxhdgms4LIu/RrSSZv8+6qKtXQLgyhdzEB8TeliXXlp3KJCYVLNGe32VG0
         vHbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8cerZDpBxi94wOzLR4LN0FyM2SBPMCW/xBb7QC/fvHJm076aDQT0ByEP/aHdXPj3FbaZDVYl54l9t@vger.kernel.org
X-Gm-Message-State: AFuF++nONC7mkGWOOSnL1MD1cCAKV5Nnw7vHAW5cEY+aM21nBktE1JwK
	bK0pGPfrVq1vT6g4Yq0LTuxM1tAobmQcdGleulcmNUpZT2Dj7B0Q80M3v6Bub4pM1Hk=
X-Gm-Gg: AYBFou0+HRVbcalo2Vcg97fDNxbxxszbnFEkVSFvpwlj0OD6XfLTwVgi0uIYlTQx58Z
	gb5cQCgaICc4nPr0jSv85XkeBefhOwnmuw/GmQWCQTBWuqWGDYswxwy8ORSEv9zBSV+F5T/NGnp
	Zi5+LI7VhwQ2ccFTSgScvylcW2f8e1RZVg9amFk0MJ3RtuAifTBOjBqLUuqV9LowgtRBCCsfPXT
	ASc1S4CPq3U9lCGjLseAT/2juAITx/tD2uo3VwYuxxUbDWGQ6OIDco4PPPL4THsjFq52BXwTxHU
	U13QgLcJ3RsP70Yg9vsyk1OkVPB6lI5NJbNTB/uQINElYFwGcua3cBGomS2bhoJNhxAWtKWL8ur
	sWTpPygw0ephUsypJulJp/T2EpvQOGLwnyhRvfdBebGQ5Nlc01AP0ogNgAxV2GhaarZtulh3Unn
	pV+Ojg/7NDVsYV5YPAqzpLYZvSRvLga6d70iZZm4G4zy8djI2rCyNu30IgUqL3Ky8pT3zjB0QFD
	HkZLMcGUJlnl/PImARFfOY8RiRvMXk5dw4wPpUNjQHp7ZRIFN7RSmJcBWgpDPw=
X-Received: by 2002:a17:907:940e:b0:c25:f7db:4bee with SMTP id a640c23a62f3a-c2a16599060mr289750966b.20.1789742411235;
        Fri, 18 Sep 2026 07:40:11 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a369esm64244966b.9.2026.09.18.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:40:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 16:40:06 +0200
Subject: [PATCH v2 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-fp6-panel-v2-3-6695c4008920@fairphone.com>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
In-Reply-To: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789742407; l=791;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3l/OQDwilslojwbD5BIFc247psV75whhicTp80W21k0=;
 b=2eQL9cFuNTxwCukWgu2TjmmlCNjhR6F0B1X3ayynoF3nwFPzUq2NjIk7TXGfPbqRIFTes6+Wk
 HPbCfn9gLI+BWPQNPwdbR2gfL9qAb8MskNf5dl3aQMt1aV9uYhBn2gb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..1d4afc733c8a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.55.0

