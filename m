Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B2744CAE0
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 11:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485985; cv=none; b=a+UPcVs+UnbHNuPdoXCzJ0Dpc83T7M5di9h3iWvwFU4rShh7s3ioXRur+NJcbM9Q+SfARAWC6zUYqIhsLcBOdMfNK+tu6FClihh8M7QY9+gIdJG7l5No3SskOeVxHLqONxdUS9e17zMt6QrSSPR7hcpFAzjQBupb9yqTD8pA8Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485985; c=relaxed/simple;
	bh=1dObgRDzgUT8dRxMLMRa/R9TRzn0laSrkEbhmpC0VyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OqWR/wOqx+yc7GvIQwQXSLx/8QODCm7CGDBtM6qehlTWt4nLuF/SLSRyDMGH/EYQ/SbohY6Zb6WZ64CpDIMsDKnPqZYkPm2vnrnb21KnUdI2427k292PcYrJ2YIGztNo7kWP0v+71YTVrvdSkcoMhHAlu3gtw784asiOr9LP0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=De3SH1YN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwaIVII9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="De3SH1YN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwaIVII9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536ROIE1200143
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 11:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=; b=De3SH1YNZhZ2j7Ej
	EyVBF3KwV+RzjbMdLPmqPDjoY3R+RZo/zsbfqLCSoBQjNUcgUVsDfSxcrKzzBcur
	rckxjwtZKtrpsTHijuWlQyn0d3C8ftWAgwwpNbTiv44Q3r1zbl4os260zMLqaNrS
	23YwXh85y9CDIBDXwa4fk4mty44yhEKe9bQf8SH5BAHMuO9Mtp4bfD7FawxdpvCR
	K0IVNHoMDzOtm7rDcaB1KjaHhdsGV1GBw9yem3NDCiPB1Sgg2IjONh3Ar60/No4I
	PjqbTENRIFXoHcAlXJ0pE/051xt7tEUDDHexzZ1lFUWKPD9hqNMrNnqrB6nCwUnU
	VotjtQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw1sax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:26:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so65611055ad.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 04:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485982; x=1781090782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=;
        b=dwaIVII94612wbCgVkjFSPSEwvul3ZOEPQcnS697biQ0aE91M4dAevCgDb+RnSVeix
         0F8yKdyHsL7nAdYp0vyb89IL0prCfyke8oG/FvSaii6OFy6keWgkE4loJTMHD22nmtwt
         U3z0SlHxcWXS4ZtDcxf9pSaUFe5A+5NrLMhFpdrPNUAYVm4f17OQwW/KmOTrT2rUrOBL
         NUmuedkSNwVmAlCviWl1xIUdYChyZ1KTF3b1jFR2iq9ivLnp43CjKAVXUxuDKMAXq26w
         s5Lpmpa2Hli7co70cB0OOq2ooBqYrxdyKuc+d11TywssSxVtY16rvfq0wyhkZpiMLvb5
         fJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485982; x=1781090782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=;
        b=Nowf4DU93z1EOhLbMwroOCa4Pnv71IGP5vakng7i8fNQn0KkNjDxuJcTm+e8KSiFCY
         GiXf0z7JpGuLLgVkxW2gD/YoxBMs3WOHcsldsZ+ebJQKzn6gU9OjSV7Emnj5lCdLGNMV
         iVItqJRgbShjEnnenmZjV5NU59sBlv68Mzb0Al4koKXdlwjjR4tM3Dwrz/m92T3BU5GC
         hssKsC+Xshzvz7xaIiwYnttmg/4h441RsyTrxFar5DAxKtTkU9AG9ZkaAJc6Ft5nPTWz
         yXZlA4AMvwuJPC8A6SgJzj8DwIzbjqtpGR0GOK0QkSE+yDfg4KNFyNZ3H+yoptXp7zEO
         k8hg==
X-Forwarded-Encrypted: i=1; AFNElJ+INcrsrjg9Gg3SQBOO3xBfmzBc7YlKwQNasNNJxalmhG2iJJ7Dxc3vrCbm/Zt6viDHh+FeMqMUUKC3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AJp58KB4IYXvh9TPXxx2eUmWujgF4byPR2zCKqYqvXtt3o1V
	YBVSu+alp6fQ793ZjKeOhZYWKnbIhBb7Dph6iorpHwX5+cS8HIwa0FJ6PcbFRBAIbwoA2UOcdia
	33sPZn2/23FnwdaOxZvADDyVDx0V4OZEGXMaLJqwg1D10Bk6sw4d103wCcQ6sSSnz
