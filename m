Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AAA32860B
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433445; cv=none; b=ZK9XFChDi9eNJ9Cow2WOKNkKSIuRqBCDH4R7C6xs0CmRLVhpUwp9CO05HIGGVTm2yk0nVTTH4BKOo1mSFBWoRxFCHFx/lIV4PdU5UT7YjW6c1xsXTrBVkSv1E2EpeMye3x0PbYNjatc/z/7RGgC5Nh12uiYrfDuGR9QWuMT0cZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433445; c=relaxed/simple;
	bh=xIwj2Le0TpWbMARAcv8JqZtSzDIeB/XmE+9Gn/+ByA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqnz6NZ12dUx2rJlYsSrP7MioGIB2SjUMD7RkgmRw+qgQX6CluGWteM4qjqi5OldC0D7a9Eo3d3yweRGl1VR0c8OmdjUIfNxn8fus2AhDLnkPVPUl/AW1rC/bBQrgI/DAnh8C47LA8gJdzdUYpRwif8r7YgF2NiUb5A6gaKTKLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwEVT4nm; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwEVT4nm"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c04bf4711so273291cf.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433442; x=1786038242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xuBnm7QqIPf+z6oBGCxObqPUzyYY2G0Zr/94wsQKS4=;
        b=cwEVT4nmUyAB27wodEVJVR+VsUaStiSAP2ys3Smfts8bETYus/qfmXA0eac5FC0HJj
         LpZSkrB2eNfOAT+KwpUyH4A0vMUuyMmZyuS9HSdobV/GEj4dpINONxHd8KTgM5AnXYs5
         DU/cvTtbo6HNSih//Iva1mLBTJf0slHS5XtqxXhimOwLDZBX4l4VNDDoE/2GMfWxnuI+
         Zn0dHgBuSxIn4t95/FyqPKCIMLiRy/3SI9nRlF8lk4UAG4U7hHoWuVC6N5v/0Cr1h3BD
         uvXh/NpBtNSwEEjPgjIqnFWgt8fFXgap/7r2JoVDVlBSNfXudw8yBBtEG9uv3SsWW5/X
         2xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433442; x=1786038242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xuBnm7QqIPf+z6oBGCxObqPUzyYY2G0Zr/94wsQKS4=;
        b=LHjWbDeAJepumwS9gSn1l3vxbN7kL0j0cKFChFryvAr2YfSfmc+98xXwoNUHGyw0p9
         wzimvtsojbwxWm0/LqVBQwHC7SkPk+TOjHGovxAZvjSZ/O2TMmiKF9Ep9JeCuLa9Bqfd
         GFHIin0YMZPG9RSFToy5zheDm6hTTKoYtnWhRxLrvbnfVOclnOeKZ2wxRLfyWm8Ag9kG
         91YOD1HNLUnX3RlFP8hZmTctwbX0VBYpcNJbxvk2lrhdv0tr+YWQDStoSMwjgJiVHw1F
         y6W6NSyXWeSC7noeUlMGGCYH0SXRYTpOqpCby6bwQf7mM6RqUNfwzrLz9MPkz2rARf+h
         8+Iw==
X-Forwarded-Encrypted: i=1; AHgh+RqsbzhdPps55QgOP+6qfIH4CL9YWVwhQwFZ4hGG3OtYCB6Npiu55JVUe5PgaQF8su1sBQ0eVn0VV+dJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyqI2epf0aArf/Eb6UDTf2+CETYUaZStS+wNb6Mg0VKLd92HEoM
	z7p58fK5elrJyxcMVAtcrrAoZw6ZkiMHX5hh9vt1DtSSb5e9Blpp6aWr
X-Gm-Gg: AR+sD13dn7E2vfvS0j4BSv1JfXJjEYeipyurNEKEEuj6Na4vOCMfrHuL+LsMKrasqdm
	9Q37h4nEqzqQwV0zaXd+B+5SdIJuadVBzL0PqPuczhVQHxsGss3ZTTRo82w6ekv4vmBQ1+33dNy
	bLd5oJ/Czl8o+tXhdkf7q3E3IpL9Ieh3AZN8dRgugEDs2bxmCSIplfrmplCApRRVliBhP+mXgtV
	HGB1WNC5L0T6Kfyv8DIG8lI9tzP7rj+zCASATBOPz49tWpmhHGN/vemePuruPLE6y6izPceZMaq
	iowQu70km64lMFgwhWApCBph+kXfIQwCp1EFYN3z5cdKiCY38j1MlH0DhsyAr1jekmX5Nvj2iDp
	MnaDQHjm32h7uPIkfWiFTKw2ojQL+QD7y/zOI1BY9AOkc04oWXeTobddz51HLeU4CEiGVRPXfIm
	cg0PMya6WuRJ9q6esEwr7w6dT+GURau3zM4A9IV0uD7jwl7O4Sl7Qb2u13oII=
X-Received: by 2002:a05:622a:248f:b0:51c:1590:8e13 with SMTP id d75a77b69052e-52b38387effmr41392961cf.4.1785433442087;
        Thu, 30 Jul 2026 10:44:02 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2d8251asm45437341cf.19.2026.07.30.10.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:01 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Thu, 30 Jul 2026 13:43:39 -0400
Message-ID: <20260730174353.108023-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.55.0

