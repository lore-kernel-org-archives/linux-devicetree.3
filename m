Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B887231283E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518693; cv=none; b=omzSn9ZWa/dSUVmjSAN5oGmMZQ80dh4t5GI3UA6dJ2YR4dm63DiPzuIhf/VhxBHbgsaqEMWMF9+altok1O5Tw7eCnysCUObDB6Rc5/eXs49LEyjngS7LhXG8x1eAO1/DuoU7GyMYcuGUkBObHhJaTq5t+Qxy76UX0zT9WkLyTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518693; c=relaxed/simple;
	bh=CCyTJyjoMYkKceetEu/Ag+Z55ygei8JsGGaDTaI6Q/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IhBApEFi5PSJ9lWaeP1H7zGpG9+2VK3uqf22Ptf2hjyTB5bUb9U33p4VRsjM5wPfYS+cbhSRspqJQz620be4SQ5XfWI8nfQC8Oc9TR6JBfgZhvj+RB4lEBLWiId/PpCqoZdZE2yTQ/VFGi8faBaEjx+1PsiAroS4pFMcvdWYpHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CW80ft3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilwCuMYX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CW80ft3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilwCuMYX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BC4NGw1106444
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iZuWkO7Gxcx+6mEhB2yhKD
	p1gVtoR1+b1HN8lKmizSo=; b=CW80ft3li4UqLstEpCJRLvOb0vb6CzbPChQIOy
	pdW/E9xPJ1NMWLI4PUHKbzfWEMOCKFxLK6hJTscylwp92XqWYhfzMy5A6lMS6tyl
	9U5KZSX5Ey+1SxPA9MntXLvmPRg5ewHi/MoMjoLMoRnA5gT9QuLUG5wux4FgpPd6
	U8A+2Y+KWifwr9AxvZpcAelS8NjdDjXD97Taid/AzTRrUNC3aAFX3eM+zHQg5DAp
	5g4woZX5CFbxy+5kLVduBwe8bRf9IUANOW0EORuOfiGhU0zEo7PRfSQeZv0/mX3/
	XwwWL95wRlO9io37tCsoaf7XtG0anD/4qU/EvwDjDX3eJC7g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3esr99ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:58:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so5886506a91.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778518691; x=1779123491; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iZuWkO7Gxcx+6mEhB2yhKDp1gVtoR1+b1HN8lKmizSo=;
        b=ilwCuMYXkEvLL4tPDG9sv0K+1hhGRDiK1aP2hrccz+lxzkgduYb3W487WSl9qzUzU1
         x6rdeHpCR1lL+Xa3FLDAhd8zwQnwxzDA/uDzykIZ53SIOMeJLVn8fsYebCuo7G3u2TG9
         M2TgDSNoqRFk3TsyrqVzCiJuqU9pgZuT2LRRkOuCMqLbkCiThQ+Blairy6UO17YKwF07
         gjuetJTgB3vAnVLbMUKIF3gl28QiPsQhsSz/iiR9s/jHmrO3pre+f/qdLOQkcxyLh0lP
         +8uIyAdrCOM0hQDVJlRWp24t0BlfaRscpYIQn424l2+cvBSq/AvHa1FYZ1nnpD5Q0ejd
         9kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518691; x=1779123491;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZuWkO7Gxcx+6mEhB2yhKDp1gVtoR1+b1HN8lKmizSo=;
        b=T4CpYaFuV9oYSrZOO0JOjCyOkCg7I/Kf41nkf/IQuujRPVshYXhFXtjVzkLi+15WEi
         kLy41pk5Zm0jtfZsjn8VLsP3ucIUsA+zO0DePfE40x5d/E/g53Rro9u9CB+V3q9Jq9WI
         /SmlaWvZJecjUESVzGRJ5AJlmtpR0HGLq+RqWc6GJlYOQGigbBOi9ZmMpSqXEoxCHEwe
         KJP2S4o2yvEKa4RsLQpbEtc7JCw723nioWBGkqRPpT3yEy3Sg4Y3z3msC33Qw81gOyyi
         SvrLaY/Um+oqHH75vZ/YlLcDkncTzGHE5vvdEnDshb7hhGCywqz/qLlGpGZA8BE8AsoE
         ub6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8HuDHKg6MN96Xuu6r5FH4zup48w3DDBNZtyozomHJhRVZb305qy1bjVNd4WYGUCvJz8/YwsWoP1Hn3@vger.kernel.org
X-Gm-Message-State: AOJu0YwU0xFYYqn1r1FVuWJMTBe3iOfxr+p25M4gikvzxFign+8QNq4k
	+nN7VLb/mzf9jij3AG5Hu90GKbEw2953nh1ESFYCRxnwqIAjtjDKt+Hh518FGuko2CqwR1QAuc4
	9kKsPnwQWp416eS4mt13aXEmkehfTuxoYQwNO3CiAhLYi43aF6duLJyZ+H6VOwjSyz4KGtvog
