Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517619;
	b=X20SidK2rGFsykMfJI7uhvS4U1AOP2QJgng1yP/es/ChMDgqk+Ch8s1mkdg60955SOjl
	 CMtWi1e9TwMklgs385GM5CWaSgeC3Ql5JTQv1jwhekD2i36JHsAnbEVYHw9xOCDfaBZ1I
	 FNnd/S1phpUzElyJcVcs4/kMm8U5yCmMUyetSXW7jUTnHRjB/HX17Xssze7EIKNWN8ZA/
	 JHl8PxJWBCCyi2pFRb0NLgwMTvJhe/A/IQIQ3oBo5Nnf4+oLOy00FcUQMkorXTyxXLFLi
	 jnseqHlKx+sZfe0f1gPERozSup3d5YLUEw+IycdWvD/lU1HSufs3rGJSB7hjdT/SeRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNatiFAzBlmg=;
	b=0+/r/JNRccJmbHUljvOe4cK4I5K/5QWLj5qzkyMxI5rs7V0yDCE+JRUYg0NoWyv9nt9Z
	 Lu+Niak4x1+bBKY6ZeQ5Xpxp7hGxKPWQoj2gb/EGQg78fdFG7pPlLaU/j4zBAn5sZOMUU
	 W/rG0jJ8i9nZoYp05cuxJNZsmGijlgSOont2vRLCATQ+HZ3wTG4S7edETHm8SjsqaewIO
	 mrvh1TcNzehg5AjvTcN1IDfKjv+h4yzaMZHcvgsY74vpZMyj0K3PEhoepVPyY4CKvjm2x
	 Y2G8By7ahCpego2w+M1zKVgqby/rxiiXcYlWUmtt93SsKlArv6F2mFvGr3KYOYyD+Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAMMolDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WsAb/cfV";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA0606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFA0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAMMolDc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsAb/cfV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8EeXt4128891
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNat
	iFAzBlmg=; b=QAMMolDcSlBSXYPRXycbXn72xsh45SeMp9zkjEsf17Py/1b5jXX
	bZlNVlbeU1zTTQKX9qdxBpVczc6wxW7fCYwxq/X7PQ56Y/HFee7Tey+86owdoELK
	b9YrfvS3F+k2cTD1wPM2h3QI5O+CcW0hkfC89rVputG7U15mmO4hTJW7jc1kHARo
	cKdva5O1j8GbpipnYkVmYDtyaOPlWtG0rIY0Rr9wjvFIShQ2g4coqN1WRoPCCWd6
	jfP3uuWZ4xku48e9Ep9wpzzd/rq1osKwhm0OqP2SdtzHx5LExTgkvGDc8HZAMHIj
	6c1+IZ+ZBA2/q9t90/J3bEhkCKxaZnnENxA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2a87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3ae17c536so4359648c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517617; x=1796122417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNatiFAzBlmg=;
        b=WsAb/cfVGGUCGnHNOF9xDMI34rlKwEiRNIyQPPP7S2bxTjxDQFjKRJvzeyYlfO6gGT
         CGOU73ieSRjf49oSgiJzslxpwdqSZ0vqEKBG71Zc8V9l0ny1Ojt1S4QnfsVpSUIGIpEm
         vCa16Q9xADqfvq9byxrgBTebhJt3evd7tGppNHU+aOORSmYPVxWqMe+sGCFVoZR2ldtn
         eZJpw97jodJbjNQrfPuMNf8N62HgW37dBl9T3Ebg/XFpzygfqRQHG7WQxatefvUYhB1e
         jIcdkN0Bic05KPJ7UVIdoMwZh3BWhy0w3KBbOSODRyaDaM1mAMaWgO4+e1ngZVVHUb27
         qN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517617; x=1796122417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNatiFAzBlmg=;
        b=cp5041eyROUtqJYXM6Fb8LUE9tsHSfzCXR9FJEILQwgvJiBk30R4LJdB6bBxP3kfB2
         PdedXs/jy4oRf1rL261IM3GAymE0C/YnoV60TdUBfFbCriHuwNPO3I3EJxe0336jQpbc
         lpR6EOWLuGW/e5MGJyIR0KQ0ts4f2Uc7s9VCqC/FMFMqPW+Mo99E6bWhZmXF4+Ege1rD
         NbEuZroaYboqJFgTNRpCUN0Gq4B6W6GWJORysKMrM1pYmIXZdIB7sacC2O5Q+o7WUOES
         tRimLve0URkbBqvYrT6TVN88ibFledZn5GNLKXUcQxsSxsKoSWWUj+SK+aByG1IdvcF+
         C4UA==
