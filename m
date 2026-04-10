Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7A13E3C75
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846554; cv=none; b=iZN3yfDuEcZhz08cC9s1fR0nWs4xRY7lo/CM6nBRuc9Qo5eXrws39xNYv2iYzJRCc0hOrkk+1yW3kfaG77M6+Ag8AnrxS1ePXcjuwYjeH41R/jlYuP1Q20cYA+EpSA0+ZQOwzDr9HCutz+TcX221CzTEdC/jP9vIgUCMFEpG2gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846554; c=relaxed/simple;
	bh=HJXduTg9hxaA8qKqC+JL4c7iFkEjPIs9Sxs17pC9Cmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmU6P+Sfda/bX6gB0dRxcnUTc1LGiSadHz93JMl9hAMSgpMpOz+cBb6CwmZbQq2nmQmDFzQSw8LYaKv0Ft6zC+Fz9Cg9T9lV9HssojmVZW1TXZZce5L1kiUD9YVKZNDEi21PYapOVl37BnuFEPgTiVBpftwDCVOqzIqV8e1u22U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AY2dxTlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzpC76Sn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AY2dxTlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzpC76Sn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AILEeX439252
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FBhGIp5I0BC
	sP8tmjb8Zd7XQUOosbicmW/US1Z8/HZg=; b=AY2dxTlGihuctwTqllXzvKvkkpR
	dTnf+NdIn6H1N7cUUDRx9tTTGw/XYD6L2oFsSLnmihxdCcTPvNvUU07sC2FDSLrl
	tVzHt1OvvG/V4ya8ZI3ZMbLv9Ku46Xm8afWCPjcE9mHFhg/KyDjxEPpRDqtPAE86
	fAougywIJzAlXKwxUXVL6kzA16k12G97wZidWm9e6K3pHNt0HkrRjMok9z5rSBcB
	S8emBk9EJi99+z0QNTh0UU33NISbpAx/ycvvKyuYoPYUYgDXSqGsFMNobx1qKc+l
	2ii1bF29yPPVLZmDmF93jD/RJQS81H3NCCJ66Cu2I1wfjcWWX2LNNE1EoIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9sec9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ce0a9e125so1276721b3a.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846552; x=1776451352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBhGIp5I0BCsP8tmjb8Zd7XQUOosbicmW/US1Z8/HZg=;
        b=hzpC76Sn165P42oW4bDpqQ9fwQvtMlEkDdDX2QU5DmDdq0qHS64AMHPD/9tCuL6CNj
         HIthl9w2bVOlzzfHoDh9ex6C/aCiNnokLUjC2e/D772YkcmzPeLoy1Xmgjfq3QSTzCVg
         nQgAM0tnQXYTQS8G9YROlM06T8ysh26in1Av72Hp8h0R1LPOc7XWqMlRTgrWCnl2Jx2b
         mzu6BtEi30vR52l8qUz4+wySnXzJaJDlIrQS+qo7+D0so4YjjeUHy8eje1HvkLEvndfH
         QmD8ultgqFmbE+iXx9OGfG5spMLbnOIM1JlUgJJ66U7IqDLfIr+/KoMjOn3egkonJcX8
         MZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846552; x=1776451352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBhGIp5I0BCsP8tmjb8Zd7XQUOosbicmW/US1Z8/HZg=;
        b=Kx/sSKHjmpFBedQzh3EqT3E2J2q9aFnXM5ZAHpGROGg6rXpI0kQ17rEazLIMrikuNX
         4rGFO77bQCVtKtUboAhO4GzILCycE4ZD0pdtLR5R6r4X2mZ5D2LxsUbH5aaZgcuKBdhD
         voFKNG9bbksKSvj2asxrgxbUhiVxGqxB9VK0ASc7dv9ngyLGB8NyfnELNLu0WjVFnCVj
         yDX6HDeRScTbJVM5fR6qs0CWfmQJ5ccWWyKsYXdK5c9DKJ+mxyB9rmdYQ0rkNRt6bGGe
         38gevnwL81cKoMpicIeqJIcgLr6QUT2udpJ2Xc0J6eUST5qwDzTZdlos6Zotvc7WZFuU
         KQmw==
