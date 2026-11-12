Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484840;
	b=0n/L0wSc3aqF8PJHl6GnWmC7BTIuwW57Pfmp4HkAkToX2Nl7x14D1KKhTuW61Lj64Zhk
	 r+30FcT8ltnV2SfL7c6XA2T7ybV4V7Ucah+5B8DhT9o0j4Dff5pPyeuI2IPJsI4nJyqTq
	 SClLWIWp0t0vptOoARBUrH5aA7/mDpx85B5zjTIwtzalYPLtIcCZeyzug+N6pbFUhlBs6
	 eJkGEqzA2zJJGEy/AUBYlMlu1rZgZFkbgfMHZ1YomdS7Fel8ksCycoolnCzQsYebR0lt/
	 PRPjegFa6sNDtvS633Qz6RqKyFTxUGvo4Yadq5iElRr/bH0YniUd/VjK5P+EjfwDM7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
	b=uKK7MQUMAzHoZZavpI+4ug8K1Z0Tkkrk9GDWuCwcdWuR/uItIMiFJVjEH+i5dVhdu/BA
	 iDEJKmeYQ0E1hnhuO6TZuZ211ahQWog4dteMt+xKQN9tlkdL6ba/A+IPFF6b9nxYKsNqA
	 xUl7FbPEGTU5PR5+l0s/J04h1Ry6MzXqEO9yd4ajyVNhcnw+GL0sgVWoD9rZAyJA/bm6w
	 AioDlR8Xzdz2+i4hkp9PzdxSBDXTrQWlzzCVTNYWiBJWp1ZFhIsAlMduZIopDweIhfGqk
	 d/2G7GhQ5wOkLSGC9PLIHJ0OxcK7uq8IeP2PhlIBcBKggd1rhgCbTSpd+Kc8Q3vkFJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iblHBCxN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcvOy1vF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8C8606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC8C8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iblHBCxN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcvOy1vF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACB80lJ3893075
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0Q
	PMFVOYVc=; b=iblHBCxN1q+nX8Q5rEl+KY0CkQSEziVPM2bZed6qkxrOeBvszvy
	LG1CBO3zE+hhU2S4PEP03iGIoGzUT0UO1mXTUoSyFynBLhwEKrkZhIhZ43HqfzXW
	Qez030EgIwwW2FOZ6PZg36CGJIsZmzPdIW6pmadO9aOvld/pE7ymQ9D5OGsNKEF+
	PZ1xxSRVKByTYDNwzCHH5UvQLHBiba6obAKK/1QzFDXuahQFfKWoK+n6J7QLG9u4
	9PJ8zkhs06piHeHTdhpPMu3BL0PgB4G5FCYKpEfYiXtgbKqyZlrSYAkRWb8HDYhC
	WJVsIgU2BG64TbljHpqkwogiLcNvNfMDVnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1fbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:00:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so515971985a.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484838; x=1795089638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
        b=DcvOy1vFx1CyZ9YcJav58N2cptC8nGuhYD1mmapKjHzJ8/MnXLQrz8bZOMGle8qgot
         HMwUFKsYwQ2KheOWUDX65BRC23Tp6hv9RvFiY0YuhHhgVL6XJK0B3n27uSzOnsKEIxMp
         5eObOXqlb6nxF+8QD0Dek4B9NESogjppOV1aAvee2IxRr12vS5QN3xc2TlyDLOHA5dXr
         lNy3uAoJ89fZBYp0PdLyMfZ6JyXttS7qb6eLSgu1OD+9YDcFRYCijVobYIdSw88rRhCw
         RSkcUNgVwtWclEmwFSMxiqJAq98JsraRLpYWYCM1IcF3tiPC6UdUEQ2dd9Ds4qoXfM/z
         Bb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484838; x=1795089638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
        b=iBdWXT6zJHZHVLEyZnPLs0p+jTy2ktue3wr9hnd0PWOtIZekEjeWSglrDb9fl5JlUg
         vvKUk+xk2HWxVXpVznFqTRlulZ83ntbq3II3XZbh2Bt+1fehdS0bEEm2w0bb8pirBOeT
         glyDS3PeCyRaHny900tcQOmjZ4yvyc+QlK324rX1cUEvqqK9aTck6sbLli5nbT7ahRAS
         FfYeJNXYK8kB5oHtie8htkditx6UVrkQa1yUYMFg+xwG9Bc2ZX1RZJ3f8M4MDPwaK6n2
         Bt28koCcCFdMpJ9OMSLOUsANlJUbhBghusYmqtvQybGhXX/sMNyHvZ620PaCl8XtKtxY
         jJPg==
X-Forwarded-Encrypted: i=1; AL+hErFj/SUEK1ueSAT2bIgK7Q6dsjsWfXaDKqE+5yR78sYV6rZ3bvhkzXWMucZz9OmdPuJBp+JCwlc1JDZZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/R6RF0d57IjGHZP9sP64hWOFnV6dm8d3xOHiQdk+7/+aFO5lkj
	/4NdlXy3ojQRUweNCZAEtb+sCbT8Ss65CrTu573y7UnaOq+rMkWeaeULYUfOmZIZenTAtV/E/OQ
	9XXKogM9DbF6fDWBsLLxcreYYlRlVf2R9LdOfz2qJQ4Ibvl+QO8hCBTMCBiOwzFZg
