Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5996447DD51
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813137; cv=none; b=Rr447dgqwOI62/efHGvWxOKM05hCHADtqhlBHHpCaCT/ZtNWkdnyAFKtmCX/sHITmf/qFVosT4GR21j5vcWjavna3LSLrtPeJbULv6iHnZ8DSTAyyVkvRMlJurLgDX3o1zpt6cMNY6NclLw7DVJTWHcUJxkVb/nyT9TYnk2XWnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813137; c=relaxed/simple;
	bh=XvgF8W41tbW2lHMVahBlNpldH+YcMd6GhMO1LMhmmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EC3IezWLBcW4ALXAfsIq2QBQEXawBJdKAiWClTetSHU6E4I3723XscuLMpgagMZ1lb+R8wO9i2gdJrHh8fdNMeGE23zKHerLbx4WEuLfMX8BGTp4QLYb0QoDB1rcarLkx9z31+ypK/xR1ODxo6lv889WiVJJmKr1tskZGepGjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=NesgzA9v; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="NesgzA9v"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1112245f8f.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813134; x=1792417934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=NesgzA9vqb1/X6EzJJ1AiUpBokHcMgKVFQDgOFO/xHL/z9gbj/0hltm+1n5SWbO8A8
         9zUGL0dyIA5XHmquCymv203Ko4rr9ItaNtKsGUDQF8AXm5t+VydPwWiVga9gC0PYpj7B
         c2GlgT0qZxlqXKABanP23HXbiswZ0Xxkt1P5j99LOTASIWZx5ssqQYTqNV/LRmCd0jFd
         9IRh8YaggtDrf+uXMqp7BDvzr0ThgtznI3dP+fsV69LPOI+K6XULXkFRHHLWQS+V4Erg
         h/+TiZu1OSZRivIqBG057PPw4blkZT38tgthcyUU3Xxpgh8CM0nk/z3qPgzOLTqQHe9I
         AqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813134; x=1792417934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=zGX/od6En5cwH6XBFy1PZG2FFnhUDidpGJnQQELxFodKIe+lu/uivyw1cL+rGHILZg
         Kz+lzIojuoIqgZLurHXs9RRQWQdaIrSeuuvGaezzx/56Hw8OdaAfYu6vDK+b9iZ+gZk0
         n7UGeCozkiY7w7mzwxHEdDCoB21VTkzlHVAFjItuqREuGmb0NtonPuvw/Oj2vwWpZEKg
         OyZ/+B9YSy4SveX5r5CPvJ+UZt3ZQwkN3uobDEoEZOYbbShvd2tjK0zlYT8afgzKh+0w
         jTLHbBPv251GmvSWKj0mz39UAiwVbGjioBNtCgnlVHwVyCyxxHw1DAOO8x/OSY9TOwpH
         naTw==
X-Forwarded-Encrypted: i=1; AKwUvByz/Ph/6YoQ3SsQspMFXEa8sWMrpjNO1KOESv6tIICzIsokhHTkmIof4CXYTaanGEcgbGqGWgKxdmcY@vger.kernel.org
X-Gm-Message-State: AFq9FYKtXFagxJjWtLKZxTPsF2IYoHvrIjy3mfe4IUEtVSl5nMnp3t/k
	O2Yr1mtBBoD1EWcDOP/p4QJB/JIgA6FwQq6N+tyX9xx8K/NomC78RHYFXGouiw2AFTo=
X-Gm-Gg: AYBFou37h4ktg9M6h6F8+09jIX+EClCalHIGyurL/AMUtgUjKWwJhaTD7Bb0ljcUOKU
	O9R+k8Et8P+3NShf+vEptYaHgrJRHKInXqCd1BdsCkG90XXYs9mo0nA4T2W4D+xYdsG4e3C048D
	u8Ow8kUG1rAWUvmuQvIFJGwdcZUbcHUQw2H85eYuXf7EMggqUcmygwly+hHmr5yRtxlARI9nByb
	7xSUWLxaniyQdKwg8n/4CLZI+y5x5/JgOAjh/i1Q0eA1xjoihAhkpMBTMa6l5ZGmLUfmCk7c41n
	VTIm31/OGH39jJDvmlXpf5q+ZEej8dhHB5ALeXmIC6fdyVPbtJIPU7Y1nn0kDOJfhtrBmCxmlRg
	C0Z/e+J7ztbtmfUEbS3/WSHsy53VVq36db/sO1ne8vX/1jDt0F7zJ4h1gfPub1SGJQMb5sHO5om
	jUndwxtzdBm4BFeHUT0KBYxb/NOTvGwz/FNlXw1XlIyNAEcvTaap2c3iirRW/exa5+pCpFTdc4U
	4OP7vo3/FB5R7jn2bk3Id/wyap8WZQpAYRnklapF5rxj/dn//7Tndc09UrNCYJXU+HytahwWxyF
	GYFXCIvy5Olt6QrWntAi6Q==
X-Received: by 2002:a05:6000:2002:b0:48d:b940:af77 with SMTP id ffacd0b85a97d-48dbace21ecmr16666213f8f.36.1791813134645;
        Mon, 12 Oct 2026 06:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:13 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:52:01 +0100
Subject: [PATCH v2 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v2-2-06dbbe36ecd2@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The SM8550 TPGs are hardware version 2.1.0, the same as x1e80100,
so describe them with the gen1 TPG ops.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5128dae79103..70f327484503 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3553,6 +3553,54 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 	}
 };
 
+static const struct camss_subdev_resources tpg_res_8550[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources vfe_res_8550[] = {
 	/* VFE0 */
 	{
@@ -7245,12 +7293,14 @@ static const struct camss_resources sm8550_resources = {
 	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
+	.tpg_res = tpg_res_8550,
 	.vfe_res = vfe_res_8550,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.csid_num = ARRAY_SIZE(csid_res_8550),
+	.tpg_num = ARRAY_SIZE(tpg_res_8550),
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
 };
 

-- 
2.43.0

