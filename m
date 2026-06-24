Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0CF36E47F
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328178; cv=none; b=RoNN2PqTDLLPjt7tebWvfh/sLLK9/Fz2QWKB0AuFnP3MzAxyBQ+d7ZBW5j0qtn3TdzdbAzeL6iH3trO/PE1uzcoy2zNPmAwNKg0a/pNhycJiPJKK61+pVIXE51eHrfGIljCZ1Ry19i3AOM0vThE4JQyhHwEMfiLqZjF3U47vBm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328178; c=relaxed/simple;
	bh=l7SYm5AQ1ptqN1wINS7sSNGjFhlD3OrFGjhZqhSAK2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dme5NXkJEf8qQS73M0mIF7qaviQE8CmhjDvBSUhjcw+C58LqQwZx8Ni3lREW6NVf9DcS6+saM8Zvzr7AESNACKmyMHNk6xkDSbh9Nbxp4UUwLHV9NKxUNEVOnRaIaFMHFoNQoyNLjCU/OXcYqSUlcrh2vcxC3ZTrtWVLIS1zW4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7e+hkAu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAEu5LQC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7e+hkAu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAEu5LQC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHjAtD4153501
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=53Q/gFtuFcD
	hDTA4iRWdeRskHKeQlmWd5rYuvhi+/eo=; b=D7e+hkAuKsLzqjPBiHwg8f3pXia
	s8zQ2E34LjFMfBVhq/thOwTSewPESOOu2Ww+KIUmhoqtL6eh0Pw/gOn5kPMGSuKt
	DKs9ATqDkgY/ZlntdCxV5rAMeq8fvcp2CTuO6wK/uR2lPML3AhL7cjM5f0wWPR9n
	lacEi8SlnEuz2ApU2AFk3axrpDf8SkmNCeJ9IlR9lgNWnM9M3yEXYZ17/AsnskBd
	vw9J2obHz7PZMveVsulO/lpZnFp83mKDfb9ARs9xxF5nykgLPpzwmRi/SkxWniae
	EoT9YbLfE/qCUWEArFkoq+yDTaaiG7izhi34zKmhMVxI6yz8JPRUjo7K5AA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996k61g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f3e4728so1036773b3a.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328175; x=1782932975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53Q/gFtuFcDhDTA4iRWdeRskHKeQlmWd5rYuvhi+/eo=;
        b=VAEu5LQC3XAsbmAEi+6xPfcmSKU82ccBK6hsDvH9RbED9csWeNWVqoddbQ4Whuejkr
         Lr66dnFuds0q7rt3IjKfqSEW8edRJ5AthTwzoN8eoyfZsEoFISYmtiVu/IYcaVNeDDDK
         E/ALaWKMAEZLupsgP59sKx0mhdCJALKj2M+NMVxGgRssXs2jFDy1oeY663Nx5pdSxxwL
         hsJDCWS3R+l+autU+2KQYKZSb+NbQA6iW+8ESs6IqBdNTlfqebAUl658zJS2K9ZgIqOa
         X4ohKwkVe1qgoMnHptW+a++2keSq9zT7qLSAuqTusTaajNTht0lZTsZsnEnrFIJ5ox3g
         XwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328175; x=1782932975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53Q/gFtuFcDhDTA4iRWdeRskHKeQlmWd5rYuvhi+/eo=;
        b=fARbSERgDTx2zdTYx91QEfElYQ0lsQVq9HEB6UMP5gX/boSFs8Cbpz/bgxh68rvGVR
         lH1w4G/RfrGeWwiyPcABL29SblOE3JF+j1HDkx64TWYRYXOUFpGQgzjwuKf4RtYggQsW
         lEB8zkgiLncioKYzK/mnTfzYIKYUBSnrBHmCsdZ9uK7ZXzXyRSfvuGV3P6yjjCR1LGhc
         A+Rki2kuKGM3ZNk1wd7xcohO93NloPoRDl1fvf05t2S1AY6lDWFhXjYQd0DickIl5/1P
         CoNUl4D0GyXl+EZiH3zXcs6qt4Qn/Vi55tXG7k03njd2BQVrI3NJF4AN8ReTinepOYRS
         DOiA==
