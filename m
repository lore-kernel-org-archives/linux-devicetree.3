Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088B3E5EEA
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846594; cv=none; b=SCAo8o9cel0z+oXpYiRhyazzOHo9Bh+jzgEePCbCRgJd1hpkVccqQPux38Wn1S0lzvvQWpjy7Kw4UpwpNqzkmurwHnCYlB7dI3P9g/7jmhUJZ/oosg0w2HIZswHWzO0YVDk5mpkwni7C1ngkNR2A6uoAZ2qUcyt+xSz2PH7vKV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846594; c=relaxed/simple;
	bh=aCVCm8p2Eyhi6/SLe4iX7FYymqXIQYhMVyB+2rqnbeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aG6QD+eRflG0ocElxtyRO3p+qehGwrwtz9wWM39n8AYXaCs9Is/BZY7nx0JNsWgFoZJl2bx2WL+x1tasbf0yIdR+n4c0LcpCZK3VZiPr89aGV6olkR7ul01drZjQJTfdo7k5yD42Ov0MFzhHJovXqcMvr8K8YiAxU5U/+x2LeWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0pU/kMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/q3gEeQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0pU/kMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/q3gEeQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAZeQK2698298
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CTKGsDauXyE
	AmiBdGegkqqWPTHl72KAoq7+TiD2+yY4=; b=m0pU/kMhzfFYL1FNsDWPr0tJQ1V
	AzZyUb5n8O5RFqmrXNmmnF1atORzd9FG7IVg8UJ1NiFTn1ijiy7uDJyFlmD0oeBh
	ezObQrqrS9KldBAfbUFYp1sAeKseedqEooojF0yRqclLgnwgOVQ1hdLjNVYSYCny
	/VxgIAfu2LvDGsaWgsxZqJwmayxSr7qsJBpZYPW6HNTOSJ8tFQBaeXiq+5QQJ9jX
	s8m3Jcn9DUhUwMNTaIZZSzMArjTPd0N7SD3drJUGvytwQxoz/Y+x2wEiFZVWuLow
	xvmExGAPHHaEt/1lzdTermDkBg3tInC5h8zlvRKPA2x7qWlzCPi1n22cycQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9v9sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cec239147so1506056b3a.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846591; x=1776451391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTKGsDauXyEAmiBdGegkqqWPTHl72KAoq7+TiD2+yY4=;
        b=T/q3gEeQbPEK8sQeA1x+BWiTPIfMgvZlKZk8gtkOE4G7jmWiqha54FlbVhJ+MfLLWL
         bDqoZsE0mCjZiElNvmDuoN0QkS94+vv/fGlx6+Kwx9uN+m3le7G4ZHeiubAYqaYKlocb
         czutzE/JlpHzS2PJi4quXA5LL/C5nQfTKDCIOsI1wDNsM3rjJ8sFHY9c+QLMtFtFecwi
         qqZKi30vLx9L7QIoVxtSXw3qYbgncuI1jjPHIhbceMVeYQ14zEilNPbDGMWk7n/CMIXt
         sB3ZbpDz9vML475hUmOE5KZINVCxYLrgu48Xb/ZY15eYgczdgqN+nNp0kJHLRjmw378b
         dbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846591; x=1776451391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTKGsDauXyEAmiBdGegkqqWPTHl72KAoq7+TiD2+yY4=;
        b=kWATGhMDxImSIHc8ZfN+RDNSanB5JP0gy4ok3NEUwNvVDP8AlFAr+BitkKyRajXoXJ
         V6emwZBNgH/vXC5hPm5VwPW/0YCpQR2cgPbIqriS2/eoDu7rPtSpoyr3U+VpzbCQ7IEA
         S1EYKBj/jqfm266XhbPh935jXYRUejodbJARMngGQoGPFDCJbafz6oBQgqDzCXZL6nZm
         M0896Qjwvr5I4GdMQCirZzj6d63eyYmIS5gUeOTc+xbIuOnxaxVZq2bPa8aqBsEdDSsE
         u4bYHFEKVF2gwi7FqsCx1BynXTW+UwAlECbZYVuFlTJ1NZlb/kusIm7W1UmeJkphiEpC
         8mtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu1PNf9/Qj5K18SHcA3F7K5IzMlcirE07zNm4KaWiJ8HqrgaZldY2TuM7yrz6o8ZfdkDcYCq1yc/Aa@vger.kernel.org
