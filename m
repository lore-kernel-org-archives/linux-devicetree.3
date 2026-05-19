Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726C43B813E
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221027; cv=none; b=UMuPQhbfRbR2lr8TbyU4pPQsoWuPFOvAvfzgi2IzOCDeZXSY/euGsWTcm/xqLnOmIq17TZ+e1gf4Afjw3uGTGjCRE8CU+EO9yXf7arruOSkh8KNlkYszq+xXfee/H0k4Vm3MVFJifhXGOuTPsJDHM70psrLJ59bcI0sHhJQnj0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221027; c=relaxed/simple;
	bh=cixxkTDqmFxVL3LZ6/FGzvqpRa/PZqhkUCskLiBduV0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zt6hx8Kp69KvO4VmtBv3P38YfieRBg0AjEnLCoSVWpEDNwtw9Z+k3Z+TacbbazPggS9DghaPoCbjI235ZKqCzfo+zQDs/FV9a0IjJS2b5RdsZe4aZIGfuyOHZ5yDn0gA1zioz2oiB3LRJXmtBrc9wQWiwM/U7IosOfibSqTHCeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiYCb82Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RF0JO2Qj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiYCb82Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RF0JO2Qj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx9fC1953991
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6VLWt7FBiJ7doh/6+nwiex
	x2CA7eXIw7/akbrpx+Yug=; b=FiYCb82ZQ0tNMahp+DfMRHl3+bDlmghdhcpABo
	yyYWa5k9LR2FSMm9V94bUxOlAQFEjYje0i2M/ZU85gE1o7+whETB/UlD86YbEf4O
	g3oqexLX9/zXPf/5sFDYt3gE10YKLRMK7bDSWZ4ViYAYiEwAD1gbeGgqsAid0ejG
	9cZnLXrfp40V8J9wkiQ8vv6tMera7vcWcQI8fj5BHIJtCBg23eUaFHtg0QRdRo15
	8et28BHyPBYPRfszi+yvbVTtYMeVp757Is92lULBwyVqUllGf+eUZiO3S93fHWAT
	Wpqg/vo0+Px/bs+WfiAwlrjDeli981Hb3VbtRc8W3+f7lrEg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xs968-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:03:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f6ef62af1so11395091e0c.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779221024; x=1779825824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VLWt7FBiJ7doh/6+nwiexx2CA7eXIw7/akbrpx+Yug=;
        b=RF0JO2Qj6YsfLFFYFeLOHShCN33kSbafpDpYArMPPZty5eOpLBHFcwcmw96rFt1yn9
         ALTPA4oMljKjLFd4SxwdbYml+IfJivyOS/RY1P5PJhcKC07JvvHYskUBlh1PiS9HtFz1
         fBS/AvINfkNOFnLK6kPjVpahMQeya7sXlDOb8pQ2GGcb6rLBjb4T7EJLJ5R+W/7UZKIC
         0iwssftSCcbkDReOU4Q337tOOeapyot89E+4ukHGid4HwQOjI5yBMN4wMbZMb1ZfMQ74
         pNcBOQsO3xsDscQVHSSkbp6uEWIIdImfCvV/7eGrnUvcSJGyUgLSO/owRCbhIVL0bmqy
         JeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221024; x=1779825824;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VLWt7FBiJ7doh/6+nwiexx2CA7eXIw7/akbrpx+Yug=;
        b=sjc1wm7kW4EOp2eprq/75U8A+SInMvhgMWfo3IVhoPmBl3/FAJ8SpKuJw8Qm+E1Bhf
         OY/54jNEzFtccphROhCTFWKWRHfCTL3snEotQx6uDdrumiW7SKAg9caWcrpnZpMzW2vY
         t8MkQ0ZgiQjMAaRfeCKTZw6ELrzqnAvpkTZPmYVCVKdSMXCHvJT17QvMkZTMJ+DAx8A8
         ahnfOQ73UHwIpDs6+G1vbUMQH3zgbpX15MLE0pDZNEMsG3i1VJgPi6WjmQ4Qx43t/UVi
         iIMwiR7JeREuSdfbBGVdVw5NElQ3EdqmHeD/0uVk4UxMIEPEQDhFSrafH5LXn+pQkOtb
         uNGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kfbHSDvA8Dve0va0qDxg8hHEPloFwwtFuahTMcZTQOMC/mFyEjWVvBogZ9tVtoXCDIFbxmikvjTxx@vger.kernel.org
X-Gm-Message-State: AOJu0YxyOO5JLzuzV/2gCnu7G4lF435/W1GGMc4pHLiDi/d5hHJTLSm2
	30iw0Y83Qr9Yws+1nyc8gQ+BRy5234Tm0M5jpDYE3Q+kKINt5bojxSUBLxVDdDUl/tdwcswSP+a
	XNLze2xAKSCd12FC4b1QYfXifhN67B2c35QLSf2TLDgXa0AGNM9w8yUFKF+J6NB/A
X-Gm-Gg: Acq92OEWgcKyyU9hIgOYvEafgoLW7id/zFzNhLEhOygeRtUGm/0ywEGgke1T8Qtw9C6
	la2t85gF59U/5OrtIKCWp5+2V9iXCUyma6f1C5AxTesKoZQe8Lu/FJBVyddXBpDNgzrZq75pH/C
	poPZCMVKIJ7VxwluXfIepHNUcH/piyVgrO0U2gNQdUl3lJ393sKQ1+/m0liirrXAN7DuPf+4yiq
	cmttfAZMa9aKPxaKFJt9SPUEH63xHajy4OObvHIC+xpw6MQdxP1ehB+/48fiPmNEPYE24uX4dnG
	/sjfrciKsYrsMS6HHualSILx5os+MZ8W1ehFDD6qFaBk1h5PO4emhta3BVHAphUF1yTLpMibGqd
	hBA8RwcfbhBMj5OZmyxUry1a3HtamHueITp3gx0lNONaF7gK0PUIkXNQ=
