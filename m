Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846143D1ABD
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081909; cv=none; b=p1yJj2WcwQYsS/zbF6nxVOcE5pXMPOeUUxefnjuYpYSlouApQhkhJZAaA7sgZawDFE2w34rXbMJ0vFnXg2smgMFtG4K12X06XYtvSUR2dS3+ZpUOgvbupsmXV+zMeHuIosbSsMArELZ0QMhWe0aGhSY1Zp0iXoWlx6JrwakQXng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081909; c=relaxed/simple;
	bh=LbAzKcdJBSlOlhXn/vOOmm76Btm7euyS6SXySF62Bss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMso4ne45mExxyMXoS4v2CET4dHZ7EQMeTDZq8MSxs/WKBahTuhogSPoyrgcjWPvIW9G7dhkGRjdyNXrubmR17hbjKQi0HvMs6CHUgEd4Pr07Z8XdPs6y9Ga5KEILQId0SJa2LtpJJScNBvIEB/DJxGAf7T4L3rILvQn0gcxNWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nz0ocbTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+KwgENK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nz0ocbTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+KwgENK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2usI3772711
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 12:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qb9ueB3lM6PN4mzsHtBWDVS6JjZvkFZ5R22Y/sH94zw=; b=nz0ocbTqEJlTzI2r
	qHSi/PjppUSV7QdD3ApQHTLojLuR2Kg1JaX08g6j8SjDroaECfmYNyksO+XNC1s3
	+6N+ZNqphmWzi3SXXyVAckAOBGXwcBxHob7S0fe3xkzfUxH5OAZOR0FO6bJI6y6G
	XdN8Bu6Oqz41ZMfUOrnkhVpyOhV+AjHxvHY95hqqZV2OX70IWSv7Djf2nqMKMMM/
	J42riUGU06Ql7pCNH0N52wPSdo8DgaUvZ1nBWXUg/dAq+qAIHKegYqqA4VBYXUzb
	D3RQVN06MLHNtFP+Ls470plr//Nk2VoJIKIzSebxdANLGLBq7HaRekVtOyS2Qb/Z
	BxrUlw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b038k02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:31:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811ae55313so521315a91.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081900; x=1783686700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb9ueB3lM6PN4mzsHtBWDVS6JjZvkFZ5R22Y/sH94zw=;
        b=C+KwgENKoBQRkobVOScaATH6qY12q556HGp8PMv8It8sj0rGWgwo3ZsvQbjHd52+Wa
         tmki2shOBQCX5Dg9fxB1nbV+gwipvcBUVamvBC2udATvKQKXhQ7R9ICwCoMSdya6aGTM
         eCRE8PiDXz7GEpKDsobPqw7tfk3mzMQDehgDpuh87n2hW2bG85oYkotuWjtObNCXsu4J
         QdOI2L0ShlUvTzjqqgIat8eEtPWizbZgFMCMO1TEOOIaIs4h54M7R34irpUSnyV00w78
         sxKy1+akF/o2A0dt1Q5VaM1D79/a6YT73Aq/lNPwAxbEFzyHJWoNGLlWaXktPyMOFHFu
         8xUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081900; x=1783686700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb9ueB3lM6PN4mzsHtBWDVS6JjZvkFZ5R22Y/sH94zw=;
        b=J7u6BOeWt7EjwKh5myIb/O9d46a5cEFN/PEtEXZ8N0cGBcK9xkRHu1XKeHoLF/y+Ch
         IGj8qyYpkm3Uc0h6C7BLZU5m1JyF5GAqeZNDAA9qnrKngjgvhim54tlaJmaCs0kxeeX/
         LJC9kT1K/FmXi+Z/+a0NxbhRwdM7RMgvRf5WxOM+99WAurkhoRP3bhfg0/bRbT121RdX
         ERIDiNdAmgDS0sOhhpATZ0Y1z2Zib4wfCvmombfPzDXLdP6kXu9ftRFL9rEAitWKSz6U
         c+BVdEMgeadSTdXNa0JIC3iI1CcNamPB7BEtKjiuFghDJrFsP8r8SIMEw58yEjLk8h9D
         xKjw==
X-Forwarded-Encrypted: i=1; AHgh+RqX9qAcCyY3k0zx6rA6qNct9i4TEubMBtzIU1fAQ91GXSCGlHgZenm1YcmJeFEbmz9vavtOUAXw0CdH@vger.kernel.org
X-Gm-Message-State: AOJu0YzIMxdzkB3iiU96IMYqmz43M/zblqjvpWtBTYSR8/KvF8v3njXY
	2TokZIwc6/lP/oVbwYEondr6kZasNxzFME/sDjP5524Ipd3b1lbNO6AHlat1Lrd9r9iv91mNmxp
	m+0b5fhZMgFLE86YONZPpGtVmdwPsJVmT7BgLoGHdjg/sMiJDacicI4wyZ5Pwrw+Q
