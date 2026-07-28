Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A406041DDE2
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232490; cv=none; b=DVW1kh711IUx5rm/XI1GwOctgLT7eoincpQuiVVk79FP8tURzd1TVzSqRx9BZWn8QPukV6hy4Ht3DnXTPjI+V8yKwcLTf4w/165GsjHnvhCr4hKB3oc89bjh2Cm6WaLIuLxouSRx8iagQk7LMi2UDge3894Oga4fP5jPDu+J4Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232490; c=relaxed/simple;
	bh=yxdMDGe4hqsABM+DAQwDlohqgSwvbxMyQNC7/8TBowU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YkTpnCEKE84UF2Dx5LYBY2ZkUF12waQJWfVi7nvWsh9JiCyKInCWIZG54LClyhupbRGMFs0b2zGEGXaGpeXdihzDdokgIKdnQz7XJ+RzasKWozOpMfF9I9CUzXQwrZdkoX/1F+hcNaXzq5x+2/5r/qdVCS+bSljjDKxTxE/9080=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7mAu2Jj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bESh9jQm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7mAu2Jj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bESh9jQm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S8295g3295005
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0paKyPJKJDwSyPTxWpyRHk5gL75Zl0fsNngFur5DKMg=; b=m7mAu2JjW4OKYZTp
	PWC1/fiOuBb8Lvk9wehxmgiaOnIOpSg9ZVOr6OC17YYGnS2UUV3z2VHM6vbG43ME
	0OA2rVLGE4QqPUI7riI9S0HFbUR/GU+arGJRi1VGjKZbILvt5BiAGBp0GDAQYOLg
	UIEE4AK647TdrWAcD7vkOgzAKju1CNSyg94NiiW4tslJJ5pZArPdhZa5S7qCJzjR
	Gp/rG70bz/ykYGHAF8wvpz2tO6lzYPGdZ4p+5OtxYXlcLrfb/SEKOP4WF/qIPDz1
	Y222sBMxWW5uwYQ3X52TINRYexP+5dVhoHESHzUkgYSrj/ShOZNvWR5Yp6129Fm6
	vaJc9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5kn10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:54:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so80265445ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232488; x=1785837288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0paKyPJKJDwSyPTxWpyRHk5gL75Zl0fsNngFur5DKMg=;
        b=bESh9jQmzNG1cFgSw7TYparpijrYjMkaD6G+DaiKmT69QEoB/ZmZC+jE9e/gBWroGl
         MvKsAYHVgBSL7FTC00MILWbmYpBUMlQBnCwLHle7gcqYvp4JtdTEO+Nf/23jkEjuiC5/
         9h5E+DPdacm+DSnKl1H2N2gHXqMdFsdSfqlAQhlkKU9+cuoiuWC2G4JqBxyIDhQeFVjs
         /VlA5NzvZ7PFbqU3gtGQA1E2uco2z/6RWIFayhkXQwrn4ONnSL8c1u2+CSpKbiGkvMW0
         MooTN2WmVaakojKXRWmxburb4tQfOtewHJVNspggRQ2qGOus+UwYEvMkeLU43LtVQuW2
         jm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232488; x=1785837288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0paKyPJKJDwSyPTxWpyRHk5gL75Zl0fsNngFur5DKMg=;
        b=WOZZfiyn2o+02EIZ33Pi8UXQVE4UNeWY5/3VyTs4SlSWBJRLPco/eacncmyulMv0ll
         IJ5sRIhtvtZRAdi8AFbl6bswWAkcNkk79KcXxCifIIaObrr+Aq9vYZULr/abfSZ/Lofq
         LswG8k/EE+qWJ12/HzzDDFJAcRxWQogjK5zWHpcePwUH7Q6NFu+C0c9XMfxdLXzLJ+og
         StJai2W87NhsZ0BzEZxjJ9Od7bN7FnndYQnPbOYvcWZWJFhY+rOPdgzii6RIseX9yjeb
         E9ctDQA5sB4/pf9/CR3MkfKQo6jzA9JCTJSW2MoZeYDmih/jwYitHI1XPaXkKheDu5oM
         b8pQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzVY0sGrz5fWVKiRQrqbyW+QYF3uDQZbkNGIqUIdlWN7b5zQKFZFQfi09YwrZCf3skW3QYkYYuQdAD@vger.kernel.org
