Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CB23B19B5
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 01:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523673; cv=none; b=u4Xj0Uy7nBzxvr2FM1HZ9xUMV8SHIihkg05a0LKsnlundMeDdq8Gze02QIJ2wVU5AIQdx1ac5GrYPW7LSqeWts2XHZm+N8eDAAiG4/LWMtrCF/wY+jAaXL8f5+eGAPsuEnAs8IMh2Rm+ACjROL/SlVyQwoe4SkK300fre2v7500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523673; c=relaxed/simple;
	bh=Yua1P7HOLr//+nfS5FhV9LxvTfAlypRaR3BuBLhi3KM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvPq5SSiAXvEqJPTRb+PevFV+4s9ExzEUArnZBoSemYRXzc+hRN2EfB08Xs9RKeTm9HKUg/DlEpYL6lnfkrV6VUkoVcg0ECb+OXuPL4yp87k0Y9CThYb/7lZCDnzebTFUFOMTz1sE/bP2DpM1W50gBvQjwCzO3I068NVBYvw9q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIx6yZLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxzEmjIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIx6yZLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxzEmjIt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYnfQ619815
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 01:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u012WehSfJqgxWGj1C4O/PJZFi0W7Tt3kMML3xYLjRg=; b=cIx6yZLs6UanwRK6
	dd6I6ssHu5g8URy3x9TDwbImLRNi0R4r/PjPTPPbGy2zv+UxjdlAM2aSgZ9nAE+h
	wqRMaOuoyioVtpGkyYBBmwiR/lN0ApUiKRd93k7cuP9lqq0fEYVuVc8/O6AQPp6k
	zvSpeW7vuAT9+ql3ZPBqsyx23GFKIbq13OirfDr86Fs7ija7v6mZSMGt82LIvVcd
	EYdTQaufJsAwlhWabmt5Ii3JAVQcEzbwLrIuTA9BzNWNim3o+IpnSlGAdJfO7GLh
	a5ERKSdV2ZnBRQ8F5/TYpn3d2AUYUrIclSar31VD7U/V9GPa935aaD2kyY97awnC
	psEcVg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2m5vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 01:54:27 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c734afb8deso4570296b6e.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 18:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789523667; x=1790128467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u012WehSfJqgxWGj1C4O/PJZFi0W7Tt3kMML3xYLjRg=;
        b=NxzEmjIty6NJt6CokPVxCRatWEdzXP56fznJfZYg3zcHi4Pd8eMLknIG4kW2yk3lVc
         3R9t2of5/PM9JGuurOm7OFZiDIFydXU9sDtgOU0WRVgeEWI8UV0SXPTGk+ir0vFYtSMq
         F4LRz2EGjCE+yyjEGkpC+hBL2Wz2HcfJtiHJPSXxMkUECNhnXyTukzSZqnibpxd2ee1D
         mQO0YnjK4LD66zafgZMOxLxa6q58peS05pjlkZqLKVdnmD4hZiXzB/f5h6q4sseYODB7
         Z5urcCcoqNBj9JVzKZdOwEMD20yVTAA2Y52i4YVUEbaYBOD99uWLpIWTfoXs7Pl9eq67
         HU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789523667; x=1790128467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u012WehSfJqgxWGj1C4O/PJZFi0W7Tt3kMML3xYLjRg=;
        b=FFSgD1h5HOT9YE2NIAudAar7LzhuEiohHfNtmX9BEoxSovPU3qYYW3QZbUDXoLSSBi
         I632I7M2w0vaALA9ii/6P65jn60xa92F6nYhgxXaRfoGxEhl/NGJOR7dTWrOQBkW37Ix
         2yzfvH1lmnvBad6z9PGVrDfh0Wh1Jnnw59OP6joFZdnryOeVsUAKmyOTR/3e2Rxt6cnz
         xs1n5baSpnEXFyBVE6BklpcKLfNUoZh7ZMNR9gv9vwC01cBb0GkH1enSIqHFvjZSySQQ
         e5UugOck/Lxl2AEHW3SPrLqie7X1ZSGgIgjiCaocjpxqdFseJ2FZMYWlo/jLFk9D1lEX
         elaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8RkHX9DnR4Hqo9j+etS6Ha5/K0BSmxf7UQcKcqepmZM1B1kpIn65Wcyu5lX4YdCPuaP+CSZPJd7al@vger.kernel.org
X-Gm-Message-State: AFuF++mhmRKNuyaciUwFmkim0W+aRuR2TGggszShi8CKkVRmUMvROLJ4
	ul1E4fn1zaAUPq2nWK5ULK6rg6N/UZVvrp+0LMQKLnZatrShDxAFFIIvMsG4qAhg+gp3M0zHUAP
	vk0e4RZZ+BqiQSbhe9+Bao33VkQPoyNpX9OSEJKUt0/Pvl+kyiZ/zLAybpceodNNF
X-Gm-Gg: AYBFou0O7XcNc+Fn9PsiQN4jH6p6sK3mmGMAFyZR8UJ4JXfiod6cMG8LwSB7l0ZbG84
	Hnrmx0qlztMTPqTyU7bG7tVtrLkfS/u81PXrcp41YWvrufZm1jnEMmYM9ZSWaUoT2Hj8RJjifaP
	cHlr1XW+MLxWjuzX0uzWOILhQaUG7YUUGrS6d17tn46JsT3Hdvu1Tzl+ItY3+Zc8qEsvDoy5XiS
	jVcNq3yEpvNddWsYZLPExrHUHsDEwvq1vDiwS8XWDLEonogbRixg1mQnbU4Nkm8ZRUmOQKhNbUg
	2NjKdJw7Il1fR/S4ZkcSWaYjK6Pw+IyovHCkX2EdaGD14DEk5T1w9kT0ov5iWJ79MYLZ+0qtgoM
	ikUEdcbeQ3f5T/qiBKaun578=
