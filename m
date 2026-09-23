Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1433BBFDA
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152841; cv=none; b=Lci5BR+1tHkXExCv7AFW1O+YsdgDLmiSstYVzNUjGaZBg5hH+NEaVnwmc3df4xhH4DnlkuNYkVkgdX814lfU6PjQCuT3qAZuQWtFND//XXYh0C1CAN14ai7E/I8dNiOpLWkI5GWBKiBv5l5RcswHfMIcZ90h9F1lrbv7e+6kwDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152841; c=relaxed/simple;
	bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jVh3Hj16JMX6An3HA87+UznUuRlbKWyHjPmugyNhic3NFotWHd8vXcbmAH2xvsZh2hD9J9GLP7Fb0HrQU0M8HdvuCuTyMulC11jTi6iEIazXiaywKDAfpT5PthHDb2bsoY+LDisR881P0HqRXyPamPtRwK5oIoqayhKDVApbcv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtcMmpo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHbpJJES; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtcMmpo6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHbpJJES"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JMrx2003941
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=; b=YtcMmpo60xktOfVa
	5mQhINctQVE8nlltFUfINfnW064drKr8RIoYmnWHU+gviCv0D4gRNJ5EtiC1wedq
	0lvEJqtQ1nRYS7ZVV4G/tlE9F2xZdVg77oVW9MPuNv2qimpfNdEtfoFMcdw0z9QQ
	c3V/2ZFqnEQZ7t4NFqVYRX15SObz4g8jyJmRw2Q92s87JqIkrRU1Kbc6Ru/OHe3j
	MBEtb1DiCOhQTMou/fNeZc13nMMN4B5Ne2w6sJvA0QLq/lZdysoHW5Fa0Kp43NaN
	In5WySVIwztYi4ewBdwJXlODVqUCRujVqk4jfghUKhHav06dyxXRHMYObNjmeu7m
	DX+uEA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec4fuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:40:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-333543ac378so765447eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152813; x=1790757613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=JHbpJJES5bVaAAYumIl4asYBD9aROedx+lGf9qvtkmqPn0IA9Omv6ClwZbm3y73dhp
         EVV/uf29ljpL1RiMkNoolKhikUYuKe8M5WyiNx4LsRYJzEMOqCBRpuo8DVSX5JK0sjKz
         McLIpIK/Fz3gSpuGc/kcrH9wKshpnEiApu5HrhXcdgWHbgeJw0UeM7i7LT/p/Q9pjhYF
         2ZeWh7umPlGqB5IRPnfvXZj3ZKDH5961PX+5Ao70n5zLAgdh7+3FX0euIzbtJR7FFLDn
         DAwqWktsLmbLmDe8+QsQzLr0K11bTHoeF88BYty4rFNkMXgmxNVSqXiIj+ylxuPiNX7c
         gKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152813; x=1790757613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=l/ds/CmbIispkxFyAG7eCypwy3jFgD9LETy1WAG4fAMot2dR8kdS/knybugQbUuZgk
         Zr77zXM4hjgUz4KqqYClx3qiFAlYWQGC0oUFkQUCyjeZZykvdjRp0fXWz0NrC06kRhdj
         y1lp2GZrO3ChpLXREUhbST3k2bNt9elegy20w5brbMHcsxM1jd9dR/1/jBOjIfEDVuY0
         E+yRmon/5CansFsyM4ay5asQ/OHx2+davYvF8bG96qIQsXyHXYtDzyzIujjPCr0abGQK
         2eh6i3j2luNo55umSNuPmJlQdX9Inlnf4ZPoXDCzdrCqryfjIUZ5WMdyu8zRG8NHbs8i
         8EsA==
