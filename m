Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1C2390992
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262747; cv=none; b=pFb7bkoCiv21gCl3PqEmLjAMAHaTmoaq1XD+Wv1ZvmiOrogwQKLnTAqsdYrmqs9wuV9U4uJ6er6Lbn4XhwhnpZJwPukKx9Zpuw7lQpOzaL0Z+CK1khiX3E8R9m0TWHYkY/7zd4tYYMmLggMRqcyzOE/6IeDEv3vnLJ9KzgbMuv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262747; c=relaxed/simple;
	bh=Zih7KT7rbZ2mj/QKEzK4AmdUtW4xv24Z73EMhaqiD84=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FGuvWJdNYFRLpeZW/cF1tRXFqoE+Dfd15ch3zNQUKhcj/V3Nfqx9/vb/REqYCE2OB0AGJOJrLiDQjHlA8rdACT4pkj69NH+xrNtXviQl1nu/3pEKG/kHaE4o+EP3R/hgrgqhQ3cYhd/0po7LUvLvNK5vYCU0xLvdPqa+51nkrPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2K+aKlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtCnfcsk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2K+aKlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtCnfcsk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9YocH3685978
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x/OLnIO9fkpNLTzR0JWE3L
	icFcOOe/mOWBVjFBi4eWs=; b=M2K+aKlc7KYqW3BNTKA3SHjpBuzKBnpDeAlk31
	AnBnma52NUS54meX8sGAI1VXaztjUW8pSBTFJZWSj3H8Xmt0oKY1VKq7DnqVOmL6
	c1sYy53Z8rsZqB3v1vl/nDv24kE5cKjT1V7nKz1Wfz/UlQuDudBSCbe32LVXBms2
	R2v0K7zj+0uOdHWRK9UMdK4s0cPPwBak0cp4la2ksyWcyY2rHsUi4xXQcWkBIOEs
	sqHgdg99lPN50A9LWQtVfQ28EYvluvd85tneqJBoxT0rqbjNBg4Bcz83NBWNffL0
	pzmIrgUW4hCvGNQbfeaesSwjVQgG4cBiQ69ieaMBxrLVO+LQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5w0ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:45:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b069bfa817so178065ad.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262744; x=1774867544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/OLnIO9fkpNLTzR0JWE3LicFcOOe/mOWBVjFBi4eWs=;
        b=TtCnfcskN7yEjQ+26hcGsDyjOrA37wIXPeaBCoU0sxmjXpiLB0clXT6RoZqaRcct9Z
         jhG3NLJ+yc7Ar3dxiT10/BPOYP9BwmD2+AELak/ONzIiSo3wAXZuGKaj+xw8k6uvnRVp
         T0HJF+Cg4pDhxY4QGt5o60s1DXPTUCg0E0sYrBFnfv2omaIEc+MfV4glJZ4oF+7aBjCG
         C7O260yut+dYET6yGfnslY34d0rdoGOREeexzVQI7dzx/rJ0jAQ18Ofhn7qR2m/XTa6J
         aeT2Jn6m5juEmg2aXTe0aUMz5EWfFTDU/CtTXETLome7Ei1IEJXD1aiZLhzTebJF9MOA
         9IPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262744; x=1774867544;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/OLnIO9fkpNLTzR0JWE3LicFcOOe/mOWBVjFBi4eWs=;
        b=cjzwIJStsD6YLEwcSEzZ7hUl3Z5U8/7GUkPweFIY/tiJAOIYPCgqrMNuIChoZ66M1X
         Nc3E8E/EB4R6GmNhzOAbrkofZoJ3LGrFyRP8Fh4DN2XT7SPQ6xlro/fvH84JZhPnXB/z
         PAiSInjc7S8uTD6zaCNkTJTY3H7V3VmCXd96BMazT0xIkRL1TkwETJETHwJYt/upMhHy
         kAIYqsDlk7BH35r9rgV1WzfOYcYi0TjVyi6A0hcY/nnIXkn8AOlfymt3WU0zQ1+bc+BH
         R+65DGDDGSsrYR4StI7yupwKq0waQxgmz/qxqYAd3qStJ+DV/SxMBJLpe6sURlvXTvlG
         qLFg==
X-Forwarded-Encrypted: i=1; AJvYcCXfwRDSka1eBDi+RGqNaeWMljHm+tYCdVCW3GA6Lw1cl6qNZX2DvOcDTcU2tMXBRQofYJEE40vFtiTu@vger.kernel.org
X-Gm-Message-State: AOJu0YyjSt+WnJ7pSzmVMobyByrZZkLIOcuJDVkWjvbLIkhfu6zj5W0R
	l7uVI9pilZPLOfJm6HgzVOGTIimqAUwp9pEHOU1z+GlxxuMtZWWl9hwrrPyYbwXZtNgDNPRtOzJ
	5bsqteOJ80gYzbSVnsIuzfcHSpR/F8BWCrBJPGYXHpXT/BiMwFGytQw1Y1Y9kUu0=
