Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ECA3BA22E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987261; cv=none; b=myVtvdtNgZ0iruEzK7rM6nubiHq7+ZjCBM34Y6aDh2ZHWIolDXKXcrHM5WRY4IwUUjGqkjIElrWoGcltEry5l1l9xd6wCHDulfklrzPBNvhArM1oQ6YN3dPKiyX4seEnthzZYneThPlD97R/KdLv3B567MYQUw2ZEZQRqlTviKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987261; c=relaxed/simple;
	bh=SUp45uL0Cj9+ZynVF4O6v6DjZsBdSrnlPjW29909kZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S+i4zwbIBUHJse2NxPwsihu6gscpBD9Rw/u8NgIv+y2FRdPPqCsmLYO8/7Bp4UwGT7qC3J/eCdsU95MSfoFXAyb9CLgkp8ay2AntjLxwcFCl6JKBUaKdB/fFTCRD+7gj39FprS4W9mf8lTLmEEDMKQzk2KKSnccXPrZqfTWrIOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYKDhWF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmeiTuU3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYKDhWF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmeiTuU3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wi7R1509589
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 06:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c75jWvAaoCA
	pv/IIOdNGer60GpfGqCeVoO2cPGCyclc=; b=ZYKDhWF6gYt+8FKsxPmYrCH2k39
	4ElPvVKrdOmoXYurPRIzQWcMLKq6JMAOhVlRvZPNwd8r+BhI1itxVoB1tQXVFkj7
	PcNvNaiU6olFBgsL1WUO2OAg5ZEwyi4MlGWQTeVDxYpEjB0ZKf9wmjBelqluF2Mh
	WTS79BOzZilCLtqgcaE+/LZalPHtknkGG88jwDpvw/I2MBZo0Q58iXKUul3IylHP
	cmbkU6acjNSaXDOPINQWOMTV+bihURpPb08B4mO67eDtf60qarMAsOTSy9Lp0AVy
	VKcBxfRsgczVgs06P7BRIi2VVcaB/jITtJtA0IMrftHo0GRcZQb7roj767w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee41na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:40:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b74447so4043186a91.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780987258; x=1781592058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c75jWvAaoCApv/IIOdNGer60GpfGqCeVoO2cPGCyclc=;
        b=NmeiTuU35xt4YtKrqvuWjDlQit3SRfAhAHfVnFUa+5Ux0PhmJkbJ5cyGclIe6oDbHL
         ryNqaNcDcedv7GGOVJELjX2ya7fdPLQlAVXU7PDkgXtCbnVWWtK6TTMPRSYoY2EK8ypH
         mhUfRuY6MyUpzY7Aip0GDAchuJiMi1sa4lWngPpC5rRo8VtBVTxPwsTgIH/qxz6RWlOy
         t8P5imWfflHqwv5vC27f+hrMqfEdDK2TeevEDu5lpTrRc/2p97gYGqHWPHROY6NDZOJX
         T4tV5YMboY1rnnkx70mHezCZAHbRp58zWFKJ0ANhBnSQRZxa5D1iHWIiFc2l2BovEG17
         JFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780987258; x=1781592058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c75jWvAaoCApv/IIOdNGer60GpfGqCeVoO2cPGCyclc=;
        b=aiPJgKW3MHmzSb2XGv81INFsOss81fW9/NKwORzN+J+El3CocJQ9WQiLGI9Ha/JiOb
         djfA/8LiPmNbnX68+j+mAmFck8XGWeyjlUy+hhcBwvljYqnzzlw3EhRmuGWV7lb0NuDB
         KRSAcbYzXPgiafZ7XPwR/ch2d1unjs6zM9eVlf6AfOiYomJEFYYHyPhKsoqGvYHOC92U
         G7ZxCRLwF5I9eQQysgnZEEBl/Ub1uY/i27plb+Lrbdrn0eunRfK+08TBMwUktPD+GhpT
         A0Km4az3VEd31tV3/mRTMWBUugI8+vi4um9K1LvzHr6ZxJyUeDDGFEh/ybku1PuyPhuW
         Urnw==
