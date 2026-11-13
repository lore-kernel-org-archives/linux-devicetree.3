Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533542;
	b=Mwe3IBTn/DW5HVrC1TVyjWAno1kqDyRxy6YfFyTDMZhXDmY5cqF6wEHia9wuLHvfgrra
	 RS/nzwrFHtb3ASt4OSKZFJpPUgY+/gCke7b5tkvx8V6zIfN8P3y0keuzEY3P5/VuyHFAN
	 cY9yAoFt+hwVn7WtU8FdfWe/OyKfjBRFrRDjUMb3DnJeL0ViqIWjAP7TRtXB5UIh708fT
	 4XWfOGLZhQJkptJwiqfE9yZjw4VeKESWcZ/oAniMhmQq1iTlMGPw2SvHICkNl1Ui8J3uj
	 KE1BMUMS6qnDC1WOeOM94RZx0nUILvf0GIGC8yuODyhAM7VzU4vPbRAnUXhlb0UyXKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9HVV9rxTa8NDtE3CvH1N7rbiUfOat50MeJpUNT5hdrA=;
	b=4H/vtdF1tDqtM3pxgDYW5G+B3oV3/XLp82UtNMQtdkMsne4HPaRAwFkKWHETcYRzeLrn
	 fLnr5HkwX/E3cv1E0FmKyme4rt+zAxn7aQQcdM2+/ka3XHxeWlD6vOapzuepAY00Y5P28
	 pVcwSMJUVb9SNUDm2/ad8Qr1SjJP/8+G97pocF8r1eCZ5gal1/hHuIZ9JtPYuV8QWLKcx
	 QY/7Vg3XHwda/Nu0IdVyHYc0GSgC4Wdb4BYRpZTWwOgA5EdFW/Yvg98cO1y/kaiE2kAKH
	 40tD+K6Uj7O3Z4/cMTJp/aILyJteBgb++fMKmYzF/Pqa3ygg/jrubHjPRuG/zGPenVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hy3qLLrI;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F94F606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F94F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hy3qLLrI
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-99b49d6a5caso126814241.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533541; x=1795138341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HVV9rxTa8NDtE3CvH1N7rbiUfOat50MeJpUNT5hdrA=;
        b=hy3qLLrIRv1BFkwO03rDySamlfl15qA9jnwWfkhmYebEr08ulWyC5RQg7wEwkRCAPw
         3a1/ziPmO1tvE0msm2E2MWJYqKzAihW51iu/sd5T5eXgOo0K3+K8MH1XqPhKD346YLP0
         E4qYDA1nYrnGvdcfJhtl6VEQTI3F+IEfx6STNupxzIQQ5TQE1iWAxPiN4/NljjGbNRLb
         P6KvSXyGkQzsadvVlzZ50eiwrBlsF/Tn1HK1FYJbAW01NyPM61KGqR+GVs1VX//aMtHc
         xN8nHj6UIXPrFvAmxWxXd3xDTTSyuItGgcL/pTV4S5FJsEMSeL9xZsR/7y2B6WSYkiMa
         i/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533541; x=1795138341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HVV9rxTa8NDtE3CvH1N7rbiUfOat50MeJpUNT5hdrA=;
        b=jEWE+82m4c81ILa8Xu61JDkB8ThD3JjqjMioGYs25ySo4zA4qv8lFz81eTqNYyJTYm
         qyjRmTVU/O48LYYF0KUd/rZg6akibw2kxw3MUsi//0yD2WT6eI/ZidOGglJN9dOw9Poo
         smZz2nKICzhi3yurn6aQK/tlS6LzeKB1T7aQQyJGPj3VH+LHVzR4WP03TGyql00AA60/
         +ojqCdjMhmJ4ZZY/PMkMpyNaiSHdAbw9AxO7xEETIPEC8+0WmX2qGhjvhrKR1Sn8f2Iy
         RBPbBfQaVgR/hdoGLgSOMduNcGQSCl5dfKvg/z3OZGTV5Uh+3gObNehI3f/RvCgNdBIE
         WDrQ==