X-Gm-Gg: ATEYQzx8ewpxd2z45vCVvWBxWCR8YzCATcEeGTGKoYOm0NYfKtXoojIMluu0N/WsIhC
	IP2t0DTG3aR5lDAgLltngjqom5Zd35eWw3jB7F/jbehkeARm/AqsJqb5DEPZyjl9Nno2pidn48s
	X4nVR2/FryWUQ8obDlFZ4U8Y+AzEOypoF0pnTZkRmXNIcyIn9iLxvKEBRMW3iaX86nZB/QJcDhZ
	YA7DkBTlg7VPWucHtgC+eIvUC87C5Hg2B0YY3vsac3YM9A7DHRRsKzupQQifzxx1r2raaoHLegd
	obpEG2mTtKD3ARqQond8MnjJffUTMmabRTjl+UyHzPqVjkFDJjUB/4x6o8Y91JOBEC9MsRbCtsL
	HYXUsBzZGE+PimsWUgLbzcCPPZ584NbyS+Q3RGrlSAWTOBaBLxyQ=
X-Received: by 2002:a17:902:e846:b0:2b0:624f:8edc with SMTP id d9443c01a7336-2b0826cb353mr111933155ad.12.1774262744470;
        Mon, 23 Mar 2026 03:45:44 -0700 (PDT)
X-Received: by 2002:a17:902:e846:b0:2b0:624f:8edc with SMTP id d9443c01a7336-2b0826cb353mr111932695ad.12.1774262743508;
        Mon, 23 Mar 2026 03:45:43 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08340c2edsm123454225ad.0.2026.03.23.03.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:45:43 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v4 0/2] monaco: Add PMM8654AU PON support
Date: Mon, 23 Mar 2026 16:15:14 +0530
Message-Id: <20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALoZwWkC/3XOQQ6CMBAF0KuQri0ppYB15T2MIW2nSKMUbLVKC
 He3EBcucDPJn+S/mQl57Yz26JBMyOlgvOltDGyXINUKe9HYQMyIEloSSkssGRYA9fByVz3WwkL
 ttDcWU0UY7KHImwJQbA9ON+a9yqdzzK3xj96N66GQLduvSfg2GCgmuOEsqpXkgufH3vv0/hQ31
 XddGgda3JD/WLT6+1/II1dmqpCSKgDBN7h5nj/JDL3FEQEAAA==
X-Change-ID: 20260226-b4-add_pwrkey_and_resin-2c04d8d53f5d
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774262738; l=1594;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=Zih7KT7rbZ2mj/QKEzK4AmdUtW4xv24Z73EMhaqiD84=;
 b=C8p6VeRhjNEFT9pE0+rsMliNwAVAR97yIyivcZtIM+jEhru5JMJRtOfUwrz+k9Nxb4ONW34eX
 93Z/tE2AcZfD8wcyVv+Z1kUxXNrb4hKR9E/I9VZXObutdJHrbKTDADr
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c119d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hkPachF6C7OTRM8muywA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX/NFg+jC2wqCQ
 IW6Mc1cLFJSxNhBmd8leZ8dRnJk2w3qmL5EyRSZmvDdg3QDywegx3gVFWyN8rxJHKZS5G5efONC
 lUGXp6X7h0JMArJVK6qjyEHfHODK9ZovEFm2FPpm+/3Xe3mxfMilCZfCeQijWbLzgdBUjeIT6Ts
 sNm6F/MzwRiUmglNqyEGBqHSf8q1XyjL7jcb/kBZhYBDADDenhv/23mdVimVkC6qJYG2700uPRQ
 uToWGlxiZfdlf5iRYLzpU6yoyT4XT/4rcDyO4Veej2HGwYRho4IbvaNOn8sqYlBiUokT7XPJhb4
 ammtvSdJHBd+cyVQ5hvQ3AAHadCwQtV39BtC7B8s8j+8DPQQJgDsT6g5Xgy1gSULMfIJdwhEmL0
 BMcounD1X0FQ7tdnlMJJcdvC31RRPphBTY97i61ZVOsvrlp0tnTP2Zqj0UlOQ8/0Er5ersacUW2
 7pgzkCYBRLtnxD7n5Qg==
X-Proofpoint-ORIG-GUID: Ww7CYA_QsIqP9Q_E4kRZlhgm8z_ISZgX
X-Proofpoint-GUID: Ww7CYA_QsIqP9Q_E4kRZlhgm8z_ISZgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230083

This patch series updates the PON power and reset dt-bindings and
device tree to add support for PON power and reset keys on the 
Monaco platform.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v4:
 - Remove the contain for PMK8350 and new if:then for PMM8654AU as suggested by Krzysztof Kozlowski
 - Link to v3: https://lore.kernel.org/r/20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com

Changes in v3:
 - Drop the dt-bindings of PMM8654AU qcom,pm8941-pwrkey as this
   patch was picked - https://lore.kernel.org/all/20260209-add_pwrkey_and_resin-v2-2-f944d87b9a93@oss.qualcomm.com
 - Update Commit message and disable the resin as suggested by Konrad Dybcio
 - Link to v2: https://lore.kernel.org/r/20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com 

Changes in v2:
 - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
 - Link to v1: https://lore.kernel.org/all/20260122-add_pwrkey_and_resin-v1-1-a9fe87537816@oss.qualcomm.com

---
Rakesh Kota (2):
      dt-bindings: power: reset: qcom-pon: Add new compatible PMM8654AU
      arm64: dts: qcom: monaco-pmics: Add PON power key and reset inputs

 .../devicetree/bindings/power/reset/qcom,pon.yaml  | 32 +++++++++++++++++-----
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi         | 20 ++++++++++++++
 2 files changed, 45 insertions(+), 7 deletions(-)
---
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260226-b4-add_pwrkey_and_resin-2c04d8d53f5d

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

