Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F8214A9B
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658492; cv=none; b=bM9YS95b/0l8yJQFTzNKktO+j6+LZW/Ykktqam8FrgSvtd3PpqtIkgbLhJckTfO4MPXylWFYgzq7fQVQiDJjYrEErkJANEE7cIqyVzp1fPFvXkm5y7+gtQr/SUwF0AqSw8tiAYi8FgyTOlH4JY3Fl7uKwk75d9rZcVsqvR0SO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658492; c=relaxed/simple;
	bh=OP05IAUM59Wej7gcym76Ho7xceQ8TlJ2QrD84Xl71zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U9ahRQ6XEom6LZMuwLJUlBHgh7/OIy8/yCROj6BAX3xLrIxdYLbBBfEsrG/cYILO8VGNJMYxz37MOBb3hzQ3ZLnGkGpeySTja3MQhUqhfbxA0vmXUvvJ6Iaw0Z4VZxrd0gjsYB6q7QyqNt4INEKBuneQgJckIbkJDqrsbeBfuxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfQIWVTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MAhaPd21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfQIWVTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MAhaPd21"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLtYr1754997
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 18:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9AbZcZJNw5UFLCrZpEV7wX
	j++1pImbrGRuYCS4jZiDQ=; b=LfQIWVTRJvrVX0URLBGkvnv9iP5CbRyrrVZr+t
	pPv6tcFXkqJV9JNrWrPu4+034P/XXFG12G7N4hMRWvvp9Tw5hS3TdVc7WHOuA3hG
	cNKXyjdx4CmuqojZS5/smYDfIcd04MSqTS3V1YYC7OKDAXgPgIvZQuLAcjifT2/r
	g1aQjT8BdL+rvB8SC2kB3LxRdJCryRx+nUH2Uy7EtUa2ovlCq6n9nRpmO8HjXXyL
	1xl5NjhAbxVtkTVkzi3/z/esWRGY/oj3YvCNW6W46hmTdE/FDn1VmIcSRpAQOZCB
	NUhQG2V7zWuHcmz61gNDEk4m3BOBPoTarGq62N39G3IoU8Bg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvyde8dgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 18:01:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so21704185ad.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 11:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777658489; x=1778263289; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AbZcZJNw5UFLCrZpEV7wXj++1pImbrGRuYCS4jZiDQ=;
        b=MAhaPd21YInuARN4GjSFyH9RBeacjNf0jgWpimAu/GL7D/XFtxVjN1ipM5agrC+9Gr
         1+Vlk690eYkcCslq35wxnFk+8PgaPug2tLYgI9Wgpr0S7XE4s3rf0IO63LDJGBrbqwtG
         WElU5XGnEXLk2pez/e5MrbgStzxWMB0ETizt62CObmjEYCQIbU9MtSo0W5tZyX0qv6fV
         ZGdroXdghfvTHnsEY9xbwiWGRxcaNDuHB8xj35MoP6kA0zATs3BVCJheFp2V+zAVg/Kz
         5+fDNNuDRJkveE00ZImBrudyYBNsbvyj2Qj+B36ZHr36VuY60vnAcNx6q0UFonqNa4vc
         9p6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658489; x=1778263289;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AbZcZJNw5UFLCrZpEV7wXj++1pImbrGRuYCS4jZiDQ=;
        b=lPIlnEsYGczqyKLRX805SuiAmDktNstTqxmAavn7eo4XAzzhZW83n8p00beOfY5SwE
         EKjtA5PLpW9brV0Nr6z62g7nOHQ2dsGxpPZcmRB8dmQlsrJNpvaDVe8ClxouAUF9snlA
         Ivm81REIjh3hoTNoRXfWwwTPdhFfLgmZaVGGB6cVrkQWGgFSjdM73e1aJ2ON7sNFV5YM
         ac3JjWBz0vHzJFU+Xf7ypGGFTa58KwStNRzy4eO+Ef5hITqK2mLDshYV7xJ+S2vNmvWc
         42YKe1wGRj7gtEccUTZAAFvZPFS606mXZF6nxydzTq1KxwCrcf0Qz/i3EyL1HVUYrTNF
         ZdhA==
X-Forwarded-Encrypted: i=1; AFNElJ8YbD9x//4fMCCJtfBHXlqxTiWve8+6u/JbJK/RZ0jLTLbbbqzaKexHMx5C1asPR/e53u8IEbo/cK9K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Y/7pxoSC4efPr+a7Dm2iNNL76TOF2v/SlEYmKrsR17HMoGcv
	2KYJJOG1uzCb0LCY74qPc5i1ykB+T2wwnikIroEzCFmG97gpSOTPl2mtteDiw+R+P45lD6DZ8j5
	0a+sSsev7FkKnMjj9wmNecvKPkvmJS/G1SyzsbyDNgJj38Zi50nGfzAqmIGmXFm/R
