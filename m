Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7463AB28F
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205117; cv=none; b=J7Qa2l4Lq/5pIswcVoZgZ82AbNqN6N80X5emg4A8GGHkcGqRObhVssVQSMPw8y8gqZtASqxw8guow+06eDRZo6Y8VfayaCEy/IPAYJDs5Bfmu0zim7PtAYDPC0XQKZrQ22+17YS6iJZFpy+fi7gAunPUGDoitUX+ooQUL7E+3fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205117; c=relaxed/simple;
	bh=ILV7hBvZwBEUvabJv9MTYx2JVDfAUHT94TuIvlC7E+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hh4l0EaSsgR8yA/WfCQa/tAseqAY229tTbNbW+hlcKdBadbY90VqmFamDyjgLe0HGGJeNB7jPAR0krJmZy18eu18m5f+f/EFlSeY3ZMnVIAVxdA6qAQuQ8K2FYXhj8ZNM8dk9h18TYpvZKegM9qCwX1SbSZkW8VmQT5tF3Cug8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVn1aABk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHtWqYuW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVn1aABk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHtWqYuW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL7txK1439647
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=19r7/8qn6HtW8BtFPh6L4s
	Pf3k/JQEeFpgwrZz8kt8E=; b=FVn1aABkpZQMCDYA7idm3FhuEMUrDmmvdiFB4E
	5Zh1B12NYMm1IXlLVP4DqYjouGLki5oPnX8Tl9kDt2HSq+tdSX9MHLtGDK03C2qn
	3gqQ21Gt2I0w52xAO3dRMUT8l+BksTUa3FZcIqg+QxnynaXlOT3L5+vnwhnoI5Qa
	2fblO2lpgnF8Hb6TuUt4ZOvx2aHSf37iY4GkP5jxAEZuyaUI9pDrA/wMFUlXB38h
	rOyEN+7BDgyqrlfVLC3stWX46g6QOYODLadaJLYtMlhvwVjlCZcXxMGj1Johjddd
	7AuM8ZL1pM4u2ghOYiiQbUNQ2OmslTcBdkLE6uyaxJ8OBOfw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa3u7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:51:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so3217001a91.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787205114; x=1787809914; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=19r7/8qn6HtW8BtFPh6L4sPf3k/JQEeFpgwrZz8kt8E=;
        b=DHtWqYuW2CkgqApDr+NxNKH3EjmdF6/TsnSy1WHLOtIhRNZMpt5kdziNN2eMOMBqhF
         XFiu2YDbx/kgLV+8n1AdFAsYcd2i26T1pgJa7Zxuh2shL9Z5qQw/SkWt4+c1fv5q/iKy
         aAuyCgv7bu+QWJpcE2yOuDzsQmnioKPFmwDB5aYGSpWzQkUsVQG0WIOIOsVekE+c9Vrt
         pkQifk12cB45a7u9YLkqnv7CuYIeRlt38h+Io9jfDAS3Rc3QD3kgSUh0hoVVQRcjAGXJ
         0GWK8y8eoYjNf1ryL6Cv9c+oUI06st7VACsuhMElSpUHx/60WwoLDjWR8VYpvFynGBkc
         1DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787205114; x=1787809914;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=19r7/8qn6HtW8BtFPh6L4sPf3k/JQEeFpgwrZz8kt8E=;
        b=OLJRbQpn2SQA87L8iJjSVG/OXDxvl+7clYt01gB0alvbPFGuWzCAM8zRAr7cQrf2D8
         HTPrFQjgD3Nxrn5K9J0hE6lbqx5TTCnCmutXDW3vyVEAC1idMe/j3Sj71uTibFiiL02S
         ixF703bXSkdt+V/06Le/Bc3KbhpB/injEDHyItiUAjTAQElyUKPhts7vh2mFcGGWF389
         ZiJs5dHinrJXE/2IOfd+o8mT/1IfQFKtoaWcxC9P2c5wSSkAlbpcGv3f2E2aeH42zeOU
         StkOkx4hw6e3Xh/liCmBGjIP9CauYtWGrVZ0A5K2kzLlpCy+lOFcxrgcLVFmRVy0kJf3
         CJPg==
X-Forwarded-Encrypted: i=1; AHgh+Ron9UAKLDqeqSbF+yn+la9VlrG9/y9+px8bP2X3EhUGiD2vTN8PfIPhdJOw4x6Cn0EsIhC0lcMLK8OD@vger.kernel.org
X-Gm-Message-State: AFuF++ngK4kdyHuy/Re7mdnoXcCHNzZ1ojvHm2CvVqPF6hezLvLuNKY9
	f1Ggh4I6RveNV6Slt0FHfyYDrxTHJjdlI0A7BD6OiOUPQRPfzygNCDTVwG+GqaC1ubfU0EKxsAh
	WuevIKQUInb6pdu5jr2drldga7caht9H/HHw/YmHlv8XjggDpolgtZqyDw8/Q7lCt858rxb7K
