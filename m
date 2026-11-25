Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565212;
	b=yahbQC1J+QMEtJ4DWoyCQg09qEEP+E6bHNz1uuKTMOi45GicM67TvuMgAxaRtDs1mKRG
	 qeSIlElbc8xba0VRWnFuQcpNYW9D/2asSWNR0qVgQuwfuMMLN7F0enl+R0RH7givbqrUB
	 Rh+tfLgCtztNh+UDgcB34wOdgWKxm/g9ZenJ3PgsJE8a4TGf3p1J1W/3Y2BAphHPBoCyU
	 ME0TGSiI7azLG2HQajrQ0qL7i/NETC9+/B/uu8B8ipwjOaY0P/FTN55H/wLZAxOQQi6NU
	 wJw0ETEotbw5Bc51+mgAtwrwqaWQPqIYMP4NyWDSAPTzwB4i1HYHU/OArj1O2aWuS7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wYKFLzdeHPvc7kprMqVT1EcCOKLlxOc4BYqtnLQWWuA=;
	b=uN5cEn9sAquSceL9pnPxo9QBQv4delhHyW/47nY0SKihLv/ifHz9uOs5nE/3LHMG4bNc
	 juYT5KklVUJ0ewMJ9ZK7krXS3nSRXrSTD4JpF5uUCECn5mT6g8+7q0Nl2UlON+nA8TxZG
	 iVuidDTAJdrIb3fVpzxwm04fR0PgZBco+heSR/tfDnGfd/d+8oiKMNHUdYdvA4IIlsoKc
	 0Gz8RBDtxOiZmQjpNlSlZ66y/UVLFYNpVhCthfTgO4r9FtIHAUkgGQF0s59Gbbs4UNm52
	 HQnWWWD9QGeSogz1kWtRm7B7OXcODgR1bp5sH7LXZXKbbvnCqIEkl1nWNOrssaeD5DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gwnvt6+C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmyUSpwH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C2C606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C2C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gwnvt6+C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmyUSpwH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMaaBF2830185
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wYKFLzdeHPvc7kprMqVT1E
	cCOKLlxOc4BYqtnLQWWuA=; b=Gwnvt6+CnIy4dUzedFrjCud0kA8qrm8m8Hfzg3
	1Mv8sebwr5DbXUWJzU8nabecWX/0KC4hhZKvEWT6Z2d0TZ15cIzF//16vWs4+9um
	H6WmlWE+Pz9syr9jWBMbzr9Mu5z3SSnTUKIRKh6cYQectGS6uLcYloZN2BH9YXkv
	f8qAQd15eKGvKHZbXWQQ9cUqDeRvJqX0sHi3wor5gVjI4yrcrR3As9Jo7lbfAjfb
	JutfCyqN4KVrRRs/cEoVq/23L3hTEWEVealVTr0+FNmCkQGgW4hqMglRN3QuBljG
	SkiZfblVOT+KxpPZCPNZWuGRmDsWvjFcexxhbC4I7bNBu26Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxka3fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso5755888eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795565210; x=1796170010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wYKFLzdeHPvc7kprMqVT1EcCOKLlxOc4BYqtnLQWWuA=;
        b=KmyUSpwHwgXbxuAdguWu8KM3xhvGpRktCA3E0lB7AK4ufpB2IxcCePTVVfH4Q02miC
         j6c9ekqLEDRG6msj232LZgpmjRcEP5a1rKX9dchj+GkZxPbL5m+VDZepPOai6/yjItXx
         U2IDweLlFgidPMkTFiMh+dNtX9IgAUBScG+dAeCwVtNVclEqwKQeuENjS2okh6K4H9Q+
         tLwYr6BXCzprzPmKZeHgPi3ei9FE/nqnFU1WYfrEnH3udSThCJbMkJ/4J1Wj+uQqcKTv
         ssfgjHCy22tcU7d81ybmOt07ulXL//tZMGM13mI4m9q6/ZRBfh7GN9Aid6VgCjaQcDC6
         BMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565210; x=1796170010;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wYKFLzdeHPvc7kprMqVT1EcCOKLlxOc4BYqtnLQWWuA=;
        b=wL31KaGdRn5sLtvNE5lrpAIvSxF52kWKnevBEBFF/kKSiAuMUoKu/uYNJeqF6R/q1e
         AXKebZF8sOPyMZV5T3Osp2/EZ3nH8XKsT3PdZSoEbIFQ2d6CqfhRfqTpWGUU7XsyX4oP
         4bAJEVBqTzSto/+60435bCHSyR7b+WElM/PVyOhui9bxAs0+voEvPS3H/HFnIiSWCzKK
         hEgHqSp4y8XY3vy4UzMSf/8txxXMfkXaD/aWnEMg6cltCa8SZwTqvBqb7K1lvxjZLvS5
         ETi/xhd8fx/GKQKRgIk1CYWwZ5K9kPl42sDDgKQQv1AI0HNZqW6zSziXKphlzqEDG9AY
         37mw==
X-Forwarded-Encrypted: i=1; AL+hErGllD8lMXaxsQwHG2ML/MmoxRUV6M8eEv/yxw7AdPF/ZkTn7+KxMT9Mz2bu042Qu77xlMLfkb7SJEII@vger.kernel.org
X-Gm-Message-State: APuU4Z+7tgGOZMI53Aw1lGTJuNSQXpDOmDQXF84NhPyoGFN7QPiKvQkW
	8PLhYC1aJvSVa30ja9V+ej8qyOKp9MFq6/TeFON0mHcKpPUerzDzW3dEFjZMV3MHnsQysF2uRzY
	WB37b91IUW/bc1uR9kvWYmziUFR+uf/ZSuuGleV9+sa9D8jZFs3FMmG7tnw/2+ery
