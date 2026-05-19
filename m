Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E623FBB5B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184833; cv=none; b=Qf1fMjG0WtPd0do/JUcUSCBnYp3vjOlQcZGenxXVWRpHvFBqETK0eWlXc38ky9vz4E0e0HeQ1FT2Zv7jPrR+8S55C3A+IaUnvU1qOemoIpIawQAX3VG0oce5Z+p2NmtIcXmaKyZjcr/48HWMHwFzcSiKURzCymg8pmkQkv6KX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184833; c=relaxed/simple;
	bh=qgd9pHMpqkPpGWPSEXYLm9BAONMX8FUagLGazl698bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GWg5V0NQLXOEy4GIKGBnmfohcNY6FLpEzRYVHy3PAvALncE8W4yFGBx0IMZlXCTw3lillW+/EeeCeemqrbFInoalMcejdzkzspN5C0mR9fT8l4Y0hyV3jaPllR0miyMrhE3fIXM1W2gNQSbz8Qwh+5kuGnmB/lVLqBx5S2Y8IKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcvR1Zh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPqoEDtU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcvR1Zh4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPqoEDtU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9v0Nb1054665
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vGmP9BAIl9VO5gld7b1lGPmQppeFMWd0e8k
	A8wrfrCg=; b=HcvR1Zh4bssS4ZgKNgCahaH/XNwm7Vss3Wa520pLN3gQxJLwKxk
	bWZuzjnZW5rI+EzBBXbgzGtm+I1VopaWiw6sRl7rJHzlYxeI8NLFyZ2eBW0+Rsd0
	u0s16kos7pTAwBkoxXmUUxJii6p4YEIsJhgzSXxutrGUTHKGaBvO6jd1DodghcHS
	/FlDobjKBDk2gYYUQK973Z+dULMGDq519t0I+XsxF1NuFfiPlKY11p6Mgzrt+fJT
	TlAGudExQZxX0CVPimKxZkFQCV7xJyzFxntNjIdNKtEEqLwUopv6G6O020tHiJA3
	402PM+eWt4aQYRpu8OhJwcif5gD7iHLr39A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npar0e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:00:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51650041428so76122201cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779184829; x=1779789629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGmP9BAIl9VO5gld7b1lGPmQppeFMWd0e8kA8wrfrCg=;
        b=PPqoEDtUdfelU8yb9AKSWBsC+XRZxsCDQx0/QalVEQuemlYiXUQI26poL1ko7M3Uwh
         kDJSrSSLUfU8l6oxoLhycAysRECS3MY7zwE06oOo3iyz7blp1lzjzFUIn7iKX15JdZMg
         R3EObd6R22Y8nG/RPP3jNoqqy9paid4TAONUzjTORCKAi9CeYR8ZJgD/CaI+QEXdObbL
         6I9SneZ6MbmdlFuLCbQsc7aXZHqRyGRGPP/xtv/c86Us58298oLpgcrj2WpTlKZZFiDx
         KAVhRt61IPEnix8LTV2lNCGXmGZUrx1v1VAthyFCU0W/fkEIbqHExHqvfacrFQkgleF5
         dREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184829; x=1779789629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGmP9BAIl9VO5gld7b1lGPmQppeFMWd0e8kA8wrfrCg=;
        b=T4WT81jOoNEEvpJbPvFr5K6w+MGbpHyfuotok7oxBU0DN9/LpRu5XtC5eI3z24VhFw
         pKAqOADxPlt6E46Huip+Xj+uzxxhmw9uWhiJl8iwJIlSELVjKo5bsAzYAZaxEZM+8qUm
         Ij7VmAHyEBvYd3DGAAemFmcy6aTgk0BCHcT7vAsSJcbl0PbVVRg3AXhErqRaBLMNzp87
         m/NpUTP3QJJfWWgDm6QiDv/ElYkRKk04hrQ98rufHFkkM1girmGDpxiYdu6D/6wBFm2y
         1qkFuXx7D1nDje6aEgv97OsQe+TNhUp9AYxLEObH18tdatMPat0OSpjU59xvWXEFwema
         rjng==
X-Forwarded-Encrypted: i=1; AFNElJ9wILMHoRYeouN5VzXxfbLLFcRC/gN+c2vauAteVZyHKM3CtJmZR4gA0LVUb42Py8RUe+jwVd96b4JH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8gjm1kjZJbNQvTIMs2dszOomML9DjQfExYmBpeH3AbZCOfyMW
	PrRNYuKHkP7CeAmX3OcsoqQ+P1AjatOydmYEMizyxsERoLwO8/QMkfgoKRCDjkmRZTGp7h9/W6X
	ktLZuwez48PyFxL+mce8qyE8Y1ll+mfxUeet+IiTW+AbQMjkaXOkKUTwW0L198ix3ZdsED94q
