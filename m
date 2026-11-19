Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=3Uei1efNm2s9qxFlFulMnMqR2sAioCgjKwp/A+gfkuGVQpiLDRTgeioW8EFlE8Spi6ku
	 pMoTxcX4ZUZchDuTj8N7i01MzgRSPw/1Cs6l/Zj2kR5CmSYb4wSted1JWzn6NB81mn038
	 Kdw0kitiaJObQNOTexg4bd9wetoU/+knzJuDKd712UEIUZDsT+YByccdeVAjKB0OOxU7g
	 2AyHVjrnC1+dZ37athXIUkMNJepC+bFrl+mTC24BNsPUmuYzAwKweQ4SV6mPjw+zhNF7P
	 HRHHVpVhkJDbU2h9BH1GWFV7vWwGAvYisIbAZpnaF5qZLlp0Muy2ivpMqBw0gaaMqCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
	b=xEerJohMyyg7mpfpvTZnYpltL+7H3d15L70YnLDbruKC6LXWnHu9dEV4XosfPetlYmkn
	 RRizqkaPJBWI/LOEZ8y7jtlyyiH1PQmayqeVKEIJKgdkPgyM7aB6c0+fDi3FoorJ00K00
	 xHj4mq5rb65DlPO/Jk1MJUw6bYr/fb8H5G28+owFjsu+dcP/oam9RtSZBa25+MlxfcgR5
	 l2TMESPd6vhNj374fVaRTtZYR98WOFvXuA/lrXReXLf3da4d4cBc93H9N3dQS1c3BpHFX
	 pGln/uUoiBCcKrvdDTRRsAgb5gW99ih2zqLmOdR9bEme4zFD5/PFwky6E6CtmbZH2EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=tuT5UoBr;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510660A262A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6510660A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=tuT5UoBr
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5124dc427dso126063266b.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081887; x=1795686687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=tuT5UoBraM7XADG/B+vWLbNmwJGNEmNaCzbPRSq/rt3g6pOqHbBtGLQv7O344swf8i
         m9hEtpaZN/9MqKHcbuqaHH+hQQBks9WlJ05E9e1BVwdTevrDWHUPWlhb745nVNmcB+rS
         s1Sq6aCJuYJalnpoTCtudQN169ZRKGb0qZxA0nVlyFM4U7/CIAs90tc1t2Cl6m2JvZZH
         SdmCLLRacQFAdhsKvKg9eYO4XPPJ8F7s+1Xwr9FAgLA9VlQHByko7ZkVKzBO1Bsz3jLc
         4zrq6pbkt6NZMaeUHgxPtbFH2eYoQ0qt3/Ax3C6DAaxiO/EovBzzfgu0f/zy5QMYy4Iz
         nWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081887; x=1795686687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=fdZktOzvB6Hj3dOkL0liHDhFgKYee+diknjyHGx2sFZjWubXYPLv142kWogO578pdv
         /x2VG+jJ3fZlLfBS+E2OC5TbeoPjhD8GrJx4mMsGP6kRtxLXRbx7I11Pp5MDt/dS7phW
         7N2FLuwdfahY5vLSOAVBiSHL+cAHNOVX5LPV1O4Rc6UiCG/qcQsVIaiPrgynSRkcHrLW
         JN2kzpG/65AsQNu+6/E3RNdxs54JjOk0lGVXfMrIWDYW68g2xc6dhhw/jo9iD5Cazhy1
         SYb3jSqRTL5ymFOKtGw2ktIJgYMpvsSdeRVX+VAtvanhAU03saV+8JHIwdgkocFPM0NH
         iUoQ==
X-Forwarded-Encrypted: i=1; AL+hErG+SFma1UXkbF/s6XprWYnWlb39tfuWtKk5WgL1a2qzNQ+bkWmN7RHGzDVUHO4tERwirVTz2en4B1Xk@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gn9lVpKfq8jqLbxvEU9FaNSAcf4T9HQHArYE6BPmdpJhXDL3Y
	2Ym0yBAfuBYF2AFcEblvh1ysn6IdYoVEdCobSvYJqNi55rzweo2rFu6ufOL/q+pV2sc=
X-Gm-Gg: AYBFou0TRyc638goLGedVCMvtNoKywymQpyPKTjOC+8F0BEuffmimngZNQzt/9cLDA7
	6ixWGEyxiPxip8bQO5uGZaiHXP+EgnPR9zQexJpxWEqXNw47PgOQQrkQmUsfU0SWJGrPlA4tYzh
	lAmC9hF3JPryRU09l1O4Q5ZtTW/rYuAc4ebO6ZPNjdxRmhMo2jFlcJK5b7QQaST/ih/o4mNx94B
	pUYagRm4up+mjvnbG5iKYstddhK6MDS71A7qlNKFPKx7PYQbdpB3IQl2yqkxo45K8VTn5x3RaLK
	K6egJo1OqjZxDBcij3pJ/GBZdQjDofcDTMmJSLMqAs9KMoCp8EyhBgLN8BpHfSLanSW8rLOqbAy
	84FJXGyRdI7w8SY4CXheYrlReXsxIvTlyinx+xln+XEi+BtBiSAL7lKJMDRIs781gEDV8nq5xEY
	urzh1/En2jIS15XYywGykfdB0jE1pKsMU1HV2hv98HT4eSVsRrDpdIFthx2D2VY7dlicNOf9egU
	J/6P3mypd2sSN0hQR/4UX2oSpfiSlMZVNNCvBs9ZrI1Xi34BV489ilyWp55P+AlHYIbs0QoLwJA
	yDGY06LG9NEztTQ4hvHfLyBBMMI6ncLnf7Jcp2QIhByhXTupRMZN/YY1Daj2Qjmm/8Mxh7KDXmS
	FMlloV2Vc65k=
X-Received: by 2002:a17:907:36f:b0:c51:2497:c64a with SMTP id a640c23a62f3a-c512497d81dmr169697366b.48.1795081886833;
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 10:51:25 +0100
Subject: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
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
Message-Id: <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=1266;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mcLSV3KKUJrX2Vt1xs2+yh4YAv9r2QOuUzb8TrvhqBU=;
 b=CQYSyNjBO0Q/zSTuxeXLUaV+HvnPHo1DxvGi3LDOgBjJK0F1h6E4ABmNBlYJUC/6ZLjkTYYtZ
 +LHwZi/bm3XBFa/c3yFLbAkh37pXvffc998eC7/JZuRzWEqRvCwkvKu
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e2308abaea68a6b31a7e387881bf2..a657a5dcba9cdf750fab2478ca319f3a592ea295 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -665,8 +665,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,vcm-prescale = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	/* IMX858 @ 29 */

-- 
2.43.0

