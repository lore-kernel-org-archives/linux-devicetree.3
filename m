Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636362;
	b=BrrG0XOH0dLdc+UO0nGB+Ltzb2YVuhb8bsuaaAn1ZtE6Um1fpjAFudQ8ZSejnP8gm0u1
	 PJvnJ2AgX6bfmzER5KHlnXbxCWsD7O12cvGsj1WdSXcgAcoRyVY2e7VCUA2TmDPkKMdzZ
	 gID0n2Us6UTQGxfz/N/sD8QGfK4oztM2dJzIubZhT1wAUqQf2Rj0xyz7UAlXMmEOndN7m
	 zTFG751cK7W9UgcpJWmCNLdDf5B78/+rv3eaZM86H5b9UM5UbFWXn/Fa5FIFJvRY9if4X
	 kN3wr+f1ig84NdY/BYRVKOjcLVswEFPcZVodIAZ6LsFjmd+/Ws7lBidM1dN9YgLVNWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
	b=tmanKpHTx7PPZlLg4OruvsVQ0FRVLtCqmQwjpLAkfXIS5Flw6bgPjBnYIBgp8oHPjmq3
	 SXdPmhQuGTD13rMvtApsj309Tq2fdqgh5fNVjPAe2GpIokzQVa6NUkQlHjUrs5iGkeVwg
	 1BcY3mI0Rd8lc/VIZ4Z3JZsXRER6Q4AYw6I9XKhAKTrX3JoG7ORr15kkZXR8HtB5jXppE
	 hFhfIN0fnsgqdRWhK2g9ois6CpwV42rsONlqIUA4/4hc//QnS0H8IhRx6LF+LHkMb9T4f
	 2YX9FL5W97anNpKPDoViQwV5XkLKIxDBtBc4ERkIH6g3j2rs7HVtTmvOcViaiGPDU/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMgKYdXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDZ9GH6k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F31606A32E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F31606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMgKYdXW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDZ9GH6k
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAtP1162720
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s5Ba6vNo1bD
	vLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=; b=GMgKYdXWZ0gm+Ob3m02qRVB5PEC
	4KolNbAyyw/cqFfqySAd59iHE29pI4+EZaCQ68iR333XQGljNnQX6fGglPumAWXg
	hkyjeFTKwNNw5KgPZAXpJIKo+AWahgqVtXrJvZ4rQEvQStZag0Q9JTzCNY+Gotfi
	ttaN6cf1TEDBx7lFoS0KFzSapkFr3yD5Zfmeg1G3bIvVrTBNufy3HMXqXvK1OGhP
	4LVwRfuXy2fGg/3V3LfGmwoarjdKnVGiKbU9ObaOy++RuzCoQgH4YVBWFCnTLPID
	ezWEBjcqJi2NUHXFlaupGGtlFErTBPFroEaF2iOYIkJloiLGIIQ93zUAjfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aeh1cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so1049854985a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636360; x=1796241160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
        b=FDZ9GH6kamTMbugi6haXsezU3CeblbCvu4LGkN5ZoMlqf8SV+hB0jCQR0hvz3cUhUK
         vr8py4EkxqiY5R7b/aCBOt6+9R+Y/uOWgpp8L2qgU+Op4miMNrl6pd7So4xKwaNmnDT1
         U1/5Yx/gzfjeLFDfPESpMErqdp/s5j2dk6RN0epaXw+Nb6MlseBQg7E/+S/fg49CiKm5
         dWRphyNpD48KbYvQQ1FPrqgmL7Nq+Jw6rHDnpRInae1y5kUHq1nGIP7W+ZXaF5Ftrpcb
         wcWbyQWPr5aGNPtFZWKjNXX/wyfCj3kEIFtqjgGIcn5nSzGG7O8VbUxn0B3OiwQ4R1Ew
         Jt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636360; x=1796241160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
        b=CB2Kmvi/4xOUUsEsC6NGY+5KoT6IVUDGEdYpMX4caxWhJ+eCt9+y76xA9h/OLBNdiE
         Zc1o9srWndREkLU/ZVFgE6bVNQyMTRljJJ1i35X/V98drhhZ3Kr/n7sHn6rc7TDT3WhW
         DaBqdSa450KWOSHaTG3DsabbYgjMQ2nsxcwtTazO2Vrm8hg5fC2ufjicWuPhnGFmGds7
         FmJ8eWimhr7vmCCWoJmcU/ffqCLYVWzXIg2mHZJajgcYWwFmV3T52eaQ1+EmIJj0xUuE
         Iu03fLcMaH+I+OQxuW3Ok04OJTZB2kwx3EIViCpbKYNL89GySLQCJlUe+sEOrGTwCKoA
         HBow==
