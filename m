Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F683EDE6A
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875046; cv=none; b=rc/RyrWp4DDJ6SZxm4MPtVhWJJ8/fW22BbW4rdv13Zlp0dUP37EJKGqtR/s4YQ5iqOPqQY8ZhPr7rmVa/3CvqeUcwcAEyNkXwaZZG2+a3S7kF1smrVTz+eNtbVs3Z8JOCd/jM3ecHdrifGAF6z1rQEXCOnwEhl6DwDuHNW0tgsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875046; c=relaxed/simple;
	bh=zyeeAFiWIV2SZDiQ3lya06lZ0bqH6GijFM2Pcmkq+U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtNnHEJHjjxi0f7XE8T15x5uDLt4zMhBnkpq3HS4XSrgotNxmsRJcPmZkCyzUuqNggqx49pC85Tdo2cBch60RD5K8wrSRX64PYfQ4ZZIk5BJmX80HLOdjhXqkKutc4dL3SGvYPWlqtbIIbTuqJ4sqXov6cxNV+j2KU74Cieqd3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBs3LIry; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TovlTeBV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBs3LIry";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TovlTeBV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mVkh1040774
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wocvYkuW1cd
	Z/F2KINwZL1vxXBWVvJPONMe3OqcQfdU=; b=EBs3LIrywc52GaGNiemv+yetfc3
	TFkpSFS+WT4ZMP8x9p2pp/ip9shWVQANONFv93zEttiv84fqSM83ahMUEmCF/mYl
	BEhLZ4i56Bs+6IyBhbwBviwW4BKPmSgIA21pPoOXxJqEos/+cctvhgeE35tKFt+u
	3FSpAv8gzmNESHOkFCmTuQxXDLVeJyrN6Nc2wv4aZMyfYjzS0Gc5XUXSV5u5O5hv
	dMht5LGDt+AAHu8PZ3Ib7cclFK4y1/nt4rokxlB1P7an+msub49mw/QVNIkpOGYM
	Byim11TL8PpqSQBZC/N9HeN8sWa2Z7Psmcv2PF3dFUm59uRUcDp47qTxlbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh17aqgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so119409985ad.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875043; x=1780479843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wocvYkuW1cdZ/F2KINwZL1vxXBWVvJPONMe3OqcQfdU=;
        b=TovlTeBV5GNnF3/ZT76O6JKPgolDQY2jF/X/ngztbwHuFXCBpZVJKzzpkjdO+ANdlh
         +OhPpH3PBBP7HLYqxjgC8rfY9P3ntdVmyj66yRK25HU+17qvMB5wMwAJTb/j70fBADyL
         Cr2mo4KH/MY7dyAsLr3U1QJZhBaRBowcxMq/+pyOTA0i38CcvhEoaN2/EesfVixekJ3H
         ng7jGEuKdoSYfiB+hQApWV4+p5NGwydS+fx0XSmbK0UDqQcaBi3fo8vC0Ja7heF0hr0H
         0RQmnmdseg+zD4jOKFhrEeSKd5OZjoYpRrp5ABzSp6zIPvljdI4ubt5u0qNodQPUYUnR
         6bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875043; x=1780479843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wocvYkuW1cdZ/F2KINwZL1vxXBWVvJPONMe3OqcQfdU=;
        b=CSFtCHPrEtboFk76BgXNSg47aWjDUJ1pLSpaXUsjAAAEj2GNrixx1321X91+oLw3HU
         wVVQ7gPA2gMp46Dpk1ezAFJ/fwvDMJHOU7TggWkqBVn9amI76kQ9Kk9NYqDmQj8/aKg/
         MQIxLL/SYEZKTKDpTLCVoIyCFq/1EppjDiyVG3HPOLmPOpH3baIQrgm2EtwyprNl3Qjo
         Vtxta4OichB3zlgZv+PUE3GbX3JKyi7JjFc7vA3b4QMnjfUjGX8QBh/Uh1bhCHznZefw
         g8TG+iXRGAOjCpUc8Ua+WN9StLwJOlg6veUQiSiSyO29lD7f0so79v6iOjGAm2YyFWwC
         nq1A==
