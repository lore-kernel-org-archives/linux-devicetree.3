Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002D320CD1
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651224; cv=none; b=NC9F4HFs9hoBTJf4Gu9nMY1d7QtpHKFMtri2KLtVjUA82RDxxgNHRgcuTZJmosdEZRkvgedlfWRlny09IajCjCg/PtTDCSMXFuPxSAWPKSxMtj0s7H8NXJsnZ9elKR3qnNOT11qdsOrjQ9jBTHccwce/cOMJ40he0Z3D1wLNWw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651224; c=relaxed/simple;
	bh=kUxtfu2GkKubtJdHqbDaFenuC/gQXoog7GcvX2P9CYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGaWXMkEz/H/Aq0HYkzj/NhdHIfHLmGaIaBN+rdsL0rPcHxbsE9raKcISU8ySSnwC9NpwSFI2nCYI+QTW95RM63Gh0Dlv+LFqCeom0tm3WBDjjaXlPWLtU+2ut5+bE1evXoT6bYZHOyH1byEtQBHCMo7gNzYblMxfsfJHCac+2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCAslgIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJJLjA8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCAslgIY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJJLjA8J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXR3s2422261
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=; b=QCAslgIYZyTntJHk
	MLk8ssPfTuu9MUEiM2pcq5i6a+5rJvYOVB5TJPcRChhLm3pDWMe9u4gOe8G0RsR4
	jgzeNpKET7Bri1b3fTb6IC/1Stdwr0lAzmAc2YvKpjkCsp/8ymF2viQHp1WKZDSd
	rvVfbTGNqRB4kcoaS+wEfA6sRK2lVqwQ8IPCtFX1o1Li6GX1Czy/w6mj9xut01u8
	zHEPKW9eQr9T4ZnhRBaygCENQG7I4lujyONwxeSWes53py73tVarEFJ0gaeMA7/Z
	IzjvlK8AxvaYm9s8+n1VrZ15R/WygIx9DsOCRWQxt10mnc5wI+X3Je3z2vXbI4dA
	TiXxlg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjahut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so5641355ad.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 19:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651220; x=1784256020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=;
        b=iJJLjA8J5KDaf1DJ/duVpVwBEGfg0mqirKz+RggVa8Q0SANIK8nJ+pKZcM5KpSSa8O
         BmH4eEjUW96z2M1R3hZVAGUKtpjufnvswOz0qTQQmyR7zEUzamFTZbgajsdDGWm+76Tu
         1jGP5B4UJB87c2WvUcis/PUCA94yKzFg7GFpReEKsPV+6GnV8lmrhpk0oARgfVUPTykQ
         MZ9yNLLqZ4pkzTf25H7eyqusdhhTzmMuhR59iVuDw2CF/UKaIOfYaMmZgu1Cwpl+vKiA
         nsXgyklq00OVeRJCRpHazD6HplKNOMxyCiLROzKvctTaW62RsG/oQr4gOjsB3zP0msB0
         gD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651220; x=1784256020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY27m7v3cEAaQpyiABwCbYqFFK/jPd97b0pHI8E07Gw=;
        b=dGSr5of4ht8FJT3qPZv+sk8x/V/VGztT+pB3MheX558y0h10nnI5o0yolKhKlYqYXH
         mnwCzGylTgcNSC1oimi5FJiUEumzHcZQy1FPCW7dGY0hn9up61szMXcxDWOAEd9WKdZV
         kX62EcuWvYScu7pu/ByPjymS5bJ1R5OlMUznj1ulvH8/s2xbKboi/bOhyQM15cV+ovsy
         Kl9KHyMdKYBkCbDo4OCslbAe5st9qbY1DJpDOShcTpl4x5QK+mEdrWV16b1uueHnCHe5
         Wq5a3puKetUVtMqXijp9/643dPeEQplj+UsQcgFfhXvii9mZrpTSTE4VMSRzxvmJimCa
         sekg==
