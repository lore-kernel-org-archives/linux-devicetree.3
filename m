Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D9E39EF14
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784187635; cv=none; b=EVZC/zbmdfyuCzmKCOuqnl66tSnQjCL+1cToE5J0w0XXFD76B46w6Nra9QKD9N0HU796l0FcF1Y6biLQ3IDgknYESHyaKIxQfXL60LS8f4VyHIXRiwoCn4tUernDVKYVyDW7FuwyhCBE3/gUDiIR1h8pek3RYYqakraKsB2DSK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784187635; c=relaxed/simple;
	bh=VG2kdUHod0/it+DpRMgfWwQRgfpmbq8xBn2w+ekmQic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AfcCr9amvLW/TDBrQNmmRjhi1/5S6dMVmzf+J7A7TpB4t/qSMYHv3UPfZUcxWxGrHcoRLym7NBvToBQpwanFKqW4tNfG2d6WtVMBPLYJ9Ws4BDOMXVxa6I2e2ozTH0EHWNVfyUTBopxIbgeYcTxGapLJ0bJoimOM6tAqYerAae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRpMEmNj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtwrmewa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRpMEmNj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtwrmewa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DUnx1994824
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5o08bikOVkBzUVr2mmA4US
	yJFI4FI5St98YE/NK9FMY=; b=gRpMEmNjN34dO/hONjNy3ukOND+pzcEtFIRmuU
	vmBLbjWQtCw8G9IILyF98xri0dY5D4VRcqGkcGmrDHTreFfHFG6JQcSPVRzaVALy
	hx3Ic7lx1R4S4sLydAf28/ttEaaxo/zzYRQtS8FQydCHEIO2z4K3z1scXH+97QW7
	t2BrAOKruovlgnFe5vIFmWmRfGny9bAtJo78Ryy6Fk4/mwolVKffDcRnTAyIC+Yv
	U6/9nw1O07hqbvapxFV22EUKAPUJAtaBDz/GkONwOup/jkpghqT1QIRBlS78Zefs
	DFcUX+TLvMw7qVFWkB/0t32UjSB0QNEA8IiqHa/MB07FkL3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqjmbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:40:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so395558a91.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 00:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784187626; x=1784792426; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5o08bikOVkBzUVr2mmA4USyJFI4FI5St98YE/NK9FMY=;
        b=gtwrmewavHONAS7xGw1sjNQzliExaiW/ec7MG+R9AZne1MExZHlSfiBROJIGl1NjTx
         HGC+IwY7HH3DC5Tr5CC0QYRDI3qvpABh4Q2vyXKFi3sfLd3zXqK3ENq5/94bnZDtJR3X
         1hdH6q0dDfWB9OBO2t9JMFu8InHRvcUpgANOBOBYkG1IuVMFFibs5Pw3/l/UTlugww11
         pGFfHKRruhhHdvwA3Cb5A5dCqeAxweKXoXOP2qDgL0F4V2ZnhEI6ZNB7oKK/0MEJuk2w
         9ZE+9OTjg559UKcQZmMdRb+4sKjtDEuQ9Bm7cjmUERnNSdQOGQZk7oOWWNm9pWnq1yhk
         CDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784187626; x=1784792426;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5o08bikOVkBzUVr2mmA4USyJFI4FI5St98YE/NK9FMY=;
        b=MnhN90mssQ98huZ9AkaEANkaSNXZG08LMsCwF9KxOcKJZ4IH1RK+6f3+Gjb7T9Kr/e
         wIjZL96XjgXMNqaRur9YR3PoKa9GfLMFQ6OGIGZTQeRzjk/1866KexI7j8ksh4YPI0p9
         toFhVXLbB40OTzGLS3uJjxnhbinMhEMpBcLO7osQLdVGehPHCOuvtEslBMXojN9b1XN6
         +jWDGAQydzUgTwtxExDn2qXR35SnIASgn4gPrve+dupDPG8JJddHFzSOAgPZACzkuKZg
         24j4I3CaR88sOuPiC26b6iswFhqz9fLRaavHYJCeE8HPLbMl3nrNGv0zJd9eBGt8185v
         pYlg==
X-Gm-Message-State: AOJu0YzV02bJcwlCwELo+NVNRVZ//GifYdVOnt20OzUtYnJssDYp/IpH
	SUTKXXFe83LcnLkEEee6zmrAI/BDMMNHa0V1rSBFvDPP9bSOB8tfCZYsWYNT5Rn1MI9A7KWLfSm
	mfAXFJPtlhkvQeiAKfMDn3YbPjeNS57/RopKOWJc2uiqB9Hm7zbW4qRsQ6o255NkUV998ZSWp
