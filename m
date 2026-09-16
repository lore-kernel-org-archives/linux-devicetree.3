Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3554C1505
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572103; cv=none; b=XXMHsjsbNhUwEDKldXzArM+3GM68O/GCJNLiSm0GbHOrPgohZZYnsckjOTvMOEHD0YRdNPyOeJ78+Yuxs1nR6GPzEj6YsxTmbwBnTXHQjch8PStNSbe16wesi3B7jsAc7wTtzEScQsS/xG2QAsfHTI9A8b8FLmOLuVqwHJD2DSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572103; c=relaxed/simple;
	bh=eMnpXlTjIXA/5Bug3bPH7S+JX2UlrOarf98qCq5pmGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V/7ADQR4A7K/lXPxOm8Ajv1/5JBTRv9KJUu8Are7JZ94GIV8CEG6OSClqfP2ESrw0LCOG09z7sAxRPIxD0XyB8y5xL88X+TSLH8YCm8wSfXaVbPB11TYA3G42Mm1Sz86MSp87Zy4bAjYMyv+B2y84CjSq5+weQFQ95cM2W2QAPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZvx2lMX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUZjothi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZvx2lMX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUZjothi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFA1xu3165474
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X/iwvD5G17PVr+CbdCxOfq
	vRNLDG+jj2+X9T/JU+scs=; b=MZvx2lMXQl4q4P9UsFKlEpIOR0pbOsZToEvO3J
	uC/fP+LItF8vekJG5emINMRlrjigde8rhMJ5Bjh4fgv9og0qZkWKEhquYDFoo6LH
	EKa7QSZ1ZQ9aqQFlQgfzbbvAP+i+gOMn2/NedghQ5eEWz22o/b0vwmYlUks4BjVK
	mg+UbgHdJ3tKPYZ1l+1riKdN5Joo2IP6kPEy02sg9Luvh4ZvoBtn9Ep/NXB003iJ
	0m66FeAD/iG/m15TS34Wk+2d/YDn18e8Hi8pYF4FI0D0Tc/IxAe1/7n3BqdwqCrk
	C5Abk6KC3L+vkbWAkHm/69EvfLIHTrkyKJKHiZyllb59LjHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywby2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:21:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so1176536785a.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789572097; x=1790176897; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X/iwvD5G17PVr+CbdCxOfqvRNLDG+jj2+X9T/JU+scs=;
        b=WUZjothiTRsN6Bu6zx9AxIq1xYM57u8WI1qNJ3W9g6+Mrb6cYzA0Dtgwr6yH4zzJbu
         fFsY+AQr2xHYI+qotmE0ZfQesWyMNKP1ffkjbzhyPlCyGgAl40vZ8XoOe5YvIJO4CN6n
         DrRmeIEmh5drKdM5Lv/y72KatfzNH3qZOTf2Gf+kPvuQztkhnbK13gGDvO1v/TlfRBs0
         kyoCa99qJ1Mt5m9h41u8YTkO0xXocP7JzPLpaovJ3l0lRE/5uqZZmhV5WipKUn2XoyQ7
         KgSCSVEWcYrG5RRdqWTA98inyj1Kj9OHddoU7+kB1oc6+ZfKCPPf/JU2qrFA+WtPJY0E
         rIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572097; x=1790176897;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X/iwvD5G17PVr+CbdCxOfqvRNLDG+jj2+X9T/JU+scs=;
        b=sr9tGS8fXxRFK0OY52a8K3GHE/z5VWO9ebEhXCIbbbvZgiW9H3EknfD2Yxch2ZvsQG
         mHz1m+shSeKez9/fjSANak+aUCBIRoXdoz3Xg+c6GZjjOzcZMuwCfm02hvJMUjGMY5NU
         cL1dLC5oRaLBjEINxqv3SIzZBiiZQyxpXdxZRW1GVlnL0uEJdh3vrnFmdizScqaoY3Ht
         l4AuXcTxP8L0nw9EBXZYNXChA382EwCmt+IBfYxF5ZRk8Z/c50ZpH18cdujO2VkuEGtK
         Vy/fc1zvMSvDxbn4V5y+i8ZsMUt8Nm/DKECLw4TtR917t5Sj3Zfv5pSIThOlkhowNCuC
         V6uA==
X-Forwarded-Encrypted: i=1; AKwUvByD/CNGZ+uGAM7eFwg1ugnsF1AT7/1N+4Wf5+fmsa7k7D2n4JIBy+buluxV1z8F7oZMjsG7YRyYPGt8@vger.kernel.org
X-Gm-Message-State: AFuF++mUFi2AD0lXSuEd75lKUvPF7XCtJZ8r9M/tdH+Bsb0D4cquSdP6
	01YUfItNskQyBlwurA9LVSknObNlIJHpfNV/2itwczoVTMeP/w74puTEkYW6ymxzMwV/Ld7yLSp
	n4WEDXjmUESmpR3bZmAneMlenKl4V6Lv4kuVc3jgdKoQCp+4vb02VdO9TSWz1JS4A
X-Gm-Gg: AYBFou1nJ4ncVI7XFGRJpD5ozP3Fd2j2d5b3hgmr8oZasN4tfImYTrkOy4h9+gImZUZ
	hm65dAgP1vhf/6TMe9AC/qRoxEdhTSi2/IxKbVEgyiV23u6wP02RjkVcXpRUB9k3sZRHg4uEEVz
	40CyqY4VxZFjlK/mN82aT371r3wCHembTFt9QxNPJKATX+LAcWNtaqTvFPt12eIT8ZNHzSSm5XM
	r2zGg5trIXvdSfo15T2SkMVgiig/AmejbJQ4qWlVItERW+QEorumTRI7KxgsD//0hq+TMRPZ9FF
	PI9t0ctDKMYBcu6AZZXjENm+8nqdr+CLiSkMleXPVeOQwizoMACNU28U3wS6hG6X1GcISFg22uw
	r7VOqtRSYCVzGfRUuGzbgE69NEzU=