X-Forwarded-Encrypted: i=1; AJvYcCXyS6JFTVMNgB/kfgChFtMp2PQjc/X5XdaZVazkh9GOFlLJYlmx6FbjP1xz73VVrU9ZvCb5rj1DJDeb@vger.kernel.org
X-Gm-Message-State: AOJu0YwClLX/9aoMtSW8ItWYBw08zhyXiT0uUH7CZTEeiupQsCHLVu0B
	Q8yEvfx7m8Sup1iO4GV6zuVZ+2HUSstxYHQoUAkZ7C5X2sq2gHD+Tm0G9uPho4Rj92KDFQfRsqD
	hJCLKsF888kkmUT4p4P4nKdnyQjx1zQT3KPOaeELUEEUxBqNPSFbcPkKLytMjV8X0
X-Gm-Gg: AeBDietboaq58ldeTWNiP7b0GrasPuVquDZmbh3UV1qbyM2pE/zTtE0jxmmR0QpA3RO
	7iYO9kWOqrwj28d/rto4/NLu/Gu71XujEbkhpWx05GZIk8HjMzEhcRaujBeCbA1KYY/+jF6nh+M
	UqkHWseY/7Ik2u2MWH8uuMZxwmYcIrc3hBKsqtNxc9cV4J+gYw0HWT59zyXGTLipNo5V9drbAdG
	9IjUD4CKNYM8kYrLa2mSXwbkLtc7T9c6UIQa5z4LW8M8vNWkDifaJ2+CNd2NkGJmTvBtiSINWnr
	8bvmNkw6gyiCaBZtkrtabNEetz4gwGu9e4w17z+EUf6UYdF7q7Qd3ZoJUqXt3J8wID9YsWycGC9
	h5bMRRltF5G4ecvPVLIO3+yIGIi7mZcBwy8HPbUe5CPVYXi02
X-Received: by 2002:a05:6a00:138c:b0:827:28ba:ff00 with SMTP id d2e1a72fcca58-82f0c169e53mr5293584b3a.18.1775846551407;
        Fri, 10 Apr 2026 11:42:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:138c:b0:827:28ba:ff00 with SMTP id d2e1a72fcca58-82f0c169e53mr5293557b3a.18.1775846550804;
        Fri, 10 Apr 2026 11:42:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 07/35] arm64: dts: qcom: sdm845: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:44 +0530
Message-ID: <20260410184124.1068210-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX1d+pmSsGQfDE
 zHMFPheeW9mVb5zXF0HdikjT5XkxPh3a5yN5sn+VER9orYMtZXeAPFVgMVor0E8NbsjGEEkfDVj
 1FSp/N5dY+hFnCfKRWSIOQvV6YKX6qSyysvc4sz5ng7HmuERw7ecJT6IDJd0N7wrQLn/IrM2Ooc
 LKwcGp8h6iiGU44dBnD8v86snMYW1vPq6Dj5PK7WVGgfsLRkQsPa5j6VnC6oOMUvGl3r53fabHu
 5ZxXsc1jaQtn/QL/SyH399mrKkMZCkiXRWg/kl9Ff0GgZciW6kBvM11cUYdf4S/Zfnfscfy1IPM
 xJ46gFgEvunA9wbXyTryIRymlc+hWailK0kHEf9GPXEZ5CLEOtWPALsP4C6qFLQbvQT1foeGgM7
 +x796YIhynqEpms3ERLuJzvwkZXafYmGq2bqSeoGzYAb65p/Rgq1Fxf507BuaDa3wN9TToliotT
 F6pbAGoh54vAJerm5Tw==
X-Proofpoint-GUID: TrErzvv25TSJxV-g1LSJWjX9vy3KyLY2
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d94498 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: TrErzvv25TSJxV-g1LSJWjX9vy3KyLY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf2f9c04adba..09eec9ae03b0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5044,7 +5044,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc_intc: interrupt-controller@b220000 {
 			compatible = "qcom,sdm845-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0

