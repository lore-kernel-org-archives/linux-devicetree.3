Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819831;
	b=kxSG4y80D5/dZWXw7IVEbGEXbV+RS3DkilWP/US0CEmsDGH5eRCMquKIWcXexTj/lmXZ
	 tRWW1ZK8c7pHTKJhlA7L29b4jwnoTHJ1/juLwv+tY6Yki3C7oroyibGGk/yIRZhz7OusH
	 kkWVdQ9HyZ6wIMzmQuMD6z7qfxJ8fOW3l2vjdP2vU/+rG+rvri5efmNv4JTF3pX6kFRoz
	 kVjmD5LNi4bU2zohRAhHsZ0RItcpqh0Yfux2pHeY8J5HgXAmMS3Z0rLM/n2Q3lnxAlpBE
	 mVEOH10+MsaT1ef02xYZpBCy+Cv4KdRrMsMZoQG3Vz3MumO6Tu5zTVm3rOfu5HfgPfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q6Q8RcSBFVRrz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=;
	b=hVIy+vF2rOfoDZV++f2n/6cMagfUfaGkuoZrr44xgvZccTOLtJ4SftruLyQy0MRd0MI9
	 Qlzkbh+oq8f7NMkLJcq/nHZxeVl5xIzJdJYTp0YkGtEv7c8kOJYF07QjgKlN2ci+2LIks
	 RwIi3gkhOzaRluZuJ5hGOWfFmxz25/aBlQSxcBMHMoLBNnJCAp17uiImQYIPmP1RzxETn
	 0UpuDKKjCr/LevlJ4P54sSOAobJ4YHt9ypJHqsTCWPQvOeM62am7zb3OQO84nPpFej/kF
	 j0lzlWUDeWb3RU/5xduu+7PWm2VZJwNb+UWPl/HETfyn5/jy/QxdKeRslFfRkQPVsPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TijPpIUi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOVFsvdj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE1606EEB4
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 19:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CE1606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TijPpIUi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOVFsvdj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4IcaOe2286023
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 19:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q6Q8RcSBFVR
	rz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=; b=TijPpIUipHRTivzHQAa3LgY0TBG
	qumqd//eRj/B/nSVcI+gZZ9IqR/xeY1TxzvlqcWPx9dVfg5A7X+Nx+ok3D/me3YR
	KtGGweQYr9QbgjLw+BiHzzzC87mm/d0TLnIgQS2buogj4wdkTi1NfuEzl1vEp7yz
	ZCFTrSjMAr+msbDis+h91oChYNefUZS8EZ7PkeCD+0aJKCfrTrchtmcxYb3KvoxC
	V9suguRh8bf1BGCFxg9CxhGNq3gE9kN6FBdXW7IwD6yeXDl6xo1URmXW7sQpL0L+
	NBpueReca568o7Smd1NV2z/guJrfXsGAr5mVtYCJZOAZDyPqhoxih0mMPkA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tg5p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 19:17:09 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaad995a7eso307212e0c.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 11:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793819828; x=1794424628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6Q8RcSBFVRrz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=;
        b=gOVFsvdjTZuA+ZtnUgBYLddtB70mCmBnGaozLg4wlrzY688te8MumcVnxz6FAwESmz
         /JObwGAx+wqo2z2H1NES8IJgrLSC/RMqGQijFqTyNpFXoxwq8z1n4WzFaRWy4UjHWlEU
         nK7ZVOeur4yMeDK3qlUpPpas1KOqkgy5XMnQwNL0X6/PDLiR0+lYIANusPG80pGagkYh
         vdFNU7yj1Rbe/c+GGTxHofKv+s6Z4jkb6hPzNF+WnuIdrVY9o/+aUdZVh9QN/nuc72JR
         kv3JNDG5f+eke9UotosYXbeLCPAqXswklT1JkACJVaLjTyvQwQZH/NUWZY6bxeT7EjLn
         /AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819828; x=1794424628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6Q8RcSBFVRrz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=;
        b=iQgMswuMpBO3OnWfs90jC7TWgUNR2hhsMETIHJ0QFaAKDWSWl5BxXKOD+E5dXqCULs
         1OnBYpIWb2V/lt1UwZ8PGEmgfdldSrLu0M6nYAFGWFRLyoWl63Mq+kWTAxvi7O+scb9a
         kQbTK/+sBIdFVXNvzMXcSwFkHVg5UmymDNnngOV4jzpmZTqwwfY48+ZwmMhlcLZ6dRDN
         Hlv8e/KEPD05rTW+1cyAmbRrVigOsTJaMwUNv18JpelJ/A8ePXXVaqS79lDfUjNIi0VF
         /s88owfleTCVCi8yIeN3nkyRQGWxt+s3jk5Pvn346Ih1IW4uU3oIyRBVQVnrqIvodw3z
         jj3g==
