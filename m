Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8748125E
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331222; cv=none; b=h7jsFJ3+VFFAiWLU1qrmiwo4QmN58Zw3L0PItD3dl1Ph1bgHN7HWAhCxIX6eNgVJF9W4XhF6aaI5tsUogHqDrVUWWDEtPutxOt+HJiqjXWBUgyPWkZGyZspRc1BfWVsvpJh9WY5PUnfpRy7s2I7g7OXo1/eaBrxcDz3Lnm0WFG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331222; c=relaxed/simple;
	bh=R/SsOYmPy9HIqKkbR9zrUAvXo4Tbtsa1kVdP2ariWZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAAYVHWaUkwBz0WXTrSK+nVh95OJaHOK5uBlB7MrqK390orAmNc2OjhP96tjAzVFmOBJiQOEvMklpU3sEXTA04U92AtIHNtbYfLUpGieekcRY4DF58ueDndyttkhvyYzoaJF3uDU7udoqhL49SPcP5eAnXhzEcFMTaMKoA2fJ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kaa1S9Cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xy7LwRJZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kaa1S9Cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xy7LwRJZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ya9m3532113
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rYeGZrOFSjD
	CzSXx5yrak0U9HEggd13SLHLFp0Wefl8=; b=Kaa1S9CcZDbBPwO+Y2BDE9K7/WH
	jA4oo7kWAKHtZfgm7jHkhhCSURaxDiJcUZHDkfknp4a1ruEYm5nCo1qrORACPnco
	adbfa0SNMyEbNE6YVrpTzaIfj9rRvd0FkgTS+UH34YuWO4EW9XQjVv2kIfE70Fbg
	k6jYPAUh6PNWxZ5vkL8GTPkofJcGT0d9ZrUu2zmy7UTyGLSMPafGV9XOCihy8SBZ
	yKKXASibdftZJhKGikIqlzRDBIJ9dZXJ989VKD45jyA9t/K2WxoYCoq4XyCINfCG
	p9dJ8U4G5PogWC1oxCpIPJGCLbxmZdg21bzZAlAxlycuEs8K+07ehIXJP8Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kaqms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342138eeff2so747298eec.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331219; x=1790936019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYeGZrOFSjDCzSXx5yrak0U9HEggd13SLHLFp0Wefl8=;
        b=Xy7LwRJZgEO/x8hhKAyWajjYZKLYMlCba1Prx2imsHnS94sBZTemhNi/mzWNd+g+66
         D3WMUHigDJwbwR73W/3Ldl9dbbNcVZ60U8qMiIheTAckeHz963WPaXrou0k4EHrlwOoS
         Dpjt56GIcntM9u0cmFp7MBOpIYHfOMfipG/ZnblU1G0hwilR+EfmZmUIFkW0uwvj8XuR
         xbgYPUn6UhbM+gUORk23cWu2IBXxFNuvMPAc+LdUTpcVnd1eio6xobZ/0d0MJM1j9L+t
         DQIWgHWLo9311quUfH5dgj1Xr+11wPnN73AkDYzI1+Xs2jyYTGkx7yJ9Q7HAI1vaXNcr
         wyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331219; x=1790936019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYeGZrOFSjDCzSXx5yrak0U9HEggd13SLHLFp0Wefl8=;
        b=AliHlEdjf9JiJiCFIPMdcrmyPLQvugSEglchpGv9t+R8Wk60ekJhsQy1YJnCychgeq
         xzVv0gZqgVfMgdM68ktExM6BO1hkSMlYEFtqtWJFVNw7xZmJdOGioBcuqGqFG+13fbko
         dD/PXDPcQP3e2zSDiG4u9cmhcEWn5SZjOuVRXrm4Eza63C8utrjxptbyZT0o+B0oAg7J
         zFWV8h572KeCzwl1mQNQ5DT0kkjJtu5ADK+xh1QC/i3OCBEmALheodUbp44+vMaB/r96
         5KvrhK69YQCOQkYzTwUZLeoZ8hge7wnPjcRDeC9H1W0kKBsvaQ/quP4LEeTK32dJMO/x
         V/nw==
X-Forwarded-Encrypted: i=1; AKwUvBxB95rC9C284zlljiacwDMtBCru6Xs39yZAURN8vaFozupDiMeH598pmn8ClhkUVnsEnuhjrhb+S1K3@vger.kernel.org
X-Gm-Message-State: AFuF++l3JONKwcvLZJfNlDqMRqLdDwlXzneucFU03zeCc9OZpJYKdKA7
	2ewTBeZzQ9LRJfYfhrooYt4qdEU2K6FaOLIhKRq71VVN3Vcf0DLHQ+lQt5gTmQV1UzRvdcOQ5rZ
	TEMeXHkin7xiG/dNwn55dihXVdWcL3lsI5M2fgHJTVwUJm9DdRDTFHlpMJ/QZYmpL
