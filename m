Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C71C3E5A36
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 20:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456399; cv=none; b=jwEJ/WVPY8MF2/Tdc5LyktQq47sQlbdCxuzq9PjTBHYeFbU+cJPuZO/yHcD+Rk5OfJHnazjvmc5skM+ki0WBJF4irIQSjsh8mu1CmNM1jOb1TmNubwfQBoZud1ygSBrt8PhdB8iDfxM2lAmMAAbqytxhhniFtqJ5fTnT74tdB2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456399; c=relaxed/simple;
	bh=Ers90E5n5OZcfZCnnXF+yZyTmU+YDE8SNMcuiTigNrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejWFtjmHG7pc2tiCU+Q0bBpwNu5gGuyyT1hYOzIWgNw5a+8+TLQbyGRg8HxL5CVvXW8WiXm4Owdmw2UyuP2lQDXC8thddQhK7wIrE1ftKhE6VP6ENYyVTcv0WygcariwMxX0UBbmzDrE/FXKJOMO+VVmPyztxzc7MO2xrsq9okw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4te5oz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4GrJZBa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4te5oz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4GrJZBa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Hie356899
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 20:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lndSDlfCv+Q2H3n2AzMISLkpQQLVAdwXLJjOEHyLrDs=; b=D4te5oz0etoeifdI
	MVqFShPvcHjD0Bo1DJY9lBF6L/mt2ZCyDvH1L37CF7gLMFPp3DXrp2lk0HjOP937
	fbENyp54GOLQ5zIcdSxP7QwYOQtN2RhIAEkPBe8V0ghHSeBKLbyHs3od55xkwAcI
	XbWQYgryyMBhNxn2bD8F2fyEH6SUDpF8/i1s8mQPWk/FQY63xTr6YtKh6tfAPq8m
	LIc45CccUB3gLO8QbqQ3ChbkHv1W343RN2KQ/LAhVydP9QLwZyYBBLnZXSrsq/Wd
	v6b6Z+C/jCOcpeadipWGUJviSu+Cli8TtBj5IWSZrTo1EoAaeZa4UCi5A6FDwrAL
	1dLi7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8m1b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 20:33:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso115115ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783456396; x=1784061196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lndSDlfCv+Q2H3n2AzMISLkpQQLVAdwXLJjOEHyLrDs=;
        b=T4GrJZBavbNBA5/c7qlY3p6fUTeCZrYdemBHF2ACQW9oQyxkySotTU3XKnDZjqkU1I
         JVi4pJ6LqUio4jRADGmzfw8rCpgEMQ+I5vaAwU4XK1/2FDIlITi2xLdddeeGENoOSaXs
         H96SDUWf5VtUFX9FmIY3ufCjfYijvVfOIGqIod6EP9letgEMD1XyAmsosLcMPP1JP1kj
         0N9o1Xsmc5bNdSljpXryo26IvP3rjqCHe1em6MaXIOr/+DrxmuX+LiAc6sB7zpE/gidZ
         qtvmEU1g0HTorvtGJvMUBS5Gq2doJsPlXsbYTwkEeEhAli8l6f+MDeJoisDxWysiDMAX
         tNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456396; x=1784061196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lndSDlfCv+Q2H3n2AzMISLkpQQLVAdwXLJjOEHyLrDs=;
        b=YS43BUPPzFA671N7/mot+WmuRMUtjAkyvTivNylzMlkT6OWEPy9CEAn/C+WfNOfE5Y
         JcyCGh7bLBINCJS5Mkymcgh52zy3LLwSId2HSv4dkzm4tavNIsUZGgdafRRMJMQ+NGSW
         GSDyprCHegBi9aF/6OlV+pb/gTCAnrLLIWyzbcMCNzKP361W1bNPkYkhvkmtHttgm/1u
         seTTPfbOpQXoDvG4DhtkhErcHieLYblHq/BNS8t3IyuXDweHAhFTYPz1bHdveyEKZyh2
         MfOB6UuzGNui/hu8rVhW9bEmqmYm83pXDRMocmqCAxrOicRDbXUOK18tI9rMv6xILBbJ
         8amg==
X-Forwarded-Encrypted: i=1; AHgh+RrodhDMW3FJdyOPwDuyufE1LzJ3Kvbj7jYVwPFYcJ7ZmZtwnUkM/ZjKNI1aJLor3bRCp/csBHdJ7Hs+@vger.kernel.org
X-Gm-Message-State: AOJu0YyHgMP30FJHBI2if+1/SDoYcr9NO5cl5yOPKwS/0cfvsPgFFwsx
	dYaOoCi+TbhKTal9K7Iumht+UxK4kPpKyN4W5dTonSPt5geHIK53ej4oWx8CwDygZCB5zol3bql
	Oq4A/l4384bzXRqmkc3rcKpCPgxzvNnIcLiHuWR4QnfjZV4cFmjyDWAcGyCP6svAS
