Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681A93101B6
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778558922; cv=none; b=ecQUzfWWC0mMPvF7yqxJWDqQOxznTag8SzRnHlQma54hhzEP7t2X5LRqpd6l6ceIGgTMGzSYxBTrye6Ub+zRdWvyRsuB5bvt+J5BUcw7CtZYRHhTJfltXbmnYaFthw2Zs8x/+Y0o0pwmC8FMGZl7/AQNG7FgWuW4fd6KnQw706M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778558922; c=relaxed/simple;
	bh=15Injmg8rK8ASVqp1eiycQ+rgVM/qUCUjHV9ZKRmK1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnYBIK5ObOeaP3iKIzWETG1Ab4psTdRZDNbgwL6Wm/ON1gP6kbu1HFUwQ6ECataWiFVwhrWjBUyn7UTVVlqZ/SdLVhYDf1X4dbSWUB9avTxmwkLK6/GQgA1z6TcbC5sE2omH5iEczaKhbKlLJ8/w9kT8o2fTU7qY8+O1AUkaqcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HloNPhUT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AM4hHL1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HloNPhUT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AM4hHL1m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6nLk2519114
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6gGgEnllp4zvZoYkPCyMOmUb+keOCb7VayvIxiJ+aM=; b=HloNPhUTK7PWr1y/
	WH7OOakh2tbuJkbI4BWePgq2axLROMe+W25sJLDUNBT1zYC7oCuoFHFLZ508hJbt
	niFJMCAdwZ10iANUBUzVyxbESEZ4lkvhdushTUaTXEo//MOx/bBRJqoapVE1wsyV
	2JszTufhgmHXatEVvJjpR/PmHdptOcRIPhXtXuDh1/noZCoiNYxObWD3QZuroHHx
	9tA4un2uufdDQdI9/2CzwY6IlHRwvXZ83xoocdS9UhIqV3BbmBAiALKlfWvqhN0q
	NmfuaSNpWY0Gwve7DkV04lQpQMzNcrmmWui/MhrFVB3jHRmIb/M9xwmMKzzaFgI/
	M1GQ7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1hd6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:08:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba838d3fa4so55375875ad.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778558918; x=1779163718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6gGgEnllp4zvZoYkPCyMOmUb+keOCb7VayvIxiJ+aM=;
        b=AM4hHL1mLNy13Evndd7piMk3kUsfE6kPENclVP+UxeU+9sHfYIHS5lpP9dvWx29EI2
         fJMvMc0D+ZiSjzLRKem8TjMaWcHLgZUJskr8ywzuwwoE06A0qUTgvJX1sJyZOqXtgCCh
         tC0UO2xPH8dzcL95aVIx2o9bd4YFq21hYNgtL8IS3sSaAU3jreiLbu/hWT08nqj+q0Ls
         rFxLukSLxi+hHWyQ9G3G2r+Mp1mqkvfi1pUi94iK7e65lUG8HBJ8ir8igLofRRi0cnBU
         6eJqcJ+4GFOsMegmOMN9C1OHJfUNj52fLJLvkWc0HTMyimiF/YTHskTaNHQU1ymLXcnk
         qKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778558918; x=1779163718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X6gGgEnllp4zvZoYkPCyMOmUb+keOCb7VayvIxiJ+aM=;
        b=pOLjWz37bMfBDzpEZUQp7wMCCHKRCrisLMz/sLKrmfTdkv8MuJUhp8JsLYPE1/AOkq
         gSZJwkYbpKOQQvITyDWRFrq92HHjKEu1SWt33KEMl4C5N8f7Y1KiOjKs9T3RLDuABhiq
         EcyvA7B/0wCAzqfL0TiVXtgg9gXuyWQCjxsNe/t+N8lHCo7we2pBfTeIWboDoK4HZPtQ
         slZ8qKAVAjyILpKxYhvVdZXCiIUyjoYnAuxK1Sj3ASUL4tfbZKriwj6vk025/t4SxcpX
         zZnhJSlHGkTJA/dJmMA3Vk593nEEbing5Wn+vl1oz0Hr1R5ghnRmUeAAvvtPYirzzIJZ
         n89A==
X-Forwarded-Encrypted: i=1; AFNElJ8XQtcweD26S+IxRHS48+PeE+VQj04r/bkMdz069ivNx7H3eMNBqBGuWgc4HhsQrnJQ6q+n4xSlLfmN@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgHl1pN4xOB+yBETe5On1QpQNaqGnB8ozYwy9C/sLCbDezjck
	tMAkoW2ECiJyug8AsN9yiyvvg18yJCmKfNpYRKebRKClJldIffuwE3Nu8gFTIRG+E3Co9xtmlIM
	wmjk9621fOLTOdg923kPz5urVrDC1sb0UAkP6o8yJQOceoIGisSLGRtRpARTvYfaa
