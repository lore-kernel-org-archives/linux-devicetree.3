Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFE744F571
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553847; cv=none; b=fOfgD9ocxQUrBSO0NWvwR47pkm/QDlaqq+s+y4oS3nS7Y/yyqw429AgWOUduJnmoDbnDk+LhCSchCdKzhj3b+ucVzAk9NG/DeMaRlTI0fv3wZkelPNNdiueXve6cWK7qnVQNGanS0kP7lCnhrZQJ6lHjQcYE0NWk3lwbfiW6k+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553847; c=relaxed/simple;
	bh=stBxVgdNOgQWunu8kaDx/txPbyMtClwM95nZL+C2jD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VbNg89o3AKGiko4ynV2wdZw2MB50V2gyMo43nTUyPP9w3mhSN4HRdSJm+GdVM0fKHdzeMwCvAg8sgkOvCbtxRxR/tB0qXojnpOwW4PLmm1VS+zg3dxv/INhQ8gRcGb+P86CCAzxIDQlvPsOb9zyK+pXru8iO2EH7yAU+NVj1T4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X91fTtJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZG0/JRzt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X91fTtJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZG0/JRzt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKfFr887332
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 13:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7rTJtxguyvS4KOXPA+y+we
	c2wHZ2XQZWGXcO09Ab0HI=; b=X91fTtJ/lv+mBrT4q93YwYkc2D9arYrDW9twvH
	k6LMNgNgSdstvuwgU4/ZoFhTDXXn1shQv/zF4Pjzhr5621M1KHYoDMrMGsV9Zw2m
	HgsjNLyL7LVNeqOvfHngPnl/Hg7OpKWxk5GUdJYTsWNi5+oKkkuqVZdceqR80+DJ
	iDLgU31qxIjEIJPHNmPOdp9dOGrVDyWXUp/00CJ3EbvfvAhoqqCjp6AzRFREEhWt
	Buh+mc94rE/GE0nte+J7BRQoHM08G/tZED+6ykCAa6LRU6kGxAzn9gh/m+N0oNle
	R99kSbDKQCRi1H64q6dyy1GeeDpo5l64ik1HMvOZLhD5bvTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu3s2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 13:50:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so95269225ad.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553844; x=1792158644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7rTJtxguyvS4KOXPA+y+wec2wHZ2XQZWGXcO09Ab0HI=;
        b=ZG0/JRztd0Lokjw71BBiXHRTxIjVbbWPUxpU1OElhJW7O9TCks79ZekmfT13Q/t9q5
         lZGY+7XustKasaPXD1bb4QICHKVoT4OCKivTM/CQFnFXMvXMG71P/xobj0Dv4rsI2RD4
         qqVb2MnYXI0kBJpKX5U14HC9FEdcNRQ2fqSuDaAt+OPxKTT9Bbpc2YZW6hNa/xx8XbG/
         cKOrOXXr2Ymo5JvLyXr4Q9cXC6Qbrg9TM9S3DHMSmGFWaBW4Po/9EHbWcbJIsN6YK4eT
         tANjWjf9O7M/foHJSi81co/g6aUlrDtiE/H1rgWn+PAFaDBvQNbL5YdWjPd4CI9/9y/t
         KebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553844; x=1792158644;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7rTJtxguyvS4KOXPA+y+wec2wHZ2XQZWGXcO09Ab0HI=;
        b=HvCaPJli631niC6b520WdtKb9YrcNDy59azIqEovI4uFzHiIHJH6W7aeemnMxek57G
         Ecnqtakm99Ak4nBP2CnNPlQk7kc3yW1ovr7fNkLLoFBMRiVyBjlY/aLxO2CjwcjKY1yU
         dCo2s+5EIi5bgbzNoXVUFZ5eVMxhA2QFfhJhmAvX9DS0LOkOoe0B/hpdV94JNxBMkEZM
         yuvPTfr3VHAmPQVa8LxPDlBXb9CocS15tAJhotnV4FTI5ho2qHVC6TJV8r5Ld/mHn/Jo
         P2I0WX3qgXYJPjg6uEXqyMQANUlHlHJF6JckRQKHG2Hnk63hXsqxfqGxcdwmOJVW50aW
         QIYg==
X-Forwarded-Encrypted: i=1; AKwUvBxFPzYyWsW2s8ryeWHJP8vTSmCGsRrFDiskomRES16D5Xc9j7DaZY5JyB+QAqJOR9EAx8UjI86rc2tF@vger.kernel.org
X-Gm-Message-State: AFq9FYKyybaP89C+4KrgDHeNaomvmJa+VMjZMS/bmT9CId8Gi65f2EF3
	c2bOwbIw0ZXkpo4lL/lMdV1luYzZok7L1gbOO7jI/WfzjRsPWg5TW+SLbVfeRQkKQB55LvpFMqA
	LjQ3fH2ysYKTeJrqk+eV1BgPZ/FjeJ8HT9cjPrM6VFjhT3br8WhUgEbdFBIQnAnCS
