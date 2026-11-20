Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145307;
	b=2X/kExOlgek8g3xgCyJQq6PMs1NJQ0VEl1LeJsatT7qh62Jc8vOrfOW8KKQ+mKBDzXI9
	 VsCwmKEmG+UjEGoNZnP1LvE26+r3bTVtCJmz+nPro6isLRWbYWNWs3GqpQHDZC/x59z8J
	 owbolnvwVM1uamLYvrJxrwtWRH5v4orOQhcDbQnZncAx7TJ3a6BNdcG/m9Oirh9gW0Yjx
	 qZPvCzjmyVUmi5lSmLcEqNO8YlHzBAOz7uY7DmogLztzR7+7WPMpdEzIkkmSu3uWuQ3/A
	 Jib0+ld9oEUtD0zNgFxEbemw72Ga9eaETVH1UPMQiY8Vwtxf5wx/VvvjFP3i2qhO4Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=aKwtI/wqSnFZkk3bvVQ98/fYTw2RZRmjnxHcGznofUK6Q2bSAhykvDa71Ij16M3FGnm3
	 p4kVXF8nZQMhY2Y5p04mV4rb3SYDmpnAfaJ3WejJSzkky/TPLCcuMsrUPMJcKT5psiDBH
	 wt9LCsdeHtLdE0XT56nOTvMgYWlWkr46ua3UKZlgBOPY8JCE27Fy3EBJTu9nHWZ2gI9pn
	 iegY+4+FMY6ivYqze/DGkxSfrjlX6/t684qmLpolTEcKRgQ1Y5+A5gMPWcznMftpRwjIr
	 BLzrSYVv8YF4mTa8bLxl/ey1RZjRI2y2oMgEk8h9wGZkneRltXzQSdOlGzKR3amVRzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KX/6VN4e";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAkUkouq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212D060A260C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212D060A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX/6VN4e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAkUkouq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0G8mX773145
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=KX/6VN4e3XhOxj1t
	6Exq2PHkGZ8+mGH5fZ8ShJNY6GeoDY+aDNcg5WEpZ+aP2/p+d2rU/nG0W/j3HP+k
	VPDX96mFhqiGiAXx0IkaoMIfcXDt8wNPuBiLbQN4TXc5mkg7D1jEZ7J9pUJsFQjX
	1zYpOfO/PaMbQ/zKIdUmWMLQo8mdMFj/z/kw292lMSUkZy14xRsPV0uo0nYFuSsi
	/NpyRC3CMfe/UbosFE27RrTq+hlNSXiNb7mitIszSUscrbJzPMugPtLlzqWvTfSu
	kkTcigOgiW/SLtnA3y0pyNRCpKxVYACD8EztE43ltbUyZVOl7e7etCrcTH1bakQZ
	WpBGBA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx1cesu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4092b645aso554249a91.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145305; x=1795750105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=cAkUkouqavsIJzvAoXAGiM+Y2yeJcnTZ/aRpCxLfEz6U1NRNrezRcttgzhgKDzPGZ5
         EeInTPqlLaKqmh5QXY2qaSEmIZICUGPkztVWeO05O/C78Cq4ni6RqkUpv3wSk5bFKBnV
         d4X6CxSrxXYMbJV6mPnQECkfKagkVe2NHKZXOkZppHktN9MDST4t1cIVqLDYFKr5MiwZ
         Mpjl4tR3rLLjz8+dRNggBEnxrNW3qEVJEi5+nTOkYez8nEa5v0Ft8Myuxv/pbYoWVcH3
         f0U/16JSuaqOhODK3yWJDF+nBBJ4chdPSdSK71THkg91eGUpyhaqjKFqbogl8t2PpcXa
         UF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145305; x=1795750105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=kfJpnUjk2UPFhLM1YagsYzEYC7upOKH0iEA1BjuohIpVkt/NewIUtEl6W+xG9UAXcO
         JoGs2N1YTlqPNf3ulF15KEE0CpqA9LAXXQTzFzB3rlA0ia99i9eyX/TA2mBM23mlcxEx
         BtCPiqadvSUc3MvsFnCP/+wd8qXD0fxg2fOz2ljmrnesafpSRvp+X1VctEAS5O61ycXT
         a6qhi0gIO3O0uhYYV6A/a02CBKfsXGb44E6xpF6TZTcfofXLcjW3dwxiWD/T4+cecApr
         AAF7LoWol/TW8cteVLCLavKInTlNDoFZcES7PjfHplpiftT/eAdVMjGPKkzdmiXyiq8J
         eiUw==
