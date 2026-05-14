Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133293A71A2
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731118; cv=none; b=aK7NcLXfoApwBLeGIhikmkMJbSL6kF9rT1RNrHJOOBej6xx0I4Cxb/7oiBhYkIeNinyd7R1axRLbqbwvI3f2Qd55he2EOjGxXx+ooaWUrTmiMB9qOHq0FFYfoatcsMFZe/+dlI3GP4nztUwoCIJdams0rVOXl3xktlA5+k0Suj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731118; c=relaxed/simple;
	bh=6O/bG6e3vMsFCbLsi/7u2c8deVs4V79kNnaTmQ94xEQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gtW58QbhCdgLHVbz7OqWB9VS5YWybpGeOZYMhoF+dLUS/9wRmTmpu4Hq6skpSQR9TrDFnW07zAc2kz66JDoBYXbqFPHnGSyxguAc+vvYqUjkqTPgs4Dk0vCE+I7IHscnJRJ3KKR/HvFb4J5rjSQmh3AmTVdgNexNSvN/UTg4TyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCMZ1dGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CddsYfiR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCMZ1dGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CddsYfiR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E1qhq41762707
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TSbDzdAE8ptqW0SfenM4rB
	SaW0jC2PEUuRNQdXSt2gQ=; b=jCMZ1dGYwnJhzqEltTALw1P+Bz2QEP8y7doYYE
	aUVBOmmEgvhf43BpXH4nyTYTGOQngvBn4hsh1ctXqPk1oZK5eccFGPa0FTxiCIOy
	ytaY42FQiPJmsnAUWIKG/uDLaY/aotprxRywE5fQ+/P+4VzOYs1/6ITVxNxb4dol
	QXaMazMe3LplhQ6f2QdqndqNjULt6vBRddiv6mjFY3TXwlwsIYV5jC2wZtndrWQr
	f8+9Ebe7LC1L0axhlPEo96MY2GRlbiNgNGHeqWIlyGUZtXA/+4ctYlXvwUCH00j3
	c9947sg+mxFNVh+qftgeOErWLPtrhhtBqKwLATVPyfJqp6vA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554a8awg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:58:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba718173d1so130334395ad.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731115; x=1779335915; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TSbDzdAE8ptqW0SfenM4rBSaW0jC2PEUuRNQdXSt2gQ=;
        b=CddsYfiRvHrTKbREmOlzp9OK5DOGcd5wLCUEGqn5jQy7JRcnCVeK/TySsqV7QpRer/
         QURClSk5sQumnVwXAMuyBfXuKMx7DhuvzKOgoJWSvMjiWZij3wTfKUwqOZk2lqJ3RQ9L
         VyECwWgf8reQ1rq6BBqasQ/MY7ZqhWTSfH1NS1rUpGaFZoOZiU7a1yC+jHxN20aK5fR0
         qW8lMJL/Rwh+0x6XLeVr1N86qG3BfXoxnmSCqJDFAez6Y7OOXJI2hoKvcrbn6tlutEZy
         NXroJcU44pML3SZcR/Nrt8zqOxw4ZXhHoRya1FqYP+K9saz8bwfOMlsKJQHCe06zP5xn
         ZiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731115; x=1779335915;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSbDzdAE8ptqW0SfenM4rBSaW0jC2PEUuRNQdXSt2gQ=;
        b=XQxHlREJO3kL2B2ffG13e8vWbByx61t+CH3ou5lqaSLGH7KN+J21iS2cMsanlCjhFl
         UMaAY+QcS6LAkAb46p7+RX4OrDNFJSX3Thwuxp9KHeqGgAEil2yJBWV+KJeklz1DvpYK
         7Y5q5ttLiajuyKizScgPxxyHQ4XvFQjGqQep3eO57BPFJsrOCrVklTtCd0X8bIvSlb59
         Uen3pPYmeBPJHu5/qK+2DnOmp7fJVZzAJ1rL8159eMNJCoPRhUzdD37DnbL04lk20Wcd
         Qtm0AgXnhxcSUTV7eE6R5RYZccaHeGU5WgwOyCWw4UVObrJtNcShbW8H1EZonD5ikyBU
         Edrg==
