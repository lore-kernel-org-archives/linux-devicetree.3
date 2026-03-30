Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FBB3C552D
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873165; cv=none; b=ceCMTqKd74JA/S0zTZtL/clLCr4ID0DxGEityeGTmJe3CsH6wyYoJpWTtMtgadD6LLuWIovhXchn5CkH/3DHjw4iPiMd51a1s0wn9GmgEDGFKeaD5Z70/CBZEWgcPfm2fAcRh9RlenfP8vSrjUFcltFSImrO+uW+HNv5V/UKv+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873165; c=relaxed/simple;
	bh=N8y7OV6b+feOmDqAL8o/2q7Q8/GPG9MzvQf30vf5ACM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VdZaTb5PCvBX1sUL3DEHY17y10ZEMNGbaHX5XePZSiKuzgGSY06w2XBloY8HLB5PHm1soRCtQl+ufMVclNOfgV14YVcTwA4nvgysDOgPM/kjqMbBvCcardZZuH3OYwvtIXhB7QKODCmaVU2VAjjrwDNezFwVFN5pX6cw3m4Fok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWz3V/0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTcdQYFk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWz3V/0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTcdQYFk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8PxCS2458337
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aMqFjynZc9+8C7oZM57AGA
	WB02qxl8TCH767XFRNWec=; b=oWz3V/0bLDtAcs9i2x/eDa1he97diZF+q7SDth
	EgjtBb4HG5BcK0ktzKPgy6Va8u0DpwMB4YSWruSkE2N2BLFz3q4WZpHSMYSW/gLm
	vntKwC7F+YQ3VEmOjEkzH9bIUWE7BuPEgZp/3ivWLqmnV8KwWNbY+mjAatrV8xVZ
	pJaNXc+ZcrXaXOOqyUJ39dh6xnsN1UTSdJHsNQecpifDXWkNd4qn+bZc0fvvGO7n
	H/DBntUILfpy8hEsBAL0j7+qNY2WW/BIlMOkSp4OfWIMMvv0aE6/pGONqEelUGrH
	65aJtu0WidKkBEg8AUbbojq0PCuDjrKmhwlZHCyyFCaJwndw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmrvvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:19:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509219f94b0so9216761cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774873162; x=1775477962; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMqFjynZc9+8C7oZM57AGAWB02qxl8TCH767XFRNWec=;
        b=XTcdQYFk2aSoOERQZedRmssq0DDdXEyfuiZJUKTWae50HO/fR4kCGvjhdqzaxl/ySO
         PvDF9AQKHm9Oe9y5fGM75s/oKkKZufDYVD5EkdZSq5lQThx7jcz2mcJlIJZMyycqWj49
         6mB3cDddvVjdGgfZRJugdFz7FlQgllZ/NgChElr4k8H+c+EgC6N2DXRjUMnIAZS3Am1x
         krkYgdLBD3j3WDkq6c5hXRdPa2lrZQhUqtvp6YvTQhl/OqHcIE8C+rf6IctZ1lOAHuAY
         Q0eqajPTm5ibIh1ij2PYQzvkjJuT8pgzqBJcnbFA3siOvzi51TClch6AzsktwvVhD/Gd
         mqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873162; x=1775477962;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMqFjynZc9+8C7oZM57AGAWB02qxl8TCH767XFRNWec=;
        b=QL9k+J3Qj+rIDCu0RRJHFf1+NQ25/EOgscOmHn+ba8DQaog93Ai7bXN5ofO3zpAWsD
         GfaHLf67lyLiR8sUHRdq3ce4/tzk2trU0nFr56DQNGvKxBiYKsDGSksrxgKluk5Gu8JW
         SqjKFEI08zK0cIGc0+Mut3XbOfFSFgjz8rH46MV1yS47uKNlctNfQa3q3Gd3LzP4pc/L
         /yDy/4N2U/lYGqxOCXt8h2PrwA6BFg7V7z0wRCqSaHfmTzfqE868BBCRn9aNLCjk+Oos
         penDG4ckyZWJ93My/0yUNKbtvwU4G6A0yafCtcdIin3/kKQmNQzeQZn9VpzFY7jusKMt
         0LBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWicqDBkJIk1Xcn42ySphi8M+nYYHGbKsCwtTdArHY6Vfh0M7XQmXONIRv/ctl5nktnsK+V1rbrCH27@vger.kernel.org
X-Gm-Message-State: AOJu0YzcATSFPOcvhDosJqegmYWgy5o2Kk6EUxlmTZWny241VFcxsQE9
	BEJlCxDCvzYIvpUt39DnDljjufDXshkanCkc2wcaYAts092NreaCEK2j4UBRYgSKmk7y/xmRYob
	CwL96q5DYwlyGUcOCKSePd66B8Mh53lvppbjQtjseOODufbNw+hl9GfM+vLN+6fED
X-Gm-Gg: ATEYQzwhlfH6gLctC6Ry2on5a2fz3fNfhLUlpUJrpQtiJnyn6rEvs8ne25m+v3FXv5N
	Cw4H84PfWH8FG2afom0ENlQL8aszlKqN1mYR/A8b8tGNjAMnQlgfsHdRWo/R/AkUmVs6Jt2vmtY
	y89ieOwiF73st1AHUm/ZHApta7LRLR1u5UU4lX190babQD7iPBvgRhk+I9wR8gstR8LqFTNYoCr
	Y1eD62qiQVc+IZdL0VHN6Am8bGR9Wj2r4uilDkHhgZ2699dABuCpLmr87t70lLFQZ/wDo7NBDTw
	NaWPnPbepKtlv94wvDOMU2+WJXfio2ty1Gy7w5qebU52Eh1W/VFNl78SEol8uvR7dzArOdKvW4T
	BCJpmgH9TITb6pYEZnigeXYYVqEsNaQ==
