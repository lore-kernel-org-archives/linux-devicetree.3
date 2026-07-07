Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2738F93B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415413; cv=none; b=qU/wuhEQf4zce5eu0BwjSH2wIzqpiKrD7UP+UQ0fmjB8V8CYHfa0wWa5HoOhP47SDQKvTO8v4pd8RYu3ONkqAoNR384QOYy0VF7/3oFFl8jwvsCPYIsMIkhr9oqj03GDra2BWJEp3H/4lkEgAvpnyVV9UGJhZZsfY73Ait89cEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415413; c=relaxed/simple;
	bh=pqcZl4dXfI3xeUcINWwsjZ78bDT6nSOItVcnh4qNNIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYhNbEF+xptvlFZ0m3d11TrPjT7qGQjbwF6cHwwfdFobXs13PXyVdiQr5o0lbDhhkUHFJRzHhe+apvJwFQqvFlE4bdOS4f+ywx/8fixI41fAohS0XbZ46SE0bngEbmJl99n1hoy8XS1J5ZhuhlWEcPZam10XRM/Q+5K3l0H5bRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6mu7xrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmNg2tuf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6mu7xrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmNg2tuf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E5CC3184172
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=; b=p6mu7xrSpOVnqEKD
	x+1QKPDsyxlqNxgFWL5b5Ysoqut9dajtbw6tBQytMTmhdo74Gza3NrM48xAwNgxT
	7ZXmyXQ5K+cPLIX1UI9mAX5NJgiBEC0tse/TGsmQUt8t/q2DunqDedhL1dpQJZVQ
	31fru7plv9DHRVbMaf7JEccJ7ZtIAmz5e/nzfxJNMmDj+BcnN445kvVERPuBoKbE
	3Fc/VStikqxouIO0HKzHoRdpJ392lQXypcsxLCSJzo7Z5q5tdKg2bVwnGLT7PG4Y
	pYvy7S7fKi6vd+xi1NqfDywgjewz93Q8fER4p9siJDZiBigW3LHSEC5kFEssBjzi
	W3W3pA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8p5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:10:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847e78d656bso8002813b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415410; x=1784020210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=;
        b=ZmNg2tuftfb1cWPADgOZsYY1PUQxZFJhVZabq7Ripzzjz8j+zNGJkFZnfPD9GiMx2B
         av/gzsU5gGZ4/GKQkOgPMJTSVUkg/Rrt3h4Jt+nX/3drWKC/MjaULIEEFbmfz4s4GsYm
         yEHwkU5wfvMJhWm7w3CkO7ItRQl+bZi3UrQ3y46+pv4z2Tm3B5R0FRaOqEIiJd8iWUYn
         LF5o825tKRRywxCUvYo8xYaskle7U/CF6V2oN+Bfr74Pa4RTaJ/L1BE+vjphjuAGnTwN
         UKQJ3iK0VnkBNLbSAbggfO7ZIkFqSPngri1kymT5J3uXjuo17Jm/ljgvcgd5Q7+Sh/Ha
         NQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415410; x=1784020210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=;
        b=Gir2RgmTBdgcFXAxiKyobmuG/ZbqpcsnU8JJnfFBoFCk7N/SMK0PgwI3WduZqiDyrc
         UXloRdNbHEY/Pw8eSINo7RHFR1ItYKsh5YYAzeeAkg0rltmJmXPLn11GsTuEOjklAEZJ
         5wNtkgAT7z4iPxSQkSZY9I5QqFHvry3LxNohfWgslZ1NKEv0qr+4G+YUTeNirPfbPSRT
         Zb3zH9ZXeU/I/D8BeWil5zOg3HZ11utVhMIWcKhDTdm9J7h9FjevJkJqARB/3cKn7/34
         Y/82S3f/6O9gtb6MIvwrfoqEiz9TjMcIK2f5hXBgr+dj9oXotVPrLtZ85qxPpmD/z2TJ
         r5Fw==