X-Gm-Gg: AYBFou1/P1Rc1QCAD1YC8pVdCoMTjfneVEndJbDMVTR143pVrmxjFwsuNuX+CgX+29I
	unLPsWTvoVneFwJKZOtXRbheTLv1VeUOtfT5HMiqulk/IaBUKkTyopODw/MNlU/sEJ1AKxjfOcu
	louSvjvRjbftYs5VMerCXDkVBoU/7P21sFdJ4ftt3bjYHGaAKJFCI8iSCpGLnOgMGmNhCe4+tTH
	XlIwe/fDSGBicvVw9S/cqN41GZkAKX+4xrcULKSVODXlNh/aTISA3W7s17TU3Sk2U+Ajz+h4R9f
	AoyZ5Muaevi4uGlbyeFdPJGrg/UnfqSTiDfMx/sup/WKXWWurqXAheDru9RKKmLI8PGsNMiPv31
	UKeCoMPhxOFY5r0ey9Pu8zLVO9YLoELu5xNNq9BzAYSO3chpZhR5KdPzjSto+Q8Rq1YGpYUhEFe
	Q91rDsE8mX3W1IVpjxexkOOlUaBynGnlIMOdw=
X-Received: by 2002:a17:903:2305:b0:2e4:949b:1ea1 with SMTP id d9443c01a7336-2e842cd4a63mr16545245ad.55.1791553844462;
        Fri, 09 Oct 2026 06:50:44 -0700 (PDT)
X-Received: by 2002:a17:903:2305:b0:2e4:949b:1ea1 with SMTP id d9443c01a7336-2e842cd4a63mr16544985ad.55.1791553843829;
        Fri, 09 Oct 2026 06:50:43 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422c9944sm9574135ad.64.2026.10.09.06.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:50:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add LLCC configuration for Qualcomm's IPQ9650
Date: Fri, 09 Oct 2026 19:20:30 +0530
Message-Id: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbxyGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNL3cyCQkszU4P4nJzkZF1LA+MUc1NzMyMLiyQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAK1M5dnAAAAA=
X-Change-ID: 20261009-ipq9650_llcc-903d7576288b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX98ujLTapNIJe
 s4FMeGSj435weD8yZXShHhwnCA01ykM9s0PjFRyEHYRzgTPXcRvguSeQd/4EtDutOsvyfJVdVT5
 fvlKTJYHt4bPDA/L+W1QRr8U0XabiuTmfuBUvWzeVDRyofUk0LZ1mCDE1aMw162tkTbscnqRunn
 HEjsemlwR14Mlia0mpLDZW7jnrk+3wLAIkezWFARrfwLq65fvVDUZX6OtFY2dXlOVCBQqbE0mC3
 MzoVwpMFv6G4Ndf/+f1dpDeeiSMfH0C0LSCa25OKtbZQF/TH0a3jCax4ty8CFXdXSZhsAoQO9dD
 nkZCmB2VUcvkbIG47zoNBuPaS2r3wl1YfZ5PwmYOtltGy9iZTN6ucIQc1blJNsQhZV8WCtTCkJ2
 rNVPecJ7UVduXOA0tRqBTIbVuk+cL2WWuxK00JrGLKyzZPeABaU91l9HjFZ9UqW8Nwvykr/1lfg
 Yl5O+HreA4k5eMrw7Yw==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8f135 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rfC8kGU1DnSi0xxC8ZoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: oZEnLPUTXoFzR7EWXct7O0-a_bpjrwlt
X-Proofpoint-ORIG-GUID: oZEnLPUTXoFzR7EWXct7O0-a_bpjrwlt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfXxyGq+Q4tkqcs
 RHRPGZy4nKdNfJoywVXUo3QBZnDZrs+vTqYKWKSXyXKZYTNikYL9A/Dx73gkYlzpfKE6ylz5rWC
 9Hh0+uKlmswsaWkVNYQsO5yJcyFZJZw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055

Add the system cache table for IPQ9650 and the IP version is v7.1 but
similar to IPQ5424, there is no broadcast region.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
      soc: qcom: llcc: Add LLCC configuration for IPQ9650

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  2 +
 drivers/soc/qcom/llcc-qcom.c                       | 76 ++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 |  1 +
 3 files changed, 79 insertions(+)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-ipq9650_llcc-903d7576288b

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

