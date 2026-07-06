Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB0E44213F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333122; cv=none; b=JDcHxmEW/uD3IhEE0rbGB7JRxp57aRtPQ5sqHO4/6iSjf3HwvtuGXz0M3kjwwy1aAWfd7atwgndAdZDaCnPKX888dQ0ZYkA4lDtBl4zaOppV+Opvvg3m9a6rW7f+nlFSt4Yz+rUBVWnUhRvUyPLJqvQOjzxcnDcRkCXU13OUymc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333122; c=relaxed/simple;
	bh=HkD08gDczvf+no+NYEocgk7WQMaRPmHKbsABTJviDgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qk++8n36PjsGW7m/gfA4qfV0c54c7atXHRMkEKas9ktqAvwkxi72wniXt5heztnHjHAb4ZdlnqWzOU4MqH/BRXn6eKUx9DHV4km+MmeHMA5oAIki6CTld1y7In0ylWKzidxsRgGiEYoKC6vgnWvSQLr+4W6Ow0EO5AbM19AY+fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HaBeTuGn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6Q87ca2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HaBeTuGn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6Q87ca2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669GsDd160050
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pg
	d9R33Ma4=; b=HaBeTuGnCY1aCwaAngzrrj6akDUHI7RDfXUgIo+Ygu+Vs02MZdj
	JYSbxv3RoWGBjy+ye68QxKvuvo8XsTttFwaOPM5GYVfttnt3T69oyZZE/LcM2fMO
	6/iG35eMA3ZsQgV3JAs5UQM1Fl7p7FBCmtURTTYCtZjpkqodccGJP4uB/njoPMwv
	WqNO6YN+NrPenzasLLz8xrQbWGAFxBPaGqt+uKE3tkWhX8JvI1yZtNdeU7g83BUB
	Hr3BMGP+vMvT6L7OvwKf3RepfuKCB+mSZw0CfY1vSlscG003lHUZCnEA5sRmxnOY
	f9GGW96Xt39MjdAm0VnU/eYHiO+G9OwstmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr81r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:18:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e56b2b350so587092285a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333120; x=1783937920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pgd9R33Ma4=;
        b=R6Q87ca20k/ikhpz+LAW0sE6ffURH264b6not3YASiMDNT3VQ9mQF3ORzxosdcJ5R6
         VnlaPnUiQDvV9U3Amn3dN12Rvvt6N4gDFtCj08rCBysH1Olvcztcv+EK60UlcMOITGdX
         EgquWGH6kd21hzQ6hkjc0IzoKNPAECA2faZQWRTJvXHy7eOPu+NvQxQCHwmvYfw6nUEu
         2faRyhjSJttXbfvIlBkPMCb/OG6KviU18jmh1Hkxe0YavAk2RIx2Mb1ZB6tY3yjqN6/7
         DkM/AFZNmyyS+SiTRbrAwp4bJ+QAz21E4neTquAQOQud7Vxty3LQukBF84K8+yFzKVJX
         Vllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333120; x=1783937920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pgd9R33Ma4=;
        b=Ik/JgrffCFRSD/LyTr4q63PMYDP1skib/yyDv4WiLlQsSAJvk+WF+e99yBGsIxmzyG
         o/np9U6Xz9yuW5SebcurXdpU5mOxmhEDEOjr39CX0JbFcOFkdT6K/jhnADkGgGBKsPvk
         fKtaTVvUq6GrW6cbR/k+N7XkrJNHwXxSnIbSSda8RfRQsMp/ANTbOymE+w+r8yuU4b38
         2Hd1lktN3x5WE2H5W1ELOvpnsl+DJvlbuUMX2i4u7+Tx5R/Tcm5VV+E+oynvhcANi7a+
         k9AKVR5Lm4J3Q2KsVFFiCfcIXNNgamfq+5diwcG0aJH6dm1ezNAAcBwnrD7gLDjBheQL
         Bixg==
X-Forwarded-Encrypted: i=1; AHgh+RqtGNCJzCoek9rIv8kFVeNlWBPbw4qOaZSUJtu8wKgi1CXg7srHYbOIjR78hY6D/Zw5k6gOJ3YZFb+t@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGf5OVVpcAhwDwgpYWDy+x4WUYrixlKscWQMWokDU7sNTftwG
	48cvziuR/5yU7ajc26PzYDHqfJ6nFK/pqNovG3kgkYyInM2V1PC3UPdmCo0VElfbzBFgoEB8smr
	oiHZ9LU8nkwnNrzmE7/6ZZlkT80sreSmif0D2jQlOq+dbbj18p/R9skpOXwyLJVLs
