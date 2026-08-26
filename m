Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819573D668B
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739713; cv=none; b=JoGqL71ELgG4UewY4M7NDOPFNffkKYAPFvr8VAJI82CK1lzjgY8jzSyWBRRi2Fl/yZssnVpLQUzGFJVy3ZUw2YTe16Q4fLAmQ8PTjKlBEOliUZyjtdJSeNFvYPLNdoK/3k12SfTfr9PZUV/d+Z0CfT9gcpBSRTBrNmWg+YlH9rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739713; c=relaxed/simple;
	bh=sLtLbF7S86pE8AXPx2k+gSnDPess+J9HKtzyUzkbn28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJOybXxqowr3LGuZwFg5/ONe4pjvYsR3T+/gSDd0PVB+2f6nsz3S00nCgmh/PmadIL+VxpYXuRyK97wGQPJX1joOVtvcEAY8NdiY/w3VidSJvBzfECw4BlI4ByxpVFCPxfoVi0D2a+KTF7A2JMz7iY+ZJwWuBfxy0vdR8wuD7QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IN34ZHC3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctPGK8jK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IN34ZHC3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctPGK8jK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGxjE3648125
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1WIJvKAd2XOfDndIJ3ooRHt9ByqbXSTIWd0+xfU8KI=; b=IN34ZHC3CdOvE4GJ
	ScesKJu7mN5hIcPnwzgBRT45SPQQv9coSgMe2hTW32pWGPqB3VZBGBy8reOeM3q2
	7/ITXmiLDx1kkyBkiyVW60R9WgQEEBVosgdFQHbU9fffi2akAiAud3tvkx4gd6tN
	fTeltnYGtrOzPOqHbk1Z5+ntb0mcqkWAGknviC8Zpt67KBhKj64RNR6oiNaQqw3D
	TvpmZ4WhpD74iO2QgcN4k3tlKWiRYN/NRs8ir2Ug5e1Ev9ZbEMKqw3mZaSl3kqiw
	igkvsrHjFH4rTPVKY/zWkB8H3vdAX0gH5BvwWwrnhmx1KQPMjo+vYu1okTVo7KtX
	Z6/XFA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrnmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cc934fe9eso12329196d6.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739709; x=1788344509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1WIJvKAd2XOfDndIJ3ooRHt9ByqbXSTIWd0+xfU8KI=;
        b=ctPGK8jKszIbo12r+dYhCnGWCYzUBXySb1d4iz7Sy3GtyO6C3A2LsyyGPYg8UTDNnF
         jnGm+0xWPosxPhvAbBKJ0D7Wy9FLytVIl1cRn9kMtOBzRHCQnM163t97TDMdKOLTXFs3
         sjqWgQy1EbwjLDR3V0wO7r3Cblkgsjea7JFml8mRBWXqR0bpezNhhNA89MhJvWmMh1+I
         OQ1NzNLRBTPI/zv0QB0SGuFlPknTuCFti4C37QxfVmWsCRRcFkaufI+tAWONDfH8RLvx
         XX2tz4ZNZNRFD8WmHdubVqK9rKN77nj3D978lgouQ5icjS6BfuLZg9mZ4ySflRBfKwtB
         Quvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739709; x=1788344509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1WIJvKAd2XOfDndIJ3ooRHt9ByqbXSTIWd0+xfU8KI=;
        b=Zre1ClSqh/GTSxkc1Mst+O8u65QGlIpVQ3RSTMRtLGJwjFhWt/AzvAnorkdkDDKGJz
         SczDfEaZKvCfKIgMw+FJzbjAEYtlh94+5QQt+VWtxIyG89uWE/PVsA4OWlWW0tRGVPBN
         4Futc2tGWLudaLwm2IHgbhclK2YxK24psnm8pLf0xUStV9dk5eLJvD5fMKJfaaYXMhm/
         xap6ie0IulxQntR2WKIMKU9eX6nAWAJIheCPCO+Gh3K+7LQcng5dS9zhBmhzYzQmVjme
         HTkTCXe+bK4G0EUdd6lGPGnpV/DioVap3bt14fOOE/uYlUeLyEo+z/5B8YyrjtQQJAfH
         6z/g==
