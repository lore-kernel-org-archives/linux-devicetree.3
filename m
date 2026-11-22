Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364099;
	b=RlcJ8dhDDUx68duH4CaI/ECaJGKgo2+yNCagICNmnCvbxWmMStmEfhBUL4Gy8YhpKVBX
	 rKHVZG9DSiucGIksUPerjkj5ouQfLtMrccbp2gUs1RSk4Xwjo9OSs6s0RQZWgbX5Rer54
	 RJP3ZPntygiYCjfPfp9iK6tAASQVyNnCLM1juNlUVRlASHzakpdPBZtU4dIva/pBXmkkK
	 IfYOarriBzVosMrz4Sh7QFJGmPiAYQI/Ni6O8p4t4qFqSJlgogV2LGDz+PpmeQQCsDl8/
	 Pygge3b1QjnfsrWTTwitvTiy3TUnIgAx3rXyHxCpTceftscRwta3wfDqRBf5eM2lyhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364099;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
	b=d4tku2f6uO8qdZiM3xWJ2ZCbMQpYDFlGZQMXBmBzcq3RdiVP8jdAEwzWHfqrGbhFWD5k
	 9wugoX8A6cWHr2T+0Rr0vn1dOoicTdoVNS086mLJE+pGBlmQMIIRUy0COkhFizcI56PBn
	 kIKZ4BUCkK8lzksvThOJ5qH2cMq8xxm6BS2g8SI5Az12L4Og2YcnaEFyAYK/93foXypnV
	 DrOCKOBlNm3s5d/PHx8lAlpvbeKWR8hc3xzaS/ug4j98Xt0ZoqDPn2JPTmz7u4+Ao8HNe
	 SLb7PGs0PoVdZOfjXYziviopT7cvpjlNLWjt3ZmqtTOF8MEs/LVyUYIE2maxo0oIIgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D082D60A261B
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D082D60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQnGB3383163
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sdHfAwVsSM3
	RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=; b=Pv5rWnXAOHiOMlusuRf6oQBoUF0
	hB7OVlCxAnYy2lRljKUro/mpgAsVeECe8RggnmLu9tQ/X9NPOp6JDokaAl4OgDMm
	0bLYWY0BUWcIF6mTWM2dTXUIYsIp7LEuLImMooQBdP+01nve5feol4hEITT94kPz
	9cbowoOZ5o6xLqlWRyfXYly+B1XFmqpmfaaZIH6bUDXHqfCwSTSQUpOwD1assI30
	MORj/NWCfD1JI+Sy4/Z7WbXLoauyE7+1dnKpms1ivyT+EOraS4Zt5+heUn2f3p+o
	FJ+dWX5o6MmuxNW620OUWUrkCLImb1XAH+Rp7dm5w1hJI2mVb16jwq9Ze1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92114c39cadso50961526d6.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364097; x=1795968897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=WCVDwtzrOWwN+i89thKUuaWZlcr4KKpHIF0zmVvqXx1QCUQkZtUB7gBHJ2rBY2Qd1v
         ShA4FUdfa7KZA7yeGsbLuUxmbrdEwdYchuO7n5m2iZ30q0ym6RixIhTi6otASUwEcuid
         uELuMGY4pS5ruxiJ5/DH7pRnK/F50ZQ4C1lfBEAldMKJ1qgDbApCfLDFd1Jtoi/c5ARF
         ScxGdmYaU3M8na62UcWrznmlRFD047N0Qlu9uKbr5C6kIn5MilfaOO1J/2lfHiYJ79NP
         m/ejPbfVnpJKtocYLEDY8aO2FzW+VwqKPR6teIRJDkYRiVRIPBaY0dyuVaGKn5at+CuB
         GmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364097; x=1795968897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=eTWYr4ov34CRyFI5PjFpRP9CZU8h2EA2lQlDe4ldNySHW8Q3CSywk1uLt0h5nVRvWp
         ASrSK4XZCSWRAT4iHLDD9Ez+l/NE3MIRpSqcaDnKBwhkoEBy+OCnTeZZc6PFMKQN1xVw
         PVncn4xEu43aTTZ6TGivrx24c1Hga1GOp7Jg9v4SmzxaIxCjJyhMBfZgncEEnHQILcT2
         3EuZ5+KAD/pskUjw+aAQFEDnsAQWE3Ec2iNYUiHnkD4dwSVbAL/IcJ2WHZ7QzyX+JsJ+
         owqXZ+liSJaXhITpCoUQJApocEK00B9fjvtDA0skDg4Sfkq+X2tmoSgDE8eBViZ7MvdV
         IJ0A==
