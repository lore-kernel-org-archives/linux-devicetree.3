Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C3B3EB0F6
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938392; cv=none; b=YxZuxhElt8hF4DSGswC6twnVXgriUsLHoRQngQX0mUtEyGQsqdXrnVfCu/1lVh1A54J+Qj5cvtal2Tq2BiQDpw4F4zrQ20Z1plc61CcSnso9XgVOoXZsUOuxcAtBbJevh/r63QvYlWf59EWgnu1uCfIh7YLJRGIg6Y7mERz+e3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938392; c=relaxed/simple;
	bh=PruCi31uA17l3xQol8AUA2PleZ00UnpifNiX6T9xPHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/s3kPsaHho0L+YNKokoyqKF9kPucBw5ccoikoPhwT/5NczpFHSxcTsSaSksyoN2B9yHhyujzQOvWinrmRMYNFm3fPhs/1pb8R4l0cjQ3EEH2sW4/jFu0ufHcwBiAkw3VJzbJ/8Y6A5ORWqmogH7GPdTHmRlpeOJ7wyxR3AXU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+FSV2Oh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9+Ygz90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+FSV2Oh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9+Ygz90"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9da2x953014
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0Xc7w9lfMqsNL2Y6hj+RfUFKDCR0u+BKdnSNLRY+wo=; b=G+FSV2OhRDaOlI8+
	p8wYUL6KJ6b5y9lJG8udG/9boNriv1qLUqCzqD/rQHRPjYzZXA0e63lNWX5k/z/w
	QrCwLDcxaMej9M9fGjxnCJvR6NTPHDgmhaQvFrTTQpz6BZZNRy2WKK9l00ftdQoc
	YjQcrLMw4+WQeasvHnf3UJsqPni9ZseRE3NsMjzNe845kwdC9khahtuBjYxaLHMS
	Co9CRgZFXvBAy58HFwnI7V1gIIhvZCFGuLGjQfZyCU4sQVCABpd5yoRHNK5iWN41
	VfPSVuBR+U2s8EBeC9ZdB1g14Hc75ERZxphyCo7t4q0ZvTn2Hsbz/P8131s6647Z
	DW1woA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g5ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484f26852dso3779701b3a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938386; x=1784543186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0Xc7w9lfMqsNL2Y6hj+RfUFKDCR0u+BKdnSNLRY+wo=;
        b=X9+Ygz90YYUUDXNFDKFNFjfmaRgGBWnAtotqQKXkQKaKB6pZHWYE4h7ZXrEIso3YHc
         b64MH3R+vI32oyqV9AXfteSIaYrkn2aik5Bg5yjhRPyHg57l0/3cSwabHZSKNZLLhUuM
         HJLh4iooFdXE10+dKE+UKxABoEItPcmA3US7w4f6e+7KHjXUV/sDSPRuAQoXjZ82eLiE
         Xw0W1n2mO/0rDPo+IHNYu6J8OY5g0u766FPayb/crHXihvXu60WcB66WZob8cnoyYGWZ
         3HlED8SlZl1qq99ejsZZPwbhx0nHfz+nGgpkpyVeitOfHQqN3UNByIB/L+w2dC8Ki2cI
         HJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938386; x=1784543186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0Xc7w9lfMqsNL2Y6hj+RfUFKDCR0u+BKdnSNLRY+wo=;
        b=hTsbk2xBkln0stK7wy5q+ywsbGzmQJKJury7MQKFgJu42mg3Lvq3DczH8QTw7AZ+3Z
         4lhMh++vB5wp5ZZUgk+tWzegWwRU34g2iphFdPCPf8kRir2JNx4CCWmsBxbDWRzo/rlE
         IVRkxiq9qenG7oV1/tNY4YlSrnd6/czzmNhKt7iZCg9LZ6+8DPNcb9qMu2Y/odlNEPx7
         yIPXIMUZ5wD3u01HhuzzG+o2CwVAfQkfx+ol3uEIjY87ThK8XrUKWd6uHzuoMZOwN2ss
         VNnUcpCfOq2mVRhAa4e5uoGCcOqTJ9o58M/mf1AbmmvU5GNucp5G3/tZe92c/d9bLjS6
         XwzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrog6oq9zsEkO+E/rgg1qE9dXwtB1NUHKlElgtA8vAyE+is3xxX5HspSVtaINtIcnOXK0jZPuuCkx8R@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2fKPOEXvzj+rwvoh0YxAxEbwQworD5O0RWZdlzwC6A7FqEzx
	j8by9qRoywswdDT9WyuDONEO97gDZbSTVU+690NfnoB2e48wuRV8810+bnMFTw63YG8eJRRXzJa
	LtBW9+SSTa0QIh++4E+w2Ty638CZTi1QHWqFzqVjuY1FA872umb51+CG745ec28wn
X-Gm-Gg: AfdE7cnxgduQqjEBf0CUxb118Ti0qyNiuJqMhsl06D3pXZOTuVQtWM4gI7qSrFTQZOl
	2fUTRPLcwX9Zito/oGGjpYstR8Adz1TXtt+ee4D1YBpHsqdid2D/fdAb+MYigtaVeV8xYiSKqG7
	YosY5cJuAwFNBeOeptpcV8WYcWrmLAHnlrO/j7nvZLioUbQNEj2yeoTmYPIGL+W5w3iq6YBGXyh
	if3eVJZDB+ykIPWGg9hHCJ4EOW/zrOp8Bm660wO6uBc9HJa5DNbAFBg31KzmnrMHSHoU5fyGC6n
	fjg3ju4aRFszmihP+VuddIN+RyI2dPoebPXOe4/Jb7CD7LxhNRqok6oNgJedb7PRr+v3YAFX7+A
	Y5PnfOes4ZOWFsFDBRi7RTDmMugBDdiDp7X0o4rax
X-Received: by 2002:a05:6a20:431b:b0:3bf:6c08:2b2f with SMTP id adf61e73a8af0-3c110b6e102mr9319629637.55.1783938386332;
        Mon, 13 Jul 2026 03:26:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:431b:b0:3bf:6c08:2b2f with SMTP id adf61e73a8af0-3c110b6e102mr9319593637.55.1783938385892;
        Mon, 13 Jul 2026 03:26:25 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:24 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:45 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: sm6375: Make MPM device as part of
 CPU cluster domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-5-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=1261;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=PruCi31uA17l3xQol8AUA2PleZ00UnpifNiX6T9xPHI=;
 b=5mmmotH62/6J0JYURi2Dt3wdRp8JL8Eg85LUWFPhuLP2HFgj/JyJEORngwlnRkJ2XQIvnN9po
 wCE5laL3qnoAi2lelX+z548YSJ+fn+k7U/hvvshlilQiBHh7+Zl9X/l
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: I-F1Izn19T-rjrifPzRAaKFx2C8Nl7vg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX7CicGH/d4v2P
 4w+Ouop8YcPU7727k6YD162KSy5cR2Zr8AlsPUgMtV7T84NI4KmSSdD8s8IpV4SHo+oatmTnMBQ
 vYSZlwPhTmTQhV93iffATauVOXsvyFg=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54bd52 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OikB9Wl6BtP9lw8g0jQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX2zDM3wSasoWB
 uPDyOsiYhuLL9YONI/6tNk7H40Vn8NIC+ZJW7mvR9E4IPD67rH421joSp4toAZbYnDJ/9P+lFem
 /07Dl5cFEvoDH8Xkat6BH4XRsGhW3l8mZ3t6TmDbMYkKNr1rYCSFw0sKFe37Jv/F6B1CM4Fn6ZX
 mamWHs0OPa6BkzSA79ADU7ed+HOtzoC93k123xnb9IjI/WnKTMmH6LwB9/ejO25PpzhLoO+YcTV
 OyC7kzqHPX0E43Iw6CdNmADEL2pxxyu+kVTTpVozjJkge1nvqu3V35EgRLsc0Fi6z9ds5h/SHYX
 8ZRHmiE6APVGbQCrbrSgw3FUQQRoKNdz9IvGE7r2QBR552WXYhE2HpSKOFZzGNocSkdCj/XY/jS
 ygaklekS/h5pqltxGyFW8ookeWRmkiNldl1Ld5oM71JSV110N3qXz2sO3PXuEb0pyeBmcJC3vjd
 Hu/HJj7zNhSD4WXdpXw==
X-Proofpoint-GUID: I-F1Izn19T-rjrifPzRAaKFx2C8Nl7vg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

Do not mark MPM device as power domain since it leads to idle-states init
failure because of probe dependencies.

Instead make it as part of CPU cluster power domain to allow RPM
notification when CPU cluster goes to power collapse.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ccf572bb1549bf6b86b5232be216c9dfd51bb22d..5f729634e1d9b21deac42f9d55d966e528473202 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -318,7 +318,7 @@ mpm: interrupt-controller {
 		mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_SMP2P>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		#power-domain-cells = <0>;
+		power-domains = <&cluster_pd>;
 		interrupt-parent = <&intc>;
 		qcom,mpm-pin-count = <96>;
 		qcom,mpm-pin-map = <5 296>,  /* Soundwire wake_irq */
@@ -505,7 +505,6 @@ cpu_pd7: power-domain-cpu7 {
 
 		cluster_pd: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep_0>;
 		};
 	};

-- 
2.34.1

