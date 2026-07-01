Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9C42E018
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903541; cv=none; b=e3yEuEKnb/8omYOutUJvvug3qLqYRJKtSI9KNlnW7HM9JXJ/siDA8OC3TeMhhDb54b2ZWIzkrruLYF366A4YVxw7gru0w8SP+fJyryi9OvYcMNqRokorcG1K/y7n2Kr3W1HcGIVGfSHL+SduU0qGXyd1BTPSAY325PcWxu2t2cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903541; c=relaxed/simple;
	bh=CKhIr/XIg69RF6pyT8Nxp1+2IRvTyjEQEEoYXrd4vzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjOWd4ci2XN2sD/lhwXgOPUlXhwBG9yk4f6epPNZGBi3l1vEFGTSC5M+CF70+WMwpi+NLzvEHHDgNFgK7tjPmdWLjQ70/ZIn4QBMZsbQprDSQYcC+P50iMU74c4eMXHUiRBr1mNNIA+gDMxowrPAyPkxGz1XBrOtvoDL19TU3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPyuabJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zj2S3Xqh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPyuabJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zj2S3Xqh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8dkp754631
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RZP71cCTtjF
	AT7ABrPSL1FD1hgHY+ifVGUdigE+dsC8=; b=fPyuabJqhW4sB6R/PCNXbeQfFct
	v28johzREnukowS/9kAUPeY1Lnf1WIMrXxzJ6xRj7IV0UzBP1Rm9X1BHYO2DZoRo
	jRCDsznbWnHdIypLKqFHbFmIs+q4zhpjmFakLVIbd4z7ZzRgxqDnTB56WUjRTnnM
	4cUL2YEFofMwgpcRkVwHFYCuP9yGLf6TJp/o6Ly2s37YG3SDFaEHfBe+GE8vwLUk
	95rBDQ2wgPZWxNjvYzXOMQkuZuz+kcUgdve/ClNV1mWiAfEf4c2h0UhaEcTDyivj
	jYA9qhnmLHrClhwjk0c30BhzcIn2nhULkh+F6W2Vtz6wAc/DcCKM3iVKxsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqr7vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:58:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e73fc29bfso83644285a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903539; x=1783508339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZP71cCTtjFAT7ABrPSL1FD1hgHY+ifVGUdigE+dsC8=;
        b=Zj2S3XqhXIOhkG/Zu8vQzsoT9LGFqC8I8dKtmBzaEYEyNm5/S6gV2qMqcj7Vt8gVhM
         cgPSIjxQXBySSdnWJ10WHEHzh3ZJqhZoB7bGN0drLIIydwLhJads17klYhZpPfiDWxjD
         FsUrrl/SJ6R3sNkuGmRji4d5peEgXDm+suqObda5QzZpYcWQBkMeZliBubZmAE1xmHI0
         S+9fkZUfhguH9t2ftnLDds2epktdOryiBtCPviz+eAkhtCP7ZTMRRabxiDXUyyZHraaV
         qq3+/8kQTb5zdLXMDXd19pTclkvLD1GYIT9+KuMjlp30L0/zIEQdXOcMiIT9LZf1tQj/
         rOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903539; x=1783508339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RZP71cCTtjFAT7ABrPSL1FD1hgHY+ifVGUdigE+dsC8=;
        b=dQS9bXhRdDhzjgdraeZbUTuYWgZvSflnF2yVNYOFgMA7srT/0nO1gXumenj3irP8KK
         IAHGcXuMcM9qlJuGXbyVKAmQk8oLvNCrrTio0b7lJnD7Pr8RnQBPXVP6YLJ4yt0fIbTl
         cDjUYI7zWuvAJPVMAD+C8jrlkL9n4Q3CBcaGq9JfkfJakT+TxujCKDM3ye9AZz0LDK3u
         35UwzVq1wJ7lNOc+rW434bpiHDGdHRPFa4e0dc0RMFNAp8cTcjYKpORxk8udD5O18ec/
         XHTatNKTwY9CGz1hIXisIdZTFqHxe1qwvIZ+/798VENY1PN7xAj0Cm/Uj21TA09v2/PR
         rc2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9xx6SRZhQLJUf4OgsN440WRk43H66DDFjR5yOJLEPVphwg/OnrqA5XS8bmxlrtIQjgHgzayLrmfGeu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/VYbEG1ky5LNSkxGFf3onhakArbciP7t1SG/mdhjLh+QUc/s
	r5kqHYAT+gs/b0VtLbGNQyIMMVwi8ekp0zOXnN1DbmER/LAFYknIHLW2+ljhmEu4FuUxn+3yL6E
	y6zhRBYot/hEGFMbzbj0gtQo68jcCw+SE4wJx9ZHGaB5ANnCtDVlhdMML57yq1Pdq
X-Gm-Gg: AfdE7ck3PQKQqCxJvmpG9xqBYpVO3FfBmrW2kegh3po6N/6ztNNizzwtpcfT6uqbMGi
	nz1U8whmFZykUsHu0XU7oQ14mJdBqdPS+4Rdx6it3wR5gf9u5qlpiy+0aO7vcV7Y1C1xgjcTaab
	7NYQSi9M9lFXWh6vZlXTpEFEq5gkFMA2JBmPyKOzLON95+mA52RMA+Ly8ZlZtMj/vJ03la9dC+o
	XcfMiKt97zMEK7SnEx5CDoqWgzG3kl3k95XDhb58eONbHnZV4imma0HVnrcjYcF7C3k+C7sT8ID
	sIZ4g1XxO6bJWgYlbde4E4iu+c80tiiRYnnM/Nwaco9AdEuvoS0x8JhCv4IcUDkguQYkmQ+gz+n
	0TqmrKpwHUhNPSd/bEtHj2ll2rAU=
