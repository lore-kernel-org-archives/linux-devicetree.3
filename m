Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADC43E51D7
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846574; cv=none; b=tIyBXWaR5WJELoa57XGmMZrgwxGWlVPxBG2HCKKXuuVzuncVxXumpngpvNG2u8H/BVqNIUloaBRt3mHq4dUGvM7RK28wKYCDQ6rAOTMlTix+1K4JsjI6UlFcYzqg3qBhGQ80Pl54fphTi/x+sKoBZPGwLr/VhDX23twF8fI8ub8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846574; c=relaxed/simple;
	bh=P0TktDlmpvOKVPYvrh8bHrNhgytWsjfjJ/V1q+3Zeyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPu0rmmw7GRwSzyYuWRQtOx2rhbzsCKRTi7HADdYhcWzro9qGNGxA+WXnJwAsicmc9TNdd6asNRQJPOlckk6eeDkuMQyLxoPVko9mtM8VmQ71/3kFRZ3Iwl1X8xumU+n+jC22gk8de4eYpNHROstlqyoS1bYLVgk9g3hC2Lytic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuYGhYmz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsPY9SuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuYGhYmz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsPY9SuZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AFJ9Zh3118208
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4k5QJXqt1gM
	fbr5kaeKxlBrbdF0Ve4LiwaYRPuKNQT8=; b=UuYGhYmzkehYnTC8ZMquGbpjhVF
	Z/WXp5mNt/x1s3FAKmA3g4jN6Ya8LhzxrdSgtOMA5tMTaQwz9mcYQw7855XFKpP+
	rhfnPq+qQPIxlLaCa0Zj1reDJquMWW+r/X1esxlDQLjbMma+nZab6D9ICBJig93c
	v2gikeU1W2DmDb54lxDSuH7VKqQ0QBNOm2pQ74jfzvbw994ZTwIx8UUkpeMfpCqw
	GRBpML6IFvpld5Q8aDi1p8C4QlFWVR6ktqsVSqow9W6heJHdf74azrL4BwVXiT+e
	/6B3il9bjQgqQPhWcW/xOmhAZcVUKqmdzjguR+6VphDgOYxdN4mJaN2bIpQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3rarkp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76fe944e6fso2741858a12.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846571; x=1776451371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k5QJXqt1gMfbr5kaeKxlBrbdF0Ve4LiwaYRPuKNQT8=;
        b=dsPY9SuZOiU3hP5wT+DWe0BEuEM1TgdmTMgbboRsQ7mrs1MHXASi3hizIoyhZHhftN
         qRPKgNaR1Ymtnm3dJfzNfiOVvMBcIEK41irnenR0OnGYiniLcF0iR5/oJth9OvcLHIWk
         7psMGL1WsWfJ1rZBV4jeuOXptJzjIACN/GFKBuWLWl9UsdORntABkUFTluSESyQp21xF
         hVkuVZXJTUZclyjGn6/h2gQ/yn+SrcTniSm7ar2QY3+T/E88+m+TZd5fkJtqwRkreV6z
         vOZgNM5A3BRXrwIGrGqUlCmAIdaMP0caDNU5qYgvI79w9w/hokNABiqc7fONgwnu5443
         /eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846571; x=1776451371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4k5QJXqt1gMfbr5kaeKxlBrbdF0Ve4LiwaYRPuKNQT8=;
        b=NlV0avD9cIgBkLUI8UKCKvvWvsOETXGU6dt4CbVvihXr5XtLYl33bgq/lJg72aocz6
         IkamccutMzZci+paxqC/lSis+xBcLY1+me4fR4oz4ciGcAdI1vCNq5Eh5AZZEOifLmXm
         xC+r5EgEH0F4DzixEOKsV4I9yF0BIHxXaghSzR83J6BULbAANVZPWNh9OXBjG4Y0Wvt3
         3w977qz7D4h3eiO3G0IvYEWo0apBuHZ9tSioK+1c1ar/c5lvPNFdm47lFNWDbc4Fgqsh
         /fO7VfGymnpX+4Y+qEx/Uv9WkNuzpzlztneiQGJAlF6U156IXM+oTevCoKohPsbt1RIJ
         flMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtpW1A9RZvH6dlV7unK3CmHYw0LHYVt3sBHS6cyO3YmzN/FdII8msu6Av3mH8SbY/eqy9e2tKv281w@vger.kernel.org