X-Gm-Gg: AfdE7clTaFCQDgWfqwvlU+2ylKnBCkFDuBwrWxdMtSjbZ9F1Tdyh9pkfNSGrVfPLjiO
	ZvUnHUk3FrjfKJZUCSBpa0NjOFZ6ilQ6Gy4SZMCrxsxPyp5BHF+5xk7pmlw3tFMusDdgM4xMdyj
	5M81uD8hiTTFk3XpJXRVqBWJ86bgRGmYlD5SYG3y/KB1IEqifJDb6gt8nby8L7tEQsYGVhhdmHb
	8X3KrEUN85tEJNf9RP+osSYCSUu+KwPL4uzI874DqY9PDXErqQOMsErmSWpebarQuZ+sHPBkcK9
	VW1gUzmq2h+kuMIyP1INYDLKo9H8psxzX+2PeCDAGJx7Oo25jhsF8WMwOaemrj1qZHzbHgTOpcU
	gaV2g0Ry7ddnfY/vvcTiw99lvOH0=
X-Received: by 2002:a05:620a:2990:b0:925:4309:dd18 with SMTP id af79cd13be357-92e9a2f7607mr1265455085a.1.1783333120011;
        Mon, 06 Jul 2026 03:18:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2990:b0:925:4309:dd18 with SMTP id af79cd13be357-92e9a2f7607mr1265450785a.1.1783333119500;
        Mon, 06 Jul 2026 03:18:39 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce0a7cfsm270839395e9.9.2026.07.06.03.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: nxp: ls: Correct indentation
Date: Mon,  6 Jul 2026 12:18:35 +0200
Message-ID: <20260706101834.341292-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=HkD08gDczvf+no+NYEocgk7WQMaRPmHKbsABTJviDgY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4D6ulvmFdrQv8Oykl6GSSQk/2Yx5hWH/zH3X
 bJM2t/wZ4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA+gAKCRDBN2bmhouD
 12FvD/9FG/s0ZGefd2tEFba6XCFX5ChHG5e7CwFpttWWJ5kNGHtxLBn0ZdhaLWSeg0Atp+wxqPa
 2M0nBhnLP4me8NGyH1lt1U9Yu89XOcAT8aeTCj95zzhkBsFPzYkngxPGq+hSux5B5tVg+FwNvUl
 5H0jBCwVz/nJdRzc1vJr+TBqL14nKWx8yXR4JmWdf3hAjCAIaNY509WlSZ0EuqUWF1oUyWGGsMu
 PNHGhdBki49x2TVVwQzB6K6AW68NBWWnaKcdiZ1UJ17CNxirXbg1Dk0G2nVv3rqPTnFtAo/jWUZ
 LFCkQwZXcR5EyvPorgoalP52w3h0EwqxVh6qEHAj6scDMkzuaYIou3gehBMBVzFGEq+PrCcbBLL
 gZnAOIs/aRifecbuifzUTbzPsBt2rS4qZukz54TGyCFojhKzsWr7Vz+4jVztGyqCrPc9WUOcziw
 g0w2uj1GQcOaMuCO49ngGsf+utm+U7rnps+Nl3V19KhX1EHtCukJ1eN1k4TA5gihM7p/jXXpOoG
 CTYbIVx1SgQBPgb6yjUql17jzC2MtLIT5O1IibjbJwyfz1v2CaDj3p34RCnVLW9T1QROKB1YqvJ
 v7lUPsH5QRaZyhJCI40mHLSxLM9JEGvd+YcKOvvxCmJdcMmbdkWzWr9kOaqFHwbrIXsDm0riXI2 3ATQjFiBCXwB3yQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kQOnYwvXReZD5MitoraDao4N6yHWvTb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX/QA5d73SA/DD
 0YhI+NCvdSlnYXihv0wJ9z7Rn/EShTRhDxCV5pBOLDG0by2scJlIauSSPUVEqd76ef6ZNOAKmzj
 CXUSoruCTDoaWOFKjhv9gKGEXd/clRvbDDLWtYIEBRkv2ZFCPXSvTcS1cj0mYer+JNa+LcNSKva
 KQFa9D85oIKUfFrOReF+i2j2zxGViWgPIE6nCirQeuMu8AEsKGUT+WDim5Xn1b/R/C7jBiMky18
 YCdGClcnSKeoK9YhZdF5H9Xm0vR4yggWz/v9Q17xeKkGXV/kL2GYFy7vFVC+FQDcyAHfoxA6DCi
 230YwO3UxMzmK/R7Z0ad+R4UKjKBowmPtvBBVPWA6pP2hgr9Ad7jG1dSplhHeEEBzOnKLpPZMyC
 E4lzN7HDw2DXwug8e81sIoPBb7iSav5OoQli64BGEnA2cT0Sv+sxNJdV0XFANi1TQK5XLssp06H
 rhAfbN7wcF+ub/lfb2Q==
X-Proofpoint-ORIG-GUID: kQOnYwvXReZD5MitoraDao4N6yHWvTb3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX/2Frnfgu8E+M
 RUVm8alOzIW7gVbl4yjCc00hLPMatRczfQ7Sm86jAdECLVah2MxII8OpbavznmDEEUq5U5ANp77
 bGVCxOMLRPLx8fkYne8pkS037GjbzYA=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b8100 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tLFoKwMCRvoQtr3NvW8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
index 38281b904301..7341945de3ce 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
@@ -190,7 +190,7 @@ tbi1: tbi-phy@1f {
 };
 
 &esdhc {
-        status = "okay";
+	status = "okay";
 };
 
 &qspi {
-- 
2.53.0

