Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED10B3F39FA
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815834; cv=none; b=la1mnsyE1SV2HJK6NwYw391fTfo4NX4mqo3sIQ1tcnLgVwLsFiJQk5HXy6R2ipqzrFIzNj/wL8IDLz9SEKZC4VIld3h22scO+MSsJAaba055Pq7f2Jz0iX+GqTFb5LHxQkObvVPlVb869dZC63BvHSNnwkLfOQF6dbNn4mBls9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815834; c=relaxed/simple;
	bh=HagOjHvvKalPyaoRLhnwxbxe/eeYB5Wc6HvJnYKVRFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLOH/aGvO9g00QuwCmMgl392KYbcXreS/tZkx8xpdA63XiOD0hiBVhihuh8PlqZhOS5RZKOXzFKX2pR9N7+ZQ+VtwV5oNNOt4GvRBxNFEIb6gmby7UmfrqdQIeXZt5DudRp3jkkvwDOduPwfolq7LP8uiFuPkW/VVCg9jKmFFYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HI8EC6H0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmQGuCsr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HI8EC6H0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmQGuCsr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9musB1522302
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=; b=HI8EC6H0H03YFrdR
	YqFGi1tdZcXtXs0xVQJn1RZt/pZmxE6Iww3lZrn+d94j6JwVt6F3Rq1tHNn7+jOW
	zuuiisgVqI74vBjjgHHgB8YBqX4Ad1mYDSKw456FetKf3s+58QH1/5FZrvEUXWXU
	SMta47BXz7nXqwWiGokJXlHf71tqXPoCFhrQn1ZjwB8Kej7QqbS2qAtz8gmpiZ9+
	FaHAB7BF0PT4sAKDC4sTBJZ87jhmyGtbHBqt5gVOffY09vIp6XZPWrsekV36PoWR
	Hr3PiE9/1r69VKVq5RrxU84lojDv26Pu2l7ahIOXN0LDkiRdCknZD55wV3lgwZ1r
	y61MUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw92v95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:37:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478e9c4bd2so1415138b3a.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815831; x=1783420631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=;
        b=KmQGuCsrHP7GQOTCmcFxpb6GJANOFMOzUXRC2p0Tqv2g9tf4/YUsCDiulOqzUfBfLz
         OzfgdbUA3+VlBAlb+FMoDE2Qw23x4TgKdJjQ2BUp0f16oK1i7DhvRnnbWeCOVspRbghf
         1C/JOVgJXQS2YNF5rcygjYl8svr0ymF7gs1T61a9odnVjYcnT1DznIlPvtijoGkxW3Yb
         0RM9frzKUjD/v8dcWyM65sk4ws+a9OzSx+tTZvibIBtSALdOLBVfZJqCfclrS9aAjCZz
         vwjHdH+2OquKsNuHdWzcJQE6Rh3T4wrqiqzFjztbbguvHST9i1NvTcW4iujqMGUFTKPp
         f6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815831; x=1783420631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=;
        b=YT+37EHsIWvh91Oolq+yZ9W5sir4wmBJqCVAC8FthU+OCGEUdfdvnlgVE063YyVb0s
         rKU27dGJrLx1EznBAxwGdd7318vQUZ9dp6woFe3L6wjKMC2FBog8nZBSvVgGBtr74GdG
         6r1lhsLYP1dE6GLITDLWKZ6gb/UMn/AYez/AYIqhcBB591L0WengJHasqaAYaprxtA1d
         PbtQvMtc9Zhp5nn+HL2EXSoluDE0VyIcUriwtykav/Bvy4xYzqCOZ8YCZlJEGfBuPjtF
         dU/F1I28r6bgJ25zhDzCTk69o/Xy9+jyOD1s07psrNWFogS6nrO3vmZWBdm7Zt/b2SvS
         nbig==
X-Forwarded-Encrypted: i=1; AHgh+RohbFYZK0i4dTd48AJb0OY2FWpBX+PFW8L8WQQOISLE2c5Q4AZjEk3M9fivGIsXU/vyWD4VFHVkCu97@vger.kernel.org
X-Gm-Message-State: AOJu0YxDj4IUQhjXr2h+nb0cCu+gmBj8BEWE3jLmwf9c8ZvdELXP+QEw
	M0bePxZeEFJtHcmGoL31LSeDZenDTIxdS+4eT8TI/0n0K9hJcdG8TnNTyiDaqLAiUseS2+P9mFh
	i52DZnzOkOH6PkWTZmQmpiWwI5uKtDNo0ASd3gjQ6TogR+JWmHPsTU5Kzr3BCkfSm
