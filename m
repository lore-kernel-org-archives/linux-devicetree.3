Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C4038239B
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069137; cv=none; b=HjxegB3MfXIJq2Y86bM7SMEdc6oknse/i3oIduchQtjGEFbYaGg98mRQOVI4g56/BjqPlvK3L9ZmwBeFKGGTDP7Nk4pRLwQX3WcM4t9tYvYBM57EMLv28EHDJB2QtQUh2azkzBrVN5su2Ji8V/+PFnB3IiP6kjd6ndADfdHcOOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069137; c=relaxed/simple;
	bh=Vmd/wjMijBMKJpmsPlYuyZime18KXTl17NF7s/TPJcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HFUKMFF+87vZnqmEMojwHEep6y9P9kIfAUa8OybIudWCPaJbqklEOLF1wHCuqeLviJ6bvJmd/BmUbBGuvFX5ib34OM+Nt3L9qgG6SIGRtyEVATe214Z+ZXivUDtXRPg67n6k+RauL+Z3ox1ZdXpU08e3+Qj/vsE1OerddhcIOR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA4gQy0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZ08bV2R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA4gQy0X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZ08bV2R"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636gv2I3144211
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ehzOtscBxZ2fpLb9ZKVZ4112nRGeFU3eHLB
	suqLoM2w=; b=kA4gQy0XFWql2PVcvViX62CFV+9QWaEnpfn/GF2MrmBz1eoB1To
	Zjs7TBjXKbl0k0+KgGoAP3JAjt9rzLCsEw0RxMmP4ZGwNstYo3O1FFTaaBD0frOB
	a1jiSEkbchChMI4Fj+GWDBuaUtPPNLybSX1exytL5/BgUyzDsoGYrW2YbCirxUlq
	KVZQkJ3KMl6Fx5h0E0M2nMsdCZNc/I/6w23OmfkGMLVNiFhrf4b36xg9wxVemqsF
	8JbPF7V0tWH+LAU/7wbztFmLyhOYEBgjSPhohCBLdZXnJ/DJEJAECrMdS+ab9fZD
	zMkc1b9zhkxg2ym54jrF9rhf2bQ/HfKBEVQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682brg89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:58:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847e32ef4caso676353b3a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783069134; x=1783673934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ehzOtscBxZ2fpLb9ZKVZ4112nRGeFU3eHLBsuqLoM2w=;
        b=OZ08bV2Rf7km9ZFL2FJgAiihqzCIgFwS5/rSKqWQ9KwLS0xXpgeZrBnwDLRp1T5w3T
         vAZpxaMJ0FPQ23iCbsUm+Dj6SD6n7NCLMcr5B5ftWeLIlYeDyfQxYfXAQmKG2FwrrCkW
         XDodxtwTzlabJd20vdK5YA1HVdCNSflI+aXhKycm3DgpDe9uwR39V8tMjxB8dRSUXvaF
         NuJknoaTTcpS01OIEQeheAH7hSevSYSL6tr52m8IW7XYc7kTk1KGk6W9RYQFCPqrcx2h
         v4LyLdO6nbkR3lapFbpmOSMR8/DyZSvkSuSGxFZ+T6VXqhD4ZiGIPYxoyZwNbSs5ptvx
         sWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783069134; x=1783673934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehzOtscBxZ2fpLb9ZKVZ4112nRGeFU3eHLBsuqLoM2w=;
        b=Tf93uUVG6ZQCBwi3vx4HY6G3Z8JHutDIxQXsXgWlRAOgcqi4dj6zOUnX2o7KO17SMj
         JyetVQX5LZwW17GgMn4gGYC8f6VZecEdO+v/862bMYK+uXFiB4eqUHPsokh4KJpzppe3
         LqHAlappnmoI/waLFBeCV+qG3s/wqYHwJ9nVpfpRfG6lDDaesB+gOnw6kFu2MVuDemwC
         2kY+3tWs2TmZ0P1KIE4DiBKXX5lWN8AH+PgxE/pp4CQLKzQ7IethOFM5OD4lYZLIBdWi
         3fR4TBiiP2z0/4eIqJfEphFMNEvbMO9vqPvYsueG/SaJPvM0Qe97Em+X2sauSj3PPZJc
         PIbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/E2MYxR5vz/tbWktGfS63p7kzKRDyQfgNe/nuSXzuNH6NXZWg1bJVopEwJWiO4a+ireBAKPXjYbd2a@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwJPhOAyYlAhPn01YlKwQm6ROr1WCoSRpKEW1vkNHb7PzcxS1
	mmCOBD+oH6NsoiA4CUyMMLVPPnyHNDQuLgR7Jw7aXp9wUAZk7CiGvmJCLiU5EJqJkY4xX3CfJSG
	9Gb9eJzoxu4CFA0rcl15tc6qxU1NlvlPedjzdOTRaGOvPUHg2lRqXqUppX3z1odKd
