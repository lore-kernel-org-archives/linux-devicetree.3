Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FCD4369A
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786883824; cv=none; b=h4Z0CoDhFh3J0F3utH9bt5COR2fzCRfY6b+l6a8ijNjsUeulYoaWOVEgL4eQrVzT4P221FxurK5MfmGKt9+axA3MD4zr75+ylKT3BEeeZN97KyNU6pK9DqvYloCTuHmcf7ytskjw+aob6tg1N3qvPgVrCLnka6gNJLlou8gS16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786883824; c=relaxed/simple;
	bh=VixbaDMJ6jKT/l9N5pd48Ss/s+gAhAoHF+1/dAgkWzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYMvyvx5EZi3knwC953L0MUQj8O9u9BZBuUnsPBc1/vbHf6NmlQsH397lUlz0+z1Aq/wEJv5gFHZVDffU/6mr+kBzREXFmffSaO/QntDOOiMAh7RB8NlqEOVQOncRkgehB1Uac8m+PctPG58lC2UqKffn4mm8APZHboBGjFJpBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOYV6FyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fy//SsGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOYV6FyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fy//SsGJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GAgZZ33254679
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YlJQ18dBsc8
	LNnJrxO0Qtel6J6WCisswQvll7QXGaeo=; b=YOYV6FyYOyASv7gxleMJzUB5mTZ
	+/HeFCdk2sFAktLkW/H4rVEQB9ARB68VBiA0oYvdL6/2i3BHufBeU8DHdx7S3i7I
	QbdERwqT0OxMeq+g3Z9/X9hek6oFHkQ+ygzNKApxbYMLuK/bVYPwpJTEVfWnMbdN
	HlS0AWdvYAeS2/vLH0pKXAL98FAnzgAh69bP9zvRq26uvziP5jeZ0XSQ4+UBEcTY
	qsF21L7eXcW5OyZTDOR0OyLbyRd8d4sRwIGW5OFVqRPVtKReBS3qQD3EqtIFyNxy
	MxJDdDPn2IM1SyJrM6Rf+v3q0NgrYEgdzSwOrbtVGavsZVPCkNju7a+7geQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghekfkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:37:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so54422515ad.2
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 05:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786883820; x=1787488620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlJQ18dBsc8LNnJrxO0Qtel6J6WCisswQvll7QXGaeo=;
        b=fy//SsGJBb42yhPSy94kyk1Rz70lLNVDK5oB55kfg3uYRHd1bYtG7uuIoRF/kvzXNL
         Mr7oLZXtyqe/8DBWbXwZVIb0BjoHMOzGnRDVawA6dGJ8HbNCbeb168DP2zmKWGz1kpsH
         56VY/pfBINA689S+qsroSTvBhTIYG3P7veju8u8HeVW5dX8RexP7z5EH6IXJimGyoGLu
         DS5tUpgmTpH2dr54zUdZmYKa6F9vAzXcU3lpPoKE4xbJ1Es8q1FwpWU7b42suHZxqiCr
         cHF3zoqTlpefbnMtGDEOq5OwBucA850RDo3r/v96Dzk7D39omboe/Qdlz0P5TvQ9LZvV
         LmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786883820; x=1787488620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YlJQ18dBsc8LNnJrxO0Qtel6J6WCisswQvll7QXGaeo=;
        b=ZUmXl5KouX0glZZ7jvqxHrTS7UL+sEfR9CZX4KsoFlsKdYlC+qYiGhUjubzR2h0aTJ
         UEkjgebLunWHlyvLUbDF9BnSUDl36hXYTKf9NkinV0v1ajjJQ91KvUwEWy6axMDpbBwO
         VnefKw+v09Y9AYRsXeFY4Ihnfv4FxVxc/AcCBxH9HoO/fGRkMT3BkdAc7UkgWq0oSmkc
         i736bKPnBvqYvgnoENLrm6FAI523c56YzrH7Pqiy/RaWvfvvquq+WI2+TTt22a/nDBJP
         6QhCNEA+Qp+lWXLIaxE8oSCXw/HM5Cs2Csh8voIcPD6ChW6m06dwb7OsIIh9V9gdmW1R
         hr8w==
X-Forwarded-Encrypted: i=1; AHgh+RpJc+pE1ICYKuCoLwfJu99R5jlfR2ooX0FWBAQxqspJw7QvEK1AytR9gkXGjLrOxNmbAyVTKfr/9dhY@vger.kernel.org
X-Gm-Message-State: AOJu0YzEcQGY3GIkExGSs8+/9h8swtM6vmOJnxJh4lH5GBEIb28/7vgf
	ihUonVFJrjpn37LGjkS7zZHSrrtI+zD0+pOLlKOPADHUmk+J4JrQti208IvsXANc4uFQdPvMxND
	m3GEeRgcz9UrqGF50UJ3bVV72QqPYzY4QE+6oRQ4Ddi5hm0Ll7nv3JgRBD7JjerVX