X-Forwarded-Encrypted: i=1; AL+hErHVO6ChmKePGrofH0Tiw/HIxcBerN8d0s1NBxEP8YMW+eL8MSg+JE+6LGjXLU9VUJ4mLVPyFHI7Nopl@vger.kernel.org
X-Gm-Message-State: APuU4Z9jHiecMmK6lkMt6kGsKOJjtJxXY4gEX60BAs3TXGSbMbudH/sA
	OaQN7AEuC2wIHF/8AvQXR+WEr8h4eeKIroEuG/d2DbH4WzmVqhlnv4xHuTPuBarmvDj66j49a/g
	x07y7hMT2OhytmelpxRyUyjKKQXGzttW82uUuDzBCtciE2w250tDMPAOv1D7KvQ2r
X-Gm-Gg: AZFdTZdM3cGZXdiOF9EM2ctkUX8LBC4pG56L6bic7RRm7Qd6iyTZHC6fI1DyHzcjije
	vtHOLPlAPeSV/p31OCVxbncy1uvFy3C0G9Y2t2lwiVsvnlYQrfrUfLiBGMMWqZgoajyK7iViSFw
	ph3Pp0dw84XNSH94NJqt3v4lLnL2tzCRL9cmHNsTiWfU8pfAjDqyKfzW4CM41q3ByI3tr58Lpsz
	m9JWY6Y9/NvyqZfIg++2j3iUTP6hmSm2+mLpXXtNyhMc6ZxrxWLyRrLUjGRvst+DDdH47YuRGcg
	G0nnoW7Xx449vdmnxHiA/0zh7vKZLqjRvJjTyiUvc7ez7wnHBzqLLeTshNimaIz1auwK2jfpJ8v
	HysPOzOQepFe4JXSdvFtKpv81qUCAP/czB+12u58407IUqhDvL4IHRpDuwfehYX5J
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3386851885a.30.1795636359830;
        Wed, 25 Nov 2026 11:52:39 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3386849885a.30.1795636359464;
        Wed, 25 Nov 2026 11:52:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Wed, 25 Nov 2026 19:52:24 +0000
Message-ID: <20261125195226.1563577-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX9Ng4uPsPb38T
 cCrd2evpbQJQzrG2fYQUuKtSBsoJh/vjJa6SLhmBqRbvElDr/XN94ZeJe8G5t6LAiXTrdAdWPoy
 1eZxqB1Sn+CdkM+JRUlyWAy0f7a8qDgI7Y0cKtD9OgyXGj/FnRKInSiKTRRSDIF/ES4bjrG30yC
 3nIRQrg3DLygzmaljlteW4V3WqrEm7gQxDt7SBTJ+l3AmcBng/fEFugOGazSxRG2wwNSx2ZCg5n
 6zAjshd+yQtw972CDgfJX7UrRyqUurPS06I5zKHWUCTbZF57kVSHvhcyJLy7yftClH3pR+AX8gE
 OstX15X3SwCjOPblTOBo1l+3IeGpDlO8w2zckaLJaAIM4K0A0PJ4JmBzBonXVl01KoxZLtad1DV
 S+UY1wcTi1ZTPFoUYeswTyIiBooSimosv6VRjQb2lSBnnl7KSteYasS7DBfPVihi4w81JvFgsz5
 8k5njpKqw3h9tr+5FQw==
X-Proofpoint-GUID: RnSkkTNik_PtsUC2WnyV7rAN4Z6GKbz_
X-Proofpoint-ORIG-GUID: RnSkkTNik_PtsUC2WnyV7rAN4Z6GKbz_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX5J03C6HwJNjU
 KKUM5DaIq1ilX2AEMLE3P1t/Z1PoycUvkbSAhAxiPK+cFORt/tCjULgrgEh74CbomIXGh71svsF
 M9lcHaTtvc1mw6i2CPFx4qlnNps2zLU=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b073c88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vMC6Bm_45Gru1Dc4I5QA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 and reuses the same
programming model, so list it with qcom,pmk8550-pwm as a fallback
compatible.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..e018f1f3532a 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -49,6 +49,10 @@ properties:
           - enum:
               - qcom,pm8937-pwm
           - const: qcom,pm8916-pwm
+      - items:
+          - enum:
+              - qcom,pmk8850-pwm
+          - const: qcom,pmk8550-pwm
 
   "#pwm-cells":
     const: 2
-- 
2.53.0

