Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F9B4AA033
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401936; cv=none; b=HeTfrtlvIfHQcBDHTwuD9MxjA5c0L46vkQfZ7Uy1esdv3QoH68Y5zRvY165RvoBv8Jwyxpkin9dahO+AKyxq3lErWYeCcKmYYvSqonShsQLIIeI46R4PgBSOVf2Axn1DH67jS40mFA0/vpRwFzVfOX1Q3lhOtEDCPcO0VqL+Ujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401936; c=relaxed/simple;
	bh=pdyXF9le/jqkQU0MXlhPqX2eJNzNJ0A11DtW+qy7QWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HDgm+U0XbmjHvnQAdhL72TAU0kO4//Seg0il5XVWO/CJdEW59uEh+t/Y4dSyg3qM0nyVLcM3R55nG4GK9IsMi0uE2xYcjEBecIhYVN3dCbEw1vlgR4Qz3Hq4fjepOb6DgsDAlH1NiS2fg9/J6N03kbTgO4bketGug+N5e6w+OO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTVz4CZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFF0vuRX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTVz4CZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFF0vuRX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtDN2752271
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmgoPkIbymVYjw7eCT9qzVCSGIHJdZ7VOnQChMyqa7M=; b=nTVz4CZfISCySK82
	AodWtF2VBEpfzD8KoV/v289orq1/VTZXWvKpfYdy7WyywvqYdIMftUi+jHnjte+R
	Plhb3oB0HJMShnXFAYOyPRV/y9hdE9pSvW095ondxlsOrnwC1nE7e/LJ6e+u/B2n
	B5ZVKqJ3aqQuCnNhB0kURHAuNlK3pi7jw/C7PIQe8AqTRipMf7N8sUBE6uMi6hzW
	Wq8MG1rpRSWEbLnclld9DUeojw5ObA/H/U/kK/kRxr9IXYPshE9ljahiGLc39Ts0
	ldBtgZy4NfToiYxH1d5oICMgOkYsijFzjpXa9Wl0xOe7foSSTiyROJq8Lr+d0lXi
	tTmpIQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gc5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so882449c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401932; x=1793006732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmgoPkIbymVYjw7eCT9qzVCSGIHJdZ7VOnQChMyqa7M=;
        b=SFF0vuRXjSgq3Zpl1pR8032Kbj48GX358sBW/1mE65hCoZs3beiZm5Sa6d4DhiRlJn
         jiJ6OR3EiwfYVUzD9v671zSHPpz/62Miiwomp0fgzorO1+6+l9LfVH6fXEgoFWzhNvhD
         Gj16cLAckaAhx8DYoQW5WRDYJp4q1L8ZTufIbTKQbS3dvNKjbovlKMzPaZOa82Z0Vpux
         dOELJ5Ay4QhEbwpT8iK8eN0/gJxmWdxqynnJ8pc3RWC+JcLwRA6dIWu/nUF/46ZhjG7Z
         teqjUxULb1+OVUXwwva3WLtOFajcf+ZXj+U5+zN1hE78WrIPGbD/8RINPN1KiXk/oufH
         zSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401932; x=1793006732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmgoPkIbymVYjw7eCT9qzVCSGIHJdZ7VOnQChMyqa7M=;
        b=c/t78709OF74TQAv0lUmPt+NYYxhICjgMh50a+qpEsMkfCSOXDXcFIB50UX2+eb4xy
         kMGnFeQo/NVNzh8UtRyNCFvLtynyK5eb018+V7eGYPB78ORLqA++QnuF3xsaZ+idOC0+
         IQNRTYJjHb/S8KXtdyYlqT664CG4b8YgmWvI8MmEQbkVMUVAtLprVuzow0jn3bE1vc1j
         AIyZ2UnhHLoeS72m7AJ5q/584LdIHQszNANCDtiwQlERIjNfj5ASLD1KxkGJ/zJVWINU
         E4B3ZARVNjvlkYs6hPv8LT8DAyRkgJ6nMZu426Bfujh7z+4GvT+G2bCw0/bVmKFej95r
         2UsA==
X-Forwarded-Encrypted: i=1; AKwUvBzbBKFYs28u1k4CBgStblM/mBr6t9GYFpu3XwVby42gBkIkptY/v70do0EZMOJr2/WQPiRqYZO6XwTe@vger.kernel.org
X-Gm-Message-State: AFq9FYIMFOhpSTRzaSgO0uBryWI53hG3TciMaB3kHLjTUbC1QF+rdffx
	brex6fzMVQMQa8qosndlQOou6qZaQiyXxPizFRKWzs4UhdR8zLhE42+YXp2Zx9OO2Uzhw6/1W5W
	d9MovTzfbxZKcfS8RtL3qyqr4zsYFWVUoARgGmJv6+93q82uT6pEPF0sOwllCWyRp+ny/w5JH
