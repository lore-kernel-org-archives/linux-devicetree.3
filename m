Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46F376A12
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973540; cv=none; b=GqP/Keb6mHjytvK4XVpHvhPykZevw4w6g+vA8S+xP7AArdFyQBll4TYA8OIOBv4LZkiz0MQrTuj+CvvFAdzt7DpoVwnurV3+9HkKi+QozApWaJRHJz/4pWwC4O80yt/spPECNw6Q2s8RCVSTzGKdj28jFGQcUWCtErPg/pLKzyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973540; c=relaxed/simple;
	bh=fUNMC3JGXhbiq9Y6lFVg/e1xZgyALQ51mRBs5zUcqVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OcapYxUhGjc9t47xSXgxZlNvX5R6gX+JUMFqYjV54Xu0j06DWBTG7jS0rsBtZO3bfcQGC1PI1e9oYTEj+xAJbF1kStDBkJFNQNqHZ8if1qQ5extR87/jPgFs9/mcp3SSlQJqZnU/tBRrN/Tn9sj1VzfaH1Mv4iRd3ww4Tqs5jOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mz2jlQLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8g3Iubp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mz2jlQLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8g3Iubp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z9X33680248
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=; b=Mz2jlQLa4MitRAzN
	o6M8FFA9Apdn7otmOjy1wkaqlS95thEvUQ59NLP7sSNqVNUiSV28gv86ZdstVogf
	7vMLDLsBOmIBYWqG2Y75Xl2zaFqNoMIIQN47Wp9J3nmVHMSY8GkTy+b6FrmR9krI
	Brdah4U8ibKssLiR1ns7yZUlAqOXGFwKrBO6g2mh7Ca//EBPpDmuxBpftEH6oJW3
	u2QIc6F8Mo3tNyTwmjHCmkUzh9osLjDkOgUP5IX+A6mZjebsGi9U6nSNBGpTX/3k
	M1q2xMB9bSaOFTIBi87QH59LqU3W4XI+1bQQOZdV248m1HZWCxBYzjPqeBU+x1fp
	mXDyMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5en17q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:52:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso2284202a12.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789973537; x=1790578337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=Y8g3Iubps4/xlr8vSEkhYQDgzWw35QkKVHu+hYVebPeTQblB9kume7uzThsUTc5Vnl
         Kky+fi0uREYM414iph2MdJiMJufHSExn8e9+4Wiw1YZwgqVt4yAoRupOUoX2OagE3bj5
         szJAHnG7+K59Ew5JDux+wdGPCStWO+CK3/QGiNn2/ZXavnxU+AEFmXDrtdxu9JN8VzbI
         K2jHcrInstCKGJuw+mpnbP5FqEGhMP6RrPc3YtscNhvorDYVvVSsQGjOqIWHlht1IH+a
         vxnOpurfpBkP98uJMB9+V0zklJsSe1zoZMCkPasVIy6MYkkh3rYr5FEZ04kN+A8suENo
         pzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973537; x=1790578337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=c0jEMEzQNFBZbUucQMpZ+VEc4bODuo/C3j1gjNAtwiS5ctQokJrlDt8SfkV4uBbl8/
         xk0CR1Nf8DNGyxGo0tZTeAdWyONNK7WDwYcRNAT2tMsoi47X5IBs3Z2ji7y+5Z4S9M4X
         OecoNAEBIc8av//5dtcUFf4MVxwszxDgxkgSj2Euerwjk19Pv1hVgn97OxSyUReFcZJq
         O9/R1Y+5QfysSdYsg1+x1U0nOK8j/k4argQZQcHNTtnYC/gAprnDS0ab6qObEKTOqJVj
         CJxcB1SBAzHsRu2OAYUz6Y4N9R3gvHYIhd9gQs/vNz+E0pknEM3NC+4qKwcJzyfLAlR7
         NEFg==
X-Forwarded-Encrypted: i=1; AKwUvBzJ/ENDdm+h1XgM/nddbYno9FX+X27jOudBOkHskDbU9m61IX9y2Nnc8EljZIzJlte9d83EgkfvM9R0@vger.kernel.org
X-Gm-Message-State: AFuF++liv2Ac1G+y3IDTdmu8YfoOcHqYGfJwgDz5MHZ9T2O1yuKk+dTt
	kX5nczP0AgNG/sasMs/E+nexprBciPq8j7EfEAkLRywI69PotDpO6nKykOeTw3nSD1/4qOitNy8
	EZChFY8hhO4yTEH9niJUVLRd8rUN7Cz4XayF82+Hi6JfeIMaBACO7re2GmXbszDZC
