Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08422402450
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047492; cv=none; b=lZmKclrp3qslMLtarSCBlSp9Gx0H273NDk0TGqteSQCCIcd/yXr3/NS8oER8oRoCzfsTjEX9xe57T6amx02cw8UBaMBF4/fel8XW8903mfLUzmeqRBAguNjKSipVdCUjgguB5vi1Nu3fuunGNDwGU6trExwoJuDD45CY2PnHqc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047492; c=relaxed/simple;
	bh=PplLofoYYsOeTtzwZzQTOtldU9PgupckQ8Lu+UN/3AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZoZmDGopXYLvoVVKxE3qZEWZhJ7zGB3hT9jwNXcAUj7C1V4sm9JHkY3pnQjclI+e63yvKsVUIHaN6SOLcEiIZC7VqnI8pBCqFEbqpmcUOkov9PilvLj+Fu10weD6EjlLwIHr8oEkOq26U45GMUD/UOf38trwD4wV6SmdI/tMYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNAVBXLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmTy5wJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNAVBXLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmTy5wJV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C3AVZ3104026
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T/q0fvuVukjPQtBCoPPqM8cPQUhT5omziWM
	9+pyh7R4=; b=PNAVBXLwqcS/lnb2Xh18rDThwqhXYpAAK7bmL/154e9p3TazRJf
	Hactla2CTJZV7cUoD+HmXVC4xvY19rJJkVw1wBNleak6TrtNePKU5M1v3CHC4/aW
	vE5IWbAlChqbYlj6jUeKUCcvMZ8XwC8woUeHmX3kbm4FVqH7eCDw9no6HasyxHL2
	GOXjqboxEeqAaz7Rbu1vuhyISPhdYc7OJ9RnuxzB/1snmtv8P6135TvauHtVFtGG
	3v87FzB49VA2YZv5RKzsQd31lp6VxbX/sxZhbVpJiTs09V5SLCwYMSSpo0ndBbAp
	zbKOVHKVqcUygZGRJaTuFonrWfALJ6RsVCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js24dx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:44:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354bc535546so7087438a91.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047490; x=1775652290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T/q0fvuVukjPQtBCoPPqM8cPQUhT5omziWM9+pyh7R4=;
        b=WmTy5wJVZ7dRkJMrrZaCtrdEP4cDUlpDbQwr4n8NDT3rpwgYJuB8d1/8uaBQHhl+l5
         PMy2cX4JdShOoNSs41+NcJcFfCgRjXWkXDipyTOA4zn4yCwcv+7IyAkISLiPSTUho9Mc
         +r+kC4gI9lImwMBCJ4i/GEp4BbmOAKc6z8y+SR/U4I7K+kK5smnnsEGPqaedK81nJmjY
         ioCRwEdQFX/X8fJmoItwI5B+YW/JIN/L4FvZDPLVllOOcRGfNlt53FbnqRHAzMQp5r5T
         NepMDW/+PTzw/WkmZtnRDoXojJgntgiHCW3cOXLt8ih8veQKk6rYU1mNve3bg3LljqvZ
         8KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047490; x=1775652290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/q0fvuVukjPQtBCoPPqM8cPQUhT5omziWM9+pyh7R4=;
        b=RoC1VaNaDU9GvErT3gluHUPt3Mm8JuP/P9umFD1sWHg5BF5AGSaOZ4635vs4+XAVu7
         c6BStxvzvz0AQiJDX0jRb8JoW7bv1UFDUydsK5ERKbQotf+E2DgkOVFQsEBE57O+TfCk
         uvA7WAXGpg+O7sG3cqEAspniP8SipiOhHoVQv9bFvNyKeP0M74HS4U3R2JC0Lr9F7F/5
         uz2OnAtqvNi6wdlqbyKWrVQq5E6soFNrUqHZUNwxjOTYfpjvJSpxqyFSb1ladd9VUODb
         PkBfLlTIhgZKKeOgG4PhrAPt+3m52OpjMBjeHOlJxq+XOKQiUqMEqfuEfAAKopKzpuJQ
         9Q3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXH9zSiM+0qJyDTpHJw/dIq1kZQihym7uBQnxZsdCR24WvFJEyqRqxcY1Hz0OwuRXxv4HL1z4nHhJAn@vger.kernel.org
