Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB445293FE
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058187; cv=none; b=PaGrvisXhrQHXdi82nIMgKaFt3W7KlM9XADY+u8nDiOcGi/C8zRd3B83WDZ5SYuuqmnf+XQXwX60F+JC2+xUgVosk5H60dyYsyOWDl8jKRb4wJ/2FNMmQrxmYs+MQt0mqnMTu7QErtL2H+12PAgv0bAd1nJ6VEBFsPHU9AgPCCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058187; c=relaxed/simple;
	bh=xzu473Y7V24ggj3le/TfoZWNsp/SkGbTiLRw8aI+628=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myiB3nYadIAD6FdTMvsg4riyKiVUhAF5RgHGmWjVn08FAKSIFTW1Uh1n8gf7MC6S9vEpKR91pVgy/mKEUCpyXda3+1OJrBlQXksFMcInn8i46A/NoZgw0BiWooT/MIfpCXp0MxPTpH99OHx1t1ReLWmf6xJZsSwmPCmUv32zehE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoW3znpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyO4rwqP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoW3znpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyO4rwqP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTms2809309
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=; b=HoW3znptfsV8eKyQ
	3QCkwfF61sW0FHl7f8719XRyRCCQMyDnDSouGTBTJTSlO/jEEu3kQ2lqrbM/ZCSB
	3REObE5HTyZQpdzN7M6KoP81quM7ZXGOYNLxGhEybkUC6PCPIz1ARwzD//TrNx31
	YivnFTrWdxSksODz2YkzxqwsE40aqpB0zJODVKaPhFfRCUW7zvfiYGl93niQtNFp
	OJIpfqvTGBb6K3zNPINGzfwTL7NWbGN5pvxUQ3msev8COPW60pq0esQsAIB2ylOi
	bOVyYq6KzXzov8lHmPEQ0m0EpUVApah+XkB05S10QXQ/6V2C5SAuhuY5YwM7y/Qb
	aeb37g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sxn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:56:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso3632788c88.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058184; x=1792662984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=;
        b=JyO4rwqPNNesPVfETv1rFiFgA9WLe6IHuVVna7tU1QiaVlKtxwaD/n+EtMeIKgWJ7U
         NC9/WnsEf7UMKnmt/U7JANhymFVXeBXEG5iuDvVvfjnc6fSqcafBJNokmRFWMpuIw1sY
         GX9NRiKnq+1raXh8PbbyKGsGDlvWGXfvgUAa0r59jABSA6cKjHvcvT2zIBKXdqYNhUAL
         hl8IMpM72F7mSFrKTeuNaWTMpz3a1/30yNT0lKQAKoBLGxxI/40iEMeyAwOLofpBbdap
         ZLyEHmd6pOAcSOp03k7ne3X1zkMFhhOp3uj0pzFhrvbXtXCsiJOKLM35s+7xoXCkymV+
         cdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058184; x=1792662984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=;
        b=KUOGPH66ctBni+EoyxDVkM/bj2hI5I2xacONNpJkpwks96qUyc66A42ULC47p6Xjbq
         EjhI5l9S63wExrH2HJCkTH4Nk2TSx585Qn0mEY9MJcqP5qnH+sTJbdzC94VYyHZ42sqS
         aoDDgNCbJVZa1u2Y0Fu+sdHeTWr5n5RyE1ErtDbJnMy9n4beGDoCEv2tZo8YEOyH73Tc
         hSaCzpLP9G8hDU04rYwegclRGL9v35YZy0vAtE9LAqDg/4Q7/OVTXmx4tWGAQkCFFLu9
         +oPZ+3uDUPKt+TPP4FjhxuJofdf1OCjczOcqizWHCfuYkzpR44SzRJqFjfLJw5fve29f
         7z5g==
X-Forwarded-Encrypted: i=1; AKwUvBzr3nFHTmBTey5olbSRzuCkRO1lQzXS51K5CxUquZaZYpP62qktLxzSyARYCCWZVimlQUGm1ffJryBA@vger.kernel.org
X-Gm-Message-State: AFq9FYLGqDiXC1IKthES+d6AU7cHk4BDBFcfV68HI9rjpaDzy9+zm5Ye
	f1Sb8Fwou8kUXm+OgqoD3GL+UsZE0enuWq+M5inraFDpoam1NwT8B+MSm4npW8eQquYkBRk6jeh
	JOSxYXjjeGBT98wUYzgeEDojDl6Hxhq8f0B/Zwic4YcsRTVOqbpeW9NdBZtz5Dokf
