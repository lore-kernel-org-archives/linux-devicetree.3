Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007689;
	b=NNYd764QELAzg8A3DLnD2WiZ6ILWyB9JEk2Tq4yFnHIWN6ZV7zAvuI8mCBBX6msreQ1X
	 j1KpQHAig7AsE7dj4Qhdw3i5UfTFWiT35h2+xbpv85zDKDgtJO4SWxbhlIIXwa+BTlMJe
	 H+UBCz4nwu5cQA5HFxr2XH2VawKt5+2jiMKZCu3tttUGN+dNzote9cPXvMYZUkKhrXMJk
	 eHft9XoT0B3dvuxKJaEHbEQrmlCzZjVjjKYGHhe5Rs6zw+0dRBWQMPPe0N10ofiu/HsKt
	 0VU94/gzgS+0KyovijbIs3MT3SXakLXd9GEtrw3JFpWJMl52JKuejJr91/F7NwoiAlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273PkqknjpX/0=;
	b=uo0j19SxcP5XqsvQz5uszYBxNM2omENSqwNWWoIVjnN1PuwNiel+s0xSTcZJ7PGm13y/
	 KPwFP+1cAA+zNI69nrXiSAY8Nr5DfMkcSI0GhiLG0JtPrPjo34RBaoWj/Zij++NXs4F7+
	 EUPa8xyK3Nw52TJinyeY4EmGwOAhli6dmknkj0Q2g71gdUsajTsDEMOxgLEsEM/3IyKg3
	 lMbSwRbXCScjZStPMVoiijzxkVUU4vICjLdoSoJSR/cNsOlA5G9CyryWrxERsItjYY5Vt
	 3REK6UGf2G2vKoyCS9G8ZQwQs9o8sFcYWJtUd6j4ByibgQisf2CbtVWqTgx9D32Kw/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLKlw5fi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9dO2XQi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6499A606A336
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6499A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLKlw5fi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9dO2XQi
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4arNF3303602
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273Pk
	qknjpX/0=; b=TLKlw5fiVJflwNmMuvHHaDIZeW8FtofXsBWrpqFH9qwQUABl0Gh
	AU8r42ModYcPvZ1Buvvv1tM8hkcU/TZUudtyN/z4janCRPTeDx3jZWmRMxeivMEl
	BE+uXHghim1wLP6HMr3JHZExVCJ5XnNnAlf9pD1qnEDXNyaW+q0NSsMVxvM0S8RI
	yWtqwsSd3Yd75Tf34xG4eqEsZX80uZkQhe1YC9MdQ3hdyoj0fVth3MvB11Q5hKkw
	S4mHKV8sJVEepA3ldZKeg7bC3gU2P1oNJIWYboCOtE4YEKDIgMSKcAuJzH6cvjUW
	gKydjrlhBA9OBytHAt6Qx0F2eP0irtJaYfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsdtu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:41:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso1982619a91.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007687; x=1793612487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273PkqknjpX/0=;
        b=R9dO2XQiy+A147qxfdDJiFwy0AG3bkz7yuv8uFlh4peSEShvbsb17UQiSqgylBzDSQ
         +etVjpnfuV9YLO4i7JubQtgg6mJm5i5MBvflXt1/3maiNYkVnYn7e+gUzoKccgNRb8Xq
         4qiK/EcYskwQs5WQ3aXRMeAbwVCRHtyBF8B4NxppcqPnBi8my7kmdPdaagGeo8FqXEY3
         XwziaRlFSRTa91h0eEpIzVVP7KK6mBBUvHa6kt5XqTwe3FoxCoGQSCisUkOouCmSc0Jh
         xqPHsexK1qutxlX29Dx3yr3VwdtR7rP53cEyjT7q1Mmd0HKDJ7ghfcUfKkcT1Dw92Nh3
         NURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007687; x=1793612487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e6aO/DBAk3mai+cjuiy6QYgP4Tjql273PkqknjpX/0=;
        b=LCnbNO/n35mgn28el9C7WAH+gXAMW/eesJNSqAT47LBz/8d1F1/kqLu8CbX7/VVnCW
         j6ODqRZZ8Ic7zZr/+PJscRABBJ1JZB3Qlx1q6w/2LZqW7FU6HjyZiu2aP8O1GYy7RzyY
         zh5nj3oxcwdzdeVrUCNCAgW+mAIxsjZ9F1vhjSQvNbE0z2su5lMN2ex6yGV1vdsOpttx
         fHLF8BgqsWyoFwNM5KibffkTAmQ+1lv4G4Qk9ceT4SlU3xpZkxyZTCP8KQczWIObc8jv
         rE9JPRQC7fE4Fdb2eRyzjQJEIhZg1DdvSxIo6F3tAvwrmPTheoEhDc4e3Zgyt5oNlLTB
         GkFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAj8rNLA58XsPtbk7isX+5tjDdcLZICoTeDDjqEiWqQfRDhPusCcE/gd8/3r3TuzL6RuJAfcOYE1qv@vger.kernel.org
