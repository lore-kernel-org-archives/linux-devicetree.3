Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A2E38D01E
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815847; cv=none; b=B/a6xKBTa5qNfQ5SMIIOLBpdAl8//HBJXUvSKMtXcN6rboKq/g15wqwHaCijHn5Ctr+vvvTdhE4mW7f9/LHG1irgBkRGKos4tuLuPwhgr6zPoSwolLMQVpRicIp4BcA0OsYfkGJp78cNJN3Wq8RxfkiFgIQ+pBr7+sWa4Vr8bK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815847; c=relaxed/simple;
	bh=Gj+QP/Y+EYnERLfloVRJXFv0oSQBA7CdNBDXvdCgv68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jTrnCOfNnwssLHA7NYQMkORnfnEmyLyrW6S/nZyhLU9WCVbOyNnm01Q0cluCA0Fr7TqmHaog5upD/Jj2hZiiz5Cl/R1cemfazPT+QitvHk6DWJAmQSkjgKIhiIr3jVzfjQxkBEQfhkHUL6fBIlma+xk1DSa6DhQ6Hxe6qbRuCns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gx/Ky3C+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9ECIpWZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gx/Ky3C+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9ECIpWZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtIv1522275
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=; b=gx/Ky3C+59pYv6vd
	KlvmxRGsBHGReYGSnPrO3NgKcag5IN/KSSyuNPvqO8VEcj/dx0DCDX0MwlLk2JUp
	LTj5mPRKuqm0cFrHM0+EcmM7gJ2SzipiNc+nsEqONq1clDa9BSbLg6fD3dqbOdKB
	VStcNcKSfjJlECppiIixEfoM3T8awrHkfBqMDsLsikHtOTntBSLBme2ynMRA0JPB
	W86tcxWXlVBuiIJ9B1Vz1ERho36PVyJ6klxQ/PTNZWym1l+YG8qB5CFAABA5cij7
	jrrVua9AX4TFJOaf+a7w9YFt1+kyOd71DnG2JwqaJlTyRovDAKxvHMnFiYizUHSK
	7pprYA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw92v9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:37:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso2254699a12.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815843; x=1783420643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=;
        b=I9ECIpWZeLXKetFPHUH7nAkHT/pTszoSzfqeyF2NsgxCdW4GhwKqzCYpK2d3SUbjX+
         hqVYMzBEiNSOxD02pXnIWhJ/V2TxmmzV8KcvKvtuqd5te+M1O4dNUgs/a5T30lo7KEuj
         cQjqAgj30460xG3dyqN5b3YK2j41AUDYWLXN5OD5wm81WPtDII95ILkREW+GbT8JCbKb
         n8hMjcubliBlnxhN54X3g7Z0Rpahk3KRYgnCvS4Sqk+VWVykrASfkIZEmWh2jkO2MI/o
         4dt9n3NJyjZdgyj/KcL5zq8CpZBQPv2XSQjkE24YoTkVEEJWnE3aP8XUImGE2O1VGsOa
         lHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815843; x=1783420643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=;
        b=DEq5kz8bOwYwG49xfrwPmrENM9IK/qR3h02xvkenG09+VRn7p1BslepA666MK5pZ6N
         QgxXYGqGRrpCECoTVGB75P9MXpYbNJj84mPqSjgI/ze3ft6Hjr2cnJqgBzH4OJU8hPQT
         e7AkLH6AT2a9t8ZqZtKYAAF3e2GmGOEdKM15bIxK62VwN9MGTb32AeH7aPfb+oi9S9y6
         SFvoVYmB79hU1kYowuzI+yjEISBlXsbsS8ipYlFplzMyI77l6T375kaWh1VRqXTh47V3
         Fu86YzWu0G8znZP/x/bYPfKNaYPRaiGGU8ufgM9lkosVDzBna7LXBPMYjs7+dMIjBEs0
         u1gg==
X-Forwarded-Encrypted: i=1; AHgh+RqLUJcUL+yTbbVuN/jTRZuU1xkKiVD2qMi7rPXO74lnEkoM1iadgq1jRegwERxZjnFJtAJies+Uzn+B@vger.kernel.org
X-Gm-Message-State: AOJu0YxsEKOX0+ZK+xLhUnhQTGxOFFFHRmb5RCShTjxSu75UYSHdryVi
	YEpFNKn7XE1gYA4IiR/ehCSiMTRtgTsefwEuTb+Ip2rQIMn2cSyeYoq0SrC15IVv+eqXD9m4a/6
	IrQMh9wact8VOlRVQodzf1htwAXL1I8vkvRLSbLxi+Dts3pPOd/vCRUks2qurvAin
