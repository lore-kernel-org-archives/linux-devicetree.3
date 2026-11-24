Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550527;
	b=zzEd/8AuXGBp14zRl6s13+3LRlLtleRD9pGMQANCi+nnGiYN5kijVcZ4aGYl/P89eU1g
	 z9ttyGmP4RyoxwzwafhRzDCK1dZNbO7a1ZxDv7T4owZJ62R1tUt62jQMuo9dyVLmomB1w
	 xtdnd08mO4UTZPyyss6srbZjnp8njCD24fLE9JsGIoZVIk6EJS0/6UAX004D+ncBB1yrO
	 qbMvVbd+SsL5cHFtqGCvHXFDtYpoqOPIZtJ6yMeAlhFK5eKwZjua0JASfqN5kzU6H8NSc
	 xCrpb5e5XfSOcCkf0Q76iHfNy9e/Kioktlmi0hVcQyvAnnGjeoSLfSElvv7fF0I6hPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=;
	b=z46b+0UVjQubDIwJhm/6PWtT17ZaV3OUn5rB341IXXeqf2BV0ZvaJo+M0fVfHMIPCd2l
	 S+7CP/EWurzWgu6vgpvC21g594U+JLy371UcvkQwjqNup3Sb9XvTepjoqpbcLrVZFJj5C
	 AEzqagBe2yKjQRgSxAomlAfcu96W9ML2zkGVj6hfRW8NrbUGa/2lJ4+QZQ0qDo+igP98Y
	 bAFjFRn3w8J2n+q2l+6B1gp8ZIG+Ou5Nqo3G1jP5qcY3Ehp54dwwDYY+pYrpGwf7/+XLz
	 UNAi2Rul2xqPBGqsgPucaFXqnJzgPEQ0MhMUha1cDzAJX4B6Pdtk0TyohlcI6VSEj+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJiHHMlD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQXtfLVg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA378606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA378606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJiHHMlD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQXtfLVg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXuVv3702030
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=; b=QJiHHMlDzapIWdkw
	3kJBFanukFtywHVqWJkFZ8pMzcNzIiD8OlVllzDuXcCLoVGTTO+vqk/dJn8Nz4Ca
	lAUrqD988I2rWLzgC0fQwmIL3CtgbUDBqE7bjsADOMw+9ufRud2+dIvtdFfFaUe/
	5fUM3Na69D53s57yqMSK9PabCUey/cxL1HRwXsRyBhkUtM90A5v2wuMMFAQRO0EH
	ofPAj1x7CKqwoFAfQhsjjQLXudHvuP5L8QBXDLzq1ixCtkUZNSnJ9VCwiUIESc+O
	a/hj3/hcxFh4+3kyFhTP1dS/aHlc7oN8fkGMAK+WHGhxHLmfXezpDAb9boq4Ac8x
	5eTELw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7t55p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c4997063aso14484571cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550520; x=1796155320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=;
        b=KQXtfLVgSRuiGkrIyJo4CKUwXkPU5l0IQaM2NEHzCOk35bWWnBZV/7bMcxfjDSiBJx
         ZGGRZxB+SAKAo8nEfYXkMn2nl34WN6fSgIdCApyXxX0nQEkF9rZvC+ck7dVyiEuzNV/2
         ksv5lATugpXgthF3GsTleHzhEli3v1edeE6LPIDEPisXfloOffiTuN3e3WMObPUrX9GK
         GmtcwuI0Ymwc8vn7aoHTOr/eKrvBrV7Dlyu/VKnuZcn5hMceHQH6rfpZZLmM3ShjlFc3
         3QEYeklw03DkS1rectwdnUCE0dEDVMAXz3T+Utj3sL3MJKkJETjYckVZElC+S+NSMpFc
         ruKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550520; x=1796155320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=;
        b=YHQORipZSa5tN8ahJWJUS0wEMdEekW0kUbL5yRHNaqp5Ulbj2dUZmJplZYd6F/zVBS
         /ILGDuMZxf/kHftM5I6Yst4nssPcdiEeXTEaNCTDQMOUIMyK8DfMmxmSWtHG7ZhnCL6k
         x7H+6B+gqP99cEZ4veIw83hOJtVzAAB0yMkUpjx6ASBwUVLtGZuH1QT1ioutunS/7eV1
         6Nu99ReNBB8Z3MbHvJlSwnZW7df0AN0w2JUyytV2fvFNL2UNGlJQEraorPoGps1NJQ7+
         +8O8IH1p7PkQwtnNaVSllyLG3B5X+JL+1P6+aBn27x+Ne5sEUBcTph26EPWmvvliLvyT
         OeBg==
X-Forwarded-Encrypted: i=1; AL+hErEXdE2JvU/KObRQRU6/ZWZg4pVw238GREqNKalibOI/7gT2//8NI5BtZ7Tv0CRh0zDDi71zpTyMlZ8b@vger.kernel.org
X-Gm-Message-State: APuU4Z/cf9IJ1CABth2pAbeMM0BylibpgQZi2cOBQ5xOWwwp2d6u+jf2
	csrrl5PUjs7K2LgDzBst8HSIPi6D5dLqdkHbSmMt7lYSufpikBrV4TpStdLOUar+qQsxWpavC8M
	wb5VA2CeHOS4jnbcIXJRLH8UcO7Ekb9z6JMIS59FRjl7T7s4/qs5066qTCO0Vw2L5
