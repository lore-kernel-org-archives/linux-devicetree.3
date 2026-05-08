Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA2C224234
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275988; cv=none; b=llcXn93R7aDAn+jDkGBWAODOA1W7uI7jDgEbMCHB5tEiWeuc+iONZNxZswdZuGufezqmQgsFtLYfANb382e17i6y2XO5R7SO532BsoBqoJMkrDJf6kSeaghmKkA5yO1eCSaYYzRokalZcJpQa3R1dEGuKRuIwxCXL8O4oZzwCGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275988; c=relaxed/simple;
	bh=X7uEJptvwsV3/AC2xW64pXmoB3N2kAk1Hh22xuC50Dw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s3cZwN526ZKRNhowgOXzJN8E4KnKcGSQXzOZ5AOI8BHcrwo5sUgKqtH6AgSjNaF1WjRAXHJLeHiyQIxAtfasI6FPcl16fh6ryDvlpgl2iNHbtHKNaYh/W9WVnNJXUBC33HNWfRP8NpcTtG+lQixMq2S5h0YcGnH4Tiy53PnOjrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnXIFhwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ih63e48F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnXIFhwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ih63e48F"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4L1x1094270
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 21:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P0+zhgaE3hW
	Bq02LPyDgy1/Pf5uTZKmDwz1w7Oq2yFM=; b=TnXIFhwvCFXHd3NzBoJOuqmulVI
	BsFegiBMN6lDhSECurXZLcl62T/xdKmB0p1j8my8jMFlCmEaq7KY2JTDXJK9Z7va
	TRufFBqVl0VNsRsBcutr5FS3yo2alYwzVItmMhwSMcXFM/2jgLqXDa9MdGg0YAIe
	jR4uY/UG3ZcfZ/C9Y/45OYG3NLIJKiqqt7ZrgcArvm0AkGtyQCNvinKM8L34ESMX
	TqsQ9WuohNxpSdtobFVLFEOkNqyjUVywE7K2uTExMfHylpD7ghjYgorgRvGQds36
	td8SDEGsaFbm0BN3d/TX8qQFgT6GzPPq6oA53P76XY8mJruvGExjt5LOA+w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1d12bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 21:33:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f5943ca81aso4227824eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275985; x=1778880785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0+zhgaE3hWBq02LPyDgy1/Pf5uTZKmDwz1w7Oq2yFM=;
        b=Ih63e48FFyaXwOpNZCQbnT+wYJ4D5A/wLcGN86ntSwUKTpiUm6TPv+gF8mvwiDyrZq
         qo0YRj75FXnsdPwXrb/3sg87ci8bh2Ar/OC0wibOtSsytBSUEFTtxl7MsFHi/UELJvOM
         Dd6/fyplMWTfM3U0gdXc5q7eZp8CxQuI8rYxfEjWSQ4Mf84RYQqAzAlNS2fEPP7s/Jfa
         V1zQPmCWbRMtZZNtUEuz4v+F1kKaGeJqA493WAwTWOzh5f9y8XT9SrLHAbJFD6QpvvbX
         N74KOwgXJ+DHIMIZvt4AsG5BjH0y5pbo6Ceo5F1QWwatwvaAi2dpK9gLwMr+rXyswStR
         r2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275985; x=1778880785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0+zhgaE3hWBq02LPyDgy1/Pf5uTZKmDwz1w7Oq2yFM=;
        b=HqaPPAQLT+o7YLkLqZpWEWhqcuMWMDcT0Z1WE8G7zmrewlsIvILEJZGP6e0Z9RZSoF
         K9UwR3ldy8DC7sT4lh/O2Uw+ane7SwQldhOvlgcwSVhpx0FC1zQ1uQshnRRR5oUArOTg
         BORkcnhmna1U8qEwU05RiT8Q3oQkKek/j6QlcbkQKtlHXVm2mJfuoULEhFbqLfdeRqOr
         Z+WRAaD84kQKavm4zYtPRoZkrRmwP6WLrj0QOIfh7OrKcER/t7YGDfQ5tDFsQ7qtVrm/
         agy94HtvCWQSjGnHOczW67jZI1GynjsmJbv8ajL9ri/nN/VqjMuYThpuVvFYBkjY8acD
         Fxlg==
