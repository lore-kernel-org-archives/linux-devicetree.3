Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230539023D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415406; cv=none; b=giaYHYzWhvpS/e1r9343AqLYSzn4vqV+0hHDqhbMh1p1LN6jxYWXjl3AYR6Ui8Cxk8+AXu7Ueu788yfiyov1ycpQzneQkQAR7lM4HL1Jp2XRtlODzL4pNxbKdFAU7AnKoxa3HsFq5/nNYDIzKTakxKGI6+Cbc4P89Bj3IkJbkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415406; c=relaxed/simple;
	bh=AX4e7umZ/nF8QTH3oEcp3uEN2fG0HNKco3Yl3M2KAQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LI2EibGySbMLb4dKTY7edkqYTE2EoGfbDbjhSs+SuHUfZLvMHMrv4/sR9RrkERFrghf+GU5cPa16HopIFMKNvXSs5nQqCaRnXZE0vh0mHIIMWI96zINgglbV8ZdeicU6HGryrI1myq3K27aK6mPsKILm1nUoyNkVlAA41oqtOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESmUJMH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROSYQSUT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESmUJMH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROSYQSUT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DluD3182160
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=; b=ESmUJMH3xIUW8a7E
	KhEtY0ZN08EolSjtQF/pvNXCxuQd+psQ+OUmkYfpN3sR1JlhXSZjAiE9c5NmYeI2
	UerlU7x4eHVzgzRgI9jHJaqkbuy0VI6SVe0VB91bI7Pclj7sz8AD1GiiSrgrwllO
	Y00ZgygRuSrb782sBeuElMEPKyixyVeFZ7yj/AM83i7FcFoW1GgOHC6q311I1blO
	E6fWZLjb9wJo1bB4QBYK/hF2wlnIxfUZuoK1pAOTHtNcHRN716dUMxA8Sro2Q2Gs
	VfdThWvGF7pZCDB1zc+fIbnmd1htED9hTOvWowV9eZnk4gtuwYNxubQg7vRh8uu3
	44kE9A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8p4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:10:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a5f03ff9so6096850b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415403; x=1784020203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=;
        b=ROSYQSUTBtCEHO57WrrHe0xr/eoqp+vkCHBc4O9G/+uOLkDfT6gxfY+p0rJaTZKrDs
         ItDcuTjYQNsJLdvg2bq1GTnRbaYilSlQ2rOXlAG35vrJwmvlAeGXk35vNgtogzwiYhM+
         z7Umq7cRjbDLlJwl/C6TxTTbYpkkNy3stThoJe31LcTrbMB8s5conkHjZ3v+6LF1JMIH
         aQBq1ROMXwIypm5gg5qcNj8ffO9Sh2yIE90wdzBT1OAf55ngFpiN6DKgR9SY1M+iBqBI
         CoXVfgqUAyMOH0aCSe29VhcOIX1uOCnwJ8DfeqzEIv4v3TEscNL1jeBN+W4T8I19vUei
         qqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415403; x=1784020203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=;
        b=YHGSqQv9i1cfKk2J0h2LSpWKjgcdjL0uc6Nwtfk37yGhuoQN/eAT/yvFR6pXSoc/9N
         Xme7Gr42LSwXoLren+NngFUNxBdWdCxEvT15zviGPaRMbSnWi/0aVV1bINbf9Xc2Uia1
         aP+B8W5kGPSqpz/LGmLRnQRC4xwWT9CcHAWMFroXFCQ7FJtcIuzKuq1PcbXnT99aFI6D
         8L+5QaDucY15LuBXzLUYtn52zTH2XxLreSM0ZKnY05BPr1z7PmSbvn+9GS1NLQegFiF4
         THAgMiNGgzWBojGKx1nmVmtgqH8CBW14q6Pl0b9dm0BhJSJ9yWdURmQEhOFFGrbOONDy
         0ToQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBL0sMQy8LYnwa1RY+7ot5fqRP0FH7a7KxdDZs99LgpbJl3F2xVpWOfuAkQMbdR+r+CxDNTAXzXt8L@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsv4H5/t2ieyMDVorlAN0Bt/JQgI5ZqzTUB7zKJDHbhJ/5sTdb
	m17CfREKwezqg/caocNnFQqGYtr8dwrzS/h1BgtplZh5Rpt14u529jKJrTjDrN6V5t++YA2EYWL
	e3p5hLQk30J2Vru3GH+kvbCrkwvVmsfTigVL7MT6Xr9AwwDnPBYsrzU7YKKRMR2K/
