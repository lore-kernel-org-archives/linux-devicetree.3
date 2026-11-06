Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977334;
	b=CMQI+6IgDCIBBp0pmKvhS27eZAoC9/2TxrgrsYY5ImuI0M/ird2bcJx/ZMvbKWQehrNe
	 b9Z+1nHOOyewf6aUSpVy2jYaGvZiAWSZdsTGyk9bsGE/auYI7e6U2fHBuAsSjdq4DYaI6
	 cjiJWEuvOqqe+uXubNqBIAfsmDN1xJPZDQU3yHCIXz4mt/BzpCi5GcOSaxu8t+KZrYNdw
	 QlNp8Ex6+cKK1D+Xa61kz8/Pof2MCnaCmIyDVPkazU7roEfYQpVC8sDmTxNK8/Gv6rj+G
	 CIwXEd+mQbwSxXppI3INy9TPx7uWbsF0pGv/2PjuQxq3ZCSVdYeau9oWTHQQQUu2lRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
	b=ph2sFrmnHFOoyDg7YQJKUF8DeIZt5/13Z77R7gaPXj/nGm5dcTqGTd/Xo8ArmZ8ZkuNm
	 cyi2R71UemggNY/cNwq4riaiFsYXqedURIUUqhiQYHAipWbrHML+O8hZfwy8QFqx1qKJu
	 Np0E5RXJy/y1X0twbURS6RNtPLKuDryoiIFOGlTFr557nrAlHi7rPPMnAp64/nATjXr2r
	 9+uqojKdpMPL0G2orVHbqAnOyrn8JXBEYfsF5lp/sCpEJ5tJYC5KOqFjXyiC4U1OjxTEm
	 tR7ohjVLnWZY694FYaBAo4ybRtdSQYw25amHyft7iHr9CS1C6jlytNOsXgkTN5yzI6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xbh7m8ur;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXfz2Dig;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BC5606A338
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BC5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xbh7m8ur;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXfz2Dig
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F05tW045277
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 15:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=; b=Xbh7m8urGrHgjcfH
	C9Jj0JDKyF6sex7I0ecYyn8uOXYx+Mq+2o+q4OVZsIrRVYm8lvV+6wjoFJ8ZO0Hw
	gnGiNk4ZEi/a1e04is8cN7Wd5Dq7bSLwQXAebb3nxwvttQ8QGHPeJxH7uKPdolIL
	j75jc2Y+SxwndaEORzmN6/SDKfTvbIf9cXwHSqTpZILgpvqnrL6bOFD6xRBK1YjL
	ZJtMTjD6SPQhm5L7U5qKKpnW2qn/gGNOFk1t+CYjPRvvn4N3XMDlwu5BkoTZmY+7
	RtcHSR9+2givifm7yIsvFpecrhf/4J0GOmDpOVnlCeN5OavnN/fzVN+XSII0GZix
	Hmhsug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa37w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 15:02:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso1031401a91.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977333; x=1794582133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
        b=fXfz2DigYC9W6AZStwUIvED5E3+G9TM3hT/6b/mXMa3Fw5VUM4LqVETnXJAFTvuPXw
         iXwUURsT7GlR3NnH1ifiH2e+mh5qnA3R8LuNXAW9zORo5vExAx82UFfIY2ZoxrViSRU4
         UTCb7nOOi5MWhXfJ23EnaJj+04+QHVMvRnd5oK9hhar2/Mn7Zt3uUSjcgOmrBVkhbVjz
         DU97ehRMM80KqWdEx6aXURIDeWJh2DpWH1P9c8H2UcCq5ygG0sTNkhdUdLxmqMpVPs6q
         MrqZmdpr5aQD5gx8ftw1JfVHE5iadgBg3N4+1Lt8bvqM0T7Tan95yP2ON2aJPq5MFgW5
         jKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977333; x=1794582133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
        b=gWF9CY8HQoQ98Tlv7Itc3AxdiFvnwc0DJ4El6xZy3qzFd8X1FIkOtvYvJpChhQfOtW
         oBSG2ltLEoDW56kz+VSBWGvS2/2AwrXBRPHs0hbALVOBhwFgcOWRIOT3NvXoHmTVG+kx
         x6qHIYxeisTX9vSuNrf/dMvEqnW3NR/HMO1k5azT2cpNNROrf1rFPOmgLoYAIM8XEwoE
         NqZYEWzDvyxyxX2TWYowfN0fjisFTty41jBcjZnre/wGTDQBAZEkwM7prUToWtdi7YTm
         9+KyjJ7UetFwHn7X697HJsgyJ84ER8qmG8Nb+5x32Xo2ep1Qm6/sze8muM3rqxhBpHe+
         /FaQ==
X-Forwarded-Encrypted: i=1; AL+hErExaw1Xoa52R601Gy8Fos2ErypGf+s4Ry0tNQFWhl2ZapavlPnZHysf29CmvEg8zEmTInW7T3ppOJVf@vger.kernel.org
X-Gm-Message-State: APuU4Z94//iS/9o1Qk2+zjMFycL0EEHCoKO2/4ebdDrouQ9207it5zBU
	w5Wiq+5i3ylxzTqg3Uu0m7w1Wb5moLJoOE6wTfNgrLki4ju6vBVpf6/rKrKxKIyM16uJ1iveuC5
	R6V1D3U3vuWET7uXLYvWugCsSuvRbn3kIT2W7mwEUMbJrM3iQryMVecrOGR59CDMQ