X-Gm-Gg: AfdE7cnIoBUhKY3k8wClr5htjY1sycRlmP94qjqaIRmmyfjhDqZjjjA/ChElHgyD4zF
	kJqfU2tG4PAOpm5TisCLjDhzTsNr140T+KJLxAk9y+zJU3sTBfJU2nkQWp20xVH9odj9wL97qtX
	aHNS8/wJn0mxQUGNxUe8owwlyA3A0h4JVu1+d0GqgAGLSKJ8KbOm9YR9IYxTrmvZMtd1tn4JWgT
	o+SBGMI61fK+iog32eMO2RG4oH18XEaYBrLv260BRUC88Xoy4zA2CAsHPQkpOle8ro/KrkD22Pz
	yAze3UpQddDL2oG1vMwZd4G9UvO/YT9jj9oaileUvuCiHMP2CeDV1Y9Pe0Jbdel9XYasdbST4sC
	IaWVb33otdeFKxmA=
X-Received: by 2002:a17:90b:3f4f:b0:38e:39e0:5e2 with SMTP id 98e67ed59e1d1-38e3d16c0d9mr1094742a91.5.1784187626003;
        Thu, 16 Jul 2026 00:40:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4f:b0:38e:39e0:5e2 with SMTP id 98e67ed59e1d1-38e3d16c0d9mr1094716a91.5.1784187625514;
        Thu, 16 Jul 2026 00:40:25 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a119c56sm845928a91.16.2026.07.16.00.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:40:24 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:10:14 +0530
Subject: [PATCH v2] dt-bindings: sram: Document qcom,shikra-imem compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-shikra-imem-binding-v2-1-2c3e2465d25a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN2KWGoC/32NQQ7CIBREr9Kw9jdADQ2uvIfpghZofxRQvhJN0
 7uLPYCbSd4k82Zl5DI6YqdmZdkVJEyxgjw0bFpMnB2grcwkl4ofOw604DUbwOACjBgtxhlMP47
 aSi+Ulawu79l5fO/Wy1B5QXqm/NlPivi1/31FgIBJ6V7JTnvN/TkRtY+XuU0phLYGG7Zt+wI0U
 Zu4vQAAAA==
X-Change-ID: 20260430-shikra-imem-binding-a7bb9d2f16d2
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784187621; l=1098;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=VG2kdUHod0/it+DpRMgfWwQRgfpmbq8xBn2w+ekmQic=;
 b=24gvhx8Bcs1yo27J9XBR1Pb0LuX127mXjVY7ezJi3h6qDlm3jg8x690+TKqybo6IRaAfpS8Q3
 seuO6LdidSUBeDIy1Av/qXndQNjnqOaEW6KBDuMrEITv1NnvErmQoxX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a588aeb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9UPNi2tsFVFeL3bNzM4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA3NiBTYWx0ZWRfXw/BKgaLLu3eT
 j9RboVyiG0331FJJ0vIqS48ZhHNif/pY4agctYVrZHHQulsjTDQlxUHdrH4db3ICadngvdy4Lsd
 uFt15RqJVP5drMjJKZpwXGYLvL7x8tk=
X-Proofpoint-ORIG-GUID: u1nKDTQKgy_Ti8SrV5adr3h85POnX8hF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA3NiBTYWx0ZWRfXyZFAo6rkeg4w
 gcM4k4vQkJhzZHdUi/IeQjbRjM48wpnjvOMjGUbJ8pIHWrM0lITc2H0pJ7rf+JR34fuJIT7m0FK
 LNyHws6F/lsyBYYdKRXfh0Fq/wOl9ZJn3V+7dJF4ZZpW+a6EVaF19+MhSpFCeyXYKadmQsTvUKE
 6OMvC1XiZOI14SXv4POt6dTAfYBzO4TDbbuNsa9HwT25HXVKQzhDDa9iOAb3KE2apZPejHBC7xH
 ey7bMBSY2TRNcG9YgwfFld94kBI0aVLQuxR9Bcyon+JuLdZSE7U7p9LKntEk3TgxwD4OiX9PeEs
 MWis9B7JKmp6naIepfhGe/JHj/15yKKjw7AcS/HHBJmaB4//CfUYHNcWxGo104Hn0cEzxa8jISG
 Lxxr4LG0KGl0Sax/ravEKGvIGtzizASEOY+4AagHKXtCsuzRqHlxPe61PNoNe5yLuNiX6xJHxlM
 cX1TV4WYpfLpWg0EThw==
X-Proofpoint-GUID: u1nKDTQKgy_Ti8SrV5adr3h85POnX8hF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160076

Add compatible for Shikra SoC IMEM.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v2:
- Rebased on top of linux-next
- Collected Reviewed-By tag from Konrad
- Link to v1: https://lore.kernel.org/r/20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 8f9b335c5a9d..b83fc6831947 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -41,6 +41,7 @@ properties:
         - qcom,maili-imem
         - qcom,milos-imem
         - qcom,rpm-msg-ram
+        - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
 
   reg:

---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260430-shikra-imem-binding-a7bb9d2f16d2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