X-Gm-Gg: AfdE7cmr/YlkAcIX3PksFvk+urZzbMcDYptkd0J2+teFzyqY+CcqQtYNnzCeYZ6aJxq
	0+RVpFyto69DtxPkJtc+cVnpQKjBAnTfdqBnQal0vNfI4tiEHUcF0UmFVPCp98gJ7UZZLW6Z2jn
	iFnP4Fr+ZZR2YZkROh7fS2t5pXv9fZP0NcsswbL6WaM9sitQsaB/yDopHdGyCA681zNcqs3Uvut
	dlEWBFRTPS3mCn3OjXTzclM1KsXtTIU/urE88wMBd8pFixjQkUjM4kVn1eW+tTMLT91qtaziX9h
	kJ44TsNYC+QT1g6EtGeml0usbstQuHI+3bYTkltkI/ZoZykOApBbTqZaZVpMLNVOWcgkXe4c5qz
	FnhoegjmbeM6zsjPxPMhhkC5iH6VoxEMD3AWPCPRFwGfW68Eo6L57KScwvz2nk8+3QBTCJUWH9g
	==
X-Received: by 2002:a05:6a00:1253:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-8479f27a8d4mr2349396b3a.52.1782815830837;
        Tue, 30 Jun 2026 03:37:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1253:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-8479f27a8d4mr2349370b3a.52.1782815830384;
        Tue, 30 Jun 2026 03:37:10 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:05 +0800
Subject: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=1214;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=HagOjHvvKalPyaoRLhnwxbxe/eeYB5Wc6HvJnYKVRFQ=;
 b=4lZF37zPda1yimqyZLnf7/5YnIJaYzVw6x5TTSBnASYMyAeufNJcTbfRuB0rbMFy0xiaCqNVX
 eJO8CBg95lIDb+wy49Iz61s7gYwDsyG0IxF5ZBSDEd/UMSltfv5+3YJ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXxZGx91fNFxym
 F7xNlbD4lgUnjfBTpmD5Emp3DzVmFWprYoE2HwziDhqu052bc215suMNsG5Ns9menYoYFoIFVND
 7J+2otbiGwc/Y98bmnBuInAu3kUszdI=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a439c57 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9-n9NCBYjeJb_QXN7LkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: oDORYMzB2iNMN4mdU_f7jip7ZslhUquK
X-Proofpoint-ORIG-GUID: oDORYMzB2iNMN4mdU_f7jip7ZslhUquK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXxj1SiXq2xWTo
 jNb0z49wK2iFn6MKiIVy2zBsS7jQF3AsitNzqfXHFztSmH9+jpHtXumvXMBk40ABjRzEHVidJxD
 sG5tB2p6LaOqtr9PxOs/dcI4r5XabecO/1HYU3pM1CLT59L8EID9tDgaGrC8baHAWGBNPrUcTCR
 Ws6k/hzad5m+ImVnoGdGy+vBiAQuXQ5gQOCo4k8ocoWG8rFkKNCjn6Tb1OXfqUawf8xGSYcZVTo
 Pw28GbSua9MNzZ6xU7aWVqJBd4wYBUs+kHHopcLFeBWWamVaN7PmRClg0gGGsZHl96145VOYUCs
 a0Fd5hOA1B0+J1/5uwaF0tzGl+uRBMT89uKT6bx4ztPhu4klNiip42zRCgOR9L9+s60aLmM3RFe
 u7NMbSt95L2Pgx6F6njSjIOXtswDY69NzB0y6ep5rLOoXvS6/kPskxhJL0uDCHNTtr0431bmdgz
 +vWt5+kZKaRYoKGcctA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. The AMBA peripheral
ID probing fails on this platform, so the device never probes.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
Dropping "arm,primecell" makes the device probe through the platform
driver instead of the AMBA bus, which resolves the probe failure while
keeping it an Aggregator TNOC that retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..e98f4aa4b141 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

