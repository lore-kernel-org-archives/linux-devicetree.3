Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445747;
	b=G5AvQKnuJuYD0BkIJa5jw3pIomFQm5uOh8R4taVEk5jjVJxMDuSI6hAV+sMZv4q3ZI/r
	 ug0L/grAlkZ9K9Dtl02HetJ5Vqh1Hmm6N3s0vu9BUK/VvcGUU+aU0VhO5k5XBOmmRVmW+
	 faFf3nOoR/pb0ozE+khPhcLovKzN+7zZkUiO99flKjUuNKmgLS9bZmyt4ofBfdtlNjpCV
	 6oQNXVRF4F+0EIOZKfRN+aOgTxzyDOzFIvsmCEgHoBfIe9/ZBPTyJyh0ExqpCZ0VCGXfd
	 yyZrjITx75KtN+dYmf17MpBq/R1ePJNDWQpD0cvgvJgyYriP9SLy4D/ihjulocH+NrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/DP7KNdQWOH7BpliivQ5bW4gkOy6G4pd7ggK78SbJr4=;
	b=tzjNXZ7WXuDMtAUEIpbEfoz1Hg2ekZHsiMTAQt8KaWQFJI22QyXWT0AnKQUiuIKDeRcz
	 74xFgMQpURBH3hmGzzAkI2vNOI1qEEkUjlkgQ4ygMG2eXCCkbCosFaZFKgxbPHmz85n6t
	 UkgZu+7DNJZ6ZQ0uNzAxYHko+/yIN7zWDRZWnvjf4dQy4jZBRMUOmgnfBloXmv6aFcWye
	 fL+lW+S7g/X0MiDSKGuiCI1aBt9IftkZxBxwAmEAKgIbVNO3wnOSOQ5k05Y0oTJV+LEy6
	 MY9RtOlj0krSaNw2UPZuXjMV31wID/rWiz9lJXLxz4Ty2swwMhdTrMG5QUwdb8n2Bew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mldDd7mI;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB5606A322
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFB5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mldDd7mI
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be502e1adaso73819e87.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445745; x=1794050545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DP7KNdQWOH7BpliivQ5bW4gkOy6G4pd7ggK78SbJr4=;
        b=mldDd7mIUPPKxAeoDWfejbL89Bun8PxS/Pfoi/C+OVqoLglRPk/llZ975EI/vJnPFS
         MK4M/1P7wBS0DRkWhJoau6Nz8P8iTt2Cs0vfgBp7lOzxtuNU8Oq1fDfuf5Sgogwzr3iV
         lXYWR/O6p/HCum9RuHeCf6slQS9z54OlsW3lJBtUmgSnXna1fd+ihj4DXO4vmgFWXq1W
         j8N4cYbS9qVov43xtvmoFeE/VPhHDjnZGSZSrS1AiWsjoUcrytSDpxgop511LzdipwS9
         2Xi/lbGUlgukqXC35RlO+pn+W+DoLmEsmftqIugwPrMJQoS+B6qWm48/+d6VyEB1wvQe
         HoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445745; x=1794050545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DP7KNdQWOH7BpliivQ5bW4gkOy6G4pd7ggK78SbJr4=;
        b=Qf13AA/nZ2nQ+J/pDSs/0Nb1oQi5atXOGyt+9wmMW363ifuvqAb+rIIX2OGsu9AUIy
         80X18BxOyjuwPQiV3qi6KroMPNynUuVyeWtwgww45Lle/LPeBsLmnBbj2ck91WuL8Q69
         xZva90KeOklt+7fE1AhLHYLtWxpcaJnqXnYnuUKSFMixgr8GfvywQLtHY1QzkWnqQtWT
         Rk8HQNiRfSK8P4BBRRpSEsLAJX2cvKN4XgnA91C+wdLQN3N62mFEqHhEeXTSEtOE/QG0
         0BrI8DTB6iXwwkoor8+TWdm7dfxd8oWRYIA0PkErKRo6gQE/SXE2eV4RKeOfSRlT5R9z
         U2xA==
X-Forwarded-Encrypted: i=1; AKwUvBytn2dgg3kA97nkVB2II0yVVxH8a5KreQZIeuL0Ky+K6DXfYrseJIZhNzqU67vlh3W+1UlA5sX/WUPo@vger.kernel.org
X-Gm-Message-State: AFq9FYLIh9sQQhvBJy/iEwJkIsgnCZvguWz6WwYBly+tbwK/B993waS6
	9Htzsj29lv9U4sx3FAUIR2lFHgvZq7ru/nfdbnLFrE61PLa3DgQOd8yGUCk1ekd3b+I=
X-Gm-Gg: AYBFou2dOod+uas4F4IvBfXuF3zcssh2ePpZmsUgrJnuhohGSGCu+CSv/OKiaMStRmD
	REcZQneq0GCH+54N36v0Po+4Q8HD4FMwPpd7lNGk1zy7mPe6267uPsorEbXIuGNnm7aphAwNY7n
	RB1LGIEeFowCsdcimQ5eAtgjl1L/T2XOWKjyLXlhC+ArC9ZJpqseAWIzwCb3XS76z3876kI5+CY
	9zC+UNfICs0rqm1dm0AWSf++7EJaF+lVPyKj3yiTqVP20b7dFlO0DODxtKnECqnIFCqkFwmIflB
	klWoJwPtk5NVhuU/1Nti8ZLCVTqm1wFp+Dat2+bIgYVCvDozIBdUiM5lDoiHAb1DMA6IxOfS9Wy
	uRhjWBYXOPVtm7nnlm8130GL5bPsm1l/AECbsscuetYpaxVAi1xZwEMs0Uzt8ELjxI7zjCk7kY+
	AS5pu/Wpb3a4sFAhqyMo7fP4LJUuGMed9QQmh6aq0reAq+ttNDhGcesYeDlM/e3nDTg3uofXOee
	mLyYA7/IB7SUQiveqGpgUm3Us2eMmOv8ui6kNeB+oCu9hJv91Mues4DBGUOcfYWfn47ZU1oXgYX
	/kj5tYFvsDaYmUmcCXA3xCS1BOeUcniicwQkyKW9WYEgRGvsul1AO5J5cANrfYTE4Dk+YNo=
X-Received: by 2002:a05:6512:4041:b0:5bf:a48b:7807 with SMTP id 2adb3069b0e04-5bfd952024bmr1809892e87.1.1793445745111;
        Sat, 31 Oct 2026 04:22:25 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:24 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/6] media: qcom: camss: tpg: Add support for v2.4.0 TPG
Date: Sat, 31 Oct 2026 13:22:00 +0200
Message-ID: <20261031112203.545319-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Add the TPG resources to the Kaanapali camss resources so that the TPG
subdevices are created on this SoC.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[vz: extracted pure TPG hardware support part from the change]
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../platform/qcom/camss/camss-tpg-gen1.c      | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..cabbb2638cf3 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	} else {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
-- 
2.53.0

