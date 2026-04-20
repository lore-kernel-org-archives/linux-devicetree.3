Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F417F39478C
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679482; cv=none; b=G6aMWhLrzTB+VGDGb5iMa+t22A8DmnjNcGR6U8HEBkXv9xaa7CeRJo/83Ub6EVtU65k6ld9oeiOJgTQykr5fTYGAUr4hmANmb6P8zMPjQGb7hViWAPmXzTzHHmx9Gdy5i69fQxgohLr3rOurdkL6SK/NTtH+9hQcNxSnyPM1qDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679482; c=relaxed/simple;
	bh=b3zzuY6TUS4lgqMPJCu3ADeR7Fg8Kb0+2YyrmLzQdpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dutTXZ0A1924dRcApyw4Z5uZ/Do1XzA5RSCs4tYwsmXbUJMVhpZciuelmzoizQVcvLXb/WvFuDNMbfrHm2z+VxiZV+2qMT6OquMOlkxVIKF5uD8gR0S411000ewp/lAdDUbq+cS0q7LQsGGnj6siGBeM6ET9ALDsABi8b0dQGSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deAFQQ7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B17pk1DW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deAFQQ7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B17pk1DW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7ZA543456138
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EIaCzSLbPIl
	cN9EEk5IcSefKG1COTkQ/kZY1zJv2364=; b=deAFQQ7YBJL9YY2S1NyUQaqbb3O
	T9raiknYhOqG4WgHnLFA+UkIbNvLu0JmMHwZnj74GglnVVZ5Ouue9kFU5Clpo2pU
	+K3u93EIAKKvmyx4G+Cta7iEXvdZPHwnsZbQvmZmSzYNf+D4LvVr2ZzpXphBDvgX
	JJ7H/FTF8mgthzvPvyfw635f1wt7iKuZ4ubRomItIMTzBL/4AWBgtOKORBkaHhjt
	n8iBuxkbIfQT3efCxVW3rFtenHl/9LRTiM+qzfbgqWcFSeRDBUqXPlWiZSf6stjy
	S8Co/GBgEkLZTkb0GzBp2TkpjJdhZhFNt28FgLE4R5NEMYIXHGFfc3rbUzg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjrrt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:04:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso3136229eec.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776679479; x=1777284279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIaCzSLbPIlcN9EEk5IcSefKG1COTkQ/kZY1zJv2364=;
        b=B17pk1DW/PJcfgiAzv7U7sZElNO4m87M2sx1/4OIpWvNXw5QE91+kedrJbrXzrW8UV
         xub6HVYsJ0lyWYcUvCpI0eJSaR0hSW8sH1sAZ/jflAvO4aEnyDIhdtQ+Re6qX4cGyDB1
         y+Hit1/3eYaQ49GLYsWTuOh2W9jMFfcl0QxFWG6fYbDAB15aavFvi2l0p/seSVUxxo4a
         G+vQF8bypc1dFcKE7LrrSKktqtnVfM2HXN+2JNfUpCPS6Z7TF/w01ulnvnhQbhf9YWmR
         MyNCo4xqObeU4mM1gDHI9pc0xTNShhoZ96vDmAdIbMvZSH0wH5J+0wnzZ9OboZhS8vYN
         vZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776679479; x=1777284279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EIaCzSLbPIlcN9EEk5IcSefKG1COTkQ/kZY1zJv2364=;
        b=F3v+Dzz/sD5geO0SkSUhyIxuGU2qQ85zUS6PPnj/51EbdPiY8bArMv3QBjf5wKvPCz
         m+in+OeK6RXoaD78aT3Jgd9xnYFF2po7g+6NsNK5juDA5mgYcq0tfYDdY9XCQFmS1WvB
         gd68893EnyMvnGoyE9IxGNC4xVLSVbuKvm8An+IdyITTjoDqWAMnyk5+iO+XkCZuYu4/
         Q8VHA23AqzxG7OhIRrxD8v9MGEL5OaBSJHdAk3NeB2+iJ/gKKYJvYeTGv7m0JH3v4R/N
         Kk8aFjp/LwWzkYQlA2/ST74DTHEHfOZl9gpEK+jfUnJf/4xZ+2749QSFpLfRXtznaPh/
         LveQ==
