Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09B336404D
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776404525; cv=none; b=X7ONbTm2uWinNQBS0thU9C+qaQJE2Hn9xzSpiGOvFwtmmbg19pvlcr5A0e4PnDzglFyX35cGWxKWD+x/lrcC4CdYGzNvb+CTDjE/ToC/me8l3nq11dm6+ka4HPPBzsEk/blg0b02pmbsIguJ3B+3vQcSu4zuzXDHTdR/78mavPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776404525; c=relaxed/simple;
	bh=4fBy2Ayi3Y3s3mKutKb0WAzySIwI4/LsQJp+ImZikFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKun7ftpK5i/s1Pq0Kvvwm2rIDbHE/W7JSJXF7p9etDjD1YfkYYX3GFfCDahzrElK/UV7V76X3Yeg5P8V1nJCiZ87sJ/nen0O/IWr+3jcl5tL+Mqq1iEh26tpQtFajgGZA0VimZovXpsV6ciaxUMnUpMkbDKcx8Qn5E5ya6GW4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNlhbGE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3a5BcZ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNlhbGE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3a5BcZ9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fkpc2593567
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Cemqp6qLwYfP4Q8XQ3qHM17EeUxhiS0X8cJ
	K/o7jCyM=; b=CNlhbGE7Hpp4EkMVhT4GYWKDNBTESB4s/qN6EDgWD5JcV7l4FWh
	0+RNq9g47rwz7kVqTOzZQ8TKCwpbteVIBkyLKMcmRN3DHlZDOcgt04wtiU9a6HgH
	1s4zADHmEisELdsMy9R0iKo/kHngkPRi2vBtWo/KRpWiBR6z1+uMqPvsNIzY0psz
	TU3wnjC+zFEaqFAaJgAAWV4CVv4EVkVxVB3zIszX3J3Bx5KytOOfRGtuUnngzc9x
	frSsBsHrxRO3orEAiSznNTlVaUN7ryeBTpdnMB/7nFHVsFXhP2OSfIppQBRNoJNs
	WdjhC1Ghyj++gbxlOkgZOhjyZsM/o8Qztpw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuym8rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:42:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d889997495so1523082eec.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 22:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776404523; x=1777009323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cemqp6qLwYfP4Q8XQ3qHM17EeUxhiS0X8cJK/o7jCyM=;
        b=g3a5BcZ9xkn9DZxKIYXSpmDPZkMjwgExdUvTZ7SyDpmxA4iJgyOr2jUJ0JPYwd132Z
         DW5vEB/rfmcJSeclIsAR7rsO6n+NRRGJ0VveDAERBKmLf3YAAuJPx5yIHhJVFdehDM+g
         8/yj5gPJbMbRRKZxMVev6hKNcmDNdqZPkkUBmzkGKytRzNAUwD+ivr4WHEevZr5Yh60v
         OdjEasndwOnmCXLxxIjtGIZ3j5dm4V20fnHeaZP3qcpOgoH4V8BEZBiL1540P5O9CmyS
         eXJoyf4nr+sSipm9XDgrou6mOmAv7xBBI5DdTi3IlzKq01Muxr0LqIe9+gY8N513MFZO
         pl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776404523; x=1777009323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cemqp6qLwYfP4Q8XQ3qHM17EeUxhiS0X8cJK/o7jCyM=;
        b=FtYIKc7Hlols6LMEnCrwwJGRNm+FUVYI546iIx+/usU3LANKl0YacbQi6Mne3EkCfw
         PWj+YX+kpdMtq970CPbF+yCq8ANbSRPPPi3qifEfnWtD3KM6eIjjWQm+AtdbJrQFfJtd
         dy4eVoLyXGvfRQGkA+GCYrM6D+aCtVBeV0DKsZKWJRRhb+NSsDYD7JEWldrTsiROHs+E
         iTXrcAU9T3ZLQujbEGUMvvoKytlSYq2YDSqgWs3kK3Fo/Z9X6OXa9d2Pkr2CCdoM+IGP
         JwlVb573qUplAY/z7S8TNpr6esZvUeV4JKSQw7SHqH2K9TnCtb203Zr4fDsRlZ7kNwUR
         cymw==
