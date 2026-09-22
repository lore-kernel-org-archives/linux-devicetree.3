Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C14237F8B2
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042307; cv=none; b=SJ/vGBwvyvCTMY3pbXQrCXbU5lv4UGRcDpfr/n6sCwJixKBb+TLP10m8g8QLrb9gNLnHqH/srC+wFcxpwk/oOGbw4kF7kWI8qnrwws0f/jxKC3L87k02x/HL4QuqKz94vMe5QR8atYC8TUy3U1ahqZ/8OuQJBu6z4unrXZupDxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042307; c=relaxed/simple;
	bh=8kYViKSQ3C0eFrFVx2F6qVjb6w2IQh5LAUii4XAKVSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTpxHGEc4/JHJzLm28QrsGvJjTjUxIKO6C7IZLXiX30NiFrf+idILdHCIXGb82ngawodxwsf2tFBxFinmW25qvzBH9CpMohsNdxX5tsL8ThvO5bTBfnWx3BHRhgkO3yh9gUd7JmYWlxP5fFkHUv1W287V0L9l4b73guG1LsG72A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLLu88Th; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLLu88Th"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9120eda2195so3578306d6.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042305; x=1790647105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCJdCy1spHfvoWqPiL4zSSNSR11irryhiW1SJ7jEa5o=;
        b=eLLu88Th8E0yvCwNDkiuuOAik+FykyWRUTZ8VTdtc81PBnzFHYDQGOmHfRWycDNmXY
         k0zKXlKs8D8s5mUIDs0pkKAqe6nAFdlhTMwTW4oL8o0UaLXs4HjubsQvkxrmRNkILzle
         4ya3IdLiHznvRE5hXORPvFHo/glPrGddT4qv1lnS/rHxnLQZ1zyIW9DShqytOUrRGb6g
         rNZ8PiQ/+na7rbyA44pv06R7/QEYb76g9hl7iTFIAcSvV3WxmkW3Tp6Eq0xY5ewpNvnA
         e6xWqhmbGVbdgyoSeg4B2ofCjEp1kEcVMH5XquDF6rJ82KEmdra94Xi2rOGPAi6Xeddg
         gESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042305; x=1790647105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCJdCy1spHfvoWqPiL4zSSNSR11irryhiW1SJ7jEa5o=;
        b=ecClm/3lhmFy4iTJUtXinf3rRohm7oaYRNk4iCbYkz826g2C0JkKdnKqC9dNU/4t/n
         wzboXZK+ItXlRWWELgOHa1rYfmOz4fxVttVxtxbSKfeyN7a9Y0TS5HsGYgO5mbflQLLH
         WAMVxkfW1t7qIym5lUkS48+MR1AFtalcIwV/f4M2xz8ePTJ4JOCTEl755U0NxPqjihIf
         o4R42MAfYrQOCfD4v+dc4M84jZNUDSxk7E6AtfVHTM1aqsvoG/lVa63kv8Z9DGZpjcqD
         62V1aI+k3/V7+4BotnhXh4VwdJrhBI8QpVvrD2nTabuxf7WREWUyFcNX/Gu7/z8ISTuh
         mxmA==
X-Forwarded-Encrypted: i=1; AKwUvBw3jyGpbSa/3HOqt3/t6h1uV5synBrbK5rhZrjziooJXKnXMRF11INgqD56skbKvY6e2G5K0fT5rcAR@vger.kernel.org
X-Gm-Message-State: AFuF++kFuQ/4gceNfCjVYf6nKp6nweFQpMSRx1VcMFYzV5qT//ZDiOq4
	tDUXqCb/48hejBZBEkHQyET862Pa6uMmpEypuh+x/LwDXx2Io+JxjSSy
X-Gm-Gg: AYBFou3CPzO58cXps6L6vLwTJPe0JN0Bi2pdQXmQq/xD73q2md1I7Acz6kIprBRcbt+
	m/tG/RfTFa8RVd2bpRhuIYVTpVKvmYGry3sUaQyGFqh97WFvPR+seAJpl5temjQaGKRevw1655+
	j0LCduEDAtIAiG+Pe8vUKbn9OC18iQhOVpBbQ0YUotc8lAXxxiQRZ6iT3zga5qxB5Yf2fVDYi5B
	U3XDcgdLmYPr79RfRdTSC1mpCGMJHFqksm7yqNsKJcQcXWv2+3dLecBUoyM5O+JeOz/0luufZ55
	HgMysRdaGr68ycDe4IHTNOyw/Pw3Vv1BDCmNig9AjIWIOXlhuCDaT5x+qoidwoO4tgTLq1qh58d
	zGb0e8PVAXfpLlHabaWFecfYbIxUHDr91yE4IlJVnRsbHC+ABQdk46oAliXD1iztCZCIFAUHDfs
	OZc+phW3W88U8J3R8YezPSO87S0/f4IiN+TwVx6ChIFzsB8D37bUcHD0tVD6PQk5ib8upWf9Ya0
	A==
X-Received: by 2002:a05:6214:1cc2:b0:910:705d:2041 with SMTP id 6a1803df08f44-913fef9f78bmr22969696d6.12.1790042304971;
        Mon, 21 Sep 2026 18:58:24 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024ed0d6sm4131626d6.30.2026.09.21.18.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:24 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 10/11] arm64: dts: qcom: sdm670: add digital audio codec
Date: Mon, 21 Sep 2026 21:58:00 -0400
Message-ID: <20260922015801.32373-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SDM660 digital audio codec to the SDM670 device tree, as both
platforms have the same internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3856431fa587..22a5ae0d01d5 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2548,5 +2549,19 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm660-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk";
+
+			sound-name-prefix = "Digital";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.55.0

