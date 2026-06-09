Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A87B3EDE7C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991603; cv=none; b=GVB7yLjDJ0ItGMOxDZxNUP+OL7sIvHfyDPLvJ5A+PG2rtxhK1VEMPK2t4K2mq2sN8f7iLoK5lj3MIXQPNbjyx4ys6gFHoTZPE61fJogz4JK06yBnlU93qZhxlshudxQqge1PDgfIoYHK4PomttVtnoNgGq/dE5lfHNqnQKqZzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991603; c=relaxed/simple;
	bh=yYJ5VBN7wBwAYsQ0zlbRkE0xdiTrAcSbG/QNNToAmpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSg5587ldMywKFZrTlBcBEeF8E8cM9lJjJalUCIuoWrh0MB+5S4Kfd2fq1ETyZCHCt7DqDkEYVJv3hBoQgtxYnBHSTZ+m2LoyyntDWZ7fycTiYD6YjsK197CVBVYEXKa1Arvwo4b6JzMLu2LZhLjgLEZUEJKCObhTFVFNXL2Dio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGK78Hh2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1L3oOhH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGK78Hh2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1L3oOhH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rJuf1584053
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 07:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaVv9Eurf6ixxwY7bJNLCZAXbfQRk7/8Rh3U8IOXpwA=; b=oGK78Hh2GvSSk3nx
	gRnEthzbKV089nIAjT+pSAu6UIWXHONVitXv+kCiYNajab87B+rFJbZw9tkGCq5B
	j1v0xQtK8QFmGL4AiAHzvO3DrS1j7d0IIx35SbMpvtzTsRXJqzsPsFplwmJ/7Uik
	xha+82hUokTCipYZ1DCkQE+tum05qEMgwTeSbTBu7/e0n4Qky/Kv7swLuSX18C0g
	g6uS3XehElds/iQla4W4q4foq9qDeMYFes1lTTi5O9+qZi7jVPiUZhNLFx1xcdtm
	WR4lK1+q0aM/KbvRlQQeCaaUEpY4u+rq/tDaV0fQr19uQbHeaLK8b943DzeCPHc8
	vbkc3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeercfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:53:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175b7946d5so43444221cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991598; x=1781596398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaVv9Eurf6ixxwY7bJNLCZAXbfQRk7/8Rh3U8IOXpwA=;
        b=V1L3oOhH+pqUN12byo5Nmtn4RJwdRG+59ehbHvN/X2dVdIEWt0SYBuNCeC/25nmRPW
         8MKbaJrfgXeWi7saPTOq8hHRGHRQQDW2pjiMgH1zswy190UleM0Y14+/bUVS/UZ5OYAF
         QbT45Xwmbf88kbYKq3zUTPKtFlFj4x/tQiRSrM5tIqnsUEh2/N4qT09wphEIaY1safcD
         ++voo/p3XpsQPjxpFAfvofRZI7HKZq6JijICU0ICHRYHg7sVNPAoSjqMTSNwN/qHjbqo
         4FIlWfCTCK0xfWuh3mP1mJIdl3+rIRPYBGPqGRc8b5htK6cga6TaG/sGFMwXPVEBbPi0
         uYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991598; x=1781596398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aaVv9Eurf6ixxwY7bJNLCZAXbfQRk7/8Rh3U8IOXpwA=;
        b=eRdTBxBLae856mwg2A0+0TBHDwZGntgFlWrnCXgyOzkg7mjcUyhLHdLIZfpPs2351E
         4xz7N4K1EZ6h1OINE/F8/9T0x5ml9otJVfH2SwPn+QIVGQznfEtbRdBUKXGsv4RAqPEV
         whe1p8e/ZvgBPhd3kTZYqlfJVzPGGF8T5KlmH9RAOw/LBql6NTSk64pzPllB1T1tJLit
         JE6AxbetL5R35Mu4113i411lpDObR6/UvxL7n1N/gHohcfH/lvHVfXIi5+YcceuhXLk6
         gGHHuuqu0ClGCfdrVbGD3PLuBwMrto/57apSDiwXDsQo4zgYocZhV2601yXJVNirNLVl
         Oo6w==