X-Forwarded-Encrypted: i=1; AFNElJ8+vT7GU4iEMVGHZlPtWIbT6djHHS/i1iIj8wMCussub8ZDcU0blA+avJgjy3oASR0Q2VXMRJlHzT9m@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnm6fNPgPsOnCTCqf4x7SbSAzAI+ZfJ5coI4XsF0QRqFfTf2uJ
	hPAifwq1+RuSz255oQvnOUUky9ylCVnF5rkvHE23Xs6bJBjZmppJFO02QABzTAubvgYZNFR5cJQ
	sq2TeGjKpbDnVNHGzBaUdDWkrJY3m+K5Ofxs5kmLDMjMNIduPfTh+q7mr1zl4cjIT
X-Gm-Gg: Acq92OF2R+USl/S6rz9p33OPItr11V5OZp4Ubd3TdlIEfLnKvus/QBloQu1nNWdkFKX
	A2R+GY7XdqKbEJTj2JjA+bki4mjtmyHKdvmATCOU/DrjumsxI7ELeWX2d0h5lZjwcjAIMBoCg4B
	aiakfOUA0if2fK8psvPa8GEJ3bISA8qA/MHzvlbU9mbaoYrKb5ub8PcWxEf9/H/ih0D2s4w3GsL
	sil5NPc/xjJDtHu/kAdYGQd7FDoMbXjfO1FMmXypMo/uV9uQPhRvd8EZRxWBUTaFkzRKXs4TELG
	rIMiJqyG8WqwA1YtnHWQB/Jy+Pqb9W7cm3evnAgaJHztQt36bN0hMLzBij10vJ0CkSAuc1H38ST
	YEx73TX1pewJofzsupVlbkePBQeUjtfl/zI5z0YSZ0M5Qnolr+/94ZlLSavU=
X-Received: by 2002:a17:903:1247:b0:2bc:8f9a:3642 with SMTP id d9443c01a7336-2beb0758d9emr241760835ad.16.1779875042546;
        Wed, 27 May 2026 02:44:02 -0700 (PDT)
X-Received: by 2002:a17:903:1247:b0:2bc:8f9a:3642 with SMTP id d9443c01a7336-2beb0758d9emr241760415ad.16.1779875041932;
        Wed, 27 May 2026 02:44:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 05/24] arm64: dts: qcom: sc7280: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:10 +0530
Message-ID: <20260527094333.2311731-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yW6uEuJfa_nKDdBOIFMImhszRxT3CJa7
X-Proofpoint-GUID: yW6uEuJfa_nKDdBOIFMImhszRxT3CJa7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX8a4/Mxak51E9
 /Nxkq9g7DkEYNM7xQ41hvwdK1VnYjDCe2mD/wnshRITCDmVV2dryBSB8msf0SBv43lw/+rqEUp/
 PJlgl8dwVnSjaNz2usZGRgHWeiP/cjfnv7BwMUdBI+E+ny60bvp/vTdVo2qL4q69//87YxkFFv6
 eM+LOCWBFhMt/ab8YU84+0/N//PhcLDs6GNt/1gZEmEmcnMMGAF2jMJQoEmWycmRdEBtA5I0BX7
 XAd8O73dbFXqGAO9z69rKOg9ugu05Px6gAxHa1OjdKWJxxEtWyr9e7w7wei77TKfRsmdoFxCiDK
 9L5Av1pM34sf6rBCmJ1eQP8xQzaaE48EC0e5rQyWGFihLjKezyQSwb7+eBeq+WntssRjKPF7zkP
 v+6INowpodS5DThD2CaJBXc9dtDfab+8GUxvrCsxw/ABLWjoHks343s33cQPUnYplfx87Xqpgpp
 rrRmZEgW3jRNQtR67yA==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a16bce3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=R877Y6Oy63PNjXPxTTEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sc7280 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c51beada8c7d..33050643e4e6 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5739,7 +5739,7 @@ opp-810000000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,
 					  <55 306 4>, <59 312 3>, <62 374 2>,
 					  <64 434 2>, <66 438 3>, <69 86 1>,
-- 
2.53.0

