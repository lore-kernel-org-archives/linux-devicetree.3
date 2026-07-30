Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEF43CECC
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433471; cv=none; b=M4os6nOZKq2cRk9xJx74wzLnRooKu6+B3zroNLlMAE5yVAFHkpOp7V5qHqKrENWQEe9FBA8z6ixP9Mx94oVbIrd16vixnDTxsA3OX5f8SA+o7XtdNIcsKcW/2TxLmTdWfWCUz0dtTuWroEcaPbhVgOt5AHmOWgbJ3k/Qfp5HWoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433471; c=relaxed/simple;
	bh=5fMhKcDWpa7dY5BcsYs1zzrViozWerl+6omAqAxfJnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyxbYM6o70qKC9SvYcRYhhFU9hExY7gcrdhSFMre9S8K7aJDSJVAVHKju/GDw33J+xp5pDpMigTQCmX+Po1/E2m9JEVhGnMWFsoURCv8FBe89F/4149jPUPlHiGxQBkRDdhyMPGG96xdzNa3Xf968tinp5hPZ1D14cb6UVlwbXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrkG7llD; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrkG7llD"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9063b380982so1683676d6.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433465; x=1786038265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3hlUljRp3q47lLHfumfh1cJ5PXzppN3HfpTRpk5Jl8=;
        b=QrkG7llDxtXpdz7Dag18GvrPRPW/QAimpPuGNjh7lUmjs6i+DpW1BtE1Van5ZFU2Pa
         VVYOdAqUqIhKfdmL1nfC7b5GJm0fwy63VjWWhDWedFDX7regWwiHBvwo8+bnguMiy2Oq
         i6PyySleGjOUONe9MJMRB7BBq/N8x0VI24TE7IMeD8lau0EoYjPXdLZu4FjPz5gB3onL
         7d5Q2MnK2mwcAof24e1IhjUZ7ML4j807JYynDk71CvyEyy09lSKoZDyKL5zNCqdBkCjG
         fH1wIZVw5nbbCNb1H87laPQL+eJ2gWi+4NAI5hI2XhO9TjQeF4Yec71f92llOGnXZ/0P
         OHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433465; x=1786038265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x3hlUljRp3q47lLHfumfh1cJ5PXzppN3HfpTRpk5Jl8=;
        b=j6zidflv9KMcbS3REhOX3j+S6b+t67PrK2cvoc6JvrgAIjhA/9p1Mpc7MgBwGLM5dA
         TxKZhcZCevDIwSpVZeGCjxjWP8udbEmsMzeQU2FM0iXy9R778EpVMKsk48yM/nl6lspF
         YneqbSRQSxHgzXVuZLOfEZp4zqAcVzJ8WvBBmeRqk6M+v3BEOOa+ivSFFuIdjL0lu268
         QYM4cJ7E7dMpofCaRZpCza+YCspYnz3/TmtW5YnYwSg+LXJXfq5jhdo3o+bF5ee497u+
         XKqPF6gZO3tG326lElRq28VSFM2nSzKeja87nZdm0BtAU1KsdeMjMQgowOB+5S3SGJFi
         6TWA==
X-Forwarded-Encrypted: i=1; AHgh+RpwpabRYHue6DvQo8yMpkEBnya5vPi53r7ovuCfJxnAhWikXXUAXs0A9VXSO1SI4nCd5ChjAyVyuVMh@vger.kernel.org
X-Gm-Message-State: AOJu0YziKjxApStkDS62r7ID3cTSVT8M8wQd0Sh5HFCoENOvyHH72hEN
	jUwC0KnZ16UEFkBLok2EH33BEwH76AeGxDs8+l2sfiapEOBzQYQXf+sU
X-Gm-Gg: AR+sD105VTV3YoLWAWskOccX0Es2qQ6fuoTZFPFAtTOqN0m0XUM3LREIHplEX3ChQ/7
	L0XnyG/uUQAUIbFN/aTmEGwo/SzaZMFv6JsRFv+6zGKOMRP6gyWiZlnbA+Z7E103XOCGrMx/yWU
	/Ex1ITmdqINKWno/nZBHljEc0NcJjWJJK//oBbsWU7XTVIi9Kcpqf3222rjloSJh6MAz78Fp1AT
	iZU6y2Tst60tkR5ZbxOC2zmId+FGvXaLnQBZM/SuOu08S2ZVdmpXVSHus7VibHcK+KN/q2STrgs
	vW9SiRQVJISRsxUyF2YA2//8QJE7IrBdDgfxcgXBQ8JJhJ7ArRQBuKdUIIK8Gf6QLmTZKhN7qGN
	cRqgnegnYzRDGqmh7jrJ0LXcjZmSLKTq2HI4V8CostS+o3PJWfNQZUq+Uw2eZekUNZtvqHpTIsR
	sEQIA9bOdsUrBX/VMvgHnUZ2OOSOrOVzjPAxm5wHl7qU2hU78ZUoZdgsBFoRk=
X-Received: by 2002:a05:6214:2302:b0:907:88cb:2ac7 with SMTP id 6a1803df08f44-90834720298mr35107846d6.24.1785433465186;
        Thu, 30 Jul 2026 10:44:25 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908323e7697sm22559446d6.25.2026.07.30.10.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:24 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 07/15] ASoC: qdsp6: q6afe: add internal mi2s support
