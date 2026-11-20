Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174229;
	b=eJB+LbETIR1TOhOc5/cZBOl15EVq2rr7IKz6vI9FvyYx1MJ11mI0B7JATy+4b9YQ/yNA
	 Z58CpgMmD0er+uluriOioLRTFBqKQ5S/0vcDNkQ42C8YcxL0kfgdibXUcCMh60+d0DqUp
	 yYe2V8EZN3o8wHuC/XQq7xcqlSV9PN+oXqXNaN+rsBiEZXC6Xa5ERjMpfGtVRJYYGGuBG
	 mo0F0JrKpwcASRelCJ1dile0Hx6wShRCeN/tzAZojGmEXWXMJKSPplebJXSEyrYZfHaj3
	 JCQ02tGgYr7/PP8ILeZbb/Jxuj4ciRdegZZndTk9QMeQjWeHPiCJoP3CnR6iifBOalg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sygOK0V8Vg+nVjbZjD5jOaJ4Wu4SYL3cH3HKafImClc=;
	b=fcWlWtH7J/+KimXX25Li/GGML9ykWvvlRihGBASru7SALVwLYlS12vGMBbE9EbKHGCNt
	 Kgr4itQWGtCCZvxV4xynkgcJADW1OTHCLEr5QTprXAS1zFBMBq1MrW5zne5TjJA/M7Qqk
	 qLMPXEsOI4XrGFRD9bntwMpGsKEraXX43g6plOdNwZEzAmkRLpQFCB+1mT+sHVeir5Yze
	 WUX4fzZb7yQKyAi7j/d/HtCEnrJqS2ibV94Rw/xU60kod3mqVjKNUO2gpiB7EaqSRWlQ0
	 NHvBgq4gvGZQMBhEwANch3qZ6iQRfHWGP6Epsv65uvlCqIjGV2quI8eUWqfE4hHpI1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kH7d9WyN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eayJzm/6";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64BA606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64BA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kH7d9WyN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eayJzm/6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkfEi3107604
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sygOK0V8Vg+nVjbZjD5jOaJ4Wu4SYL3cH3HKafImClc=; b=kH7d9WyNV7ikYQ3U
	UZw1dG2n7DD/fTcifeIt9Sgw7yIa0QIDghBW2W3lpb15UDZNHe5bN3N52JGVaK7Z
	scQAFu8d+bewhV42tqiYaIo4kAWfWNYirZLcMSB96+2SNdQ+5JrdCQ+D+GE9uYtc
	LDdDA3IQXW1vExf/31m+T06uQj1fYkF+wtMk36hi+lHRF2P2A2pVlfiQYNjf5Unz
	GXqvtp39DbKgm9I1KvBOE5+pIzIX82r19e8U87MATK/ejV/sAOE6ligskRXBKVqy
	Q3o+j3yPEjMKhRpx9UzKHQJU0JkMVrf+KsxYHhHzFIhrnYcj35nPOO2QYm5IbaqU
	nFeNrQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3ek9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:30:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f04053e460so7267135ad.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795174227; x=1795779027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sygOK0V8Vg+nVjbZjD5jOaJ4Wu4SYL3cH3HKafImClc=;
        b=eayJzm/6VOlgwDR4WGLFs1SuE855+P7Haat5Lh+nVephxop2r+jy0N6jYACaXris0i
         Kbc4zfzArGVmY+8+AHhEZP0rQZ029/Lcmihim8DX+UxQVfq1Q/6ZdH/XReF0oXG+rplJ
         yvBS1q036LTcJ/J8R1VLG5jXVVxwaRucUvVcVJEbP7Pvp2EgmPZYkIUeprVTUxF6mtx4
         MNAMFjyrjbmsvv9knIeHwBPGdh1oPC6Vk5HnCyr33joK3a9IUNa91bAYgZfL9ODvLiz2
         YhpoFyzZ7ef0IIUwvOW3ZZ+uLmrYAwvwisR/fxoT+ng2q78r3SaG8VTlmwqBlibk+v0/
         u07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174227; x=1795779027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sygOK0V8Vg+nVjbZjD5jOaJ4Wu4SYL3cH3HKafImClc=;
        b=FN6+HGgoHrDHxuy19lMYEH8W5zsTJdjavD5N8nEUpFtbekIijC4AJNhMpS3FJr4Amq
         BvEQOrKaSLQuvQtOKW41lSBNISOuO4rKKYC2kxTG1+xuf4PmdKSZtTYTCfXmV+HnOIjE
         OzwbkMvZ3PfVW/2OgvdYmysi0/VQlR2ZKBHJaAcq+EY6j+Nb49qzydvUSP4UEvtP5ZTY
         p2sMwGQvf04+9inUfQZn9G284kUfDjRhuqIlbrch58bzhIbKn5QPXpxRAkbBC3+o/xQN
         8+OwdEwAKT+vlLhmOVcLvHjjOznWZs1KLEoA5ZG0BXLafYEK80oy6aqa9rl1ObHx8jeE
         JbiA==