X-Gm-Gg: Acq92OGHWEirzNMVuislK1KxMtf29yi/Inlnk3Lo3OMY+9eFVmkQOXoYDF/nfcWA4Yd
	sok00BmCTRdw4G9qIGFd5R0Dz/kEVO/g7pQXWerLwOIFHTcJVg6Cpv0JThn6phjpkaaQNvWeEel
	8x1+kMLFRnqGRtdy50cc3MG1409TRc0nOavoCqgQiojHI/Lx956XjmGQNutBeHB7BMpHE4yYl91
	WWD3ckuG6pu8WxHRztDfqBEqx4H9x7pf0O7WFUu/BFHfq5ywrvnqvOO+/CkVSzLhzhgKMAYvbXb
	J3aqunS8yxD99crqMxLZx/WEhPl7KTkHvOMkrtSX5hl9nKgcG6g3WSYhQhYCYp/9osZJ335n7hN
	Ix5wUtV7KLphd5zelA5YfOqTe0YNmSUAs7xad
X-Received: by 2002:a17:903:1c8:b0:2b4:65d8:6a20 with SMTP id d9443c01a7336-2ba78f50177mr287506465ad.2.1778558918389;
        Mon, 11 May 2026 21:08:38 -0700 (PDT)
X-Received: by 2002:a17:903:1c8:b0:2b4:65d8:6a20 with SMTP id d9443c01a7336-2ba78f50177mr287506055ad.2.1778558917826;
        Mon, 11 May 2026 21:08:37 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm122646725ad.28.2026.05.11.21.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:08:37 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 12 May 2026 09:38:04 +0530
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-shikra-dt-v1-1-716438330dd0@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778558905; l=1405;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=15Injmg8rK8ASVqp1eiycQ+rgVM/qUCUjHV9ZKRmK1w=;
 b=qsd+1ESlEP8UXvDEem+D9Z3wOKU5SlGZVippPIxIqbom5EjN/hps0owmuD6qyom/WZlyQsIrd
 rFDT+XPk5CtCmIIk3GlfKNMXLOIf4AwITOLAjL+jl3JRr8Ro0Q6zjxn
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: 4IMMJ2m-FnpEPgQeo4tV_fu4iSxmuVXa
X-Proofpoint-ORIG-GUID: 4IMMJ2m-FnpEPgQeo4tV_fu4iSxmuVXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzNSBTYWx0ZWRfX488MQZOu8fM+
 oY3wPblwmJRot3oxFULRGYbQP+5Nfg1AeAMQvmjdtiIBxt0Zl+yyu8zm6Sbvzwo87jqAMUzhWRh
 F5N8zvtTBlZvro40tuH6iUctZzdJXf5+nOvNoUZsv+rZY7wyQlEGC6eAKmTuuRoztT4EKKWZ2rF
 ZtWL3yLuEIA9FImYnxkxHeHyHW/khv/0RqEq2H+fc0+c0yiYIY2leWux7d/FUPnN57/fb8z8nEk
 +aWzWjozYuozoTiTxIe8+dmHt63NpMTC/CKUKnyYXzNJVt4GdrMvXNRYOUadZdAGIL3MhBGhJoa
 qVL3Wa+Bvl37yDlcfzGXp5UfdTTkBx12ADZsRw+MouDwARpeB5HKJTWAe/tOgJQHt4UlxWTcJPy
 X3rjvH7KqH6pPev4+EqxZpqw2IVtCP/AauxIvJVKFjB36KfwhgJKjCHXtNZdxIGslXzIk9wABCQ
 O7vGds1Hvi7WFKLmwRw==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02a7c7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=s3D7Wza4eiaRwqfIe7sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120035

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

One SoM variant is introduced:
  - CQM: retail variant with integrated modem (PM4125 PMIC)

Two EVK boards are supported:
  - shikra-cqm-evk: pairs with the CQM SoM
  - shikra-cqs-evk: pairs with the CQM SoM, with no modem support

Each EVK provides debug UART, USB, and other peripheral interfaces.

Add compatible strings for the CQM SoM variant and its two
corresponding EVK boards.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2741c07e9f41..f041d71d7957 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -963,6 +963,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - google,blueline

-- 
2.34.1

