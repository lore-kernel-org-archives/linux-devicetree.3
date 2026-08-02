Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CC33939CE
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660369; cv=none; b=ahHHW9LXWJbVRzN+hmNM6NPQfGNSIe5c25toMwmPYbZdF3XZ24FNW3oQIUyZvx8ZeWvyRURR7r/FAhM5e/cMmff8xMYutZI84bO7h78v4wCQRgeuoU2Ukmq49d/T80EQIq63DkbbcyC9mYqFQc8lfwZtoB7+mZbqqEEv3SIVkjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660369; c=relaxed/simple;
	bh=47cyNALqJ25eM2F66KQ/8ZGVEN82PFz8l8ZFAkfaakQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtuT4/9NA7z8Vpv0rruj+VAet3GEI7GDTH2IUPag2WA0g2FuFs+YCdSusIQjpShLDXiYaUgHYcSRPOGexzJnz94OS9qV+gZMV3R8vRrOolfPbI80ALxjNr8jDPhTps4xYJZMd6Q/eS9mdGgnr+85iN5rHuCkC9pufw3to6niTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfsJMkvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9cwJJlm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfsJMkvU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9cwJJlm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727liwc915735
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5CF8fZpPPj1Voth88QksP9FtwhMfjRo8kHp6QcvcnYo=; b=WfsJMkvUjTCHf8Iy
	1iQOzh48La8bWZInsCh2wmcuYHO0ZtEeyzBFeDLVKgPAeCgzr3EuKXFhxuaAaUnx
	CMuc3kwFtykYU1Cb6nEjT24v7a7dsFva3VW/SyX5l3rcVJwGCa1zN+RL31ElkR6i
	ZbQ59lP/wQrJzRgY3k8S107Wxq5h7Lmdn+bxEawBKh4dvXm0VKmjTBj6+ft8apX7
	xrHpgVgVdyW1Hc745pC5Xzx7Nt2RNRE3MY6E046TcykcRO8mgrK+fnXy8Wdmh72I
	AYixXgnVPhNwXEQy4eZmGI6csV8G4KbC65BVLKP5slDuxuAT/0F7u9ebWmj2Iiko
	dlVC9w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs966aftv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:46:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-522de3c645dso47921291cf.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660365; x=1786265165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CF8fZpPPj1Voth88QksP9FtwhMfjRo8kHp6QcvcnYo=;
        b=U9cwJJlmHbamS7eYIQB5GMsQiG9FGUr838MaSv/v3nUII8XJlcY4gRFRQRW2DCywfH
         Bs5zFbEKXER3mcNXI9O6zd66/0RG1OHRrki/cs2TDeO7RMqooiOZVeF8AGZGxoLaV8bC
         MbG3rsF9iDeJZRO+xq3/Sg//qglJEPh1QuqTmRl+uuG5/eyeN7TQwBaHhcCBNyNMIdBP
         rn0bKfUcN0BMUN8ouDMm/3j2IDKmjkhE+mP4Qm9B2rfDDZ+Y4/aayy1V/X00ccQ4UWfS
         dMPQBvayIV4/CbfE0dM4Iq7EDDpy5rL5sWIFGfuqVpfYSnUguvVSsHUKprpsrvbWXrW/
         7ZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660365; x=1786265165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CF8fZpPPj1Voth88QksP9FtwhMfjRo8kHp6QcvcnYo=;
        b=h+1woEOe4qVTaydUF/bGwmRqfVHBq+RZYZ6hzFEz4uK3YXLufRtj3TJtF2+eXFmIDF
         oMJORiJpeUxT4Oy9+CRonkWpbFMLzK988p+zQ6Uqn9jhnuZ6phDoRmsL/XhDtWh6e/1D
         xLHfJdsL7ZSf3ssrBFWVIeUVqfcDyB8DdWPpVWiVbTJSBGzg5BML9w9zc84G4CCj2sQc
         W20WcoA5PT79U2ZmCxZ4nZsd30YdqqO6c3DW2B6dCf6YIJIBknoUk86c5OZEHAImvgJS
         N1YKMXd0UZSmRSkmrg0XG7fxaf7rIL0nR9ypxph4uyO6OFnNMTPIJk01NWzs/7YyJW+3
         CBVg==
X-Gm-Message-State: AOJu0YxVeZ78pio9A3Nvz3IiMoHdQwZAaBDXc4O03iis6gski55ZDseh
	9awW0MYR/dghImcTz7Y/E+bOXVOo+dZB06meCyxKmEXxSg+emFZC1wKKaDjklVdpPL2IUdhbrd3
	cRM2fk8pIet0AXB5FQ8xsKHsPp3orvrerqUxbrJhhNMkRA2Knq4EGADSJSokgdmxA
X-Gm-Gg: AR+sD12iXAYPuXMip465Q0gVc3pEd9uKekBpbUZriCUjqsgk3kY6twyinVTlYnTeM2e
	EXS79zrxYbMIaU89vFqXTGnLeRQ1FVAk3IivBk/NUO0FGhAa8oodznxIwxTiUo13aDVRQUtIVBv
	UZnhMaB5WtE08PQf+NQSIJUaIH7ACdY3nxaSjXc5hNycR5bmdYq9JfDnVdBEnww5VZNmiNw0/D5
	gbxGB+wfrcSnzjpojNd8F0fV7Dyb0rOe3SxG2LPjigIMpvcqKWlIKR/IhSPjYmCnboYsSeejsK7
	YReL6C1zkRKkI0M88kn9vEMTZ5PkfEuowNVXNathScbrlCxQLrTm77cSbiuuf1pe0vuGBb8VrnS
	2TTvq9nGwOZ+h2ClCL+98CoBC