X-Received: by 2002:a05:6808:23ca:b0:4c3:e608:ade7 with SMTP id 5614622812f47-4ca49dd720fmr1306975b6e.11.1789523667349;
        Tue, 15 Sep 2026 18:54:27 -0700 (PDT)
X-Received: by 2002:a05:6808:23ca:b0:4c3:e608:ade7 with SMTP id 5614622812f47-4ca49dd720fmr1306935b6e.11.1789523666952;
        Tue, 15 Sep 2026 18:54:26 -0700 (PDT)
Received: from [192.168.86.45] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca1e09ab74sm1283039b6e.0.2026.09.15.18.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:54:26 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 20:54:22 -0500
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Asus Zenbook A14
 (UX3407NA)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-zenbook-dts-v2-1-41de8669a7a8@oss.qualcomm.com>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
In-Reply-To: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicko van Someren <nicko@nicko.org>,
        Chris Pouliot <chris@pouliot.me>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Yua1P7HOLr//+nfS5FhV9LxvTfAlypRaR3BuBLhi3KM=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBqqfbQZlsXvr7Zsexovx4wODws2pw/Sa0lsQkyI
 WwlHbRktdyJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaqn20BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXAHBAAnPLTIQw3s5khvO6OlJFVSFB8qgAAqXlWR54tpf8
 q9SUAmc5pZZQFyUTQ3o/kYJsFsGvwtdzkPDWoRQEvvop5pThljmgxj+Pmcmbi+Au4vD3NM0bg9I
 14WjDWBGmxx5zz+4RlLprShnyhoRfh3ZM+8WvaXn6jZCTUP4/OdEZYrZvpPKbM0GmqD1dXfO3iC
 zdCQ7pmHY3YyMyhHM0rPvu4bPrRcC+cbu47IOLBn2X/bW3FpkFm5WNVctB4WxJFzpA98Oe6mVr0
 cbbn+sKiVBNBUj8TzcEJMx/a1ggHpcU1mG0zV6si+Jm2D5ikIpJ3kkkHc5hqacuQaTfp7CuUMV9
 /t1PViaW+yRlNEvrCOYRpkXzdTE/FQBO51FiQ3UvI8JG0dOVqIr8PHBYSgcDfRJmedpfUBZQC1G
 Txl0qPuLoilnwVuNjZOHbllBPs2P+i3ulPOKEhKWpB5OpoD5DivmlL5+kR+XtJH+KkRm49W21ms
 BU5Mh3HTdm4PmccTpDkG/0LTb07/DlfSgakmIv1wyTxBypv+WmZ++CZ+MHrNcckEUoO0J5BGRq9
 zdolO3gZ5YloLnOK/1BGpcTtIaQlaUw3ETGRHZe5Io1uHLNuSImJMmc7rWwF5fuKnWl0LiyPZ0C
 Kk9yjXMCVuZLjLsED2x5ZlTBhbyb1QuSOTewLGeLEIkU=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: dQHeWuJQkPOrylXX5i04yAgw20gbIG_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfX8wF1RalQW8zU
 pNzpm8BkZ7KC+4sacz8QwOGWvaSgZ3gmmv42sJZEfn1pcCG3kSZVVdkgTIkVT6gqVpffG+iUbNh
 c6VsZBk3W08rhtPf2fIOf4JilKPIwNlChxXR5EBc3k5etKQKdl7nanycmgGqCt/m2HLFnkTQS43
 D/+UOsj3jsU2tPU4uvDHEqpGNLwW9ZkdecjV45yrV+T7tntx4aUFVHhFPp5uLfMVxccY+ER4fwP
 W5Zhf3Ay06o4Sx6mvP1aX3MxNI5Ia6wr1ao1/kujP8ojojVB3gPrWyhPwVxcGUkY81p3lwOy2Vf
 7oERoCKzfutv7UydI7celK/m8VOdagXMTZH2teynFKi4zQepF8VlAl+N687ynrZKz5RRePrRfVA
 GK/ocUtLrcsWJdw8YfQ2dQgYpSCr7Zo667O7p8t9zG0iQTyEzPtmp9sAITNyB02BKBaXLQWm7Mo
 4Cjn78ycT5YQnMstWQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfX3M1QQA8nfWo7
 7JjPu4eM2k46fcYogcq7xF1Nei3XFJcnfHnkL3hzBM/QCmMtqW+TsZJJGr+tOtsVV1jPjAUvzQX
 Gwns82TUs5a7q+rUcxh9x4gcdQR0WS8=
X-Proofpoint-GUID: dQHeWuJQkPOrylXX5i04yAgw20gbIG_m
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa9f6d3 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=-Yt9tNsTAAAA:8 a=EUspDBNiAAAA:8 a=WzdHeGATqTO1y9J2u-kA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160024

UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, NVMe
storage, a WUXGA OLED screen, and the other typical Glymur platform
capabilities.

Add a compatible for this machine.

[1] https://www.asus.com/us/laptops/for-home/zenbook/asus-zenbook-a14-ux3407/techspec/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..cf9d940f7371 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -86,6 +86,7 @@ properties:
 
       - items:
           - enum:
+              - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q
               - lenovo,yoga-slim7x-gen11

-- 
2.55.0