X-Gm-Gg: AfdE7cl2QIBjvwg2zEfI45KidE3YtGaJ3JSBG158ELfLj2mncfgDdYwfwMA05qFyxEG
	fUKbbwsFexghsWtomFZP9jThy279TWu7Ht9508fFKq/h6Ze84Y5u3qENZTjVAHd3NidVtCRK9Ij
	gKVHkokwRlVX19Ww6aYnNCSZ/bujAGVlIHHPrHQIRz+HVWJ93Poro4lu9fjMwAXZDe+fyTqIgtv
	mLhnKzAyAl1fQ3AYx2Y3L+ExufsqNJ3ABVlJ1CeEV7jQoLTEZGBHFeAwmkuub7NYoS45/+psSMo
	yWzbzXQwRVhNmdtUqWa71vRSKJt8zPVpXjHrvcQ5Yb9+j9UonsSmgCu8DBAd4rH6i5UEUdcD6m9
	68ZHzM1+EzuJBAN5xDXZbqfbXw1VzNNCXdevpAdi4n6uzEIu+vEhHwKK4GxcoRgeT0de4vFNq9A
	==
X-Received: by 2002:a05:6a00:b84:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84826e24587mr4002423b3a.59.1783415403513;
        Tue, 07 Jul 2026 02:10:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:b84:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84826e24587mr4002383b3a.59.1783415402910;
        Tue, 07 Jul 2026 02:10:02 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:10:02 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:52 +0800
Subject: [PATCH v5 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe issue
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-4-bf733ed9ebd0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415366; l=1592;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=AX4e7umZ/nF8QTH3oEcp3uEN2fG0HNKco3Yl3M2KAQc=;
 b=y9rBBL4cpbeysm0K+/fMtdsyTi6NsNikvfJPx69rjKtnxuyTBK26xKkDxeNOftMHiiQk3lssH
 QqjEHt3ckVxCtdy2auPmbWzYSbbxYPbL/XLAu+patCqwFX1elXxeHbe
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: qTxKCVjEbsVNq_UY67rt9PD33GyLsO_w
X-Proofpoint-ORIG-GUID: qTxKCVjEbsVNq_UY67rt9PD33GyLsO_w
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cc26c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=i4VRK_AS-aeX222KLmsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX9ZBNXjwlJlsC
 cZR4cmYq6mmUMkupNzQGhewZU64ytuH5LphN/dAZFv/Zj/ig5Db0S2BzCs4iZMXakzM1fIiEjD9
 T/LtxVK21d/wo2Z7FMmdxNyxdrnN2mNjQ3jWbayWseDNM/NFKP8JIXPu1jq0Mm8Rthz1OwHyx6x
 j2RfQku2bymwR+Et31RMY4v2/21MyxuhPEj4+fCN8ugkZ3vSOaYrSjKQVCr3D4xGdpK+vZ7XPq8
 RhLEb3Qagpz45J+VZs9e1wnIOEi8Poygxze50CWLdPDUMp78sDIXXhKGHO5qKwCWVX4bfffMa2E
 A5xsMEQSl0n1cpgGYX4PN8/IPTtasSXyHQ+XTY9xSQHmBjWlDXnR+CHUSnNE2EU0DiDaOUmilRR
 96og9GHV5dMuG6Qkkr4Zv/ad+051JgWdkADBsLn4wgmM/j517GLHwnjWzjRYXkynGSbxL6iRRS6
 R7Op3hrnn6AyWfWZEaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX9czStp1UTp0L
 KdVRJFS+0ZVoc0IXVH1WiD62QcbhInsRUVDrHJjBCwHAWlq2vOAbk+geWBjCNGAvFP5BsUzuvxj
 wqGSJS60N5Cz+tzPE48UJN7FLkVpDMY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus first reads the peripheral and component ID registers
(PID/CID) at the top of the device's register block and matches them
against the primecell ID. On this platform the traceNoC does not expose
a valid CID in that register, so the read never yields the expected
primecell value, the AMBA match fails, and the device is left stuck in
deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone
"qcom,coresight-tnoc" compatible, which binds via the platform driver by
compatible string and does not rely on reading the primecell ID register
at all. This lets the device probe on hardware that does not expose a
readable CID, while remaining an Aggregator TNOC that retains ATID
functionality.

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

