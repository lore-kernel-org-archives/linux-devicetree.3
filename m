Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665004C8C72
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214213; cv=none; b=Eewic+00T6Si1r3N3jRrvNhF60dEndCM8bQjhvbYK9p38MoMOWQYIX24FraLoVPn4TgCUyfoW09r1pcSk2Ev38b8rPTyOpKpxNVrF5IjmVqHdY9c+69faTvVgyFiRyCE51vZrRduChMKvyOcz132SUSMJGiVtElGSpKOhIhBzf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214213; c=relaxed/simple;
	bh=QDTDqAg/tCq8IxKIyc6SEdBw2tY1qPENGerQu3kSrA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8rmG6fvVD93KK4yEiRMYNGh4j6BG2y4UjUmHjPieffzlMhC3n+hyFktrfs7s/2ZqW9JtjgEnc6HMV1EZqIXbUfcJXqIXOroXUtqRWxkbwrjubZb7zkitYxmp29YdFL5Ejlb6P9PZrupjfNkTwm61iD8LcIF66BuRaIa4maIRuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLbvdg/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNylXC7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLbvdg/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNylXC7A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EQCPG762560
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 15:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6/EPwoALiphdUI4x8Ok7eZgmoLur5fH/prziCvkMZo=; b=NLbvdg/sb4I+GhIK
	bz4aOkJ/XCt/mjbv3ejZzZa53OgZRSoO0kDEWSvI3mYzGFusA8L3ybf9KYh/BGhM
	qmEgMeBTLiWooYWmIg8WhYuWmA6IdujayBT99ITZI82moj09KWLTulc+lnb6ecDQ
	4btQ8NbdWZzQ/t9jNL52LL5gRnTIVmUKI3FvpKJGrfQ4azdVufbfNnpi7nLFkXfd
	lkZ4QgiaSOF7cpfRL5aUBdyTzpx1FjKGkHUayCqHRMMv6qiaDtpz7YRTScZ82ws+
	MOTniLnCOuBmQIq0GTKUdf3dymOHS59eIFIXzCLlb73C315bBEAIj6LgnuIqXuWz
	tkTyVA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dncg965-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:30:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88cd731cf24so1270380b3a.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791214209; x=1791819009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6/EPwoALiphdUI4x8Ok7eZgmoLur5fH/prziCvkMZo=;
        b=QNylXC7AGh/heSvr2Ya8K3OxyNzhAp1uPp/LpjR9skXm7Ffh5KQvE+5c7WRPN50OqE
         I6V7S9xI6vBhra4Falo1eFWypiY/VGf0ZMBWBKNppyMg0IK+3FOSiEtpS+piWATaw8ns
         JVDiXW049VymWfdVEUEBBmf0H/n+G7xTEDBrhCsqBx/r4g67AF4VdyBXGNyvwJHmojvB
         MHwxYWlOW3zd6ZzLiGsI6dR3hZYvr3Lg4HDV7O6xH7/P/ycBgzIgqi4eaI2DZ3H/gNf/
         t3Q4Snsn9JcIAIODOSDcegLbrO42iMUiG0I/h4hrMB/4n/Q6r6qen82K6JFZ9+cnInht
         RrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214209; x=1791819009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6/EPwoALiphdUI4x8Ok7eZgmoLur5fH/prziCvkMZo=;
        b=czxXl1oU0BUDzKATfdDQflnX79pR9NS4joFTT7GFpmDREoVKtPTrdk+naxhfPVL5RB
         Senau5zBhnILUsll+pJbsKwHD5p3s+slPwrpJdM8pAMgv6Sgsen8qUaLWucYAnzfCEBG
         0NlfIXzvQSkzQlxHXnn1UWxAAv7F74xroujmWY2agIj55jMO+rcbJg4bLia8DmDYUXRR
         YTUUibkucW7y9ToySC76LmFOsqUI5wbv1ps85f7/dZyZzNXnG99fs7+5XUJZQeoLcoX1
         wIJvayT5Jzv1qNdbpYdGXmiktavUMhWmtpMpY0CZJVNRA99u+rHWAQ8emNVufRFNUz0+
         e4qQ==
X-Gm-Message-State: AFuF++mfmvbap/Ybb4uTGblSJXLhkJwKN1B0ne0LJ/9tilOn2tCcjf1c
	/vW6fv/1m9qmTZFKWt9Eh48cegpDraRi+nUKDmVXnKxISpBgB9ba6vKCcN3mozEX9XpX9mP4f/5
	LGRgoeHTbkOVpxn8FGurOhnszeubdR5gHKuUjxml33F+vo6Ig6ouj4rBGVIqO/rRR
