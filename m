Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DE8442131
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131941; cv=none; b=gShvbM4T0VmZvBQKdmntMYOX3fmP34owFRdHV2fKdTJgHnthv3xT68ekdnG5QCEywQlshr1AAdGUNzvno32Do54GMCgY/vtF18v7ufgrgrIEOV4Vb4MKeaSNU8c5PANyOMa44oGInL0vDEzpeJRypB9yEktoKXrpf3x4SazDdJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131941; c=relaxed/simple;
	bh=Dny+RyY3KCk6QKMt3V0eqBv+pyXgn2zC1F6QFIIgFCs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SH76Lr2vPoCwx/JH1eBP3cqX/al13poI+OUUywkG8c+75GSWAyLpQGey4PFjKL17YXQr/Rv4XOuNJnIQQiVD5fu1GgN5yytCnU3KXOraQz0EFn/zS/sz54XEXJAu3m1WgpE5sbPUeEtTiHkh2pgdomz/w44iyTdH9ZPKwf6JHIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/YMjsTy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvOlxFwa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/YMjsTy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvOlxFwa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z8re3589422
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QEG01RTtqXCwd0jf8aNVkVVQzTpHS4N2f1Y
	pFitP50g=; b=O/YMjsTymSto4WIklKqrPyoxllrtwSFJpY7EiG8Wkvv2WAwfC8p
	3AoGE8faUDRF1kcKcxbF7AKI/nxJinPC5sIAUhDERsxA0urFLWF/Yi0S6mp+a8WO
	jZGWzyJj61A0pAeDkwhuTbRBwzo0RjD3nK9NxKHQvLC5nTZ2AVo+uBF471hcFQ4S
	9joyt8s3evsCX0l+GQx0OKYwXQMcsmVMm3kr5/NelurBQj9JUk1QYyxGhLtTN+Xa
	lrO0yZK4GIrMwF47GV7PKOlP8q/ZRGh+mHIMwxYEBepbI7difInlxJrDjt2qNsRx
	ux/pdR+xxkS2SHPA/uS9wFyb3nDUfzwoIjg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfnad79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:32:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d827597fbso9328061cf.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787131936; x=1787736736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEG01RTtqXCwd0jf8aNVkVVQzTpHS4N2f1YpFitP50g=;
        b=KvOlxFwa4Vh0WZdL48PW5QHzwsb6+5AjnbtKH7AOvB6Ockdwsvk3ZpBSK48IxqDJGZ
         wTigjW6JWvX1/8iYs6zST6Vil0G5Ba2K+1g/AVV/pwm2Jpa2M+mJcKc/A8ie/Y++31AL
         5NNM1j5EQFXbF7dxbTeqq359r2nMrxnv+yIFn1Xy7+s8NbxJe0MjIrQTykIJF5ZCudMY
         SlzjZ5a2u7ik0/0UJMdQpDKv99q+KE6aiukp0wGJPO3MXWlOdSbhx8yUk7N5ri+jLwD/
         6XtBpVyyPVod+1ogd/Qv7vujyn1AxNI76uy10v+aLe/kWm8UWl23JuNeg6UHyl3OGUPj
         S7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131936; x=1787736736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEG01RTtqXCwd0jf8aNVkVVQzTpHS4N2f1YpFitP50g=;
        b=mcnrjG6jTwtUtxLCnS1fv9rMdOT+SP789rc736ydojmnUVQxcgqkMQhAc6hAdQDyVE
         t7gRLDoe1MOFvBG6TZm3rVUB0IYSCv376+o/ICDako42vy5UvGtVPs+a5QRyNGn69AI5
         XMxDl/yP6OmZSIqRiJ/Ux2/Sm/F8WZPXbNLQttIENW/pv+lm00BPUv2UiUpvwf6Vg2J3
         C7g6Nl99HPoxsGrbCRZ9bcWk/A/bjEtSKq8lmpydEdBlb7yuNaLD5z3IfhUBntYuumnW
         WFTluAkrIbbzm9QkjlmPkeJU5vuuQ5SfTQE8r/8pe5ISWlmgjvWjhYkhKj7A7+MFTITY
         +wcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOZAEfN+kOz/HeSfyueNWLyaqa36NeFKKEtk1wDehiWL1ZoMX7bPRSImeee0unypB6yIzWQkyPopKL@vger.kernel.org
X-Gm-Message-State: AOJu0YxWZdWT8KrT1QTNPHri95OYcnK5c6HmAKY/WyBE3IGqgTrJ9+aM
	ZSJhugvl0WOuYrCMec/ZOIyAy7Ua6zLSrNsXCpbWsuDm8nc9OYjnuaVMRw04L75TkLQNybz+X0Z
	TyNRTEAuu+7c2YcjDwbe6VLGt8bv9Z4lmb+1CH3i3Jt3Y1+7mliQC7rYhr3MyRuly
