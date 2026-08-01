Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C54D3C1414
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 19:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614090; cv=none; b=SEHXis27GK313HhjM5x8BfZohVVRbbQ6I+UEJy1DfpuiuZapqU6wT2mCiUk+fbGB+uNm0/eFI0CxMuENvFyqMLNDUGWLEevF/Tlax18USxOcrVw0L/YU1wA5QBxeGZQ9Pl0eeH6S4jzUUi5+xWEHW7/JZ/qrLfaDRJiZ93Hgrj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614090; c=relaxed/simple;
	bh=vkHXMuDOfl9DfDnlYq2UtEgF0mKchKZk4Lyneh4hwb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j1Qb9pqbyJmKG+ETAayji9ds6sV3jtkScfh7rb0ieQmxV71RU8G8Cmja69mOQ/UDEWoLRuEQjJvOqagisixNp5kkWb27QbjINqhOYgf02xSsAqEQB3YDVgu3Cjz+rDS4rq8rR4y8bhpkmrleg8zcNqRFL50JAUK1SfhtFwG2n2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5zd6p7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9sgLvOp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5zd6p7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9sgLvOp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0EKU3564147
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 19:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yev/E8rKpPGKZC26m9Rwzr5m3S01wiA8J8i
	gNMw3wuM=; b=O5zd6p7atHfPFDx5yfd+TpMtsdXTDBJKcPFr/lktt0U6fWlZ/HF
	eXlgvrekX9L6LIRM0VghpaBIHnxWOhXTgxDGqB+ERnVV7DpEeYxGgZn8RjnglNe0
	JEuZkypGc5YOqJQ+tuf4T52nMkSgUai7mRtHskc/Q3/GmNdipKaHpKtjsY2L1iOL
	Aag3E7VZbzC3hMqrnKuvTLqddeDqSxIhdryfmpDO9AaijG9jLeg6OJW+F5VTlNMK
	U3kS6+zsff/zJAo9LgHNDtqtLpib7tZyNdLwnlx55RRfIeGW29pyytnq13yqTDl6
	7AY3sn1NrcSrdBGQTH6hMxs6JV+76eW2RPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9669hk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 19:54:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so42574431cf.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614087; x=1786218887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yev/E8rKpPGKZC26m9Rwzr5m3S01wiA8J8igNMw3wuM=;
        b=h9sgLvOpza4sRmGDSo6ePfMjUdmeppRBUP9q7aUV4ZjNiHFNcQz8YmUWd3WPf7HZM+
         T52iiiv+jWPPuSBRqwvclKNH2FJHO9/TUakf9b+bX6FkJdQ5n+EpNLDvIeM7xo0GtVyJ
         ou8tI/cY0eTZ8ZcU2P8t28nBP3+ks4xDdIQ/TyFRppYjl3r7S8t3OYVRJdJm4gvjwOTs
         ZF/mptmrghcj5wlIpgWymwBrBpKFg4/8hAwEi+dUQHu+3uC6Syn7RhhEoSWAOW0TmqSG
         NRt1tvE8qatzx8qKDtOTYeM+Zp6sdePcf7xVTlBYdBz8gol3tOxzsgoAkYxVqF0LfIHP
         m8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614087; x=1786218887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yev/E8rKpPGKZC26m9Rwzr5m3S01wiA8J8igNMw3wuM=;
        b=dmgmyzIXiFOOKX5n2bJz+KBysAbgSeeSc+ScFoTw39Dq5/ws/Qfgd1upTQhN80pmc/
         jhvBUR9DThIKLgcE4ZtvVagxQ11nTgh7ZIYP18eU+82REnyLCPMJh5yBLUx7NbmBCEgB
         12HSxd9wF86pJpNvnD/VYeADEEuwNIfxQZ0UK8INdHNTb/AHArrJv5NnFGFF5futzIzC
         mCasK8WBaq/cEzqL8LsLoHH1qv2dqiuZ4Kk1XG0Gye9jXkyJFoZ/CYmXC+jCqw6zu8CL
         BL/aEWQIeqOwzhEQ3c0JEJZ876sBd/MvW2T3TIfVk2PTDi/nVY2UEc2yL5llWmwYpL9i
         9GsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrG7c7G3flEhZIrhtxvB0iW/8k7w7k/V8pQSwt2j/dsiDuMh2zQc28tv3GHa4oVGoSwqHYVgdd5x3mC@vger.kernel.org
