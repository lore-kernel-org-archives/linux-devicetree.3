Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645041DE0D
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438024; cv=none; b=c4UFrbONtFJedansvJix2dAf6TD5GRuNDgR/DIeYkjJSVCllUmfmrN5g8nrb/NCVkNHprzype1+XGWWJNRII+8HDi9MIDvvQoh8B2hKslsFaDi+RojyZI/8u1hHZrxtwH2T3AsYuzyHl1ma3Kf4fD7bV86l7b0dKyrH3F1NgpUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438024; c=relaxed/simple;
	bh=Vrqbe3PziJS7pCz3JnhFb65npTWaA7PtPpdLWrZzrHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WrKhqjXAZC7Fi+1cDOuqSta80hVr3S+gxPUvymDPFEZazqUvdI6+Ww1Cy4koMZT/ohMiBKtQriEz0/4M8/xLRC1jOM33jf5e59GIkjMVf0Tm1Q99eG3gdj3PlyXQuLzcaWZJcMvGlY2SLQq54CTUHt73kSpV4mdDfCnG6A0/s5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/Ojntvc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrSY+EWU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/Ojntvc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrSY+EWU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B7FJn63552848
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y32VxZIMJ31NsDKrZxdWTg
	WlYYuXWFVEtOuF6W8d+oY=; b=Q/OjntvcqmEt2WNcOQ2nhVKhG0YTEDlygjSNhZ
	zlL1uRU5+WCUgiJD3VAGk6xVRtWmeZuLyJyzJCNS2tb7HWbzMJeq53mtVuSpBEGq
	rZYwRriR/fI1OyZHtariBD1txBLRd6sDGwVjvUnh6xZ6S+p2d+Y7zixUtox3uucy
	gvfSJ4DHvOFlL5PLsX+++GOuhuJ6Kwijwvoqk1qVBYEH2j1e1M5l82RPTX6TzgtO
	bR3wxXVyQnMv7NtGIN8aUaQEsz1XbjffwPkiOBh41pejOB1g4gcGkygYW94zs8kf
	6ZpG6U4HHH7qRCa6HhzcPlHHtUe5zHbqjQQS01X/XsdabWYw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk1wdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:47:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so42357945ad.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786438020; x=1787042820; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y32VxZIMJ31NsDKrZxdWTgWlYYuXWFVEtOuF6W8d+oY=;
        b=ZrSY+EWUMnMP3BFG6Bf6O7bhH3/W1sDLNJ5iYJ0I5jQqxLahCKbRBCdnOOgAe0bGng
         5XYBZuPQ5TM5cVgJPpw7iZoj87obp8P5BOqM9oQnMnIGlOmYT+Ph6wN2EJbPO+hyegHR
         UPFSEk3jMKJdmFcwTsnixN2m4DYbYgKoc7kQCGe2E2+QlhKTOcRNV9wNDww77WDMpRef
         xMBVKeOcQeFW95H9EDxWnCNU4/5zEf4J86rtjtq6Ans0GCQkRcGWNac/oYQikwmJmVNd
         JepOEAzsKhKFSDYVQrHfqcNnRwKvua2fbj/qwKK7kuqq+4kFS5SkSZ9Nc6wjzm5w8tPX
         Ll3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438020; x=1787042820;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y32VxZIMJ31NsDKrZxdWTgWlYYuXWFVEtOuF6W8d+oY=;
        b=UyDD/y56ye3LzKpt8N1jYHDxX77TsfrpH9UOdBMLzo2KqexoJI0oXMFBaH0TqNAg17
         TZMwmNOvxkNITtAePUbkSW+TLeS/Y22AWlM3idg2F328NJ5COdn1xYobay6KR4Za43F5
         0u0xA8Jd8nqf6cqKTtOF6SOTZbY8JNhj8VhW3CRWKtXeyVN1PRw8ewz4EjE+97DtNvi2
         msAZUClLSOn65yWEY7zN99LwPi2kKxPeCaslUcIfsXNKPck/fxyZJtyq9ags+tCehutz
         u3UBH8d6vcFbGWVXkTL8b2nPSa2Ro2uIkIHFh43wIxaDjEDHK6sllGeDqbMdQLR4EF7O
         5IOw==
X-Forwarded-Encrypted: i=1; AHgh+RpASIN+zpl6HM6HvQBn/OPHpcZ/9SDHJKmKnAzasJKnYqlbNguhRmluLcu4xqkooqH0QGDvbVFnrpIF@vger.kernel.org
X-Gm-Message-State: AOJu0YwLmQpGkb2Hid/Z+z99lyci1M3doXsWuzmF9shaso+RKJlbdaAo
	qjsgwz5JOlBXuaXI/FrXOV1kO5b9WQOoAk63COWviyeQu5RSObqjbJ6I2Cu6ObNZL2UGI/5S3X5
	39k+2v4O881OG7Xb4oM3/wawYJn04v/2ilYWUr1iz/12dUAyaUW0WVyPILkR0M2TM