X-Gm-Message-State: AOJu0YziYsin7SbwsOV0YOl/kYeRlYhaLojbs+rCxygdawEdfXb0YZe/
	GWo8OU9x5lr5rkLH8SEOSQvfHJla39fCZ47JJ0ZrLqn9WiPGw/gOAsBI0D8ZzEN+QCUrkaNIRfP
	8G9SpRVgIL0WTuZ5SYQt8w/L3gUJbrIVag+WsM9O3zouviFzngkdglvAc6WQYCF2t
X-Gm-Gg: AeBDieug9t8Uo6Do/zRQz0hspMPyFceCCfVGv5ylre6SB09XXi9HVNOuZj7LcMOatgX
	d1kELTovAFMzr0o//ZdjewTflaBTMZ5QMu9tpEMjGCrAGNi5H4XXHAhQ3mARRXaT252HvA7SmIA
	bJNKMMlkBoFyJA8MFslyVFgp6yw02sG+PkD8jILtj/3zjWEVXS08/zZPaxJeRN7EwPSIs4Cxp3G
	REO6gSAICGjMq82kdQD7X9tE+w58kROAaya5cfhGvxw0a7MaVWvatKsR5FaPo5tQrbw+UQXHmV/
	1gqi7r6C3wMjKkAwXHluMedrBy0PHchllcDQV+KS0kLx9Rlym6MmMfpmDghsWv9u1ey9xiYqw2w
	DEDB1Ba1mOOwqsderW3FGilv+YxfW0iOImgFMZ0MLh05Nyapl
X-Received: by 2002:a05:6a00:35c8:b0:82c:e83d:a9b0 with SMTP id d2e1a72fcca58-82f0c21952fmr4708610b3a.21.1775846571172;
        Fri, 10 Apr 2026 11:42:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:35c8:b0:82c:e83d:a9b0 with SMTP id d2e1a72fcca58-82f0c21952fmr4708583b3a.21.1775846570594;
        Fri, 10 Apr 2026 11:42:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 12/35] arm64: dts: qcom: sm8150: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:49 +0530
Message-ID: <20260410184124.1068210-13-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Vs4Txe2n c=1 sm=1 tr=0 ts=69d944ac cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXzSBcPmOGjsis
 gm6XecnlMlR2rml6I8yzat+hpdyBEUV8xrxPEmbYClFt1Aie9LHuaCq3/JNO2KN7VLYeUq38IVP
 YcJbU3M0zx5tteFKEMwYrr8fQ0F1MwtA+1lRvY8EVs893lrkaoAEsdHBxAqNyulBjpUvkTOBaxv
 osl5hkovlWeMk43UgXTurY4IuUrygYKZxXGJ2vKXiEWXdIsWBknFU5ztGeBvNwJXrB3WWzS/PJV
 ht1XBFvikp/T9EKXjxGYcmm+t4z3FUqlbZtdC8NdD2oUQZxUDibJTBurdbKxq8uWzT+PzoE+MyU
 +aPjj9b3hIMqjT094K0u17yH0tQmW9A7EQfuSJL7pnAoDepz2IqX/Jd72P+qUwA2lWnUvlMbi3+
 elaupjYUXSGjCiqYbMf/06wq9Yjy8dKg2pCr8qQsygGzJYWlDdlpNAet6gtZyCdK/698OnlHaGm
 9a86vuW4myvm6h34WxA==
X-Proofpoint-ORIG-GUID: _ywGgTpxXnI7eNlBMky7tmsq2Xztylx_
X-Proofpoint-GUID: _ywGgTpxXnI7eNlBMky7tmsq2Xztylx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 97ca5275d740..805fa76e6647 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4174,7 +4174,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0