X-Received: by 2002:a05:622a:2307:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-50ba37f5ce5mr166358101cf.20.1774873162429;
        Mon, 30 Mar 2026 05:19:22 -0700 (PDT)
X-Received: by 2002:a05:622a:2307:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-50ba37f5ce5mr166357711cf.20.1774873161800;
        Mon, 30 Mar 2026 05:19:21 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm413873505e9.0.2026.03.30.05.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:19:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:19:12 +0300
Subject: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Eliza
 QMP PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-eliza-phy-usb-dp-combo-v1-1-2ec11e793a08@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD9qymkC/yXMQQ6CMBBA0auQWTNJW1NJuAph0ZZRxghtOkBUw
 t0tunyL/3cQykwCbbVDpo2F41yg6wrC6OY7IQ/FYJS5qotpkJ78cZjGN67icUgY4uQjWqd1Y41
 ywXooccp049dv3PV/y+ofFJbzBsfxBfaPv056AAAA
X-Change-ID: 20260327-eliza-phy-usb-dp-combo-5a117520ac5b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=N8y7OV6b+feOmDqAL8o/2q7Q8/GPG9MzvQf30vf5ACM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpympDOxOzJJ1hAxqzkUG97Ljfst/WDDYhxOSpm
 X7A6aS0VxeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacpqQwAKCRAbX0TJAJUV
 VnVOD/9uQlcTgEi4Lai1j1rnXdSdBm3Huec5l7i/Rnrnc3wooEGllMNYvdZgrBmUol6p57q32kO
 AwCMx7se1bp6yDYJNA2R9thUqcCrndItojlgcgs+dUhTEx9CmNkntH9IaWg1Eo0KW9UdPHiEtb+
 m3t8CmZXDBrXmPzKYGNsT5ZaIFZnXY9njJBHpzobyctmHYxv+dtBfiu06vlFFwOMB+rOtTnNkjw
 F5b4nReWPv+V3J7zLps0+U3Kaf2E4IZ7d3tWcsHzX6DstD20yvePONZXjcOug65cabzm9utUe8S
 UaW2SbGXJBUUunVnitDp+90RtkPzj0ze8N7iExfAI61jBTpUUWTk2FDJShJY9QlInTl6joYeOxn
 hO+/dYjwvZGEQb9LLyVV0IthuEZFsIJE3+J5E63pBCZ9LuqkJqXyPDhR0EsSwZ9m093BxP6Vnkb
 E8cNkZfEsPfhKzEJrze5k+YkQerXM2EOEDz/9bkffk211+pOqMneBfKvBnewcnzUzQGi19MbHkL
 jjSfaqYjDCJs5zS6I3mCfqmwnO9PAxxFTXo/5df+aKRJ6suhqdBXoJ1H5x7wTz2j8tZurLB5E0m
 P+AYaHcIX3mwKyQ2JOwQwb2qCL3AIjLex9hT6/1J//p1yNKuy2giyOsQWaIpdO2PYal8gua6nBm
 6Oz96iZEzm6NOlw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5NiBTYWx0ZWRfXxtd164/cCQ5J
 uGiF64sMNMUylYPtvj+xcYQNJQ4L6SNTs/MgohRw0htv0/Zb+l6XCEHiXQqAgpVLKUAYI3rMx06
 3ARzvzOvpbjWgrJ8hc13hK/lkA1GE/EskgxsJ/hnQ7Lq0oZv5UkRQaC051RJu74Qb9utem1kbYS
 FIWFmhG8FaQAqOqO2VCZUlZnHI9E/lL7Pn4vti8j21RVTluyUdZ37muXDwah5K3b8EBnPUpefOY
 eokv4ESr5ziqwS18h8GsUDzsE81no6UP1hUeNCrAOKuQWdcViGjgSyXax3zvsA+4eLIchzfADXw
 7fRVsdn2JDWVHKC6fujOlwaGG2EeduhckSHDq/kCFHh7xhiyYkxHm3apoUgorrXOq265+EkIGY7
 /xb1SAPBtLf7+BxmjAZJEFfmcwnRKywGxtJUqnvqoX+UHWDcAwCPfjnOvSoJDb9Bgdde525xuHy
 2YpQ4TTz4IjKboZqTzw==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca6a4b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sFrIIvqvNyyY2lCVqTgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8ZoIO5U3UqEVMwKXQfT96qSk6FIthWWS
X-Proofpoint-ORIG-GUID: 8ZoIO5U3UqEVMwKXQfT96qSk6FIthWWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300096

The QMP combo PHY found on Eliza SoC is fully compatible with the one
found on SM8650.

So document its compatible string and use the SM8650 as fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..4eff92343ce4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,10 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - qcom,eliza-qmp-usb3-dp-phy
+          - const: qcom,sm8650-qmp-usb3-dp-phy
       - items:
           - enum:
               - qcom,kaanapali-qmp-usb3-dp-phy

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260327-eliza-phy-usb-dp-combo-5a117520ac5b

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

