Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505903C9EFF
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825034; cv=none; b=p1P+xJgRx/7AQieo/121lsOLyUeg1YvB9JHrDn784gpK9oELCbSvV1O/VkQTJ96C1s1CBCsBUoKYfUeEjglUeee+sYAW+ddTlNg7QVu0p3U701zM/IGmZlfjPaScuqDLb8fs+bwODuIEmoZDjcoMAU5f+O5jmrp3c9KKpwAhqfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825034; c=relaxed/simple;
	bh=PkrA902oCgn+IeJNZKZpPXeZDH/4kasO5jqKwwCH2uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1WezwH9K1/nO2Oggmce62rYUaCbLQgeO44kWp2zVdXVUr5FxzTS26HvBHkZ3PECp1p4uELQegOcqs3dIfNHzP+fhWcIGYVgXnnPwU4wiwqcHl3YEOKcf9pKbYqbwTEULp9GmmUYx/ifhnSUCnE6sKZhJdYBBZv0LOYumjYHD98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7Sk9Vy4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLxLzzDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7Sk9Vy4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLxLzzDZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 643CifIM2168140
	for <devicetree@vger.kernel.org>; Sun, 3 May 2026 16:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/NKDtmZPPlV
	Ttzu16Ne0F6Nn7aFiPLLXjpCM/e8lyd0=; b=a7Sk9Vy4e3Qyv1yC3bnv5AcFzrx
	VrIM2CJlgwwBgDBMF3T0L3DwgyiAumN2nNIw3f9duF/9tLPn+tih/etv0wBVrsF8
	lmvxK9qG/M/OYTzaTa+6E06BIRi9s71KZHmggQxAlhSNOIzBhyKs3iDNoRHA0llI
	9zKJPFRja3+oyM48WUuKBGf+7lX6Wckko9hnTo9D4Ys1++FAm/znTH9yTSrJmbKK
	61KoY0Wa0U3+X5NfdmLXgwGUDJj/yYMaNI6b6QVUU4IBFNSx/4KOvTLVDCxtmYv2
	CWqS0XWkthvWWe3qPvc1wIsN37Z3mxONmtY+ILVcAojS6k4PW98SH11kG7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8kg38p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 03 May 2026 16:17:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e423a05c8so93016161cf.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777825027; x=1778429827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NKDtmZPPlVTtzu16Ne0F6Nn7aFiPLLXjpCM/e8lyd0=;
        b=kLxLzzDZcsztxAcxo7GXZdDup0MDCgqrHeZz5H9EeLJFSNdZGW2aXJU1rRulCaz9NQ
         iqzbncHcVDOPh7XDajZGcXJQ6GJta4Em+TQt0YHJi9QRKjFS4p6FiTVUR+1sL+y+xl5k
         DwCkW9kLgTt6s3kZnAldsNP8z5PTtwGs+JRBF3kgzOobjlBt84hc7ocvWYZjStvsIaGE
         7aVuL3j6Cm2n5dyGB/ij985DeuSoTCYzxZr/94j3MdJULwdCmUMaBab+xFGsTz1IJYVO
         S+gjx6lc221QATh4q9v3+Nwgz9fLiFxNbkZJlSd0qv9K4MVS92aAsSLryBajh7HCN7K3
         gx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777825027; x=1778429827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NKDtmZPPlVTtzu16Ne0F6Nn7aFiPLLXjpCM/e8lyd0=;
        b=XmkMSnI6i9vW5AT5gdrEy0L65Arud4zMhEc+b1kjqwLIlx0IemAtjHjSyeeqtXAlIc
         l8hrzL75q9v4jllxaC3Aa2FAC1uCbY3HQq+LQFUtyWxBUSNfruibSKybhj2qOdNXzYCj
         jg1fmPh+6I4lHaPVUwjO7EOWpeKlJ/fEyvFmuNZkEdBNW0oBcF1FmnV4UIN/hOzXE2sz
         RQAVSuofjmMtwLayIGdlNynA2cYbQjjm2aPZH3L8GilJnS6md536fFzkkAg4BYKO6ZQW
         +Rn8bW0cJd5AjUnRj9hanKeh5pcQh3jC2BPYhd/GtWaS7tZwAjf8D7VmqDQIVggKKtXb
         0/tg==
X-Forwarded-Encrypted: i=1; AFNElJ+2LmI5Rm1t0PxyGBqi+AN/B8KsEnUIbjLwCGQAHQRdkg1g3dcbvFxL0qc1viqsrDkt7n1Q2RHb+VEc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi4ieoPExUhDEypedWIdLNbz002d0jTsHliik1d+dHaXUfUKnV
	/8oKWrkh4tapHMv+gy7z4G6ffRDcoJGPrt96sSJX5ePUT/15Tqu/f5YDqLZzONlp2bUq1vux6hi
	kozPfHvyLsk7woDpu1IeEaI4294UIirMZTpMMA9P4NZSCFb0DX6H1NcVFZwLEuEWI
X-Gm-Gg: AeBDievnW1XDgNUZZcLz8rO7utaDgm3DO5RzN8ULUWR9mcO6DVFPpsRTKTjl4HcqHrh
	PtvzMZLLzEhuFqj7kafXQrNYeOcENZl7tnk8cUmjuMv3ZHUmMLOfug4sne+61eya5nE2W5qIIqH
	0JR22ONZgU9sToIV7dP1yfRYS4PmXMpJZhkIhcGyQ+4tqoD2eCILyCzjacE1QZ7WHZivISem/CJ
	N8PRJ5GXNiUca6A7BTViWOCwL9tLCJ3KOrTb6KbUJgN9vYyP8vvZbwFE1d/qcmXuHBN/PRg8qbr
	YnqyDAXG/UIFktHr/IUF0uNpV3CXOfh09NOCQSiwXgabFetxoEryQ1c4KBU5BWTX2/KrW/Pa/38
	169/+8cF3JuYo4qPi6gc9K/SHPLkDGEKUz63oUaUHERUJ1R8=
