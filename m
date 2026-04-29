Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EAF3A5E81
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450233; cv=none; b=gZTJa6lNK0A3HwNWOTItaq+fGJQomSrS2iR+xFFfCnFXz0sQXrZwnv8xZz2SxOh/p1Yi65aqkX2n1EJL9G87+r+Yz5Y0dCL2dN7cQsS/vVTKWmi0kHTA88YaWlVrdt1rBhpQvLygirIHt/GEVXvQvMePwqGTfzRES7tOLbNpj8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450233; c=relaxed/simple;
	bh=ONwliSsILV/OrmkQojPFG5YHrHzHjk3tsmEhrJD5QGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GqbaEW8uvND/sY0tEXkXRBCIbwU2Gp4YSh/61XQeeYcVz4L6XUQK+w/NGkTMYzW5/+Kpm4D8ujrstuV/nfkbdf5wQUtL+M8Vl0GHlksSY87MpEOp0KWWFRwXlaC/ZVm1r+TyDKwhDwWs0OyW+4RUIKwFc8HJfmt77gAyd5OI3HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXSm9CXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiABHpI4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXSm9CXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiABHpI4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZrHn1016484
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zNEtTRHhsLDEYA5rua7jC9rsbB43fhK56EO
	ZzSeN9mw=; b=kXSm9CXuhgPwtjORcz1uNgQJhQWMsBpmNKaO6szQUWUIHtG+ydn
	srtB+NQELFSYLbF6/YYuVfmId9mo4JvxeCt6PiZNLFd/tmChG7d0Hniq4LfhE6D1
	j3QYWHOvSiD6wzjWCAd8eZofpoU+5RfJ9jn3kJe/SNMX4Na79TilCLkWDr3Qwl7Z
	wni1zOB3tFqliEzUtnu7+Fb2uDxJqVi6FxrSijb8vQic/F3Yex6TqQk8FdqdIV7e
	F1mSUUEhCDIHz7jzzEjKEbGA+azoMJnyjlJKvtki1m+C0AQbOP9wabyJIX9vs7FN
	hKvHgN1lC2RvcIaqUrtRKJj27DQjSLjKkPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7310kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:10:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so230084731cf.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777450231; x=1778055031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNEtTRHhsLDEYA5rua7jC9rsbB43fhK56EOZzSeN9mw=;
        b=EiABHpI4h96Q4WB8jz7N0Mg7ow7ebd1z5E0795/8Ki7cs9by0ZbvJw5jJfnW6uP35t
         OAJMf8k1dQpLIb9i6x3EEp8s57JDwHmP00NWpBqtPVMgegXp3IeBbTqzTMgvNWABj085
         Kvh+xRBjCFrCPPbOb4CXv0502/gjF35mpHWvVKwUaOsymuQ3cHw9ptuWGKwHbMn+nS1T
         KWfHnJFyHv0Jjer/ev74nu66//uRzVDIhMk9sRwthr8/j/DTgWoN6oD850UaVFoixybR
         l8hWiTHqUuG1XBx+sAYCJpeK00ptiIPuq99W2EOcQWIUlNcse65m2mnp1J6HpsJ6R5Rk
         bOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450231; x=1778055031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNEtTRHhsLDEYA5rua7jC9rsbB43fhK56EOZzSeN9mw=;
        b=N/tMNZYHWRLKMbs4aa7x4c6BtT8Br8oxaQUJbmxAZQFebtIE9TAmXAHHiBCHkv+LOk
         u/miP8fbBeALVi+XXp6db3UGMeiE3UBdFzD2D5x8RQ9giwj0DrQLdXjCR5ntWSVQ6gSA
         BnBfddPgHUOWwpmZPXdWfdYIVztu9h7nTbFTyv6ONgtsZsNKmJIPV5XPyj8EZz9s36dF
         /W401UG/cv4RA9UVo/4t6NdRIfNzSrEb2a+s/zcrZWPyw+deMDnol87kcJUwUWAJLnUE
         FNaikdkXgOERzEFRcUBc0m8BkBKT/jDk3f49eZ25Bm0zKRXXvl5zLKYpyZK+TOWbzX3F
         pGuw==