X-Gm-Gg: AYBFou28FMuW8UDMKJH2fh1cM9FBFKQZYIFLvXYUkBqWrQyGwd8e5V7LczIJU5NGpp+
	romDigpbpfCMfz3n6LGXflVNBLuut/4cj4mWWIFEHrgaYMofYMziGB48bDU4AzbyCpfiZiN2HOz
	X6QunZ5Qwng8CGetFb0390DNBPYma7GpXBvkRrkXyxdSChABSbaGw2Gzavp+OiTS8TtdzwcvjZY
	b8dbPNew3x+Em4bwMfa2Sp6s+KINngiU6KULxg0XeIR4PQbNYYPTZ7Tz77sfWOr+j4J9t6qnJdM
	pqKahcSzIfayktB4l30E4FmYICK/fqcykPDYeHuzdMTTPG440iIxIQLMZS/g1TyKV0Qvl+G7qYe
	jt3uZ0yOqsH5+Le15q4FxVHlMtw==
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265641eec.6.1790331213663;
        Fri, 25 Sep 2026 03:13:33 -0700 (PDT)
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265411eec.6.1790331208035;
        Fri, 25 Sep 2026 03:13:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:26 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: hawi: Enable SoCCP by default
Date: Fri, 25 Sep 2026 15:43:07 +0530
Message-ID: <20260925101309.3826038-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab64953 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5nHZ2-PuNKrVBJgNaKUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: HWz5WzW2sVU6rsNF2BZmwWtAtsRPFYcS
X-Proofpoint-ORIG-GUID: HWz5WzW2sVU6rsNF2BZmwWtAtsRPFYcS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfXw9VxkfKMgG98
 +EFexY+FDRfbEMbvJp+4qT11sqEGGkQ8ee1Tc2M2iFhVQstrG7HKf3R3Nc3tGc5+pj2TQrXsrMb
 t+qVvbsSk9e8dqIw5UIEmXV9puKKcxVoD6cmpd+JIMkwkizghHGUdU75GTAYPaKlpLvdxBsGX8F
 byi/itO3Gae74M/Oem3FV11nYEtrz33Zmr25xN3yNWJCFt0CVWu/ezfXI/Twy1zhmPkqRWbvt5j
 dwKDXQJjPyC/YmvFvRpeH8iTzHRnShQXOXQj3MtvCl0vXxDg8AqNPdZb8VpCBUZI7Hvuue6OfLC
 7WyzYVs3+HTLVzKXOCTFTeTQbYS/UKmKbwuOdn/IG342Xmi6pIncqSKl7VXyz0MnEYOXUftmWCk
 qBUvvtdNNrFWtpbuqIOA2/YphnNgJQUU98uVCnH7/uoF0y0UyyqVLjRKb3lc8bUPVZ9yinOdZj4
 J7YeRF0DLXKItjXWySQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfXxbz38oIQHWfs
 9kttg3AcutwdW/QS41lkW6Q8LL3B3qHAnGsVDo7q8gzhtfNFeHS5sGB0MqJ+DpbA+gxBvA9Tusu
 MeCD4xUm0QtcIf/AxA04cGm40q8rjJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250040

SoCCP remoteproc is marked disabled in the hawi dtsi and enabled in
hawi-mtp.dts, but that is not the right approach, as it should be enabled
by default. For Hawi, like a few other targets such as Kaanapali and
Glymur, SoCCP boots up in early stages of the boot chain before the OS
takes over. So, it is default on.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 2 --
 arch/arm64/boot/dts/qcom/hawi.dtsi    | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9..88e0afa791b3 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -910,8 +910,6 @@ &remoteproc_mpss {
 &remoteproc_soccp {
 	firmware-name = "qcom/hawi/soccp.mbn",
 			"qcom/hawi/soccp_dtb.mbn";
-
-	status = "okay";
 };
 
 &sdhc_2 {
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 89bf0f59304d..d47440791479 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -1859,8 +1859,6 @@ remoteproc_soccp: remoteproc@d00000 {
 			qcom,smem-state-names = "stop",
 						"ping";
 
-			status = "disabled";
-
 			glink-edge {
 				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
-- 
2.55.0