X-Gm-Gg: AfdE7cmEt8Tn0zcrz3F94PXYOX9tzUNesVNMz0hBfAg4ZUIBCLah03WalQFkEqLHzrv
	wKVPS5RF65INSVXBFuOu1UY2QSbLB7x12ocnZbkb1C2khje3isXumeV9SdY5MWz25waSAjmOkBE
	4JyUJmncTjxzCqahZ3XX2fkMIkWPgbySlqvbFpdvQzgbRNBopXCUXqRIAaKMEm40CyKpZYDJJF4
	D/FU3OpTUygKagHVRwxReZDqwG+Yz1gkGVJza8o8mNZKMLkYWtAOL+uDtt3E42V1b5eL51Z414A
	Iyy827P+Fd5YpZpisMoxYJg109FbyoQYr0odCXrm2zSfsWSqFN96e4GoY82Sk/WcOe48L5K648s
	razc97Ib6dHRP3gTOkkmQERmDeWpoSZ0/gHZkjRLCjH2eWYoUyLzSjFHtXOMbK8vOxEG4XeuQpg
	==
X-Received: by 2002:a05:6a00:b704:b0:847:8250:2b31 with SMTP id d2e1a72fcca58-847ade9a863mr115697b3a.38.1782815843426;
        Tue, 30 Jun 2026 03:37:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:b704:b0:847:8250:2b31 with SMTP id d2e1a72fcca58-847ade9a863mr115678b3a.38.1782815842978;
        Tue, 30 Jun 2026 03:37:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:22 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:07 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-5-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815805; l=1402;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Gj+QP/Y+EYnERLfloVRJXFv0oSQBA7CdNBDXvdCgv68=;
 b=DIbkhStmFLQL7Dx0uh3VirHk2i+SsbjV8u/lv+oehetGMD3x8pVTZJS6gL49TUp6JC8BRiqf0
 i0ud/ic1AdNAvchGmJpp/v7Q0iZOrobGpQLhjHG+XcYb405dYuaFMXZ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXwItzlfhezHbx
 RiSLl2JfmePp6PzUjjZiPKUMn0xUm7wBylmL0krZyjiJTBgZinxXNJqVzuTakXUyDwpKJpAT02s
 Eh+IUPKivpC1+jLn71yOh12/A5eWeI4=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a439c64 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aFoPaBnoHS3gmuyVzGwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: sbHKUJ8FjQ5K_PON0Gn7ciSHFkpcx48B
X-Proofpoint-ORIG-GUID: sbHKUJ8FjQ5K_PON0Gn7ciSHFkpcx48B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX6LQDZDqwXV/x
 CbjdZK4CYIshVgA7XLC8TgqN0771YsI4RExyRCN+hA4U1YHAHsL0JVSHANLmGc+GyPQ3/NzSm1M
 gmn2BLLAwOKXgXB8cilcEELSX6Sblf1deJrdAMVV+DLjP/sKBlX37SecYL7HBACb1leYZLXrKlW
 1jc8EtP6MdrRQk5XlkVJOSPzotNPwt3nMWbrgpHbWa/t2R7HWSUaRqz5j217YvgQsbp12T+oXTg
 VKRDWd0JNWRjBFrj6FS2ywHGCRk0ghZsDTpWPeRY2ceG+kGqffkoKv1KtoDNfClPwXssDvje6TP
 4K3vTl+4YtPwPIn9U9FeUCC2OarVlDhfBoKVcchW6jMvXWwLO/rKUViT3L1jEeSqnnZH+HXnTCA
 z3CHdoOQQulzTD9K30gbUoZ8VwuUUzv/7AnVV/S8yzEQKyBR30tYbOqOnquueJvjppG4MBPXtTl
 b2a3JwzoIfkjWq6l8Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095

The traceNoC node used the "qcom,coresight-itnoc" compatible, which
describes an Interconnect TNOC. That device has no aggregation and no
ATID functionality, so the driver marks its trace ID as unsupported.
This node is actually an Aggregator TNOC, as shown by its tn_ag_*
endpoints, and should expose a system trace ID.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible so
it probes as an Aggregator TNOC and allocates a system trace ID. Rename
the node to "tn" and use the "apb_pclk" clock name as required by the
Aggregator TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..d612e8ed54c8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1