X-Gm-Gg: Acq92OGY4/cajodiefS6k4M9gafepuM0NknmtpeFnGfXrtXkygeAV03rUGjfB3oOEJM
	pKuDvYMNbbSUFjYv8Ohyr8jHsaPGnW+Ro610qNx93tsu7p6Tvgjji3jHy2ACyhfThXUvBNiVkp0
	7kAftknhd3qKe9vBO5nubx8IGU4FYyZJavaq9LQIkjgyl7IkSLCv8qsrh2Lrijf69TQV2QQufSJ
	z/30CpwEYcwyiMP2N2gzxQMoF6t1KIkGh7IM1LARRM8ekT9nVrgRzOPKDPcySBcBScCrwJ0VqEz
	+orm1mVdTqQqW8TJQboV0OxzoI3/KVLnzjbetM+6I1jpGm28hyztjGAVbQjmZJBZPYR3E0umwI+
	rms0ORWIJ3/6x15DOsvvsPUGtytAQpDgtrKda
X-Received: by 2002:ac8:584d:0:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5165a051e3cmr241222621cf.20.1779184828731;
        Tue, 19 May 2026 03:00:28 -0700 (PDT)
X-Received: by 2002:ac8:584d:0:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5165a051e3cmr241221521cf.20.1779184828006;
        Tue, 19 May 2026 03:00:28 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm44266388f8f.37.2026.05.19.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant port
Date: Tue, 19 May 2026 12:00:15 +0200
Message-ID: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=qgd9pHMpqkPpGWPSEXYLm9BAONMX8FUagLGazl698bc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDDSu6d0Y8bBgdjbVe++S3liC2PxuLdegD4dW9
 DLpZXpJbMuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagw0rgAKCRDBN2bmhouD
 175yD/kBamyb48fsgxVc93K73eYzIMVHGlzrWB+VHPgxpuuYOyN/QY1t4ZXjYSYtJK9xzT9ErdS
 /UkFggw0QsEs9SPqT7moGzS6E8V73WRqjFpUSd9eSavtiENnskarSPrJcnVFLwyfLfDGy0v0MJQ
 2ZBQ1ZPke+PKd/YrEhiGzuf9PH5iZbjqoVv1WZJbx1xqRE+O9w0SCQ1WBJ4/pJ35xIDa1Isb1lB
 1qfrxO+NkSBZo+SozJlKaRW85jK2m0PHFi7sBpgMWlPVpYVIXaPPP1Jdk5i3dRhX/KW3j+WJ+rU
 a+zKHz04YTN6feDZ4RA1UlnO3dY41I4bIZN2eDhiKLwmb2Gf4en85hgHwT+t4gnBuIobFb/ZdKd
 tjdBz+BUaOr50Q5xddBAfeM2jUiAMImSTmpBIvmINvrIEkoviU69+nM/raQx+TlBiH3g0H3qNkr
 NIbKRs4PRsS2jIK8kYkz/Jf5UhrLbflung7R/pYQOPP1YF+9OmZUk35fBtMI6XI4Kq4Q5qzU6m0
 zIE05C3OVfkeuy35sQIKarJbRXebeaGeq1Ds+ay3v08ePQT4pcwlNoPoMO4l/OuKgaxbKjdOhyD
 SyXCwt4d6gYOjBn991wdXNQyryDiMXKs87Kh3u0rEEkbjG/Ew1Ld6WAwG0OaqDa03h9VjU4GN8m Y/KhIHpbakcQZOQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA5OCBTYWx0ZWRfX/LeboOLBMBB6
 FZQRmBge/fNUUamlpd6JkFw0dgjDU396fmT3BwgauggfUWi32XbuNe71YskDA2ywdzbXllcBn4R
 aCj51yehvLgID6r6c5potSmvrfluIhGnq3GUmU0IWI5xldb7lbKK0nwqYiDm1PN1JBDZf48yCHD
 qfY/PeHIgHcvmEPn0waNta+rbGL6JwhUfQVMcZH6tPvox9OVxxECG16K21gnE+yh3hUxA+KtPv5
 rtowYLv7jAtz1mWPULw3B5f2ckgCur3MerqeDBD/7tWpCTOBs5fcC8jLoRswB6iaYTnDr0SS3Ul
 LAC8hzYOotD6Joy103m/FPMKp7KQQOX7XtOydeCWZ3+MGnpQk2v9MZggXBj+/ArYXxw54K5nJZb
 YogK8Z/hazVoh+/G0egJjIzm1DTvb/cAvKqQjtfVt5UvJHS/rultn2xoT6JGWJaN7YuFVPKLOWc
 MuzyHF5igap8pB8E7lQ==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c34bd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BTa4seIaVWWYZd3midQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: sL9XGXUR8dyxEKSDvOY_gvC3x3UDV_0B
X-Proofpoint-ORIG-GUID: sL9XGXUR8dyxEKSDvOY_gvC3x3UDV_0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190098

The binding defines both "port" and "connector" properties, where the
"port" is claimed to be for "data-role switching messages".  There is no
such dedicated data port for this device and role switching is part of
connector ports - the port going to the USB controller.

The driver does not use the "port" property and there is no upstream DTS
which would have it.  It looks like it's left-over of early versions of
this patchset and is completely redundant now, so let's drop it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 6d3fa2bc9cee..975032ba6004 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -84,11 +84,6 @@ properties:
   vdd-pdphy-supply:
     description: VDD regulator supply to the PDPHY.
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description:
-      Contains a port which produces data-role switching messages.
-
 required:
   - compatible
   - reg
-- 
2.51.0

