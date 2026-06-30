Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FAB36BCFB
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833928; cv=none; b=Ei0uRK8xOTSK4GQBKQZGUWGZszywutm5+nwY6dcR+/EYRvp22bEg6NGzKFaNLCVy7iuGCWBg6WddRZr20kFpIjtaHAY9TRqQt1YyOlrw/qFh68VIiYYjD4z1u4hSoO9hlc/Mx3+cXv2ebF+XDH6dju6+dYfwv29MkZhBiBu1rH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833928; c=relaxed/simple;
	bh=XLcGd0G3Be7ekf+4Zuz6cneUN19Ms5dZnu70A/NPKRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXrxYbjwpeBJE9wH9jGnMM2XUqkkdhfBgN+f42jq2q/M47av5C52o3SQbEIhUAyk2mnMartidw3s9IjeFF2NFzF3ZxH8ePdbUOV5PRU3WiJmWGqHty0WJhbHVcQ6Vpd+wIVtf4YOgfqPAfOQnPMAwx/fouZkM2roj8vjk1JcV+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsldXhC0; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsldXhC0"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-84794e800f4so959289b3a.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782833927; x=1783438727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybEb7LoBEbAkKTzDnRy615rGgqf44SIjqzv0pe3EObI=;
        b=qsldXhC0Mua8jU+xUDZMnLTmgNIMzbRpBEQXd3dsOXm76G+E4/QvIWg79h9tFKhWkw
         762IBUPbV/Llkr93Agl8t4ucFNkAAW44MgGYQpgMkQSV6TYs2ek274wtEfvThZ9n16c8
         932X5h033n/qTgycDCkWBzuoRr4zfOx+G9KUuJG80dZlVJEXUgIUDgn/dNGDqwFaDAnL
         ypN15wRhKUyOrMIm+ovSSPwUv2V1Kbw4BuQELXRu+UEDJnF8+LGZyp5J8b1lwOEweyJQ
         Dg88KuR9Npsm6wy6/DKRaFoW3E9GS40aYUt7o7SbCv4vy5DWEE4EJs0FkEsoKQAak+mI
         yokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833927; x=1783438727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybEb7LoBEbAkKTzDnRy615rGgqf44SIjqzv0pe3EObI=;
        b=nncGumjXMIh9j6G4CGkIFu77qZT8upKW/Gv710Gm2c3Rt/oRhHJuhnQJ6tdw3acdrn
         /ZEv4a5YB5AN7rYHww2v96iSs3UVe1PtR2Zvb0/xYlHVQ7vGFoi2904I8moC/TNStGhi
         kEA9fR6rCaS01MVwL5zAGIQAkCwHCDftYNgUMBP0R4qf34EUvGZgPXZFn4r0cheFPqBJ
         ojgDyEiOtpTf6Sx0aJl13VcYMaUdy2p8Hh+fWtvcfYsQCFaR2WHEBgR9y07gUTQF0kYy
         04DJfk87EhOgemCj4wwBJsR6X3g+wsXzYIYWRV9kewrEGf3usN3HkKS6JM5Trad0/Tq2
         otWg==
X-Gm-Message-State: AOJu0Ywx7/6lwk6TCia8Drn9Nk9Jlv7O+JlTkrjjyeqUjU2NRPhnwW5d
	/ngJ5XniwU3tbKOPM+g0YF3G34M9a5nPgBLk05n/jonXN5zj56C771mo
X-Gm-Gg: AfdE7cnEureRwITIx6DVZdSSoCP1HbPLL+wkS5PynaWubPMuonWfu9eONHC77222q7B
	wEZzZWhau7bAiGGIvF7ivVLN33nsqNZA8xTfq2T2Rujd5rsqOBy8XUP0v+tSzSJTpp8Bh1YHlhw
	esRUqlvaRCScLS7kkXtFibxQNvk3cTTkXIHP6MZyIJ8V35bCYVS1/oqoER0exoENoK170qIRnQT
	z+7cpZlIYRJfMvY53vSPcr25xdzw/jm7xFjEW2eGfirRN+H3N+GFLB5+bI/3RtZEbmiIImhmZ9U
	vndMG91sL/lyYxvYsfRL05u8/kFyUbI5waAqLGgLlQ0YUmG1eQu57+D8MdSUrsT37horwprg2Xt
	U3L9rDo4VFEyaOzbjpT3tAdrMqT+asyxelfilVNAUbAKopMbZ5xupzDwuTvnaK4tMTX1VCbwGyN
	PS14Nd8rqUAd8=
X-Received: by 2002:a05:6a00:6c84:b0:847:84a1:9782 with SMTP id d2e1a72fcca58-8479eed7996mr3558289b3a.26.1782833926590;
        Tue, 30 Jun 2026 08:38:46 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cb50esm2413695b3a.60.2026.06.30.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:38:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Tue, 30 Jun 2026 23:38:09 +0800
Message-ID: <20260630153810.3574714-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630153810.3574714-2-coiaprant@gmail.com>
References: <20260630153810.3574714-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add graperain to the vendor prefixes.

Link: https://www.graperain.cn/ (China)
Link: https://www.graperain.com/ (Global)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7c..641a37c0debc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -682,6 +682,8 @@ patternProperties:
     description: Goramo Gorecki
   "^gplus,.*":
     description: GPLUS
+  "^graperain,.*":
+    description: Shenzhen Graperain Technology Co., Ltd.
   "^grinn,.*":
     description: Grinn
   "^grmn,.*":
-- 
2.47.3

