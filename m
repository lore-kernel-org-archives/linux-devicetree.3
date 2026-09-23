Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF50853B352
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174957; cv=none; b=kanxvkFs1B6pcHWxs7HIXFqrMRuRo0CPNi2QbiFCr9bT2ygsKK1gRXtN9xguCH4zDzgs0vf/pu98UlTfpJUv+Infmfz9C7aNl5z6aeBPs3cDdJfBhVE7wz94mHApMBCLyHa1psejeePdsJTEWogz87LY1kVbV/AhMgsX+BJh9zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174957; c=relaxed/simple;
	bh=TzXxpYbafFuLEWOlOPwWeQ6+nw6AQz1JvlONI9AydL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCcLXrYbZPqpnm77L8rwMNAm52MFTOdJrhQSdEdUls6XeKUe3U1MtHe+U+IfWVlqavIQDD6cxE9nz7Ll9kX0woXMhZr9BsWrBrN7/lbLMn9Sc3rstXZR7G94s9RtCiNyahLDk+qbokabt9m1Ko5JtxW5wApqPWnkFKopyx07z9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=s4BSppQk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="s4BSppQk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so5804145e9.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790174952; x=1790779752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUIUCzm7xQrDtXiiFYGfOI6sfBFwp+dm2lFFx+iPEL4=;
        b=s4BSppQkNHmbefMHkqt2n7mfyMijmCHL72y37DHNxK+XhrvumDkAp4Hb0s9ICqXpLl
         inK0JLju8DH96XOyX91YnoGi2JOxzqYbeStRqlb+Izsf4ry1voccWrQe4rmlm6IeR3tp
         uZhf65EKC6PfMERoKyCc2WO16b3HGlLCy4is4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174952; x=1790779752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUIUCzm7xQrDtXiiFYGfOI6sfBFwp+dm2lFFx+iPEL4=;
        b=nTOsWReftxmUGKKUB6MJwFu9AgfeGjjTAcWbliKeGG2cl3/8q8LqcaGXcsFSFBoI67
         1KsxVYXcQAi52eliLRlc++JG1ZAHUhDcoXIrYMGSdsoO6gskmUxUPNXbYbMEOetwvibV
         tWM2Bu64Q1bQx0zgsu9PiaeZDRnE/rcLzk8gwi6a64FARb6YhSTNInwoGrOKGhHHANA5
         TYDk+MBNL7F0Yjmnmbx1Igk/BpKkZObGEbmdBEpFqHx0aJA1vvihJsIpjqtD6P13TiZD
         cuXiE0BVb2TLUIaREu3yWSim2S21fdA8eQAp3N91LJAiFsYxyCL7ayI4JRnRHRflPe7X
         n8wQ==
X-Gm-Message-State: AFuF++nlSfCF7Nzi8CIog9b0DvB5VifaZkFISPTNGTsyfW8bXeM+YYpO
	Fb1eXWYWq55tkh6Q86KdAi5yJVksz7S7g081acEXa/0POCdU8Yl+kfnUG+zLin48MjA=
X-Gm-Gg: AYBFou1Gzv6E5WZD73Y4ympvecAq/BVsNYxaPHxWM1LIxYtgwnQtaWU9TQmOhMiu9XY
	c4slYqLLFD1I/95OpR2WocshBj9trVoQmRnLjTdsW+RZMwnN3QyqdPwOcFPn2q5F/mXVi+K04vu
	f6uwuUpwAj0zpd9cIJa2KNTe9Y+NSeVtShZUfyHcFixrfWErfBplEbm2K4xMdwpAZ/fzgTzBd8z
	rpZwcaqPZpyjE29bX9OHfL27uJfx5bZ10YY6dyCwRM7IlJbKm/T2Nbi/8Y5RFaRPfLmoVgBsF1o
	eI5oVkYkqnkrLgTrqmPw2wfSboNZYflTfjObr9ziNgk9Mw1IdDLlacalklvaoSS1ukzMn2YecQ6
	sr3E8k1TLLTuiN2q0AcJQiDIj9hqXJ2wK7BKS2hS2ASizGeLQ5dzqALBlr/Il019yJvo+8DQNna
	hnz9+TJ7tTnHIPsUFDW+XPOJjC3obuK+3JduUPtqARB2cOIPeyXl7f2LMcc07ifj5FJ7AmDXILW
	bNGLGvZa13czx4=
X-Received: by 2002:a05:600c:6994:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49fdece13dfmr43378995e9.12.1790174952299;
        Wed, 23 Sep 2026 07:49:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm82614915e9.14.2026.09.23.07.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:49:11 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 23 Sep 2026 17:49:03 +0300
Message-ID: <20260923144905.3365851-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923144905.3365851-1-petko.manolov@konsulko.com>
References: <20260923144905.3365851-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