Date: Thu, 30 Jul 2026 13:43:45 -0400
Message-ID: <20260730174353.108023-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bindings for LPI MI2S ports, originally exclusive to q6apm, can be
used for internal MI2S ports on q6afe. Add the port mappings for
internal MI2S, found on the Snapdragon 660 internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 40237267fda0..1d68a80e8e0c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -132,6 +132,20 @@
 #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
 #define AFE_PORT_ID_SENARY_MI2S_RX          0x1018
 #define AFE_PORT_ID_SENARY_MI2S_TX          0x1019
+#define AFE_PORT_ID_INT0_MI2S_RX	    0x102e
+#define AFE_PORT_ID_INT0_MI2S_TX	    0x102f
+#define AFE_PORT_ID_INT1_MI2S_RX	    0x1030
+#define AFE_PORT_ID_INT1_MI2S_TX	    0x1031
+#define AFE_PORT_ID_INT2_MI2S_RX	    0x1032
+#define AFE_PORT_ID_INT2_MI2S_TX	    0x1033
+#define AFE_PORT_ID_INT3_MI2S_RX	    0x1034
+#define AFE_PORT_ID_INT3_MI2S_TX	    0x1035
+#define AFE_PORT_ID_INT4_MI2S_RX	    0x1036
+#define AFE_PORT_ID_INT4_MI2S_TX	    0x1037
+#define AFE_PORT_ID_INT5_MI2S_RX	    0x1038
+#define AFE_PORT_ID_INT5_MI2S_TX	    0x1039
+#define AFE_PORT_ID_INT6_MI2S_RX	    0x103a
+#define AFE_PORT_ID_INT6_MI2S_TX	    0x103b
 
 /* Start of the range of port IDs for TDM devices. */
 #define AFE_PORT_ID_TDM_PORT_RANGE_START	0x9000
@@ -931,6 +945,34 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 	[RX_CODEC_DMA_RX_7] = { AFE_PORT_ID_RX_CODEC_DMA_RX_7,
 				RX_CODEC_DMA_RX_7, 1, 1},
 	[USB_RX] = { AFE_PORT_ID_USB_RX, USB_RX, 1, 1},
+	[LPI_MI2S_RX_0] = { AFE_PORT_ID_INT0_MI2S_RX,
+				LPI_MI2S_RX_0, 1, 1},
+	[LPI_MI2S_TX_0] = { AFE_PORT_ID_INT0_MI2S_TX,
+				LPI_MI2S_TX_0, 0, 1},
+	[LPI_MI2S_RX_1] = { AFE_PORT_ID_INT1_MI2S_RX,
+				LPI_MI2S_RX_1, 1, 1},
+	[LPI_MI2S_TX_1] = { AFE_PORT_ID_INT1_MI2S_TX,
+				LPI_MI2S_TX_1, 0, 1},
+	[LPI_MI2S_RX_2] = { AFE_PORT_ID_INT2_MI2S_RX,
+				LPI_MI2S_RX_2, 1, 1},
+	[LPI_MI2S_TX_2] = { AFE_PORT_ID_INT2_MI2S_TX,
+				LPI_MI2S_TX_2, 0, 1},
+	[LPI_MI2S_RX_3] = { AFE_PORT_ID_INT3_MI2S_RX,
+				LPI_MI2S_RX_3, 1, 1},
+	[LPI_MI2S_TX_3] = { AFE_PORT_ID_INT3_MI2S_TX,
+				LPI_MI2S_TX_3, 0, 1},
+	[LPI_MI2S_RX_4] = { AFE_PORT_ID_INT4_MI2S_RX,
+				LPI_MI2S_RX_4, 1, 1},
+	[LPI_MI2S_TX_4] = { AFE_PORT_ID_INT4_MI2S_TX,
+				LPI_MI2S_TX_4, 0, 1},
+	[LPI_MI2S_RX_5] = { AFE_PORT_ID_INT5_MI2S_RX,
+				LPI_MI2S_RX_5, 1, 1},
+	[LPI_MI2S_TX_5] = { AFE_PORT_ID_INT5_MI2S_TX,
+				LPI_MI2S_TX_5, 0, 1},
+	[LPI_MI2S_RX_6] = { AFE_PORT_ID_INT6_MI2S_RX,
+				LPI_MI2S_RX_6, 1, 1},
+	[LPI_MI2S_TX_6] = { AFE_PORT_ID_INT6_MI2S_TX,
+				LPI_MI2S_TX_6, 0, 1},
 };
 
 static void q6afe_port_free(struct kref *ref)
@@ -1785,6 +1827,20 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_QUINARY_MI2S_TX:
 	case AFE_PORT_ID_SENARY_MI2S_RX:
 	case AFE_PORT_ID_SENARY_MI2S_TX:
+	case AFE_PORT_ID_INT0_MI2S_RX:
+	case AFE_PORT_ID_INT0_MI2S_TX:
+	case AFE_PORT_ID_INT1_MI2S_RX:
+	case AFE_PORT_ID_INT1_MI2S_TX:
+	case AFE_PORT_ID_INT2_MI2S_RX:
+	case AFE_PORT_ID_INT2_MI2S_TX:
+	case AFE_PORT_ID_INT3_MI2S_RX:
+	case AFE_PORT_ID_INT3_MI2S_TX:
+	case AFE_PORT_ID_INT4_MI2S_RX:
+	case AFE_PORT_ID_INT4_MI2S_TX:
+	case AFE_PORT_ID_INT5_MI2S_RX:
+	case AFE_PORT_ID_INT5_MI2S_TX:
+	case AFE_PORT_ID_INT6_MI2S_RX:
+	case AFE_PORT_ID_INT6_MI2S_TX:
 		cfg_type = AFE_PARAM_ID_I2S_CONFIG;
 		break;
 	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
-- 
2.55.0