X-Gm-Gg: Acq92OHAHwl4UI3ZjbrrsXd0TJ76/LS6ixAL5K/f31Gf+iz7PbPxfVtnj9eaEcYRHlA
	QtZIBLHRyQFxi5OKzvL6yHrxvkPS9RlkCJ2ViA5Gd5OVJusoq6K8FtG7bEkScEQRw44gGBqb39U
	u7h6KV1cwLlEKEbhmJ4d9ODgiBFRJWSBGvW5ges5TuRXyWd0QfjxAbFiTJblKo6aSRWuDp5Q1Bi
	Ekky7g+uujcgLTlkZ6p/o5yn2aupTN2vfQkUKxiw9WkxrVpo/ZrI2/PSvqPQXMqZC5qcOaUDpac
	KflwoDJaRragDQis8Ci93aN2/0/lNuqCk4rYDSC1hK9qsKC7ZNnxXarXVBqDRpkU7mg+B8UKXcO
	EHzAhb6ZCwGqpMnzNENzItTdCWLtWRrf7xOfpRIjuN/fXCo+RUv/veiU=
X-Received: by 2002:a17:903:28c:b0:2bf:1fbd:b946 with SMTP id d9443c01a7336-2c1636143fbmr29375905ad.0.1780485981978;
        Wed, 03 Jun 2026 04:26:21 -0700 (PDT)
X-Received: by 2002:a17:903:28c:b0:2bf:1fbd:b946 with SMTP id d9443c01a7336-2c1636143fbmr29375615ad.0.1780485981543;
        Wed, 03 Jun 2026 04:26:21 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm22704275ad.45.2026.06.03.04.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:26:21 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 11:26:12 +0000
Subject: [PATCH v3 1/2] dt-bindings: interconnect: qcom,osm-l3: Add EPSS L3
 DT binding for Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra_epss_l3-v3-1-3c2e0b796e78@oss.qualcomm.com>
References: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
In-Reply-To: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: AW4RRHdz4wz7jH0AiSe6agbtXJycLStl
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a200f5e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_8IM60h0k0ddrWA-9CwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwOSBTYWx0ZWRfX5Djy9K996lmv
 XefaAlf4JRksoIP7an+/WNDDAmmTveIKbiHzO53zTEKs6rHjIOmL9bQLR+tzW+aTKDIazyfVkBZ
 MKJVOMqDV4GhXGXyw0k928EYKXOcqTZ9JqJfQc/TXdeEu4T/u88eZb0sVFMw9ithzuenWUVekZO
 ySOJE9utDWyEh/oww+Y1jS0lYMzoAclmH69UItMjtuD+8cERvzrSk3ZM342t37EPUNcQuccl9sb
 QFKw7t3an1HzUrCg7/rRCO3jqelYTd/3lYIHp/3HmzQr+fPuoDYH8Zy9x8OtWFhutGC+SCj0cTP
 +NB6eolYf8dln4JT2P7xa7GgtepchwSlaxwLironWs6teUho4t6mIKLxRySUOQJZcMIOmOs7oJq
 mfp8JnX/nH5uNZujjWuudMIV/No5K3JV1fLJwRwk6NkRgPi+SiUVStDbZeOUE4AhWLJ7OYBiiHT
 fVTkd9T1IFkAJ87OMIA==
X-Proofpoint-GUID: AW4RRHdz4wz7jH0AiSe6agbtXJycLStl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030109

Document the EPSS L3 interconnect provider binding for Qualcomm
Shikra SoC.

The Shikra EPSS L3 block is similar to existing Qualcomm EPSS/OSM L3
providers, but supports only up to 12 frequency lookup table entries.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 41b9f758bf8b..3b8ebe17a976 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -17,6 +17,8 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,shikra-epss-l3
       - items:
           - enum:
               - qcom,sc7180-osm-l3

-- 
2.43.0

