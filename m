Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5429317169
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658038; cv=none; b=r4Jv8lzlh8C/h6IErIt2EqoNTxqMgvU0aT3cF4l+TI6FvkeQ1bpVQhD99A/B5fD0s42LGSFM5Vhe6eKQnnWUQfowrDiXrAAQa+KjHlZuxO9nqEsrXOyd3CDxSYQh5CtltIKEzRPkrzmUSuu/QFvU/ybEbj3ixL+FVn/3SjcXwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658038; c=relaxed/simple;
	bh=uAL1EfxrfVlX09u2nmbDjRo+dRHKDkxe67KZbFGbRYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JKS83scbjZLwwQg+nHef2LyPTR5LkbshEDMUxZ2oMdX1IOOFhHzZC///ZZQV+VtqvunSQlAirWGNi1ilkB3440/AKI7MPlo2AfRffCneQOP8aUzLgt8TbC4HI2okTCWpzonwwdUoDSf6Ikoo+9xvuJTAyXlZhI/OV16J1qycgPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtL67hD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7H98VNR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtL67hD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7H98VNR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLWM23313213
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eOp/PZqCyssUEd09JiGzfA
	ZGtk4sWljfcpnYQVhTT04=; b=AtL67hD2ai82DNSPP1jfZp5V92ZY1bAaOI4pg6
	Cp/NdFy1bo9MxexURSkBRo6FJvWR+ysPEiJmOzo2AdqdZvYupng3VUbeaAoDDrf/
	Wrkh3wsJy52EPib4bQ7G3XLCicvhXxr+qBjX678CcXFfM067g8SRbfycs5zpJlbV
	kkhRMcDuNUIeDdyUd6hKv8lDLvNZ8TKC3CbDcnCFfAYgIyI/Ri4OZUldx1iyzUjy
	5F7fpq/sdvxU+i5Xn5B/vir7m+Jg6TBhVEZ0t667YPoJSAQRywuygINl1fCFjuXr
	M9fnuSQzaWjhLLqq2NAIkxGISNOcdLavV4YNee/CJ8JQk2SQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvy4j0eer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:53:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f71437218so1579906b3a.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777658036; x=1778262836; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOp/PZqCyssUEd09JiGzfAZGtk4sWljfcpnYQVhTT04=;
        b=B7H98VNROEn0Cuxz8EoluaGfMSqUwY7nOV2eArjzCpqSkByMdb0/gab/tiWzRak65q
         2z8kNES5QszYz1FDpOM+3HPQMeQXv+ktrkV3EsB8/hvWdmVrxgMDug3ECyBs0Ow10wXE
         yBB0GKwObQTvYJrwLZNx2hBPz8aSJ7rfg4GHEfYsWGfHIbvhQ9iFV2ArY+oE576cdjBT
         5wOrw+3gmgUqZkNlAK0OUgL+n501JhGnTTPwKqcdXeXeMcwr4VTx1algiRnGKK3atGQL
         e2Ne5iu3F9NutptAVmRQxDEsMr9fDYdF9s+dXZT0fP99pk4bX0wtHZnvebEZEu7NsOfC
         +OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658036; x=1778262836;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOp/PZqCyssUEd09JiGzfAZGtk4sWljfcpnYQVhTT04=;
        b=OUJLV0lKHzr2vW4UHtMOXak9MGena/duXWRm5J79vRRosg/nhcdQ79e4//2XgUUBVG
         RPSZzmqo/1GimysiMXqgpty3btT7vj7u8a45RcOySVzokbOcTZQEBYiu3VgPRFFGWwn+
         rAjkEObb5CzIoWa9DQU5L3RXco/DP5A7HcXyk+/egeixM44nBhOr+8aWHXdGXDWQnjIc
         6TJPjRdDXZgK5YWH7kXX2jmcl63R9TE2U0WMHItaQrIGFrkE1AJAUWlmOPgbbzRXj9CR
         qMgTPYfnt1DfRxLytKxVT/Uahd3lPB3UNfd6zzJC7hmXVp/wtCxstqIDc5QSxSnM2tRL
         um/g==
X-Forwarded-Encrypted: i=1; AFNElJ+WRCKTJpZYYUKwXEdOzC/zFlPpYApemLwmW5MJsvLNz9dIPFPoO6Nmf0CS4T4DTokO40bykHWYtExh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0mU+UvEDKwNPBHQvtm0OfPxwvzg4P07cQoAbofyaXsi4WFiuX
	Tlh5lB4+ilfYBnKxABCiopEVqElW9QnYSqwak00siEquzLcHpMzfbvQO7QqgcsWUu23B9fjKPlj
	3BYs5rEljPzOWnjemjgwverMqRDztgUf4Go7dc+qc6vdG4zIaCvIGdYQW94DDSdMd