X-Gm-Gg: AeBDiet4SNJIQs2Vp5bR3LHEYpbwaOtHpD+g9mBbQKxAZQnnZKbRTEt+MwcqQ+oYlzN
	IjpDg078loQMoh1jt5EEGtDEpEW7CqcqUWwEaadqeVj86aJeDGAtst/SL4kIsc9Ya6YXp4q9zj7
	66jUlm60seHN2YeYD21pN1fLWVcuDK/YVXDX/WvE/WJFcySYvZ8mxb0l8AmPdvopT00GfypeFn6
	nCwAUIY8xaLqyl/kNAbHv+OXrVuwYwPWgFKob3N/Hm2z7SmVmes+r/HT1Dx8AaMccIqCzsDKATn
	lRcVmjM/EOUtyd+YpAY9PmAa9W+K1Xmtf4JYBkwV8bpXQLcMl7p25llP7CNR+7E5gu4YhUtQowg
	L8JW4nQP2C3qEopFurRzzjcsWZu5FSWkG0Nncz0LtjoBc/WQ=
X-Received: by 2002:a17:903:4503:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b9f25bb248mr1528935ad.16.1777658484553;
        Fri, 01 May 2026 11:01:24 -0700 (PDT)
X-Received: by 2002:a17:903:4503:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b9f25bb248mr1527485ad.16.1777658482018;
        Fri, 01 May 2026 11:01:22 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae15fabsm27287345ad.44.2026.05.01.11.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:01:21 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 01 May 2026 23:31:17 +0530
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGzq9GkC/x3MSwqAMAwA0atI1gZa8X8VcaE21SBUSUSE4t0tL
 t9iJoKSMCn0WQShm5WPkGDzDJZtCishu2QoTFGbyljUjXeZ8FpUcObgOKzovbd121FpugZSeQp
 5fv7rML7vB3oWrUJlAAAA
X-Change-ID: 20260501-shikra-tcsr-binding-fff1689e4097
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777658478; l=915;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OP05IAUM59Wej7gcym76Ho7xceQ8TlJ2QrD84Xl71zM=;
 b=T5OUNSNH4adZUB+GGAsoajCL0U7a2J1OIzjFR60q3qJ0Kj4xt/XLxsDNkaARhGHQqWBqDYyFT
 M5crWikXY/iD0aJndkTEOZW4/MzfY+Xn/rv1oJplclzkNlMRi6qdLBS
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: GvaGNk4rV-nb-mXo3dKtWKdCZP10o2Wa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE3NyBTYWx0ZWRfX8uaYgsbvoiex
 Ik5fiFTsRv0FALEGa/1ik0vC/kEOR1XPI1exFgEJRg0i2+Q/6ZgX/+ubYNZpANxKpJUZukoIiHp
 rfQ7HIkWM9J3B3s312I4gGbEvH/bZ0WK84VjhcuPV6vo9ddVux7IsESvxOiPjp9shpJzrZuhvsZ
 m27avFGXnacXX1NQwGwi0cT6cSno3VKGDQOg8HBIn9mppBRU/lYAntVOyTcGlQ7l+vJI0PXXfbz
 akmXp5dlKmmUkdQBWsaVztNmA48J/jfAb8zJKve4/07vNeiGOkBmI7+f8R8WMrO41ZWB8v8vbN2
 8+zEhsuJQxMeU9VHk6YgUj2nRWSr9KAhK3yKUpVjHpsYo2ZeeEInjDU6f1ybuxmMpmNXJV2vMPv
 ECB3pPlAw88Wl2f6eWCbquMaa0AA1367+u8CGV016ehAIBqHjaW+gzvHJLv1pARrtcNfhX/WgO6
 F1EZIlJljbA6joe6Ozg==
X-Authority-Analysis: v=2.4 cv=Iaa3n2qa c=1 sm=1 tr=0 ts=69f4ea7a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ouq3su2OFfx9W6HEdV0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GvaGNk4rV-nb-mXo3dKtWKdCZP10o2Wa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605010177

Document the qcom,shikra-tcsr compatible.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..51d0dcab5706 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,sdx55-tcsr
           - qcom,sdx65-tcsr
           - qcom,sdx75-tcsr
+          - qcom,shikra-tcsr
           - qcom,sm4450-tcsr
           - qcom,sm6115-tcsr
           - qcom,sm8150-tcsr

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-tcsr-binding-fff1689e4097

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