X-Forwarded-Encrypted: i=1; AL+hErGUqo08+eqiKVcq9P/mpOXCPMYygq+ut8u6oa2z9k6BIzaFOrJhtAEgYVzIQYeQSSVOoVlVQEscq0jK@vger.kernel.org
X-Gm-Message-State: APuU4Z92EJC+oOYHn9TB6Ly+e1Z1RuiSBldIXbjSbekd3b/j0YHAqJYI
	3RPb4z9g2JSqAuhITtRhG6YVOwHqw5fzq8QhlUd9ElI8fBAk5bsT3RORAYhYx088aanW/AfNuII
	B6lYKQV5nrcXAClHbU9xjy15j+/87+T9W6o6ierlqNmX4nNO6NI8zd8vGTGHeZ1zZ
X-Gm-Gg: AZFdTZeIfuU28Ihjefotjhirm8B2pZk1IlsJfDAfRtke1GyxLvGHchFz0qK8WBr4kNb
	k6lIL2PX7BtGvsJ4VnmoVwTsO1A9yVgGFvNuyiTdfx67oYbe/qnIuZRhYtSkwGdsqOYPNOai/O5
	IOVwPgEM1VM9uPXrLX/f5w78XoMtTPNCX0gGT3nmZAP/LTeYObQbvy3kYiQYnl1wFyPSd6iu1YM
	eKFoejb50PC/flCM2Hc3zka0IYehvbmqXbkAZavsc0UQBN8INa3ds93WwEzDp204QQ6LZrE8zci
	tbRofcY6tA1kvhCQORUAgsqisDW4o879a1T+5oxZPUVB56JQjlIYrdNPX4v7sfpjMzxXqfcWYZZ
	I/uMgP56Ml9XhHk+XQnSjdO7S7Xl//BWiKPqnCFLBN5nw0dXkpcuIPKzESUJsHVZc2XKpchUUdl
	eIM0LCgs1eWpdLowI/gqFyYNYqXG4buIkap4s=
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr1394912a91.19.1795145305149;
        Thu, 19 Nov 2026 19:28:25 -0800 (PST)
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr1394878a91.19.1795145304657;
        Thu, 19 Nov 2026 19:28:24 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:24 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:25 +0800
Subject: [PATCH v24 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-6-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=R7aEuV4YZMkjdPvmUa9VoVKl7860e56ZDBGW7Tb8Eh2NeYdpDO9Vcv99ysIIYQzMJRHR/Bfft
 ovKS5/UvrrECKcu0MVYi0aYu3KSV9DDtSTIc7b96Yz+Pp6AXsL37ssK
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6affbe5a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: N6vhVXfBV3WrzOw7ly5Q3LJo7IqjU-_R
X-Proofpoint-GUID: N6vhVXfBV3WrzOw7ly5Q3LJo7IqjU-_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX3jJQux/VvHZw
 vAYTIWBWL7iZcU/Xta1le3fzcFE7f8lXsVqSG2uFLX/0Ny7D/oAJ9mSoIkFqgmU+2gF2gAsccvO
 vIOWsyVtNdYbUFFZ/AeGudcA75rykl1D3cqixh35okN9EVmQsrdHgE6hAgvuWq+pHvTS9JhePbn
 ba4oQ7pqgC+webU+97fF5uE7MepO2IRI9AvRB5S5zRitNUzzvmWfX5eejP+s/u5zXSugnazi7/5
 u6ErOGDO5QMhTUA0rxjzwrVK4fdQv8jxVziJ/aTkqnFerEZvsIhq/z30DgH6wIKOLUbwzD93eOr
 T15RLDDPfnF5xmCt6NqyW2fecMo6s6HAfqSecjPEIb2Jp6lQM3gLJ853mq66C/BkGjyjzAf3nAp
 gBumqSTOac0v9RGh7XWuZHB+Nd3jLIWyxueQhNRkT/cXrwkqRTV8FxKePIXmTaN/cPzBvNjy3fl
 PbCsxf3Dm+fGUOhuNuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX4qDNy/bBMT8I
 fAsT7NvOgCXOmbQmjbWZbui1AjDA8JrsaATzqtmXEqI5cdcpxkJWNDO+yjdEZJcnlz7agIG7BuS
 6jLkC1ytrI9+uj59HKKbWcJlsGqMXIk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