X-Gm-Message-State: AOJu0YyqtaTGiZdeiC4SwaOYzr/z7lCH4BSNjlhzxF5ktXHNRMO3KyC5
	CkRPTGZyF7VhLW7mk31OAhUPmIxLiM55BGMDBdAOd0jEXyTmYnu5GS4VqG8rlf+uBSHGN7FTLde
	KW/e95EqAdhDsqA++9bMi/owRFsoFZ/esJ9suwttklotnAdlE2jX4buhfhlqCGoEHNlXXaftJ
X-Gm-Gg: AeBDiet7BmcjB0AIJ09Dz+zkUWx4xpuK1vm2g21DWEcOGl7vGGpxRGqbtUPIFMSq0uV
	Y+iLh7um0cNuITtjPN8SjX2XXPrBx5kxpFUyO06SqKghyUZUhijEadqpcSFxwLvEb2U5xD/+f4B
	eT2/vXBOVpiw6fnYnNc3Ef/4+pO8MtGFUyk7Qbtjk4IIQH9Ept8TOOvVOb42imeiRb1jzkLsLzN
	c8FG9LvyTUakvTBSrw5osfomWRsdLqJs7xoZICQJUsyk81DljS8YANSOF/98WrcwLxRmQOlGb/0
	rVYDPSlSde1AHa1o/ctsDyP95DFOjR4dT8LWRiF5hZ3eDBIZqtM00Hdj0s1NGw6zab6S0oh3Weu
	iupo+0tQwS9LoZ+l3tDGX/0sr9n5W/98oZqlBsR6Tjgddb+Ci
X-Received: by 2002:a05:6a00:bd08:b0:82c:1cd0:2f7e with SMTP id d2e1a72fcca58-82f0d23f825mr3836830b3a.20.1775846590751;
        Fri, 10 Apr 2026 11:43:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd08:b0:82c:1cd0:2f7e with SMTP id d2e1a72fcca58-82f0d23f825mr3836813b3a.20.1775846590197;
        Fri, 10 Apr 2026 11:43:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 17/35] arm64: dts: qcom: sm8550: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:54 +0530
Message-ID: <20260410184124.1068210-18-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX7QSyZJl9m1Vt
 QBqbzY+Jzt5vPXnk5/lw9FF4L5IZ/PgAB44QWiUL+RKR4KPjWup5rrmCsxU9s1tPFd61n16wtbz
 lnWACL6EcK02qdQsVEgNCDIDSfNAkShAbM/uk3xa4vyaGT3D5kzWfFK+kYIWLtYQmtwprPA/n8E
 xhi6EI+GlUHJEpO6vSmfwL6f/PZ36m+0nlAllqNE9C29UCqTNjZpVVXXMOvoJpOm1wcqaFkVwv5
 6U8/Df1e/JaE8erzF9JrSgsfSq75i/bAYCsEOXLEk+SyVE1JnFSe81mknE8S/xCyjyAvxL1iwOD
 iWI1yesgSVj5iW8kyuzfqWh3nakS2qBrNT3jJ9beSyvp42TRuiAqKDNJ2KYgQak9TR8CKcWW5eT
 ncCm5lcIlNR8kUFC9Blk1m+rmAHiWcwaDXuF55WjYDiz4IA7rHR1HP7A0YOfCPAf04Q8Ps7K/Ll
 TBQUtcM2GXdHucZRAVQ==
X-Proofpoint-ORIG-GUID: NX_9HuA0dYc8j0Px8E6hFliHiRDb7QQT
X-Proofpoint-GUID: NX_9HuA0dYc8j0Px8E6hFliHiRDb7QQT
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d944c0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412d..975382cf4066 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4222,7 +4222,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8550-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 716 12>,
 					  <138 251 5>;
-- 
2.53.0