X-Received: by 2002:a05:620a:468e:b0:923:8612:f15 with SMTP id af79cd13be357-92e7823fc78mr134300985a.18.1782903538973;
        Wed, 01 Jul 2026 03:58:58 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:923:8612:f15 with SMTP id af79cd13be357-92e7823fc78mr134299485a.18.1782903538589;
        Wed, 01 Jul 2026 03:58:58 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c0e92687sm33275565e9.0.2026.07.01.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:58:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: rockchip: grf: Narrow allowed reboot modes
Date: Wed,  1 Jul 2026 12:58:51 +0200
Message-ID: <20260701105849.197086-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=CKhIr/XIg69RF6pyT8Nxp1+2IRvTyjEQEEoYXrd4vzk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPLqT+HVdGxTyuJy8eAd2Wn/Uhlrtj1ovCLM7
 BMUbZ1oUgiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTy6gAKCRDBN2bmhouD
 16zcEACXyQvU8T+J2XLmlZsBMkv95lOYp63lNjg/KDmsamJNi8lYJW1Qk8ivFzChnUXr0WoOXqs
 W+pe1tO/n2h0YO46JNxv+TYi800gp/BRU0GFp0hjmKw7EHGe4Q03K3BalxH78Qs/BNFhjbXWvSc
 E0GaH+/CNbqqKJTWVvzLCPcmcX160qolrYphYRLEpLUv9BwWfPlwFo0yzRHwdN6eMTPwfevUNuX
 N2gVVSAMjrjBMw9BUzhswNNEF3pGFtonJAJa6AGotkPfUXSrKnZTStOAgoOGUe/DNB+2tmDpab2
 ep0+URrhDd6Ceqcne5xIR/DzQtLmJQIC0ffZBn80MrsnTdF/9EkTNmIpE5Is4s8RLE8rehky3WJ
 IPzgQiT/6VZdyZPfYz3fJ//+C0ebjWg6IPeXRVxzvJC52f6P5ydArAvanUUgjjVkU3gWM1xIGaz
 P4zi+aeC6Y7ZdiQxURrPgJgzqCpJrQCV2k1Ty3/0MNPybKjFtdStOj3aIL2IBNqUFnJ0I5Wad7v
 sU3/WsfDxh+dczj9SAkVrlJXPC3rWX4Zu6DiZZ5JbRx+6S0QO2sj63AyU4XZm7wpCa2y1GpyObT
 bRRauSCLf+gB86D8whCr3Qtq36AebBWRE4KCWqse4Na3VJ3/Pq219sfDfcEE03E0f3fayW9GT7j TMb8dsW6NcipuFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fr_wOwW3eDOgGkTvxIcLHU_gpfpsKZjJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXzliLrjmahHIR
 bxjm8U0dstRqn0NlFwC17bFpfsMpASFF1zqxuKn0OJlWhIJuuZj9mvir/+aO5NVdP2db0548g3H
 LwSJjfe9heXCTNxDdAbJ/LpGiXIch4g=
X-Proofpoint-ORIG-GUID: fr_wOwW3eDOgGkTvxIcLHU_gpfpsKZjJ
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a44f2f3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=uYWl5qKCkACiJsL7rIEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX5RMYt5y7DNT3
 A3aLzVgRMHbPm7/Kw96Q6R+jb3Htd7Kf+i54KB2LfoPHFQad8yxRn1tzlxEJ+6N6WBSabygSdr3
 qaW+zIklo0xjlqyTyEgzz/TRuSANgPZEdusK6H2A9T77izLGUGjkizaICbOK/I+rprTlmMDd1jO
 Tx7Phr0PVUsHNbb2i4/iJMASX1QFFp8t5YlIFZBy+HL7BQ2oVHieXLBVnWuotk77jL6mgPHcJy6
 dOiuEgf/hX57j1pFvNgxELjkfSf6x8Q/2DSnVwHBzhaAwK6D3Cfg6ilvfXoAyP4zdvSqSPA9Fzi
 gZl9GMjVB4Fy26HFs8h5OOU+Ulmzh8n2galywI+1DDwkp7K/M8797R8SHuSVop7JgWsf+5NEfgV
 xwv2j1IFDcymFYSiElJAj8ONvNgSYTSPDp9YvKiFt0iNgQe6vmq2T9smU0qv761WWUpufrEOUzN
 OkizS4MXXuBryUkQofg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115

syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
a subset actually makes sense and is valid.  Provide negative look-ahead
pattern to disallow any modes not supported by the device, which
tightens the binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2cc43742b8e3..7bcb4e2f47ec 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -239,11 +239,14 @@ allOf:
       properties:
         reboot-mode:
           type: object
-
           $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
-
           unevaluatedProperties: false
 
+          patternProperties:
+            # Negative look-ahead to disallow unsupported modes. The '$' has to be
+            # part of lookahead group to work, instead of trailing outside of ().
+            "^mode-(?!(bootloader$|fastboot$|loader$|normal$|recovery$))": false
+
   - if:
       properties:
         compatible:
-- 
2.53.0