X-Received: by 2002:ac8:5742:0:b0:51c:185b:29e0 with SMTP id d75a77b69052e-52b566929d4mr109914401cf.10.1785660365234;
        Sun, 02 Aug 2026 01:46:05 -0700 (PDT)
X-Received: by 2002:ac8:5742:0:b0:51c:185b:29e0 with SMTP id d75a77b69052e-52b566929d4mr109914271cf.10.1785660364830;
        Sun, 02 Aug 2026 01:46:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:46:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:33 +0200
Subject: [PATCH v2 11/11] MAINTAINERS: dt-bindings: Include dt-check-style
 in DT binding entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-11-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=47cyNALqJ25eM2F66KQ/8ZGVEN82PFz8l8ZFAkfaakQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOzFm7VfDXF1wVIm2aEZygjTTS7Xz6+2HDbc
 HHHCqsyt5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DswAKCRDBN2bmhouD
 18oID/9iB1wQB0JHg8hmi62lTkw6CKpXbI11jGLVHOIJ3wurR+Hy9z5MQO+G6934h6FWYYQsBlY
 GeoW5UEvky9nB1qX4OUmw+cE91ghqmTTCqJN01FZS/59RDnV3bMqdaUCPUCWMQhuhGh/RsShAlZ
 UWSeMpcPamHbNHPIgGmN+94K6i/8YJ9lUtA1iX4kd5RHMSRN26FbYVeeh0nrquU+OBsc4e4Ap/H
 oAUjyo0LLzUABYh7EkuVzfGD31CaNLkcQQrxyqv3sLp3gPNtOfDJZxeejEsr7j2scsCscaLgckV
 zsOtWwzntz8DEpEH6c05CRX9J4grxJtoPCcq8kqzOTLVqalmQ+lO+vU5sRRwzXH5ANm/Z8CS6IX
 dmAgieRFAq4cCcSdnCx5VFvpYnRcinNWX1Rr9Kk6WJSi0rg03crmSLTCaarv3qG9lm5rIQzJOll
 6SVbGjgA5AghSRU7J8CarRnhk2SEsOz5DC7uJvEUpT6jCXJ0+I3JwLnFmoiBIiBIwRG+RcMYEbk
 jAYFgL/AR6YIno2JdINtvJ4D6diMQqO0k4P6EVnV4fiDTFS1Qe2FtHPIhElsH3avw3FqfiFJmrr
 9G1wZhstc+CcXKoymUy6ZA9AvtCJ5gzJY4H0zs86HKEm/fre0FJiLvfd0NzTk+1qRzsammWLWaX
 G1KS1jI9eQoGHRw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: vtYG5MUwIp848Z4ZY2nDm6e3EUns8xEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXxq5Ml6Mbx2rI
 Qy6lQCNCYmgQNBGSxrCz7d3BVzFjoGhqhKZuy26c1sMKFMmMc3TGjYOpBtI5RpqhPQ+JW1cT5Vr
 Lit4Q3/IIgoHeC6HEKgUkFhYxBxIUqVqvasez3aaY1WUdmOdhR0J0SoA5qI0tJssQJThKvjqpVG
 APzvvHwf7ghCFoxn4g/Q15lDfNEMui9UEvqnvzFfOgXOpc0Q98lMwudrlU9kW69Hx61eA+nKepz
 r8MwPkFbU4olNCEa4ZgRI0S8fPpwofqCqlsJBsG2Nh+P4UtYs+zRs1G9Tn1ns6jfcv+UpXSb9PN
 JVcH8JeaLva+v9HzWFw6KH7HVi3Q6QIixm4GVWFcjw8YQnnr2lHdEqowtoYPdiJgNfckpcA37wJ
 hK/qKtNHV15ZLLqZh70HMXyh0mlybCB31stPMYG/xN+4Ry2aJhT3FfkCiNHKkEhh23GqGsTwPpH
 Q5d+DOsE/1rj9OKoASw==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6f03cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: vtYG5MUwIp848Z4ZY2nDm6e3EUns8xEJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX+P+5TnEmAvA9
 rmYVboLNN5CJWF4OxvP6hts6IvCz3CoJTK/b8CieK3Ti8Hxneb+rRHNS1Aom6ifHBre9aTxfRGw
 GKDbwpCqqNEnefpViGEJrxMLaB4lgLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020072

The dt-check-style tool is in interest of Devicetree bindings
maintainers, not only the driver OF-core (where it is covered through
"F: scripts/dtc/"), because it covers the DTS and the bindings.  Add it
to the DT bindings maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3c01eecfa2..2d0cd7602a05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20374,6 +20374,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
+F:	scripts/dtc/dt-check-style
+F:	scripts/dtc/dt-style-selftest/
 
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>

-- 
2.53.0

