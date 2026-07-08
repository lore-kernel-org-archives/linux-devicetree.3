Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5614A3EF644
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494405; cv=none; b=QmHwzHKe54jhyXbHYj5XVfkTr9FqRXfoJttNVBL15MJ3oBqhTZFU6hnyVWZxZb99/NRY9dmTfBoon4J/hxEZI2noMZHb6FXapO7vZB5zogqCOPur06SpP9KAVUvUCFBqSM9Jw2+DtYmxs7oocUqhOhDnkTEokn5FByQSYRMCKl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494405; c=relaxed/simple;
	bh=KsY/Jzd6sqCes8KP9dBLhmzdqd9FLJpumSOrdFVcJlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XmV5w9sEjPXt8o4YG2Qh7waOCu8VHpIc5fF61O3fL26InYNV3Su64jR+X0eq46LxkI51lYsI0MGBdNhBD9ju/7Tb11oYweXCcPYopmiC+asPd44Q3LWSfvolFACcIE08KEmprgSOAbUAUgXppNqT2cSi1ALBadx4WL7Xq00b5d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUfo+VjG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZtz5URl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUfo+VjG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZtz5URl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Tvq1447427
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 07:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qdLP4nhBveoly+Cr5TP4Fr
	k9KAJFIX+cboR8a25H/hg=; b=hUfo+VjGTZgAv7FGwWz9koShyRUPABu5xWg/ew
	6fEeZZv3+Qs+u2yAd7/EDRzlzWRoAFBR9l9pQ8Dcr6XEEny+t61LFGLsOseUMH3V
	F/MUZgbmgBPTK+a4BNr4zRUSxeA0/fMaM+ghSuAYfW7X161nUywvwf4dn4dzex4A
	IjSYq1YBa84uXBB4yJKAJS8aJcqneCsj1Zi7o4Qw0KKS9hwZs4LY7i7Appa5wt/k
	eEdJ9vO29kMkdBSWs87VejQR4wDKh+T9zFXyd9Duql+7ryYf2DCyZBwLM5AKeEzD
	92Bf/Z1C57XNsiOxUZ+q0pUAw94ETVpASIPkIUulqSIyxjxQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u125m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:06:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8479b45ad08so657351b3a.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 00:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783494380; x=1784099180; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qdLP4nhBveoly+Cr5TP4Frk9KAJFIX+cboR8a25H/hg=;
        b=NZtz5URlX3xnFClCJcSXpcHIyxayCRVb73GIagHe1cYm/SFz6AaOEGeq1BfZTUDL5C
         xds1oT/vE/XE6uu0V7vP4XHIe7rjxcIIzxJSa9nUQximZGq5tPw9uSJW/vGTZEFraksJ
         LK2fXbsaVJnVfrTEgDHRHOBQZ9u5UHAZ+f6Vewx0RuPyCPTDdyezpwftI1jiag0F4c8Y
         Rt5y7c41KlQXGmsbL43ehpkS5JqDWRCHOIlaehDl6MF88j+zjGHYJmY8CCl2tcy1fSdS
         JCLeXZv6QZ4i2ubxPCp4zVJqp+As9k7R4xTboSmC+zBbWciy1Y/na695UIqRAHESx9Lc
         bwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783494380; x=1784099180;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdLP4nhBveoly+Cr5TP4Frk9KAJFIX+cboR8a25H/hg=;
        b=G2t1yS3dqHrJXPsVt5T4aEhDxNa3wsMB1Hbi5hD7P7CDM+IeK0T/RFhCaIL4TNabiC
         i436mQsBjN0iKkqsWAXJ+2BGuNz8j9KDrsywpA8VHQYA462/ZhnbK15ZMwzlH3Y8qaHO
         3QfVzFfK2lYk9RRXV9JK+BOhmWFOG6RwmuJWz6jfVwkmn8L9JVuZ4pRCS7yq8cCXx6ZN
         Hp/0GXfiZUcuz1rFVnVWlHxwjjh5DRiydSRiZfQDbD7NYHCzMJ3414sf85WgukQN8is8
         WxDYiiTss50WTq5AQJtp+r1xSCv0p3VTr45sJgs1l5uxGrtujx5xn5dbd4AitmEw30c0
         p0sQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9pPt/qTcLC5uFi8A8QUBNGCQx0euY5s0c2lSCofeT7ZkiaLYz66SLSe0aNzvBh4KyLS1Xowy6j96I@vger.kernel.org
X-Gm-Message-State: AOJu0YxW9kuwXAP8w2s1ANtypcd2bl1kvToQGrkXOenWZAgtteF6yCa8
	P9iTX2g2AzQCxdtzCWFMs2uDoWPvFTkUfgcxSeohLnX+cn6sRSJmwW3WGy6ga9jt0uTE+xmGzzD
	/7qxr/GoLmJl3+pizccj4adNME/k/8LkdYwB9gpwkNa5caJqj+ixD6WDJk+PPQV7e