X-Forwarded-Encrypted: i=1; AFNElJ9jI676EpL+4p4lWo6vZ7lE9RsUOYj/G89m6mC5GvOEK0eaIxqkViNV1QriiHQ7rsb3gVV3+TmGJ8Wr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw0b7VmBrAJcLxWZjsDsV4DWOiQX1mcSgJtGt1O6RmysxW5AoI
	VLGrbhLcHWMmwXWGBHs87xq02htZu7am8duWt3YYxRMXlKY+Hv6l9ZmvmPERafRnCjErUcrbtjT
	xqJi7Kqh9cPlUBr4UMmj9BUdJ/yVyPSIUjQXtNG6zK2SfSHwdSl6pyTlvOTiNwuydWmrKySxH
X-Gm-Gg: AeBDiethNoCCVQJeqm9ErFVG/ghchmqZfw/+ksmnaPFlLJBBzLmJZi3FOR5DSpD+QqC
	52hHDITLY7lRPEnx4zr+lYbeQmfDMQ2RbfYtt7jot3K7Zb4vXMXSSp4jcj0vXOPFPKk5YSkJiI2
	mwatGd3kGwdXz5F6FHXmsqdc1yVnR7ztfMR+x0L2ooJKMINyPuALaZJWRLqa2Pm7I1Tnra3M1fa
	yC5Xd1v0Wj3mPhjIyt0ohpyjBDE7x8D+bLrD/tO7hkzEAPcWRApe1VB6/93JPShXeOSBdb1kMp0
	TrAUu9Md+y623gnBSW7q4Wc+PCxqj0YZwvRd6FKXRsHa8jG3KOjJInJ6MdzCSMKoMz0jyxUlVfk
	Pws/VeFLuema0vaX/zoJMURyHEhMX2yFB+OaMJLDSxYNdofnfQ7G4/jdueduf
X-Received: by 2002:a05:622a:1792:b0:50d:7f66:dca with SMTP id d75a77b69052e-5100e1ab2d1mr93763251cf.33.1777450230889;
        Wed, 29 Apr 2026 01:10:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1792:b0:50d:7f66:dca with SMTP id d75a77b69052e-5100e1ab2d1mr93763061cf.33.1777450230479;
        Wed, 29 Apr 2026 01:10:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:668a:d11c:cbb3:a94f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c310048sm12779205e9.22.2026.04.29.01.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:10:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: crypto: qcom-qce: document the Nord crypto engine
Date: Wed, 29 Apr 2026 10:10:20 +0200
Message-ID: <20260429081021.16380-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1bcf7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=4UlrLoyY81mkaXUxjREA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4MCBTYWx0ZWRfX7YWJQOT1rop0
 /ockybig/X6to4bXQJQKiH6BsB5hLnBmEi44U0EDSJyAebSd994EQhqttgonLD80mbURBO6rp9q
 Fs3oEguEi68c2PTT25qs6WvqtJZfqB3VvcPdvuISvXiib+ZGRMJt55f9vEArVKm5QME2zBTISim
 0klU7YXGJTulTFTThmJUevJp5b27ALU30HTsY6QMiqo/gDb9YA3eVMNRaKBDBcGJaFvbltewA5E
 UbAQR0ViUt91nCeKaUcpTmN99HdamZvDrICPhaPZayUkgsfii/yDmsdQzcZX6ISNHByNgwFv8HY
 5wj/H7qzJXB4A91TS6kf2GBJIahAbc25lCmC1qwri36+hOOdogg1JGLYMvZhJsWPwWutHNc/DYV
 r2HAC97b+cjBTwlBXaV4HwM4gurJHhZlLK++qaxujOXtnta3SyV0GPTypoDNoU1vBsJTXhv0blK
 AbcVSRVwpmP01FF5UhQ==
X-Proofpoint-GUID: Dbut0h27ISLT-DAWczf6BdngAftr7rz2
X-Proofpoint-ORIG-GUID: Dbut0h27ISLT-DAWczf6BdngAftr7rz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290080

Document the crypto engine on the Qualcomm Nord Platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 79d5be2548bc5..d3af7706376fa 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -46,6 +46,7 @@ properties:
       - items:
           - enum:
               - qcom,kaanapali-qce
+              - qcom,nord-qce
               - qcom,qcs615-qce
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
-- 
2.47.3

