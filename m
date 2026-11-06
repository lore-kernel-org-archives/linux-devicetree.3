Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986650;
	b=2loZUrDrR4dxc+CgEbGke4lBagbUi85utNxWaNFlqmaVyIxtTHu7R9wf6eTNal2igYoq
	 8TIvL6Aou9DS6oRJZBmh/0uNP2fy8vLpVSt6RlHMP1HBn1tICs/agVvLRi30BtB/ZwE7/
	 eq6FVohckDYC/lhyFb+4cwODGKOuKVk4QirzkxCtWok8cVn8xk4IesmRfReL4kdjnE523
	 puG+EaRt8bxbS0uRsjMgzzCnXV58SMLSP/6/6HcLKgYxUzFKP1D7eW8UR1azusV5eG71u
	 d4QEWYwitFzrux0+diteF5yXbyUJU25/e0/qLz2pr1OeCqKNolWmRg9bKGvTSvTYLRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
	b=jyXZbqFbUWK7WwN8nrKpEMCsstY4XetE9LHmLXg4JLUG4fPgC1oi8U875ytIoC7gcwRW
	 SyrYY8a4F8SeBkmrvnwPyNTN9iNRzbMsZc6Blknd0LLVE1Xkv2eRzHFqZKa4AoGczndjw
	 imIGDtP1N6qVQUTiDuhAmAhlEPU0j+J1yUF3A9Je9Yr7XuhqUHTMG6/WjeUWENso/e0oH
	 RdyZCEOD1p5JDFqCQIt9si4d333A/nK8jS66AQuvfl/dWtLtfTfN/20gpK9e09jMVaDig
	 dUg8oMm1IKARn5W6xB/tWoN3XkV2tmWG3fMe8iZ668p+MLll/b4LoBQoIkW53V4w+mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fo0N9uhF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fstgmRUI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2985A606A32E
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2985A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fo0N9uhF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fstgmRUI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExxmG3722899
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 17:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0Q
	PMFVOYVc=; b=Fo0N9uhFYfLY6usSQURyUGdNlg7cDLWV+qqLg/8kQMViadKA/ED
	rReBf2trqAb4kGxF0976H/t/Xl/sT9MtaiU36y504gbdtmJOPCS0ZnVOyKemSm4z
	c39fZ59DRp1rXFXduwvUrsnF31oVDIAmC8QH3lswOhTGGJE3ECEj12PgN6nTYWCC
	h5On/4v961yZtJ3Xjp5b0D8hvCn637velKIbfujeCny8Vc5cEv/YP88wqOcb0m83
	06epewpsvbBPY5k4V42cXM4DDxhxoglL9FPfUFxHo/qw0W1CwAxbzP6+PzBDp5gc
	Jj/dXrCzO3SWCzleiPH2Nf8iBbqSlKsRajQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9kw4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 17:37:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so171021285a.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793986648; x=1794591448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
        b=fstgmRUIAd+AEsyHKFv8vqkbX57OCzJ+RQdTRcFVT5zPB8RFr0wa9217dSVe44Jxwr
         NCLn77ecZRFZ9DLVRqgbJ3h1Fa+6R/AWmY2JzalmWC6d/WMcDHNRZ0qPA+i7hDiXDwSR
         9lsgs+MNRMuDIOsvCLJTvtvFOAFcqodg03o2I2eXxLEDYrHIsWn/wNMfhusR0LmuuO/I
         ua6Fqy0zz8tumMy2wSmQGO9JypZCXcQGqsym5lFoB3DyvR58tp808SmGF4AzgQMLFubb
         J/B2NQMQWuGuPjVMYp2YFBb0cZQNW+c4VLwbG10/9eDtE/rA45/QWBzaNJpIe0fStAgn
         ZBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986648; x=1794591448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
        b=y90blwK8FWVqMxTX/S2SZvurg2MRanEipUTlaKbwiXzyZp20ynNl5aMM5dydDCIUk0
         f8ivpW1Kzo0agbGDjeI04T86f0uS+9lHPURId3favfMAKX59w15tVHUncjN8v3qREvZd
         id74o0VxWZBYe5r5daaLkx6DwpyXGEL/qL/9Ok0zzpbcND1Ja7lWyZRmLbVSaRrERXYC
         F2aICQC2QlDfswbMDcoK2qI1EuP6rvrqyUPcfYPaVaKOUmiQN8Ro/vlWKNwm8QOtFn6R
         7IhNsUxyOd1Jzp5loyhKj8FSAT/mos7r8PW5QnUDJ+WzV4Jrj4BxJv89mEANurDtaYEH
         oFNg==
