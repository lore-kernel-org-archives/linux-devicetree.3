Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFC738E5CC
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026989; cv=none; b=m2cteKS5FJI3Ld2GjzxOVQnHk0VUpWIlyv5Uir9xdCTIqa8C24EyNt1hi2Hy0gde0BeOZY+lhG728cAGw5iGorZJzt+Kq83RW0Ep5L/PWuL3naTx4qoi6ReCKLHQM9wcLKr8sN8sADCwYCwRBYAjf0SX7fUwiFBQuwZ3XLexUkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026989; c=relaxed/simple;
	bh=2pD65EKhTqnzAcbEnGR4VBQsKzDDuQwMXw2PekiqhOs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ka6sP0YVbwywxp1a6+wGNRP0NLVSPgtCSNp/m3waS5AiXV4JRkGSfcFPozXzHFkAC+0/DPFZ9/NEnkO2ATsLcfk4Zaha1lLHKbUVdmV2lUgBZkEQfywOX0Y67hJxNh38uHrmXMkqj3qPVpD6mEUXKr4eToKVHxobO+tg/6J4tDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEHXOQoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2CuiLVJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEHXOQoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2CuiLVJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O92Ubf1533268
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hNqn1IyPpJ+B1Mzxz1Py5l
	HkjehsRiXfRYYRuNWEddo=; b=mEHXOQoDPYKDugqDjcZSrjwxtZqX8H6VJS04aq
	a9I1jbldnk6Uv1e6XUArbbkLa/w35a0oHHq4BtHhUqpzk1MFCv0Q0fGA4ak8Lv25
	EyRbbkSzzG8fxUiJOyX9peKAphi7T1Na95R0y6kSwo68p65GXVYadTVLL6oW4U2/
	LjZmcQnuD5oR1dBSz1DQO2Oc1IndJ7/OwsorLylNpQNlsuFuPORssQbKU6huFHlP
	xAjKYU8kkwEKB8DCXlHZD0g2T4krMkk2hx16aMYhFpoV4v17gUxt0J6iJbOQ005X
	DVYXNGzduSdZjvfSvo00hEg0UhE3Ey8e13KbsMP29Np57rmQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kmxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:36:23 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c726f4055so7261962c88.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026983; x=1777631783; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNqn1IyPpJ+B1Mzxz1Py5lHkjehsRiXfRYYRuNWEddo=;
        b=g2CuiLVJDZ6kS17Rubd5rZMBMF2VeBUNJdEAJsN+dur0KpaMGCi2BZ2g1n1PN4rpHw
         bbl/3nloBhbIkUC/BZYkdVvX6LOM0caedzU4wSHqc5bppL+R+TvAtyDHS6rJPjpjDI/k
         UTtvZzOjPCejQtkaQ+m9BPLr7kpYK/6e3EoPrYseH6Wq2oS7QhApGxNJcnmtlYEXIuem
         Ilyi0pHvQjL8dbp3+fsh45YMQW6AuoGNeUgd1WvMGDcU0qAAwKTTfYwI8ytAfHByncuG
         JI0wzzld2SpmIt1uBXQYiTfi0MmBW0AlfQIgCtsBOb6WZnI4aSPfjDWVhmONarcPVEJ1
         Hi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026983; x=1777631783;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNqn1IyPpJ+B1Mzxz1Py5lHkjehsRiXfRYYRuNWEddo=;
        b=U4ggd8U1jieIxEYEZjpuJcDs3uXYt8TZClOsNIFNu2Bg5W1+hxyr8TkB5tD/JqyJ+x
         Sa//xO+01YUMjvmsxUcRsywBo72g7ZCUDID902DEbv0mzflcpbKg1FvYpXfCwiC8MBOU
         m3Y4R43Ie0O2hBgBh3CGrkRmGaxK+VLEmA+JO/B6IjYO8XGxUqH8aVpC6zLbvyHsAMEd
         cQZzreBRn2++Eb0PoIgzIpycuEyOSkklhqXZ1ghsKVuwI6BFfu9++BCBEYzHucE+KPfp
         GKq+puzB7Xk9Z2bp7tA+lxmyS0KMPSY/3X9cq87ooQUu4QSZ1t6PFLKhNK+OJgpuum2m
         qIuA==
X-Gm-Message-State: AOJu0Yy6JKI2xQNssgUTEl3jP92aOelUTn93+5vYDBfA6JApFKwJHOJK
	a21XQLwSSccNhlAkpmD3sBTMuP18kXi7r8s3z/fQCxIL1agtr8egrTy1ChWjU9rm4KvNITiKSjU
	tmB3CJL6KCvv26nrfFneNR6IijkNEwtYbE2NtYyi/UkREWzlAwJvdCPM3UJ+hMgOe
