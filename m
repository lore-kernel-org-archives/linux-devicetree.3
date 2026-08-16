Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF4121D3F5
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786884928; cv=none; b=QJwE4SmcI7E/EjxBPO03bBSCILVZ+eJUsw7TOIv99SUJ49bJYQXu1L3xU+IDGg7NVxj2Rvq6zHJ8FgNZkWnBSsCMEvh8jwhIVRUo/HFlFc2jRaitF3Qz7tI82SyDPLeLfe3dcxZR/a3a51SI3E7gW6BW305pVrGsIxCzHGoaIS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786884928; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMpivKJDpIpwBl1OXclc06sfk+xXatsTS9loK4xLDqayu+Fh+1/4jWvgAKaGZe+vXk6fcvebrPzWl5wZZgAImZ07n4yWGmeKFdXPw+eGXurYxooz6DT8nTpQdggbzA6R9KhYf/AZ+XsYpPxN7iz8JZMbqwlTkUzjoDwuWednd18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqVj89h2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgSA0qAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqVj89h2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgSA0qAO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GAgbOw3766287
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=GqVj89h2azKQvz1JarD657vOXqi
	orJZmSvnDoHLZ53AL/4BrxOKaTzoPkX12ByyQ78tnUd63tjSsDkjaONZ67BEyoE4
	YqdgHtgmgLLh/g7ZUUpWpfNcMXCcbbkBqO31mg+c5j0eFvYx2oVIuNhdM+mCxg5j
	8Yp2eeguIEMwcOBLwNxC/2T7AcWAiqfxU0MwuXd1WyFECkcbi+P26y3NaQzmsLLG
	aCuZmmxWCFINhwjKxj92PmpxFMLMomm+ItuHzLA2CuyjwVkWD82oxCKInIQ3rStL
	/mayszTwjjyP1u/vQudb4qpSdXrvIPgJcel0xKwtWKjhZK1q7gH/9xqPNrQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwkdcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:55:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3402851a12.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786884925; x=1787489725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=IgSA0qAOlSO4Z8zv5ZsJi67L29pjzdtR9B2PKToKuOlKVD1jvQ3PW+vkQD4goJCnLB
         O+KREGMTYpsmOp4EPCpnAUIwQ3hU9jGNPFzSXNbuvFZ3XlBd3LKK7wwPzVDG++gj2mXd
         4p9srgq6k8sG6EqYJkUmUHOtcbea7hoUuQdlrKOpfymwmrP8dF+mhpsghFYzAcQr0mck
         vWvuZKL47EPTR/QnI/M/XoK6CIUxTud2+/zh0qz+e1kxrH6MLHwhrJyihUDYKsWTfYvd
         Tl1TwGwBNoSPyEAENA/wo2AQhz4XTLnl1bzQ7SiLRUmELljwhOqmLIxoS985fZmnVRCS
         q1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786884925; x=1787489725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=bwyjUJT+f7Bfbq80TUXFR6AyO1dRxPUZINNn8Jo+B5JHBRbvtCUxtpICqwq1RCbelp
         nlv/G2rkwwiYcG8AnASFMcFh+/YseAa8Vz1iKLyhXb/I2bgCCx2yabNYl/a/Jl+D661t
         x2WcvrMe0bYeBEEslcSt68BvPrlln9po3bF4wxRngTAkyPKYEHUMcw2mcWAwLrl7Bbm7
         beBQZ548h8MHVRpoCXJTzxEHzKAyjcqWc8uig9nC0GWUXX7G5ybcKPM2kVt6iipriAye
         ZrlKGsSXSuZDspWLPFeID+0sstLhFGw4luYOr1ZKkpT6sCNYjajkYaQn1mwnv6tfpPX0
         ai4g==
X-Forwarded-Encrypted: i=1; AHgh+Rpa3uYXsdrtN7tTemTcOSNkvhLwyzBid+cmhQh8k52c2KlavwikFLBliOU6/14cX5GD3i+5s7eOW9Ac@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCXNtfuzKvY5APRBRWBrMr4YdO06/PbgzcU4qzWfL0GgoQx8A
	/xHbUsGMtaS+EoHhag1YCaK3sFz+OhDY/klfD7TJpzHBm2HaKI3sHMCtPu4HrXE2DS+myAZvkh0
	OfVYvwBSp11nBNo94ltbwYPH97S/iARn4/EdEITgd/LQKTaOx4mgOlvLgV7tzalMN
X-Gm-Gg: AR+sD11uL0j1iURS08EvBOhHpKxRXg0sKUM7k3oJrYowEw7JPGue63bNGWD4f9btV+X
	8tD+lvXmmEe5fwG7bggY1/przayJCIeJ2m2LXX3eEqK80kXQY2TS/6q9oxZueJsAYVKdNES3iBn
	toxx6PBDuGASgzwR42vNVEGPnLZ0E23nVosc88i5UZ0THKatQXnCCWlX1rZcPofbWd+qc63Fm5W
	RnKc/u89kDCEdF4HBl58IOMdbcAiotocxEYVAZf+kkBjWDNJhACZHTAODdsvYyFyVgzayRXG2Lg
	yH1bVbO8OgM5QcdjIIyGHhiGObl77FZOTotyhIDYxMFqUScyhJqcQc46rUtywwnPitGC22iWcJw
	eKV0KwkKg2qjpxun89XG1voW0+NnhiPW9jpC1ZeEupxjFmlP/qW+CxIATn8oN
X-Received: by 2002:a05:6a20:6f8a:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3cc71e5512bmr23111366637.31.1786884925402;
        Sun, 16 Aug 2026 05:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f8a:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3cc71e5512bmr23111336637.31.1786884925005;
        Sun, 16 Aug 2026 05:55:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388bd5a7sm40072703c88.15.2026.08.16.05.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:55:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v11 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Sun, 16 Aug 2026 20:54:11 +0800
Message-ID: <20260816125413.1635150-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
References: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jEP_1q8E8bTbDucAkm43s9NQG70rY_7K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfXwHXw34DQHAAH
 wbg156EWUv/8VPuBCtGAg80yHMkfnVi+/Zw2h4aBra3+UbqRwOVr/uVNf2u6tkQXxIoXlFHFWw7
 J/4y4qrkbPh2QzMfPWfCJ0bO2p/i1ALMbkSBZOxrwmoFOAON05G4sRRHQQ7d2ioqWVHenQeXyU5
 G8k8PjNNWV1Y9/ncm0LzsdxSA6u13xxV0K8jtaBM0YKtfym4fn4OrXVfao6B+awlJU+phAcXNBO
 DS6krlKnEauuh8lXaZZFbEwZiodoC6YrPcuwFu8/bvz1UuDPEnIF6WsSbQf0MgbdnwPVLSPxSvw
 mxz9zBMmiuxbjMjXPjy2ZghqnaOoBHHlrJvPFgI73HZmpJeu1FJ5Vg6w2f6xCfPwqTbPcqFiMOw
 Ry5Hz000Vebvsjeb4yNFRaXqr4ezbnke5VObyfJDC5PEeJr3xTNTUuhDTKo0FMA0xkviolJzID1
 6iqwiZZg5HRU1AGN6NQ==
X-Proofpoint-GUID: jEP_1q8E8bTbDucAkm43s9NQG70rY_7K
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a81b33e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfX4dlmKV9QcAe8
 lh2hAFSkLI3C0/v8+CYonDItUZ+QZpHlBPpH+Z0U7EPRWnbZ7B6UCOf5WR1LUTDAeCGYi2dEVP/
 6Gk+I4vkecaF7SiXBVvUPCjsbDoLbwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160101

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