X-Gm-Gg: AZFdTZdPUihnnEAOmAiLNadtle2vl4E2ZUaTTZo0Ajnd2J3oRNrVFD8gVRL4AvNHubR
	tw84WR3u7YzlRPzA/CqAP7+Ovl9F65D9upB4P6Bmr3I13AThjoMJEvrdIAifZK1lmx07kiCKtPV
	vQj/cEL9z+sziUwawgPpvhTReIDCO9yYLCCCmlJDlAOnMB9EqKi0QngiLZS2aDaGOqPQx6v1el+
	s5qZSGguWjf2fQdShVy2eYTCIvojB10UX1fNbujjUVD/5PADBKiTs2EMymf1hp5O5KybqItGFjn
	GfnWJK6yixv8N5mbEezv68CtqKC3xBI/yKXmZ3zoIb7T275V5+NhE3d2re84bJl65U0zVxIG9QO
	AJIitD3C3wbc9JNLl4EUO5Ky3otps+chi3L0QFdIIUbm4V8Y27VuHf25HYQ==
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr15682262eec.28.1795565209592;
        Tue, 24 Nov 2026 16:06:49 -0800 (PST)
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr15682238eec.28.1795565209009;
        Tue, 24 Nov 2026 16:06:49 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm47494708eec.23.2026.11.24.16.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:06:48 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Subject: [PATCH 0/4] misc: fastrpc: add HPASS domain support
Date: Wed, 25 Nov 2026 05:36:40 +0530
Message-Id: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJAmBmsC/yXMTQqDQAxA4atI1gacAa30KsXF/MQaFxqSsRTEu
 3faLr/FeycYKZPBvTlB6cXG+1bh2gbSErYnIedq8J0fnPM9zsGKSsJFghnaIbJrwZjjONAYXZ9
 vUFtRmvn9+z6mv+2IK6XyncF1fQBulXT0eQAAAA==
X-Change-ID: 20261125-fastrpc-hpass-support-bdb86e8b15d7
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX7pRVktyhuAuT
 jcCLTN8SROSOUlBGnzOfGD2wIYdQM/fxkHnj0XRV3vaJ3QQGN5Lqc68MiGscmvt9T9i1V7Rw6qV
 n7AjfscX9Tb+/huICR0pSvF0NSa6h3VogDKbeuZvkHt3hHbTt1tmpROLnIsCGlk9725KN17YnGK
 lD+crgdajZQxT1NlLX6i4kc0nGbCWvm0T5pHIW1Sqq+lO8XoIyzmnP86DsGUNnRCGdHA7rZWbPw
 OI3NbuKNOy1MN5r+yhKzh4yLcKY+REN884PZsXnSnTfTMvEE7sB12TrXRxczeNViPxgESfwS4m5
 EytJOQ6Zw34D3GPQzmR5l4fvqkw1WbcIga/VP+zZaY1sR+pt5pB+FSin0aSgJhRglpXB2NcV8xX
 WoAxXtQ3MYWJ6oNIxEMpu5td8EqoI+KwFy7ZdPkbKxFdXSukRDIt8rlvrJOvdeuSiYIaUjcTgl6
 UmOEqCdBXPfdhfIexTA==
X-Proofpoint-GUID: NTse8o8rwwTSIgHHJpP8VQXssz5t-X_y
X-Proofpoint-ORIG-GUID: NTse8o8rwwTSIgHHJpP8VQXssz5t-X_y
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06269a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yezPJc07dsF5jmqqbk4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfXymG1ebR0iXuR
 4uHtWy+EKN3Z6C3iuprJ2TPJKv3apDYnplkF69iApOyT+uP5ZRj2yGAMvmxucy/SjXtq4cqU9af
 l82wmdeCDgmAzddVtC2AmIICzhCcBcc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250000

HPASS (High Performance Audio Subsystem) is a distinct audio
hardware block from the LPASS-class ADSP used on earlier targets,
with its own shared resources, audio interface block, and additional
integrated processing hardware such as HVX (Hexagon Vector
eXtensions). It is described in the devicetree with its own "hpass"
label, following the existing fastrpc convention of distinguishing
DSP domains by label (adsp/cdsp/sdsp/gdsp0/gdsp1/...).

Depending on the firmware image it loads, an HPASS domain can run
either an audio image or a compute image. An audio image only needs
the existing secure fastrpc node, while a compute image additionally
offloads user compute workloads and needs a non-secure node for
unsigned PD support.

Which image is loaded is only knowable by querying the DSP's
capability attributes. This series moves that query from userspace's
first FASTRPC_IOCTL_GET_DSP_INFO call to probe time, so the device
nodes registered at probe already reflect the DSP's actual
capabilities instead of being created from the domain id alone. The
query runs on a per-channel workqueue so a slow or silent DSP domain
does not block probe() or delay other channels probing concurrently.

Patch 1 adds the "hpass" devicetree label. Patch 2 adds the
corresponding HPASS_DOMAIN_ID to the driver. Patch 3 moves the
capability query to probe time. Patch 4 uses the queried capability to
register the unsigned PD node for a compute-capable HPASS domain.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
Anandu Krishnan E (4):
      dt-bindings: misc: qcom,fastrpc: add hpass label
      misc: fastrpc: add HPASS domain
      misc: fastrpc: query the dsp capabilities during probe time
      misc: fastrpc: expose unsigned PD node for compute-capable HPASS

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |   1 +
 drivers/misc/fastrpc.c                             | 259 ++++++++++++++++-----
 2 files changed, 207 insertions(+), 53 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-fastrpc-hpass-support-bdb86e8b15d7

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>

