Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AC63DE44C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338145; cv=none; b=MedBM6N/et3d67/6uoskeY1G2ObkjF7E+1aql6Bwz8n440zMBY5COVL7Y3/oS0Jiu0Tg/67C4MBTgl5VsAUzu+XdlBHSgCWQyhSGMr1LLTMNqIa4ofzrI+ZYFRDVNJNGLpijapFmtug1SlklcFmXUOZ7Bpi8D7TRcSxkCcWt7HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338145; c=relaxed/simple;
	bh=9iDney/4UaOp4gyAQJJgqYiksjkSOYt9Vy7GvLh9Yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbK4Ngql50vIkIy2FolhRlUUbVEbx68wj/Y/95blMSDgwuYBJXhA4vRyu++DfB9bjQ7b755EnzZRIV8106DeBUEonXKnrs1wqmTyeoUslTt4w14ruUCUxbmkwngp8FECBZfSHp0FFg5enmKwcwGxHdEm78arr/MkviyhLXWJ4o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsnrWI0N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfzwQo/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsnrWI0N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfzwQo/5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651G5SY23372613
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 18:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=; b=UsnrWI0N1r8T0WJ7
	j4U4silzRRFNM7hzdDHkQ/OTQHYFyMDpgPsBtRYzDODSRiHToWBw9f4rLLd72MMh
	McjmmrnNKMB9c4XRF4F5icZ47c1OJpY3k0sIjw9QxU10HmkctVKwX+mX9RljINlq
	mFUyGF5oId90sPAUIlsnlcU+xP/LMqtoUCQjN942v89yQU3gqQV+FD6kZq1xbZ9k
	hq3l19SGD+sDpKDQY7S1W1kPdqIuLRAXFeNalz3AGZfybqvkuIlcI1E/jc96CXkz
	iDOtOuMOU4ak9DQS9Ong8V4uGaYWkZr11uM5uCRazM0dKFaldZw9afTev09n4i1s
	yg4Ykg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jha9b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 18:22:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b7c55406bso3522852a91.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338143; x=1780942943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=DfzwQo/5G3M0g5ny2683cIK33Da3+v97TFp6tB28A25Y1SkoJGDCMg9Drvnx3n3wS4
         VjZKqjrPQJUd63HZhQNeElyjrRmx1UKriFGF0XeIoNsNgkoObraRhKxDGIxldifUrBJ0
         8RotOqMBj7uSQ/fp6i7fFYOPlYICzYbLql+Ftz/dAHOcXDAR50MZIonwxFkU87p4TH/h
         C5dnJ1XVwdPs+FI57LtXmFYia0uLY2W/uLfieUsQJagCO2aws59N3AR7d5ScbWVLj/B1
         iYpjd4839+4kX7AP3O/IsF1BFaoz4q0aZnYCVDTFDBfXJoizn1/0qWcHyUwTbKdBI8og
         MKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338143; x=1780942943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=XrGYU+0vDu3BAE185p3UaaCEi8QOHFNhh5J9NyCSiEVc+Ptf03giEWrsnsjvFz+6vu
         TOe82YXNadSBBe+yard9H62QsCMqoH1gHy3VAR42MEuGyrHn0iImmIOZEnbyEBaHi0PG
         tAffu+oZnqhUaSlHu4GX6hrZDjbS0dCylD+3PVjpp4GCUuUgsgJq5nSWEEfhCkqyF5qG
         EcA0ANEXuNBUyq5c8WHGaX5MktpOc+BqGyjZ7wwqKxQLy3i0ULa6L3VHQHx35qehTDm5
         YhIR5gFM2dCmwwSXGocnF2IbDsxXnYQf73mrjMA7TzBif/4qWh6FKTZGTotng5KFz+xK
         +QjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Lg2HezM1EZQ9X+jJnk7rzRah0iJ5dukckxLn9MjVHB1YG1i0J+nECWsF3eszGWkoJAtM5ZfD1xSJl@vger.kernel.org
X-Gm-Message-State: AOJu0Yws+fziGjmgHVIRWDMvePO9DO0vITN9ZhLRJwdjlxlDTGzRzBbH
	7Dywm3Zy0vkhLqGE2pjUuysyVHr0EBsS0w5R1YZA+ScA6AY9NdVtaudgjQ8iIR3IhnChEPyis02
	TZs9/iVc8XugJvZOcWMoYQn7/WIjWXwXUVbkkyyTw7l6iOC9F2wW3kmelQFe9NbT4
X-Gm-Gg: Acq92OESPxVp/V9rEsE/+8KgEsqcay9DFEQWcS+PFfzf2dtv+KePaK7NHvpX20wAO+W
	83DO/X9lGIWS2a4UM9Xgh4J5/ny/4PkmNPpAmkm2Uct79RuSBWo+IUufe8kqDLXsv0WjqI8o2KR
	4U9lnL4+6MtiL1QO8TOJq9dLo8QMKp5kNNPOYGBsO8cWstsXV1d4q9osSkHZFRp+VqLKMiqNZLK
	1TutKW9Pf+8NE7572HamcwXkzmUk6EAc4CtwUTCZkQN2HXyE5eY8CUN7B9k/SJ7FEzRdD3Ubugs
	a7Gyz+zy2DF0yS8t4vHpT7iCS82ikdre2DvdM2YGPnKX0bIH1VY9vyGyRIxqaw2gcIjRHBS6Ba3
	p9a7husOFCB8JhMX7Dyz4dZf4/3uUXo4Dp6+wdRPycPbc4Zidrryry0gukvWyLek=
X-Received: by 2002:a17:90b:2ec3:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36c4ff277femr11324094a91.8.1780338142038;
        Mon, 01 Jun 2026 11:22:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec3:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36c4ff277femr11324063a91.8.1780338141615;
        Mon, 01 Jun 2026 11:22:21 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:21 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:26 +0530
Subject: [PATCH v3 04/12] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-4-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 8B9pP3grZhyWLeH-2C30DEpP5sYsZqXZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX6xeZ8cgKx+Vs
 DUjbzjSIhcPP7wXCHNZWPoCMTK2kIOEuQT/FiDYfOHYrrExaCHoWoGQNvqL5rHfR71FbmzvZl0f
 5CJQp87jwJwNZ2dq/r6Sn+D0C712BjRdSad+7hup7DXuKEDRSSiCVvm9KOi/01o6oZGqk1LKTEm
 Ab7qloQ3/B5kpO2ak2JMYMT1IauiLEs2cfnAGq9jG5pVoMTAdF01ERxF/QwC9rX6BpzoDfh4dBI
 kqQ7UgbEyFKekZLSXjtHeGdnE61xj94zLqARRlJkStr9iuZwIuFt5+opHFRzbkdgpjewFaSBESX
 nwej11MGGqflMMIU7cvwVj2GrewLKo7VxiEg9dy/oTcKPR3uwr0pUQNHmxr3rPN3MTJdJvpWXwX
 mGeSls//z6DsO2f08X93z1JjyKHPAqbc6YgFbA76V9Hy8ERkIqlYEJVUQ/yKj6h1oSllg1LsMCx
 G+IWFblUQxEcqUi0xbQ==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1dcddf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tQxzmpfZ-Uf8aLjc2qgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8B9pP3grZhyWLeH-2C30DEpP5sYsZqXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010181

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
bindings for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index 734880805c1b981a1c899d85435f83f4f3dd3ea9..1bd70d091fcd7b6d7805ac090aaf840a415c123b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1