X-Forwarded-Encrypted: i=1; AHgh+RoZ4Y4bJMeIDdA0fQ1gepaXiIgvkmKj02KmgEMfz/xICvOzVmpa0ME0tDkLprmymjLDt6CmVWXdtrG+@vger.kernel.org
X-Gm-Message-State: AOJu0YyUBsKLCvyA8r2+/l4b+aA+WJbHw4daHhunNSpDoLdAvZpY9WrV
	URlJcqU/tuCOWs9srAWYsqofxfHo9munewLs7h59yBGUVGhVqqUNbzvFORrI4T8zW5Xl/KubEAj
	1mLPkbpE1DMcyPnx8I7GtBkpXF7RERGDWmyix4VnauW57csj8XOyM1hvIzH0Bkbt7
X-Gm-Gg: AfdE7cmF4OzUpYS7UaUmPKRB+f5cdgNjhWvkbXB8jazl31Wk56172Qm1rJzSr3w/Tv/
	NwPrJfqnzgk2iC9SfSgQrWwNOK7oGEZ4Ksbu7Tij88YBN13MsCXmVFqEtXeUoqyBCD2PebSpSzn
	rAAX+rmbRjZIQRLxX1V/evwPcqSGBGSrTx/KFYj89MR/Usn8HcmfVqd6FFzU+V+q3I+LZV1jFZ8
	97pKDRttHClPT+xCuDKQmZEFQaITtOKeKaKKiAHSUXnAknF4goYzHratD5eJSkt1GHLFhs2YGfH
	8LsZyt/P1WglrWjKFSKwuJ9Hdq2QBnMGxuQs8DQEj+QZcm2dDKSTXZnPF07WTqe4u7xLnIj5SX/
	ZJwG6Z904yksAVtfsvPkgGbHcE+LojLBy5DvpCw==
X-Received: by 2002:a05:6a00:14cf:b0:845:48be:b046 with SMTP id d2e1a72fcca58-84595325e66mr9938889b3a.36.1782328174455;
        Wed, 24 Jun 2026 12:09:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:14cf:b0:845:48be:b046 with SMTP id d2e1a72fcca58-84595325e66mr9938850b3a.36.1782328173874;
        Wed, 24 Jun 2026 12:09:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 13/19] arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:24 +0530
Message-ID: <20260624190830.3131112-14-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8I_CiW3bFu1q272VU63zeWmMFt01jA8t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX3MxyQjf9fAZ0
 vLCk5AYV62OBXCrWTKmzbGURLz+8+uDpZch7lCW3P78bIrsc8WbAJaM6oZbs15hivGfDQCUClwn
 AmB6MnunwmKGDFJ9MthX9s7v+HPH0Lk=
X-Proofpoint-ORIG-GUID: 8I_CiW3bFu1q272VU63zeWmMFt01jA8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX3ZvLC5wVRKU+
 FqV4tBBnW64SBQqCgq+glV2oLt3BmEU5irDL7ibCIhBXubnA0CI0EEH46fD8jBdyfw8yRkhieNQ
 tkU0A/umhVVnI6Xo/R6r7klO/qlO+yhMBCZqLEYsj77sPREEjzpMcTOTjIEBlBCgrxUE7IRqqVB
 +0uLqaqv52dLqm9YqHIP6Badm4mP4Hvm5CvkAfcTURA9BIgQaKbypmj03lHJySLuu6dpiiT84nk
 ryJ1lhHXN1c4kSKKaeJuxptoZ74sjVjaj/S9ppbdYEacCsBXDSPM1TZEEevy/9SPBUsKhcUYDV9
 EJ4glj9W7x6zMQE7geK7F4bk8IRzD5zWZvk7u3mkpkVq6/rsLADSsMwLTjWCYTruPEBJ/cKlsSl
 eedA5M5zoA0SMg+czdDFRAgJyD/bKg==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3c2b6f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lqovEX5wbH2L0KOpZmIA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..6d805cbe5b4f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -720,6 +720,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7280", "qcom,scm";
 			qcom,dload-mode = <&tcsr_2 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -6698,6 +6699,10 @@ sram@146a5000 {
 
 			ranges = <0 0 0x146a5000 0x6000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3000 {
 				reg = <0x3000 0x2000>;
 			};
-- 
2.53.0