X-Forwarded-Encrypted: i=1; AKwUvBxlPPbgsu6Azd0xmQB7mVkKQUXp9wwX6r28pINBpFUYwv5VNhjhdOrVQpGgoUTkHd+uYCYYIz5uAJIR@vger.kernel.org
X-Gm-Message-State: APuU4Z8JxsV9GWhgdqc6nuZYOzZmWHkJLxsuMFWEfMsEguMGwX7xcIeI
	l5GX+Ht42HSPB1Bubv31ei4T4EGzf3OmaqSPjLnjefnjXxSVq2szlTnmQAKGw2QAphbvwJtYs8J
	hYpKPMwaHXXKf9dV8dy8pVkpN9Y7J6lv/Dlo6TGUH45CNa04C0Cwm7f0WKtT62HRX
X-Gm-Gg: AYBFou2axrv+qqZwvnE2vqBtGPCxG0JfjB2+c+N6j4S3YApN3hyErEJPF0cPDfVPbm0
	KmHngq/Rlowd6fz2Bh/3GDmsvOyCIXtJK9rRhiaes3pNTVMo+wRGdsXMIuGaOPXKbXyqxTxTQLB
	J7TuF528/jSWxmUzwVSggeJv6po6J1b1rAHE+lYLzFHx2WjsQ+AKW0qzwgy7QSXWnU2RE++jL43
	djkp1oJSlg/ntdVmsfh7C+Ajw1j2a1Bhnvd+lHZ2GrtOb4PpkAXHCNsiFCZnN9Y7ZPKJ3o1fgU4
	tBEV/bz+ma1NvBpYih2Dq3hjieh8gRGlXAFLW7LYI8VZTS1EHSgjQXM82FGUmhqw3iUJNZY9Fxz
	2JtcLS2q0VZ9DlZZLmZJJQF4DjKINc+JV3Wi7F8u83ZQK0An047crEjhr30MLRQ==
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr7257075e0c.14.1793819828369;
        Wed, 04 Nov 2026 11:17:08 -0800 (PST)
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr7257056e0c.14.1793819827888;
        Wed, 04 Nov 2026 11:17:07 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm51276405e9.1.2026.11.04.11.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:17:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: eliza: Correct number of TLMM pins in gpio-ranges
