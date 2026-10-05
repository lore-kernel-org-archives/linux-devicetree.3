Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BFE4C6528
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214202; cv=none; b=eSXF5bUlJwSSCiz9VYrxjvxDquhPuvAWExcOctJbfMGMR7XL3OzF6wF3uQCRVXQ5iQ/TFWUUyfXNV0AmszOQ2D/r6i4JwGsFBgpvDgnKT9he3FxBPjCbj1qN8Su2hRoLWBcn9SAVE1x0wWE2+isPwSmA0z3VGUydVYQPl4+gW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214202; c=relaxed/simple;
	bh=BwUtXltowY4TnBr1GJcGDAHCU9wz3VnoxRYwPd5575k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDtjBandEFB4BTFMZIid6oTqqO8L5hwhQGzY8HNv8gjO/GxaL/AVA+qWHnAYmYQ9DewyCInCjQ1ehMmUJ//LJ0aiTr7dyEQbX3hop7hUsIQfaPbNFfYHDAariRpf/ZgeatziiW9+NKROyPE+xKPsi0tUpNFyTwGJXwkK5pjLzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH51bmpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfhQA6aG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH51bmpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfhQA6aG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EOu3L3188029
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 15:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zN/XtAkfbnykHQBloZ5iJjv7Y+cRd4ccRdiM3rECfa4=; b=dH51bmpxdQowCa6a
	xq0HA1fLvbghJjXHjsLb+F0PUUM1Gde0wYCl1sz9E6SWbzVFkXjgPaDOHoY9hpDG
	lCLmyxDQ+brTadj/B0e78SAym/Vr85dIcEpQHLZUrPlQ3uTzWfAeKIr3iFOpzUIQ
	K3VQrbHjmHxLrneHbcPMdd3UmaZOLxCbZfHEz/7pmTs8T+x7mQ372yTttJDmco4k
	WP9FYbbKuDxcG4EdHGUE1wXR/tVoNawx+uYChb3w7aooBasanUsJq6U05DkuKx/5
	ChJ1h3KsARHcjpxa+uSR7Dpv9q7Tz5pcbR3iNeN8cqhCfMCRVc7PCqIxCHBI6SyB
	sqzOiQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cuu0fc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:29:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88bbc27f85cso2349153b3a.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791214199; x=1791818999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zN/XtAkfbnykHQBloZ5iJjv7Y+cRd4ccRdiM3rECfa4=;
        b=KfhQA6aGbUnYalfYwkvbShyeMNcKBexvFDglEaEo8HzsMT1ny3LDFosymaHgF9INzo
         lHD1eoOGpGtL4xZ3ISjFYX9+VkGjjSYdB3QbqeUhEEfPEC0bzLBbbtFu1aSYuTIqiQ2w
         JZiISso0NaDXWVTvuXZWfDa1PjmaCxTjAboqve1rPakPnltLTT0OVQsZBe3PKL8h0RgT
         uWxXL65Dx73SeVVWyewqpxO3c/gjSGnyp6Oix/4rfGtg1FulKU67JRVS8Mv+ZVOG6zkC
         VEmmXzrw5RTXbBqPyqCyHYXLf6gkzPxhBLFD9lyFzX9AXTMMUfFM46C/iyaajfhpzt07
         4NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214199; x=1791818999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zN/XtAkfbnykHQBloZ5iJjv7Y+cRd4ccRdiM3rECfa4=;
        b=P5cuzb3RAWsDqzdfS4XtwG2eEd97YImtN38K16p9hyCyqblOkUL+7i//yTY5vcjudx
         wjj7x5ShudVIa9oFEk8V+WZvQj56eWmlGGW1iM7hon3RFlZGAB8jQxCZGe0LtK3OlG5u
         O5mj5Ycbqqoj1MTcxQ0HO0K+r6JrCOPF0u3B0DCpAxbFcf5Z2mWMaTMVHLlLOeF89cPk
         hchgzdfcLT7dMQglfkT0apKIQXl3Pc+xeQUubzM8gH12p4IuU6wJoaLsgysRxVdCghrw
         yqKVmfhTIE+S0t8u90TRc4kR63QYuaK/VP4uLH/FnzIzNU4fFhceeVuPwePEY0+vVZcw
         Vs4g==
X-Gm-Message-State: AFuF++kqA21mHKxZH87rYCfV6z3rgIGXgpDU8cIKmqNWI6QHZOkXuagX
	pZgbLort9sY8PieEczsao5HG8KaBvWZn552WK7euIXAbmXE03jdWiedxrjBT7AKmcsmgzVcoEAO
	KK9oKFosII9kgZWowKQQtBTn5pMGQMabnIzKTtTg5KvXcIL0IPdaISCE5YjL3XRTP