X-Forwarded-Encrypted: i=1; AFNElJ/Dce6j6kxmiONvxLfmcf6lwxPNL94FAmAAOYs/b4I4YQ+IIXpHCFaymeifiDjud2YB9omq4iPbgZgu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv2Xp6TpV5aULQugVbYJw47Omu41IAO+GV6y0mmk15RJ61w+8i
	TncJIxKY1zzvw4QO3ZunkSmGOSPGWAXMqyOo+OE6EpFV+BnTaikEQHpnLS5QZWeqWbIdriqLFXP
	Foqcdz8cxxQGdCjOdOtVUpWplWD5tucW9nGxB2HHye83DRHmB+83gKwQ0Eqc0BiD4
X-Gm-Gg: Acq92OHvtdWQAM68xso5xtmWZMcZsjJL6SLidthrdzbmxnqriJ6fOOhKLkz0ke8pg/c
	Mj8ps94Iy8qxpsLkSOFT74Vj+moZg9vxwn2XHNHX/XTO5OPWicccSYzjWMSfU7ObLwldes/jkIu
	H+Izc6Dy3HZ0WezJ830xTRsDsLUcwEpFf7wjeEqmfx6UakoLSnP9OpnsWabDYT9r8gSa1a6pyvk
	oPAJJTpaQ8qMksjp65bsZ7kUf+jzuHX6Lz2b6AR+btxg5PBbT9jweQc1zMfOQ2gOsl/I9Of0hgX
	gf7+kYGzKtNKoRbHT+HKBOFH619ll34uoCDS9dOSPp6yNClNQjNt2Fms0EiHUwKoaattccP+RwU
	kaUUrOaK92r32yBHmu9hMLa5j4A2zYAEy7YQFjY4eWKnSavEYBFqbIxtUfELc
X-Received: by 2002:a17:90b:3ec6:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-370eeff5ea4mr21160265a91.9.1780987258480;
        Mon, 08 Jun 2026 23:40:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec6:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-370eeff5ea4mr21160226a91.9.1780987258054;
        Mon, 08 Jun 2026 23:40:58 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f9bsm17898953a91.7.2026.06.08.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:40:57 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/3] dt-bindings: sound: qcom,q6apm-dai: add optional qcom,vmid
Date: Tue,  9 Jun 2026 12:10:36 +0530
Message-Id: <20260609064038.492641-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MCBTYWx0ZWRfXwA+Qwj6PeOYt
 FvTSDjJJhoNiWF2VvcmejbhyFOpA0kMlihe00ILvMRuPHQKjHFzLrfJlGqqr84MfRJR5pg19VuL
 aWacsIR+8eRCfyAfXkhN39w30clA+CbKGX4TORoPJDmS8jhk1c0SpKmWvUuL94GQVaXJohwNmzf
 fh+u280E82fPrOhIbfkfkfLrlD1t9HXV2Zl5faIRHo6JTKaUTjA+qduYxI6Hl5J61p+haYfFKfd
 u0Z1N3M9s7HZg5w+G4vst/zXpErmtPPXRXFc9ZHhE/7rlGZkEfKzFB9p3IHc9iWGYiSvuhxEWR/
 gOeYSCkg2e9dyla2ltZikisMwGT6HAY9Gj74Y3pBAQ1F/z5Hg6bex7hcH4EcWVq4vgj+0sxSxiY
 Q+CL8nw9gM9W0HOOQlUX1ZWEH3fKPZKvS18lRLX32iAp3c+LQPhwduCA2hSIu48N5fmXDlKl7Qu
 jTdohwOpRfWjcu4TEJg==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a27b57b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=CLXHBV2uJxG-_-RflmEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DuuFZW5fYzNlIxegqtfY5D19Gdq1PnPL
X-Proofpoint-ORIG-GUID: DuuFZW5fYzNlIxegqtfY5D19Gdq1PnPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090060

Add an optional qcom,vmid property for q6apm-dais nodes to describe
additional VMIDs that should be granted access to PCM DMA buffers.

The property is optional and bounded, and driver-side validation will
reject invalid values such as including HLOS in the list or VMIDs that
exceed 31, matching current SCM source-permission mask handling.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..b767625985a7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,6 +20,16 @@ properties:
     minItems: 1
     maxItems: 2
 
+  qcom,vmid:
+    description: Optional list of destination VMIDs to share PCM DMA buffers with.
+      HLOS retains RW access as source owner and must not be listed.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      minimum: 1
+      maximum: 31
+    minItems: 1
+    maxItems: 8
+
 required:
   - compatible
   - iommus
-- 
2.34.1