X-Gm-Message-State: AFuF++k5HkLVEd7mE5+1z6KyTgIZ4BuP6hLiMv9N1pIZSOCbeIG7SsFa
	O+ZtzUtQLvp2her+m3bqez0+XZXsQuHvbQJRujhL7p9S/gZkcNOVG+ur1nGnMzSzuqmQxNMcEnM
	uPKtIKkAFyLEOEl8F5E3SdRo/CBOZnDe0ferX7TfjOQqmk4d1K+7laxH0GH/PrSJBgcOJbCAd
X-Gm-Gg: AR+sD10GbRzqHhVGibyY18CWs/fhEEfhL/LmrdYEwbH1wFgeenRoBX3apfxF2r5p8NC
	NxF8ytycOBhwNZDOpEPf9V+SeLD3QuilxXMfjSbkNmYxXWgN8IAh+EsNka4kFLwb0FMHQt9sOdB
	uMrBGvj1SSwlvDJ0/edQ2rExn4nzOMDLGlHN0LDxk18/TvzR/4gW1mP8nX8dJSMna6h+Y5c/DBy
	1IKHbzjnKtYzaI09SXTm5xOJDTZ6cHvRTluQIvxr9JhDinVWpzuwWnY5ICmSYv61M+lANra7JOM
	VcDa4IN8TrgVUwDg+Vo7xCwJP+swSBYWQLZh2D+Dkvp2e6b6hOeFsZkO36pY3TjbVXSuZb1/l4s
	Qh7wNbPWWNcIFf5OVVMKNnJs=
X-Received: by 2002:a05:622a:4cc3:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52e42416041mr58316751cf.40.1787739708336;
        Wed, 26 Aug 2026 03:21:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc3:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52e42416041mr58316301cf.40.1787739707779;
        Wed, 26 Aug 2026 03:21:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:27 +0200
Subject: [PATCH v5 06/10] dtc: dt-check-style: Replace Test User email with
 Rob Herring
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-6-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17204;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sLtLbF7S86pE8AXPx2k+gSnDPess+J9HKtzyUzkbn28=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4pD3NCPeVefUPIbZq3K5pdh/mdEt8PFdflL
 1FpG1plAgKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+KQAKCRDBN2bmhouD
 1zSUD/9UAnOBpfFjHpYshtoQlf8Z1TlrS6A7T+ZfPPyQw+99h+IIW6Lww92J5Zf4OMDSDH8IY/9
 PjUjutf2lw0BaqlnS2/D+9h49//zoiXgjZWZXvNWbxbikh9lJMrChkmbOFM+6nfMcPc/A8W2XiK
 DQCvEUeXMPWhoHYeungat1cJ3GSxWqLnIZzzxcNWxQbAEF57c8qUdnkTxLqbCzz8rMwhgE7+Zfq
 5XUbIiLeOeQFy5EJUAd8lyrS+L/lhvUXnmVrTRfkbISmgZqNe+TzG5AfdMKvytZ77amj3qDnnCD
 EADqYDq63Kg3WvKgJV7+oMnOC9w7++Y1YNkINHTVt2oqdq8BPtmtY3Ew21SOVtlucNTva8JQT3v
 3rbQzW0noKK21nLbhKhf47+Amk7hwwm8wjmMWyscEdrZRrS4iE/a2qJ7YZV7IHM0OafNTBBdKof
 QC8XrjfxP79m47jXkkBkgI7Oj8RnQ3D2IBIRQ4Sp33QhzC7sjsDnaYBhzwlCnWSqVaK0A4pFSjo
 hze56SiOzVAA9mokQSeSmj8wTkRAAXgi93xv7O4tvHLBtgzUf5Uy8T4ZfAVnKY7V4vW2P0k2Y64
 Qtz8MyPgMwgI1Ev0wCnUP6yjfwabHWDKlvZRdlHqsfSJ/qTNo7TPjRkz6kCcyOLT+ww+T/dLv/u
 6Ah15EvEzJ8xjdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ebe3d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=A1X0JdhQAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Lkbq6ki4aylNsx_sLmcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: xF6UzOhE0bhYWqt0VztwIM7d9xQoOLcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfXwrCCR6Q7AAvc
 cuJo/D2yZwCwiBdpMjztQeTUJFGSJvLPdbSxPoqfnX3OVmctWUrl8D/90vDvqW2lpozS9Ud/aIK
 Z9GxFFGiDXlLe5i1RoQFD5ynoeum8BnjJ7ulfkvzoFYgg3O1QyrFUlV2OZkqDk20ijPx91GJ3jx
 Zo9KHDQcwTeTeGcF23U7+WZT72kOJwP1Wz7bOI75m7z1b9ucNzwaZkcPRuTnFE+xux8P1zJyo6N
 YOVgn+PZr3Eez/fEqPNOQ2kh1AiKKgXpKqNn+r8uO5q3Lk7RnhZLB6sUg2fiSDMbqAXGXZMtd0r
 9HPilM3ahUortRcyrayXzubcD7U2hsqsETvjVkQico7BWo3KcHNm47D0SuOU0ZBR+qvyqUyhSgF
 zkJ5W4XApqAmbYQ7jIPIJSsSexYRUGaEU99mK3zn1e7edyG61fv3opwaMjp6rNpIwoaBC5+/nds
 KI6j9U3bBdlvTp5UvRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX4tLP4xMf/1DX
 VuyXGR4wijBoa5/I26BFhbLhXgtdOy6XM5ixv+68ES3rs7Jr/qyBVeuoQTlvpt7w4OPWzrC+pXc
 qg9/hpmH1ZizubdzU0XgMSU+hupp0r0=
