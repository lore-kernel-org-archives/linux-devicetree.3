Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9163E3FB073
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777552691; cv=none; b=nx3heCf8N99SGf1FT951R1pDiMaxZriX+/D1OYiQjyvvFMEW7oSHo/NXcjyO/bLcg6scHWQJatr4ooMqC1i4bml/RMIlHV9YP5/2ibgdoGY0L7+/TjQtl81+a4JHgm3KAcEuQqX7t86IQMwXofj5hmFp4Qu9BKRQwQCm/BWCLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777552691; c=relaxed/simple;
	bh=qj//Wkzh+YCGIRhEKN8JghcQgtPi0UlZGGmWm9lIoPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HeemgrUszya50IFVXf/Y3DLLEe5ftexErAtYauRpyjvIen9ZrEm//TH+95OGch0DJE1eO6Tqk5pdP/uuHJaLxMF+B9jZ+tRRWgsHHKMvhcyLxVM/R2W7A2bDI8yxwyl6cplATrCy21Q/a7UF7mBetXStYp4dKoMKdfs0vKHMOZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFkj/dSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsU67j9q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFkj/dSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsU67j9q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBEB02255422
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O9yrrXhNP2KOtCgOW9iBdv
	Sup0qj/DHR2Fl9NPmNpNs=; b=lFkj/dSfASlyRlui8d/CRS5bXJtDWkP73gHnL1
	6oB7scY+En8HXjO7cvYyPyi8e+kJ0iiAHVCbyKH/QLYPKkRAHusnqi3Ba1M8zRRZ
	B2Z9tL5MekeiwsTUYjbFazc8/FqMKHV27SSQXraPz6Pws+6o/KmjcjFPOBfIx38B
	Ci4yeWLwj5tu5wukxfXW+jKefSpoCHILoh8aQqCXACLTR3S5aF9c9TIZP5PTTbRX
	uGlkgJm211iegq9zdojBZo2rWEOnubM0HEbofWrhxLTBTiSNPgtOgsUrTxhDln+g
	y7Ul+kIkUAbTk+gqv/QhuAk8N+F5h2wSYAlHRYv5suD9sB4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71m99f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:38:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso1212719a91.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777552689; x=1778157489; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O9yrrXhNP2KOtCgOW9iBdvSup0qj/DHR2Fl9NPmNpNs=;
        b=CsU67j9qn2c1t/A5Iu49XDgq/uXJEYi3jRldUddIs3WoSuCPsi2WTQ0xhk7Dp1EpG3
         5Tai+hlrdxpsWr2CKVqrvv8FtLpAcS6gCG24HLB1d/gX+Fkucc8wHXgnEfIixjcISMZr
         XFQ3Tr4g/QaZ23mMxq42ysN5AKSdvd9CRsrOWFFt1GmqiMjRM5Df9Xi3CvR39nJTQXxQ
         W1J/KOfM83bctBMw+bqh/a8+x588kQ4pblgvv3I5aKxMmKFX19uUwykPyssRH0+I9Cls
         HTDmvo7A4mDXvc/CluBLWNxDSatE/yO0jPIqtNKamEDw4jGDqUhKCYbldwzjHbj37B8V
         7EEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777552689; x=1778157489;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9yrrXhNP2KOtCgOW9iBdvSup0qj/DHR2Fl9NPmNpNs=;
        b=Kf/hkWOocw9qvb4aQoWkVH8jc6KqO1sU+PxqHQWW0DWivkRV/JQnYQe76J5Gri5w6O
         cLweT4gT3EPwgZ8haaMYdQYcOXvYWYjQB8w/KFrxAXk4vPUk1TRiFBOSE2fiyGpqY+SP
         jrCxTdY7FB+OcTuH8cAyRU5C1oTAtz+QlbLroe4qhvtqIgZqhQ2C/L9YhmLfYrr77hnh
         yrq+5xwwCuZddCPcyE0vwcKRJAT5UTm2oTU35jm3MlSp2EGF6XrKolijwOkeDL6rHy1e
         DHdAOU2PHqdsbWtXWoA8LQTU+rGdRo5sK4fECG0TSGnR0a7GLz+Zpeq6xnzQx6BdFzDR
         iFmg==
X-Gm-Message-State: AOJu0YxS7uxXkPv3MaZQgkX8TVQ55H/am56H5NKD+2UF33//uJ6bzq+R
	jkDyB3GLJ0GuPCVbbpiBaj8VAQne2BhRQcRGQgv1TnYEfGOpoAKYHNZ7rIS/a84TUYJs8noRhdc
	6aN+Jn7PMBLGzl+l7nNReN2vqDEVl9GTdomQPdLH0JlFGUhBtf9R2Z8IoSwFVIRETrIYWa9vw
