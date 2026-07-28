Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EEC3E63A4
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223576; cv=none; b=Xx3fsclf9lS4GxoEwsUXP3V02c7bh55YKTmdcqTUPAjw/Kv7svLeu/i+y3QMBRUwV0ajkgatMyjpAizX5tQnyk6lqohydi+lAmjpwyFzxCy4/aDxbKOc3tlD8BWg1TzTg62TwYkTRLA/yx7PF3+cUNUx26io/VRiq8kW2cSb2XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223576; c=relaxed/simple;
	bh=Ay5gY5zuT57kQEmeACflTdBVR+MccGNrdp1Uyl/qI3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKSEH7LKZXz/e9Ec843rrQ8MrBNzovjAjHSXW0E7O7f8MoeDeHusjMf7LNGm9WQprMOe62Ep7GTUxr8GAdXsGW9MttpQAis/fmyW2UD7783UnuFO/cGIfs6P9PqPUOYfvgIgF1MIA4DvBB8RpidvuXhq7KDUEYd6XPJxdgmlqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9A7ShKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjDhqf9r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9A7ShKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjDhqf9r"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3abJW1527460
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfqdXNczmYB/nHt74rJ4NHMC9w5JYT0kkzYMUBJPysg=; b=o9A7ShKZK8Kqx6jj
	aXjSAF8qiq7kX6A1COtVpmPQtQ8CXJ7yorugMB8i+FGmP90qyZg8D24Yi2OPqIZ2
	L6vsQGJzsyzyiRNhWoihGhH1Z3zmXBUx9/H02fCy21iznEix8boTJMQYEPv+Bw9M
	x78Vs3g/o68uknTuCakqkPbyHiTiHRfeD3V/Vp2ZPRm8FijBnvDWWNGItYSEFd4m
	pxX2Ju46/ryfT0KgZKwTK82+/4ghNx9k1dNPzNJGex31tAhLiqrDQAUrOXNFv9WR
	/82SGtRiI38lyDTnQ8c1V7dmJQwMjG5BE4TV8zYMJYnzf/A+loPy3lI2kgyPDqb1
	ot61ZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8b00d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-522de3c645dso11862811cf.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223573; x=1785828373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfqdXNczmYB/nHt74rJ4NHMC9w5JYT0kkzYMUBJPysg=;
        b=TjDhqf9r6TdbA19mlMydUIEZ5+1SPkUNTysIW5r8wnKagHcJ5//FM+pq1bNPQ8TByj
         KHxnDlHtRGPS0QzXGP0hCYrOHPB2VWp+DgGq3m47RLpyF9LRi8na0wO+z2+FKkxJNJxr
         m3eQhScu8A6JYIZs6lVIKxKPnbIM2kTVSfvo7V/fUtvhuIuvLglxE2sSuoO1iNwjPbNq
         YOXYVpaERr+naZR26kswuQw9UVLfr8VhUmHpnVSEb4h7YEQxoWYm3kBjxzMRSnHK0Lvx
         fV5zdpsrAldgo1Ayxcq2rkakZq6cqH8KFve5825xUBh6NEfS7KcGTEnRffG7G+1Rf8Nq
         JxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223573; x=1785828373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfqdXNczmYB/nHt74rJ4NHMC9w5JYT0kkzYMUBJPysg=;
        b=hQgJ7PgujJapyZWaiiBt8HNXOOFF4RECoFiAKYpyXVNewoyZdRdKCx028Wa9frC70M
         zw1SMgVxKP23QcnyDReQ43zBFav0I0tAT0lX+ZjpE0gLH0AAO69/NpyRV5liyLmaI8iC
         kZwTNjSJFZXzu0FVsQdOvbYm7IGckSfnZAhvs7TXlIJTKKLDWVCMPfx1ZxClHS3O6FOV
         3os8lWW1QYiDXs/OVkgoGd39LG++dPbcxYQR1C8t0sR4YicZTdMPh6qHPA1/4EkUtdT0
         dIBzNAnJ9y3Y4+rV63iElnVJHYFNUCkwNS7hKQ3Oz/uql+ta27H0equ7YV74iQ9qpdSB
         gKOg==
X-Forwarded-Encrypted: i=1; AHgh+RorBji/e9WQrlqUu3HvfrcK1D2iMZpF0K/dLPFQdWX440ZiCXwKF1eCv6Zj37QlGrYCOD/d9BRlMxGc@vger.kernel.org
X-Gm-Message-State: AOJu0YyffeBio/0xG9mYG7ee7yUJkjLHSZIC011KTtN7BgVKnrwRLkRr
	qvAWpIanvz8iNvR8l/FkOS9P2u+c1Yli6CebJ/CkL7kG2eqm7gzeHFezLO1OivlsxYC1Esmx17c
	U+iOMhtBnPNUY3JkCA5fB9XJkFGNWK6u1ezWWyhc3ESSLNNuNtJtTpLZ3C4VhRFzo
X-Gm-Gg: AR+sD102Tr7LatD5TE8W+OuTnbcLWNjvptdUTCs3v2Rao7Bep+W07TofKG80luQyboF
	7KJKjamSaHGF6OGTJTzaEJDl1Fg86uQS1RnhCDmeB7nl5l8YgGoa7yGRVP43kybPOlaYb0xab+7
	fMd6zdl7DKNsRKoPq7Dum4BKGIZHKr5B6ZVe/p4y0Q6994vCGLTODbwCG3WGpSJ4WKhlsLL8DrM
	AD3KH+cvjuRnw/g89iHvip0TJ7V3MobO5EJy8gnCHN2JzTZK1qOv2/P1LJRnR6Iw4Bzswga96Bf
	EGNHqIXVy+9nEBBeZpvOs3I339zlwUHZITpIyOK+cDoxBXhaYBLWRu6PFRv+u69XcdZSPRl8GSQ
	UrzejM/qHx3a93WOUr1QJmrgS