X-Gm-Gg: AZFdTZd1HmAyLz7cU0y5roWin4ccKlvwk97oBAeI/uM4fOzX8tTefxv6OOGEQfBHimg
	OF39J3Wn8z76V14e4i0IPFwULY1oDZ9IkEKNya5NpA4CKQTYO8PhOqMKFfgsDwM1j624HzzvQ8G
	p0xFt7KueKvoE2wx95y56aWNRuThiPW7ENfjUe8i3Im0NInyn3uhb2VuR10uXwlYKQs68KWXC3X
	lp5tiGMAsPiLtkDkhlJLyPtoJ65LcEarIPbuxki3O7AuNZ+D7JmraLr8029oWbthabPDQMoJrdd
	zBw5ftx91VWpiJ44ukxtWLKMwRDiVvZpM84JIdV1mX2EJ2yNjVpAN3mIuqPNWapXWhhoBQwOj1c
	9OGREH1Xi4JTekU04MgUfzQan0Z0UvVcxjQ+gh8N09hb3R2KnjN+J3OZA1zdg/D5TSe5D8n0TeY
	P0lK1kLig=
X-Received: by 2002:a05:620a:8cd:b0:949:821d:98 with SMTP id af79cd13be357-949baa042abmr2854460685a.4.1795550519913;
        Tue, 24 Nov 2026 12:01:59 -0800 (PST)
X-Received: by 2002:a05:620a:8cd:b0:949:821d:98 with SMTP id af79cd13be357-949baa042abmr2854455985a.4.1795550519390;
        Tue, 24 Nov 2026 12:01:59 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:35 +0100
Subject: [PATCH RFC DNM 06/15] thunderbolt: nhi: Clear ring interrupts when
 not using MSI-X
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-6-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1901;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=lQhH7OQzf9VgDsH8cpaKlHzic9O9I/E7X1/iq/ZRsf8=;
 b=itTnkK6xsIu1DWfmtZAk3+81tKnNczIoJxWhHQHf6wPBNR28LsV83Y7ssCJJRB4lEvbsjUlxZ
 PRvOcCK/TYtBA4xVMS7KVxT/taKfbc2x3oexd1gRRm50KBZuP2nBW3X
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX6xfmpdQy7Cwj
 tN4aCl3R4HAZhW7J4KR9PXUGlgCh6vPPWqpLuWl6pLtPc6gpKFYnCZ19rleQRwPy8Kva/QPRSUT
 G5EyTscuNFzBMLymSMonOEDEP0mIJok=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05ed3d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3EEjJ5KKZ7fs_CpJeu0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX7SNONo9b4d2L
 zk0gTwMaQNn+FA7nEB+4ZbfBtPUxAi1RvOTGIcJxbMb+UzeW6JZVit1aWi4dforYfbyXpRuyAbH
 Vw7vdKVmZdcMEquY3WGQyfOvJOtB9oLDjXRQj9qXL6yyltw1MgOfNiKOC3qR1+kcNZhCDPkazlG
 UwaPgSXkMHFOKon7EIAX2Qn2TlMkcXyRUkOMsGh5wAue+O7xBpkVXdjiEHE4wssOXwcWttQ8rbz
 0VAQJYPV4uSpMuWswwcwM9nFuaH5coxFtI0qDzQK1AyyOi6cyqtLmdjf+2w28qZNm/tFKuF3Ojm
 rM3UuO66eJtFVLormnRlPu8xssrrnWdXO6CJmpeVN+6uS2OAz0Xh+r01labnAsCbu8Ai5JCorgx
 AJw1ps+lrflIIUnET25s5gMSad5ckH4284PPK0pElKxlLQZThfUpmtb/uWs85Js7cO4yK+ccnLV
 9YrnRyujDHjR0IDZIbQ==
X-Proofpoint-ORIG-GUID: UalIAT5Zr55mal7_9Qjn4hf0Gx2IkLcV
X-Proofpoint-GUID: UalIAT5Zr55mal7_9Qjn4hf0Gx2IkLcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

Commit 468c49f44759 ("thunderbolt: Disable interrupt auto clear for
rings") made the hardware stop clearing the ring interrupt status on
read for all routers except Intel ones, and added an explicit write to
REG_RING_INT_CLEAR to the MSI-X handler. The single-interrupt handler
was not updated though, so for such routers the status bits are never
cleared and the interrupt keeps firing.

Write back the bits that were found set in each notify register to
REG_RING_INT_CLEAR, before handling the rings that they belong to.

Fixes: 468c49f44759 ("thunderbolt: Disable interrupt auto clear for rings")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f54ab2189cf424d04a9ec48576efe78283a83138..e48521482c021c7f5f73349ce16519d6088d3250 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1036,13 +1036,20 @@ void nhi_interrupt_work(struct work_struct *work)
 	/*
 	 * Starting at REG_RING_NOTIFY_BASE there are three status bitfields
 	 * (TX, RX, RX overflow). We iterate over the bits and read a new
-	 * dwords as required. The registers are cleared on read.
+	 * dwords as required. The registers are cleared on read, unless
+	 * auto-clear is disabled, in which case the bits that were set have
+	 * to be written back to REG_RING_INT_CLEAR.
 	 */
 	for (bit = 0; bit < 3 * nhi->hop_count; bit++) {
-		if (bit % 32 == 0)
+		if (bit % 32 == 0) {
 			value = ioread32(nhi->iobase
 					 + REG_RING_NOTIFY_BASE
 					 + 4 * (bit / 32));
+			if (!(nhi->quirks & QUIRK_AUTO_CLEAR_INT))
+				iowrite32(value, nhi->iobase
+					  + REG_RING_INT_CLEAR
+					  + 4 * (bit / 32));
+		}
 		if (++hop == nhi->hop_count) {
 			hop = 0;
 			type++;

-- 
2.55.0

