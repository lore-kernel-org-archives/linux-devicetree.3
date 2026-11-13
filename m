Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580382;
	b=Ac7tYDJJQs3uTZcV79ZOWUMRbghSWDKEGsEbQMmU0hNgWE5eFOeO2C6UmqgUCF7dhW24
	 CT2R3ZenSD0qa9iiXciUOLHjru56rraMVlTfPWbGfLybyGzMpdyxbeEMecqubx/NJzFxs
	 SFP85WrO9TXEm6Nx2jiPFlzXDKWHIti7o6YOlrLp0e3zcaeQa4iWWvz7g1c6GIOWLbIAW
	 8xhBdfr40IGfa2ZnIZ3gzC7wWAVxCi9QyEWXvx1Akp6SMV1fepgkbvEXI4IWa5XEbtCrf
	 p5jvWiGv5twl13ekioh3qso5yX9/QS8Z0H0KnWu7ybdQ5HIG2NkbSztamlDOJmL2HZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
	b=i8CjUpgFEVKQXsrI+TA/8OJcwqcWAkGyohgAOeTppKWNii9XMxzeqPW4EquzPJWvJjaT
	 nSolk2sTkmqM8w/rfVPIXUwf21BYAiTkvxrVoLEltpAJ0ekNjtwGMJosTT6nw4MJ0ZMcC
	 1O/nWQd2SDlcP4JnK6nXa8YO+oEGDHwq4t8qqnITTZGgx9sR0BXvwgCNxOhWHJn+5Q8mo
	 oUfIbeYTiGI41sUmum3SJ00bHoMpM4nzhoKR6YGfBfFem74myk0PH+N4GDMIbBBjIdzVM
	 HYIJjVlyGqN1dJqBSGcKCKUPtVigLLQkBfBhScuQKPzyMo+Z6wDCDrT+fuFHsO8jomQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6LcTAxS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCzP9o40;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91094606A332
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91094606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6LcTAxS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCzP9o40
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJb2B688796
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=; b=p6LcTAxSLBPS48Cd
	MH3YQQ1EsSIZjcS2uPf7SdzFAu4A5RxpP2eMpW56ge6qo6vfDIhLmF03xEqv31x6
	14lWdjH88HiDAd+UUR7HtMHeZrIr5xhHfLgjQxdGkgpeet7X3nEXLBGs/eEk6B2N
	nHfIl7NAPKN5KaLX0hjwYCrk8GVDTRVm3kHR2uOSggAyeAfS7LTeOnpBU4IXdfwG
	PHgL1oAU0eYSVC5QVyfNbPu5gHxZMn98EspesPMD8O9VhgWB+ZP8egsyOGZAsGHI
	DYIfHf6xqfteN/8zXKBcO1y3p0vw2otSOKiYwwPSID0PzVzEwpRpBJjl171soltE
	rGNbow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjrtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:33:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so212620085a.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580380; x=1795185180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
        b=JCzP9o40ucS9Xd8yC6Pj0Sg4E6M9RNEza9icZkrlgBQbf5pETQvpsPhnqoSZNvdgOL
         cC5PJAxpWKt/X4EJbNipl2YqsEGwEFqq8IjZEm31PHJTwD/kr5IdOxF4g5FZhYPhpan5
         WP3dmJtGDk187w3/ITY3DcbJaicK5SJRFvseQ3oGq/Fllu4Yp1jGluXhYpI3YqtB7ud/
         kSAPZCeGHuS5ivpVo7WEqnxwQC6TfdDFr6XoV/qeqjXufgx0duAfH/Md0+zSLlMVn4+c
         PBOERuDvZwd7LgkV7BNUMaM5vyehSayp0UPk5cZkUn2X5u6J+GQbiNAOjC231XdTO9yV
         rbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580380; x=1795185180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
        b=vF933Hd8dnqUpM2kBbrkNP91MzlCUKPfF2B96jaHlW4q9PDaWAYV6RsZ6mHuLrwEyN
         LdXPram9Op72BW6IkEjR6OAaLI75dU92DK0YsiF6mCto6+pZc3EbGcfDGrwKB2/Yx/kl
         o6o6oOc1K8BpYsUfGAigBgEopCHR4ErUBjLgm1T5b4y9S5UDhC5MMQlxfhmmYdFFQkNV
         7N8BjrGr/9bHbpzTlzJExapeYVqxS+8vIj/AXVlW+p8p97o7tpb3LkWSKcPrDrEf51kC
         XBCXwCJ73Hcy9ZSDNSAC+QaVfbP89w2fgeZlp1UvE/AIrlNh232HPN/kHXWukGKwoxkU
         3tTA==