X-Gm-Gg: AYBFou16gqzozu84/m3pwkPgbHgjTI9zA+csMptTiykr9vX1cVgcoPwORY1lJoFKoWr
	ckjC+B+NrpwDtJCwHfxjBHJBMTgr+kd2kupv7NWyusk6GFW6TyTP0zfP8QqUYMJCqBg85EC1nbj
	kpVP9SiOVyl0UihVX3LgLvGZ3SQQKgs86U5LpYUpv1sHue79gjuuDxbQuAqvjbr6pM0ULkEHpx0
	ELv1ZAzn9nwo7yL9tAERAb5GdyIp2uVij92RFKJYivZ+mDS6K1Dcy7cS7glkWJa46GdQZ+OwCrN
	Od1A07tFSPzpEtDqYaX9bBERufdSucSVGem8A9RPFuc1W2HAWsCkrAjRifn7a5g2kuZIjLIm5Ff
	pObzp6usqeutqKzx1WdvoJLRUpfejuNPJRLbiKtwFTWtXuJ4NIdqAzdo2EYrtgApxKLioQJFG9B
	LxwCeOLQOHpYW4CzxiSx2pS265Ntp51JbD+A==
X-Received: by 2002:a05:6a20:4307:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3dd8c3fadabmr16962966637.3.1789973536995;
        Sun, 20 Sep 2026 23:52:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:4307:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3dd8c3fadabmr16962948637.3.1789973536618;
        Sun, 20 Sep 2026 23:52:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31342975c88.15.2026.09.20.23.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:52:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 12:21:52 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: add few more SOC IDs for
 IPQ5210 family
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq52xx_new_ids-v1-1-63d68a11bbff@oss.qualcomm.com>
References: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
In-Reply-To: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: gPK2GDDCKhYaAiUjofAyi0B4OWs-oSmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX1w9xSz6rYy1T
 FPgMuaNIY0FObib//woIsFTLlw3z2KY9TsIaWVootTPIKTWVQl72FuKsd2ZTY05049g6GSsgOYS
 mjBE52r7EBDafhOuX7q9acI9P6UnPwiTJM12dMNs+LrupwJ/9fOqGBnUa8/YyMtl6smnrQuShsg
 pg4cvd6G0zZJAjcz+uFNhifUflRpCSyQ/e/mqkCE/GJFlxNpahWJNUVeoicxR6fZECUywOYbLXo
 Lm1LN89ybmjlV76YIhTfrSX/yKVvIdnrlH7TsgxZjIAMeaS9ICteUodPbjY7Y+v391eHtwXmSAV
 HN+k0GkE/YRQsPLLJaDBBoLHyiAmAfkDAWy0XFBHdX9cSr3RhZf1NiYD0zbjWbYMIX1FUBWZkcV
 JUzxYiMhNsSS2tSYBTTHfXQClesl4bev6rC1GnqkpugrZLW9Kcpx7U+nl6ZHMCzhMYgdfi1MZ6S
 CBFoTHUKwAXGEl6l1yw==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6ab0d421 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Ieg599Pkg-FuY5gSfokA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX0F6MjkCvWdLI
 h+VCQgATCH123r0+0jjoL3nMG5E/m5BFPYjPGQI3f98sdRHJTvuvcOEa7qfyaNibJr2fJJ5k0Yk
 7i5/FLocrQ7kVRJW4MsyJoM9beLkzzc=
X-Proofpoint-ORIG-GUID: gPK2GDDCKhYaAiUjofAyi0B4OWs-oSmi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210097

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..f251d4c75612 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -317,6 +317,8 @@
 #define QCOM_ID_IPQ9630			779
 #define QCOM_ID_IPQ9640			780
 #define QCOM_ID_IPQ9670			781
+#define QCOM_ID_QCF3211			801
+#define QCOM_ID_IPQ5211			802
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.34.1

