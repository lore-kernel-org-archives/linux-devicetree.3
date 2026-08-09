Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562943A9D8D
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 07:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260461; cv=none; b=fCZs1cNSKbQLRB/mu146DC51dcwMYzWX3PE66TXuuk8RqnXXJ/BgKpJTnfbjlOGCg702+iJdiDmXMJYsoql8VlVTt/jxVVXPZY7nhyxtjDKk6JW33qY1YJauftRLTaegRsEq1rr9VQ7j4gwm+Jv9l7Vz+zf1LKX2UxNMW5x0So8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260461; c=relaxed/simple;
	bh=LNBIpO8YlmU8LnGjVMIQQ1LLyCNwo3UxtkG0WCQZZAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWxdjMVajnsgojwojhxuOcLko5GNRq9HNVThBqBy6aqHyvASGcP8F1AdQh1q++v8r2UzwSk/oo32mel7G9+uYQSw1DOVHJaGM+Vkm5Hlgx4unTxWjHi1dr0qkrTgsE2Cs+JdugpBFb4VyW4RmGVNVqSZbolPH3s0hNAXiI2K4jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbYRz4Yr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDOh1xnW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PbYRz4Yr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDOh1xnW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795deKB2226860
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 07:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gp7+rk2km0FTW4mM2l31TqHymR4NZfnFvVfcldPGV9U=; b=PbYRz4YrZ47sWa28
	PYz7LYjitr2U1kH9Z45IWLkasIrG6M5vGkuP8MGlYlY0B+lXXRF52G73xA3xYimT
	yEKq74TBAAgplMk8ctHo25+QP2WfvTB2Y7bgGLChDuSNZcMQKRp8j3WZVQ8w/UdS
	ulMWX5dKnbzlN8ArLFe2KMMqsTOSUWwOBhxZVq+AUJ4GY5A7M0s2YfXGgM2RNvqA
	ahFuaw5+ftNDythgRjtvrxFYtBlOnmpgNRn9T1m+07V3RwsO3J6iiZd6F+TZyXKY
	LDmSD/hcJ/Oh3qL4ONKRJ69J08RE4GWqL1VtWX8ttQtJHcrwCge04hRYcROPGaJv
	lz/ZWA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7ajts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 07:27:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7049fa552so717928a12.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 00:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260457; x=1786865257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gp7+rk2km0FTW4mM2l31TqHymR4NZfnFvVfcldPGV9U=;
        b=aDOh1xnWefmemU0CpDyW6oT2ls1ZW3mPwu5bKY3/D+cH9MALm1gvihXK2n5MsP7ZXH
         wPZweQ2f3q7OWV5AYhRsLfr38LOPdMMGuA+tuOmDm6Oyq1n6I+SAETg2KDD36tuSfEIY
         vC07CY76KkyOLOhJ6dqn3EhdafvohODQ/AZPCRRF/u8mZ8vhzYxRH5L0uZQ0hsQDxyy8
         2Y8CmhqKy4w1/PU6p/nLGH+Q/tnj+k13ld2X5DFK+iIy2ijo70pSqXvrdbnORbfh8aLa
         0wWHHNBWfYw5oRMO25ordFIMEX/dhM7mpvURc0dprheq70mKZc4wtZX52Lb7s8N2MQq2
         b2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260457; x=1786865257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gp7+rk2km0FTW4mM2l31TqHymR4NZfnFvVfcldPGV9U=;
        b=M7O/nCHZnOM59BktPp1LlzA9wY7F3+AtnLuQUk8NsYUN1Wf5yO35/nzsfKff8jVFIb
         NO0VAOlK378uz3A5Lf5weoweifkAe1R3p6ioDCkLcf3P/L167dTsWxRytgn9wPHipgDP
         YrSsze8h9clwLRcFGrByPwJ3EZd+bKZMwjrgwehXJliHlLEs6uCDtccEzfSHjzELN5YV
         nieWFJUmSTj500ne6sE2i8icub5S/3SkBgxjs7NqpyW6Eo6BXEsGHRbz+Mp1lGDmwpxq
         QjE2ANP1pWO7yWUf95/0UgkOlCSNE4e6ekpMppX0yN3llal/YagRMhFz3gQBPZiJpiqF
         OSWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpj0cRYo1Lzz8bMGhj9zZgltw9CW9YfWPo2/SjbvIUMH1158WkPUHCAAJ7cN2MsJarCILEy0sl8JsOV@vger.kernel.org
