Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C68383316
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 19:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711668; cv=none; b=X5nQO3PyvMrm3c4kw7Zsko1ibLOKj7kXOQ8/0Vsd36oeiastUcgpyiRLKpFCaI0D2PigkvPAre0swiCu4GBObnnUQPjT2JYRy3CQTpx9PgVAjStzZMC8UeswJdgDN9/8ZGLwYzf3FpGJVPphaM2C+aABRRkuBeHYFpx0+VSC5VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711668; c=relaxed/simple;
	bh=35hLHc2b/IQ8hICngb2fk5Ut8HJYVBZcjh5HU6E5GD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEVYgpNTkRBdx35G2UstXpoiJiyzUUygsgDt4AXPftgMC9DV5bVuIjLW+WjV0wEUk8DtOFzpbpJ44aqF6KCjTDG/3He7GeoZq8h9yolMFWo6gD34k54MgY6fyNjeN3etL9h3oqjucH2uQ7XkrlDPN0MIRB8KNNl7YgY5Hy2DUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbzvZFUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUk8L1qx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dbzvZFUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUk8L1qx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AIXKDf1650168
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 19:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=p3MbDHiDYlrOTzVBICqzsrmh6cPzGyKK6S1
	kNRIY/CA=; b=dbzvZFUrSyMfS39s70Li9NfQtd6RN3iB96qfN/5SGJEgmKknCwd
	s5YGJhTZM9K+MgquB4lHwdlCI2QF1BWApyR4ly6jG5XuUAVV60hyorcJKk37jIZR
	AKBMHMNqntb3nRfiA2nibkOhNNMUX4L2OU1+467oDh29vSiyQkiMIDqZSqIWyP0D
	tYZUFNSl5iFidL+Iuk/29PIW9cH9pkDvZFGgdP1BxC9YOz4WYm0s81JOD0twB5RX
	rEk2SIcrzobLHg0Yb7+CBkAawY1dBlUQWEnx/DZe+SuSb3I4qQC9HlzWNC8Cm5CI
	LmWu3M+HhVO0m84RVVbWJi3DQh3OLTHaTaA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb649r68q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 19:27:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1487686a91.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783711665; x=1784316465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3MbDHiDYlrOTzVBICqzsrmh6cPzGyKK6S1kNRIY/CA=;
        b=JUk8L1qxpusamFInjIqS3mnS3wCORAI8akIavU1/5MbGwBUNNRKqBZKZTaqXSdLJxE
         G2yyYyOX0fF1mM8ARI6pteo6I+hzA4DVGfMOmODFk6CZcoqckMc0j0ajVigdXN2D3gEM
         XaKXKfxx8fs4uAvWc9NnAurPeSss2L5HfYlxQXfQZD9gZCDIJ0/dAXMP7OCOHR8ScMJs
         1Y1DZ/8R3i9GFAmhjzvFkqSnkT+fV4NxF98o1/PVfD1R0YQGO4qB7iS0B0b961dzYdgT
         SLyW6H0fFXdShlZMBjXfxk4DQ68tPlvhz5oh7y3szXsdeNSaX1+M8p4qRwC0M5Buyazy
         A/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783711665; x=1784316465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3MbDHiDYlrOTzVBICqzsrmh6cPzGyKK6S1kNRIY/CA=;
        b=tZoPTSAaIfVv7y9KxY3OPJ1Vph2w09nYZK7Q4i2DON88CIJ9gCe+ri+woxmppBjgVc
         2N3ePLN3yzUWmlpmn/MdvMEFMQyNTQMELZBvj+r6fhSFldspJ20fZfjtV8BAN4DH2JSr
         7F+z1w+kxThOQfaX9qzusJu6MVrFJG/82N0l3OrD7EjQnkVijHZ8UbcEj8WpJYeSxDVI
         P1DMmNvhVWFELrMDuoDjmIy50/HiHDzRgOQHWjQICxCDqTdh4y074ijC7zaHiBNK0R8X
         qO1QaQyVsZMbYl2OoI8NcCjRyK+uG9Vcj29JjA8lgNDkxvAOiP5HumqgTfQbFSJ2FaFX
         y2tw==