X-Gm-Gg: AR+sD12hvPT0+Rh6Za+ufmo3WFLlEu76MSQXVEB0KitfIS+H7jgLnB6q5oZaMAoI7W7
	kTSbTb0lQiooYZOFX+PLiOX8nixycBMY89BhApCFDRQUVIsMKmq7YDKbAy++2bR/0H08Nrct5vb
	0+C5eDPPRf7jn7dS7ej6ygJes2aXZAkQ9+nJ2t2HXS4ccB2WoKLOYIMLYeysIFEvclf94n7EagN
	mPTrcfA6kd80snXotYpfB/kAvfLA3o1nkiN8KmAB2nKBf/t5trD+H9a2e9LwwaUsKq7ah0VQYp+
	EoTBToTDS+zvG6IxXefoDhldVZ8P0djFZMkUwVsEt+0Dy0e2NipZs0Bo6YBOGqtVLsPtJDnDMor
	3tg/4+VIkfde8kdUJ9yCzAI4KlCRnghof6gQIgbcw1dnR8RwfKypsnlbnBs3p
X-Received: by 2002:a17:902:da8b:b0:2ce:f9db:a9e0 with SMTP id d9443c01a7336-2d3b0e99809mr185732635ad.16.1786883820400;
        Sun, 16 Aug 2026 05:37:00 -0700 (PDT)
X-Received: by 2002:a17:902:da8b:b0:2ce:f9db:a9e0 with SMTP id d9443c01a7336-2d3b0e99809mr185732125ad.16.1786883819969;
        Sun, 16 Aug 2026 05:36:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm26146956eec.19.2026.08.16.05.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:36:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: kodiak: Use hyphen in rpmhpd OPP node names
Date: Sun, 16 Aug 2026 20:36:47 +0800
Message-ID: <20260816123648.1632681-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
References: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a81aeed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=X1hrRoCrYGTIo9OkIikA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfXwwUfHngiiU5K
 hNCMG4SOz7GT27KeVZf4p2ptVxZ63+bw60q2LlLJuDWKdpf57CcUj/VOfv/zWhikLS5aW0XQQQu
 L6fNYtYPuIb1jAzPIN6/hvXxXLWUYjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfX3m2CiBVj9iar
 OS4MNQEqf9TUoD4g0Y312idoDW2JFVfidFwQmS9R4mzD2RBHdzKeQhQ+ISP05U9OY4vLG20PwsQ
 4D2uaaDAohi/QyIvg8DR1KH6lu4Yxxn1+NCoiWG/QyhLthUNZWOUUDMtoM+3omw6F5JH9ibMVvY
 DzV6y2YR59+TKtIr7kD9Z3mBJSz61C9rTwLQWJpylTDJkTaEydPluBJ0JysM8o7ndn37RFWFUcM
 eQHcWHdBbBvJghGUxeRKjZDU+DoPgqB1sivO/0w3eV1+KQxceVDBdnG0I8k4sv12gcyIKnuNgBp
 gahmo9798vQhxF+F8c76IFVF8sW6kAi1LzGPPjafMRQuoKRRKQU77ZkNnevSFtEB2RpuiUDmcQR
 f12ADNgkKiVtcnbKu8lihFbjPm9CXRw0BdMsMuz/k/M7KUoaGQzpAp8U0UBMf/htTvTc+qd5PVw
 rBXnipt3QCaK1myhFFA==
X-Proofpoint-GUID: hmZKTCK-wDzGsT6LzEhkPuNHi3go6a_U
X-Proofpoint-ORIG-GUID: hmZKTCK-wDzGsT6LzEhkPuNHi3go6a_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160099

The OPP nodes in the rpmhpd OPP table are named oppN, while DTS coding
style and the rest of the qcom DTS files use the opp-N form.  Rename
them for consistency.  Change should be safe, because node names are not
considered an ABI, and all references go through labels.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..021e5f119949 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -7010,39 +7010,39 @@ rpmhpd: power-controller {
 				rpmhpd_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					rpmhpd_opp_ret: opp1 {
+					rpmhpd_opp_ret: opp-1 {
 						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
 					};
 
-					rpmhpd_opp_low_svs: opp2 {
+					rpmhpd_opp_low_svs: opp-2 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					};
 
-					rpmhpd_opp_svs: opp3 {
+					rpmhpd_opp_svs: opp-3 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					};
 
-					rpmhpd_opp_svs_l1: opp4 {
+					rpmhpd_opp_svs_l1: opp-4 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					};
 
-					rpmhpd_opp_svs_l2: opp5 {
+					rpmhpd_opp_svs_l2: opp-5 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					};
 
-					rpmhpd_opp_nom: opp6 {
+					rpmhpd_opp_nom: opp-6 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					};
 
-					rpmhpd_opp_nom_l1: opp7 {
+					rpmhpd_opp_nom_l1: opp-7 {
 						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					};
 
-					rpmhpd_opp_turbo: opp8 {
+					rpmhpd_opp_turbo: opp-8 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					};
 
-					rpmhpd_opp_turbo_l1: opp9 {
+					rpmhpd_opp_turbo_l1: opp-9 {
 						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 					};
 				};
-- 
2.43.0