Date: Wed,  4 Nov 2026 20:17:02 +0100
Message-ID: <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=jLLCPmPoP/h1cOKVCJRT+QUvRn14cXBvj0hDECNRi80=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq64St0KwQdk10nNiuJu0IKXMwnN1GB3Co40RF8
 Vp7pFqppwqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauuErQAKCRDBN2bmhouD
 18eQD/44SiaWNngb5Fnb2pwmnEgJQmyepIOcaFb3bq/kiHT9OXJIuMCQmADCo3gvdbS15/gKp0g
 yc6iJiEWhLfjC9RQX4MsPkHLi/QVTx1b6sv/7c3kpszmPAQX8yqJABpq11/Ne6eMcNBuEh9ITN9
 omwA2NpCM6C5+GgBxt6VjG9cEWjabpPUebHJA/JNb8sLf8AXtWI7X+6jqh/At0vwc8B93kGKV5y
 TqLB+lQEbi2LWUeBQlEu3CKKwAaNI1ALlj+6pZ0kDNf373AlXXXzPnUjbjqveyyWj7XK5bglSH2
 OX/5lRyHuAGNX7nNjcGqoljGsAZFf2pcK2xw9AfvP7llIZCTHAnmh28FbjNyUUxtWxb3dCViIZ+
 UjBT2f34nPZpg2KoKYWcj0gyNOubryFGCBm8tj8oUDU/qiEq6MiQwEz0LaR4enPDwYSk70/JJ1N
 Ryxu0c0npj14iIghha1DJogJ8Qu7FOOfSKiWHP2M9UsTNVyTO2zskaqb0bFXpj2baLVYOASTKHt
 I6mJImrGJG4+YtKJxcKLvhjf3+GiQKs1jX2EfxEp7lbRZv+489krwiBJUAsN6v4WCTINdiQ2X9c
 KQE6z9ApUjaGrAfytjT7/01Z1IdLzu8055Www/5a6CHinPMmnRl09e+dtDQH1PavDQP5FIc2i71 cVld2nHRj3ATfTw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfXyjI5UjgfEDlT
 s3hohLWMZ9icGYtNmOIqjZgekMgqhwasY1m5SUFGKvWgdWqdnLlnp7ALMHxUK08jGHzmxng7ky5
 LEM3Hv7Kzurnu0VP0G9SO3jJhXw6KKE=
X-Proofpoint-ORIG-GUID: cpm6l_Nb6Mof3lI74dab2QRhUuZkzsuT
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aeb84b5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R5-cwpJYxvnsFHObl-YA:9
 a=XD7yVLdPMpWraOa8Un9W:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: cpm6l_Nb6Mof3lI74dab2QRhUuZkzsuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfX3lDcnrEHQrCg
 3sLLHMcal5MNCmFSsbxckKcFWaEQOCmjdyoOmfpdPyOCVaqVPxfqdp3YzEBiCP/odcbdej3PSEi
 aGNQ6g+WMmgfr4j5Yy522svD2Ms4ONTzqB0O0pk+ZvxV96Y3yt/eJ/hp4FFfyVNJOjLzYd8Q7QI
 +H+DYLo+epuddG304m/p3fi0AIP0fX9xcL1/OwMOZGcnPBEZUbgEZVyHSapWXMuyV6H8AhAV3ej
 WW3JQaAvXTLdYcNmrY6ViydZn1V5Cm746wmvFyX7Iu45bZHHUvkyHOnGgixKPRTznaoycwdburp
 qMEwEnof5NiuPToCXffhxf2cS+m068YfO5Dne4kA6VNTGsaKC6pA1cFgKqqWaGCIuImGtzbyz8Z
 BsvBI6OLOYFnZ3r45LECivDBdxMqOHrbth+5cvTjuTBEPPMVZLK3AehQYK6Ke4AkshyjANGG/Sl
 ncd1ZnomHyEZ5Ct0wBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040076

TLMM on Eliza SoC has 185 GPIOs and UFS_RESET line, thus the last number
in gpio-ranges, representing the number of pins in pinctrl, should be
186 so the last pins can be configured in pinctrl.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-0e88535a-02d3-4a42-9f3c-ca4f9bdd3b11
Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..df7426134722 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3577,7 +3577,7 @@ tlmm: pinctrl@f100000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
-			gpio-ranges = <&tlmm 0 0 184>;
+			gpio-ranges = <&tlmm 0 0 186>;
 			wakeup-parent = <&pdc>;
 
 			pcie0_default_state: pcie0-default-state {
-- 
2.53.0