X-Forwarded-Encrypted: i=1; AFNElJ/Lt07zj//o4Uu3KCp9iKyUL9ulvO6dQGc9eUsP8gVQFsIcAIxqJ3vRIskfo6+H8siP63ijFXrqup4u@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJLvQ8lqIxdRaAAbnB9vbs1SxgFd+zscu7tOSe5QjAWmX71JN
	nXGttWEtjm/Cmoy9+3sYUKUZXcRSCcDcHDsg0P0lcosv8ZlsH3NLm9mL27gh10q5Mx5ZZt10oJI
	8AjJo9BDFsRonhN+9sIPjapt9+BCeRZgRRli0Jvfk8/5pwYCvhM/jFP74xeofHNWN
X-Gm-Gg: Acq92OHDwF3b0ZNMQEH7zuifj0ZYgBbNTW7MpkCrOrBbTnkrkRYsZhFRCiySff6QTKZ
	4tRlG/FrQ+nS1PQ79hW0xxPAbV2j+l+aG+MXdyIPyiYiT80MAQpsHEtWHNrZb6GOSkx1e2QoiYi
	ONLfkf4/5lbW39wsxTMXzmXPt20JkECIOlQNs1rCS8B3qV6DSGlDvWEodGrwngeKuiMAeSByjm9
	uiuKUIqzf4k2FXqPSYZFvbiqeqmokNuXrdMgHC+MW1wrW0x5Rxqy/TL9VJ1BvOUJyirRY2+DL0L
	jKUQGw8vVtJVURPKIh5JlohUglUJDX2Id9wdzGC7hYzixyIFxkURKjFzU3LKSr1tE0ROAN78WV3
	ZKkVG0jau9FZInjiXOJqGb78cwYYfyeqMZPhelCbGHe8wi/DoVDq8N9HEG/cDwseXN5aWJZSm3C
	pRe5sSg3HEkHq/A7achgnptMZWEUXpWbz47ac3cdiM3WHsDIQ84OZoG98K/KJTBRVVM+9uPsUdr
	y98hN1Z2uAz
X-Received: by 2002:a05:622a:1a98:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517a9efd0bemr186043371cf.24.1780991598492;
        Tue, 09 Jun 2026 00:53:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1a98:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517a9efd0bemr186042831cf.24.1780991598097;
        Tue, 09 Jun 2026 00:53:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:27 +0200
Subject: [PATCH v4 2/8] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-2-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27c670 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NCBTYWx0ZWRfXx+aLwd85D9MJ
 V42dikyqn0xJhd18NfrUko2L9X1jleA3cTGtyPqg8+uj+Rbs6rSMJ9mzBxl9wuyJSK88vcVJwYR
 OAKuUtV+yL3+FDoENVrygCRAY98EzwEp9W7hT+TdfQQcA6JbVo3tzVwF28l9aBkjp6r8IogXXdm
 vWGjHeiXShute5S0nR4bJrBzj64u4TFm2yWGgIM+BH67EbpN78Kz6nz4MRBk/idXkjO3QbfWjgx
 mUEsTkWH1DS2GO/FYXnD2hfmBkpVTsgt95gxZ2vy1BYjdOrphaTK6WJWsWuqt2du1PGT9UVxoob
 TebrN3Yt6p0uLkVsLZUMA3SBN1pEvmzJUc6Pcmwhj0N2sZb0JtW7UCKCPQajc7wuJHdPlli5Afp
 MJmprrUchCYwM0zqDexVBYVKrJl9QOsaapTHNDmAXKj9j6rgX6+/2t1p6T8ALakvLPFtzR7WnbJ
 UOuJ5uS1ZC5G0AqbgHg==
X-Proofpoint-ORIG-GUID: 0h3wBofJtsXhYj_iTbfXkJVG5yzCNxOh
X-Proofpoint-GUID: 0h3wBofJtsXhYj_iTbfXkJVG5yzCNxOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090074

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..7391df5e7071e626af4c64b9919d48c41ac09f1e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description: |
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1

