Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A242A391E43
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307838; cv=none; b=eQ9KsxSNXhoIX9f0h1bo8acYVV5AjXtA6Um3PN9q57IYCh74NaabUxxWpznZJMjsweCDez1vUkX5CqBzsB1IVcs849qbhfvxJFK4kDyCEe4ZTWt+e17N6IMgTdZr1okkisS6QedvNoFnyiWOfOG1vFvTyDJyNOX37QjEw51cBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307838; c=relaxed/simple;
	bh=ms71wKN46jx1oVrs1DdtFJngmBDeqxFXGYDoL9en57M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KS9B4rwP+30mzFm905J1ePajT+L7AvbYA2oRdZqsPqIQUV6U+wFg/uFwgUUcny7JI2SD6FEThOLoktzeh/yH2IaGkhcUWOS3tGKHdz/4byi+uCOsfYQRZhpNFTXQvoEj3T5L9XYy0f7aNE2hcaHjGvdB3Nu0/ubeKYn79wcwjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2+fdcr0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtZzgsLF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2+fdcr0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtZzgsLF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5sx1e2109594
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 07:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygf8X6ffossj1aI4TsRytKCkY0uZ+PHciaOL1GWigrM=; b=N2+fdcr092EMYViA
	8Wtc1lgI+fjDXJ6WOM8fPMK9YHZijx2GBBapioW3q2YxjsJNPKVSRqmUdwZ8w74s
	/ur8J35U/daYZMSJijP67BU+75gZopfhCWqDxClhScd9IsdESB5DAcdaX/a+Rv0v
	T0q+2lxOYkSLFgZRD6luo9R2MHKzHpznLwxvK8uS5LTIXE4UI4a+PJY7LGHV7Po6
	T8NGgo0V3Ajbnd/fZpf3YkwYWIRfN3+JH47ta0SGwGSO+bXLeCMLdflbRdZtCIx/
	w12rLSi14M/SQ/hZ6+B7VCAUVJ9YXABuFpu4izxw5Bslk/GZkVroreF6TuUWp8VV
	DaZDwA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7tj5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 07:17:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c902e0da2so2884159eec.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792307835; x=1792912635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygf8X6ffossj1aI4TsRytKCkY0uZ+PHciaOL1GWigrM=;
        b=BtZzgsLFoqDapOYRP6ZdVJBJ09uhCuwGvguiFM9yMUi4u2MTxh9OEcJ5a0RpxfbIby
         sDp7vz4sHIjz7xzdrM0fw7ETu//s1rlmF72UvZbcGHT0pOW2TV2cEUwuS1KI0kPn48e6
         3JoJ584fsHbX8MW8fn0IRT170nYzV33bwx2xmwfx8wtw9lYjx1i6jSW50C1bsETdruEp
         SNrYwISVSlsMZLA00ampawigjvu57jxzKbyNRe4KasuZDGoTCGauGXjsAVWWjZowgPpd
         D5rt1oVp7+lUyS9w32OKH8sOh1BnD36GaRKG517VX4oXqaURADCDoAwN3LUuRIHymIMJ
         d88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307835; x=1792912635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygf8X6ffossj1aI4TsRytKCkY0uZ+PHciaOL1GWigrM=;
        b=z0Q9kpdfc5xP9RR1wAJ/7A9NfQadJYNmjBTS/cdErTKEzM9EBBnT1La7ftvG9Y0fuo
         WP7aKj+tmSF7mrbJbm87X8fYb2ETKaAvZhV/t9UBOjFTvBz295pmAgnXGSj/AS1qdrMd
         7GEm0tqNw+ODjxOlALOaPrZ57cAYAsBV7689OOw3W9+GfjzhndS/Ew+8lSlNO50tvNaC
         uXuvSF5FSK1wC67tZw9y8M7gNjj0lVeSgCLAGfqgfGDWSu2o5BptK0ou9a3o2kqmP5NI
         hYgRJ6bNvJxVay5VgPgKWb/8FIbbVw6gJH81ZGoVOB6117+li7gYIVyW2n6h1A+4OCfB
         Dpbw==