X-Gm-Gg: AfdE7cn1oVP9nr6EFotvwy0fp7YavbC+7smQg10HOzu6iqWOE9qtBJKqk5dNNso/jbM
	eVCXMMc8n7a89EsUlbhGp9qVNL6+lPdUTGxCXKivdzH9k96nJYBrew2IP+TzPdRygB7FnV8qywa
	LmG0M/tC0Hhl/RO52TgYvF4ar4tGM3mJR40yMkFW3nqG2Ep6/9UeJPZjx9lqoDc3QGNuwC/JTXK
	1Zcj0cSO58/8eDJCYba6t6Jm3Z+4IrXfAAX5ZN1UN0RxYHrCcN5hjTgxz0vaDM29320+1BcCo9V
	UVxLwPOI4/hF7VI0DfxGHWLC2azHeNTMhk1/5ehdik44fgelhfXqP96jdmH9IZ9Q/9sXOj8ZVw7
	QUCY9Tw11A33JDV1b84H7vJPHPfjpanGCuM7RpC+9yLu3Fb1S
X-Received: by 2002:a17:90a:b108:b0:381:5ede:1296 with SMTP id 98e67ed59e1d1-3875547805amr4965567a91.11.1783456395881;
        Tue, 07 Jul 2026 13:33:15 -0700 (PDT)
X-Received: by 2002:a17:90a:b108:b0:381:5ede:1296 with SMTP id 98e67ed59e1d1-3875547805amr4965545a91.11.1783456395311;
        Tue, 07 Jul 2026 13:33:15 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm11975804eec.10.2026.07.07.13.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:33:14 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 20:32:46 +0000
Subject: [PATCH v4 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Hawi compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hawi-phy-pcie-v4-1-8d9cc6324947@oss.qualcomm.com>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
In-Reply-To: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783456392; l=1941;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=Ers90E5n5OZcfZCnnXF+yZyTmU+YDE8SNMcuiTigNrs=;
 b=L8Oo4nvaSFcOAV7wXnV/VYf/fok6fXiHhGudQxCRoWxWPjRFKk9JVcIYh1M9TBhwhPnF64x1c
 pq4YLHQi50PCQRYPZJ+Whk3Yvee4iU0azaZT0cIcHpeO+w9KIJ4hXsd
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX5zftipeQtgH4
 8cOaKglv7ICcpAhKEyBBXrjyOISX1/4PoF9GJkG/2K89cnUpnvK5Iq/UuzZ4BGmUFbroLJpGaUu
 BG2R3YPRs1R7hXxoDsuDBqWZTI5EVuFSH6MJimDWV/zm9+bCuZbN7eoV3h5PZzAIS7iZ2v9euSj
 444iTSmJdOEtbsDuIBVZvzSGkzC+IfoEpZLYD63hYBr/g2/MIQtbhU+hsv11JFIf1FbD5OemCtv
 IsAs0H658+PTD0zmb6G0b+7cTOTcTYwzDjqps0E7gS/2k74KVBXQYehOfC83yTD8oqpGcrYcrdZ
 msvuE0kd8kE3MUN4fbVAi69ql7pe3J3/peLafO8KJ2nmQsqS7QbY3myjfu6+U0oMo/IAk9ARvte
 xA3eyNiVoIcOn0DbboCkThxFH+Ixr62OU7ay0FUdV0w8eWCxJb9e/As2hlQOrxR2EI2QpnekVKc
 xK34DawC7Tgh4ppp91A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX+eOxrta9SOn/
 MOl2H0rd/1A6lcBcvQPc/huw+7C6HPyNzrYh3bNNEpfxlcN/ThLnykvJrwDqkHbM7O+PG8fBQ2D
 3vT27FeNPuvpVvfxk1UyJ5FZOUognuE=
X-Proofpoint-GUID: -ojKVBbIl1s4o_jJ2H-OSYoAFptOEUYB
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4d628c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Fc9aOexgWALdB7SI6KoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: -ojKVBbIl1s4o_jJ2H-OSYoAFptOEUYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070201

Document the compatibles for the Gen3 x2 and Gen4 x1 QMP PCIe PHYs found
on the Hawi platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 108cf9dc86ea..259ed9678393 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -20,6 +20,8 @@ properties:
       - qcom,eliza-qmp-gen3x2-pcie-phy
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,hawi-qmp-gen3x2-pcie-phy
+      - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -196,6 +198,8 @@ allOf:
               - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -223,6 +227,8 @@ allOf:
               - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy

-- 
2.34.1