X-Forwarded-Encrypted: i=1; AKwUvBwOM5fhvTd35XrVQFB1cQCRX4KIj3hL8Li0eYYil3dDWCUItKAEgLpuwOcFRe5KBD7m2hhWQixrogYu@vger.kernel.org
X-Gm-Message-State: APuU4Z+b1IE7I08vXcIn8TA93vyTiuyTSPK+G7O97TYM5OINag12He+w
	Z8u4nWJjzWKuRgkQ6rkHFY1dbRuP+b++jYt60InpRtKpmw7fwQL/Yx5N/8PuOYL4sl7LhoIjYmk
	WsHp8bxDqFfStqjEluQxRY3VKRmDlqZZUcq2ukHMSL98qEAWTsBrXh0HdKR3Y9z1I
X-Gm-Gg: AYBFou0BIcIa8ZI9vVSbi7wH8ymd7JeYnv1yyw2v6hNiy7Dsv3NMBG80Z3W2wGAss7g
	VKb8Md6NF4BSI8W+6/wgBRycFbsMOtohYcT4nuAo/yukhLcx1bwmdMg9mhFgng5LbMLAEfSwtam
	NvEltdSOLyDgfPgWidl6Xgjc7FJmSV8HCJ6SxTM2aZh8tlRedxoaIgTovh2mldDI4Ibus875U8r
	CyeCtRWBvAKy8ZubQXOaiNSlqLsUdHLADJeguqYvvNaY11oZb/m3KEUe4W7hNZ1ipLOB7a4wZjm
	MpdFfra+GUpHjMS6s+zxa5fO3Qe9gH5UhniCwNtkl4zm46mFOE2c/S7MfTiYmPMZReRMzBTS0Rm
	DFpQf8RYsoWG8xHXg9D6F4ueeu3WHYtopPtbD79D4QNJkPmYi1SuKcjK0tLpMaA==
X-Received: by 2002:a05:620a:3194:b0:92e:bc28:5479 with SMTP id af79cd13be357-945f32a3da3mr493258685a.2.1793986648279;
        Fri, 06 Nov 2026 09:37:28 -0800 (PST)
X-Received: by 2002:a05:620a:3194:b0:92e:bc28:5479 with SMTP id af79cd13be357-945f32a3da3mr493253885a.2.1793986647771;
        Fri, 06 Nov 2026 09:37:27 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6af5f0c63sm84256135e9.6.2026.11.06.09.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dang Huynh <danct12@riseup.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: msm8937: Fix CPU4 thermal trip point type