X-Forwarded-Encrypted: i=1; AL+hErEOaf5ZuF2FiHpy9C4QHGsjIfiI1Mb/larFL25lO91pWqp+ajYR6l6hXBGYISRU2AIJy+PmFWimSfGJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9s/OiEmlDJ+FQfSZH6HVTUots0ciw+gdvcjeCie+yPhYt8EEV3
	yD62RzjrtFrT8I5dJqC/X2z8rp62moyfiB+Q+kTmzurxAdEU1dj7uFw2
X-Gm-Gg: AYBFou27yXlJqVFCOOvfET9lJ+OziulqVUiObjFhKDomhM59e7J0Rvj6CsUgajheNPR
	Sfb9rV7ISwWx6X0U844Mf7f0Ib+gXBRuHcOB8Ei1S07+qstdIOONGVus5TLm+KTuZYleoAv06Tt
	jbwvs2Ff0AVmHCSiKzrIQXkWcDbDv+XEkr38QC5JIw/RSBhF1qzxYGLDSoBwKSSdrAcZ82uqLdj
	YIgXuAznN4GeTUzppqv25kEhCcmZJS2c+BrjVbmgoibqGIj0n+w9iFPkHh9CP0QapUtqLNVVzp9
	gH5seCLXf+twKqLsWFekgHZ9AckzyN0Ei7Entu61X/nLdIZuqqJd2WXkilkUUIHlgkt/tuonp2E
	BwoT+esMtBxNVcwNQnljRNB399AuzOImcG20+gSYxdT4z/2NQVFexu00m1Q+EjTNJoCoVdWuy/n
	WvnQwZOwMPVQhfALEv7VEoYklMh0Ri+JQPFTGWRp5YbleQpppcO6I96aOg3alWe4TxxK1KJsHY2
	Hp58MKzGrvQG6pNGlsIoW29yUFVk8yos+LGnUKxzpyKvGVZgUxkCkeF3gDjxlVfAltv1S8mM98X
	3UnWIdsp42Gr5zZLuWyygxS58K9DLamSNPAI81Ik3/roAP44JBz09oz5vO2b68k0UGYl+1eThPu
	xYJBYH8eJ20e9VlUF+m7gaw==
X-Received: by 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr297767137.25.1794533541329;
        Thu, 12 Nov 2026 17:32:21 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:4b16:e82:1dda:bfc3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64be7e2e9sm796166137.0.2026.11.12.17.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:32:20 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Thu, 12 Nov 2026 22:32:11 -0300
Message-ID: <20261113013212.470981-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The interrupt descriptions added during the conversion to YAML do not
match the ICOLL source numbers used by the existing DTS files.

For i.MX23, Table 5-1 of the reference manual maps source 36 to touch
detection and sources 37 through 44 to channels 0 through 7. imx23.dtsi
lists these sources in that order.

For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
15 to the threshold interrupts, sources 16 through 23 to channels 0
through 7, and sources 24 and 25 to buttons 0 and 1. imx28.dtsi also
lists these sources in that order.

Reorder the schema descriptions to match the hardware documentation and
the existing DT ABI.

Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to json-schema")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v2:
- None. Only collected Krzysztof's tag.

 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
index 782b2f4005a0..755029880677 100644
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -87,13 +87,13 @@ then:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: channel 0
         - description: channel 1
         - description: channel 2
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
     fsl,lradc-touchscreen-wires:
@@ -102,6 +102,7 @@ else:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: threshold 0
         - description: threshold 1
         - description: channel 0
@@ -110,11 +111,10 @@ else:
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: button 0
-        - description: button 1
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
+        - description: button 0
+        - description: button 1
 
 additionalProperties: false
 
-- 
2.43.0

