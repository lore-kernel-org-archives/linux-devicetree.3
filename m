Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC62427F8B
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889577; cv=none; b=Uu5WxQX6ORObfEtpMWU47q5sycPzeHGugUNpbKCmlirJ/vdqt7p7re18g6XMnYQuTpWA3BOg5wvqmjDWCte+A0MloG136ImzLEny8cS6NJQVuoNP4NSQZ3qgVyCP2mpQJ1gZNmuB6kUcRD7kqZXYPQpcg5khn9ec64+KtexWQSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889577; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5ANRKNh5HibxZSDOa6F/DELUWR+LWP0/wDDSsEUKCV2vORZy+58OJaeka//vvVZnKdWKB/l+dIhwbo74TSx9TAEevgRrCctTnnExLTijPYjZUm4WjnMzvZiOh/JAPLYemSy25gccD5I0XREqwUgmsDGXWrrH2ITTLgictzgvZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGCzD5Br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dH2S4nCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGCzD5Br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dH2S4nCC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADNLB3889169
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=JGCzD5Br+5X+EDBTTTZM2xfo7lX
	Qa07ac9cxKNKVRAraRsAz7b+Zvd7MKOSObOVwnRrXY6TgeymZKHcv2x70b2d9wjI
	WoU0frIJbbTh5q0oMWF5/gpAl/NyNQ4b6FimwUPSk81gwsEY21kp6WZ14Ipf6IH4
	TSZHoS9VNBU2vyVnYYA26FcVKpMcMw8lRHypc8hyfCTII/gjgWCzjnR0H/nfvlro
	x9A3LpaL5oLMmKFi5LiCjMG54HrI16/EYkGt+FC0iVeE/M8BsSWxbXQaNxN/v9qQ
	5bYoFdPgYPADa/QgO/oaygR2y6q/ZNaLPwY27HDs+rjYPp85Rc/3YBpss3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5f688hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:39:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so500647a12.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889568; x=1785494368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=dH2S4nCCXumeT8Xx3CTxtV5uh29BFHD+B5vsc+rV9MPrk8bFh9JjaJxunBwXXgPKkC
         mYuNyP3ElNsKu9/P/KNLQyEzNXRrHuHNuAzXmuQIN7jLNfuHIMI6G14fQgX3OAmCnTxe
         cPEvdOY1QS6poHLVqfxIOm4T3RSRyPibBS/ebD9zmzdzIfu77I2bjTGaUCV+TCbgIhIE
         kN73um/8PIWGyQae4N/kPAOna4ve0sI77k6Om6v2Vf06h6yqK9Abltptk/Hh7vWvIURY
         HSp1x9WMxcXVHduakdnZsRH4F8oGNisaPvGOtVTaDGDOac/WZXqhgOo+Lpyn3gefD5cy
         b+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889568; x=1785494368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=XkhVXKVP1nhsoQdR4vRWOOBbmsN7Ntqe+LjBsPdvbtAQUFDfDd57y48s67hMjhMVrA
         iElOg8g0lE53FcpZLE3h4l8FAnhvW8d2AwJeLsWgpOpp2A9JyS/AirF38Vanj9fNX01l
         5vdiLhl+5e9q/EMw2St6AG2Bvx6dgoXqPXJpZy3MJF3u3M38U+sKul9Hl3Ii8w2sgI37
         Vv/ciNJEqUzaGOFyDHAowCL0xFjUiKiiLdgcGssqTTc0skQWZjm7DuluC82jfwwkkoFC
         oGmf0Er3pq/SD3Ic83I2wyplglw0C2m1YuwhCrUF2Z5giyJLxVL/r6yyMZLHQJ54J5VT
         wmKg==
