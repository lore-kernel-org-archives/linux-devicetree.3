Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20821CC5C
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651230; cv=none; b=KWx4Kd4+KzKubb6Way/Totiiu3spKIG1GWAdGJ2tiQUeb/8UccY+a6wql861jgJQsyjlnU5ZZUmKvr4dJhj6YjQSbcysl1KGDnYNBX9InBtAiO0OrGSdhn2xgz8fBRe/GSuSXWE6Iewegv8kSv3Oj1nv11t40jbnwd0z9RMc8S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651230; c=relaxed/simple;
	bh=6SxIbCzVB43Q5gQOLOs5yrmATRLuGa4fNKmIn7mrhsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmMglF4G8Ll8Fg1a0G7t/kApM/qOGGCJd52hM8kgW1BW5OD5KglxZXU15Up28gsgSgfRrs3ZWbaSXDGNp94KG8D5D/8+fKXhmPivG2XdJB5kzDTWd0IAYCvNI3nqM/eh3dQdQcxQv2VCbXhpGKszzg76CDJ4x43fm7VXgFVYLcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzGFM3fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXZZ8zkx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzGFM3fh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JXZZ8zkx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HYUbS2331635
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=; b=kzGFM3fhaAn6jTjX
	53uhY/ZgHBfQh6PzZV2cU/6cRJV/qV0eow2t+6nK325ahKFczpnL+7NgJLyWRD7j
	76/EgfB/+ZeR7TPfFy9SgPE9JdcTqaafLAO0qlY2ekQ7xLwU2YX5HByCQlvOdvd1
	8zVPImqgJ1jb9z8Iw/pu3pENbNhMwQyXi+c6JHc8vaI3jLaRQKosK3S4Pjii0fWZ
	xNkpQueE3f5czDJMYPyROHy0mwYNJj5KmEWl0lV9i3TUhXDMyg7CLvsIGPWs4BnV
	1CgmquQBY6DyhYTJfF/xy8/FJzWbVK1SCXe+jlJhTAcm7nV4waKMqGeQWSCec+Kz
	4SXFBg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24t544-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848551b54f5so765286b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 19:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651227; x=1784256027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=;
        b=JXZZ8zkx5YXX3yiGY3C98pLMjJRlYnDKQNY70dYn8TCUPmAHVYWMpm6Vfl2mZ5CoWD
         oTGLEQUaBLZCPBHGgTcl6xMsvxY7H/UVmreC387W/m8cUItHoD91s9wDyrgFdhykGn3B
         f1llsNY9EluVD5oBgXEsJfqXfyuJiwtiRBsMCKTByZN/2fOlRX/WIGl4zNbHU0xZkKxf
         8C4+9Fro/r/Z4JAElopH6RqI51t8USRD0uuJqMMKlDqCKFpCEt0uU+KP2JHCbQcbuwsX
         67AY2VSeT9mzw5FUdcbLy1uJh5ZJQtIcKMgLfZaMU7H77GVSxlc2o0RNUUA7hXE15mlG
         d99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651227; x=1784256027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=;
        b=ODRSbV5HsthJlouBI8ubtjwBasiHaKeQyfTKYOf5+8SGcqj8PmmjrJj1Kr2BgVV2WD
         F6Pr9ZuhO/EryhoOT2Ya27gFFO02Tkf39azQv6K+c64J7w85m5FQO30hqfq2sxH9TCjn
         FQAU5tkgNq22DajxIjFs4Ulk/t8FBMmLQf0RvNGNLcEXqAFk/ZbzcCNN+K9ff2bwhUp/
         geRbuASdhduCrXtsvsEJeIykD//Bi9knzoK0JMjbgrwwwSNku7h87lES0iRXljbGt/tF
         vHBX7T2yRyRKRrl56vF6c8OfIjdLf8qmSbbCNPuVUfo8lL4MhBk/1B4/6eoedzxkQEsz
         GbTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmtqShOojQdLqc5FV9UjsZ6YQJdU8DkjheIsWyTenJe/U5XfHlf64IMm0MmaCdCbGjLvCXjhZr1wnQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqRKE/FsgsXxjaNuR5OIxixm0K3Qm3ewo/xw5EJDaDljUGwJ8
	yt6KPVkh9a9X7TTd+mGeigK8CPM4B9kP7EGAKzm9PNrnez2J9135gDVfHlgxokAPBpjSputOFoG
	1hy5Tj3/ACvz7MfvQ8vp+DUJDeRFUytTHkBp6kXMX7cRuVNQkYfCdrTWPXMa/MDzy
