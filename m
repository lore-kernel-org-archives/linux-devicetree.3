Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2CB3ED117
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875030; cv=none; b=mhmbySigtaW7/wxoRrCCVjI0MZoeBd+0plrAdrw0hgkzPIFQpQHovzqfITktz2ieqA5AthmBVYjLwpjz+GKEyr2PC0T0M5TFOK7zwa8aaq1ocPQooZWdBqpzbPBUf188hPC59MohlNK5BXE/sMu8hR2SK1mSKsS2rQU54t/bHzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875030; c=relaxed/simple;
	bh=8CCmb1vf5Xo9FjKwBoU3h3S8PCw2w4l6hhbrHw4YAZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHlTQOt6tAwg9JQLDDl+6mFuck6FIJ423ElMJygDzVVGKerCHoZAzncJsVpxFIo6RwTr712EMp7A9YWdU0IDb7GFQx0WaElvqXiTfsLo/4TzakO09vrRWTFXJPkV/4SVqk2Sn7kDj48tkpGOOBWuoPyl6fU/RIFm5ErjDJk6RtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O409bIrB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDlxVkRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O409bIrB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDlxVkRW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mU96871214
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LQgmjY0zwEZ
	89X1Xk4mdyExHv8CNhlulbpnXFW5LEIY=; b=O409bIrBoWoUzkYezXfOX9T5ueJ
	GXCT9LLQihkg7gkZDjzvZPtb+yIPtEv27+AtHJzZG719Ba5TJ0XC/h0l4ZvMj3AV
	ntrmcI0hDeCOjJ7KMs3e5PBDQQT9Onax9dJpe/aCbUL8cLgvcR6OUtyFl8/3F+yc
	TEQEn5ArrcJeEaxzr0ChFTwRtS6HYkq0PBmetHaA0bp4AtK5idkRQeZ6R9SK5tP8
	0Y71T1tzBjhXtY2mhCEgGasWWBMhWzaokuexNBD4ubTX36mA3/7Q0+/q1LRMRTX1
	1x2Es7j6ob6uodBqLzYD6n+DPUS1WVyHxkO5r8eDqE+cOfnyYIynYNvI6ZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eduru8mra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4654f9bb6so127685175ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875026; x=1780479826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQgmjY0zwEZ89X1Xk4mdyExHv8CNhlulbpnXFW5LEIY=;
        b=eDlxVkRWDu3TTtj/cCAVxDJNqVzmW0Uj423k9PX4bPBBOpbFE9E8um8OQninjg7C2i
         f2DaZ/JYbSRkJHuY93S9IfX0Z7AaEyLZ5d8n2Hb4IxW8o78yEbQQ0kuved3dNr+NM+iQ
         nys37aXt78rJW3Vzg6VYBZckxjsAy0Pg47ZCmbIaP9MHlE3ia2MsEPiY2eS9kq8x3Cwz
         i2OoP0bC7O4F2e6S6WQylxScViHT3a1/PSbgqGdqTbA3j7lRkJX5Y9Wqc7991pov9t1+
         Xk7HP+cvnDEd5pjtBYufz715czi71rOAxvlXxwQ2c87Od6hWsqjmXjsTJpMgpZyG6xG9
         RP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875026; x=1780479826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LQgmjY0zwEZ89X1Xk4mdyExHv8CNhlulbpnXFW5LEIY=;
        b=DAf5CSGqfOEj5Oy4QEM/EBAxUCFbjQFAPrqRE4V6fw59JifK2GwjOOC+i5A2ErQWOJ
         0e3qfQooWyp9VMFZUymbkl93Tvrn2ebcOkbxTi0Rejl4iZ1kxW8nz3EFY/QAAumWpEPR
         mmaGqW94SPF+SJCSAeMpFu2JyNaefrVs9iDwBzjjcX6+MIw/l5BSUphnS9bJRa+ZMSWb
         nSm/7hTNKqdBn5tIoe5YzgXWtzXOkdbJuQa7EuEAOAH8FoBiUj4pfl86pN5V090TNp4j
         F0Dg2MVCGa0NuXJgC79LMFBtZjjpethprEe+E1LVRdR07NMZUoQcUJKlqvzvGYU3c2QE
         1Gsg==
