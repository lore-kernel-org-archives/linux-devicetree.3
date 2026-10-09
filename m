Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBCA4CB8B9
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545119; cv=none; b=TXU04EbjI/W0QxTjGqVCsulwy6BRvH1ADrnOS+0Czz4HSRJabHNF/MsIxBTdT/iAY2ZmR4lz2kk58BX0LZSP6/wZLX4tDlEPguVutfJzpCiuvqxhVqPnLp7zd2WW9c9CTrMFzQ0/trI4DZ0KRw76B3s3U4x8lQZY2nbWWT/UXaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545119; c=relaxed/simple;
	bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKnfgaviGhS4zA/xJHuS7z2rIHPWHO9MfVMREzRYXyBZA4x+Ao/xxrQCXd2KcX4lZCPOHxKWeLG3ZeYyQwp8gCJn+v8Uv5Es6l64kA+XBKzaWlbTZX8Qz5ws08UEyWPhqt1lYcp25jDZTeBLanJkWVN2s/2lwTqp3af63H/l3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uQDmbYME; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uQDmbYME"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1701294d0so1505043a12.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545109; x=1792149909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=uQDmbYMEU7KJd5um3qYuideomb4P60KzbzDnJfX4B594Co19Jj9F5nsokp9I5JoRHC
         MDKHBHRtKS9801fG+wEC6jZAVRUL4J6PyJEocYRgel76iCtY1Htp4d4yREGsj1KIv5sH
         rs6E5Ke1f0Xefw7x0Y1traXYA5uCVkyPQVMUTQlWZ7H/BkFBpeK3kjL4FRQGzmFMjPQn
         LmQs09cx7Uoeph5nZhTLPgCCxzgZ+ji30+1a55KcWKJRR3qVXWinku7JfySUzsykl+na
         8Jqmtx+r1zacazmfTtfBnzJ/SeYL+6JtIYpGtFxkFOHMv1onDHAKp7D+yK2NLB9ExHhI
         pt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545109; x=1792149909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=wjbiaTVpWgWDEn6gf/Ya5jrfrAOO+iy82kwyCfaOSeRCgjmNel9Y2BA+UmJbJmewt9
         eXRTup2kKmnnzmd12YEaOAtmoHQMmEeDX1BKh/+UObJ+G9bwgvBcNsaN2g1brioq6bMW
         9G4ugoC0Ws5SNyyCed1nvLBQJS1Odi3h4ENADCbq2j5okNAjohZBlk5aMe0WIbGeaB4c
         J4H2W43//D0cfQDGbkeC6dt8MOEMM5tFrknf7LEfV+vJphZehDP41brtrcR6P1RJfiPC
         9jFp7b450jEepnOPjlToTjrFCR14J1vZTGsGhZdG6NEbqZESB0+p3gKeLN6qjcWWhIcB
         Brkg==
X-Forwarded-Encrypted: i=1; AKwUvBxaHdw/23hva0Al7PiLgT5+FzAwuD9l3dfqjDCWTHNZneFxPl3p0buaiIknE9/VOUde+YtManQxMF+/@vger.kernel.org
X-Gm-Message-State: AFq9FYLdHfQ2wIqB/Ha2WhGeprdXHcRh6z/dpRYqlXEWumMaMPasMRjX
	rKnPnB/kUewHrHG0SS54w+sKNASxkI7UQ6syJ3wB9NOha6VanLthXXPo1hvUJ+rske0=
X-Gm-Gg: AYBFou0iRYL6NsVeAsIodCzgJGzIKraUqtkk5AA7uGSCvYdZQENeOOToCJhs8pAw9JB
	5Zsgv9pJD6VuVLQUJOK5kDjmTPzsv21/ekv8pVN2NmtT14d9XtfJcog5RGPEfyb5k7mOyW+BcHO
	w7zGsI+07kjO0uJZGY4b2dqxvTybfcyPGd46rhgInHF3XHJuWJtvNELeua99mH4LpmE8tgZV33z
	BSKmP3uSeQmayGiyUmdNdTNGovQF16wR8RAr6xtXbshAHbwXXpAN3tIXBq01iDGTO93AurSxVgK
	JlpptukATfysVDEgBZibZfjwKFM2m7jytdb9mmsniiuPwyQ0DtZ8EZ5ycJGkoONLmk7lCd8ifTJ
	MsPXk/ljhNqaKTbU39B4pYtF521pClunYCZnFflVrORepgj6Mw93nuqHlautIHnBs0MNsmkz7+g
	/tDbbFoDeU6qP5rkH0LVcdRdVGh7NyXNjgFhEm2rnc/A4/G+Q819n7yEKZ5mQfkmhBaRnZD/mAA
	pU4kEqJrXZ+Sd02oVwiT72LBQ4cpEOxTFYhuL5jtVEa21aNLdvz
X-Received: by 2002:a05:6402:274c:b0:6aa:e3f3:c9df with SMTP id 4fb4d7f45d1cf-6b17c252c9amr1447419a12.20.1791545108898;
        Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Oct 2026 13:25:02 +0200
Subject: [PATCH v4 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fp6-panel-v4-3-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=791;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
 b=zcZTLYpESs6HkFuhiJJO4ex7iS3OKoMwbYeYOixjFkTwhHKF6/mXLg00Wm2n2nZuJbFx10Srw
 hzYG+p/eC5fClyEBuI4SYS1ZuYA1CMxxotWYaEVsc48KMcsuoKB/Vpe
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
2.56.0

