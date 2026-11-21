Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279776;
	b=xSK3XP77PNOq5VXXORYjObsxe9vmGqB8ytzSu9jCuCfXfw3wMkRSurWXFVaU0OrzIix9
	 W2Y0k2bdsj8Rup0T87pQgtflwa1qH+ND/N/mvLCU5JVmVkjMWiyI+EPxcou+9QOYwEMB8
	 ioJe5O8SfHSf3ImSur1IP8ARyDtSzNApf2w2PwbO+Q/2C6zL365ju+q8CUk1hnojgN67Z
	 QoVoA4g6cHnKD84pAAY3+VTlCE0F42gpM2FSIm0hr/mR7pRyCJQ0y0yjjJxE28C5dQVDL
	 p+H0Lltr8OWmsHQhQCQ1i8eYUKDcALnw9I0sb1yBUUPOnAQDbNR2TMAyl+azOqymBEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
	b=qyjbARbxppYvFTUkLvbmFjSOfDdGy8+ezzblzF0BL9YDfuG9vl7ifWAHjKVVfR2m/+sh
	 PgdOl59AX8llvBk2Gpgndk/wjvRvmN+Qn3wLJyhBG7Q68YlnRiZ7d5PLhqpk5sDEpSW3F
	 jxZVEfqrkZr71KBBeBPy5PXek9Wa8ytRouIIDMFv4mGPIyAoc0sX0XkkjptVan/Cd9LnB
	 LwGIpDwk/ldquguuk3ZSr2wdshdVbtd4G+D0Qfjr5id4irkp4I506uqdbuudlxN/T3jGK
	 6GLQIkEtF3ENmzlVBUAL0jrxP8DJh6P18WmhRIktKPbH8cMsDWrBGNHwzZXA3SW+7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdcooltJ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C39606A332
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 16:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C39606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdcooltJ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1530277f8f.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 08:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279774; x=1795884574; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
        b=OdcooltJshgvnRM7c+d/FGFvp62+GJqr7tPTVT3YQ1ew2d9S63WxhaYLBBMJo7Rish
         W0jFv7E+bumkwunAAIGW3/h1O8hR53Mce65f8w7P5dd+K4xvASRMIHo6FgHTVG4+plbI
         SLEjSMPhJ22OZpuOK+En0GZ9ZiMYu8oirKRLLUuXOTU80hnFa8601onbZ3qHt6gXDxwj
         m3QDaylwAlOAcskZ2OhBE1pLKpx8foNt4cdlL5xCoVbVYlv4mCBYod9ShLAFq9WuzZT1
         b3gR52+oXacMOpqxOKLS7gSu0HyRtvsVNlieaFvfxpA15HZqvZL8K07lYpZwGiQFj7sK
         /05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279774; x=1795884574;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
        b=gI8VIHBbCUCYZMkmFrv4jcs0TA5HxhpH7lClO4JOImXmZwL2Rz/YvmYhepsOwxR0xW
         ucWk6Gzj9rDfjWi6jMXX94hRAIvaNOlPSgHvyaYIjo0oacNU/Hlu26eNT7jCSr931nQC
         89l84nSEphiNfIGUlg+qYCoiw8WYeuFdTKq40eqyZa8PDXKNMLNVGzEyRvABDmrRSbxr
         JfmX8BuQLdd9z6gSLVuXxxulO6BY0tLyoOT6gpLRfASa9FTdbB91uYsAIrIf1CPFR6Hg
         /SKxQrL/AEVwLU/M2RRr+6UVyoNSnkoFivzIwYxSOLMSObxnU4CbjULDpybxQhZxwig3
         +qlg==
X-Forwarded-Encrypted: i=1; AL+hErHfCvo/LXZXsVFl9wnTksIgJUCRY5n/cnEfphKW3ry4kaJON8bZ8hK7kfynMwCpxaYxHno53AxceI3r@vger.kernel.org
X-Gm-Message-State: APuU4Z+g/oQ4fziOT3LksIgLe/bVXLUIfvvK7BPeH5S9QdaMOnyytbKS
	rWsXeshcIGTEI9Rpa3ruglUFQCPPoKKUQM1eqb3GaZEhudAke/KAPDPPnck3rc+F
X-Gm-Gg: AZFdTZdPMCAb4QrB6fEt1BQYkSluHWVzWCwmvCZWwfg/IlFy76hzRuseJS6N5MU3Y3x
	MboUY374dPD+tmj9IDMlKWuS7H8Pf/bEmQsVmrrFkfYVbTrB1BhJ2U9a8iuX1a96XIkdKMr0GYq
	O/1J96bObWJKQS3OF6nXByJTd07/F7XVO136E7jsWim9/SkVE5271kd7PCylxLT8JYegPKBbd8I
	gazQgFiI6PxvV7NCayjz5se8uaiGbvFIckU0tduMsqXdSukJ3WrsRN+eAiT+Lh4DHuLIaKFWSd7
	j4zlJC7IV2vwBMtuiVchsSU4Lsy+dNtohT3Dlxy8P/1mIssRvcVNFDQpp+gTvJTsm2p5plwTzWo
	Ubw7/FVIEQFBvfwEaICbJqHRwy9l0G6TpKh98uS0i3xRTWeszJknN9ULpRSVN2QyXOhzD79oQ6l
	t5MGJnPzTCB9BaQpyXO5Tw3Q6Njl7sfm3vIzqfuQrChGmpUrHm9lFw+zUnHGjuxzj5d+wTFZ87K
	rLXC4AVeNs1VqqrDB5z0f4ColGTaeUmXTwGQlwa1zNSAxI6I6gWWZu1Qn910FxTIy7DvwZ/pGgs
	6Am2l1L5s5kf+Lwne2X9mwIQo5suOdU=
X-Received: by 2002:a05:6000:29cc:b0:4a9:32c9:a6c with SMTP id ffacd0b85a97d-4abb43deca6mr9060540f8f.50.1795279773669;
        Sat, 21 Nov 2026 08:49:33 -0800 (PST)
Received: from unknown.local ([2a02:b027:11:696f:25b0:e663:79f5:e891])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm9761749f8f.35.2026.11.21.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:49:33 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH] media: dt-bindings: document the Dongwoon DW9763 VCM
Date: Sat, 21 Nov 2026 17:49:04 +0100
Message-Id: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyND3ZRyS3MzY90UQzPjRNNko2RjI2MloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AcDXonGoAAAA=
X-Change-ID: 20261121-dw9763-d163a5c2c323
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795279770; l=692;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=VFe6rInvOpcbpjq2cBpErG4KxA9j/Y9r1X0v6h+zhYE=;
 b=N9bApgpYBwVxB7xDyEKPDEzkL/ZOO/P/SlJmM9T9fKdCl3jhJ1rEKJxw4rPB1UjuXyAXn9Qje
 c4Lnp5DPvgEAFM+fzXoY/wgd0DT5+jfjdjrKFbulNhO56PJ21VwdRw4
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The Xiaomi Mi A2 (jasmine, SDM660) has a DW9763 on each rear camera.
Both work with the dw9768 driver as is; the commit message has the
register comparison. The jasmine camera DT that uses this compatible
will follow in a separate series.

Discussion: https://github.com/sdm660-mainline/linux/pull/267

---
Gianluca Boiano (1):
      dt-bindings: media: i2c: dongwoon,dw9768: add DW9763

 .../devicetree/bindings/media/i2c/dongwoon,dw9768.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261121-dw9763-d163a5c2c323

Best regards,
--  
Gianluca Boiano <morf3089@gmail.com>