X-Forwarded-Encrypted: i=1; AHgh+RrTWbPdSg8OwajJ57831/GhRNyBY/yECvzF2eGZJ3IInjdx4o81sXHRWa7Z/xtGHVgfrbDbvw7fKWaa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm+aeuyqH9BoARVDlqFFsK+VUOAoHLNa/4VgBqUY0PnUJ/I1dt
	IykODlnCPlriyPUPi/Mi9G8FEk8TGtiQ5V9kA6rHqEjSHULH3JnLRlpVO0kTSD3tRVczesMdiLd
	lUFth7QHz6vo7uZ8hgyTJjlYsxkWxo2hUt8ZerBzRhvs6yfPSHrVv350GKJW80R3T
X-Gm-Gg: AR+sD10npCkBi4UiZlDa117y78RGA35aoRBukqmK0XdrivsnOA5h8Vl1yePEIbCGqgZ
	TuLnhyTlbiHh/haX++QBsO0cYD9bNBQha3cyA149f6Ilq0NUHTG8LhCikeVb9lHMekj/hNQPFTl
	uuC1WjUzhpw49xxhuLlo1ibiQpDynxK7J+86ygwOLTX//TNaIMkAPvqQltxcSDEHKkd5Wl1+SBa
	CvdyDEV7hgiQfUEQcS8b8ehE5E+0omjOve5ZpJcVnHQwpFP12agh+6lBZjs6rzyKTR6T/4SzAXQ
	oXYCG6puwfH2h2scJ+6NtI7kcjSMb0eBhzqx85YQWb555W96F4lyazAKknGCpzzrqYVykvbXS8h
	KrM1VaXa/Me06COrsY1wosOTPQVuF41Z2Xfepom/5FG+KvhVoeTJVegGSXyhf
X-Received: by 2002:a05:6a21:3994:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3c44b1c86bcmr7905254637.44.1784889567675;
        Fri, 24 Jul 2026 03:39:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:3994:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3c44b1c86bcmr7905219637.44.1784889567200;
        Fri, 24 Jul 2026 03:39:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Fri, 24 Jul 2026 18:38:46 +0800
Message-ID: <20260724103848.233804-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX9m2TajQcfinb
 3uhhTWn/r7XbEtgh0oEvtQbUYx5vsk92hSV2fTucaHtDl1DU709rsGj6munAVOPg1DS489UUtvd
 nlL12A1w9ARp5plrwQZ+A1YQVOKbZqg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX4MB4oy3UWL1b
 Ri4gEGA0/UIQqDUhg2nBY235lD2dJFMiIkUMsW40l9t/ATQqCshQu4oULKEhQs3rlue3/TsWA+y
 KLMI6L1iPPT9vlsszw/OgWFre1T3UCzNmddViPKg8jS5QEelzLnrGyENDg+iVgHwKI4p+gXo4zm
 oGefM3ITzjQ5k44ObpdeH9qxYzbzbPsIZXpyOz3J8j/rPeEoYLkSbD+tcB1hSsw9HYkbjNjj5WT
 4Fp8sAnmllHy40/RFiFwbw43hYUM0hiSjl31ldHu7NJLalaKYHEPdYG1oCuB1FlVlz7gNu0QDCy
 H1Mmt0sKeaGhk9NEpF/49po4osp054uJyldDFRhdL6rNiWhTyyrfq/qGHG3uRpYlhb/MRoN+I79
 iGKKjfy6jFHvunbLeD9355BUyq8T5ADAQs7ABDszZh2kvlJ6UyIFVTBZWjrB2Fg47RAyv8aoeBB
 QZWb5NOWMFCaBbrDSXA==
X-Proofpoint-GUID: sxCgGiP9rOEaswTPCoiuOJw1ia_2k2-h
X-Authority-Analysis: v=2.4 cv=BNeDalQG c=1 sm=1 tr=0 ts=6a6340e0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: sxCgGiP9rOEaswTPCoiuOJw1ia_2k2-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 9f9d9bcb66c4..d2ae2ae87a95 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,kaanapali-aoss-qmp
           - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0