X-Gm-Message-State: AOJu0YxDa+SDCRUOu7vK49VuRVQjpvLCnugj5gZ7fX3R+6yGB9TeHWge
	y4/IQRp3A25I1SpXna82122x82XEoSitSLlQO4I1CqWHfAUphO2AzH/Zjl2zfHiFJ7z52QAq9tN
	y8Wz8QK+m6dShF8Ef5ld36Bs0MzWhg90hEV2VxVhd321F9yYUr+lLGjlgTMbT/5Tt
X-Gm-Gg: AR+sD137DkM9+b+SxZpR3nsW6sjIsMWWlDDm3V6B09+U5ZK9of01p0THtirWZyoOLl+
	MML0PEGa8I4/s1471vn6W8kY++Pcn82BJkpj70qfE/5QudBS75Qs0uZg7Cdjxm1FAgWwYxBccse
	JUP5br7S3tvYI4FaEetManhzlxGW+vEWSNXMPRkYG7tlIpWuYpFaErV6Rxk12aDOxlvB4SOYgsC
	S9NDPGnhvV4yP4gQNcQEVw/UzqiFSdP6Di7nhyEmMIFTZYUI2Gh6QxQfrzA0aEg325zRolBIDfA
	doiwhNGrnzrhSWmLsIS+f90chgcPT5GkgzO48dVgf/356pdI3jKElWcMF3eJHp2HwkN6k51aEnw
	oQlMDl8i/WRFolk+m
X-Received: by 2002:a05:622a:412:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52b5674b4ddmr93756441cf.28.1785614087379;
        Sat, 01 Aug 2026 12:54:47 -0700 (PDT)
X-Received: by 2002:a05:622a:412:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52b5674b4ddmr93756161cf.28.1785614087000;
        Sat, 01 Aug 2026 12:54:47 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b59aefsm65657005e9.2.2026.08.01.12.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:54:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Troy Kisky <troy.kisky@boundarydevices.com>,
        Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] regulator: dt-bindings: Correct white-space style
Date: Sat,  1 Aug 2026 21:54:41 +0200
Message-ID: <20260801195440.234183-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3353; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vkHXMuDOfl9DfDnlYq2UtEgF0mKchKZk4Lyneh4hwb4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk8AOn1MI41zVkVjNqRxOtPtRkJiWlt5dWHa3
 cWIN0XEQTGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5PAAAKCRDBN2bmhouD
 14a5D/4wJkP96hte02J264MWgPIj721FV3V6a9Zm+B5H+a3peEnDX3dTDUjDhY3f3jq0o4jHTmm
 e/+eiFOdMKz/3tikosLlLbys2sbpk3YQpY40bFtYndlztw7tgYEZ+Cc/LEVrIcWqN8uBaTmWgll
 VOfxFDav8jOZ8NBVO/qyvqpLDpS0IxnEolWTLuXL3td6WMjic8Lx1nYMRcyor8fqrSU4V5b++jZ
 292U7s4iWYhjGfoThMtAsycFyI3rOObf0LDvgq5uG3itGWGeecQkDIPk6CYWpi0L3wAi5jnSYPk
 nAwugw6EevBwKwy4k+djIoFGp+/vydE25T+jO+CV1ZTUeiJHIFc3wQjVw3C8RIo4qe6nz6U5i1G
 rI0K4C0puR2nRLz/AMo734QoHpUSr2VXcXbrhMyr56wmzcqJskFN0BFYbOC1FV0xWJnpduOeUNw
 Dr4GrfoMvlbzxIE7c8A9dNP9AdQm+8mBAv/8BR19gxCfnD7NMMgUcggQSjoXuZtgsGSXWMLk1k7
 mjheCEck0E7WNHLR1fgWsx0BpxJmKQ9MUxJYYr4P5/Kypn6H3PpRg5CI2OLuldTldqiZGRMMuA3
 nd2xRCvkLa1/1YkHLZgFO2D57DnqDFmvZnT1B3f6c7sYXaN7ll6ZyB9JJ6SvuHXDLJuoAy2k3U0 7G4G85LTp0gsvxw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HHgrWzYhRISjA0E2gMU14VIHXE1ts2r8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX1IyAg/lCzBj9
 x0JVoQkefDdKraRljIUzP8HmRCtniNYLEMvUj6nwNjAhPH8UcjiXsHH67V99jKEHe4x2pv9zFTU
 Aqo93hjzMtydWwAL5rKnDD0rPMttr+ci+67Ovp7cL4Rc2TPA+cKmDtpFwUDFt4KAx8Y4Y28FuTg
 Xt6fIZpElvuxBeaWS9/21hd9VPkqgrb2tvDOB6JeRGU6qhFwI6isvh80a6slKKYh+xxFQ4fJBeI
 1d8ohqUBF6L/eBcyQv8fFJzhQBTmRs+1HNpsXKJHpRKr65paEG/5HtsxSMYaYrhjxhRI1oXyFJJ
 oB+xvvonDU126P88+iHVVl5myQ0IKMBPaGrNhjiRAlfNJGuOn7E89hM7BxM80uhsvhD7xlZlnNv
 qdgrKjeMbbfUZ9iVeoxP2gxgwWpyW48coKFbyQgAnJ0epiyHdw+QjmiesTtfqZQuj3YmbOTslag
 33XqWy8KJ1dbF19hOTw==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6e4f07 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XesUgmqaag6yCkecA0cA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: HHgrWzYhRISjA0E2gMU14VIHXE1ts2r8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX9yF/AizYdJ86
 zkpDWPOtRUZ3BCmmo7ituvg/wAodKHjarF1UMOMBSpXuu6BHQJoJfZ8yh2s/KoDrB7OWTHKtj75
 TQsv9A5WfLuacFHG5Qc/F9unl2T2vBw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010160