X-Forwarded-Encrypted: i=1; AFNElJ/VGbewkv0Nh/JezT9M2h2xTnErDacshlF7K49oyYL3ar9JiktNyaWFqqMtkgnSEc943cXQoYo31RID@vger.kernel.org
X-Gm-Message-State: AOJu0YxsfeiOF+3FuKbJZb0JWP0kVS5xQ/CzfdA7YIKB25PQ38VOICXx
	ppr6Len9F68TKDMcilv6gZfoiA0OjK5ANRAeRjIFYrhx5Ne/e1eOX3iRbOLbxR8mRAO4XfblBXk
	FLaV+kbENRJA+jBIpp3mBiPNVLKi4Y/OEY9cW0Bc+SrJ3rL0W0Kq5o2qBmG9KcdCT
X-Gm-Gg: Acq92OE0azz2qqAHEFrMoPlnGm2g0cQllreSUJ1ScnIMH/wWdwdCStg/9iyLLkVAAhR
	5hJNkLvUBAw3Byoh2EPDyummPK9qfSFkTvgiP7YGFZDkBO0sAhRvWB68nvviDw5avru1As+HLcl
	nfNf4+lt7xrG/LSLeeokcJbVo9JC/C1LfkRn6vY+zPe46wkFJJIVjUbAlFoTpbIrgXYDTxL84MD
	ultgc9bMt29oQ7iwzYN/wVymq6znJjX1eWbiwaVB8v8xVn3qnaHoGT4m2PS1Tws8MK2JjJdFKoM
	6lYaYSFt9SBwl/d5lVhXlY9AqNlrnooX0VPC8azeCT5Bsu+vHjvD1KAYU+i28WzI4hk3cE8lUCk
	UWiGswngXn29i1jZemklKQciUUMqYgb9Cz/CRmQPp3a+97JJs
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr241582145ad.5.1779875026493;
        Wed, 27 May 2026 02:43:46 -0700 (PDT)
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr241581745ad.5.1779875025875;
        Wed, 27 May 2026 02:43:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 01/24] dt-bindings: qcom,pdc: Fix OS DRV reg size in example
Date: Wed, 27 May 2026 15:13:06 +0530
Message-ID: <20260527094333.2311731-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VY3H+lp9 c=1 sm=1 tr=0 ts=6a16bcd3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=o-GPFHBAWWZfrCT4DHwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: wv6ZupH86XG5Wy7sX_t4Y-rW3X4jCRRc
X-Proofpoint-GUID: wv6ZupH86XG5Wy7sX_t4Y-rW3X4jCRRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX92E+kmQH0tbC
 aXhax2/UnYaJdYh+MwaUYGZ8SNEsYf1wZfpstrq4MD4OobfM4VG4Tx12olZUlSlZxlOe/o/utb7
 KtS3Xap2Y6kCtFrGPWa8fZbyQmE+EwXl+FwSOsZdh6W0xX3BQKgIYYodCS8Gb1KYbEusKJdp6mN
 rBWxfZ5Y93HG7DYF+CTsQaEX00B2PV5cbJoBEmB0jbdcomBMNeaWOaOAmSOWP7v/4N6vzma6m/I
 oWokgNMqi/BRAxUgootR8Jy3sGxD/+oL7JgirBe/6MAJTBW1UpL3nBSk1+ZA0jDmg/pjSp4hQ9L
 LfjevB4i/ShjXtBVrz9y7l7WNayfuTBaVPb9lQiCp8+M22SIGT2yh1TCW5oCAcxsjaXI/W3aNF0
 S46tfn7PlZ1cE6PopR/jOUt7NbxkBktIjTAOmwELKWtTkKsAlIlS4iFTOyHOTRbwC26DyKCV9CN
 JL0OQQQxGSDbM68BunQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

PDC instances have multiple 0x10000-byte DRV regions, with each region
serving a specific client like HLOS (High level operating system),
TrustZone, Hypervisor etc.,. The OS-visible PDC instance should uses its
own DRV region, while other DRV regions belong to other clients.

Update the binding example to describe a single OS DRV region by
changing the reg size from 0x30000 to 0x10000. This matches the example
with the OS-facing PDC nodes used on Qualcomm platforms and avoids
suggesting that the example should span multiple client regions.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 07a46c5457a4..607b0e74de68 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -99,7 +99,7 @@ examples:
 
     pdc: interrupt-controller@b220000 {
         compatible = "qcom,sdm845-pdc", "qcom,pdc";
-        reg = <0xb220000 0x30000>;
+        reg = <0xb220000 0x10000>;
         qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
         #interrupt-cells = <2>;
         interrupt-parent = <&intc>;
-- 
2.53.0