X-Gm-Message-State: AOJu0YytJ5lE0rQvXbkcSDRvx50kMjaXAtUuCogz1r7heQcKZw3u+eGY
	kebYO45GZn6Xc8qYlGYniXBJqk5phgZXWDyFS8zsrYzFJpU6V31LHXzr+jKGh0tO9CsNcjdvqIr
	Hu+XHONseLwNpeZ1WoAgYwq1Ilh8avfSFbEWau+kxX1U/tCtvGK8hA+KEj+1lhOEP
X-Gm-Gg: AR+sD11UR75XH7tf3F2uqeqYzyX8UEaADHYwV+9Hdx+6xq8B3a1um7Jh0vT2RMfEdCJ
	y+9Iy3bNo+zN87qdicqFTkAdbf5V7ytgnBfmERfPMv2eMiSQlE/A/L3+M25W2YitCdHVVIwSTAb
	PlvuVo2e0WnOA0//Rhx7vhwEFk4CPh01kFZuUmrv6uwuF1y+wwUTqew6KqzwjZE0D7oAiHSAKHo
	W/zWLE6wMGKHqe8ZJRy2lRYs0KzGkAFApg8o7CxZ4YK97eRINN9kubUBgS+z1Hl9qyNETy9cdc6
	sCK9CE72g7j8jwayAFWamCmnqZF94VjtBzZy3lewog3NI8WoI4pgYuNvQaRwqnhHkB3R79Mkmw9
	PX3R6LZlAPzpzqWHTa4at+WEN5prbwBk/9Y6nv34vaeMNExfmcIqZEvVWixWHOC9PT5rsBerPhg
	==
X-Received: by 2002:a17:903:986:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d015ade332mr18688285ad.10.1785232488286;
        Tue, 28 Jul 2026 02:54:48 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d015ade332mr18687825ad.10.1785232487827;
        Tue, 28 Jul 2026 02:54:47 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d00599b631sm20264945ad.42.2026.07.28.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:54:47 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:53:55 +0800
Subject: [PATCH v3 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 x1e80100 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-hamoa_ufs_ice_change-v3-1-293c7c6c2ae5@oss.qualcomm.com>
References: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
In-Reply-To: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785232480; l=1016;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=yxdMDGe4hqsABM+DAQwDlohqgSwvbxMyQNC7/8TBowU=;
 b=lcgxVhGrW/Xe+YiqxpRzROpocls98xyPKH75YDZ0JuQok2jtLFipSKYQkD673VfUY1/5yEBbE
 NdfeHuh5gkOBpUlufd2iPu1juVX5zUb+w4OWwXMPbhxQsPVCwIfvz0n
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX/7KIaH/KJnbb
 zaPk8gIdgDqBDpikni0OXnF2b3gY94f0J4jbK1NeqtZgFRgl5X/cXFTRD1Y7aplV8cD8NOfKe4b
 b/LWTbKUXKFABqgsbZTUTOiEIlV9Nn0=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a687c68 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pPHeIUNF4Eh_DPPJXOMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfXzjWszPTevNyu
 Dojof8OB46B1qCdmGfdGmXZWpPbuF/tFbiwjbe6QL44ij//37agpy2t/61qw9Upq+iwC2BEhwhv
 7g06yO2/g+X+B+XKW3HEXz/QE+LZIYyqPFpOdYnLisF59s5dbar5MAKUZqzTrOqLfqau161McdN
 MLrs7Bl+fahSumwYrExuSUCHYD8tq4qyGroo8oKoUSlPlma8+kD+Vn4qIG7ZtitUyro3Di26QYo
 7Z7/P1xPXgr8hax8ugVNKH9+Z8mi39TH4VlxFovpJuck5SnAPp7d5yfzYxDVFGhCpLDk9F2OTf+
 hl9zC5WxP0Zf4999j6VCDEY73/VzvARrBAK8RsFG+zkJxsFBtEKSnYaYgI2UrhExr+TnuH8TIwO
 Qh3j0U8SVCyPj/f5HzJjA1tXXGqF3V+0+r3zJzyPPk2H2x0wMDUWAF8xvj1Y/9fs8Q4R59MiRMA
 jEZWpvsLAenR3u6IVwQ==
X-Proofpoint-ORIG-GUID: 63SKwyayFWnwdxHiTGoDNZaRF65JL1CB
X-Proofpoint-GUID: 63SKwyayFWnwdxHiTGoDNZaRF65JL1CB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086

Document the compatible string for inline crypto engine found
on the Qualcomm X1E80100 SoC, used by the Hamoa IoT EVK board.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ed2dd99eb1b120267a20104b4d1cf27a347542c9..23bf98c2b9fa0d415d248d9dd145f16bce961fc8 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
           - qcom,sm8750-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:

-- 
2.43.0