X-Forwarded-Encrypted: i=1; AHgh+RpcXC+UkzbHMElr4ji9zYx1irC55Q23QagBCSCBe5ukNcBlGA8rQnVGbm6DpNcEDfedebW5g53E4+KZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6lrOkkUIed+X2nY8U5jL3Lg96zbzwc90rWqmiaNJdx9Zs1JF
	l3kBCSDjahgemFfDgEZmtFLIO+wl8TCGw67g+kd2pk7w9i/ETMz0/SMXTS1X6ipTjuXBb3nEpxZ
	SZKDkGpbiGY5fx79f5apsvw/aXYNvRfuQnSS+bjf/8uwA/76NdL6X7QXBoSviHBfL
X-Gm-Gg: AfdE7cmmfMM66EKwrNyzRASxQAgfgtN7C88FZCwvjK6g7S7ihxqrPzBM0+IdUoqTdYK
	k4JpZef/5muhQG7HPpty9tNeofBwqHSgH1U/V8lj6qjuGHZ7mBM9PRcHXlcIk9E1q9WyWaN/U3g
	gVNYY5NwPSs56S8wkOrygFJzczr1zhO8plB9qQwDQRtqGIuv57vr8WPd0r+H9adxbxS5bnx4l8a
	8RBB1w/1Ra3IW0hGJU/5Au5WFtTRXNJDsSMvQaVmYN6uFG//Cw82eq7kncTv5UOO6HfJIg9hd0K
	rfGbwsZ4jdLhe6Bi1gyc+mjnp7yqaXnLwYm2bnbHpNtIotuaWGZyLjM4cJcwYIxisqKJso3HXPv
	tyHWh7P3VkwXfHaNhG79zjW/cNvtDGJfhALFLRtVTMAHiSt6/zyZyTsQEZyGhhdyNUPhW5J5Vtw
	==
X-Received: by 2002:a05:6a00:22d6:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84826bd9cd5mr4293111b3a.1.1783415410405;
        Tue, 07 Jul 2026 02:10:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d6:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84826bd9cd5mr4293077b3a.1.1783415409905;
        Tue, 07 Jul 2026 02:10:09 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:10:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:53 +0800
Subject: [PATCH v5 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-5-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415366; l=1695;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=pqcZl4dXfI3xeUcINWwsjZ78bDT6nSOItVcnh4qNNIs=;
 b=5HHJnkm39slqQ9UX2bJHvZpN3UYwa7J3cDec9uIf8brWFiKJYlFxocFnTmcXBeYVowQ/gttRb
 YcS0kEcwribDZi/1DH2EgK2KkuKfaA5wiblQ548vOtqjYaLqsXfCfyl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: EMMZ7mzVv2lC0jHs7D7Gn6VqEhnTBbke
X-Proofpoint-ORIG-GUID: EMMZ7mzVv2lC0jHs7D7Gn6VqEhnTBbke
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cc273 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX7/3I+UASz05s
 S/mSHt6nvJ+riqyxgeuxCf1DTt9Bmk4rOPYe2FQvIdQ0J9IbmCq0LsPzJNw23r2bmzT1okBjp4/
 NTaCbHss6gbUexsbzpB1YqvhJGQZOS+ZJy2GC6Y/DbGlZebEMM2bcKLgoq0AyF2GuqT2LNZfI0l
 P6xWYvEDqVR5/Tgxc2zqTc0ezbRgTXPXPn0LcetZpJzGSk6+d4uxqRKbh7SdxS5bqvSZ4BKyhqC
 T3pKP48AiAsUzKXjOWt3CGyJlY4ocKgwscD/01S+RlJyqiAHN9biX5kxrxx4T5Y5z32SCg1bwr6
 UVlWByizMlYJW9rC0vR8A0UigAnCpBoclDUAov5GW9UANeJYrJTETUTXu8K6gJHKqsHyHfunrZs
 M8yRx3UlAEwO8iM8kaKAEzRZuZ6BeKJYo01N5gi/yweps29btkXSpPIzDNDoTiCwCntbSfDfwNu
 dPLeREjmZTXIqq15f8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX1YI5ErPj8mqb
 JUQnRBPSObmzguWAvfkz9ikxDb+Y1dhe+stTUUWATJyVNkCvESw81LJdh2Y6AdqPW22gvTY9W5v
 3S/UvvTY8knGPltz/hs7/BgCsdjBsyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It is marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never
assigned an ATID. As a result the aggregator has no trace ID and cannot
tag the merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace
from the ATB sources within its subsystem (TPDMs and other ATB masters)
and forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-tnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..0c04dca5e557 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1

