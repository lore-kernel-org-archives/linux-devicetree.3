Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993029;
	b=cWkjIcSFCudCTkz4Pinw5A3le4p9q8bjKiHlp1QP78Fwn2yIOzT9DDHNA4+LkpvRHu1h
	 ELD9eLYxXA7sVh13bsZLdREXcFo8UTetIHHisWmE92Oj/WV2tSmiHzeBfqyUv8kAcaTTk
	 zfSoJ/y02k0BKuxK0F6Dh3b7LQfoecNkCn9z23t/VOMSKdp3LUcgxGUt8Xpbgw+iE9tWm
	 FOQuHUHcFL88YntpTl8Vsa3E8eBmKnOAFIvtsoiWQq/5rObLmzN+2t5TsXhiaEe2TN9uL
	 jfSUcNdadvQuZpI7r5lWmx/Ge2sfuUd17eWNF5fTdG9LRuSSrHc4gnXZKZXELSGu7qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jo9u9+PBJ84GTa0K5GJh0WhOUQmTKn1rL+9PA2nR/ec=;
	b=O+ID/IZzKnCK67VqLfHMDwUnFg2YECH+FV97tKIaexHFO59PTIg1GAD/Z/+QeN38JRkO
	 5YrZNc/o9B+579U5167sZVOn9UcesRlzOqSasf2KJnj6FoRDevFECQGVw7We4Uf+XDYVQ
	 /GxrexBwRpIRKz2nqXECrDkn+w4EsGT4ajysrCUTyqT3HAqQPcODfvpiPmleG+mIV3ZYi
	 kITWCMxxuuHU5ZwyXZ+bMdCSCqaYtX4oSZw0orBuSzKT7TTDdJz6bN6NHU8YSHUCFTLn2
	 STo6zv3uP0ItxUoH06dwN9Z08UgPu/Llu4Tq64s4eZmyLB8b7s2TPQRbSd0ScRc/NGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bzWIkmGB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReDZ5dlp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B8C606A334
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B8C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bzWIkmGB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReDZ5dlp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8YXZB2383049
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jo9u9+PBJ84GTa0K5GJh0WhOUQmTKn1rL+9PA2nR/ec=; b=bzWIkmGBQZ3kesgd
	ZClwoRb95eux2q92joKiuvvKI06WTv56ViGy1conYxZJzulzlSLDfGqeC7YmeZUw
	HQOUkP0RRLdXgMWgkh/HGXdbxaIua16fYOwNQg47e/YBaga+isP8mFF4s9Pe+gKR
	Upghm6atOlI9qQJXBhp3OmPuJp4PzNFyYvMZzrZqmtCkJ0gQBUqDTXRgHmqZnogH
	wO6l7iVkE3HyyoEw2IYmG1IFW5z1L+LRaHLYU2iG7fcqYXiNYmYCfCN1baCHVbko
	yCBsQ0FhDkBWLonlX6jRPpXiqzUZu1Rhz8LNRq6vo8miLc1HnqQbuUunsRMvqRmQ
	g7B2HQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvat8f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:10:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e94f72fb9fso7238025ad.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993028; x=1795597828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jo9u9+PBJ84GTa0K5GJh0WhOUQmTKn1rL+9PA2nR/ec=;
        b=ReDZ5dlphZawMmWbeFJ1jjka1NkhGzxzuboSpDe9YYL4axNNTPycXnryVOyUOiTQXO
         Fg5Z/cM4tfy6qakSvloLJWowNWcTX5CSzaDmT5FPSSF90vF//Jy1ToA++UXr0N+fYVu4
         Vxju1bUiZmApLrQhDZExflhCNP3ePZiy/bLzCebD63COTgjRnJQRwu4kVLIYYAgyanbn
         sVe1TTyj4Jqdp/AXUBrbLtuIYSq5tv4qgcoYCpklgmCayrkp3BmFeiDumTktjXWR0iH+
         Z5fDq29lpKDNSCG+6S6C3P2tuiqyPwvTVNcLXmJ/gEsR3HNLlG50xl0rSdUDE769KHpX
         xAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993028; x=1795597828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo9u9+PBJ84GTa0K5GJh0WhOUQmTKn1rL+9PA2nR/ec=;
        b=WFdmIOdk4nE6Q4qJOhYkVxcZoILEs/Ai0aOB4/sS0y4A/dNidq4NGgVZcdvUU18cdD
         kauC3K7xKPzDbMTOGm3WAirki7DHQg0SW2qZDZshZjAlxTWtx41Y5MSBWQ0E8az7KAf7
         gQsu3kQV73F1r//00dN+wtarMFrNFX7Zz8TMQ2TIyVAFK2CpVTaUF8ZjmzqpvkWsWWPN
         vjzrQKHKbQQwN7oBTSNTApNOCGIWy9gwvyx4SElXMly9YCGWuzGyC20f3ua9PdY+lBD5
         DSix4kJH78LMS2UEFPQFZWc7ZzthyG2rmp0MdrIO+tkyKZ6Xkadgrf0wqBkSsE48OmRk
         xORg==