X-Gm-Message-State: AFq9FYJDm+yDV0UrtfSYiUasmnYIYULOyngQODXMm3fLeWcwaqDfQxPr
	v2ad8JhHNTernD3ERRMy1z4Nmax5gZXvcrFTkeOLZZyxY9c4rC9+elCYEWSePoOILNPdax/qJhr
	2cAHiGF2T4VJj/AVgjZ2fr1yDzaXNnqT822OWzYEjz0vOxBrfE0ZPyzBY360QjwJQ
X-Gm-Gg: AYBFou0afbzIbGQpb1M8gkv3pQdvt01wx1GVBDDpiokWt8KKRFiQnmTe+tcOl7mmdwT
	J7WEezqDA90elJqcB5mzp6uGgFODRIUgMjuxDU10ZRbtsdyjx/FxVwoQKn4MWlNOrdL1fqtxSOp
	/VW86OQCt9sB8VVlgrhP4gcO4wmZh7mDAS/LatDlq9g3kgBCGoSxuvxkehWIiIBOi8MWaacS1ai
	c//9sYPQTqQyOlxFTon6tUHAXicVlxkXv9Ty4ORfF7uQQdA4kS440hI4c1GuFkBmSTJh5g1Cmx2
	ysB/r30/DGy0srYo0o1wcDF8Fn+BwxzUoN7sGb8++TjkUH1iKrVimamQrKKMkTYWEChr4ud5iUc
	IRHxZzccMnBk/p/ICPFilNM0qYX0=
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4669289a91.34.1793007686675;
        Mon, 26 Oct 2026 02:41:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4669278a91.34.1793007686213;
        Mon, 26 Oct 2026 02:41:26 -0700 (PDT)
Received: from hu-vhiren-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm7847966a91.12.2026.10.26.02.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:41:25 -0700 (PDT)
From: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hiren Gohel <vhiren@qti.qualcomm.com>
Subject: [PATCH 0/2] Add support for SA8797P in the phy-snps-eusb2 phy driver
Date: Mon, 26 Oct 2026 15:11:16 +0530
Message-Id: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: O5vc2L-ieKMrzcLGb1m8aljJSEnyzriy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX69R2bG9/6oex
 /+Qa8TofWcBgAtS6rA3EmbzaW5JsSStqugP48jA5H5ZXZvA77GmAYs3/0kAC+XzYFD4QRUpmNPj
 pbk9AlvF+odP1zTb2vQhHzehDRsRKRDMWElOu+oW/iUueLep59y8LquXR4uBje1qUFDI6tdzZKA
 0qt+ZZoOJmKUtpX6ZazX11c4Q8OrJHh5cs0ano2GDpxwhtMAOIrc1ETn4dME7EkS+wg3K3IEvjP
 2vUf10tuTH2qxbCDPSRagYjRafQere5ieKBnRO09SLM+wt1D/ESH820ycDHKdIfXI9+to8YSX9A
 ncMw2mPOxZQapBv+dMsCvaS4cKJJzwyP9D2jVKR9VCwIDOhGE4IofLhG4A46mrGtelAEP2zMK/M
 GAR0fOq5yD16IaWkaGe3q+iLSOCicHnJZTYxH6zAtega5R7tAYtVy6zo0jCf9V+bvzPjFJ4lHLV
 Yb7Q8aSBPOy8aA/OVuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX690zClCgVUeg
 HnVoSAqiz0b/0rgZk8Z7bp9+B+elKySVqMrZlnzqqKB1ki0ZpaAh+aoD5xrXLPYFwbW8fMCWHqr
 YYdcoNRPtLZvDQ+1iDMf0Z9T15TiImM=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adf2047 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Mr6FGUSrUdoPtvCTGQUA:9 a=ZXulRonScM0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: O5vc2L-ieKMrzcLGb1m8aljJSEnyzriy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260038

From: Hiren Gohel <vhiren@qti.qualcomm.com>

The Qualcomm automotive SA8797p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

Hiren Gohel (2):
  dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
  phy: snps-eusb2: Add support for SA8797P

 .../phy/qcom,sa8797p-snps-eusb2-phy.yaml      |  68 +++++++
 drivers/phy/phy-snps-eusb2.c                  | 183 ++++++++++++++----
 2 files changed, 208 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml

-- 
2.34.1