X-Forwarded-Encrypted: i=1; AL+hErGQ9BlagkBzNglOODgGP46MU6ROyux07Wcfrs83SCEb7oKzSzIO2v3gyv1Ov69mUVNDjcsoTSSpVOKT@vger.kernel.org
X-Gm-Message-State: APuU4Z8D6IEhZS47TRWXsO4quK8YE0ge9L5SKTXqenLXfmvkbX5FxMVT
	LRWu7D55UdP4VFzIPE/5AMN0A1zfbHjll0s4iyG3v5OJfHjjUPb1+ySzy5V4G5TFJ5KJoV5jAj+
	axn6fFdlFGgqUfxTqTZw2ufzikhobCYqVicbG1lxVyRCLLTtp/Hpt9Uk/7q4NYAAp
X-Gm-Gg: AYBFou14dpbjziTJ7j1qgeWA1W1LF70UFd4BidoIkjxzsXrCKNWB+zdJLZYZIxhS0jd
	M+rQdQaBfMkm2U5oWCRgJuisjnL/+d21lILR/uqhKnfbbkVbMcXrGxJWCUzhHizkZGxuUbguRbZ
	rXdxtUZVw3LkkJgU/EOujNJiwVOe1gZa5rkC4GIxWwWxchzVKDb67ryI3DI6gRPDLrGD0BQG6I9
	WGP2AtRjVO4CdC3JT3Cr7kCpt5P9wsThBe6mAoXw98pOt6DNlxgAAVCUeHqabHEfC5l9v1yW7kA
	McxXDLCjN59UegR5BLdQzNZDGqrZTkukSg1EpF00tgD+KFu2arREnlApeS7O8diggDzLIz4xfbN
	FWY8GMyyGNBQhUgRf9ul3W9Dnx9B9GDQQu6/Kb1x9jN/aVIptoVfhWGLn7V3id88=
X-Received: by 2002:a05:620a:a719:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-9495cb86f22mr83105385a.22.1794580379748;
        Fri, 13 Nov 2026 06:32:59 -0800 (PST)
X-Received: by 2002:a05:620a:a719:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-9495cb86f22mr83099085a.22.1794580379090;
        Fri, 13 Nov 2026 06:32:59 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:58 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:02:21 +0530
Subject: [PATCH v5 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-shikra-el2-v5-2-8aca743de97f@oss.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
In-Reply-To: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=1410;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=AP6m7K9bcNvLKnjx7yin31NugzckAmQBmT7FmQR5FW8=;
 b=3grAOrtRV282qWHFnvr0tb1SE6cYWndVBqaZAYbo7EGP8AmopSFDhWgbOvmACGOGHjHaUAlCp
 RCF5uyMrJ05BQEUzi2/HAtn57bemSJCmsfbesJuzu59nAB5M2jy6YwJ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: zobJ_QyRB_dmnqhruJ9kUq2F2ShbXK3S
X-Proofpoint-ORIG-GUID: zobJ_QyRB_dmnqhruJ9kUq2F2ShbXK3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfXwsZhC4d/h1og
 TH8ai006hQ7lt2HnzQ4vmhMPDSTfX2UjXrM6vRiUTjGtoKB1uGC5w526p4DUS8Bb5AXIQktUs9d
 DfNFRt25sHTA2PcuV4IRD3zSoaV0Abj2iCGxzvJ7rcfp+qRUVg7Ic/kSVi3IDNFU1HgbTzXuv3b
 xN4s107wLPZH8JZ2yek21+5TX5Lg5NPpaoWbwCw8aadp4uOw3ZBcIE1NYsFuboOjjvDQhUgxozj
 lndeZcnFSSrtac8wpp25BSzfpDkihsRjdpNKsdhnxVAX4d+0Rq7sGvm27GRhgF0YVZg9gCAqX9s
 OSuvozzkW5r8LTrcN4bIpDn6TzOx2moTMYdKL0PeZZnJehnzrJx+MAFlLgOGk9sZONacSAMweVq
 JHOafChN9ocx1M9gccUWGwb/5+aO4OwhRUWcQdjHOZcfZV/GRcYBdveQGJlUg1XSuc6gCkAG26c
 mH8S+IsjXTEXADw5VbQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af71f9c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q89ptBQ9mced--_tLTIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX5xbr4iFqRyjo
 QDZ6DZnCb0Jg17tlgomiyzxfpWoTNvZbbdgKrLM6qfg43syVBu6mNehd0Ha6m9dEZoPjry3dj3s
 cY8yO/M6JAwW2TrWHbLxPfJJ02EllBk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130057

Describe the iommus streams of the Shikra PAS remoteprocs, needed when
Linux boots at EL2 without the hypervisor: CDSP uses a single stream,
while LPAICP firmware uses three.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..1688d198cc5a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -119,6 +119,17 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
   - if:
       properties:
         compatible:
@@ -134,6 +145,11 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          items:
+            - description: Firmware Stream
+            - description: Firmware MMIO Stream
+            - description: QUP Stream
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