X-Forwarded-Encrypted: i=1; AFNElJ+l4/D/mhKRn8aBkO5hEc36EYAWMICQEIFlR8nh4EVtyDdNADw2xxKjuufhTyPSbF9+UFEvBE7iubGe@vger.kernel.org
X-Gm-Message-State: AOJu0YwhYaT/ge5KejBZf8eRxtflhP2pJTA+1wy7meSg3EM2JWpUQ3Xf
	usVBX23SujTZ/3PVU7JgSXMxt4erk3zw/o3WBNWui7iDw7bo96+64HOf+PsdQauhRpSd+xRcDzC
	lLCod1M0xUKfPwR3+47Yy9BNlAA+V+iAZ0zW0kVnkICpyo5MFNmLNMkEh9Jl1rStU
X-Gm-Gg: AeBDiestF3sRzQDW2/Vw49dwSyORpPxZc41xBLuOke3muC6RvepYdCM31l5LH4CG/vN
	+E/WVda7fvl2jkSxdyWW3ZQrIeavtcHyXREelw/f/q3nKX56OSocPlJIBthOhcIdn844C0u6gV+
	mAc9kj7ZTH1xUPPh0DmQz/6tPHMjC5IfGyKY6Qd9+at4sfOG4PjaQnH+O+NkTyJ0hBGKnDD+pEb
	5hfK4MGoG1a7bqtA0K12d0SODUtg0s2JZmXyrtmv9SxCB8cLvo73n/3wbhlShMfTunKUGg4DN+I
	WckDhOpgX2uYH5xO0pROxcnYv7iNA7QRAUMYIO6MoLEnjPEjkipbBPrp67EGYUKeL4wJlZWEu58
	FWjvHYx6EpCmdQCtwcHTUlxRtEz1nWghjZRQEhH3BAyKlLFEgJkEfggTJbOUo0BY7dGZuwmluBW
	zsVtUuWiBjO5LjnXhY
X-Received: by 2002:a05:693c:3108:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-2e478c20551mr6024811eec.23.1776679478999;
        Mon, 20 Apr 2026 03:04:38 -0700 (PDT)
X-Received: by 2002:a05:693c:3108:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-2e478c20551mr6024778eec.23.1776679478382;
        Mon, 20 Apr 2026 03:04:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfef3sm13076436eec.24.2026.04.20.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:04:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] scsi: ufs: dt-bindings: Add compatible for SA8797P UFS Host Controller
Date: Mon, 20 Apr 2026 18:04:16 +0800
Message-ID: <20260420100416.1252983-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
References: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 707lno2SqCHSrC-DeHTl4JWU5H1a8UxU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NyBTYWx0ZWRfX4MiA6jhOAzqt
 geRb/cOgxrTHCcg3jao4NO2ifPfbgwKJvz5eT8uqf1WtbsDgnDtMA+IcEF/xyXGNo14IdonDqwa
 838OCvuM9BElyRrA+U1YPmuy9RZ05LHdiipsM98TllENjGaNds8x9WTs7uw4KMuTplbCubl4vas
 PC8sZNpF+AOKPZ5OE5OAtd+eqyfwwjnjYV040SqmFSBfaCeST+j04mOpRIuA3xL4PL6n8spZIqG
 z6jswDlU5fsnKHUesz4g2yo7iArhQcK6Bb6k+T6BL2LrycnwO30UPO9pAQ9JbxWE5P7bBVqsSyo
 kPXilT/xYXWHTQNB0xTIy5ujvNJPTh0FTlzhvg6pH9+joFjWE5Cq4XZSI9lGcRkn+2dWA1ThAr5
 svCABlsA1/BLutU2APOIpzOBx4/bFqKy6ijW9nVBM+Ub870ba40K0y1E85wual5kSXdQibYn+am
 +YbSCphwCjmrEle86hA==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e5fa37 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ld1VxiVWUvbaCiqNsT4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 707lno2SqCHSrC-DeHTl4JWU5H1a8UxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200097

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

SA8797P is the automotive variant of the Nord SoC.  Like SA8255P, its
platform firmware implements an SCMI server that manages UFS resources
such as the PHY, clocks, regulators and resets via the SCMI power
protocol. As a result, the OS-visible DT only describes the controller's
MMIO, interrupt, IOMMU and power-domain interfaces, making SA8255P the
appropriate fallback compatible.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index 75fae9f1eba7..f2f3bfc73216 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sa8255p-ufshc
-
+    oneOf:
+      - const: qcom,sa8255p-ufshc
+      - items:
+          - const: qcom,sa8797p-ufshc
+          - const: qcom,sa8255p-ufshc
   reg:
     maxItems: 1
 
-- 
2.43.0