X-Proofpoint-GUID: xF6UzOhE0bhYWqt0VztwIM7d9xQoOLcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

scripts/get_maintainer.pl reports email from the example binding
fixtures, so let's spare someone at @example.com from receiving bunch
of odd emails.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml             | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml               | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml          | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml        | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml           | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml             | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml             | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml           | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml         | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml                    | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml              | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml           | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml     | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml               | 2 +-
 scripts/dtc/dt-style-selftest/good/yaml-4space.yaml                | 2 +-
 scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml        | 2 +-
 27 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
index 3df56e69a1ff..7c3b731e059a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with addressed children out of order
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
index 35d85e5573c2..f3483033859a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with unaddressed children out of name order
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index ccf443173dca..a5a9eb17fc17 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with mis-aligned multi-line property
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
index 44a9d25e5ba0..068542a98576 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with digit-leading nodes out of address order
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
index b26d1bf58de9..c55359a4ca68 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with uppercase hex literals
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
index bee4cf118d73..155060a79887 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture using 2-space indent (rejected by strict mode)
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
index ba512869b702..4a69b503af4b 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture where a label is only "referenced" inside a string
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
index 64427bf1c385..6e4140e500b5 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture exceeding 80 columns
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
index 5401d1a423a1..c25a0d1a999e 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture mixing tabs and spaces in indent
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
index 4d9fa27b50a2..afc202a698eb 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with two closing braces on one line
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
index e107659fd9e8..9e714f7e7d47 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with closing brace not on its own line
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
index e2c69e9ff452..c71fb2c0a3e5 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with device_type
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
index 75582a3d2f6e..bf1480e97209 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with reg before compatible
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
index 767ab21c39f3..51abc540af11 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture exercising <x>-names and pinctrl-names pairing
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
index 8bb53240cffa..0036d5e0c4ea 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture missing required blank lines
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
index 487d07ff8cb6..937ecdd923b0 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with a tab in a DTS line
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
index 2368ada8106f..695d046e8454 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with properties out of order behind trailing comments
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
index 5c4b4bd833c5..f338c14174e6 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with trailing whitespace
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
index 63c1c08712a5..191ed775384b 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with an unclosed /* block comment
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
index 9b3fe508c5fd..62590948d2de 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with 0x-prefixed unit address
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
index 93705cd45410..5bb19fba5c19 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with malformed unit address
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
index 28d7176cbf08..7f862ae5a175 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with an unused label
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
index 504bf0931c27..1d7bc8142fd7 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with extra whitespace in a multi-line cell array
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
index 342ab9f399f1..a5082a158155 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with extra whitespace inside <...>
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml b/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
index 1502f803c24c..b91b8a8a9512 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture for dt-check-style
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
index 2e7b8582bb7c..8463075f9f4c 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with aligned multi-line property
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml b/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
index a836d5f36b93..a95d07f883ef 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
@@ -17,7 +17,7 @@ description: |
       not leave the parser in block-comment state.
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:

-- 
2.53.0