X-Forwarded-Encrypted: i=1; AL+hErF/BKfAGtJRJ8ODv0LsE5Vgyc5lNCzAlVm+XGSbpNo292mtFiLm6YbzgcWXjMkwdKze5VKyhTCGnxlL@vger.kernel.org
X-Gm-Message-State: APuU4Z/cRCcw8oQ5rdTNsB1tTp2wtm+lUFqDyLRbf1MCuO9VjPEWO8Ge
	IxzOQgFilL2FA5EoPR6xHZn0mJw6IhTwLBpkHlsCBorOF/EzuqPB25UtnMlZ0Xdmn6bGuK2rb++
	P4dmI1PMS0MfnHOvjWjo2Xz2qmf2c8qJzvIHMzrPEBJh2WYroQ5sYQ+rY1gSmzvRA
X-Gm-Gg: AZFdTZcZKaqHkZua4uzocv7bUECpy3dzykiAywNrRz81P+QinvJp3ByS+SHmd0L6Z3Q
	nsSF+4xhsusBBtdxY/x+qcf+knR+pbnKuvauG8rZVSG4h3n5Jg/DdO2hPerCe6I5l5rLaGTLyGQ
	+NvI7DQvVGt2VC8fMOf4A51voCGLvZBU0eiaoT5jzUUDSZ2AGh+I94A9HTtA3w8gcqv6qe9l+pf
	nsg6iaEItsXim01N5S0+GLSNeejCcWt/Nev9aA9dLm/uECIxbAXyP8+/VBAKfer9YbswnDJ6RWd
	5xPGmdIDXWDC3aK+841veos8bX2oMr29BAeyUmfFRR+rn69XzhYbtTi5KZsQSB5V7MhxX4cdLyZ
	TzF/WN//9oh39xy+os0du4wzyP8oEowDtYQbGq2966lfhjkto+FqT+AM3/fmigavcJRIgQuXK3P
	MYqY29Q1YL1m9VjU8zQ1UFL/ocSREnlJRdEAbGZ3754AjxwSlzZe79Vupj
X-Received: by 2002:a05:7022:ea8a:b0:1b5:3819:f8a with SMTP id a92af1059eb24-1b5569050demr14405120c88.38.1795517617276;
        Tue, 24 Nov 2026 02:53:37 -0800 (PST)
X-Received: by 2002:a05:7022:ea8a:b0:1b5:3819:f8a with SMTP id a92af1059eb24-1b5569050demr14405102c88.38.1795517616783;
        Tue, 24 Nov 2026 02:53:36 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm33732659c88.15.2026.11.24.02.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:36 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Add Seca IPCC compatible
Date: Tue, 24 Nov 2026 16:23:20 +0530
Message-ID: <1a2010d7c4f4ae5d4629d2709157d7d47c20b3ea.1795517600.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXwCjIhgfFoRCu
 phasYJviqmI8SVRu70/sjlTWNi1fBTKTqfDBQtaanKfm7Ou7vg560uwaf2ORSpVUqPqvLK/X4U3
 /RLHQPvqH1mq1XbWndbMjlo0eWJSECs=
X-Proofpoint-GUID: z0DGjayqiVZgeV8hrFzn7kHlmzrZZkQq
X-Proofpoint-ORIG-GUID: z0DGjayqiVZgeV8hrFzn7kHlmzrZZkQq
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b056cb2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX0q5yxvgLpp5T
 xoIWWGh0YTw5dOKMeOhYmMQ3U1GR+bklwhCqwEIjc5Gv0cIkpWkaztHRhKkgHarbtF3YcwL+mkz
 i72fusL7Koz78r1gYi3tTkzGlmFGqqPrd29qXhdPZCsW/ip29oQ/rVsGLmt+tM6nfVjH71f5rTN
 EVQIhjArjFFTrFXATNG8EJG9AtGiP2UQPxwMx9hcYojba52IZEy1aE2qWVIGToQZxXdWEy5wKCh
 n0v2UaRx26/LRuL0+82b2vxSoqpm2so83KdY7q/9dfqaGtav9btrjz+jQi6CaRO00agD0D79dMS
 O96KDxM0TY1l9f71DDK6IkJGWtj8RXRAlyNWpLdRcrx68rRcF17YNR3W+SSw9vxMpDBemMnlb8T
 gYrs1mdaqEHRAqSAXIo2+SUJpr0gdRJt62LZdRg98so3t9ZSvJ1kXNqCWAEy1K6pEBzbD84IfdA
 KOoYapETfx0/u3F6p5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-ipcc compatible string for the Inter-Processor
Communication Controller in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index a378fe8c7148..5734ac79024b 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sc7280-ipcc
           - qcom,sc8280xp-ipcc
           - qcom,sdx75-ipcc
+          - qcom,seca-ipcc
           - qcom,sm6350-ipcc
           - qcom,sm6375-ipcc
           - qcom,sm8250-ipcc

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