X-Gm-Gg: AeBDietaavQmM5aPCRCPOm9Oh062qGNdzYJB+RYhkmmhL3FP4Z+f8yVl0XLqCKOtWLW
	K1SkGjfulY9tvHuZPuNhLnkkM3XHFDta4xiWzwyUT5Uar2G7JJvTsnV2fHFTeyNd+z/kuyYoqgT
	R5WKOWjV81H8jSS0b3PUMIV5o5qjthgB7fSGEl/a/3LKPmEUe/3Y36l6BeFYAIb/ZRkHJcngqv+
	9i+YjnoOuACeRpTATdyhVEsWV0zEHtpP6psGDCNzlkVwchOeaPX+vr6dZ1zpAL1NTyETGS7XC7q
	LAj/yO8bG0qiRvND5LZlYBA94jRbL+6ZM3sdfWZuUf9hwThOUhn0m+FVjhLFMGcul1zsUICPVNa
	5nG2a7rEDye6CjMA2tR+xgxkVRdfHyAPX5Gtp5g5Zym7HDfI=
X-Received: by 2002:a17:90a:d444:b0:359:d54:846f with SMTP id 98e67ed59e1d1-364c2f61c59mr2813254a91.7.1777552688951;
        Thu, 30 Apr 2026 05:38:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:359:d54:846f with SMTP id 98e67ed59e1d1-364c2f61c59mr2813220a91.7.1777552688525;
        Thu, 30 Apr 2026 05:38:08 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b175sm2623122a91.9.2026.04.30.05.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:38:08 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 18:08:04 +0530
Subject: [PATCH] dt-bindings: sram: Document qcom,shikra-imem compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACtN82kC/x3MQQqAIBBG4avErBswi6KuEi00p/qJLBQiCO+et
 PwW770UJUAiDcVLQW5EnD6jKguaN+NXYbhs0kq3qqkVxw17MIxDDrbwDn5l01nbO71UrdOUyyv
 Igue/jlNKH6wbaOxlAAAA
X-Change-ID: 20260430-shikra-imem-binding-a7bb9d2f16d2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777552685; l=842;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=qj//Wkzh+YCGIRhEKN8JghcQgtPi0UlZGGmWm9lIoPk=;
 b=MPmgzHn2ZSOgAR3r70sx2VV+dfDmCyxI4+uXLdYj6S5Ew39E4M1HAZnOg1vnu87atzWup5LIJ
 TFBz9kqdau9C7XHc96+64pZprk6FwVl0Z7JRCPBbbSdwdvbQ9uQTo97
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: gi7bpoByJulpgaDFDGuxr6HyO41aaT23
X-Proofpoint-ORIG-GUID: gi7bpoByJulpgaDFDGuxr6HyO41aaT23
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f34d31 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h9Vahu9gEp4pziECjasA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyOCBTYWx0ZWRfX/SMXa/QcBXVy
 NOfCwUEkA+VNSuSK1GBl1PXPXwb/I6yd468TLzSzDh8NGdoRTa3+Xkjh8JKrlRBecih2lXezuFK
 LbJ8yadt2XmQJLyMcpcN5Fjdgv76uwCPvAKyV+0llK0TdlAJLfaFMmJ6s7763dov8/hnq1moO1W
 GQKmL2LAul7kuTjBu12z3kO1FZt44f40s7vH0ZPXjM/E+uU+awfRURaJXKATAMphb1EkrOEUeRh
 Wqgzm+lTP3w8CSKnzlohdFH9sCzLfbkEq6eZrvohsDfz9JZYNWmcmTuBg+zxMvRq45wtS94NQBE
 iqSPkbC05RQqEGGV/L7VmTS4MK9TP7ulf1IchsgF7caFaTO71T+IhIRABMHvAuVjFFCWyj0VFKn
 kXCzrQAJSYX9aSkFe3TOFhNnlDEvO9UXQUmDIAsoXETqDRO9g+/z5V0PF9P6s5LNMIvXfqP7ca4
 VGkLc8ZfmqbLnBUahew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300128

Add compatible for Shikra SoC IMEM.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 8985f89170be..ce07e7e5c81b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -38,6 +38,7 @@ properties:
         - qcom,kaanapali-imem
         - qcom,milos-imem
         - qcom,rpm-msg-ram
+        - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
 
   reg:

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260430-shikra-imem-binding-a7bb9d2f16d2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