X-Forwarded-Encrypted: i=1; AL+hErELbjgGNbvOARhk41q5BDkkVyiQX/H0+jFfASFDCzipvWGm5J5Y05vYnTT/A9g+bszHQ8nF9/t5PcXT@vger.kernel.org
X-Gm-Message-State: APuU4Z+T7kXdHFcanpht8kOeAq8TBC+XCcSDIhUy6KHy8vWbfq68L9ZU
	YvFdWcvobO/KJEik0H4tETiMxRleJn2Rtbg0RQjpv9hjzVgNRDTwZ9A6pRp4EoT1R6RIKiiNV/z
	VcLqzAiti/ceLmS/38GMD7eohg6+gOUxUry9Ogzc1SpTmHUz7i8P6ysQPekQx/H7u
X-Gm-Gg: AZFdTZeWNKOcQ4wlbGeNCKoMOxuevIpxxF1UUady0vIIxpr0i3R/0buIFHx/mp2hvZM
	W9XXhqQbNgLqt6LNrL8sbMvbfkcUUS98reJqTLgnrgKXxgv47VFvh1JWmeGtXT+eaNeHI7xXguk
	+rXXCCqXpVCfebgcTYoKHyX7S36w6E0TmApe2zzHZnkHC+pTCWk74jjTH64pisgq0fW8c0ligOD
	C5mZFn2AluTjCNzXceaLo3ioEVtnsqPfT6/w5HLYiBy+TrMC8VNwZoy6EWGAJLn7dyiCjHnXJ/E
	JaGTWp2rRSLeE6tqBSJgHBzQA956iLHRDEfDZ1d7F3/azlz4jI5qydQuMxd5cgC8c92mk4Bbln6
	N2dHXFdCbvs6Uf634AignRWLWwrenqCDlvZw1sZAFBqVED/xLCEAziZS/q7TaqDqHxRlMfg1wA3
	I6zA0IOuw=
X-Received: by 2002:a17:903:2283:b0:2e2:f2f9:b1ef with SMTP id d9443c01a7336-2f03f1b9a56mr32036965ad.39.1795174226685;
        Fri, 20 Nov 2026 03:30:26 -0800 (PST)
X-Received: by 2002:a17:903:2283:b0:2e2:f2f9:b1ef with SMTP id d9443c01a7336-2f03f1b9a56mr32036575ad.39.1795174226220;
        Fri, 20 Nov 2026 03:30:26 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm2751245ad.19.2026.11.20.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:30:25 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:59:53 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
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
Message-Id: <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
References: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
In-Reply-To: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfX0jl8GoL8hISd
 CQM7Xe+82sgAGVYtMCPR0I4STxnXhsFnwnKFnSl6tHCcAakvj4bV1+6ZvTEPq5ilyQlglaDAXxA
 INvcysKfLjgR4Jk6ueR//MOfLgIZQ2CgV6eKOuwe9EpADe+NPwOLMHDuLEF8KXoOEe+DPgTsPd2
 F7fHZXhGnDRpzeYg+ZynEDslFYsfcaoK6jy4bzfd5aF74BlE7vBsWbz2wMqtZNgX2+K/r8tmmO5
 8Kdxl1bfsSea1wnJYwU468LYRyMcFcOGHiyb/c1GxmfCyt/n+3agTdMHPubnG3vJCF0VucaUxwt
 zPc4uD7kN4tHBZSDuXydFgVnXL/m5ysfLYfAtZszMrI7k6IoWjsVykBKzjj8zevpTXuN0YM5YW7
 hfScM5QHW2nrZr8ukWjewtvVnM1SVUCYrjTJo5v52vUgG8n9C1F5bWR2dtTYuJNPFxOGKlsCp9h
 OqrpTCFP+K4nDorOFRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfX+b1gbTh+SH1N
 vGaCKeQauVWe7JAqkez5YkMdvx7hBFzWyV4ebEJpBg1GC6kegIVhfbM0hD7Z1kEz0hQLmo4UDBX
 cRDj7GxSlATo4cxkzDKEOkx7TaeX0KI=
X-Proofpoint-ORIG-GUID: rh36SDUNLSdZ_oD4Ogzptnmz2muwMvPY
X-Proofpoint-GUID: rh36SDUNLSdZ_oD4Ogzptnmz2muwMvPY
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002f53 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nsAWE0-7qdAvx2JcIW4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200045

Shikra QCE requires an explicit core clock, which is missing from the
current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
and specify core clock to match updated binding description.

Cryptobam is controlled remotely and its clocks are therefore managed by
remote crypto subsystem.

Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..bb9ef1dcd686 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1208,7 +1208,7 @@ cryptobam: dma-controller@1b04000 {
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1222,6 +1222,8 @@ crypto: crypto@1b3a000 {
 			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
 					 &mc_virt SLAVE_EBI_CH0 0>;
 			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