X-Forwarded-Encrypted: i=1; AL+hErHMYK1VHsLhy5sIvxMHH/M/ETRCJrK1VNcs0YneaPXX/M/7JfKjRc1nTg9sMYMNyMSYm8pfM+FyMwEZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/FChLKa3NmSuE3bwWqPFKj3F2MP+onl7ArFDFBE768QOQDokbO
	/EoHnvr6plpCXHZWraEe9iNZONORNoKZl6rj2t2p7SwnV/ikj0pGjOIPnXRGfSU/8pbJgFrgOkD
	FE8LWLOrCFTfqKmVp0O1NONG/t0PfZswXBLbvENlGZU5dF112/tXvNumWGkIgCyV1AhSdlF0OQX
	U=
X-Gm-Gg: AZFdTZecwhdDWSnDTsDaapfhyy4sm9v1cu3n6pnoOGddBdJgchRtQnG4aZtO7gqyUI1
	J26V5d55zb87J83VLlVShpU4h2xnW3G9WotrTpV9aa1z3QLLYrOG/6UiFZfqgI07TOJ1HTA3Yl1
	Ak1Fr7QW3MWI9g2Y/zTqMjb6gsJQAQAsXT9VCpxClfioAA50EJKJyNGmsRoI6P7sC2TXJn3CdgD
	uRpLXGmbinp2kp+HLxfps+yUnoWyKAW+twdr4XWdg+HE1InpIQDGHLwFtY9p2K9a+G82Ew6K+UF
	s2VUauUdPqxeRoiLK46Sm2TdErteljO6D6EjeFRpbU3m+7qlsSQEHv0bUkQRWm1xiR33oe4a7NN
	2NUXbqm1n/pxcT2JGLL6d64Aoe00XfWcXwkMwLwyS3xZdH47N8CGQcV6pC0NeioECs0tZaIG/xe
	0fJJSwMMpfXUQIUA03icID1SSvBteza2TAJ/ADyR2/LGvqsA==
X-Received: by 2002:a17:902:f705:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2eff72051dcmr17436325ad.1.1794993027894;
        Wed, 18 Nov 2026 01:10:27 -0800 (PST)
X-Received: by 2002:a17:902:f705:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2eff72051dcmr17436105ad.1.1794993027428;
        Wed, 18 Nov 2026 01:10:27 -0800 (PST)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm10147735ad.71.2026.11.18.01.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:10:27 -0800 (PST)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:08:54 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add ICE node for UFS
 inline encryption
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
Message-Id: <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
References: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794993016; l=1345;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=KHd3LqwnyiG0pVhCXtBEcbPxB3BOCYgV9xgOZWJOkFs=;
 b=zqO89bLzqbljPJi3FQ4LuAp7tGhypuJUiKkSGjC+WeCfLQu/9XuIm9MyQ42caf+Ku785roD61
 1KpH3492qOsA+FJNtf4O7zYvC8MCQh2bY/kiIxuwlqMesE35rQmiHnD
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd6b84 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7g7wA4PAc6ioHu1SxIwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 4FshQoKoJuESzPRdH5P9r5bU9RPgOenf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX93nhQoD67PGz
 R65xVy8rbwmcpvPXIB7nx2hAjX1C3aTEA20ZwXaVD5ScYvhrXi98H0AGNGgU4in80ALuJzesSCD
 NhyXn5wGNq0ITWxkgqAjQ6Yg6Uhuj2uBmk3ykAW+UyBHDpJmOZk04ZcgHBNQwKlg4TqsLWoPjag
 4I3c12Ts3l25zZ9ztqsM5oopoJjttt2+0i6rvSM0d1UeY4w15NEp6GnP3g1KsWqBmOYy4WoFMhB
 KUXqmXi2GdvdhaPql4iOFrg/sLuQ7FHNZUOPX36Wze4H8/h2E7S48uvVUTzSfdG81+kR8nWvRHB
 axQ9J1hklCGo0BKLEOSQ2KSY0W0WkzM47l7d2Dk3QnA2xT/uf0bPZ78Ab+rlT/rsX3Yp1r1nta8
 4qH/ZvgdrdNEdYPCUtn0480JWJVKlvxJFtzbj8oIpQw0Hy8JCnkvndIcg4PlwZVHOUa636xbbHR
 A3Liw0N/C8g5dhvKudQ==
X-Proofpoint-ORIG-GUID: 4FshQoKoJuESzPRdH5P9r5bU9RPgOenf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX+IEaO7N8gZVp
 rgQQ/IRAswYxquPt4k23Uq9LoNeh7Erv/zMgZgASYFlG++MUFD4/u8wDl/Ng9KCW8EwIzCT55kD
 UK4QQ3zylsE2onv8VbGUnqzFLxANiEU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180036

Add the Inline Crypto Engine (ICE) device node to describe the
hardware-accelerated inline encryption for UFS storage on the
Glymur QCB board.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f55478cfda09c3db2143a1e5b91b8..ba949704e3b4fe2aa497873be6fa0a5cd2f3a1b4 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4156,6 +4156,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 
+			qcom,ice = <&ice>;
+
 			#reset-cells = <1>;
 
 			status = "disabled";
@@ -4201,6 +4203,17 @@ opp-403000000 {
 			};
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,glymur-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.43.0