X-Gm-Gg: AfdE7cn8yY67fMFQY9Ph2YN1ihQtFPY7AKr0gDAyqTBImT3HES4yQD46/R3tBR6tXO7
	0UfdzeU8H2oBF66hu0EdJ2pljaIp6T6RxvuVqWpti4ifmW7rgWDlja2qM1N8TXJLe6MsQPpnBWy
	20f3SJzvx03WardXtQpSjBXt419PuQy+XMekmSJU15IHFSOn25bNpqsgoDkfVSZr8WTuzf+GPtA
	leLVFjQM1WmV1EysgBvxlvmA6gEduF6aNBRlGmkKQ2ii5QPgF+1WrORtP4zi1vf9VH8YL2bW8h7
	7pyBwhV+5OLWO2rSk1o2aLbFS8OB0hO9qLTil3tcNTzO5xzu5Uv2fSrqz8ZZXpup2hxyafe58t0
	6lQ7rutmyFW6r16erDp6qN0zwYuRlMmHj4HnX9L/uh5T7
X-Received: by 2002:a05:6a21:748b:b0:3bf:6c08:4ec1 with SMTP id adf61e73a8af0-3bfed5fdca7mr11861916637.54.1783069134368;
        Fri, 03 Jul 2026 01:58:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:748b:b0:3bf:6c08:4ec1 with SMTP id adf61e73a8af0-3bfed5fdca7mr11861887637.54.1783069133870;
        Fri, 03 Jul 2026 01:58:53 -0700 (PDT)
Received: from hu-sarata-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm29256187c88.9.2026.07.03.01.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:58:53 -0700 (PDT)
From: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Subject: [PATCH v4] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Date: Fri,  3 Jul 2026 14:28:09 +0530
Message-Id: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfXwjsoBaKmhudS
 mb7vAGghzOgBXBMDETLlUX8ANbo04ZeyJHWBb1L6zTawINkTEg69gk8ud5YPrT5ljfgNmvcc6Mw
 Dl39ocuzlafAYUr7gwanPoO6UyQMbCx0RbEB2EkD9gtI0TtsAIdBJ0c8LOpiASdMA2ca4w328FW
 NZi8hzdCpA2Nz7IgG1RTz8ItVjsGLrTvveox7sMmKx9yFFO64lJBeZ5Qt4GBDAjcMxt8PX25mna
 jdyfC23bXwpAOSiqcTVim+m5XZopKwEiy+fEMOJDaVNoJRs+A8zPwTEfkQKPJ0FDbokOaroeXIy
 RbXjXTkUUYyd4oOkYb3PSR23yhSXoc3eSwU+9yqw4Wv0Jq4NehJ7nEinD4/DNgXGZ4aEdiNFHtS
 u7u7vWh8KBIbEKc9Tsir4taLSF22hsVuRj958k38VlUj+n5HitZZkMt0p05tZ/Yt1mwDJlK3/cf
 lXK8Da2VnipUNQmQNPA==
X-Proofpoint-ORIG-GUID: IzOwLb3oOkue8J2awq92SMmXhQZOA_Ql
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a4779cf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NWDa85BbfrixOsoTofQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfX8y9gNSkgAP6S
 C9kuTcoMiz1FOHLpUiAaMCGNUafdzcuqvT7BPW5NEtpIBh/0ubhIXIQhAG2Oi3x3kc8e88KPo+f
 qOSDPJbskUVuv429SAoHCU2d9IoZSMI=
X-Proofpoint-GUID: IzOwLb3oOkue8J2awq92SMmXhQZOA_Ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030085

Add IPA nodes for Qualcomm qcm6490 board.

The qcom,gsi-loader and memory-region properties are provided by
kodiak.dtsi as part of the IPA property consolidation work, so only
the board-specific firmware-name and status properties need to be set.

Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/
Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
---
Changes in v4:
- Removed empty line between Link and Signed-off-by tags.
- Added empty line before the status property in the IPA node.
- Sent as a new thread instead of replying to the previous revision.
Changes in v3:
- Rebased on top of IPA property consolidation series.
- Dropped qcom,gsi-loader and memory-region properties as they are now
  provided by kodiak.dtsi.
- Added Link tag to the dependent IPA loader series.
Changes in v2:
- Modified firmware file extension from .mdt to .mbn

v3: https://lore.kernel.org/all/20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com/
v2: https://lore.kernel.org/all/20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com/
v1: https://lore.kernel.org/all/20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com/

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..7242695aed97 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,12 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ipa {
+	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
+
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };
