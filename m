Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF689513549
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677912; cv=none; b=PjwdSGLJVQc4xHBzLvgjhwE9DCKLkIWtvQZ7XP+0u+sWCGUZW2jmpsX7BFPiWBQJwobRFWVQG0Hi/fmFcCi+dUInFyLICQ5OW002CvG5l+m1lXB+FsZhQTY5a9fUDmZrF1Zsox4Fqqaq5wP5xaZwLfoOzpz4YoVaZmnFYi9RXWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677912; c=relaxed/simple;
	bh=BrnO3ltS6NV4yLZtRHYLLWfpk7ArO8G+eEJqckc1+jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6IveGA+D3USJMRK1eVia7Hxh7EazzqTlQ/Mjj1kye97vPfJu3P3msQ90K+2EKBW7p3iQi5CxwbVBjpsAGwdes/kQbzCCYm1yXSjj++OTuq8R2sGKLhKtGqKdOFUNI8u7fjFAXkLiIHlab+0IquFFLjzm1DsVherOBdHonMFF10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3i2SMJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJo+zuVD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3i2SMJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJo+zuVD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TfwQ760917
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5QaZCWfUf8xqRpLFDNwu8eJzJAbsRzrLuo3gbashtw=; b=U3i2SMJsAl7uJ+W+
	pt7ZhXzXjgbPcQSMJqBB1E9OZWeoQj91SLYBR915h50+cG8yzg9oXdE37OBdZmjS
	r/saB70hsbGJBO8Ad9+8m3tiVAlZpz6ELXQNzWVxkq0VMGtNu252Wz5CKpMqS15G
	uY0LTFe5v0zU2Hm08ifhKjbhrMvwACaJVnXz2ux48t0dG+Btdn/E8ytRO8l0/2+6
	Q5xy+LQuW1flJ6Nag3V/3zvADn0zwWEL47BintFK6FW4C5uwXTNLlyIwtlttJChU
	M5whmfI83Ogvfmn7nK2UQzjzv3G2iGxu4e96BiUYJuUfXuD2cVONb4pojrhThs69
	KFF5cQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03kgwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so3982047a91.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677893; x=1791282693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5QaZCWfUf8xqRpLFDNwu8eJzJAbsRzrLuo3gbashtw=;
        b=BJo+zuVD6frneqN98in1ktjZzyt5Px/yng+gdPx6s5d3fF6fa9LC4XETdgozf2mM0B
         qhEIa7sfswCLzIF2/rtfSpnWtJumYOt3AWBXwgUVHuMRnMi0TcDpdhGAP5Y3IuQE7ai+
         mhfPG5h4XeCM+DVbBl9OqIZdahpht9bqoViPMP/cbYuw2qj3EMmr4jnxJYhC0UzYSDTs
         7JVAizMIJo9soLvg01+G8xZNFqRD+9fEvZlx6yaGjoy+RnGIcFISB1sP+eyLYhuIqMtf
         iHmZH1akclxUzsPOGkV3zjv9wgWO1dtbcJ/oSQoCf7bQONAO3XA9fE3l4tuFQaaXLLFC
         OkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677893; x=1791282693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5QaZCWfUf8xqRpLFDNwu8eJzJAbsRzrLuo3gbashtw=;
        b=YqSzagkFpduy5Y4RLBQh9kBoClJO7biJGRZDlmxa6PLY5/N2KEN3XoKHRLAp5CZPfw
         RgybAtX4vLYcanPWgtNAGmhEpjn+WRjC35yyvptmzWlGH1VsLxtSM79E4phaHTAilA+9
         b5TX6LwnQVkK9ffWz2IduyrDXddReVwRhw8987MCkRhZddbVAAw9zyeeZdBgd18kSZu2
         fTKif7Le56RQWc3glxElChQi34LNcIdbkO1/AwOc1YBAheNbJ5NTblg/CPeZsHBu5cpc
         DzdsFWghJ9qNEvBVl0tguzk5JBX2eNWlLuQ0Ew8B9TCrRR6o7+dk9q8q1eCcOemHWuih
         APaw==
X-Forwarded-Encrypted: i=1; AKwUvByvEuxwWvxIM85jeG6dk1vfGVwlOgEfx1Lj/M9pcVLYl7TVMCDD9w/+wmO6nAg50hPkrwOoqeSMW/2p@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2ebuR+E0dmKAZCAz0DL0VNa3+yZwsi7Bont1Fw4/d1ajSbPi+
	P8oN9zaNYZznAOTnfnFWcknkwki+tmj0Sw5G0MafwzvtBirwmq/CsFVcjgb2l+yzk5xA+u1tdb5
	VqKKBxHfr2ZTEhM3w0aWozJxlulH4s6wey5QRvPmcvq060d1yQtna2qEfQSqgIkeS
X-Gm-Gg: AYBFou1vuMBTt8lmRF0JEvPbmhEjBbOaCH7fkf3hal4l/pQv6Z5NeYKBTJ8NS8pEVmt
	9scSDXXSHQQattkbm3hNoHnNxl8o+pIZWLrGZRgkKn2OOXVu35dZlwbPhbwHkcdMEml+o96jKok
	9UwNQiSB/FvsIgwxEPUnTNdKFiZ0hPKzvx/2gOE1BNgnPahrY2nvY+3D/qUns+nNwaJRJImRtQm
	OgnN9Ss1KYhMJZwLFHAHM0PxR13oj/XidBBNbWKYTVmDHHKrvj9TpTtUiy37nwq3PLlJCGdzNQO
	pU+08slVnrFfNBCJrGhf1gvFi65oIGXfYIvACS4mGCHzW0ghOUIWf30YsFdAGAYSfw+4NtUhZ9H
	73iSugh7nTO6i2A==
X-Received: by 2002:a17:90b:55cb:b0:3a2:a185:aad6 with SMTP id 98e67ed59e1d1-3a2a185b31bmr5704051a91.23.1790677892860;
        Tue, 29 Sep 2026 03:31:32 -0700 (PDT)
X-Received: by 2002:a17:90b:55cb:b0:3a2:a185:aad6 with SMTP id 98e67ed59e1d1-3a2a185b31bmr5704022a91.23.1790677892407;
        Tue, 29 Sep 2026 03:31:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2470791a91.3.2026.09.29.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:01:21 +0530
Subject: [PATCH 1/2] dt-bindings: watchdog: qcom-wdt: Document SM8750
 watchdog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-sm8750-watchdog-v1-1-ea06d5dc7e54@oss.qualcomm.com>
References: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
In-Reply-To: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790677883; l=838;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BrnO3ltS6NV4yLZtRHYLLWfpk7ArO8G+eEJqckc1+jo=;
 b=QPEuGA8zylMoc499k6xXt9YD+6EwzvyphC/Sf5Zqh+M+hgR/vVrhTgYHlFi7Tkq+nUdFnFBAx
 TlhsUca1snSA1XIAusr3vWNDMV+hZHkGBaISw8m+Jo1Ic6EFN7PIaaF
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX1t5CqKzfBxok
 PNrLoWZtsbdLREnfEnw+QqCyWcZrr2r8fyMajXD4Um03oBnwHcFFYPlEJ+fBM4xMOfaFrF7FiH3
 +wDbtYd7TjxCMNuFo42ki59mGUoZdu0=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb9385 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-pL1Pet8fDdhfHljwFMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX9WewV0oZnx3O
 cs/Iaw05AK9KK2I+P9vfuZeadVhQ+CMGCIz+qVG+p9NBG5FZFcS6jWCJbqSlvqhnIY95891mHxn
 ElubugEoLBlxbywKy4FFn9g0irQGvOXHG1vLfouwh7zGvQ8VnQbnVU/17v0kZlmhZZ0Bid3piOM
 St2/gLxS2WoXzkJI/AfAEBbSB78PeHknQamkU1onq8j/R7gERFRgUeEuByfCWgUUnb+mbPUVjez
 3B1hv6WU4H7MXqR3wEaKU9cxARL1c+8oMyI/rou4BbNipddL1qWq7qFIHS+sPmYWHREwsEd50uB
 IGvOpJZtt6oPfIPiuhIHNxRlQ/IKGEFUix+r3IhFIyE4Lonn+Kl5MfBpp3UeqrG26adIndZoHLe
 cL9acO7Pf3F0FZe2sxCMEShZVU8U6FJ68XXn95zIJ40UQVKNXOfFRLvRQmvKGtaHuVnShTq7DLA
 zS5VIjjzoi3o0uQAQkQ==
X-Proofpoint-GUID: 1xb1ofUq3iKPrIpiTcbOoVxM503XNTxt
X-Proofpoint-ORIG-GUID: 1xb1ofUq3iKPrIpiTcbOoVxM503XNTxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290041

Add the SM8750 compatible string to Qualcomm watchdog binding.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 4ff61102e407..8cd8331608ba 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-sm8750
               - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt

-- 
2.34.1