X-Gm-Gg: AfdE7cnLlDh+0k1LHerdivIIw6CsL+4zunNjy1kCeU6uAN1Xr7gc+iD0qEDSyfrWWlq
	uDQEnMLJKKCa/pKZtm/Steb/ZSqsspVSVUhq9p1tMiBxk5nZtJT+xMFqbeWw5eHMfalT8jNi+Jh
	7yvrlFAQFd8AJRcUeCaAXmuGCjkOVIb0o+zg5lbumeTtV1ymAtzt2AMoGFRfprCD8f6enHfI+1v
	zWY16soGwMmaOVUljqciMHTlc6qOJ+CJpbjmXQBuOFgiA1BaLT2iEDWIxUzHn01A94tnOYaUeUm
	D8WZ6i6KYB9QmygG4a7MLqMGBu0UktqPR6ZOnclpwqCBUWvMXMY9uPE7MaSMW7t1NWwBecpCpGn
	noHCsDOXecAQdcGZ0ymsBpYzPcsbtO/8TQvFKmYuNhYZLcuIL+4jekl1TeiOX
X-Received: by 2002:a17:90b:4c03:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-381973f01admr862674a91.18.1783081899305;
        Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4c03:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-381973f01admr862632a91.18.1783081898755;
        Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 05:31:12 -0700
Subject: [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
In-Reply-To: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=994;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=LbAzKcdJBSlOlhXn/vOOmm76Btm7euyS6SXySF62Bss=;
 b=uflIOkkR8d8djFm0ntwlMcSZF/HQx9zJJjSop7On1AKvtbsEOh/Bq6lLibTVc7KN5PzKTVPbi
 AjfvKmcOz5jC6p+hWtNYFd/8Bax1jtyFFlqwWAaAA4mvybBRziP5fHC
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX3yYWx27YaHjB
 gVFsBsx3JNPrTSnbtt+dVAy/5XqDLC5OG3Q9NqpKHon3JeUgq/lLZxgkwMEN2RTP+nm6Hd6j1N8
 6h52sWCAnQZ+cLWeTy7jVdFcnCFLDjQ=
X-Proofpoint-GUID: j5hYCb0TXkgl0xlQ6NcjOnYZ0A7_jd6d
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47abac cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gkKWERduQOovxkfYEQ0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX2wPYc8Ytl7mR
 OB1jr6xsZgRXKvxqQa86dz6ge2aiiTNa5vgBZqts97rixeUA4SEjUA2p4XU7f7LYsqNZuy6oqCk
 6Qpmd0CyttzzEcHsNhbF7mvmMd6ZG14BobcIEJ0YkDi5LfKqSbrnq+Hcj9SCQL0phPHB3DHaVIO
 4VaerNdfqMZpbNgQmqhpQaM0I+Z//9iV90mOrzYzL/lrKdmqnHxuIFXb3p0a5AtL+ilWZVw/ZTD
 HA1h/b40VhcKFWUtGrfiiFrN5C+MkM7Kd0jKgnrXijszyNrJBcN+2gRmGZztDEXHmncYmlhBKAJ
 GUf3Mi7GMOUXAYPzfPM+e3iax6GP+cK7VzkVCOXPs9MFugKJBzGXWejsZakH92ILy8m2gSQwPXm
 xh19suI2YFUfsSqNuu5QnQke7NsM75/qCs3t40JDryjKq+KF+VoZW3fgE5TyP6d3Fg+EthINhRO
 Lx3O7aYIdYGIQPF3uuA==
X-Proofpoint-ORIG-GUID: j5hYCb0TXkgl0xlQ6NcjOnYZ0A7_jd6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030122

Fixup the SoCCP/SoCCP DTB memory regions to reflect the memory
region requirements of the SoCCP firmware, as described in the
Glymur v21 memory map release.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..5f44f68efde2 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
 			no-map;
 		};
 
-		soccpdtb_mem: soccpdtb@892e0000 {
-			reg = <0x0 0x892e0000 0x0 0x20000>;
+		soccpdtb_mem: soccpdtb@89200000 {
+			reg = <0x0 0x89200000 0x0 0x20000>;
 			no-map;
 		};
 
-		soccp_mem: soccp@89300000 {
-			reg = <0x0 0x89300000 0x0 0x400000>;
+		soccp_mem: soccp@88e00000 {
+			reg = <0x0 0x88e00000 0x0 0x400000>;
 			no-map;
 		};
 

-- 
2.43.0