X-Gm-Gg: AR+sD113h3aEYtnc3idt/zL715d7fPLsc5sf6nAs0dHyp9OqUGBT+LQ2waPCfgX3P99
	+nu4BjSrej5X9QtpK353aQ2imNkEVqS36/CRaR6Oq77xhPQyRmDrlSf0LRmiMI4ekkh7kvn4pf8
	VSDuTeUjjbSthmPNFwWK3Fw2ubCs0SN2ntLW84OZaphCmC+4zng1aqWxwsXJ8Q64cn9j32auTss
	Wd9wB8HjzUjRriUxSN1k5X9kwHZOZFPZErUa/gqJPmubaqEKxGPfXZ1+hvt6BIAQemy1H9trOxC
	tw2u2oqmg1vAERE3dBgCWjN7K4EeOlA0keSiaaAZ1ig8uJct7ew7JCB7QX8y0CVyO6Tms6+Goec
	tmu/lVz/XpklHNiogD3NRXUIYKIvYE1TCJBQKsqKusNkngzQoV3fvIgdtnTmQ6g+UR/1JcA==
X-Received: by 2002:a17:902:fd84:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2d3179254b4mr22845115ad.19.1786438020418;
        Tue, 11 Aug 2026 01:47:00 -0700 (PDT)
X-Received: by 2002:a17:902:fd84:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2d3179254b4mr22844615ad.19.1786438019938;
        Tue, 11 Aug 2026 01:46:59 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef0c93sm4070745ad.6.2026.08.11.01.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:46:59 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:46:47 +0800
Subject: [PATCH RESEND v2] dt-bindings: interconnect: qcom-bwmon: Add Maili
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-bwmon-v2-1-80f7f150ab9e@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786438016; l=1447;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=Vrqbe3PziJS7pCz3JnhFb65npTWaA7PtPpdLWrZzrHY=;
 b=lXcbuaMm3ftVnU8z+i6F60IcH5Qt0V3Zz5vDCkEa0lQsY2qV8hoSi1EGqojVhJyGojQmA5kaQ
 usTijjlf1/PBjlK+AwLlkthlHChQ9ONJwV6iiCGaQZ3Ze3IxMSJgz/s
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MiBTYWx0ZWRfXzf/g3p1KPeUe
 ZwtfH2a7gmt22lzDx5mDAO9aMI6Mxaw/jTccXOMnaajxhok008gNjEe5pwkpOY7Y7llHnjBluDI
 uklCYFGPVueYZgDBsD9VO/diJ6U8fZvp3OqgwyO2mVzipqL/oNOlsJ2ZtUZ4LhW1KjnVnhFPpnF
 p7CwOUlFrJwKTmx1U3/nyNtFheTOUTBc/PBpCo6wjQU5dsfChX4fwE8VKvDOgEpBaBuxrAZJnWH
 qb0jsWS90bTbrzGGi6xbE4p19BuB7bbFkZvEcJ+yZIwML3LPxGtycqFeTOoItPXoQatFioGyO06
 uJfdkNOOXBuASJVHDnZS2p+ObuSus+R8my5FerYk5Mf945hpa0V8PaMPsgW7UEznZXL7C3gfxkO
 f1NihNE+Xm/IwPrP2dt3KGjmqRupzaPwzE1haKltc2ogLogVYtnuEyO6GDKEIfu19ayDO9RrKwh
 hxXR9IFSO8jbgqVhoTw==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7ae185 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=XRsJJl_DE4KtB7T7ePwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MiBTYWx0ZWRfX8t9fdV/2etT6
 hyiKn+X2izHMuEf7GHxzvsc73nEESRpxVuCquKoMNlxCdA1M29phjnHdMPrsbREEJ1qd01tp3DP
 bjpJXQ/l9StF2e6Nd6mYSgW9Okrvb8k=
X-Proofpoint-GUID: tns0tqZ0RU3ACA4KjTleVgd9SDnBsbKh
X-Proofpoint-ORIG-GUID: tns0tqZ0RU3ACA4KjTleVgd9SDnBsbKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110072

Add the Qualcomm Maili SoC compatible string for the CPU bandwidth
monitor (BWMONv4). This falls back to the sdm845-bwmon compatible,
consistent with the existing pattern used by other recent SoCs such as
sm8750 and kaanapali.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v2:
- Drop Assisted-by tag; no functional change.
- Link to v1: https://patch.msgid.link/20260525-bwmon-v1-1-b8f6e189c3e3@oss.qualcomm.com
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 82b1d94d3010..7989db1aa774 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,glymur-cpu-bwmon
               - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
+              - qcom,maili-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon
               - qcom,qcs8300-cpu-bwmon

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260512-bwmon-ecb43fda63c9

Best regards,
--
Yijie Yang <yijie.yang@oss.qualcomm.com>
-- 
Yijie Yang <yijie.yang@oss.qualcomm.com>