X-Forwarded-Encrypted: i=1; AFNElJ/jD6yidWPPfX1WmKrQ8b6AjlxdXom4onXm0xGUQbMSsqAES+C1Zxwj628LOPADIZ1+IRToy/uQf0LB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxicwtf88EypUy6yE0AaJ4ZAp8Kh4i9Y+/fIP79p0xxGwm1oDqK
	xgbtFomVAmzsJmOAh/gbOOScxo+ka2V26XOaZMIaqGXuY3glVlzL6qlthtd1ySs+zGBXUDGa96c
	3tsNuM/DtyGGqFalKxfIeqcpD93wQyRuol8OhsNojJzA/B5I0guEiEGVoET3xbyeb
X-Gm-Gg: Acq92OFNW5Vpa0zzJFHdygAypcHpKkQT6SOvupJKLRSSCI7mG8tzW/QdjMQ7Te7aZTw
	3osI7hPr22RlCdzBWceCavcDpPLcLMpMBzIfWu5aAgfaJ6mDs1qE/YzTWfbat12mn6R9TWCi5wx
	kYfivQhmmjub7SP2PsO7TNOxKIO3QfcPMsgf0/CAo59Iz0ttcnUAcPWvkMypMw1IuEJ28HOpq4o
	DSXTdoHxi7ohbJ9MZumM2ShvoVohLNKLhjhHnoXeLDlIkDu5o4vL+pln+PacMCnhkkpFox+HIZG
	1UXqF0wfjrFyfcSYz/xVBN8KP8CFPerWJg/Fean2LRPZeTlvjs65xoCluQ+efjDPyEseuoxKMlD
	zuFBCmPhZ6PwGBPjqVFQKlgwMdx+RiTTK8vd/Pk92AEraVZh1laEEP3IYZVwznXLS0O8gQ/QINA
	8=
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr5114670eec.8.1778275984597;
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
X-Received: by 2002:a05:7301:e101:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-2f55dd323c8mr5114649eec.8.1778275984035;
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:03 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
Date: Fri,  8 May 2026 14:32:31 -0700
Message-Id: <20260508213234.4643-2-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX3IRKInscqehd
 +0hocO+mfYv75r1jYi/t/IojrJfd5wUpDwOfjL+xWpO1wm9mW+mmKzjobaTk4O5/0HAVZl46Peo
 MR9cUmlrMKOk61myzJ8KC9Z//T0IW5Opt+VMtk+Q/W/xkE8243ZqMpvYduW4/LVB7uG/ZKMXKxB
 hQ/Q03lSAvEP8TPxRerB0InqO3dDVpr9a022QtNF8aU6l2b8hzLNaOlBtMHjoOOfJH8jXSovdX5
 fqlacLrZNYqbP6rCN3QIfK9b8Gc2xARbk6UsF7bMKvCl9Tb1ldYpJxpcBOEjA3wI5bREaF+7PQK
 s21Ne6DCL6/lNok0JyD2nCgHzhtJpNShw6yGIpmE0fKtVFGfvMTYKcpkqGhH/Zupwnla+c5FLLb
 HdzWUmSyCUCAFvUcuVSw25fUtWjBAuGpNWHfH+9vMb249DfTEqOMFubvr7oVARqhv9N22Xkvkdc
 fVe0TPlvynf48xl/ZRQ==
X-Authority-Analysis: v=2.4 cv=GLU41ONK c=1 sm=1 tr=0 ts=69fe5691 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=8IMiPDtIn6OAJiDpRukA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: -n5T4FwK20uHtQQOoT6huSBckDHQdHC7
X-Proofpoint-GUID: -n5T4FwK20uHtQQOoT6huSBckDHQdHC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080213

Document the Hawi compatible string for the QMP combo PHY.

Hawi uses a new QSERDES V10 register layout with a new COM AON module
and hardware-specific PHY init sequences compared to previous targets,
requiring a dedicated compatible string.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..7a7059c659be 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,sm8750-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
+          - qcom,hawi-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -205,6 +206,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
+              - qcom,hawi-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.34.1