X-Received: by 2002:a05:622a:594:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-5102d0fbb4cmr182729791cf.16.1777825026733;
        Sun, 03 May 2026 09:17:06 -0700 (PDT)
X-Received: by 2002:a05:622a:594:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-5102d0fbb4cmr182729501cf.16.1777825026314;
        Sun, 03 May 2026 09:17:06 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69800sm198912675e9.2.2026.05.03.09.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:17:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] dt-bindings: interconnect: qcom,sm6115: Restrict children and clocks
Date: Sun,  3 May 2026 18:16:56 +0200
Message-ID: <20260503161653.60785-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2105; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PkrA902oCgn+IeJNZKZpPXeZDH/4kasO5jqKwwCH2uw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp93T5FoPq945j+z6yFjr6XMHht38X+e8RI5pV9
 6eeuxXc6N6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafd0+QAKCRDBN2bmhouD
 10g0EACPuImuW0DZuxamCKlivHWVZE/wnsaxhGNMbiqLh6/dXE2WDBDkg9rnaENFZew2MG+KZ9F
 trwc9Qi8opxlxTiANc2N3RtKNP/z6egjk67fN9EyIne756Y10H6FN50B3+3N8UESCk72cG7tg8D
 NbxNejxnSb65JCrbQczPhvn5mU1mASu+zVrziK+eHqrMXcyxSNl7BXN0qKKrVFQi35OtP/9CBut
 wgxv7ScwK0Kuwk1TQxk+8YFiJG0sfAYO79xr5LpOqX/83TYRuon4E6rsIcQWlcMNkbcpXn7gVxv
 SStHdkqAFA5PCM/CEirYIt5sMH3u/JmYNphfBcVrGur7im840lTsfxnGOfnIQdmeMYGFoBadnkA
 NBPNRIMw2ufVt8U/CJpRuTJBFj/YIzdpFpA1DrfHLFOm00JcomIQAEGejssuxRWEDggwXB9NNtq
 0A0rprOjbSkyIyeNLCx1PmL8HtE2NT2gMU6YcH8MR56fhhxq8D3EWsWOSGZn8NT9hJEBQLfDg6E
 qUMJIrbZAgB4WJt3XzHHOOEO2e8nbwrTxdlnNrtdgtV25NKtLgdLN2lYjmxRpIwTZbdoLaZomva
 Q3nV81h2QTlfAQyS0mwE3nURx8WzzTTt0N329fDO3BxZeeoE9v2kIG+kXokJzjXhiowKSggOScb SbsUiW3r3yhZbMw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P8sKQCAu c=1 sm=1 tr=0 ts=69f77503 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SRmnlaPtUuCDtAFh0bAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: a2Aa6sg23ynl6B69fhR9J0mcaMJczU6N
X-Proofpoint-ORIG-GUID: a2Aa6sg23ynl6B69fhR9J0mcaMJczU6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAzMDE4MyBTYWx0ZWRfXyIyUO5Iy1jem
 EnmE/b3SxtMi5NGCnuAxnErbfMyCXtssm73HiZe+yZFRikBhAsNWOa3YvpMN289d7KHzng2CNZh
 F2tCOfs5tse8ap/9Ov3N/IUy3L04h7YmxxgiIcwMcq9NtmIFTQ7aOF5BkWEy3qXSCXyCq09ewWg
 E6WOTMSYQaZ8b8xJnZql6DrjaEvRDzPrquZg/ccPrEopi71PHjVmTgDFCPBuSv4LwJRkIIqZEoC
 koBxw2DcTVU+NZKz9oqjtar4sHkbJFv+uZ344jBKarrDRaRQ5UtszubcEPtmOqLDIS/rlqaclTz
 bLP4tFaLdsZegy4432FLGDzoxyiemD/9Em4KJFNCs2gApx0F8VRiUZiBlGXuaJTLGEB2iUz05oR
 dvm100bgV9djfCiOqMotBKX29NhNrwdflPxMApOwdW3s0N8lltVxQrmTQiUqkBozyWOkv3BBLFe
 Fs1odktZqb6xicpA0xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-03_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605030183

Some interconnect devices described in the binding have children and
some have clocks.  The devices which do not have them, should have this
restricted (disallowed).

qcom,sm6115-cnoc has a clock, thus also extend the example to be
complete for this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,sm6115.yaml    | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
index 67c1705af50f..cdae0acf3a1d 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
@@ -62,23 +62,33 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,sm6115-cnoc
+          const: qcom,sm6115-bimc
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+      patternProperties:
+        '^interconnect-[a-z0-9]+$': false
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm6115-cnoc
     then:
       properties:
         clocks:
           items:
             - description: USB-NoC AXI clock
-
         clock-names:
           items:
             - const: usb_axi
+      patternProperties:
+        '^interconnect-[a-z0-9]+$': false
 
   - if:
       properties:
         compatible:
           const: qcom,sm6115-snoc
-
     then:
       properties:
         clocks:
@@ -87,7 +97,6 @@ allOf:
             - description: UFS-NoC AXI clock.
             - description: USB-NoC AXI clock.
             - description: IPA clock.
-
         clock-names:
           items:
             - const: cpu_axi
@@ -135,4 +144,6 @@ examples:
         compatible = "qcom,sm6115-cnoc";
         reg = <0x01900000 0x8200>;
         #interconnect-cells = <1>;
+        clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>;
+        clock-names = "usb_axi";
     };
-- 
2.51.0