X-Forwarded-Encrypted: i=1; AHgh+RqPEtC4F+6tNECDarqBMmPE5ElZGtcHh8zOd9NOejT1IyZHkG6PmeOHFL2YeqKGWRb80w0gFVU9NQ87@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj2Cb8wmNMbiaODHaC99qNDqNLFOMonEHRzTx8tWahXm1LlS6Z
	c7jrnoViZpqoB+vFQN6xgibnTIdC4+VhhH1NLyq5hDcAKkqJX2yBs2eGdat/QJ4kc0l4mxhf+VF
	Pb63/diDS4Rg/Odv+3lX7Gvg56G4o8naQa+dRpVRisxg08rnoys+erGKRN6E5DeBx
X-Gm-Gg: AfdE7cmOaDUCrl8f6KuxRS5ztjtru0DTn98mUaRxoyQIxzCXO7cwJlFtqBUNUhkjgVc
	nbAPB1E+CcvoyAoiaLQxGLp3baV9T/XDSCJV3yuOMb4kgB6eS9yuFxha6ABNb7tZ/qKaii5dM/g
	xrW3wK4pFImE9zfh0K9tVdItLZbH+9wvNgUvOZakbsqWz+B44QTOenr0WiLj9JeFljQFa3KTphs
	1FtHgJBe6qfEpk56Y0jOPPsm3PWgoCdI7/BWtrOM+oWO5lwE3eqw0gsbcZYn5aiDogBNJyCrQu7
	wTGXhPr7la6xcWRaE7Za6pAxpnYcjO5Ubnw5S1ojPrB9dmjDvg6tbUs+eNYXZaNhC6gk0D6b7L7
	0n5lBUJTZkdrUp+/WQ5QMsjy8Ymffxpw7PmvecrnBDqROBLKl9Vu+J9vLb9xudy62Q30l+PjRWg
	==
X-Received: by 2002:a05:6a21:4c13:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c0bd0fa84emr11841150637.37.1783651220453;
        Thu, 09 Jul 2026 19:40:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c13:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c0bd0fa84emr11841093637.37.1783651219984;
        Thu, 09 Jul 2026 19:40:19 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:03 +0800
Subject: [PATCH v6 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
 platform bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-4-41eb36fef8d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1616;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kUxtfu2GkKubtJdHqbDaFenuC/gQXoog7GcvX2P9CYg=;
 b=hlg9blVs46R5OiJ16+aISTtFikhio7y1TA4JxSn81vWK6bQvO1MyWoU4RGnN5Kjasstk+58Id
 xNgxcCOpTOqDrJ6K8vWSPiIWE7O0Etl3i34zOsebsMTQ7McjP4QlPxA
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfXyoqxaJq+wHMB
 +YSYAmuyJFmcjFZwystegVc4IoDPm2lT7e+9LXK1Mz+ZLyC6KcVnb+ymj9DiuAkX+s/rgULxHAZ
 IIorEbrzHQOyD3MBD1sNE6W/BVr8aVboR/dUjQyMa4f/6kqDk32bll97L0Uj8rwe0S4poN38/GL
 rKqSoYNmlZgkaNPfVgccp0hSD+zZrdDgBxiX7W0194mLNpQUZPqUylS1T5N3xnVWBFq8tnud4xP
 jhiJefWs6Y2pilm+jPudBgYzOO0IqWFY719XWZdx2TYXSS/V4fKacyWHHTx9CHgawq/TQBD9/dI
 1wnEyZyshaFTxnWv/y6Zl7tbNWqt2zV1b54HtTeFs52/IGZAFjuog9V0ZPWD7rFRq7AUzohC/sl
 W6P6j3OXm04I62Q4QGDSsQszQANQLH1+dkyVTTYkxaLenrl5h1+LgB2q+5RHrvIuHthR8ujYA2o
 CUQr2L2OhTuDGLu4Uyg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a505b95 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=i4VRK_AS-aeX222KLmsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: L4k0rfgbv8iKsa0N28LN6zAZdyn9EYHS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX0cWgPSFtH1Ab
 jf1FS7CyoQCUqLSvVEvyUAzt/M7RJFnde+ieGtKfdNzOuTFNVXkAWm3c0vtkYcXf8aFU2GdKPrS
 behCKTP/QNJDagn+fci/fxi9WWpNcpw=
X-Proofpoint-ORIG-GUID: L4k0rfgbv8iKsa0N28LN6zAZdyn9EYHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100023

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..1e25be41aef5 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