X-Gm-Gg: Acq92OFqsO9QQpIVHBRHGzF08Fo4w3zHOUn9Edvr/X1ovOf392Q4E/qW6VP8pZtZ+Go
	DDGvsciqPQcFxEq7U913xRkLdFD3xA08UzD68RSditiL9Otw8Wgw0neIkdnmR/ZR8Fs8pfqFjIv
	Yy/drOMX41ml1ccP8ur0cM/ybKrdf32oN1oL3XHwui3klreCc/x01BkaiIll3vR51xEeIQuNyYd
	kh4U0hkbiNO+RYS6oAkH92/qrG1zkoigkT8jcWUL5TgDTHlGr16d0fVofNcb7eOpJtAtVLcfH0S
	YcnS7zcaA7KCbGipNHkzdRfCvYgXO9NMCn/891SN+mrE8Cx5/QYuxi4JoNtypHroFRTOyaRScBi
	/n2Opm49cHE2lvep5Y+OESeZF79wS3EQNqA1KrLlUB7TbASWzIz83LPn1xxwK42mafj1HiIlnVw
	DOZsn+pgYrtDxICgDI1VVE0M2ah5IQVlnhEucEJmCbFO+YP0fFviE5yGJ3
X-Received: by 2002:a17:90b:5683:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-365ac79c531mr26699039a91.25.1778518691123;
        Mon, 11 May 2026 09:58:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5683:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-365ac79c531mr26699002a91.25.1778518690624;
        Mon, 11 May 2026 09:58:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367de954ec0sm7716420a91.13.2026.05.11.09.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:58:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 22:28:04 +0530
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Document the IPQ9650 TCSR
 block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq9650_tcsr_binding-v1-1-a41f612da54a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJsKAmoC/yXMQQqDMBBA0avIrBuYCEmxV5EimkzsdJFqJoog3
 t1Ul2/x/w5CiUngVe2QaGXhXyzQjwrcp48jKfbFUGNt0WiteJoba7DLTlI3cPQcR/VEb61pDAY
 foKRTosDbtW3ft2UZvuTy/wXHcQJfhU+2eAAAAA==
X-Change-ID: 20260511-ipq9650_tcsr_binding-70d665950fdf
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778518687; l=994;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=CCyTJyjoMYkKceetEu/Ag+Z55ygei8JsGGaDTaI6Q/0=;
 b=OFZea6hnnq/jBDa8gBckeilKZc6qliG7ZE2b+mbGOx5Wsf0b/LNFOlTOtGRUABj9SCvljec9o
 14rPnGV59sEDXn+/NbQfOEQA+CGev5XYbjlzG+xILV2RKbXAw4sa5eu
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: XMjwS8ffo8-PRmomIcScG-y9K9-nw07M
X-Proofpoint-ORIG-GUID: XMjwS8ffo8-PRmomIcScG-y9K9-nw07M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE4MCBTYWx0ZWRfX+MlrzhDKdzPZ
 4gD/6vNT6K2l3JmcO6VrVGiMCNZm2X5YFlx6Rbi69qMvHnOa0XXCsb5XqpLAVdo15Avw587EsUj
 PYxRCq4PXF3EmiYNHr4zwyeITLyWRkltFqcJgbR4hVvAYwPH4bDW2FXINu6NXqPsUk87WR9QcAT
 S1ZxRwP4DccbyLFCh164IccQ1Y8/GCJshpr7pYNl4nJfQqwK3U+ArhZuRbh85dJvfPsNUsWUDxz
 VY5nlWipjpI1a9ZI8oqskb1jit7zhtcKU1ByKVMbHwSg+B9ZWVUFVVrDDDgrqUl6yAe5iq1TStf
 PHThPYmjrJbiFCnHcVOw8NQVKhndAdrC3nLUpKVdukQ5DgE9suyCpzXiTKjtUcfpgZrxdxhOjry
 c1ECEEQLBgksX6QqVkd6hFbaN9TT/+VrcP0nzJlcYzADnWNSwmNbJPVG6jZ1raniOBn6wsLg3yn
 d76abayuJZzmXJocJlA==
X-Authority-Analysis: v=2.4 cv=G40s1dk5 c=1 sm=1 tr=0 ts=6a020aa3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7fb54yGoueoaJA_UZa0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110180

Document the TCSR block found on the Qualcomm's IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..8914c882fc35 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,tcsr-ipq8064
           - qcom,tcsr-ipq8074
           - qcom,tcsr-ipq9574
+          - qcom,tcsr-ipq9650
           - qcom,tcsr-mdm9615
           - qcom,tcsr-msm8226
           - qcom,tcsr-msm8660

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq9650_tcsr_binding-70d665950fdf

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