X-Gm-Gg: AYBFou3xQss+M3QUoDmlR7eL/Jzt9CtXeAtYWsp7UaqPS/Mx4DSmNQccXZQE4QlAtxH
	tzd4rb8raLASywnX0Irx85jxhZHd+oa/AGMmxI5c1eTVzQ6kRjrj3qeHJx04qzWCg0jx1WxQsrT
	eE2jl+6GNSTl/6j3pDWATF/KN5yJcgX8TyGYr59iu9Nz7v8rIMs9Ax+GC9nCvnrOcGG2Z9s55IL
	Vsob5iOKLClHgcYwEtTwqDeAMF+vOO/IVp/PJ2VO71EAaeVfVTQxvYsbMCVXlY0X+TffzlwfF9E
	dbwpMm23cQLMkkxCkpUpMjNiycHwFlzgRBs/h3T99joYxd2cq8iMfPgbf690cl4Wxpjd3MS2GtT
	ZTogURTL8S0K26WtNkEUZ9LX39x4HI2o3Ew==
X-Received: by 2002:a05:7022:7e8d:b0:151:2e62:fe8a with SMTP id a92af1059eb24-18514256ee0mr11182488c88.40.1792401932349;
        Mon, 19 Oct 2026 02:25:32 -0700 (PDT)
X-Received: by 2002:a05:7022:7e8d:b0:151:2e62:fe8a with SMTP id a92af1059eb24-18514256ee0mr11182438c88.40.1792401931423;
        Mon, 19 Oct 2026 02:25:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm26682584c88.21.2026.10.19.02.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:25:31 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:55:09 +0530
