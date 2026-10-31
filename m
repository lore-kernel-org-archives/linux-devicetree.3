Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445749;
	b=0RCrSKSFww8vo/y1SBMQKbZKK7O6vu7pd38PnQAJLrk3DfBl13H+9grFscnq+2IPBqUz
	 WbAvGgYXBx8d0kc2+FqLCspezB9KSJ5OaZMSTBL1+nvAUWE4o+dbVdqinvRN5rOcYTKuY
	 XNmKl8r17eIFuEklttCIX/slwwmA9nbWQFTEFbLousSUhnXOaI9bkatECZ9Z8+4hyq/K8
	 ZlQg/4A4zzMaenHHEfbx2Wcq7NcToPM7EjhX5kPcjzqiIXULMGZqmYzazzUI40KLXAzQp
	 /sCLyimbqcmT4w3M+HMCeZoVbma6Ql8B2H4/T1HU5oRiNv1+GMhxXyx3RYQXxkrHXuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WLBh5BTo8i0xLs394OGDtDxi2667Fm5jki33+xLbOY0=;
	b=YlgWvmqjMpgh6IBBXA2+olabDU1xyLuzma0oLWHyiCBm/edsjIdS9Pf764xeBAbbak+d
	 CufDxQ+lFn6iwG1PA7/6SBnM+tsDRZZM9525F4O3oHAk14NqzZ9kR1X9TUTTwrntHPGPU
	 9s5mEAjR6cIdBRo0JYb6HWAiwO3vSQXo53MBlbjgxBhb0YoZ41hTj9pAEM/mg7FyJHSIx
	 eO8zf2bxam8Hdvy02g3KFCOBcSsqEjhx7wblEO5C+kVgIsHpsT96O8lHh8AJiaGj2rBm5
	 X0RFUFF39CMcGaY20/oHkkF9RKkHIPkYC0b9Tg72kEwZK/Oi3Pe2PdRH3VVvxSdRayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Q89w/7x0";
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A67606A330
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A67606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q89w/7x0
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3c0e7298so2161221fa.2
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445747; x=1794050547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLBh5BTo8i0xLs394OGDtDxi2667Fm5jki33+xLbOY0=;
        b=Q89w/7x0HRK2iT442mfAC0Z/blCfysHmO3lk80m/FjOgkZKEmLtVzj32YWikPqRi4U
         qutZF3q5D/mioJ+i5+kpgidXSzYCX9N+Rs8ZJFLCO4ha7GztoVnDD24V58VAfSdNeicv
         SfjVD36PkV0w7XlWvtZOjTCmaieBbBrOGzLq6Z/pO3IPAKij9Vz7xRLV1mGAi+uX2zMT
         vm0pPHf+yZAFjP9Y2TQFDgOKcj0d7eVx3h86k5+OnW6Rcc/GZLOSbruUJXAenQ76+R/P
         nAW0LGVBxP7mpY3I5VysYCyAXBQ6ysEpwyjDMOR/asLyzfE2LbcQFrwEEk5+TrIU1nUE
         q5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445747; x=1794050547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLBh5BTo8i0xLs394OGDtDxi2667Fm5jki33+xLbOY0=;
        b=tviQLP0sWEYQPvtSDg6q+VwXh9+IvPpR+YPwtUrk66X2jMdpDHvowmKNH2IwuoL4Ae
         kKikONvB0cdK7J8dhW6+S8CErNpsFNlrn+G0a3RWsHAvXcbkVmV1HJUmXxEmyiYUQuGA
         76usT10p4DXif+S0LoJM5ZlitRwaUxvJhWujlLtGINuo8vTbq1YRW5UI4lKwYgiaqpk6
         U/rntKEAX017fc70GZU8KPkCSrrkoVSmEnC0ZVua7VzreQgB3hxPEluvAHj2jlvFurx8
         mX8DvOMU2CtiuhtLcxkJbtc6epVcqTNrwi7I8PoooPhO6KiHBF5De/bXnedDTycWgbX/
         VOJw==
X-Forwarded-Encrypted: i=1; AKwUvBx6QF44nc8AMsOIEyx8egiuZOYaUbuFt+npX0s1LYrJbYJPZtR1tArND7/OEA8unPCsNU5KVp87kY0Y@vger.kernel.org
X-Gm-Message-State: AFq9FYKhHpfx6LBC1//DUrK/wnnbRaqt3YN9DsxrAidiSKjkfo1PetYJ
	JaT5CoBpryTVyc0JCw2OMBCs5bacbBLkhCeHXJnlhTCaEABwJ//DIrAWpWmOUBf8948=
X-Gm-Gg: AYBFou0114Os4c/EyuLkk+51xqHFpdYRayOMoaufYmJhpLW6U4KywMYy9l4AbWDtsiC
	3nUPnC2UhXkPcsPwaQqS0J+9c4+tLExwJ0sya0goKtmgxHuHi/L2nvxkePVryXIfdw/ml1v9LeB
	eItOGy+iBNqi6XUSfTPo+oeC7DX0t/ZIjMPpaA+AaoKBXXRG3EL+93XyN4GUyWH1rQR/iHpbnFk
	bWbOtLcVERlKnArzDeXjMNK0ou/7Pio8uo1uzjbppfbA3LKmOGOhzehrhYSGpVMECggMhgtc+4k
	aC8CRL9Qec12Y3T+wRJ/KNAZv2JcrZv106soDqOUjlXasM6m2To7mheyQdnJkoEpM0qNcBgWvtd
	4yHUCmL1Be0l9Kwb3gDRlCwWo4jYwXp5yWiH9zVF/U956tkPB7TuaT9jU3X2TITGx+PB+7jxvQu
	VBab1nEc13Rqm74yTQ6z5X1Pk05KLBrE31HncKrFDzUp5SHN0Z8MpTZQ1/yNxJ+kfdzE4sAotEW
	RZ1520ymkQEOXETFIjHUb5JTVo6v/FKYPBCOeB1gy2qMKLrcyS7ZzaJ3AWI0575dLWJjggnNra/
	LUih2jDpKaSZgcLHqbpdhGoioGLCwypD5NjokMXgDB3JQ24i0Y7eKyGdD31bsRPU/cAIgA==
X-Received: by 2002:a05:6512:3051:b0:5bf:b9ef:d033 with SMTP id 2adb3069b0e04-5bfd9590eedmr2006098e87.5.1793445747319;
        Sat, 31 Oct 2026 04:22:27 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:26 -0700 (PDT)
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
Subject: [PATCH 5/6] media: qcom: camss: Add SM8650 TPG support
Date: Sat, 31 Oct 2026 13:22:02 +0200
Message-ID: <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks
of hardware version 2.2.0, add their resources.

CAMSS TPG on SM8650 needs the non-real time CAMNOC AXI clock to be enabled,
otherwise VFE receives the frame start event, but no data is written.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 53 +++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index cf4687a20dba..9eeb7e4a7315 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3423,6 +3423,57 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_sm8650[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+			{ 0 },
+		},
+		.reg = { "tpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+			{ 0 },
+		},
+		.reg = { "tpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+			{ 0 },
+		},
+		.reg = { "tpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_sm8650[] = {
 	/* CSID0 */
 	{
@@ -5786,12 +5837,14 @@ static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_sm8650,
+	.tpg_res = tpg_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_sm8650,
 	.icc_res = icc_res_sm8650,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
+	.tpg_num = ARRAY_SIZE(tpg_res_sm8650),
 	.csid_num = ARRAY_SIZE(csid_res_sm8650),
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
-- 
2.53.0

