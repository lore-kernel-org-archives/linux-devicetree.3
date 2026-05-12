Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22381368D7E
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568494; cv=none; b=bNBFfIiNT+hZHRpmFyKxQBiQ5S4c1gABFbbqnqtV135PvPgfcv6qphcm8XqHK2Z0Sk2yaAxjv+0FqN/sc1EKyLnVjbyArR/ljXZDhM6dhBbhSeGiXBf8Yd1MpTvuQweZvrKO+hSQqV9SRwht06AJKWgMie63YBzWjNOBECxCIrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568494; c=relaxed/simple;
	bh=6wHpFlaVWQkthUTDK+s3QLO3JjBHD2R8lY4J2EbLGW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rmPlIJd7s+ZptXPP0Q1npnQbKoyzmkpQ5D5BqoQ59Y0ZWtr/siCFTnOBvS0Ncsd1SIBICGIHWCHZ94OLT9Shb0VNATdTN1y+/LBFh18TFJ0+J8I+g6VaCzun9mHOnwIjkex3tEC9iQCV5v7ZbZEJ+Rc87de3AHratuDpDedS4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEw/GvlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BY8ufmWL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEw/GvlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BY8ufmWL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5Do8v2202417
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2SU0b/R9kMyW/rWWdhry8C
	NcsvlSGgNqEIUHRWdESF0=; b=UEw/GvlX84o4q+ulkg5Km5SZFyOP/B8hQGKbsI
	ber+XvZDoLl7uGz0YXOsEwbGcsFV96SpbVCq1IpqK3RuAoAR57TMUFUPJok9wyOP
	F6WWWYkxEmiY3ogu2Vv7PAEKIwNP8j+qQw6qwytq4Dt62gqBZVv2fm/Phf803Fyy
	myd/MKjAFO3GYJpw/Qy1slIJGqF2NoS1kKmqzI86XbpfYd9JYjVxduqtf7fk3Cmd
	B+05jEMPm3nX2N8osyZLpTOdf3ojz8FN7MNRcWCkGMr6dLq1RfSxFRKqam+fdDrG
	chz4RqkPOhfkilH7mzK6h8TD+ALHOM7CaVAY9QUEEerLpTyA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyhud4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:47:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so3139713a12.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778568478; x=1779173278; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SU0b/R9kMyW/rWWdhry8CNcsvlSGgNqEIUHRWdESF0=;
        b=BY8ufmWLfEujOWsY+s0E7BiFTqqhEAxCNzPCL+xx+Pu1rci/lIPNLDqN9n4gxMe0Ef
         4f2jqasCO42NpPwhO8o5Jrjgk+rKlqBz7nJMkvZIfMFC3tyMERzeHZ8RnjvhTwQxnAMh
         MraqwjizxPUpBP+W42BiOEfsmaYJ/H8W4NaTT5/ySSJsS5wIpByd6ldMSFFcvW0pEAUl
         JLMmPbu3dnWwvIh4a3YRrtwztpv+BMDHdkPcBqb/MRQQHeFxDbG8Nj03RZMtfI8V9VNz
         zlVskxihuDLUEpKi+GPW/QJm3LeNgBimGB/mhHk2PUlb+QWdLu8Q6Ep5PElo+8wFXtE4
         hRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568478; x=1779173278;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SU0b/R9kMyW/rWWdhry8CNcsvlSGgNqEIUHRWdESF0=;
        b=fk+bX4r4e4RdLH4xkXOlfKOYmtp9UozX8yQxBDFqhsEN88qF7vgrf7m2yA/ZwXCDrt
         BQ016chZWt7VupQ3msmUI6yfeq/4NnRDGRpdN2fNw6mG0Mk9/qdy2K1iVLz0BvAfjXg4
         7w62AwfmX+G6EtTcA6Pud3g3t+F6rYIh8AowvPGF39GJFj60uGLYHKM1C6DWlOLzz1c+
         T+KL7wGZDRtUh7LQoaz1w5Y67WgBITIHUSirxnydSdbY7OBO3V7yj95KhAuLhyh/V8s/
         GvmOnK/oPc83HE4vRZJ4kYeSQ1/jV/2rf8LvVD9YUd944AfdFpF8DV5VU0JNTFuYM3CL
         614g==
X-Forwarded-Encrypted: i=1; AFNElJ/ARtVRMRfDH0/e89U7/Xpm7c43scAnFbHN7uAyhxfnKpQrbU2pSwW4JQZhSejefk3o94r4F9RKGbCY@vger.kernel.org
X-Gm-Message-State: AOJu0YwuwMwfEn4sm5OCKV+sslONamYbNsr1z7JHqLRShYK1+O3404Oa
	o2ylqYb9iZBGHwZRAz3LaKy8VzuEDxwX3Dmus6oUWlTRYjntF7nSdhGqFhufKtWMqEBuMAhvP4b
	sAjC9ghbyXm2MRqdjeO5xAr7vhuEjWkniiNxVX374Ixw1Y7RgZc/f7NMcv1U3lsBg