Subject: [PATCH v2 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 qcs8300 16 GT/s PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-monaco_ep-v2-1-852cb9f5d012@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
In-Reply-To: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792401919; l=4909;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pdyXF9le/jqkQU0MXlhPqX2eJNzNJ0A11DtW+qy7QWI=;
 b=2tJTZ1dHw3nXLJ+EZHj+oqrss+gqexEX0Sx2I++JV6uD/iA1iULBr1zzVgUHjKRHiRfJxgOFA
 c8Q84aXAR+DDo/HHyB1UVkIaWdbPqFo1M6t+5itazlXKcyfceXWKb1u
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX7pfyuqywwBdH
 6V4XokGNqN4iUgfMD+RtJUG9+IjGG4agBLN5vJ8e79T82yE8PYjO9Ga3mX3UCw9CoTcuoRP5QFd
 LI4K7viZ3jUN6Q/zQFmDy6NDQgBlHogBLkQs1NNTpYqRQ2c1aB6dxPZOd1KqXcTWQUuuQmOp6oC
 s+VwK9W5F3xGbSrBel6AnpFnulgJOOdpPwbb1kCzZK/HR4j+yobRfZlEVLq2IyVYCkDtfdxKeGD
 KZ35n6Elv1YgeS3weNHp2M87MxEIuhNGT9/9lUgALm3SD7qpftG+w6S/9jFRuRKF9Bd2xTy7NmW
 nuSNu+J4VzXdhm2zBEnX2rfulzh5/EvEcW197SeSyNHjiCypEADkJSPH9pF3HEVdyPA+dahEzXL
 fLc+XvhRPJXiX/uqAyXMAzk+8pT0Rh9Ca3swy84jdFNPhfWvnoQvsB5RK6UiW1KKa6M7QChiNPM
 Quto5lFWTVZSLs8pYoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX0Dgbdd5Eu7lp
 nyYYKlEfmXJYIBqadg0Klo54vYbqzNhuDEHogl/7sb3+gY08zejoV1raEsxVRmd30Bi57x5n5a2
 j1pC6vTJvXmjHF/1YkIrTNKV4RrQ+/U=
X-Proofpoint-ORIG-GUID: OdB3lF1c8N4bgcyAoGdsQ8LNMJhc7DPz
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5e20d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VirKNbUofNnfAjYdglcA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: OdB3lF1c8N4bgcyAoGdsQ8LNMJhc7DPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190037

The QCS8300 16 GT/s x4 QMP PCIe PHY was previously described using only
the qcom,sa8775p-qmp-gen4x4-pcie-phy compatible, since no QCS8300-specific
compatible existed for this PHY. This was a mistake, as it left the PHY
undocumented as QCS8300 hardware and indistinguishable from SA8775P in
the binding.

Correct this by documenting a dedicated
"qcom,qcs8300-qmp-gen4x4-pcie-phy" compatible, with
"qcom,sa8775p-qmp-gen4x4-pcie-phy" listed as its fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 87 ++++++++++++----------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index b353b7bfb839..34d3a714716b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -15,47 +15,52 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-qmp-gen3x1-pcie-phy
-      - qcom,eliza-qmp-gen3x2-pcie-phy
-      - qcom,glymur-qmp-gen4x2-pcie-phy
-      - qcom,glymur-qmp-gen5x4-pcie-phy
-      - qcom,hawi-qmp-gen3x2-pcie-phy
-      - qcom,hawi-qmp-gen4x1-pcie-phy
-      - qcom,kaanapali-qmp-gen3x2-pcie-phy
-      - qcom,qcs615-qmp-gen3x1-pcie-phy
-      - qcom,qcs8300-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x4-pcie-phy
-      - qcom,sar2130p-qmp-gen3x2-pcie-phy
-      - qcom,sc8180x-qmp-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x1-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x2-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x4-pcie-phy
-      - qcom,sdm845-qhp-pcie-phy
-      - qcom,sdm845-qmp-pcie-phy
-      - qcom,sdx55-qmp-pcie-phy
-      - qcom,sdx65-qmp-gen4x2-pcie-phy
-      - qcom,sm8150-qmp-gen3x1-pcie-phy
-      - qcom,sm8150-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-gen3x1-pcie-phy
-      - qcom,sm8250-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-modem-pcie-phy
-      - qcom,sm8350-qmp-gen3x1-pcie-phy
-      - qcom,sm8350-qmp-gen3x2-pcie-phy
-      - qcom,sm8450-qmp-gen3x1-pcie-phy
-      - qcom,sm8450-qmp-gen4x2-pcie-phy
-      - qcom,sm8475-qmp-gen3x1-pcie-phy
-      - qcom,sm8550-qmp-gen3x2-pcie-phy
-      - qcom,sm8550-qmp-gen4x2-pcie-phy
-      - qcom,sm8650-qmp-gen3x2-pcie-phy
-      - qcom,sm8650-qmp-gen4x2-pcie-phy
-      - qcom,sm8750-qmp-gen3x2-pcie-phy
-      - qcom,x1e80100-qmp-gen3x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x4-pcie-phy
-      - qcom,x1e80100-qmp-gen4x8-pcie-phy
-      - qcom,x1p42100-qmp-gen4x4-pcie-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-qmp-gen4x4-pcie-phy
+          - const: qcom,sa8775p-qmp-gen4x4-pcie-phy
+      - enum:
+          - qcom,eliza-qmp-gen3x1-pcie-phy
+          - qcom,eliza-qmp-gen3x2-pcie-phy
+          - qcom,glymur-qmp-gen4x2-pcie-phy
+          - qcom,glymur-qmp-gen5x4-pcie-phy
+          - qcom,hawi-qmp-gen3x2-pcie-phy
+          - qcom,hawi-qmp-gen4x1-pcie-phy
+          - qcom,kaanapali-qmp-gen3x2-pcie-phy
+          - qcom,qcs615-qmp-gen3x1-pcie-phy
+          - qcom,qcs8300-qmp-gen4x2-pcie-phy
+          - qcom,sa8775p-qmp-gen4x2-pcie-phy
+          - qcom,sa8775p-qmp-gen4x4-pcie-phy
+          - qcom,sar2130p-qmp-gen3x2-pcie-phy
+          - qcom,sc8180x-qmp-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x1-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x2-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+          - qcom,sdm845-qhp-pcie-phy
+          - qcom,sdm845-qmp-pcie-phy
+          - qcom,sdx55-qmp-pcie-phy
+          - qcom,sdx65-qmp-gen4x2-pcie-phy
+          - qcom,sm8150-qmp-gen3x1-pcie-phy
+          - qcom,sm8150-qmp-gen3x2-pcie-phy
+          - qcom,sm8250-qmp-gen3x1-pcie-phy
+          - qcom,sm8250-qmp-gen3x2-pcie-phy
+          - qcom,sm8250-qmp-modem-pcie-phy
+          - qcom,sm8350-qmp-gen3x1-pcie-phy
+          - qcom,sm8350-qmp-gen3x2-pcie-phy
+          - qcom,sm8450-qmp-gen3x1-pcie-phy
+          - qcom,sm8450-qmp-gen4x2-pcie-phy
+          - qcom,sm8475-qmp-gen3x1-pcie-phy
+          - qcom,sm8550-qmp-gen3x2-pcie-phy
+          - qcom,sm8550-qmp-gen4x2-pcie-phy
+          - qcom,sm8650-qmp-gen3x2-pcie-phy
+          - qcom,sm8650-qmp-gen4x2-pcie-phy
+          - qcom,sm8750-qmp-gen3x2-pcie-phy
+          - qcom,x1e80100-qmp-gen3x2-pcie-phy
+          - qcom,x1e80100-qmp-gen4x2-pcie-phy
+          - qcom,x1e80100-qmp-gen4x4-pcie-phy
+          - qcom,x1e80100-qmp-gen4x8-pcie-phy
+          - qcom,x1p42100-qmp-gen4x4-pcie-phy
 
   reg:
     minItems: 1

-- 
2.34.1