X-Gm-Gg: AYBFou28Z6TjGHqo6kuorW1KxGjtRPDDH3jBM7oUXcN1+drK7mud0jqYO4ajDWCxnk9
	UHtbR6Eskw7plNj/xsEcAUSCnlVRoCR5ts6FCxR35W75Ok/7YcKzm70l4jBW/jWsN0RBgUyWG23
	93LtBjDKwS/2E1m0YMgO8D4YKbFaQX0LNC2rwbV+tufDUf1jNOwuE/I2uc5dk5mYBzaQxsSLj5a
	SFuTmT0FYXKwZBW8ZGKP/RJL1gAzWAcubqNQ5PnygOLCBUPcpFBoaU5tyTxCOHkMOaIZ+sjY1oD
	LZmkLV29XZaOPXgJ5d0vIJmXhtdfXpuBgxMwaf9QJcYaJPwou8XrF1gN/n92lL4K2FrycWrBZ6a
	Z0V6d8qgQLg+pLZt6LKe5zXgDxS/e
X-Received: by 2002:a05:701b:230c:b0:136:c443:80e5 with SMTP id a92af1059eb24-16a586a31b5mr23126195c88.6.1792058183454;
        Thu, 15 Oct 2026 02:56:23 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:136:c443:80e5 with SMTP id a92af1059eb24-16a586a31b5mr23126148c88.6.1792058182858;
        Thu, 15 Oct 2026 02:56:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:22 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:25 +0530
Subject: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=1137;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=xzu473Y7V24ggj3le/TfoZWNsp/SkGbTiLRw8aI+628=;
 b=ObOaLXXfjGaKBaGzk5dvoHlmZEcF7kbr+L5I8bDEc+YKLttWH9KjHTmjJ9jEEInESNrKqR7u8
 zHBiWoG8WH4B3JMd+PazXFt2w88qQYlhWJK5ibhNPVGoUMWrxdw15/G
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a348 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5xU5tZsdfkseTblZoQMA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX6iv29AJvACaN
 72tyYGfa5UDwtq2njlqVo1BwF6btWIyiTfMWrpUXdUqU9rFTcZMk/RiQRoHJMRENPDMHeG/lGRc
 vmdJJy4XOIcbHjyoso10u3mlMDCwSVaVHxI0t5wEYVw0XlY9dbbq6LC+EgF9ju3IDhP10gQjiqc
 GzytCoVSV/CeAspRZbzbawStl5sVTTp7gvHjVbxVUatCwibeilOisiB8Rq89xzfzIv4h8Lho0Sy
 OLyd58qJiwrxHuhpG/peEA4P8EZafjo4irrws1/wh/H/9t1DfYO+LJ4NLsSTmkqbsX+vVyzXlMn
 5wTp1rwdPdadTdBk456kddtw/tF/mzcYAbbc35H9+P40YDQyKQCBoEXo1mBN39+NqWpA0/4BptC
 Nuu3/GfAipRHi8aw0elJ+NYuOmquFRgrv0ILu+NIuscPLIs6O3jtkt6DubDZbaCc+Kf6tglakLn
 Ith8N0p2W+/RIggA0ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX1ddody1RIuCZ
 0E84IbfSDAFKFaGFeaRQptLvLAXqvMa8VVli6yuBMe1hyR7du1I0WNtdCk8bY3HUA+HDDWg3cUg
 OTNZquX6P3EHZALXxLu7eemt+2qP8bA=
X-Proofpoint-GUID: dBTMItmmaBDjQBslPvp1-GUy-Pmulgj0
X-Proofpoint-ORIG-GUID: dBTMItmmaBDjQBslPvp1-GUy-Pmulgj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

To make the MPM design more logical and avoid probe dependencies, the RPM
notification is managed by registering for CPU_PM notifications.

Remove #power-domain-cells property from MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index df4a7181ff80da0b75287bf4b96f82facb152b46..bb30bab28c24c02f4619a4dffd7132973356236c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -234,7 +234,6 @@ cpu_pd3: power-domain-cpu3 {
 
 		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep_apss_off>;
 		};
 	};
@@ -310,7 +309,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1