X-Gm-Gg: AYBFou3iswIdqYyWkfVIw9NEZiKoWW9z7BLcMicb38vXRwgrBLSXkWSFNqCQmTvzSAG
	oLZSnKxbDR7elg7kjlD8Z1Ci2Ef5C0hwL/hClIbCYxUz8Z4/nqcDPt1lPTDJPAuZ49kxPd79Ar5
	0cS2j4Hym5fK3WzSFIwirfchL8VF0n+JHCfy90tefK4mjWcaYca9nwx1B9DG982d7D8efWBSHak
	J5sdGmS5qejTQ/w9nE23j8anz1TbZQTJW1GFzYnnBjMit/6pdMAixbyYytSNvTQH5rQqFfgNrf1
	yUn7l0om+ajfvPA04ElBBu13V1QbFIdqVuzIVwQ0dqpqVynecw9PU19o5a6qsxNnPWvFW/q30qO
	bVTgVskAJxf1qjRtpiNIfiknh+ZmK
X-Received: by 2002:a05:6a00:3e1a:b0:881:d48e:713c with SMTP id d2e1a72fcca58-88af76cd0f0mr9426395b3a.40.1791214209456;
        Mon, 05 Oct 2026 08:30:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e1a:b0:881:d48e:713c with SMTP id d2e1a72fcca58-88af76cd0f0mr9426370b3a.40.1791214209002;
        Mon, 05 Oct 2026 08:30:09 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm3681528b3a.41.2026.10.05.08.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:30:08 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 20:59:44 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only power
 collapse state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
In-Reply-To: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214188; l=1489;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=QDTDqAg/tCq8IxKIyc6SEdBw2tY1qPENGerQu3kSrA4=;
 b=7WNzI0l2tQ7h/frVTDk5ybc/Ck2QTW6pUvVS7UKErAsTO0194Yw8I6I0qxC9dhaAqHug40Wip
 0tPasdOOjwyDRmaShvQmC33IHokcIemcgocBqlZvsmaN915o85Xqhqq
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX7FSAoWij+f13
 yeyRhse+NvLNMn5hyUbXOwQOc/TKLxLiCksCUDlZ2a1y4s985aPXYo9i9hDLdc3UXgb/UwuyuNv
 jZiGFV2n1D4MMaPpZWsKrqiplMUTaKY=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac3c282 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JkMn96IHD8b9Uh7FENwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: z0n2JtOv0EwpI6apqgqcppxkGdwmA18z
X-Proofpoint-ORIG-GUID: z0n2JtOv0EwpI6apqgqcppxkGdwmA18z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfXz58mxyhzWFGo
 d+MPZOHtCNEWEsvb2q3E0US4CGccYZMxOXxOBWBsmMcQxQ0pYzJLY2ekCGXfHU0YAJOpV34H/wl
 0Uu1+nYFeVpLhiA0Ha4X2BJ/JrrlO99yjoyvKRmfGxAoUnng4mQXL0zumSOLYaUCnfsLLUPlK+i
 EgOrdK5NHJapjf/NlVwhzCtwYJdsVxphCf6b6kYkQ3gjeiNfv3Wqcimi9PT3S6G0dBz5zDdHsZl
 oBBxRA3OHEZR8L1EMbqgR9mgGJmygjaTgsEFtEPEHKsP2v6Y4Rb0MKLwnLjbIE5KhliKiwjMN5c
 gzEgvjAPphR8McyySLJmRS9pGulLzGwtjF86JFssuAtEWot5ir4QRAFy6VoI/F9FFLqSra+PDPh
 D415dSGraDhL+/rFVDT01QbfgQMzZpZMwCZNboVdcap5n6CwUoeL+r+q2Rm+DrHzjM0k8XOlWbi
 sKFZAixayYnhTAkeT8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050060

To achieve SoC low power mode like chip rail power collapse (CxPC),
the Monaco EVK board with four PMICs requires coordinated power-down of
CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
collapse state is reserved for system-wide suspend (s2idle).

Add the system_suspend domain idle state, mark it with system-state,
and reference it from the system power domain.

Assisted-by: Codex:GPT-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808..b2978be6823d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
 		};
 	};
 
+	cpus {
+		domain-idle-states {
+			system_suspend: domain-suspend {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4200C344>;
+				entry-latency-us = <706562>;
+				exit-latency-us = <706562>;
+				min-residency-us = <709987>;
+				system-state;
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -772,6 +785,10 @@ tpm@0 {
 	};
 };
 
+&system_pd {
+	domain-idle-states = <&system_sleep>, <&system_suspend>;
+};
+
 &tlmm {
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {

-- 
2.43.0

