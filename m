Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541554;
	b=j8M3Up56wOSEKWQs/xo0pCghd/EJ8FFreIazU5TYJpSfOoIe1j9mMvZ+9/F/3kbWHFoA
	 4ZIpy51FgoGju7UckQIkL38sVrOmklCmpkk+Kynho6k8PAvPt5fQu+bc6glC5EsqjCAGy
	 SFpJB8nq8/LLUa3ix9iuv/bvwd1zcoT9SAIbhigy0HW2LyBuYKTTiv3NJ920LLO0QDcwD
	 QSfZPtPZLrFMVaEgqZYQqTPjgoLE/v/T7t1Cp8ZCZn+Xg7LLwxkv1XkdeNX6oihHV0Kky
	 iSxbNOrUgs/My5xb4lLFo2g0AI8NB5WWB0MIJHcjibDjCzOzho0qh+9Y39PIKeNGfNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TbewVFmdsysxKcuCrQdCyj2xstkq/s7NHCPBGmFBVI0=;
	b=Dm2ttqGNI7Bkl9IcVuprINbaBxEk9fIH1zagLwBuAoGFk2Nxu0fFfr9EwVFaMA4FXGlW
	 y52XfzneRTyiN23Nnf6IobaL2/Op04B1X0nbWtjvuMqMNUWCEdwKwYtaWqt1LK/kzQI/F
	 6E/Ad11J6Eklw1C4UWEChVtSBa6/iAcpamCqMrxNSL9w22PHouvciZYwAYEg766BNgihr
	 SPkz9KjXMV98qgOUBYbf8C16FjkzX1lZ2VbjcVFzOn4oWYgMh6HOie8u9CECcmHwUjKxF
	 ao1koxnf4HQyXMR3Kel0zXn/LxgMNooXnSyAKL+EArW+tUmiAcn2V1g9jy54dHOESEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hw84uXTW;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8254F60A6F54
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8254F60A6F54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hw84uXTW
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a32576da88so2799026f8f.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541553; x=1796146353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbewVFmdsysxKcuCrQdCyj2xstkq/s7NHCPBGmFBVI0=;
        b=Hw84uXTW5QzwYORsvT3bCENub/kymeSn9FubY6WW3pY+KTXS95TEVXvk3aMmWV7/T5
         L/E0jCVfH35jtcYFGIiCwMe2GBrxexE22wBj7RotWUGXn9Ih8ZpOrCSwxhgXTEWYzASk
         NNNe3l2CYhMkgELGoRZtRjk+fShw6yq4VosL0RTw6mCVUR6tHXrdlfhlRfvRfZEFxv2r
         /QgBzaTjmLHaY/+9c1xbtpbrL4Biojgz4y1gZ2OeQTm5IHi+wGnRyr4gdEUdE7yHPU3N
         73DKZ+DxDCGOZdqFkVcFSRyin/ozBRcgWVm6vPQVnONT0QngTz69fb/9UZ2wH+qsoJ2E
         HtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541553; x=1796146353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbewVFmdsysxKcuCrQdCyj2xstkq/s7NHCPBGmFBVI0=;
        b=oP+qEVeN1P//lpeUr7pqJ5wMd1eu9CvmbFon3vFYHMi7vtKmweWgQDkc5IJ5JSL9yG
         21enQUW9pKO4jjsUF0eAmhwT9osDNXPMLh7lZJnAEgwHNnTltkFajBWypgea0/g8AO9P
         vN/BOye7d9ARiEPwfIU34cKb2HN1Txaz99UKm61VJILre5vfHJKuxM2rsgtNHEjKeU6/
         BxyI9srqTsJfHOk9wLASA/BxLRV7iiwN+o/XvxZut0ruM71qp/K5ubStn+fa0ienFga+
         HIVUnvtHVKaC3uGMzbmrzMDEGUCbEZ3VIYcamgrKSMYvno1MzzjbV2RiT0nre7YrbGiP
         vLFQ==
X-Forwarded-Encrypted: i=1; AL+hErFoiHBjU23Mp8hwRFQEH0b5vZs95iVBjN/k9M8r/9X9W87KP3jhvzdQZEGjKgYMecSvaKRrhGe539UV@vger.kernel.org
X-Gm-Message-State: APuU4Z/kO+zcXiLsFAF5umL4jxkBOKgLCEeMli6eo3CXiewXsuDrUPbG
	mRJf7nk2U6O3+wvd9XKBC9lF2LDF/Cp0cCr9Bl7fr9o2+eQsWvUttyFv8V2JEu5WeQ4=
X-Gm-Gg: AZFdTZcEiYIp+2G+zzVBuneTnIxVp7WmrVorK8HURESnNfOgR8B0DOe/kPu9fNCcnDV
	8aifaZE3D0jGQ4xA2R6GpNEOaApqU1SxFMXf6Iqxe+BopgASy7c9E2pRCqFCPMV0hBO+SlTvpG4
	NPbOCOySY1rslSj0L7iZ8sM6eVEqXMMybV7pPZjVhe603eVG3Wym7CZAuxiqQ4aq+69RLLeATXn
	BDiuWipvFjvfCInv1bxTYebvPYwNxd0C935zQivPcHBdUfP4EifmJWXjFR5VAKj5Tduksu5102X
	CksodBuPVdTEAuookKcGIZacNr7V//fyCU7aBgHgAtUmeixTYGdwmve5xpZpX+szhLXdeMtjAeN
	ZcM4v4SBlKxwYjZM6BvshmRSQGj5slZqtbGeKez6Eu85MOhcODZvyWrJZ6c3AQo6AGcQFZoNLDz
	DpRlGFKbRZEFJ9qk4NtMpDtTXLVoVmjWGe9I07E06KpQAb7pfsCn3i2+8FiHxhSqeYwh1mL3Ayk
	JfF4nLMDTb0QrZ75aqPe6x18ioQWTutt2szbfGKMlDIWE1Vr0pSMRYBYyJ57gjfswZ0y4qzquAq
	ctHMbC91i9TZurMe7M/uea3VXXWHSmOdEQfjUxS2/bz0xcSsjNv7BLybemycpMunsDNRJizU
