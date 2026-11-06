Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002528;
	b=rWuF/123GAY3ZUb2hKvsU4zOafEDYLpDLHHdzK6+GL9do0hjrN87zfxyBxHLat5lhOEN
	 D8L4YVsMsuh6xHprDGYMDjzO1eocaCCdO+TDYwqVXGDuhYZdBt3hYbyK2OceiZ8tZTnzM
	 rF4UNEOEs0R+Zs/BHfPw+eNeLIeMbn7o0QydJ+Upcpx0OLliffQCjP7uxMroyT0sVWbN0
	 ov83IvNNxM79cgQGnxILCR4PzwjG3GgRuRm0m3+0m7FYei8RGYYyin9D0KZLJPFHmLXP5
	 D4ZbmLj/HCD07ifgB6tLzu0OJD4VMWWmD/CzBLamDpPu8exkmIy+bw1IV6CyKlYAiSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=;
	b=Uczbq/FEi8OQJ1zJQa2tZihundNXP8hYVYFPfu+kO006k5mtpUgALhSQ9biHrOA4nawj
	 WSQSNwAFOeOpREXAtwEy1E0Es4alCmx2al+TChyaxUGDQm14jvNVxeh5lPeuQccTENVmE
	 LO45y124pqSE8w3UuegVXvHurrp76IbFae9gpEwxMZCgxfP8JDdzm0E5eJvv18NSffdzb
	 HKdxQwQ3bxrRtfCDQqUXsEP8LeQ8Ibxd1HplBTkYN/1b4DwmvOXorTwT597GZhCzZfIXJ
	 NOLhfF2Og90GUF7SSFO8g1KMox8AxdKvNzxhG8pfMVij04Uigvb904Xqlq+RU+k5x6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiJNVLBD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAnvmpZc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4F606A336
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 22:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F4F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiJNVLBD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAnvmpZc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JM1TE678123
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 22:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=; b=XiJNVLBDT5jl44bp
	OssmIgb2ksplpqtZfiaDYzPpOEbMMuWqlBrkzQ6mz6ezfHQY1WaR3gaqXnU0tmPA
	rs5KZY/F/0QL3Rk4c/MPsrjhFfGaW3xcSvdiFY+mNOMkMzO5WMbeNIw5NxEOE72G
	xL9eAr2HIAAcyBlnrACwJ1C9Rms7fSTSGrtB77awrd1AHAFeVwMC0waQhqC6nCNZ
	/MoTuXMbihZRV6K+eO0Q0N2YtBDI8pq7LjLTTcxXaTMa4zMuz0KIcsVlbXDuPUFj
	/rHVGTjlQz6X7RPxOI8ARA6AcYY0rWkaqdscY/m0RnjLuYw+rnO/PPb3lL+VYRyT
	Y6FvGg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsn03rh3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 22:02:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc1bb97ff8so217061137.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 14:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002526; x=1794607326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=;
        b=bAnvmpZcoyFVaSHwcfuVCyiMO9FYIN3ULUrdGJfWTodVvDcXCuCLpEaWRFHvVZYDgf
         KqGDofBG1UOAAeB3x8q1XgRQJxLJ6HL+3bsYzI2q9RhLmDQ2QXGmlYBfqhPvtIM79u7C
         vG4kTVBFVKaeDDg+bi4gpcP7pPyimFlwvfRoRJx/FrT4PjOu9VEz9W7Fg2E3/4UEsrjG
         J5Nc2ORQ/lDYe/zGkcxgfg09f7jWs9lTz4Sb07FYG8enzfSCe2jTAQB8+KVWVuJKg+Sn
         HhBjntF/MXKASSIzDC8/S0zvan4l3b8HvK+snUb9hK0RBznD8RWlzu3ZTpFrefxudTTm
         nR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002526; x=1794607326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=;
        b=Fk4EAyXTXk2oaSuuKET0/GNKeYjxHz9R1ryLkQ6oI0zrKJH5USBECJfJaKUprYmDkc
         P7UiRe+2g4CHb/XEE9WWqlq3oZ2MbhVmv8iNsp5TBTpdEhSmrHjq3J6zm8EYke+O+jG0
         4xKHUNkWObw+Lraqy4A5MgaT3I1ch8bd+zLvKrT22QOx4s8KSzKqBDqlXCBUbQXg3vLz
         UD4MctwAwhXBKfY+wjBSXX7ByVDsYLUrdebPyauLUSKM4iujqGxrBESm32xl0tVijsMJ
         jhTcv5TuNXTbLSnVjlEshakgxhP71vJ4YySGJpzYQvpAe5TN011u3N+brcJw1K7tdV1z
         mLfA==
X-Gm-Message-State: APuU4Z+wWOYn/zLb7LhRrNug1m2keoH/3qwB9fX9wFKRYRHos9+0qA8g
	SqppPtR1zBDW9n6Kmbc/aGsVCBNkIFf9aVskPglZouR4+KPD/UwQ6Qn72p6qg+9QMcSN4RmC5rk
	5zjRtdaWM3uAy5cHNSQDis3En0358k307aCU9FPl7ELFztMKb3HZZbvonLUGL+vFB