X-Forwarded-Encrypted: i=1; AHgh+RrMviEo6iYDFfgyeQv5VcEydF/sgDslxwXdGMN4Bv+EFXnpEsBq+bmPl9vlAHJTUpCLUvFB8ZBaRs69@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo00EubJBRpD2Ta8L7A6hmdI6VHXOirrg+TrM9pEXwwuPy1WmP
	TkeHZuHtAvGljASnWMdDF86Y6Vg1AOb+L9B4JdUCwxozMIDONV7qbintegnQAcqIGR2YTfGvqYy
	NSyDL25SvHPiupokP+2FNT7u8pKR2vP1awGq1XfSJG/bGDB30VCQV6ScqA6d5epPt
X-Gm-Gg: AfdE7ckn0zPfk3uVvbASkc0/lpKoe9sHaGgyBX8Tr2kDpeChmHFVolAqzcIxrfxcH8l
	5gzv6ryn8644hqfU2KaRArSmpF4EXn35qDd9HoJGUOxexiGcA64i0ypty23e1Yhce1frceecMoL
	QIOAGsY+PX7/8aZC0O8rJW2ZTVbedB0y6RdHY7o93vfi/gN6oiCibgiprS9R9jDgD7EAIOSUiYc
	7m3nu3BqB2mA9fsRGG27YHJ4UtzPXZpSFezAHXNJVrRs8Ok0w00VEdgXHxjw6zfcqcg3Msd7ruR
	mMe3MCnwbPJcFqw1iwbVqcPj7rYA4sJ9s3FsiHGNTsds+musHMRVAAbUmzLr/O74Xcv5MWATeXu
	oUwuKrmKL2ZaFL9dWPotO2AYuKJc3SiixqP/G0Q==
X-Received: by 2002:a17:90b:5585:b0:37f:ad5c:d18 with SMTP id 98e67ed59e1d1-38dc75ed90dmr278455a91.11.1783711665114;
        Fri, 10 Jul 2026 12:27:45 -0700 (PDT)
X-Received: by 2002:a17:90b:5585:b0:37f:ad5c:d18 with SMTP id 98e67ed59e1d1-38dc75ed90dmr278424a91.11.1783711664432;
        Fri, 10 Jul 2026 12:27:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm45817907eec.27.2026.07.10.12.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:27:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Hawi and Maili SoCs
Date: Sat, 11 Jul 2026 00:57:37 +0530
Message-ID: <20260710192737.1689453-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RRT30L0jwVAi1tvnu7Oep6LFo589-pvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE5NSBTYWx0ZWRfX0PvBGeazYtsP
 /pr6qWvdmeak7M8Fs3pTZj954A3t28Su15nmYsf/U7ooqL5U+Ler5cpzpE06fxpy1RrYgVl2zqX
 DSTsUQ2/Pjc367HgbnRsSp5VXa7RkSOCmRQMJN2ekr5wFxITvQf8XQZPSHO1rjiTCxrwcmjTVB4
 i1TCr12tgx8fod/uaWuqNLhGKfI3eeAZPnSYzjDYuNc5zFKGUFDLyS3WKBdUZjrb8Y2DgwfXwzo
 /P3zxGht+v+ViMY+ItxsNqR+W2G2UTrPqtNponQoChN+clXeXP5GE/0szqbvsqeB9QVQjDdpwYL
 jqVBh/ZF9GJYrD5T1fuUVidwdQh05gVd+0pgfOF4gpnnoMPRE/6dXIrYkpogK7GWUW51uDOOwwd
 ziTCLZ3D9beNPOYxfkXLXSLVuotFFt1ypyn4yvvp3HGMJF3ZSMqfLm25l9/jTODfHOurl4zXXDK
 QKmmHBsgE97d0TV5myQ==
X-Proofpoint-GUID: RRT30L0jwVAi1tvnu7Oep6LFo589-pvD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE5NSBTYWx0ZWRfX5qNNgegHv1NZ
 FIHMBt0T42FUkL39j8hOjAfgtJECsG19pGg0lZl+f8XvOqjFXrKNkC44XRvJGOWjyT7kGgRUIj4
 io5GZlvSn00tu5ZUD0Ru81FS4ZN4XAA=
X-Authority-Analysis: v=2.4 cv=VZfH+lp9 c=1 sm=1 tr=0 ts=6a5147b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=w03f12j0Wgemb4Z29XEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100195

Document Top Control and Status Register (TCSR) controller for
Qualcomm Hawi and Maili SoCs.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 7dd2fe035e6d..297e91a54a1f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,hawi-tcsr
+          - qcom,maili-tcsr
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
           - qcom,nord-tcsr
-- 
2.53.0