X-Gm-Gg: AYBFou2LYaVI8RbjcuGUJDdXOkGczqnRcT01T7d7wvE3KGSVM/fZwSSuHLQgUIHCCTW
	bxY5+ooJOKqUbrTF+0Hy/tCD70hwmwFH4zCneq/lv/zWMiEZXir9Z2btwPAApt8xkBN65si6Fsg
	Ot2jXTfwvNMYh9o3rllzwheAv8r5RWk81Jm4rq56rNd/0iIv/pQIPwm4udapbVVZH9JWM/LTkn1
	RntbakmSs3glCM+9+k7QSN1uLd48TPCRrBs2Vc7kg/O5ugvvLow148757ZW5eUPs9k0hoh1X3pA
	wU+21ygbn094pPQfumzio0cRG1Qq33sIBPRiotpS0IThoh+IvfpBcKbwIUQPSb9iKiH3xvQyUTN
	2ThNPAZfMazpDUDVOccs43aXr6H1o
X-Received: by 2002:a05:6a00:238b:b0:889:c4e5:687e with SMTP id d2e1a72fcca58-88af3cc9286mr10276684b3a.8.1791214199134;
        Mon, 05 Oct 2026 08:29:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:238b:b0:889:c4e5:687e with SMTP id d2e1a72fcca58-88af3cc9286mr10276657b3a.8.1791214198669;
        Mon, 05 Oct 2026 08:29:58 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm3681528b3a.41.2026.10.05.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:29:58 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 20:59:42 +0530
Subject: [PATCH 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-s2idle_state-v1-1-3c402c66f388@oss.qualcomm.com>
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
In-Reply-To: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214188; l=1581;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=BwUtXltowY4TnBr1GJcGDAHCU9wz3VnoxRYwPd5575k=;
 b=T256eb3yOc43IOM2WW9e4sYZwSd1iCVH6K4pVsVCqIOMCxxivcG67YBymLdUfsNQvKcZD4OKS
 Cw7wIfJPAr5A8JORGIcWWQRa92/RdtZP5PDmjPbTCq4baSUMp5F45zX
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX94Pr0jILEjs9
 5MaRMsTFbp2pBNV6++E3R9MvxFhUhwpwjLrTQzZhqEGuUzq746lZMnUXG7MlXO/5/L0vEDCbzaa
 PEpidbVnDZyUUinvwXAirfoQNlNL9Xw=
X-Authority-Analysis: v=2.4 cv=aKRlOr9m c=1 sm=1 tr=0 ts=6ac3c277 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Yot2Wvv7GsybDEU2oFAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: zJ78_cdTvL7lp6Q3P3qvLhwKQyYMynNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX/OIIPD5o6Zeg
 Mam8CkYFQW6dQ1vfj+WodQFJLvQIWJBQ4v0jcN+LWbE+Rat/EvQ5nnFCrhjb9wqeuHD19XInkN8
 hJRBqLl91eZQUp5nscNMnJ3YuW0cbtF5Dm7ue7wYl3pfN7xWZw0DFZYj3jKZWefV01umM1N4v0c
 8vK6/fXBQgBYXwEoXspwZDK4z7cEPVWL/1d7al6fOs7fFee0vg0mVN06fKUrmlCyZzulgUESG0e
 m+WGUt9SbUjxQATZ1J6g2lKMdn31BDCzFUKhgGORNwA4ky179rnlKBMFig0lITnqj3sr1lRISDG
 B8uVJTpxzz892QHGyGGrVWolDEcz7tF1ETgdI7c4fnrMigWn6XeRkS0UEJ2jPUOqEA9n9BR1X50
 P7DeSq07RRIMduO6D746cpQ8PKs8xC+QLBp66FmS8oyCxK5xsChD7P2Z2Bu54yXWovPvHYVrnZ1
 h6ue3Duv0b+TWxzTPaA==
X-Proofpoint-GUID: zJ78_cdTvL7lp6Q3P3qvLhwKQyYMynNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050060

Some domain idle states require system-wide coordination and are not
applicable while the platform is up and running.

Add a boolean system-state property to describe these states.

Assisted-by: Codex:GPT-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 .../devicetree/bindings/power/domain-idle-state.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
index 4dd4f59bbbec..35dab3cd6aed 100644
--- a/Documentation/devicetree/bindings/power/domain-idle-state.yaml
+++ b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
@@ -45,6 +45,12 @@ patternProperties:
           state will yield power benefits, after overcoming the overhead while
           entering the idle state.
 
+      system-state:
+        description:
+          When present, this state requires system-wide coordination and is
+          not applicable while the platform is up and running.
+        type: boolean
+
       arm,psci-suspend-param:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: |
@@ -77,5 +83,13 @@ examples:
         exit-latency-us = <40>;
         min-residency-us = <80>;
       };
+
+      domain_power_off: domain-power-off {
+        compatible = "domain-idle-state";
+        entry-latency-us = <100>;
+        exit-latency-us = <200>;
+        min-residency-us = <1000>;
+        system-state;
+      };
     };
 ...

-- 
2.43.0