X-Gm-Gg: AeBDieu5xb/v8Nl1e6T73jSvMd0K1Cll3OPhDTEPZyLYyO3/FPYnJKT7QCmSvqZdxmM
	OLa/hdkQu6F6lfCcQz0WG/2dgIqqZ83/kNiDCU3Abt3Apnn7xkQnYk2u+bHq9WihkQJBXsMxjiw
	5JMg1FZl4FwRddy74maf3age9lCvwonXZMJc+BchNQgxp0okta7xoi8meUSJupHAUGyizwibF0v
	m4vcx/9qi0fCyRkB8HOfZZ+7x1BfEvV8d0E1SOolNi1YqC3NLz1TBMqko2wifzO0HeV7AM47ngi
	7UyS9xZxLF1mEVi6dMgO9SU9xihvEFQkd5HePIS3gmGI46ohj/1wOtNsUb/Xgv0HZFMDlLr6DHe
	6x3p1r1jHfXAkBbL2CyPcpXvadBPGOLvnkHPBMdM+ZJr2slA=
X-Received: by 2002:a05:6a00:1bc9:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-8352d20b293mr202821b3a.23.1777658035843;
        Fri, 01 May 2026 10:53:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bc9:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-8352d20b293mr202801b3a.23.1777658035378;
        Fri, 01 May 2026 10:53:55 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582e193sm3988272b3a.2.2026.05.01.10.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:53:55 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 01 May 2026 23:23:46 +0530
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKno9GkC/x3MMQqAMAxA0atIZgO1oIJXEYfaJjaIVRoQoXh3i
 +Mb/i+glIUUpqZApltUzlTRtQ346NJGKKEarLGD6U2HGmXPDtUfuEoKkjZ0I3PPbg2GLdTwysT
 y/NN5ed8PySOI2mQAAAA=
X-Change-ID: 20260501-shikra-scm-binding-a7ff5fabd0f2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777658031; l=1400;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=uAL1EfxrfVlX09u2nmbDjRo+dRHKDkxe67KZbFGbRYY=;
 b=6KORdQezQf4a/bcg/F0QkTIDPXeICvTHN21lgaIFRvWvdK8UDPTVyHvFYLj5KFIrVVAjVKK6v
 4M6jZyRFcZqDRW1bo5gQz/HshEJQegLl2slIWSdRmObfnnP4oVdXon7
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=a5MAM0SF c=1 sm=1 tr=0 ts=69f4e8b5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sLRx6kNOospvv7DVrAUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: dxf0e4rbpGaakCxvDrv36x8F13X6k3c3
X-Proofpoint-ORIG-GUID: dxf0e4rbpGaakCxvDrv36x8F13X6k3c3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE3NSBTYWx0ZWRfXz7LnOvL6oq0o
 mDhdMBMlQ+zusjg54Rl4W4OpMlgtegYPT/Mtc7eTsnHrWTbybEr02byjnm7jvBbLcpA9pfmswEx
 jy+zoPBoK92xNpDjsOhsps8fnpqjX+VwUnMXChhsd/0DuRYErE3ioACMx1n4m2LJUV5iIvCfqFT
 lF3oCzi9eXpfSRpPoE3q7c4viZmn7yA4j9pHj92hp6h/3oZ8ck7DktZSHX8QKpU1kHaI6WhnXP1
 PqJok5sQprjtoP+mMAEOEE+JoNRFNwwNY89WyEI2JQTgyx/5nSA2G29VOS98KBgRDB2woZe4hV1
 tKoBBvo1xmnpYVVhzj5fFJzczCRoVJEuptIgDlzz+zc8+/3UsLiY8X38wpaHhHoLeLHC2eFHSDQ
 Xmh5X14XxAJNC4cWQMSr7G7RYDKVTYTltXkkLvb+Mjs0l983B/dJzUr783AIqnGBqW7DO/fwp14
 bIzbVeWgrGwFOC1awbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010175

Document the SCM compatible for the Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 7918d31f58b4..bb1e0a0d1d3c 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -65,6 +65,7 @@ properties:
           - qcom,scm-sdx55
           - qcom,scm-sdx65
           - qcom,scm-sdx75
+          - qcom,scm-shikra
           - qcom,scm-sm6115
           - qcom,scm-sm6125
           - qcom,scm-sm6350
@@ -146,6 +147,7 @@ allOf:
               - qcom,scm-msm8974
               - qcom,scm-msm8976
               - qcom,scm-qcm2290
+              - qcom,scm-shikra
               - qcom,scm-sm6375
     then:
       required:
@@ -165,6 +167,7 @@ allOf:
               - qcom,scm-msm8660
               - qcom,scm-msm8960
               - qcom,scm-qcm2290
+              - qcom,scm-shikra
               - qcom,scm-sm6375
     then:
       properties:

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-scm-binding-a7ff5fabd0f2

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