X-Gm-Gg: AfdE7cmd2zdIztsBzfZnnUC//29UlxC4E6/umaCxs8UyXDAoVMHYfYO4HDQupfAtrAa
	Q8rpRpUeVC+4vfvSrMMNST8EBTguNxNsRQpItJFQ91W9WWugN8h9myaF1MynRkyUY+/mPFpmvg7
	M07Ho1UwJK66/1GvnDLD0bgt/3X30cPICSKKSICs5cC1TVF66cb7fpNUQF959h9+ZL+xA4mcFKO
	8kHkVWMrWuX8kUhWCzwcwD39C6dkV0AYXu6V7yGsLROH9OoQopY+f+QjoiIMnsi1GH2COcXN5EJ
	UDbSQes6ddeH3esI2ahdq07x0CSYkcRdCIK6M1Cx2zaUeAHxKwo+bGPYRz9BkXW0F/GBjqBYYXK
	RJ1NXy4SqvzMPXA0De+7TvSUKtSNukhIjJ2rnlVeroh3IhQ==
X-Received: by 2002:a05:6a00:2ea4:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84843452ed7mr1380993b3a.59.1783494379723;
        Wed, 08 Jul 2026 00:06:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea4:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84843452ed7mr1380964b3a.59.1783494379232;
        Wed, 08 Jul 2026 00:06:19 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d85c04sm6829148b3a.50.2026.07.08.00.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:06:18 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 12:35:38 +0530
Subject: [PATCH v1] dt-bindings: dma: qcom,gpi: Document GPI DMA engine for
 Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMH2TWoC/yXMQQqDMBBA0avIrBtIgqj0KqWEiRnTKTUNGZWCe
 PfGdvn/4u0gVJgErs0OhTYWfqca5tLA+MAUSXGoDVbbTvd6UDPyi92aZSmEs4uZnecUOEUV0AS
 LU2t8P0AFcqGJPz/8BpuB+//J6p80LqcKx/EF3b6KeoIAAAA=
X-Change-ID: 20260708-maili_upstream_gpi_binding-da1d2af41b78
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783494375; l=1004;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=KsY/Jzd6sqCes8KP9dBLhmzdqd9FLJpumSOrdFVcJlA=;
 b=frOtO7U06hjqcljeD48PFcGu/9sGsVTQK9cTU2Udk1bNUTvCySKGVfCc4p5kaqIl0ZC1N611s
 4zRFiDMIK54Df4L6yd8AbLEmA5dYF9T9oaeWLDzD8H9x3lGihs+f97p
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: LwlneimlcNlaT8E5VWY3Bb5bLlxj-3A1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NiBTYWx0ZWRfX9jaiIuvWb/NM
 ekLt8XZbUT/tPYDfSbl418YRaPOaLa/C6rL2wK9Pndyj+KSak4sDNQa572NF08BQuTJykxXFspe
 oxoq2yZBCgeb3mMDGBojMisW8xhXpas=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4df6ec cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Tqk0DnLf0ofBf8r947gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: LwlneimlcNlaT8E5VWY3Bb5bLlxj-3A1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NiBTYWx0ZWRfX4qDlVxWWaxTw
 3wV/bguV6OHdBvmIlENkHIbL5rV2Ygs3k7YWp4Ofezmrg3zq032psZKXhDDGTdHM+DthyJiPRhJ
 vzesyLqerhneLv4HuuOYTFY6BbSdEQPTt28vBDz2a1gs65LOWpIGyRykc4CrMQTWS3iwQjm+AIz
 uKo8d5CnlACsP6r5JOa1XaZKeB2HQskbeEpSz+CTMHU6Sx2Ku8isxrEHBm24fYKcNB22hKQIbSE
 aP4i7t+nL0sqf0sDJXzn8byvCQ0VuTwloLTgqD9/1tMfXs/5VINTqwHpSnR8SFYsBQ1Qa5ojduK
 cogI7oYO3VUZ1HTK3HVcSOxU3FaLs781k8myetHRsnuSHaiiJYxH7jmrOpZbs9o2Xavk7EhdAlq
 1WP0NggZO4lMRluKKnUoWJpziQ3Zuu0Ta/bD/kWvsC+WeIo+Omzq5G/wCxdPtuY4qlJKv5XmLQc
 8MyOPZ9vRKxu//c2CQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080066

Document the GPI DMA engine on the Maili platform.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 54dca623223d..dfc4a3054b5d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,glymur-gpi-dma
               - qcom,hawi-gpi-dma
               - qcom,kaanapali-gpi-dma
+              - qcom,maili-gpi-dma
               - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma

---
base-commit: 598c7067dd8b65b93f3ccada47e9014a13137f1b
change-id: 20260708-maili_upstream_gpi_binding-da1d2af41b78

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