X-Gm-Gg: AYBFou1whYF32BNMh4f9B8Bcg+4F8YFBXM0yO3o9kH+1m/D3KqXo7KLiu2oKgY2HdFr
	brgUxKie470pLcc6Sl5QeJ+SJx+MTvA1sst3deFN8b7xk4PFJo6eWaIAMiekYWoeBZbMRZP3sUH
	1vLG7sOxQ4FWwP9ACoB2Aa7/y53lK07ACH7MFXH2TJVrTNUziIjEoEIzI8Omd54yLPYvCVsGA4p
	Dv5pyVOwcOn4ovxU9CQJG3e9mo2jT9vD5loee2XuQQs9/tzFcabhP0i9+8pWiuM+susmCWQBwwn
	XvC9iCgN0pp827DYVO7lKlbBpVH7sF0x5aSt0HMYX9Q4oJEQQfwGAZ9v7226fRwlcAMbK6aUHPu
	JGg72bg1Yo3/ev6tER0D/IiUQurRIkHiTiFRJtK7bXLKqjTFsdJDE8ps1icr2RQ==
X-Received: by 2002:a05:620a:6cc1:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-947b0003c1dmr923368485a.57.1794484837681;
        Thu, 12 Nov 2026 04:00:37 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-947b0003c1dmr923358185a.57.1794484836804;
        Thu, 12 Nov 2026 04:00:36 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm16682052f8f.10.2026.11.12.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:00:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dang Huynh <danct12@riseup.net>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: msm8937: Fix CPU4 thermal trip point type
Date: Thu, 12 Nov 2026 13:00:31 +0100
Message-ID: <20261112120030.99510-3-krzysztof.kozlowski@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9apeCZUMPp9KYItNyPqEg4img3WYZELzqxUP4
 mos81WLoI2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavWqXgAKCRDBN2bmhouD
 10FsD/91XeAAZdi+maVqqS1kOkQpZLVYrCPv1cUXxg1W6knma0UjDS6y3iZlAl5qWuoCH2LzHFK
 IimlGhq8qw8RuPJHZhuRR6N+qo4oHn9zN3TcxvS6JqSkVgQDguXW0PGsSsm2YYaChNdX0UZQMBG
 S9RiOoaxFuauq2Rzy7F8EPw0ANrLOGZvnOyQPdB0c0mmU3D7XvR3tvJLFljRL0PXXHTfeZt6hxL
 AwDJsVQR59rbSVpZTGynJNLOzCn6xIFVJ0sQwF1yr4KEBOqrYlnGas9mzrJazkCuhq4F09mUFfp
 uaSOEQSBZU1y4iy6NtCGdjV0W1tozo2fTz2RjGfsJicd5BNAaERT8LgKlp3giAUfZqKXe9xDj1Z
 hb0sOLBKBKCX7Es+nfqGPtmJBSv+sWaIyAKhLQd0dDJlOtHr0Km3p4SAirk9aSQD5bZkfF9h9Hl
 vOPCM70ZmwfAlNXQ+I4j7WzQtMBokLvgzMLS0c0zAXSdoTEIjE4Ctq5/Mhv/Dt1hAGwIt0MFk+g
 mzYBHLgop1WBVOu6sAyB10MGZ9jFXAeohuGRhtjRWQWl4GG+ujVH4ax0LnU700tlukV6tu4RqlZ
 9U4kDgqiHj/XB92/0bZgrB9KH2xKCLfscR+nOzPLJMMSoKbi+zFGe2J90tVWnkHNUfQS1v3nHgB nOO/frJtkHF2kNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6VG4LDcsh2FGqKowN2cIIddHEbZzofv4
X-Proofpoint-GUID: 6VG4LDcsh2FGqKowN2cIIddHEbZzofv4
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5aa67 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uPNVP4c7M2W6CD1-7SQA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX2ITsUOqY+oSe
 sfgu0PGQPZsQaSaOxctDZGldB9GENT9IGn5xFnwEL6msr11cwV+izmDbP9QBcJZ5QgGHXzg1hAg
 Wq30OguuggmH9+XPxqeduAnet510U9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX+8zfuNeTpjPu
 2KRco2UE7KqqqQU8DOnZzV26gahDpxxTkViPvI71ud5QaolsQX6c5P70qOPWfANBOwPgUjpkHoL
 WBUJI1Kh3m5nlvZe5xYCVvRLmU5P0BeAlqgxFmG390MxhmKQw/1JC0KbOQ/4bfhl8TlH1X2klxg
 n3Ccp7AtHmb37wA/biYr4tE0r39trdz/batVCxkW+P+9mz4mvwXw+I26xlkFecdbwCFHcWxs6Tn
 GmNdwN2URv4WKZkji+nwLvNjKYGXctZBbez0g+cb3bGlEu1UImpL+kdT/hMaKjruMVWjuMp/aQR
 CQYcLf4m3HlGS923uL47SOPRMosQjmHMDCPv0W6mPnmgXohcfHeouzHdwRRwncfmStZNDoziEeN
 VTHhaG+9qxuA39xj3R2++IOTZtij/fSN1yZPqawOHsY2+8fzn1NR8mobHX8787Yt6vydKS1hap+
 h9MJKId/pRU4Y7GZ1KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047

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