X-Forwarded-Encrypted: i=1; AFNElJ/cBladu5zkLCIEcoH6EUN8CKT4nMZOrH8e4nPT9DebJmcl56dtp8MFnBDSgDjOlOoq6dSP60ul/Y6N@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ64TqDJEnPNvpPOnnT5bvd+C8iOWEFgB5VEDZ6v6p1i7H9Gos
	/yWvwBV5MFx4m/OAlnKRTSPNmCGUEDfXdVlY1PfAzpyxPlrFm0jbBsbF+mwKK3R9f+UVP7WOhGt
	0pIfWHPbWzIyDAV8RFAJWOzhuH3WbJhbUkPCmJwB7Jz33pWDxUGDNrnus5RNs5khC
X-Gm-Gg: Acq92OGK3Jy9vPqDMq028pz8nJYcOg8iR0pzbK/F+rbmIM3lEGVpR4efjuV+jWu3R5Z
	nOFqwXWM6whY/wVoyz9pqX6+iJmwwRIJOyjL3THCfiZ/PfqRXxcR6KixHd0S9M7/+yswUpKFUZg
	DzfQSEGISS5ObBq3H4NEQZHWoCnXIZuKR4v1qKowKMYxNuI+pFZU/j+/IoH8Z7llIzB9N6Yzx6o
	P7Lw53BpzDSIY1LaDcZsqE7g9630ghFZfXKOQ0Q+tr2v/J63pI2jzP4nU3NId4yv2ZxuNT3ksVL
	30VbOkzVO8gOAjY0INLM7K5FoW0WsXJhuJkVtw4G3FHV2y+AB/CMcTvo7GWYnMynOLqDaovrt9b
	RPqVhRHfGFAADF0JJQqyDx7kFZkftPh62JgN7J1Rah7V9nElYAOhLE75ZsmFwAw0piyVi1U3ha9
	ADDu6HRxzBWG7Ie/YLuxCXvMFDTPNreV1/wXBFQlZsgbxbqi28vMg=
X-Received: by 2002:a17:903:1b4e:b0:2bd:417:8ad with SMTP id d9443c01a7336-2bd30210d8amr59213585ad.20.1778731115626;
        Wed, 13 May 2026 20:58:35 -0700 (PDT)
X-Received: by 2002:a17:903:1b4e:b0:2bd:417:8ad with SMTP id d9443c01a7336-2bd30210d8amr59213175ad.20.1778731115124;
        Wed, 13 May 2026 20:58:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe44sm8313965ad.11.2026.05.13.20.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:58:34 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable the QMP PCIe PHY present in Qualcomm ipq5210
 SoC
Date: Thu, 14 May 2026 09:28:27 +0530
Message-Id: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNIBWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3YLkTN2CjEpdY4vUZMskw2TTREsDJaDqgqLUtMwKsEnRsbW1AGM
 MCntZAAAA
X-Change-ID: 20260514-pci-phy-38ec9b1c5a90
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: qG47HZvYWECfKMvZvxrV29TAC0zZ3CCe
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05486c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WjzJGeGmWMr_TuVvyBQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: qG47HZvYWECfKMvZvxrV29TAC0zZ3CCe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNiBTYWx0ZWRfXxZx2b77WZ9oG
 754QWpZR1Z9A2z25ev3J03hkQlsEAcwqjzhzyoLv3tfag7P1XvlP7ctqjdFLOriZJ87Qn1NYMQm
 TlSsmeM8L3gDRn2nf5bNtHixT0VDInaZ5vnVfX1aU7ZrGkteQPoNdWuQX2yDUvHpryT8aBYdMgj
 eer3JXpq5I5bp9mWID/wJjTZNKaw8EdYIEfCGDaoLY+effe7V9ZNfDXPqFIaXAI13OVB7CdFMUV
 h9RnEAFbqN6bgDmLYmrQ7mzoW+abv9Q/KAVdf7si2MEh881NGKedIK72oJJh8dlXbqiYHzwE3tS
 cUp+f1uwQ4D/RCWg6PeRvevnE6YaID7zZGrNiRg2nZn0QzHfsPrrCMpgbPMZNz9+9i3k37Y3XJV
 B9lKh+TjwrFXy93fOoGdyJa4x7Q9iMIryfWJsCW78CWFCqB5uZFF08uYFyePbNsOGOhM+fQGuLr
 fjsKBPy/pCLx3wgPiBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140036

Document the bindings and update the driver to support
the PCIe phy present in Qualcomm ipq5210 SoC.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY
      phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 152 +++++++++++++++++++++
 2 files changed, 155 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-pci-phy-38ec9b1c5a90

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