X-Received: by 2002:a05:6000:2f81:b0:4aa:ba0f:c1a with SMTP id ffacd0b85a97d-4abb683bca6mr29226251f8f.40.1795541552768;
        Tue, 24 Nov 2026 09:32:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:21 +0100
Subject: [PATCH v2 14/19] ASoC: qcom: lpass: support LPM memory type for
 I2S LPAIFs
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
Message-Id: <20261124-topic-sm8650-el2-v2-14-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UX1Tne2tKvwx98oB7eZ/uqM9X8LAabEMp74ho5pRl64=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcohpXLNvWL3V+lBQmfD676YMbuAgG9ra+C6YI+m
 1L9KO0uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIQAKCRB33NvayMhJ0ZHtD/
 40aEIUN4VVreY09hOgfTQLQtRL4HgwM2k2llV8ULvXQYQhAqogNznOG5E1HvO23H/kH/xaCnvtVxNs
 VYWpxQO4La+MX5pWteY6lC7QrHundZl1dsU1+ayFc/0hILypl39hnl/Bq2rvnTc1lpsrE87PuGraEB
 UXazbn23+Kz7JOzLDepF86k9LlswPnZ+rnYeA15UdblMxSRI0KuNY7npHWaRp9vbwT1QC0kIV7X/EE
 rs6Gqcn+pZoom7DMjoJERoclsbIuRRt8zeiRoD0MaY5pIB3Gpbq3WJaRTzM4JX/j/AbE+vikxH3MRK
 yl775Nd1btB2582Xki/EvtHBldRbuBSfZvUavTp/ML37dSIP5lnACOLm/qDmfO+cTeAZ5CIj/2YVSe
 POhWhHk+iNTj8ELQFxWPpsHXhK0t+DFwAASC/OdvOiwCMb2RDbFu0d/IG4uKeyzea7IeQZ2G5U5EW8
 Hh1svmNDhVj02IvL4KSjkekGPv188k0YKrZlIpsyj+w8leu7JSxvMaJVRgaWzA6/O4riKsGTUrJxsL
 GOkrfzqK1T8cxeCBDiWX88juu/06zybtZb3LMqsbaEG1Pn0ZYieAc5OMHGuioDIj6y7TFhqmwMBZKi
 vJOv9KA3WbNqpomO3TiWD5/33pmZX1wNCfWPmZ45iR8/zoFGAj2KdTYREvlQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When using MI2S on non-core LPAIFs, the hardware can only
fetch data from the LPM buffers and not from DDR memory,
like the RXTX/VA/WSA codec handlers, so add a way to describe
which LPM memory is used for each LPAIF in the MI2S
descriptor.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c |  1 +
 sound/soc/qcom/lpass.h     | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 902ad6554510..a83507c2cd55 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1437,6 +1437,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 						&drvdata->lpaif[lpaif_idx];
 					drvdata->mi2s_intf[port_id] =
 						desc->port_desc[lpaif_port].intf;
+					drvdata->mi2s_lpm[port_id] = desc->lpm_type;
 				}
 			}
 		} else {
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 70d64bf3f073..71f1274dfa89 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -153,10 +153,17 @@ struct mi2s_port_desc {
 	unsigned int id;	/* DAI ID */
 };
 
+enum lpass_lpm {
+	LPASS_LPM_NONE = 0,	/* DMA buffer in DDR */
+	LPASS_RXTX_CDC_LPM,	/* CODEC LPM */
+	LPASS_VA_CDC_LPM,	/* VA LPM */
+};
+
 /* Extended LPAIF MI2S layout */
 struct lpaif_mi2s_desc {
 	const char *reg_name;
 	const char *irq_name;
+	enum lpass_lpm lpm_type;
 	struct mi2s_port_desc *port_desc;
 	unsigned int port_desc_count;
 };
@@ -197,6 +204,7 @@ struct lpass_data {
 	/* LPAIF instance and interface index of each MI2S port */
 	struct lpass_lpaif *mi2s_lpaif[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_intf[LPASS_MAX_MI2S_PORTS];
+	enum lpass_lpm mi2s_lpm[LPASS_MAX_MI2S_PORTS];
 	unsigned long lpaif_port_enable;
 
 	/* low-power audio interface (LPAIF) registers */
@@ -261,6 +269,19 @@ struct lpass_data {
 	struct lpass_sstream_ctl *sstream_ctl;
 };
 
+static inline bool is_lpm_mi2s_port(struct lpass_data *drvdata, unsigned int dai_id)
+{
+	unsigned int port_id;
+
+	switch (dai_id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		port_id = mi2s_port_id(dai_id);
+		return drvdata->mi2s_lpm[port_id] != LPASS_LPM_NONE;
+	}
+	return false;
+}
+
 /* Vairant data per each SOC */
 struct lpass_variant {
 	u32	irq_reg_base;

-- 
2.34.1

