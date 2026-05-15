Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E528F3CF02B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829299; cv=none; b=i+71yR6QEdf6urKMEOqufoEkxK0DL6jMZJbowurPoG+FDcBq8VFtVqI9wdSD8jx4f8Rod9dlvyIjKjsymfMl2yp7IbHB7GYqdq55Q6X8NgFMRnKvMidpILlw17RwAMU5pRfW9FF5wyuCemAqUU38xBCmrSCWiMqm0wC9Dzbkebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829299; c=relaxed/simple;
	bh=wm1t/MamZDvLoG9AAjK3zm3gT9jofrzZ0WQKLcRgIZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oys/i4WZGuYIJePUrwuDAMyxpoWKyAf95D/wQs3eJqw0bWDikkGgybaD7r5jBKHwGsPCO5ommmcVGzLxSTFHAe1kePasWWNTwyQRmbz02UImkreZ+soOJAJ6KOWcesxV92ZWygVLt3eriV4lweY/xKZ7XG19hm7dEK8Fd5gwrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ooWc0SkD reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ooWc0SkD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4ouEd3671801
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KV7BPkmiPjq2GSzg+WC6IPndCyT3y3e5po7
	i5xcaGoQ=; b=ooWc0SkDmvFWayVSMHb7QAEYMyU0HK9dcEsR5AsMk2mOHZKa8HM
	apLxqKM1S6n0zRYVeV2RqKoXecsujahDSWrqH9WbBwDqjcd55hE0z4phm4J+GDN5
	yzfKFmPuVxQ0wzHy1/XSDf1iETkb7WUejbhaIUd5EYSd8aHftwOkYBEla5gXZ6fQ
	jeL3TEu8s6hfYgKKqSrqmYoiYb53fow82z5qvw20T65wdzXYAsyObdTWFUOngCaG
	R70y7URfQIgmbRu29kAdpIEPvaPhxMWiAh1UhdPRw7lIsXiSpPwNKf75Ho5fDPQY
	FphxlOxFQ25TPbfGJA1EUqTbqb1AfhW4Elw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s24d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:14:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83836443305so5083051b3a.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 00:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778829297; x=1779434097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV7BPkmiPjq2GSzg+WC6IPndCyT3y3e5po7i5xcaGoQ=;
        b=o9SEP8AlJdch4T/XCkM6HGge0MxW7QvrU2PzKTC3eEkkdyJkVTR5ThIZgJEH1rkKa5
         903cS2dRdc3dhyDSCE7MIPJlsR3S8XgWO4mAY5/CYr+S/g+Hqh88fi5fXyN4zS98XUrS
         4SezkOh91ABHVuSuOQPSGOKkXZ4VXasLQ8W8e1LPa/Y9dh7WWhaMQ6r5+dAHtZmNzlNg
         L/J+Fhj97qHA+GUnOdhu6NeKQaBwkS8FhnoHIWhOi751v8mw/kP2uLtKClhZ/noquW4A
         9FmqMAb9LMEgrTpuTf329nu2UkSutCICstA0GFqs1+2+O59qwyJVX0/BM1m5WshIHKK8
         P4PA==
X-Forwarded-Encrypted: i=1; AFNElJ8yn7KB8WD4MV+rcnjLJkkJHziFr6Hdccc5dDdn50KJPoPb78VvV4obEkFLjzjJgDoZmFgvHhz5s4iN@vger.kernel.org
X-Gm-Message-State: AOJu0YzeshYJJeqpdqYSLHNcRzE/MenbLZTrTMRsNjv1ouqdPBeZCcOx
	j80VfmTRIkcMNwTCbSLdr2gFljxpGzS2NIE/W+BDi9V1kOcsU20KnDiJyady69W5SMb+cTn/Zv5
	2tuTshC33q25lDitZoQ3J6q3bon+VXh+tpwp3pOg3akp1qsoFn2VbTUghe+HpT9YF
X-Gm-Gg: Acq92OFCssA/QYy/XUG6GBvKaZcFd5S22sx+YAGAwf4p5JylnJWs0yhAQ/LiRV+QSxk
	cIeFVd8TyFy8Cc8V6WFnfDjGx/vNnxt1+rdrubEC8Vt7Pze/CIy6pPOc+K1iG+GjRGfpCsJNRvj
	40f7W55ItJrxqg6jACTasSIZlmV9pVpXlvTfPc1W4moxewhLCO+9LwwD/KZBjPF0qRjGmC43+uL
	yP8Y8BBlBjbPn6Piy7AUkWvRYSU9KcekrH87idCYLBZCq/oKDD/72bgp8s4toHubTCNhvkxYDHG
	agssJlpYi4rT7YXx+ETd6J2kCpaZyMpnH1ZUcbBhPS0CVU01GBpoDd3vQOwbdbaTWYGQwackwQ=
	=
X-Received: by 2002:a05:6a00:98f:b0:82f:6e7:1527 with SMTP id d2e1a72fcca58-83f33cf0266mr3228670b3a.23.1778829296598;
        Fri, 15 May 2026 00:14:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:98f:b0:82f:6e7:1527 with SMTP id d2e1a72fcca58-83f33cf0266mr3228634b3a.23.1778829296071;
        Fri, 15 May 2026 00:14:56 -0700 (PDT)
Received: from hu-sauana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2875f0fbsm4030170b3a.57.2026.05.15.00.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 00:14:55 -0700 (PDT)
From: Saurabh.Anand.saurabh.anand@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
        mchehab+huawei@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
        nsc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com
Subject: [PATCH] arm64: dts: qcom: sm8750: allow mode-switch events to reach the QMP Combo PHY
Date: Fri, 15 May 2026 12:44:48 +0530
Message-Id: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2OSBTYWx0ZWRfX2RF4VxEO4rsW
 gOa3W1Ci/8lOflt21jAHrgkinZ6wmWdWubr4NS7rQFDy9GPRkWZ85dCCL5BUi3LreQ0CfU7SjdE
 E7rXDiEca1pwIFgRVMFKhOS8PzfDsKhGXPw/oRCWRqkf1b3cSe+PTBgbaCv8eW4QAjOZ6bXorgF
 hoO/LnaKfOiWKpezv1+jeqlkTXSuOEwJjnaT7MS9vpc+ZZ3MNkmdVttsHtKHWBkO75G65bAXYPq
 vwlg0ESYgKDKZsIy9nEJJvXncD8X/wjwFuB/cVCuU2zK/JU3pYJirBX4Fo/N7/R/mSmHWptA+Yx
 DH3KmTG8f2nBLPrWGupTOTyuAyd2LTJWzNrJxX6ya4C/vt5WNZN7hT3NWx0LtBniHWl6TdPCTvd
 KvOXpEKtDubiknsHjzVZiFBkIlmEa6jaHAQVOLa9/sCUi07V2Y6ZOIBnYOaGyhWYQiGOgUEyyFk
 CaC6gtQvP7RjcLXQjOQ==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06c7f1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=v9DuS4k9Wl8IPVb9zO8A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ctreqOPnd9i9_klWYzfbP8qaa0D_rxnW
X-Proofpoint-ORIG-GUID: ctreqOPnd9i9_klWYzfbP8qaa0D_rxnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150069

From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>

Allow mode-switch events to reach the QMP Combo PHY to support
setting the QMP Combo PHY in DP 4Lanes Altmode.

Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 417f28d8c919..254b94aa4a94 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2771,6 +2771,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
-- 
2.34.1

