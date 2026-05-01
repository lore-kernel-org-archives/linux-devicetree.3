Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3B3B8D4F
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649476; cv=none; b=ozpevjg+l735IF0mIIgjYrOcxHDXFR9kuaVcGncH6YWSQrGG4G7r2ExLysd/bh0Emr55ZsWnnjzs4s84UFy3fwIoxiuIpI2O7YLKcl8Ud2nKWttOtlMVPhUshUD52Fzc6eiMqkOE8/Wwo+fow371jQJq/k9qocIFB5oiLXKqVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649476; c=relaxed/simple;
	bh=1zmtsmOoLF4c/VPOqKHJVqKxej12LVDn1QxpEGQhWbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nc+A3g0B+2RClgxmawtwS8DDRZcrXPP6yheqnlCZVnThcqeAipBur5DocXeXIp4V10jub3dvc18CSYPXORgiPrW0WHhExQuUCjDSfEZeRiUeh7gGb/EaN7ErSYfU0JSuAgMKOLoIC/kWBfg2prvLWlflaKU4V4amRGhotSpiRW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDxT8+2F; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDxT8+2F"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8f984bddf4eso194448285a.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649474; x=1778254274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvPttf7PmmDXRNduf1P3T98TbrwrvVaJRejXXwP5B4=;
        b=VDxT8+2Fo13sZqZXBts2mp/SjbVZAPJcEMqLvMsxHUUUGLqVFKaEyg3fIGBSWo3I2u
         Db391yY2RsnvvNbZ1frXglnx/l4MyPpOenGNPmjo/Bve6aEQ6ei/U63fnId+U/UY9P75
         8WW2Rs1gb7KCH0kyQr9tQTKKMiMxkmWqXs3GpUpJ9xjCw1kJtyAPTatmT5Kz4Z+jH3df
         N/tOHK5+fQgR+5t+pzQr9EmkCj05xTCn3hRqppyRS+T3hsjTa+xAlNEo5q3pb1QTFdr3
         /vQ79v/q5RllXuuem+KNIdgkMW28VMQdEaf4J+EfdtzvH4s72U5VR1FVykL65ltepPG1
         HdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649474; x=1778254274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJvPttf7PmmDXRNduf1P3T98TbrwrvVaJRejXXwP5B4=;
        b=Q8CiVVDDSOUd/VMfZRuWQQdv1fwfDEMflb8UFdKj3KINaEM5Ek+3qQJlS193MzEeeE
         R5JYnnSReX8sKp6PNhFKd7v+sPYqTj81ZeufPNYaTND4Yj5kXkNeEV1iwgWFpUDFrITD
         +UICqKaSMyvUF2jjjL7M+uUe2QzEwsbicBhKgbkmdAsJMbgVdR9Q4R1/80C+qK6+WE8n
         8oCW4x7M5ApJ7mLI1cLJG0xWyZhhtxuMJkHxBu6mknrFpagRh2YaKXG7Qx1/RsEAuPBn
         BugaSvJG3CAEwpVHMbQU+9Yi0KBywiVPJUK5Hr+OxlGAstxyogOghytl2sRcTp82I2pn
         OulA==
X-Forwarded-Encrypted: i=1; AFNElJ9+yH84qPrwNdOT6NOYpRT+ltBsNn/P/j1RR3+z2RUsTkHSJSpTMfgfZEfBFncjQnNelnwNoJrzsr/z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx17Zbl4V/IOUFGx+u2B11B178tJ+Adsx9HufSmAXinNX0+kl1z
	4R85uFJAOdodKVDNmoX5FURpgGhq2eRV85xIWLDPl0bT5YS/HV0yA4xM
X-Gm-Gg: AeBDieth4C1BK/h1qCwIgcPzMgYp4Knb3eEU4o5uFhTeu20ND9Qy/wLUgaQ/FSiQ1f5
	oZlv6JWV5RTcdnQ1k9K75F5I3pfQ+OP1fgbAbxEoRe1eUnuuDP6G2Gc5c+FN18F5uKP4Ix/E1jg
	q2mEbrivSTGZSw+Q9SVb9vJoVQUpSAcGoa72miDlt8NSXvqX+eT9DmZ01Is9nd4q44xmKXTLQQR
	aiChPGJM4wfGAOENFMgP56lhYMVgJs2gUVkzQ9jvGovx0Q4caGsBN/6EEi22wN0YeTU6qpXf3gM
	RbEblhvjtk+ji10s4VuEKtJ58wonHbDzAIFFZv3+O+/7vH/3omVLNue+oIuEy/wtSXof1qs839H
	juuHWL/fprWyhF1l/MuRVdQkpBAQKnKzru+UsyM36tUB7J8kIA2lDl4S6AJVu2uSNvsvND4OCcj
	vffXUlNNhlI5jXP8XGuf9tPpZ/2P6ToDc2mkc0+SDnQm+dAHs=
X-Received: by 2002:a05:620a:45a6:b0:8d7:3f45:b95f with SMTP id af79cd13be357-8fa86bbe60amr1257684485a.16.1777649460007;
        Fri, 01 May 2026 08:31:00 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29380dffsm185499585a.2.2026.05.01.08.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:30:59 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 02/15] ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
Date: Fri,  1 May 2026 11:31:15 -0400
Message-ID: <20260501153128.8152-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal MI2S ports are found on devices with the internal sound
card for Snapdragon 660. Add support for them.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  4 ++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 2b27d6c8f58f..d8271f1d9a34 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -127,7 +127,7 @@ patternProperties:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
                 # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
-                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
+                # LPI_MI2S_RX_0 - INT6_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
@@ -135,7 +135,7 @@ patternProperties:
                     - minimum: 127
                       maximum: 128
                     - minimum: 137
-                      maximum: 148
+                      maximum: 162
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4342..059f2ea1bd23 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -152,6 +152,20 @@
 #define LPI_MI2S_TX_4		146
 #define SENARY_MI2S_RX		147
 #define SENARY_MI2S_TX		148
+#define INT0_MI2S_RX		149
+#define INT0_MI2S_TX		150
+#define INT1_MI2S_RX		151
+#define INT1_MI2S_TX		152
+#define INT2_MI2S_RX		153
+#define INT2_MI2S_TX		154
+#define INT3_MI2S_RX		155
+#define INT3_MI2S_TX		156
+#define INT4_MI2S_RX		157
+#define INT4_MI2S_TX		158
+#define INT5_MI2S_RX		159
+#define INT5_MI2S_TX		160
+#define INT6_MI2S_RX		161
+#define INT6_MI2S_TX		162
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.54.0