X-Forwarded-Encrypted: i=1; AKwUvBzUL/slcP5T0UTC8IH6DsnT6MaBWP7Ii3CemJDvzlz2Og97MPSIjo6If2ls42icDoc3UMKtNi0S3NeZ@vger.kernel.org
X-Gm-Message-State: AFuF++mukqSlOkuErwi+QqZzDsU28eTkBvygQh1kcnzXzIBRBfm3dnKe
	KuvzCduzl/W4gpRp9O8Jed2jMSndiQE8RWfkHoRJkpRDh9WBLoanBixaEVRD38XBeZGXF7A8pF5
	w5zgUOxRv8/aKiG0T2LWTrXgJXHb+lxgdz4x0uNAQQqIdUCTvqbsWwkATsv991d/I
X-Gm-Gg: AYBFou11XCdAO7ow0fEiy+KuuDuNZIeOp8eWoqmgCv5r4ip/fO7rxN0xVaMTL8uXAzk
	l9Uh8fbMCOG+GTAiQrI8edd11aElkJrDTl2tRj06hYG/rdjYRnRLDksQIROYw41Vw3zE/7JIujs
	luBng+sHsltIOD2fZwCWqa3d0+rxV0TPR9L8uiR5S78PGkVNjJH+jcXzTptblPeEv11ZyB8RNP8
	t/Y/aHTP87Qv8KwsRNCqYN0W49HOlcFved4b8VFYG9piir01LqGzqvLmuYTi0WQtGQyQwSd3cJp
	9x/QnGf3UYplLDwcH7QMrEZ7niOfUiQwz/WHiOlLkn38qTw0BelcIhpCq5ZB5a0KmgD01FsRISl
	2vmtYEgYXdPVhtzUO1cy8/K+prI5BnyLs
X-Received: by 2002:a05:693c:87c3:20b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-33ea647e619mr1704605eec.27.1790152813197;
        Wed, 23 Sep 2026 01:40:13 -0700 (PDT)
X-Received: by 2002:a05:693c:87c3:20b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-33ea647e619mr1704574eec.27.1790152812628;
        Wed, 23 Sep 2026 01:40:12 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm4701275eec.25.2026.09.23.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:40:12 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:09:35 +0530
Subject: [PATCH v5 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dup-sessions-v5-3-e953133a1827@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790152791; l=1160;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
 b=e0MgaiZWsc2oUknzB47/o7/O9yahDPbB/eRXHGFyGweqtgG5dEQKiMCoL6vwICumPCsRUFTil
 krWQU6b6EpwBpTcLD+l0jsxvh2hMEnmvNvfNnKFQlbB1YCmBV1FNbCV
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXzlbCrlozlFie
 4Sow7SfiEkk1R3t/zI2CYlTOyXkHb7GamlTMIezx3FybWw4xdRtYj84/L44ykYTSSe1WiHsJijn
 868Q9bkjLOpkybjgu5ZvvEoEiKBbKhfZUK3sDOFloNrnJAAYwXEBh1AfQqtA0cLMtuZMdDlbdyr
 KstzrIvjxQmx5KRdujDtUcvvXOiplw2Cf/psrSGiO3cgk/iEWbJXumT5LW1DaCLr+bV8EHfTnq5
 R/D2Hz/EWZwusdv7+EA8PMF3SE69yECkQtdmoVTMZi4A+0x07nSTvIe2frMPdEuOFs1pORjiqwL
 FwIsW27xWlUa5AyZETw8X0u258qJVPYCeP2KX0jeohcU5d3Zy6D8X6k5Tfg/qEKa0dNXvKNBKnG
 NJtuvgy8HfYO/votCeWg5kBvpEC89+x8BbXLEWVI/vm2OIl9nk96WU3VwAgrD68hvsK/qp9COeV
 hMRQeslnyrQd7ZFke1g==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab3906e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: lZkf2kPLPgP1AyrgU5DoCWGZt8DnVVW0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX6u+7aC0YqcGT
 UhIxDS3siVkWCJFoO0jskQsotN7nD2xKRCrhfsaH5gMcrnLWHT7IzCWiBQoygFiplPLCQIFxBnm
 c64kPiyN2+DDnj7CtaPfYYVF3RoUhjw=
X-Proofpoint-ORIG-GUID: lZkf2kPLPgP1AyrgU5DoCWGZt8DnVVW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