X-Gm-Message-State: AOJu0YybWNvroo4EZMafjaV7l/HLKcezS+nkjimLwQpE2uXfdGYQLKj/
	foGkbGZK5v20dZ4lwxcsRXcV3nMf11A15jhbzJ0GePO/eX7iOJ2zgpdMfoOCj4RzvlBLdOfHIAG
	QQyVdsBr5RoyDwK6Oaw16yfjBvox4/52S1gtLoWIXdi6L/b9ZD+vDGwaTKcaVmo/Z
X-Gm-Gg: AR+sD12ya7obL7rMUxL2NqIocGocI3K9iXhl0fyQKQTGpt0j/lLqxSx6nHQ/l3FSuAO
	TUr8Bx6TaDsxG0JK3z424McSZ73HcOSbTOhQElS4nbF9A8OzaJuHBNSgW73VUrM7sywajYZnNTK
	7BeJI/R9aZvmO8OGTZazG7wVuy45mDNKdOVKJ8kKMAyUiYad2VH8HiqSFKIUkJAudHaEJPctIjN
	ccs5x+oqSUHRZwIyJLYd1iW5flfhtBZ1pSi1yH02kV5E/u4teRe6NgynbhL41rPuTvePCGJXVzj
	BFcJFEGjXnw+AmxLWYAcyioC4vMaJ11KCMUQqkL8TnpVAO6pHhiBzljWL2X7utjYkZN1h5xDR15
	nKxAisLWtbQsYQmeCfljigYXQ9GNTLvbipk8+Ro5rULA0Nm32DRhSgNA1sCrTTrSNlX+gK0RJyL
	hTQor0ptTURQVHKbgQNByVbKk=
X-Received: by 2002:a05:6a20:7349:b0:3c6:3c5b:f2e1 with SMTP id adf61e73a8af0-3cbadcfcacfmr21168699637.32.1786260457156;
        Sun, 09 Aug 2026 00:27:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:7349:b0:3c6:3c5b:f2e1 with SMTP id adf61e73a8af0-3cbadcfcacfmr21168679637.32.1786260456752;
        Sun, 09 Aug 2026 00:27:36 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:36 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:01 +0530
Subject: [PATCH 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh power
 domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-2-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=907;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=LNBIpO8YlmU8LnGjVMIQQ1LLyCNwo3UxtkG0WCQZZAM=;
 b=hZsHC+WsZClS0OIaLt0DUXKuwB2s9nP5YvhwyO6T1+SFRW64Zysce+E5xSWfxb7i4fIcbuUMs
 B4ZZ0l8naEkDVAqNOvmZR8yXa9p8/x+ZMmSgSvcCNc2e1plh1kjcZJP
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX3VmzYHbybVNR
 6p0KqKW02bAr0Mbe4KjDMifnEWs97wy2MDZmUz2AeQrMJinxq8OfXg1TWai3jBjhEj5rf+dYZ4Z
 EJ3LKS6Rp4UhAyybIgCBakU8PDNKWdA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX1YwcaJy79/SZ
 ILt8x2a5OCdz4ys3HqRHJaMgTsyh9iYteK+0w7bjKz6OE6tjbtfNhvgs+zxMFCCrV0tMmXJCSzX
 rb+kfwn9vNOI6kdnCk/adaNxJ5scDiCZfSk7s8tcqRnnbcbW0n0ldXE9U1KKR66Z+B9vM/9aSlu
 C8ekujG/aQdB3+uqrWwp4AXeuBfcqWvvYbVCnA6W0AA2DKxNhPIdSHFYaFlx2XSfvF5D9kqbJBk
 NSdCMNLXPS1+eWtAJUJ/J6iut44GBYeDi+8NiTw9upKgKSnv53zfYpLew6RV9RWiKVWHGFaNgz1
 xZg2EVJAfp/OTemdlap41aX7CX46P56SmieQxKrGbASMpgAcvhyqdxGajLS+pYHmHuHrbV26j8D
 ljP6wlSHvAa8hY69x4iLcTWRJQybpdcjmbLxgPMueSEtyQYwA6lCZf5UEyiliA9Wxqx+xJS1KEp
 ttgWgLwv9uNFB9fz5lg==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a782bea cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CqUemxG38hpKZGC-8HYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: z8gIN8466EIByM19Za4jR6Awb5NO4KW5
X-Proofpoint-GUID: z8gIN8466EIByM19Za4jR6Awb5NO4KW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Document the qcom,kuno-rpmhpd compatible to enable DT validation for
the Kuno SoC. The corresponding driver support is added in a subsequent
patch in this series.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0