X-Gm-Gg: Acq92OGUH6O4n183rUFkhV4BA1NpIQr+bc5w697DPtuP0lr02enS46mTmNfmzJjEn9L
	3V+eVcUroqRlQ0MUd9E2mv75LkF72g5Xmzms+IGBjfqAWP2aaaTQukzA1UEnmpL5Ez+FXsgmMgq
	oZ1G+5fyP43yWkAe2yzQZPy/I5psf1ZT2/YHwE+IaVl65wOcqa7McfOOUBTYzLrMsHDdcFA0t+5
	StJ1kiTw/MiY5sexQLXHq6W92l8hJa7/kcsUiQ1OIGUJuvbyOeH7vuzTBL74khPsJe2OiUNapqC
	u//3KCg6ihwgp2D6TxIfMLvqHpS6oYzlFd58fcD+eRxfh2DsMQusBT6wIJ5BRTHr95vDxF+cpgC
	qHZsBNb1/PjCZQJKHZUZ8eauneLqCm8DMIlKFUtJ7BFOhkCoff2QyXzjXomYadoOQasDVPZAs2O
	sY0FX1AlLyrjarpGkmYx4z1F2tUaqUOJeYq82xj/BfBgTQOe5/gx0nXaAh
X-Received: by 2002:a05:6a20:472a:b0:3a8:2af3:ce8b with SMTP id adf61e73a8af0-3aa5a94e12dmr22068171637.14.1778568478282;
        Mon, 11 May 2026 23:47:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:472a:b0:3a8:2af3:ce8b with SMTP id adf61e73a8af0-3aa5a94e12dmr22068150637.14.1778568477780;
        Mon, 11 May 2026 23:47:57 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711b21sm11301479a12.15.2026.05.11.23.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:47:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:17:52 +0530
Subject: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABfNAmoC/yXMQQqDMBBA0avIrBsYIwnqVUqRmow6gtFmqgji3
 Zvq8i3+P0AoMgnU2QGRNhaeQ0L+yMAN79CTYp8MGrVFk2vFy6eyBhuZprVpOXgOvSqsd2h8UZU
 WIaVLpI73a/t83Za1Hcl9/y84zx/kotdNeAAAAA==
X-Change-ID: 20260512-ipq9650_smmu_binding-36dc05d39860
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778568473; l=1078;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=6wHpFlaVWQkthUTDK+s3QLO3JjBHD2R8lY4J2EbLGW0=;
 b=WA3d7eYS8WENn5BlKpezS7JDFZq9Qiakj8wOlHNjrws/8ygcUSCPCJ87Cr1QXn049NbMh/6kK
 3kR7G2kvZU3B7dH6SAJwNg6iKQgSjBxHYa57xvnVHZ6wiqOe1mfI3X9
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NCBTYWx0ZWRfXyrXL0qRY5vhk
 ro9n6YHFlmgdQweH5BgKAZzMBBqhFpfsiJ7J526fgNQ4pR6TzPX4XIM0prXlzIZNkwLMGOqW098
 F9WUyrnovHTpuCDP8wX+uWBWCJ3b1I48NiCGvm5GwdOAVoee+64v1feUAngkSkcXpW78QGetTlI
 mmwMYkrliiQ89c9sj7/E3NBSiqJ5q2Vtg4kfWxK/iei318A5pIvg4yA4QdJZFQqzZcirlUcWgc/
 qRLyBHNvE4heYjvs1Jf4esY9HWMhQiirG7LTiU9axSjan7ffNjdPzTPK1C8nL6n/CKoQBWyOqrw
 PkbOug4XX+0lqX9H5h3YmANmdPFkxTCBXsYWRAr6v5cDIfiaiWleAvLlIUjGX1ULbfg4FN2zhVn
 qg6xjIcU1b2qW3poagVsrup8K3HM18qVfb93D8B+l5jagBAHHcR8OF7NUbpsiB3yFviGnj4o7Zs
 ZnNF9eDR88vUwKC6RQA==
X-Proofpoint-GUID: SieQtWwcYubKR4mB3pC-sjG2_0aO3t7k
X-Proofpoint-ORIG-GUID: SieQtWwcYubKR4mB3pC-sjG2_0aO3t7k
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a02cd1e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hjL68i5Il40rG0QApAQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120064

Qualcomm IPQ9650 SoC include APPS SMMU that implements arm,mmu-500.
Document the compatible for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..226f16711d67 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-ipq9650_smmu_binding-36dc05d39860

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