X-Gm-Gg: AYBFou1GQdoEQA3TNAuj1k8j9IzAgyjXegFx9o+4R3mGoDoWQct7HGgPNAu2MgQb/Nv
	jZSVuW7xN8GoQfhNdva9q5tZ6ADARiole4M/JhEcsCt2aA2x3Rz+hoGwy4aieeVAELP3jrOj2dK
	tX0Ow61Hz/OGQyzWaj41B61Y4VEpyJijOiFQxsQNJf7WIHBws4W5IY3/COIyjEmi1Wasns9YNuQ
	B8rpD0vPRQgRdxBGke2SUhNPDjhQz3GTPphkJSpeDUFn2lR5vdCP+HahltYNCY54ejXgTw+ScSN
	aDmC2hwcc4wdNBEW0OlcWh47abnN6WMU9gMgbXIolJRQktVhwp03WRCxNu2Ww2FJVQddoQELZ8m
	hQe9+k+xCBWBTDmOhQhB12RjViMkXR8Vnueo3V9HPgIagg7jJhrqUVUAqWA==
X-Received: by 2002:a05:6102:3c91:b0:7b4:bdf5:9307 with SMTP id ada2fe7eead31-7d2a1652da2mr1974132137.30.1794002525613;
        Fri, 06 Nov 2026 14:02:05 -0800 (PST)
X-Received: by 2002:a05:6102:3c91:b0:7b4:bdf5:9307 with SMTP id ada2fe7eead31-7d2a1652da2mr1974111137.30.1794002524946;
        Fri, 06 Nov 2026 14:02:04 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 00:01:52 +0200
Subject: [PATCH 1/3] dt-bindings: embedded-controller:
 lenovo,thinkpad-t14s-ec: Add Gen 7 support
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
Message-Id: <20261107-t14s-gen7-ec-v1-1-f4a8edaac447@oss.qualcomm.com>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SyrZGulKp5uKF9cAbNVl8Do/c1rZ1PPSYOPKrxUG4DI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5VQqqtyCWR+3Z2Vw8LNnei0jik/HGY3Q2v6
 R4ut5BUaNaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVQAKCRAbX0TJAJUV
 Vj3BD/9QQoX7PZ6Ph1gTJ6BzTUr0AadAkHUwogPJ3ecCwHFO66kAKQ7sZrmsgQ/S16zlOwsqhm2
 IWZ6qhZ8zlRa6WkNNli8diGHHnjDohSj4fGMrx/vVx/K8/xGQKhsrhmAy0V+a7wYncZQQjWfK6D
 KF4ZPQKP7RqWyPUwFagq+69nnDwfLW0gIVMRfSzM0c9livjcZb0w/K7RSM/GuoUngoXxOFs1BC4
 J+iA+5ccZxS3M1Le+DrkoFhgYHbp6qkaN+voc30CC7D0C9GOeU2Ax5jV1177qUevr6dRb0/KrlN
 2+8bzlF9pi2g756etklwNzkkJFAjexTm1A11UtR6v4M17mYv0W1ssfK+r81llDX1VuD+4SpnKvi
 gp4EapyZhZRVF7/yGqEObxfAOCwCS5TjnkY+RqSxiXUuF3rVvTdN4oXa/hRUSWDqHXfNLJutH2Z
 CBz3QIfYNdlu683QKfCX01T/kA1JmgMfD2e0G71BoklFefWbNbpRsry9fHY2IeY/tvOkgN0mxv0
 kEvgBebZ4bmzYIq1bhLOoUlrKXJB82/HRsXnhzNmaFK/Fw0qQ6m4sa8VVQpU3vIksKs69hvaUkQ
 qo7kA6gVATa7oO3F9wOMb2AT2UtlaRgOedlqQMw8PvspOlAGD9/8fR7xv8fdi6nTp+n0fV+Fpha
 dQZ5ilkFibImSSg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=JMSuIMKb c=1 sm=1 tr=0 ts=6aee4e5e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uZMt55wJAR8SEHwxpHMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX6yvKrhP3V+Cn
 Hp7PugurBLzVr9+JNwCLSRHrAOt/E9f0F1fdUI5pwGrOvBuASRP4cquZXhuFoyGi968NffI5CTI
 /mVgz1uF5sAF75I/XvOs7U3LWeGUjhU=
X-Proofpoint-ORIG-GUID: meLBoJsYh7D_J75V5c9A7y8JSw1k6VZS
X-Proofpoint-GUID: meLBoJsYh7D_J75V5c9A7y8JSw1k6VZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX5INcdosGGA26
 CafIPQPSytjkZ/PLdra7z9JqTAwlLTFtQtDXPXKbvUL5i60u4M9MdNhvPq9CgBQ55yp1+6IeSBb
 p6UoBh2XDaInf5FcRXoxqcj0+RyloB9kwhJshjL9kvVgpHd1vHr5Mkro+Oici+Luf3vVONEVAQT
 pwQ0RkM6R0tj8ry7ZiDqpfFwQ7Svg9z+ZH2kECtLJ4CCLitQ57z4KfwqRHxpIhk+sBs+C1FvSeY
 u/6SMjPzrH6NEKlnmK4tsWe+1C+6AGnqTFb6KQF/a3uFeP7ACqQKjEgCDfsNC9OmHVTm2vTrOC1
 twvUm6x05G9S0r0wszlDOs8QVkFFd6KPBHZvsyUTnV8LclW0CY0Mb7JQ6enj1/YCa6jn8Vy8XGM
 BJE976nl7ZlTKICdC7DTqq9o31617272bR8kVbro6Ct5hflJaewb/YOISZe5liOWthVFTLaVm0A
 CAOiiuPdHDN06yk3qDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The ThinkPad T14s Gen 7 (Snapdragon X2) has an embedded controller at
the same I2C address as the Gen 6 one and reports the same kind of
events, but it talks a different command protocol.

Add a compatible for it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..99e5e7ae3cb6 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: lenovo,thinkpad-t14s-ec
+    enum:
+      - lenovo,thinkpad-t14s-ec
+      - lenovo,thinkpad-t14s-gen7-ec
 
   reg:
     const: 0x28

-- 
2.54.0