X-Gm-Gg: AYBFou0w3KsL1ElGSwaQt4MJBqKcIRjz5y9aXKEOd4u5OpCUb6A1MHt3Rmx6AWwm1og
	z1pBuP14klGIlHK/9QNhTUhW5l5clTeD3el7fau2evjNnEo3Xic1eIO+fT5URY5dxoD+pBrDcXA
	xXg1f4TdTjcZ1brPXEgg8RmKstOjZJqDdkZYbDRh4ERQ1VecXiu6JjcQHTEuGZRRBi+OAxDhilp
	0kZzjPlBHs+j7xbfOPaTCUI9FATizPHbxp1uv0H8bdAJz1xxGBFXDqYKVteqbQmPh6QNMrjKhpG
	ykVJ0NmHp+FazlANMs8mEVZkxnm0rMdgx4CSoko0kMhbULYr7bVGqs1XwbFo7as6ziPgUVY61s5
	xHCEGdE/e/037rIja3wIuu2gLeXlPb9teIy365Zu1PDXsxSMySSDWIrKH8F/3fHsrqiF69L1adF
	5JK89dMqP6
X-Received: by 2002:a17:90b:580b:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3b0db5f6fc2mr2667453a91.1.1793977332438;
        Fri, 06 Nov 2026 07:02:12 -0800 (PST)
X-Received: by 2002:a17:90b:580b:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3b0db5f6fc2mr2667408a91.1.1793977331926;
        Fri, 06 Nov 2026 07:02:11 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:11 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:21 +0530
Subject: [PATCH 3/6] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
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
Message-Id: <20261106-qspi_upstream_series-v1-3-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=1658;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=C58xMketS0t+z7bSIzaXbo2bSN49O8Fa6mvoWIRxlbM=;
 b=f9X8SstJaOTh1ZHqgsSboJwCtiukraMhFpa6kFNyRXhI0Nml5kv+MfcVpiY6beP6mpMSe9ePB
 g5MiXbB63ooDtkpJneWzUOrCzhZm/9MSz6TsCXjt2M5nAG0m68MBcuW
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedebf5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KUikZgbwDMKjgD0mul4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX4+wthZozJqW1
 OHRKSi4fwErO/fp238K7WX7wZGw0DdbWABNWlUMGpeIX9lUtAsnLVj59LiuJ63eIr5ot42NhWLQ
 6taDSR0+87tiwaA0l6mYAUMpbJ6syo8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX7psN7J3vDcF0
 MVczm1Qe/TaZRA3LrsXwU2p1ZaxQA+p4hzEuPrFRv53TH1MkjnnpiQu2NJKy6qzGe0g5h6lBvBF
 63f53sQrGw/yhD9Viu7GFSGxzeKZNiF2rsbtnztrBxxBq8EOWgFcxXzx3tBSGL1uFXjUKExzdNL
 rFq3MeOVkiBYGKcGzSV5EgPYDb9RfT28tJQbMH2djbQCcXeAPKbTSMU87ggJIY8FbXU5DikHsvE
 nTyjxiinbwl2MhQ2iYcxGm1MhOGoKrGH/XR7Gd/LHBRSusBC4/P9wDEYiZl5mE/9cLiDMrSyIfd
 dMJCtWRwcERqKazdeTmg5l61BhE5IM/mAbFqvItE6HvCWkqPF84/vCQPCIhHojkhdVGHI/W65HE
 AiF2b5WVYqx6S039KeOFeiyJGOUq3Bq6U3Lql3onIZdP+ongFD/gbCgXddvbDHaA6u5Hw7Sb058
 xJcigIg2F4KfgjxS+0g==
X-Proofpoint-GUID: 26uhidXC0KR-Tid2ElDrKFRCK81EIsUQ
X-Proofpoint-ORIG-GUID: 26uhidXC0KR-Tid2ElDrKFRCK81EIsUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
instances configured for QSPI operation.

The compatible also allows the driver to select the appropriate protocol
firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
distinguishing between SPI and QSPI firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index edf399681d7a..e568b67d077e 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -19,6 +19,10 @@ description:
   SPI in master mode supports up to 50MHz, up to four chip selects,
   programmable data path from 4 bits to 32 bits and numerous protocol variants.
 
+  The "qcom,geni-qspi" compatible string identifies GENI serial engine
+  instances configured for QSPI operation. QSPI supports transfers over
+  multiple data lines for higher throughput than standard SPI.
+
   SPI Controller nodes must be child of GENI based Qualcomm Universal
   Peripharal. Please refer GENI based QUP wrapper controller node bindings
   described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
@@ -29,7 +33,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,geni-spi
+    enum:
+      - qcom,geni-spi
+      - qcom,geni-qspi
 
   clocks:
     maxItems: 1

-- 
2.34.1