Correct a few white-space issues, like double space after '=' character,
which will be flagged by dt-check-style.  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/regulator/nxp,pf8x00-regulator.yaml     | 12 ++++++------
 .../devicetree/bindings/regulator/ti,tps51632.yaml   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml
index 894bdbca78a2..8ac77c1a9b9f 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml
@@ -134,42 +134,42 @@ examples:
                     regulator-always-on;
                     regulator-boot-on;
                     regulator-max-microvolt = <1800000>;
-                    regulator-min-microvolt =  <400000>;
+                    regulator-min-microvolt = <400000>;
                 };
 
                 reg_buck2: buck2 {
                     regulator-always-on;
                     regulator-boot-on;
                     regulator-max-microvolt = <1800000>;
-                    regulator-min-microvolt =  <400000>;
+                    regulator-min-microvolt = <400000>;
                 };
 
                 reg_buck3: buck3 {
                     regulator-always-on;
                     regulator-boot-on;
                     regulator-max-microvolt = <1800000>;
-                    regulator-min-microvolt =  <400000>;
+                    regulator-min-microvolt = <400000>;
                 };
 
                 reg_buck4: buck4 {
                     regulator-always-on;
                     regulator-boot-on;
                     regulator-max-microvolt = <1800000>;
-                    regulator-min-microvolt =  <400000>;
+                    regulator-min-microvolt = <400000>;
                 };
 
                 reg_buck5: buck5 {
                     regulator-always-on;
                     regulator-boot-on;
                     regulator-max-microvolt = <1800000>;
-                    regulator-min-microvolt =  <400000>;
+                    regulator-min-microvolt = <400000>;
                 };
 
                 reg_buck6: buck6 {
                     regulator-always-on;
                     regulator-boot-on;
                     regulator-max-microvolt = <1800000>;
-                    regulator-min-microvolt =  <400000>;
+                    regulator-min-microvolt = <400000>;
                 };
 
                 reg_buck7: buck7 {
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps51632.yaml b/Documentation/devicetree/bindings/regulator/ti,tps51632.yaml
index 67ac40e3ec00..130fa9796f57 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps51632.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps51632.yaml
@@ -44,7 +44,7 @@ examples:
 
         tps51632@43 {
             compatible = "ti,tps51632";
-            reg =  <0x43>;
+            reg = <0x43>;
             regulator-name = "tps51632-vout";
             regulator-min-microvolt = <500000>;
             regulator-max-microvolt = <1500000>;
-- 
2.53.0