X-Gm-Message-State: AOJu0YxuRCbkOgfyZ2Oph4cLuxC/qy+CvGVslkS1pcF9n9Vmv1PRdr3k
	ASt/7ETKv/xgtTrnwdxoCQtrsd0YvWvBDuWPIlbfiKjzBnPP5p63gMEgLcyecKdpdr/oxxNjm4z
	Fko48o0mRdD4ImAeTjzakRj9R30QkQNiRzWBFCQAwlSKhP314GXuglVl966bcO2Of
X-Gm-Gg: ATEYQzxNQ+7sbPjJr7cxXwE+2/x7WpDwDDFzmbHylWlwSE2aQxMqd16Ml/6Vh3Mah00
	sxOjgpBjaGjPhKLUAndNFcl4O0z7CNowR1yzkeS5ySmktYdhONVcniU4NSDl3ILtUNjonx+RZUK
	XTlvAJnMXIfj2GzKoT9Cp+5vdphO79/6dIW9Xq0GY/cNn10+YPCI1WA4vplppe3or3K04x/qihE
	tIipd/HWL9Ej9pzBwbF0hxNmcEVEsQMnSSaKZklFOSAo8vdzipT+IIlQdU5hnq4SZQAXBYhCF5A
	O9Y0+Z+VIczA2Hz7xrCfVKJ3pre31vboNyCAuGg/M4QEbUOsd4bjldxBu1tO6/Jd4Jx1YzK/gzv
	aegvf4N5naz6CmjHiZ9a6dYKwPo/TJBrdlaHFNgUaK+ZNf3s7
X-Received: by 2002:a17:90b:3f8b:b0:35d:a2d3:5c2f with SMTP id 98e67ed59e1d1-35dc701f81amr2917696a91.24.1775047489558;
        Wed, 01 Apr 2026 05:44:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8b:b0:35d:a2d3:5c2f with SMTP id 98e67ed59e1d1-35dc701f81amr2917669a91.24.1775047489003;
        Wed, 01 Apr 2026 05:44:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe668b24sm4982180a91.8.2026.04.01.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:44:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Hawi watchdog compatible
Date: Wed,  1 Apr 2026 18:14:42 +0530
Message-ID: <20260401124442.591803-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uW8pFQSOm8LvR0wn99H3h1ppDyzvYKro
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cd1342 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2XUB28OwWTyWtXMZ7lUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNSBTYWx0ZWRfXwnXqCdHQADrm
 DcKzO7VWSKYgrykG73g8ZAMGTQQL79bqYKo4gMfLiVk67tKZqmn7jNmK/v3yO/M37BKzsavD5Ju
 yQVqS2cdtb/2rKsvC+O8H7RhBo9mKiQ8HB7P82o4tGSgXgJ5KotGktlGOJCiOV1d8Q5eiWdPqu5
 7DsTVE2jTFrxPoiRV8ad5iv/7WLoi35AXbT6eJhQL3TG23uGAuuOlONq1I23ZXfuitqZutOxq9a
 haOR1axwyS7yWsytkqcQNIJ7ga/6rbcGAIjckQJm5gkHOh3cj5NNPJ3JqJlBNaya9r+yGxKx/xP
 lbeyJecaL0ukB1Z7zt6W1i0n37iXJy7XYe/MkPH35GjNEvXMq5Jk/AM5zpHxJGg29kv2fU/uGOy
 KRXIoeLvDOPBtuDBbqJScVY8cTpPPtuAcUEmY4zk3K8YisnCHodgoXNKNcLVFW2Nn+GU5D71hEc
 AA/PUhG+EXFVirLoeyQ==
X-Proofpoint-GUID: uW8pFQSOm8LvR0wn99H3h1ppDyzvYKro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010115

Add devicetree binding for watchdog present on Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..a8b914d4c06b 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - qcom,apss-wdt-glymur
+              - qcom,apss-wdt-hawi
               - qcom,kpss-wdt-ipq4019
               - qcom,apss-wdt-ipq5018
               - qcom,apss-wdt-ipq5332
-- 
2.53.0