Date: Fri,  6 Nov 2026 18:37:20 +0100
Message-ID: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1236; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=cWi/sRCq4/psEC0lzvEToo4ZOL2Ky8kWa/kBXNHZ8aA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7hBQCZUMPp9KYItNyPqEg4img3WYZELzqxUP4
 mos81WLoI2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCau4QUAAKCRDBN2bmhouD
 1zicEACP59pIrSjdTgQicn3Mt0vt/PWdfrht2zlzS6Vd1+kwt56M5FphY8nJtURhhnOrdc1ERay
 hEMM0TkQj7O1CRFab956TZCz6pFX+MD1cvNO9cPvDvPKHgCcWZR3rHfEt+IMS9/UYh8y2aGNK8w
 4ElvNM2pc7UF83jvIp/oZ4bF/55/3H2FENQMxhtAu3vx234GgH6lUvrEarOg9PnO9sGdMfFwH0C
 sxT5l5PdKeTAk6M1nD9uu3sv9+cpVJD5Wyh5P1ygY90M7RJWB+ZqmsWZ+NfT+PxlE7orTTVzwlX
 4DxqcDOGZASECO6k4dGh0tG1xWv77WE0hj6Sj5Avbpj+kVe4oo//ci9R4b9N9nNkpor/RP6CVA3
 nLI+5vn8kqF89BE2o4RlF+NkXddvi7rv4bP1w0ro+VzmZ77oyTt7UBsIKU+PceDLEQdmg8MF4EJ
 hgo3E+IK7kRzSacPincswBkv+JnnPHHAbcvvIvybX680zvp/6fQ0TMXt8XThqfBGGsq790smjxq
 MVcsa9t0N8SeAMhhKQsfnUpm/RJ5IcSfDMjXeSGGVdrSPBZODCFAiREKjQB92Z7GC9vP9Get5x1
 q0qx/ZlI4/f4zz6iNAAVjjYrSaG9jfbXhMCXngiZT40PRUgh8Hdj3wvnEXRjUqxfs+zkVQRsPUq 3xWYWqwjDKTu6fw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cf3wJekii6wat-471BOGy8pEeSn5HXPs
X-Proofpoint-GUID: cf3wJekii6wat-471BOGy8pEeSn5HXPs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfXyi5UwXwjppyB
 Bm2I0VY0ccdA+xP/FW/lDftvwnPs2fbKxoInifo+UHRwb2Sh+VkWugIP3uoFestYWxeAunNR91M
 JdcROhksPiJ6t/RH6GIhpA0XFwynwTc=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aee1059 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uPNVP4c7M2W6CD1-7SQA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX41VGDeXGhC2H
 UUpdaglPsVt2rDjNqkpaIqNEOgc3EU6Eli1gTt1GVrDqPtplWG5FWOy1HR6wOFPiGfyJu8eWu6k
 NK19mI+5ZSpVzuR06wLhaRmBCGt9CMeMi8Qcu97Xj/mh+hYLI/PcnxB+7SuQeOr45LzIgcoqODw
 KbhrD418Uizsk90QK1Spb6DnfXtwWtoKzu9M7SyP5qy0Ucz3AlpEYTd2eN+CcnfIgYrL+Xr4K/w
 YZl0Ajh2G7p+omtH4KzIC3W2cMCi1yPFMW42SMOE6lMuOT1cRCmfYEH4qj/eOzTeu6CMzmX/2AO
 rLDum6bivqeF7HtjkembSA4Rwe3CZswYf/J7aCJwjZLoR5v1fLvRJiuuoPHKotXBwPhUqTnY+e2
 MSvJmEEk11jlj667FC3WQWBAbMz71PwlQrtTHPEoJArArsDLvefbcSvjbM8M18PvMfAptSRmZmC
 xqTuREvNbk9nsOd7nUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070

CPU4 thermal zone, unlike the rest CPU5-7, has reversed types for
75 and 85 *C trips: the "passive", not "hot" should be used for alert
triggering cooling device.  Wrong types could cause missing thermal
throttling of CPU4.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-3ae74c01-648b-445f-9a65-114b2d3b2ac6
Fixes: a829f6f2e8a7 ("arm64: dts: qcom: Add initial support for MSM8937")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de48f..6729b39c3f2e 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -1942,13 +1942,13 @@ trips {
 				cpu4_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
-					type = "passive";
+					type = "hot";
 				};
 
 				cpu4_alert1: trip-point1 {
 					temperature = <85000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu4_crit: cpu-crit {
-- 
2.53.0