X-Gm-Gg: AR+sD11E2W/KgmvB5l1FZlLtP2xjhZ+AabGL80Jed4bIuoa+T/mS38ivyPRi+GTPyOm
	Xq0em+Vb7nOAzbbgcg77lJx89X7rF6Yo895YYXRtLf0/BEMoADDOv/4xFzRUlqFB01z+bhk6vC1
	or0e080rP3wPQXPGutoQCdd9L6+1+T0tXzk6ao0SJ6+OCwfJtiyfT3FkkEo+nUSSsirUejCJV0n
	lcXPMdroV6ZrPYuSt27ybhy685ma4RE13tjbNv3cffUK7SRVqRqAzXh15NLzEjUZ7s3HY9E8tlI
	rw1zTs/ep7kUNlw4Mi6pK8tgJ9mUQjYzD27RbL4YRazwktcD/0z1ebLIbM3xXZRJgGl9azdadfL
	bJHaeH6MgV+F71rsDGN9cesR1rtzrw28acw==
X-Received: by 2002:a17:90b:2e90:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-395804993b6mr18554832a91.0.1787205113434;
        Wed, 19 Aug 2026 22:51:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2e90:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-395804993b6mr18554748a91.0.1787205112994;
        Wed, 19 Aug 2026 22:51:52 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb7cc17sm6085131a91.9.2026.08.19.22.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:51:52 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 11:21:28 +0530
Subject: [PATCH v3] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN+VhmoC/3XMQQ7CIBCF4asY1tIAtVBceQ/jgg7YTmKLQks0T
 e8u7coY3UzyT/K+mUQX0EVy3M0kuIQR/ZCj3O8IdGZoHUWbmwgmJKuZpKY144jUTBY9LSvVgFU
 H4zSQPLkHd8Xnxp0vuTuMow+vTU98/f6BEqecgpVKSgAN0Jx8jMVjMjfwfV/kQ1YviU9DfRkiG
 6WudMNNU7NK/zCWZXkD5YDnHPMAAAA=
X-Change-ID: 20260806-agatti-audio-357bcd74ae9c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787205108; l=1989;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=ILV7hBvZwBEUvabJv9MTYx2JVDfAUHT94TuIvlC7E+k=;
 b=3WOwRzWn+7SSfEi+ysNFn+nF+YOKoTFwYm9P/dIWVXjHo8hsAlVMyINhpU7vbXfE602QfuKN1
 qm9aLxgozx5CPzgRbOK0O51qUXp5Ssr6jotbZsQbQqTS0tfLOzdtRBg
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a8695fa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAuMJsDzbBXlsf1WKcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Ci0ae5U2OaSjdHI2wqRBfo09taqxoRom
X-Proofpoint-ORIG-GUID: Ci0ae5U2OaSjdHI2wqRBfo09taqxoRom
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX7P7IhJRtxcvd
 qqxO7MmrmfZT6TiQ8bbOP7MzH5KiorKguIPNokJ3vZicwGWpliddbPMc2WiyXBNbjYBBcgUabQ5
 oCBby0hnnSDXU8aTIdUn7Ulf20dVIiQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX2sLedYI+iajc
 EJzHnzipvx3QWShZyIXCwx248HVkgrGgDDYBpj02kEQsG60pu3I76aimR3v216KBBGnHAXt3wmc
 OtF+UbbBlS9CRz+5vm+Ghzxcw3C7WHxKADmxMQ2WJpCAwkMcJlrxwMBPE1fIUyTPkh89hfzrkja
 /J4nRyPp7KjkkH8NEwJUcXH369I4fXy4i+5FEZS9RbDg5yCmVA7terY+WMuAuon7ruSbxAzMiv6
 rIJpHO3ZAbCCGAtRx51mHB79IkvWqB30vJIFjn0fzsV3J5KDZWSF5dDOl3PKue8Jx2NTcVHxcQR
 QMjas5w+VCke3ViiPByDKym+R6NvzjtF99th2nVUJWTbE1vHAsZl6JRY+IVvJcs2m3JA/ZuC2zp
 QmwbuztJl2EuzRgFDzde/ZfZu6Vgiu1E8H9BittefCFFg6nO5NhD2Mi6MPYxBRllL6cIjEa6y+W
 PuIZrKydQH54vGIWZxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200040

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v3:
- Changed alloc-ranges to <0x0 0x0 0x1 0x0> to cover the full 32-bit address space.
- Collected Reviewed-by/Tested-by tags.
- Link to v2: https://lore.kernel.org/r/20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com

Changes in v2:
- Fixed VMID list alignment.
- Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 590bd2432d85..d010ef7fdf8c 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2348,6 +2356,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 
 					qcom,non-secure-domain;
 

---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260806-agatti-audio-357bcd74ae9c

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