X-Received: by 2002:a05:620a:4804:b0:939:57ca:7e06 with SMTP id af79cd13be357-93bb76bb33fmr394780485a.9.1789572097369;
        Wed, 16 Sep 2026 08:21:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:939:57ca:7e06 with SMTP id af79cd13be357-93bb76bb33fmr394772785a.9.1789572096782;
        Wed, 16 Sep 2026 08:21:36 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fca34asm75757245e9.1.2026.09.16.08.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:21:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:21:29 +0200
Subject: [PATCH] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA
 engine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPizqmoC/x3MMQqAMAxA0atIZgNtEEGvIg7WpDVLlFZEEO9uc
 XzD/w8UySoFxuaBLJcW3a3Ctw2s22JJULkayFHvBt+j7ZkxHYp8YlBjtVQwdsE774iJAtT0yBL
 1/rfT/L4f0nO2W2YAAAA=
X-Change-ID: 20260916-nord-gpi-dt-bindings-f4b10102d22b
To: Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eMnpXlTjIXA/5Bug3bPH7S+JX2UlrOarf98qCq5pmGU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqqrP6+Ptmf6Et2sR3y0PlpIOKRf8fs4kjZ5cLX
 Xf2czGA/JyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqqz+gAKCRAFnS7L/zaE
 w+/EEACPJIIIzN/WJLGCaf7hl1peL/GNO1BAIBW17GL2UGBDrM6+o0/dov1L3U6ujqad00fd+ME
 4GqjnG/gzGCyRv2rbwXMWX2YTFJeRYiyKhKWNnIicLmc3YeH/EEw31jl0Uho92x0IC5YxGTpELK
 FAVrk1z1mzvJlomFYt9JLumYft7P7fHJ0xvmICcVJpWP4kpafify5V4KjL0Tt3GRL1tfLCupM1Y
 GS5Ohx2EnqKldzQAQL1P1LfeEi9pCi6ugAemjsaQLI6HK/29GlYuo7JgSB2gSY/reZx/xAxe/DJ
 ciOnxFkusJBJMKxT9Bh4kKm7EIV3x14gKTUDMfbRd0Q4JXyTQcPoQwYzj3J3OxfcNTiO+N7n8Gh
 7zvFVbH2GgV/u2a3DF1IdUApOu3WeQFdMwvSSJLc9Xi1Y1Fa/Uiv0M+Fgpxq2oaBOAsalEnxrIc
 plDiiDv/UGVNNyAWXue0hnVqCjHOkRfvqVviWKv+cTqcETPk+I5XWG0Msb9GC7MjCCsKl4wmyjW
 CifWRAFIUNT/BO5rASF/HzamgdQLEsGqntIwUDy9jC0cQmwOQ6QJ1n+LK3DAO61kFmozuZYVSHL
 Vi/viLOxmV72cKPMNxLFf3QbgCxpUjqB2GEobo6+PPS43oZVrv7fU/u9kdvIthE8K7A08KpDyGq
 +y5T9efv30j2tYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: vzbBaHQfvWCTtjUJApEOPUDCS6O_UPCr
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaab402 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=niPqjDDPxPU8gPvr_8UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwOCBTYWx0ZWRfX4ePNdNIsbmTZ
 nacD3Vp1skVT6bVO4wnZ0hv5RHoWQCOtNeBAy+aszs16vLRR2Hqsa+F3I3mTgM4svXvyZTEZqT+
 hW6vlUmCcfgbDoT0ScZd36v1aqx9NZk+Rc+ODxMSuSP+1Ni14SZvCBEWnBUjJpU2WWaUmwfDgN2
 KnwIhRLoIvsRIDqcgK3YCmxz5XwIRH7voUPt1eFu3qC98XWGIsl1siNxsDy7Wlv8J46wATxuFyL
 Rf00UX1QzLhnK+JyD19bUwBuQmPjEmZdNnzHY57BKu1j79WsRI4vhom0C25dVISbNryHXl6IR+U
 f/KwebhYJYdPXzFNfDdtIEjh/BcfE4Yl9XgQ3gfcyUFmQv+SFGcaWJkfL/KbwawDaCwV8hsZRuh
 H7XyhaBaIpFJazTDxrwUp3u2qKdNx4Rusw3w/1NxKkHsscpusyPCJwrEnL0QZiGZQLcewzCl5O+
 pLZyDIIYerckfXa/MBw==
X-Proofpoint-ORIG-GUID: vzbBaHQfvWCTtjUJApEOPUDCS6O_UPCr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwOCBTYWx0ZWRfX7/bGDwhj1P6w
 LYpVqdnhdIJbkcXnjdL0y6ry1tA1Cpdbe+zJ9HuULUYxOHrcmaycwAG9DiGrBLBAg2jGLl4aBzO
 YNWn5x9iuRPhzGrAJKjl+n2EBsbDx5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160208

Add the compatible string for the GPI DMA engine found on the Nord
family of SoCs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 54dca623223d51373a4d54591f3ebbf5e31fca17..ad70717b5b86e600e74d6cfe42015dc03db25ba9 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,hawi-gpi-dma
               - qcom,kaanapali-gpi-dma
               - qcom,milos-gpi-dma
+              - qcom,nord-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma
               - qcom,qdu1000-gpi-dma

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-nord-gpi-dt-bindings-f4b10102d22b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

