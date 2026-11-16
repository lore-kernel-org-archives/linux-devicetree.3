Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864414;
	b=Xu1ysKcFOJWfWDsOzOJFktr180t3B9TZBGF1U24QYuxk78s0NTBcb1usqDs2E1MHn8zx
	 H4qU+mbU0r3yagSSouH1v8169z/DB2alq6W487nmEB5xfDKAKzMvPS1HLF2REQ5Yxl8i9
	 HuI6jpz1rcff1LFkHIF0AdFTTJilZ8SxQo3PktV4m5pD2tNQ8DEiL0SPaT+XTfajXJ4SY
	 Rzouwgt5GR1h/hJHFq7QIKax9cai/DJUloDjm9PVlVlblzWIMD0Xnau2fVNyt5rNWbYgh
	 jWE5gILtoG+KNfI3body8/3sII9K+1z7fv29p9oAxHjUtihh4w1DdyG7C+6/ymwlNaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
	b=jPfdm/Lz6BZLf/wdxJqb5nX+G25mOPMzJpzeJmE6VJcr0i1AvI1IFQmCsGdPkZ4JqxVQ
	 gBpyIQyx81wbF/4wy+qeRxMqNhOmB7L3EtLe9HOKoktQfmh6cjr6ZbyyUXrfBXJrVG2fA
	 bdrq6jL8mWXtEKHRLOyw1iyoMgk6o/CqA+U6QjXVGnu4QbnfFkcwsiRuHgm0+8oWq4ioB
	 wlUJlQ0QEK2EpfsW/3JbEvsIatvoOsdjtw5+/IPojZ/vnqfTWrbz98GNjIMv4RwO4za5+
	 oWqlahfKSVXtpWXpNa05ntiAmGdoYThpKocJroyZLuLUCHEdvZYz6ZnsedM3O0T9PWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAURpxwo;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF67E606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF67E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAURpxwo
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso45093915e9.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864412; x=1795469212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=MAURpxwoicsksSVnc2WAsPB6JHUpT01pe/omkWv1cyD9LfvrkdfTpz9XI4PTsY+lD4
         SGrVtbMkILUcB8UlVxbff+5OGS2lWyRPg4+99wfZZJ3kK751LFxY/m8LTjr6oiMVus8k
         NLNpqxitTryKXQIbIcsKSMHDOxKylCzOFabOSB6t/1IlelEkuKnAU8DjjPvXU/qZDKLp
         LUS0foLTPneGc0r/9RGpT435PfWh/Tw1+g5u3NiaPw6KH3UroKGAVTBs+bDKLGIwpZ8n
         3wkffWoIIDLNuNqC9dnlPrAPuX1jUL9NxQr36U7VkPrRC2O736zzBd6z1/JXDHPc7i5T
         PENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864412; x=1795469212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=mD53FUmAZLjwDcsmUI1SPRFxppNJ2d2O3e4wVKDc2xAYJw5fTzjZAsSFYK1jvnlwP+
         JvkNI/rGR4ZDcihrmnFZYHKuAXtt2iBH57nLaH+bGT7pswe4PeMaqsyBb3CLSaohrEaU
         qyVsUfld1ZuIvq4lrkbNpjnEBjxccBXK+EkBpnUelZX9IuwZLmx+HNOPJqYwrKh4HxnA
         uh4LXerhOFMPnRTe2EgfQOyCBWXkZVNYEn2ZdzEFXQ6HXOsF1pBsbvd5cu+LLqHQww6c
         ZF7lRiUsbvXIcroKy/SgB/I1uRyB2o7xqEMGZGE3jGhITum6lXA+Hssp3+M0mEK6duqT
         r1NA==
X-Forwarded-Encrypted: i=1; AL+hErE29u46maAofYmOQrVOKJE3EL7LIQyh/I/l9+ato4mGrn7j5X2ZsN5o19NMVdxdBfUG5AFx1+oip+3t@vger.kernel.org
X-Gm-Message-State: APuU4Z8DXeOF8BpXAakL0tIkqnLpKqflnPSITwUhn6Io6mk/LdUTFEpP
	GQUT/ZkYN/LS11NMW+2rpFWChCk9BKO2LwIO7/guTn1WPbfKEvHyho8a
X-Gm-Gg: AYBFou1BoLwDLULHiF00qbznnBM1H6IDx2G5Z7EMjWPQmnp/biqjf39EFloVaeB6bK3
	FKkGRG9Jkjk6wx5BhwTLpgMU4ulLY1eKcsoFDNWWTxbWZMn0uYlw7I4p47rYk8nDqvWL2J4Dtwt
	GHF2NIZpg1xwe8a/ZfmyOKyojt0hbwTeVAvowYkcQ24BVilpLasapDnOsHgKrD1b0x8ZSO1R35d
	Gvlo2CzXMcxVxRrf5nT0djPolw7wcafdzI0ofktyvJ82f2g4CU8OVunPmKBprrrmE0aHAm4oyH/
	Ve1XAQ1uG5sOvGLqZUzRAE1zUeIcDqw3NHiaY8Zuys+q45wi5r8zphukcsTiTm5UgAA3gP4XVKI
	9KWPVyUTo4GkbWYOXo9FeFW1tZhim+QBsdhrTlMvRNm8Ra6xi5PMIFsPSv8Jlpjm8EPJHWisGm2
	EncGfx+3UFolp16S5kRQLGbbGQ0GH/wgx8xz5MZeLFQb1y3r2IXl4ZOW+G+nNKQ7f3iN7xL5DwX
	EYCsw0NkOHAjQuYpN1gladfQw16VFa/Uzhh2pBPintbMH0BL3ZFkjv5NvjnZXCVqOs5FmWU6qpT
	T+fiMV5LaD3bcpfO/lBzStCa6ncJjG8LR4X5a3dD
X-Received: by 2002:a05:600c:3d92:b0:4ba:e7:ef3d with SMTP id 5b1f17b1804b1-4bb559f7044mr243891145e9.1.1794864412296;
        Mon, 16 Nov 2026 13:26:52 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:51 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:19 +0000
Subject: [PATCH v2 03/16] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-3-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=FqcgSljUbrxAce/Wb8/tWQg7D8BxyY05VfRoM3lIlKWOtWcZxkvJ+EYJdvTvvxol8FPPRApKu
 mw5+dUw4O8RDXBA5aD2L3Fg9fYj7OF5FtJNOsGNYBuFx4Z8h2/2ns31
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0