X-Gm-Gg: AeBDiesWvopiL8MgKvgE3jpuQC4YsukrrNN34mgcPTuHvYfeV4bgGXSKeOy6nCOM/nT
	UCmkIciyL1imSbWZM/GEZPa+bHg1aMGUwSKURZOLCqI5HLcgbn/VzFqZtK6vX78YdOA/SNI8rE0
	EBia34tnFx7Ju9wGP1ZZsX66yPaLhQqmavH2cSQlvNGy2yF+G3CEcfRVvjY866mCJAzpPRhH53i
	X3aPpl8Z5CiBAwBMKPv3+gsNaCt1wIEeK0rX/Gsj9+EF1Vpvhh5iDpHsO7xx1ic4W2Pa37HCQdP
	5QsM5hsnPk0VKoehYJO8WovG1RDMBv7Z7cu8b3CW7c8ibs4Ez3LK9yoj8DdXWUVaAeXJ35JQSlz
	0N1fqiCe40yt6wGanp08EDEaTWCqhsURCGH/lhN8SgxJNEiqXeiFS0VTO3m6u2rM+uzRCpOkkAi
	xAXK6PBg==
X-Received: by 2002:a05:7022:23a0:b0:119:e55a:9c04 with SMTP id a92af1059eb24-12c73fa2498mr18020852c88.32.1777026982875;
        Fri, 24 Apr 2026 03:36:22 -0700 (PDT)
X-Received: by 2002:a05:7022:23a0:b0:119:e55a:9c04 with SMTP id a92af1059eb24-12c73fa2498mr18020843c88.32.1777026982278;
        Fri, 24 Apr 2026 03:36:22 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm9187846c88.15.2026.04.24.03.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:36:21 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: add IMEM and PIL regions for
 glymur
Date: Fri, 24 Apr 2026 03:36:12 -0700
Message-Id: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJxH62kC/yXMTQ5AMBBA4avIrDWpxv9VxIIaNaJIi5DG3RXLb
 /GeA4uG0EIZODB4kKVl9kjCAOTQzAoZdd4guEh5LGKmpkvvhpFGzYqMy4hHCeZFC75YDfZ0fre
 q/m33dkS5vQu47wdODGbSbwAAAA==
X-Change-ID: 20260424-glymur-imem-970c1015e89b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777026981; l=1414;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=2pD65EKhTqnzAcbEnGR4VBQsKzDDuQwMXw2PekiqhOs=;
 b=rrciBuBertBi1DPTT3qM6S3cbxHPKQpzcsfo21XcORiIMiGQTSLvjF35oRJ30StIwuuwSx5sG
 6D3F1VruI24B6IxX8uJ/If7XfCJygv9evHgApE3V53bqEY5Fub3UA9I
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-ORIG-GUID: CvNc5lMxw_qDhTYHvIELlgoP5QVTD7vB
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb47a7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rNtKtUGQz_EyKwJUZIQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: CvNc5lMxw_qDhTYHvIELlgoP5QVTD7vB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMCBTYWx0ZWRfX0APLn2RLhxp+
 EACP4vNNU4XT9j8iXYhqb3icse4l2qL0CWRo76T2eAjS6iaiVdHMst9KniR34clgjz954rGtnEc
 dcBgD9PeQ4vEnm8vhArvgP3Pdt5XGa3N4EJ8YlhH/JorTEUFNRt6+Ym+6N/I9Dh3sey9119g53E
 ZS3BngTu3IfMp6eB1x6th2OKSJXBZ7w4l7BK6Y0fjEmWe3wlz2kxz5TwV+WEZJtoLGwu7k31ej5
 mHhQjlfpd9O1iwH58rLmg0+w2JfbBSq8mfhuMw/CkJ4cBNsZI/3YbIZhgW4D4UUPPirHK78Mrcp
 LzzmUBzgndi0f8XlQ1lbhoQTp5P2VP5dhSMMFidOEBtJGuP1QKg2EzkBgOcZrzF4k9KMpHJC5ek
 EoB7yVmC+jovYtK0n0NrDlecP8Es95Q8ZxI0ZPvRqsHMP4tg5fZ3xYGGP+wWoPsCtG23/8oZRO5
 mtzDgaTzeIRwqJXQI6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240100

This series adds dt binding and node for IMEM on glymur.

changes in v5:
- updated reg size to cover the whole imem region instead of only the shared imem
- picked up reviewd-by for the dt node
- Link to v4: https://lore.kernel.org/all/20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com/

changes in v4:
- picked up acked-by for the dt-binding
- added dt node for imem on glymur
- rebased the commits
- link to v3: https://lore.kernel.org/all/20260129071435.2624252-1-ananthu.cv@oss.qualcomm.com/

changes in v3:
- moved dt-binding to sram.yaml for mmio-sram fallback
- link to v2: https://lore.kernel.org/all/20260123101501.2836551-2-ananthu.cv@oss.qualcomm.com/

changes in v2:
- alphabetically sorted the placement of glymur in the list
- link to v1: https://lore.kernel.org/all/20260122093319.2124906-1-ananthu.cv@oss.qualcomm.com/

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Ananthu C V (2):
      dt-bindings: sram: document glymur as compatible
      arch: arm64: boot: dts: qcom: add IMEM and PIL regions for glymur

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: 4c406406070d57dbefeaad149181785330c23f92
change-id: 20260424-glymur-imem-970c1015e89b

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>