X-Received: by 2002:a05:6122:d1e:b0:575:27de:3eab with SMTP id 71dfb90a1353d-5760c057c54mr13517734e0c.9.1779221024337;
        Tue, 19 May 2026 13:03:44 -0700 (PDT)
X-Received: by 2002:a05:6122:d1e:b0:575:27de:3eab with SMTP id 71dfb90a1353d-5760c057c54mr13517695e0c.9.1779221023905;
        Tue, 19 May 2026 13:03:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe794e7sm112085175e9.30.2026.05.19.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:03:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: arm: qcom-soc: Improve validation of
 expected SoC naming
Date: Tue, 19 May 2026 22:03:17 +0200
Message-Id: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAXCDGoC/yXMQQ6CQAxA0auQrmnCIGjGqxAW0ClYEzo6BWNCu
 LujLt9f/B2Mk7DBtdgh8UtMoma4sgC6DTozSsiGuqrPVes8hhVH0SA6Gz4pLmiRUIclB2wmfwl
 MbeNOHvLhkXiS9+/e9X/bNt6Z1u8SjuMDzzkZfH8AAAA=
X-Change-ID: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cixxkTDqmFxVL3LZ6/FGzvqpRa/PZqhkUCskLiBduV0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDMIXe//6h+WtTfhNI2NNs8IhM+44ymWWdh2kM
 4ZqRIIz5J2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagzCFwAKCRDBN2bmhouD
 1xthEACTHh3du0Vle8GahBWqnpZKoIoktrvX3n4fnkQhh1SXn8pnPec336JMg7CroohEZq9hdaH
 B8zrbKKOa5et+gQxpk97gTUsUD7ru3RzRH3+PKCzdbiWFwmgh052qobZ/3DdrBYWOdxmhIUFRlv
 FmgCjtv6gbiOa6R48SEb3ttC5v78UD82IpBpB9KGwCmbyG+gch9iM9ZVg5nSVwmkaeHeMMqR53e
 HMGDhitekPMgjOJ2XmqO5hfrdUsb/S1brPEEoBK4g8SSuu3WLPSnyCvdAt0YALEAcalxig9ptbh
 GYcdeY4QjrhBMwSZsU3Eo1WhtSzXTq1/9/VDWxwmFZHCYbf5ukMq8yvrQ96yu+ehx0cUhYWMPF3
 qd7R+c542Sz7oMD9VoKiDEUSvie9zR8Byhr1P2fHWQlPj05QZKWsAiEhkpY1sapLKZu9JoFRzCZ
 G60if57aySIEiuxY2Gl8vmmriBs1ojnCxSgXDRkjZbwH8Zj2wO40Uf3RHkgQwTA+tbU02g9jaga
 aF64Z6gUipxxl34jjKJEsIQXpDhvH16bffgNEoqLWL351op5CYpKKcTk2DEMYmReeR0znL6p1fm
 GqC0noMMe1Ul0NmJBDD5JSfDQSZkeqlWOhslN1x6YDpSKzMMzEI+DrXeNW/PJExpS6oXa23VRzM
 FGw3OVGPlGeHPmw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0cc221 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pnvqO8KSa4PCI4MgiNQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Xkg0fkwlXyTHRvcpi8PrFdMpewjgmdyt
X-Proofpoint-ORIG-GUID: Xkg0fkwlXyTHRvcpi8PrFdMpewjgmdyt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIwMCBTYWx0ZWRfX5ZvePsYqPAds
 3y+47Q9q2+J+U8itIcx7qrG3halIpwtQtmS4HEAs18s+Ku0A9fYukflfCrWuSoMq53N1m8M1yQN
 S5mePiDZra7MKFsAIkRTzoCnMK6OSc4F84kAB/w8Q2jfi0Q9Lbz/HwPPov/ffo1+8vJC7kmabWF
 bP+rYPmGWWkiH0WbFRj6/TTD8pBlej/IS6E+zTc7HmUhCGYWF7UhXD/+RjxHulSV2lMSFTF0pZy
 4d5t+RL0VqtQjJTrI4IzXhVzCQp03sQYbcajxo1K1XJwsElZPKbf1DkN8UfiOdMo9RYHDuyoQ1J
 vvPQPxWnmCqMSsPNAkLHNHDu37ObYfbgtivsbFSdw6JbIHDN0b1KGGvxegPsm8QU9cd544aV+tT
 ST10SjQN9zcJypag5ECRRotk51u48xDpG/2Op/JcGE6BNHOKvRybjvP7H9n6KkelGydL+SgtzSm
 xmjutA/zNnJ4hQJpSng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190200

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Improve that because questions about expected compatibles
still appear, e.g. we have
Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml with:

- qcom,pcie-x1e80100 (expected old legacy style)
- qcom,glymur-pcie (change to new style, ok fine, let's switch to new
  style... but...)

I am afraid that a new SoC will revert that back to old style, e.g.:
qcom,pcie-whatever-new-soc

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: arm: qcoms-c: Include Eliza, Kaanapali and others in SoC names
      dt-bindings: arm: qcom-soc: Document more of existing legacy style compatibles
      dt-bindings: arm: qcom-soc: Validate nodes with fallbacks

 .../devicetree/bindings/arm/qcom-soc.yaml          | 173 ++++++++++++++++-----
 1 file changed, 137 insertions(+), 36 deletions(-)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