X-Forwarded-Encrypted: i=1; AFNElJ8XF3OmexehCGKSkZuHQ4ttULHBSJLb0NtuWIBoTs0aeP9pUmgRBfxXkpzCbcRjfwP4NyUJfcOdTSxu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qQ3hMPPVWGYAH4gn9H/1VTi9MRCYw1gEVZ+xwZ1OZr7UALZA
	EGcN7CEp7qDHq+bN906Byn5ItJUfrLzA5pSBYJrLanUDatSY6Wii80WyQt9VhieiSbZFm5JOMEw
	79dYUWAwnZo9fTWCM8/Qwir7NvCGF8ZB0WGuGl+wZMxBDTwVFnXAoGNuY+076UZlU
X-Gm-Gg: AeBDieuq2lRNZVF69Vztz23V77JFpuJMZhbKbR2BiErvW1g4b1sATDhrrSls4k8oehG
	lhJdrmxcp12+ZPgWigvRBFLA3LnzzX1HlkZQ7cPR4UH091xLbPShrWeWlFvgQc8H0apQl7GfZXX
	66l6jgV5Ql45VXeZDtN5Ku/0N9bx0DRTIJ/KU1+FP3piPk+PZQ6IAWq1DsUmHnf6WrgqvLLLHM4
	LN0wtrVr9C+XKaHEeS6y+T4/OeAhGqPxBOhjsiIjRaoTB9j1ZNwbvNx1Xfd45BXzgXOKlo3FWx4
	fH5iE87Qy9VQL7bSjojENCUzOegtpYgqguml5o1p0oAVKM8D+O07jcWgPWxyyxJxy9XM5vTUEfT
	kemxfkf9Kxjhg9xIg8O8pta2TXHyfwhOdb8oIljbj3UL6XtIq3sGkMy0E5uj1GqxG8UNPqXscT2
	tdBg==
X-Received: by 2002:a05:7300:641b:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-2e4522010e4mr758857eec.0.1776404522626;
        Thu, 16 Apr 2026 22:42:02 -0700 (PDT)
X-Received: by 2002:a05:7300:641b:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-2e4522010e4mr758842eec.0.1776404522135;
        Thu, 16 Apr 2026 22:42:02 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm823606eec.2.2026.04.16.22.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:42:01 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: purwa: Add EL2 overlay for purwa-iot-evk
Date: Thu, 16 Apr 2026 22:42:00 -0700
Message-ID: <20260417054200.2402281-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA1NCBTYWx0ZWRfX27NdnQJ7IjxI
 n7HJQ9eKu3UpQ95s+T4Vn411mMcw6peC5NFgvnPmuQ0qWxor6ngvc8C0ImMW3iZ+9Vvz/aVGstz
 HducQZdEm8WU2gn3K8eXmVKQWFL5Xe9nsoC/KzsI/QTQNeJ17ByeJNsL5r7+QiXt64CSD/VJ/Jz
 3AytVdGBrfRJ4pZIGu/r8mfeEDr8XNWNqaVyQcxoGUAKLp29z6F2qWaBYtq8EiuEG3VrL6Wu85e
 zOD9We5CK+DRbHUSSlICwRyhm24CqOeqbZ0SwdHrTn5JWldBMqOrPpm5s7d3LeybLwDb8CPTCBV
 gu/0sqQK9rTiTwfAdSdLkYQjjVKuqdkPgI/78uewQg+mPVRUloilxPk6N+o2CS7lpZpeRerZb7X
 csvbjaHH9DeyNq4o1VJCQG9l9FU0HzKHRBm9qVCqSxQrGJP3+1RvCdc+b4KSpbLtAPh6FC0cnX3
 VMSRNTbP3/v/d0IVsdQ==
X-Proofpoint-ORIG-GUID: dkw0d3_5Xb1DLB-IaGt2aGgn5wYI4u_P
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e1c82b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zlCN0eSkoFmFCwwApYwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: dkw0d3_5Xb1DLB-IaGt2aGgn5wYI4u_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170054

Add support for building an EL2 combined DTB for the purwa-iot-evk
in the Qualcomm DTS Makefile.

The new purwa-iot-evk-el2.dtb is generated by combining the base
purwa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
configurations required by the platform.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..0e326f62357b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -157,6 +157,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
+
+purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
-- 
2.43.0