X-Received: by 2002:a05:622a:15c8:b0:51c:63d:fc10 with SMTP id d75a77b69052e-529d6fe1ed4mr9167001cf.25.1785223573246;
        Tue, 28 Jul 2026 00:26:13 -0700 (PDT)
X-Received: by 2002:a05:622a:15c8:b0:51c:63d:fc10 with SMTP id d75a77b69052e-529d6fe1ed4mr9166801cf.25.1785223572604;
        Tue, 28 Jul 2026 00:26:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:25:56 +0200
Subject: [PATCH v4 4/4] dt-bindings: arm: qcom-soc: Allow WSA88xx speaker
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-4-39ff32071641@oss.qualcomm.com>
References: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
In-Reply-To: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ay5gY5zuT57kQEmeACflTdBVR+MccGNrdp1Uyl/qI3A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmJ2MCZZnPsREcD+u5HwD6h9m5QYu/JAc41c
 /RLCK4nLOiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZiQAKCRDBN2bmhouD
 1yMLD/9lC4M4SukfMDHRXdYxnemr74zYhOApleaQyxEm+BvX6DZOm4l0+eXPIQVmqi1qjmfCVZJ
 Vc6qRpSe8LaT/WX+qHTBJiZVpbvHO9Vfit1ZEoSY6K8T8yWrGmQdJ4ivZX7UWBtDQtaH0Kohj9g
 J/peLg5hmW+n2qUTtr5qI01T7NDAZQF7YoXgJ/G85BuGEs9hNElHn8iQG0f76BP+c4Zb+gJ3Git
 jfyY4DVBBsCBd7Z/vshdEM0ZZcypylJ7CDgrXKhVp79cUX5CtHERbzOl048YNDr8KWFqjRnKaDW
 2+Sw53yx+3nB4+NskEocfxfWf9vcSe7RNsZNqwnBrtS1Veolkxwb9FQDbzD1sS8iX4iCI69aYMn
 bJQ7WZnxJxN1YY/5B+XsY9MCM6QRdZw5lJ7S6RYTA+em0c6xIuru03ut+/OqfZ5y5pgE7TXDrnq
 vvU66rD6mDix7QWvs+U9Gw7+qA66bu9oTeVQuNNNmThby2vqlwP2+pyNQRpDGP6WXERvKBzxTZE
 7nXlb1s3orHLyQZjqNsmBeDt3O6RHiRcOrBAQCwwa2/ERhCdsoL8XiLFnJetkWYJMtwua8wvI7y
 BkDt+ltMcFYC/UHS3z4BgOVtDk/s0r7wooSqC+c3Xwz7osW9T67LCed62fHTb3MaDIe0QYue+lv
 y/9kynoU2Uq65wg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX1/NkeE6oyLxx
 3JSdsAz4OEPTEBMKC1R2OVqBOLjV5XgJJLsRWI2kHHXz+OUWnY82RUvg9R3shXagKL+l4vXtf0V
 M/CgHi9ujXBxogo8caiVWc39Y7YnsMhj+ZRoH29ukR8iZw3u160yqxP7AkhZIYXELHbCsG4SUqj
 at09dKzW0ufC3RazlDPPLFNPfJuqH6lR7ToqWPGrFx4J4JL12P50ho4QQ2leWm/YoNNZm9shhoP
 snXY6uwSVEpl0qyf3Adyt+56tV3pvkOUpzwLZZmmbAZ90vJA9ZYgErzps/LgGu4JN8aOY1Cb2OX
 AcISSFk0dV0q7ph/o/hnbY513DdoKtpdJg0ZjHqnxAYX/wMt7W4P0C0wng5Dwbff5VEq0yzA8AA
 Yhe7FJ+PwFEpXJzKzOa3/UFvAPAXRvVVFpaiIb2mYSmzJXvq/ZNc6npEp6tX4p7jpnSw7pTvrhE
 sqlgGmFxSJ1ywIlc6oA==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a685995 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QIb6LjCoyyNvk8-zv9wA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: efFgvVY6A3w-pfZHUepSkJOoHU2bN8V2
X-Proofpoint-GUID: efFgvVY6A3w-pfZHUepSkJOoHU2bN8V2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX7DJ7PAvFJD3/
 uNmQRQS5CnAuy1iFb1bCPfE+0S2QOIW/A2UuhraNkKoMwVxkpxIkLipi9aHU4Rhf/1nGourfKb3
 u/Jth8616M/DzNXvkUjMz67rKnaZN4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280063

One of the "select:" in this schema captures "^qcom,.*sa[0-9]+.*$"
compatibles, because there are SAxxxx Qualcomm SoCs.  Unfortunately
there is also WSA8810 and WSA8855 I2C speakers, so they need listing
too.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/
https://lore.kernel.org/all/20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 04f0e628a349..ab9369f84fef 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -83,4 +83,8 @@ properties:
             - qcom,ipq806x-usb-phy-ss
             - qcom,ipq806x-usb-phy-hs
 
+        # In general non-SoC Qualcomm devices do not need to be listed here,
+        # however in a few cases they got selected by patterns in "select":
+        - pattern: "^qcom,wsa[0-9]+$"
+
 additionalProperties: true

-- 
2.53.0