X-Forwarded-Encrypted: i=1; AL+hErHneEfYLD45QiRAtMP3CpgOujIIOWTBohcB+s3Uftmnsf9p4ckq8Vfh6qphyihmOsH8Yoeq+33iy+QK@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ron4jLsbQp8DiXrltvzJIcYJBXi4j3XjUXsYEgIJ9Lk08uZ+N
	rhfXHsR75adoUN2MtxJP+7wXjhdv+S5kwAxCCgf7RlAAU8uKuU0zpyBOXfIeDB9jYHmQm+3nHrW
	BXYVXXeevoCsIj2LxrCfEzNxbzhCNgkDE8kAFLFLGcrt5MF9lQ8b1DaIINiPFz+NT
X-Gm-Gg: AZFdTZfdy9VJbMIqOv1X9l793fT3BNlg7DEp2N9QVlC6J+wdVgR+JTFhYLpsw+PfRMQ
	2UtpL98TICeztq+rQumH38uYwmptQssMh/2Yljs/sSb9PO0RQODo1Y3l9PYhbRQqCizTY3c166a
	j9fzdf/pK2a6qzvl28Rggc/AFMcbXQyYxS16dmexeq/bwvBn99OHKcZ8npSCXJoIilKJT/ULQEJ
	VsCWwXIZIb9EQYFuphNhqwJyEm4WGHnqpwI0lwjhseXr7jDsad5dZeU+RmBNQMO42Ff8dLWWXjW
	uR+EC1EjIwO0huSxFqmRQGjvCUGbO8UR49WsYYikrkm4JlGhmrPZ/MjHnDwwYDipsyvTaNO2CcM
	2aG/KwNEdbxifnguQTpZfQbdypNY2p+6iK7yYruDcZok3wG3xdWExpdhJ3w+ka3pQ
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532057085a.4.1795364097167;
        Sun, 22 Nov 2026 08:14:57 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532053785a.4.1795364096750;
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 05/24] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Sun, 22 Nov 2026 16:14:18 +0000
Message-ID: <20261122161437.5994-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b031501 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/RrBlHRPQ4+7
 qxmSYshnwA0mogezCocnWEZlbJ/gqZeJoXx2B3khNNFFkpyboTOZYQwTe3WIW4nHUUFHxv1adoh
 Dyhkvk3jNVoJYeurmbyvVP0pTIojtYA=
X-Proofpoint-GUID: sHNY0d3eYoUdjr5tht0nbY2VeBh0ih3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9rzA3vX3/CRe
 qcygEwgWqXRNY0jhS4TOg0S4c5vfa+JxqTklNDYvnj4vvqZmMbC/uljfQ6co+xlnR7+B4YkGUYF
 jPpnJwcNXgxUPC/peAOxgppxYbkvtu+OP0YB79LSnvi54Gs2yGD1VEQuBKYsvgHqmTuQ2eSMcrP
 dISh7toMODFxj+noaFybotd6sic6bsQMHAKxvtXyQUaFNf/ZCZdIuKfec6sdLUeefGgBcYh9j9o
 JkjTWizXQ5IvVsVp+tOkFIZFOJByVU7YOcFEpNFzvJJRU409tOYEmPbnFxVKtHtnYmXlA54OPjC
 UIMwHSDCkB7OSGZuSib0MEh3zV5DOXOUtTOhbpveDmBD4jGJHwzq7a1uZQO5CFwZn3JkjE7un7z
 1o4VKk7UI9F92M8/lodzmtjDVsbDvqJ2bdd6BZwiSHsmnWAgvCLh5gZbrnsD3tg88HbIe5mLjDe
 X+1xJFYrshcjQYldurQ==
X-Proofpoint-ORIG-GUID: sHNY0d3eYoUdjr5tht0nbY2VeBh0ih3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The codec now has a VI sense capture DAI next to the playback DAI, so
boards which wire up speaker protection need to address them separately.
Allow '#sound-dai-cells' to be 1 for those, keeping 0 valid for the
boards which only use playback.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 866c5e780fb0..42ae6d60a874 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -41,7 +41,10 @@ properties:
     maxItems: 6
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
+    description:
+      Must be 1 on boards which use the VI sense capture DAI, so that the
+      playback and capture DAIs can be addressed separately.
 
   vdd-1p8-supply: true
   vdd-io-supply: true
-- 
2.53.0

