Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501816;
	b=USreVigJDloPFsN/gyi1S+lGA5r8GRkxQrG0CXQcc5svF/p17xs5TjWw/qaLi359BPP/
	 y4lmiPMknjwzLZUz31wrh8nSdAQuY5o3k4CUC+ixrOyNUx0+eHkFmbiC6iR8N/ZB1AVmJ
	 s26th9uw3mrYDFndCttSFKekspT55vHbGyvUnAx5OlWhIwClM9/9inGcLImNntWidMW8N
	 nkxKX5FtqLNFD3P7elVSgGYy34fm1qv/UenMRkQ0fZYnD2bvVOn2PLfWFof58Egr9aih1
	 EpntQcnGeUdbIj868lmQbSHOWav7x/gqO/qQrxcI6r7SQeMCGFAq9qWd380iOIfZ9LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a3wab0s6dhrFUkyhGEe3zCPYCSlTDeQMk/+nJqV0/iU=;
	b=5JX2vlv5N5onOSFnD+cb+TKciydR7xEzyds9uAMZm3Fjrt4HHqMyGO8NS/tbCk2XSm0Q
	 0rs3mfhZ9wpm3u+HFBh23jWUowO2RazzIRfpRGRQY/Ij5+Xx4s+KDexVgywZGLKZ1ois0
	 Zknkdl1izmqJXSOelc+W5OJvJsh+LUYFDQjbgCFKMPwfJtCHB1Pk0+OqhQxWQJtCuLtSP
	 OAB0rUqHeIym9DKoX0oeE35DVIGprqcyh/7RxJK/H6LvI4V7pG7oQgiTAJKB6bGcSdlhX
	 Rahiz8+xLoBFvHeQ9VTSFHvzrUQWBq4TAvIfnBfxomQ2hhhnvQNmGgtjUrgc+rTtO/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zrc884Vx;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC790606A338
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC790606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zrc884Vx
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so2010794a91.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501815; x=1793106615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3wab0s6dhrFUkyhGEe3zCPYCSlTDeQMk/+nJqV0/iU=;
        b=Zrc884Vx8hE37RySKuKkWJcLSafje3jWzziDhdYKRQInp/ZhGPLhcvVDWzRnKk9tXP
         URiNtnIWux7+2Sjzp1Mn9H6mRwCEHkB/gHbcVyfxRY16AMcb47bCZKn02GS503aorfhz
         aXVjdDL7ik4eAcYVkCkOAu9uckkopsX3EYuTW26fEId+PiygzTj7rgNdP22MNRfMzARE
         Rlf4whewPr6qBuiyW+df3uKY20Q2zbJvT3oxfCeDgP+rIQFEUeGwZSaA7BkWo9e5IUoM
         To1Oni5IsoJkelBPpWuT8+POZ2BtcGJvIQce7zr4hwggTlCyVMq1eK3b8tJdkup3ne1c
         14qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501815; x=1793106615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3wab0s6dhrFUkyhGEe3zCPYCSlTDeQMk/+nJqV0/iU=;
        b=X6BumvA3o7mEIPUtbS+TTiux1YjTrBk98yUMJnRZwFSsbsLxePzLvzhKFBy/ZJnOgG
         Cw0kZudO0UfU06dBn0GD4fuWxRPPyCcTmdhs2r2yBsGAs6rAU7DWJHk5qepjX9/heEEZ
         tMgV9VZS6roqyguDjQ9mmVlQ4kPEd+4uMt6t7FLVhKxCYahucIOQNSDVLVMQBy03ewte
         498n3f8YVUQk+bOVB9pBSfPxnNrwHhTaoaDlu2XUqboDFaL0uAN3JvbSKKbOwOeFAIlT
         9duPkA0G/YgQStlo5fhHrZ3ZejHx9JXqGcoTLaTylNl/9V9WNlHB8Gfa+M2D7sYJMaxQ
         l6Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwWUoVRzaUYqCMjYb2dMHuwYnwwbX5cm8Ugp27tz/JWH0yICV4ENpHKf/BAAEw5s5Crf8MIVKHZ224x@vger.kernel.org
X-Gm-Message-State: AFq9FYKHy2qbGSVCN4BfNj+WfbF2Z+B0WzitOIyBZXf+b9BntKUC2VFf
	NQfTWShroaMVPLeTEnU83LZRoMOsOlTJAXHiIlcrHzYFuP8yDifnTnC7
X-Gm-Gg: AYBFou1htNdmZyELxJcKwDIjMT9uPHROd+hSH/0H5pmMMab3jpsErjGKrhlwgO1niY4
	umo6lo/JpovlmzrlKGgL0Tmlnyl4PCg+bNZvWu0CyaAHDVa/3gqmyu1N8TK/B+u4BhhfwHtePBG
	B5Qw5WxvIcxKJh6rd6PynZcFFuEz27VwkcQlPZiJIpEL1Ex2uHxAdbLDrrFh/p3xaZKisGpXkLt
	ouCMl80rEYYerBjBXVildXbpg/gOVZQ0zaF70yIKz/XUgENvfSrJi8YJuB5lQk1CtEkPp1+8NsJ
	z9tRef4lHUC/LXAe5dUAM7AKItZ9+goUtF8+NYUH5wMi6xpOqaJeIVV5EuaRd67RJa2saYg4N94
	U3Kbd0LAqxaFkNJbThRn/WRXV4mJ/4vbxhplJUo86aztmdsn/zwUuNk1EJdqkNiTTwRfnRIEdRH
	7nk46zkw2vSNIk3kbZeR+a1ef5YAn0l2Le5N4L1o0XX4Vi9ep8nPDKSeL8MjLA1btR+Cl/f75DU
	OXNFTA4UbRergVBQ/gsF6G05zSFTVk11r+fYqxw
X-Received: by 2002:a17:90b:510a:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3acee279708mr10434846a91.6.1792501815386;
        Tue, 20 Oct 2026 06:10:15 -0700 (PDT)
Received: from Linux-PC ([2a09:bac1:1980:20::1d3:a8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm10131496a91.4.2026.10.20.06.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:10:14 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add smartisan
Date: Tue, 20 Oct 2026 21:09:32 +0800
Message-ID: <20261020130934.2289011-2-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020130934.2289011-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261020130934.2289011-1-tianshi12127@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Add a vendor prefix for Smartisan Technology, used by Smartisan
devices such as the R1 (trident).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..6ad8d3499227 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1535,6 +1535,8 @@ patternProperties:
     description: Skyworks Solutions, Inc.
   "^smartfiber,.*":
     description: ShenZhen Smartfiber Technology Co, Ltd.
+  "^smartisan,.*":
+    description: Smartisan Technology Co., Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.56.0

