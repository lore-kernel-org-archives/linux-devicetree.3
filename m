Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774797;
	b=dAb3Qk3mKreFdWZ3pLmQg5KxLQpf8uJdTQ5Tq9Ed9Z4r+JR7LGrCKKeyW0qSOeWQ2NfJ
	 UbUTqBT4fYW/9cPa7rEqfhrDyBks3T88+7A+9BbM4h32fWcOBjkv0GZIG63RFlV4nW+JB
	 MlJx2aMSs8TIG+FP+3wi5Qa2Dlt19GEwiG2DY2niQgclLZQoWUY/sZGqifyc1bl8cDufR
	 HCuiOpmo7hhlQcooVXPKMTSNElrpPks9Zh2poC3auc+STohTbrREh5FOkIwh6SSEnboPO
	 pOilSeWS97mUaIkHxVBelIsce2X8fDMmOOqmiE5e2E7vN7dzzktY9Agyp8+29Qh8NXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JD/8S1hfnM9Z/Fu9PrdvyUkvMuukiV7OkczTcOPnYA0=;
	b=0TO+WaWhkdxzdACeMbmu+BeRRGG6hWvywg63PRXmm1szNuMNeaU53rArjUUCEOcWS9/F
	 tNMAer2O5y15bCznSowENtOKchmU1I0f0+9qlyhIvHJviKWzHuGlE7ox/5HmAlOzOyUUZ
	 4VOe4DK0zTHLrSB12eOLvMWXoLGsZ/HQGFRhVsO+WykJ5YS4lcyJLHRTTPDq3Y4FtiILw
	 cUboUJ43so8CbR/C4JX3uvoFgrOiIcxUZcViJgdu5whFe6Yhl77WiR+kKNScUgaE3lV0p
	 mVJ+YfixkWsdKuZ7t0VddRH6xj185ZcPV/aa/JOgm7wrqlb0ZB01mzvvI50igMylEWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvA85MNq;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C74606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvA85MNq
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eb33b5c067so6950125ad.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774796; x=1796379596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JD/8S1hfnM9Z/Fu9PrdvyUkvMuukiV7OkczTcOPnYA0=;
        b=NvA85MNqgC+85EtwyYvCDH4OGd/uwaZ8MUbQWKXarQyjTM947h49ZWERDozg20HM0m
         MhPckKt2TdDDDheJlyIsbhfI2vhUzTb90mxBVCRrK1cU9c3u8BLfs6sfXuXmkj1aN8cO
         Ic2MLr+UOkCHwdkumSVphgICYVVDFk+6iLN5Ry7w2aJTdwA8cQn4Q6MJnJon6AyFo9tQ
         B2qpN38mfsEa6wp9k5jPexM9UDU2Vj1DCquolnvoV55uQ/CVnv0HpdvJOxEt7LUR1iop
         GaimAVWh8pqIdB/r5k+a+yS7KA8yK6LJKksMEPUVlEQXLV4gZiFxki2GPgt1hoSsRnt7
         A3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774796; x=1796379596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JD/8S1hfnM9Z/Fu9PrdvyUkvMuukiV7OkczTcOPnYA0=;
        b=nrsZ9qVuUlkyK+89oKS+IJQy0mQ4QKtC2j8Ne27XLeUvJtKwnWI7jxcTZHeUgdrZka
         oHlDV+Fr+qkjVQZfUMAGht/myk1YFtJIf4+Ka5QhoKcORvu6o1efkFh5swNzq8eIxBm5
         y6YNPKCV3ktxVB2Pg8UUbnaiWFct6t1iS0NazzcS9ytfeScyxSzzp9wat/aN6fK5XcvR
         KZUSESWIqnaLGWJrgsfylX2OYZHaPiD7LmSKkPK/1yrcqL4cBZJ+jD6shD/xRo2bNI5A
         lWHBFGVIvchlASuS6LJMZDkZLM6yA5Ghp6BvlEXH8FKDeY6IaCk6OqsLrE619Pxcwlp7
         VNVA==
X-Gm-Message-State: APuU4Z9Ux6smvOQg+EDIgKGMqq6XJ+vGg3Ee45YOEF0l3MH4uJaDJB8e
	DODyzkqNsp6HV1weFkhB4ptwqim1Gq4FzkrXCJB0hnVsRrHfUFEQj0OsWg3rUSEF
X-Gm-Gg: AZFdTZeMuFg5aog6zVM3zPBgWcrC7ieb2zOFwXcsryB0NAGhatO9Yd8qryH5eoHWG7U
	MyfnJkx2e7DFLIidJvrlbt9JCxgGQMam4158N29VpIX5n1IUXGEUrGbSiGP0yag/MDw7THXyU/I
	4ZFkHHH3urAEAoueK1e0WMex9J2aBZKen1zoxOqJ2rTA3RsD8bEPilTEh+lXPMBkmXckVaurmnh
	ldVfpATTaSKtQhCy/+hJ7uDz4lFCuukVGA3y3OuiBL32taW4yVNxzvyroFktYuHB0RvAxbmacJr
	b3mdTY8JQy+zFs5z352JVtyCFoCwoHXHMBKwEkchJ1dEW+LIV/8LEZ6UjOGDXsR5wXciMmgO5IN
	WFlQAwikaAFO01/cfjZlrEQEEKUPHiQ6ySsdJsPUXhMSqt5Qwan7Rvl/11sW9ODeEpMBtMejVcu
	TG3Rpo182XfxpnReAKIDTUuyTIcrr7JCheQtFLjD/HdYTDZNYhLNaZP0XNcDh+fTomqxX5qhtfq
	BSXEuEjqxV348DRdpIaOYOHLz/kBtqGuv8tMeB8zQdVgsp8WzLVNBsVXGyeMoOLTgSGrhKPPYfX
	TDTTM37ePG4HCS6WRb4PYMyM79aITxj0kg==
X-Received: by 2002:a17:903:4586:b0:2f0:3cbf:743d with SMTP id d9443c01a7336-2f03f16db29mr376499135ad.4.1795774796573;
        Fri, 27 Nov 2026 02:19:56 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm107807105ad.39.2026.11.27.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:19:56 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianhua Lu <lujianhua000@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi elish panel variants
Date: Fri, 27 Nov 2026 18:19:19 +0800
Message-ID: <20261127101942.3215633-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
References: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
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

The Xiaomi Mi Pad 5 Pro (elish) is available with either a BOE or a CSOT
display panel. Document a board compatible for each variant so firmware
can distinguish the corresponding device trees.

Keep xiaomi,elish as a fallback in the panel-specific compatible lists
and replace the generic-only entry with the two panel variants.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

Changes in v2:
- Remove xiaomi,elish from the generic SM8250 enum, as suggested by
  Jianhua Lu.
- Add a Xiaomi Mi Pad 5 Pro description to the Elish entry, as suggested
  by Jianhua Lu.

 Documentation/devicetree/bindings/arm/qcom.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7157795870cd..badf99e92d321 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1188,10 +1188,17 @@ properties:
               - samsung,x1q
               - sony,pdx203-generic
               - sony,pdx206-generic
-              - xiaomi,elish
               - xiaomi,pipa
           - const: qcom,sm8250
 
+      - description: Xiaomi Mi Pad 5 Pro
+        items:
+          - enum:
+              - xiaomi,elish-boe
+              - xiaomi,elish-csot
+          - const: xiaomi,elish
+          - const: qcom,sm8250
+
       - items:
           - enum:
               - microsoft,surface-duo2
-- 
2.47.3