X-Gm-Gg: AR+sD11iU3L2M2NukWLWfWNi7jOLJHjQhrkdJX1oRnE6ZmWwJDE8pQqDI7Vbka6tCZ+
	yBJ7W8VeMOJZ337lKY9OqKdmSE/hY1sqYT2CXgaVYmi0ogbxCaRlCc4tAmVMfMNHYrxyZdd5Lrg
	+opnFGI0EwBYlO/GUtTEt4K+7Rsnh8/4Ybc58HgVeRpI9SVz+HxCIU+ndA/c8vb8V2nwxdBiLdc
	fTkI8p/G21Sf4p2XDH7oTZxa7aZBSQySwcd1GrpbCvzFi7szan2ed3EOg0YzzI3A+IxuyTHm410
	QXiLXYZnAsf8yvsmvZvW+8lGWbbirKwzbXlEcwkNWeYbdv0lZDW8fz7ASZiUKzV5x/UwGwKQg0/
	1YrWuCK8bFiC5oyrqYBaJVE5U
X-Received: by 2002:a05:622a:309:b0:52d:6afd:7d9c with SMTP id d75a77b69052e-52dd5c7ffa0mr28372101cf.29.1787131936173;
        Wed, 19 Aug 2026 02:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:309:b0:52d:6afd:7d9c with SMTP id d75a77b69052e-52dd5c7ffa0mr28371651cf.29.1787131935691;
        Wed, 19 Aug 2026 02:32:15 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8050sm4402835f8f.19.2026.08.19.02.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:32:15 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider
Date: Wed, 19 Aug 2026 12:32:08 +0300
Message-Id: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a857821 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=hRO0oj0PTDvf3us77KIA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: VX-e4phm3wynYY0WHQAfkdY0G6O4CO7P
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfX8C6j0ZgDRPPM
 aSFAVdaatmFaWiOsG/LWfgplvBPLOKXqGHAHCJidjkbDtWc6pQAFglZZKcoZaD4L+qp1J9okRrg
 vhcycZVWFCK2pfmfwGS8A1Y1M6kwWkA=
X-Proofpoint-GUID: VX-e4phm3wynYY0WHQAfkdY0G6O4CO7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfXyqAGP1kXfVeN
 oamfeSfTDer+mPjI/avpLZJK3U0AbEK1Gg6X2Nk2Iy9qsPCrbX/IdkkOUPW0hlDxxiXK6wxmrwl
 FsSX44ud6S1fadSNRykaeTtJJ17ZfPmsWEZCe+BoKOrkx3iiwBdWczPni5Bc/2lsgEtH4tmIfyX
 qHHGhDfza7nq2OQIIxf7U2Kf6YpaiYvHps+4Qvz158xGCqPf8sHRrbahJHHsb7fQMctr+PISXkn
 sX7aXyd6pHX92G+r9UuS4JZbTYB45sb3yPcAEKSZwf4HAYVL7qPDMhO9e5iT4lMm0rwgOPR5BJA
 A7K33uKUmcnVXSImk8YsIknkARc80/NkxeuR4TlWuamB+EcFvcq1NJRgKeOF5we8Z/RXKxp3ROX
 I8y/MFMoHJE92jBfzbeBhnRaPA1kik+xOMwYXWAnR8ny+1nGQ+OMFClEHuvDRLq/riym0G5/Q/M
 F2vVXS8IGl+et1+oFdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190072

This series adds a device tree binding and driver for the Qualcomm
Camera Network-on-Chip (CAMNOC) interconnect provider for SM8250.

CAMNOC is the internal AXI interconnect within the camera subsystem.
Multiple camera sub-devices (IFE, JPEG, BPS, IPE, etc.) share
CAM_CC_CAMNOC_AXI_CLK. Direct clk_set_rate() calls from each consumer
cause a last-writer-wins race. This series introduces a lightweight ICC
provider that aggregates bandwidth votes from all consumers and applies
a single clk_set_rate() call.

Changes since v1:
- dt-bindings: add all SM8250 CAMNOC master port IDs to qcom,camnoc.h
  (IFE 0/1, IFE Lite 0-4, BPS, IPE 0/1, JPEG, JPEG DMA, CDM, FD, SBI,
  ICP) with a short comment per group (Dmitry Baryshkov)
- dt-bindings: add IFE simple consumer example alongside the JPEG
  OPP-based example; clarify opp-hz and opp-peak-kBps semantics in
  comments; fix maintainer email; align provider node name with DTS
- driver: register all SM8250 CAMNOC master nodes

Atanas Filipov (3):
  dt-bindings: interconnect: Add Qualcomm CAMNOC ICC binding
  interconnect: qcom: Add CAMNOC interconnect provider driver
  arm64: dts: qcom: sm8250: Add CAMNOC ICC provider node

 .../bindings/interconnect/qcom,camnoc.yaml    | 124 ++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   8 +
 drivers/interconnect/qcom/Kconfig             |  10 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/qcom-camnoc.c       | 279 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,camnoc.h    |  52 ++++
 6 files changed, 475 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,camnoc.yaml
 create mode 100644 drivers/interconnect/qcom/qcom-camnoc.c
 create mode 100644 include/dt-bindings/interconnect/qcom,camnoc.h


base-commit: 9e970952a9503d6ab471a2fea4c10b6a2785406f
-- 
2.34.1