X-Gm-Gg: AfdE7cke1cS1YehDDhSPUCrUGDlfx9RuBzneU9LwGVN0qyYwY55TGg2XnbYCvuFAbV0
	rB0unqT2eyQemQFPI9I6LNvVuGejxbd4gXTUw2jrAeeaZfBw1Sr5E3D8ZC15/fN1pQJ37n8+/YC
	5MliL+K6XRs3HUwsZALdYFdv2OgHbgUdcC+XKwfS7daadNktc1IXWkJlPB2p5o3scV+hYGND7vE
	SEsEdnwAkVbCV6vN4aTxPiGY5FX/HOQ1vTJirsyzJI2jwAA8vSZLS9hynnpr7MiqYsTZ3YpONko
	hLdla1dJi01H6eeUPeXTTUdVCLqY6v/G4PbZ2ReOf1aoELCGExoo1CajPM/F4Oft97Eq28lFZWE
	tKqfKX6+HSzoNYcLkOA+VL6mZSzL4Ynf1zprUJ424FFDGzSlP4We4w3eRIzt7UTZyGhO2z8B8uQ
	==
X-Received: by 2002:a05:6a00:8c8:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-84842e8f2b6mr8945863b3a.0.1783651227039;
        Thu, 09 Jul 2026 19:40:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c8:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-84842e8f2b6mr8945831b3a.0.1783651226566;
        Thu, 09 Jul 2026 19:40:26 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:26 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:04 +0800
Subject: [PATCH v6 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-5-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1699;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=6SxIbCzVB43Q5gQOLOs5yrmATRLuGa4fNKmIn7mrhsg=;
 b=dbHuilsW4KxM+/xj3xUsen5J+9wy2lfD6bFh1ZEENRS60E3sUsXMnDUWzpcow2ZRroA77ut4o
 rtUALoX0HXrCQjChr6r9g53qvCpL4ZowiOj+mgLseTGDwJJ9VRM3f2S
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: i12GMXjYLot02AgJaDN4FYd3H6WaOIHR
X-Proofpoint-ORIG-GUID: i12GMXjYLot02AgJaDN4FYd3H6WaOIHR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX57xCiRCEPQsl
 doJixaeAev48l1DQWW9fCeRrllr2nntnLHRd84kbFBOnYvWps+GkTFMxZ0MNR/vMYuHKOkd602C
 84LDWbIwFmDrStH6EXgn4spRK/iLH30=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a505b9c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX2RTNisAxbmlf
 2/o36f5C82x8VV/HAN/nEUxtZV8KyNNgg8lzxAf8nG2cSteZELs3xpmRfIqnMtxoAL2fY3MJfDC
 69n+xcOgOi6w2T5neAlnE3lu24nCUSU4m/8RhPLcNlUxzRBKzvoGL6yPznRQKM8lTo1udzmWUe9
 x+KD3TGidKsl0w8UhZWUf2bs++qV6f76Slhw5u6wfqCg9hqj3x+90lqXQ5MN5s1K37DkqBHINjl
 2lQjWYcT2GuyujbC5Jn7gi+Z1Ls1sE2FeTrM+y+RE43VVmNq+grOtYJcz//0qWyp0BxNC4Wfl4O
 zL3MVsBJBb3SUH+Bwvke4JpYJCZdQ0qn2rlp6KynWejHa0bxjndLA3GWniErpW9Dpl1ptD21cX3
 xMq51MRW4BKWdLegujWLVenZ4n99Z+ZZ3oweHkZLnGLAfrnslX1NwqaLAHZitjAdB4wy9hZwMU8
 /8B1oTWiGmejwaSiiRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It was marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
an ATID. As a result the aggregator had no trace ID and could not tag the
merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
the ATB sources within its subsystem (TPDMs and other ATB masters) and
forwards the combined stream to the system-level Aggregator TNOC. It
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