X-Forwarded-Encrypted: i=1; AKwUvBx5NWu1vala1nJ6v02Oa1FeUjOTXHzMdxmvl9vWhNz2aFAOF5l5vUe9EHaViLTztH9rUmR7/3pf62pI@vger.kernel.org
X-Gm-Message-State: AFq9FYJYAL32CZ1oB83YWnYdrKB8v9vLkRgTwbqSGq42sAsd+LuP0Cq8
	NJIOU/SOD3Mf4R7TRzZTvAyMhBtevCQp/29QPEFr6gokwesUaeIUD2c38UopQUflXMRxByZgnEG
	O9Uz+N4EkyzMvG1cY+L2bC1xmVdaUBDshdcJ3gQzhZ7jeOkD6SY8ARTqMu2XaTzhM
X-Gm-Gg: AYBFou1fcHiQt1HF/9TEctexE/EES1jrC5evqIjTZDkiGukRolf7n5E90MSjZaO2uc9
	rmYr5353336GevD4Wqdj/u1KWkOzZihaamBLHLDIAc+A7XT662lwaht1lGRySntjua1ag9Jc1wy
	vigQLIOed5iQeqy6tMSMZdG5NpLuKLVrCz2ilx92eSNiqkBZE6pFgLAtV16vC+r9A6LHy0vxJEa
	GUjg40B8QowtxAQryb8YFURP1WeNBbt8hHSHEYPbgOchDfmc/6AkAiWUvTtV6mrIH08xiQYa6SP
	iLja8B02mPIggUD/3w5Z25vo7CuezhoNEsu/Z4RSZ0YlQWiPFqWR9h8Fovkqx1C4AMIHLEP4j5F
	DRngJedywvlve9D0739deH2RvFaye3Y/g0h8=
X-Received: by 2002:a05:701b:42d4:10b0:183:388f:c653 with SMTP id a92af1059eb24-1850fafc54cmr5788322c88.7.1792307835460;
        Sun, 18 Oct 2026 00:17:15 -0700 (PDT)
X-Received: by 2002:a05:701b:42d4:10b0:183:388f:c653 with SMTP id a92af1059eb24-1850fafc54cmr5788293c88.7.1792307834812;
        Sun, 18 Oct 2026 00:17:14 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm18646776c88.5.2026.10.18.00.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:17:14 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 12:46:47 +0530
Subject: [PATCH RFC v2 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
In-Reply-To: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX4UkVTez2R+0v
 LQq495HXXnRxMZqZsgb7oWAnIf9lLm25tsufVCsPoHbad5IkxQIrsCiaVVenDw9xsIzNudABE3r
 oVjzu/5ekWAZ1noCgBd2EiS05pEtS9w=
X-Proofpoint-ORIG-GUID: _qdwqAmtEgjLvo-FAudsZTCimDj4R7RS
X-Proofpoint-GUID: _qdwqAmtEgjLvo-FAudsZTCimDj4R7RS
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad4727c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HtUtNg7S4ek9MPr1-YwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfXyDjzE1tMdv1R
 bijZf5Oi9sK7/DS1Bl3zERtliR9CNkg5+3+hYn2BxR2s3F0pBJiNfNFrdvHWVJEqoVOCVIT0GFH
 bRtKPUgkypfmxesqFs+PeGoVu4Fm/aJHrB5jNSaXE0naj+22ZrB/Ls42/WTXpAW3dskZojEWWwL
 BdvjZy53lfMkgJeDK6TtFVxh/F46SrOWuU+tyRFIgg1Gpux/C9baa9LY1ZIsm+YosL5257wHMKB
 6QhhXsoN7J6jBaMGgxcP0pXcgCILUpfgR/AMYGgWLEp9kI5h/TBvWpP5lgFYIufbIFZvPnFLQUP
 hb3ya4+mIorqmk+Jhn3nCwrPcKqzX94AOqxeFwgFoPD7ekmN8c+ZFRK8u0nhio27+PaK0Uy8vRe
 YUCtdods/ia8nH8W7NojA+Gh0bjvC9gCSOT159lu2ecHqJZqsmFhbXor+GDyerDH+KRCr2AncJg
 zFH4ZIa47VWWSzrDK9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180028

Add the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..89f8d36ed812 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -434,6 +434,10 @@ &spi16 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart4 {
 	status = "okay";
 };

-- 
2.43.0

