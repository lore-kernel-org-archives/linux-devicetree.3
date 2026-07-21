Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F246D556
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649086; cv=none; b=m+ttbZK+q1OUQ5OAbnTU08cH1pbNEpGI3kfpiNfbfrSmoozUl9BfzWJ7F/bxQ7sSJQAsc/+Rui++zQ9B48Ukb41rE0FEKvpE1jyL1cgf8uFKnsJtizl14ij4NeM3BP1XJ6qoq5Iie5KRuwGKj62p5Mz8Vbzkt9kR3pPZEb6C7Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649086; c=relaxed/simple;
	bh=4cF3TQ5wvUelJ7Qkr8/9ZJVA3PglAU+OktAZ5w7A6Eo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NaJDRck5ZCqQAD8DalVtm6IUi9IWy9yEtRABs1rVyZWBRIzjqgflDRQPRvTgs/sj+kwpeeMyBMthpvWFpozoh5sitN7+Bz6oSqz+N6uH7+3uJIEXFEgDJSEU4Vklitos8FCPtzaFVdIScEyYtyUX2Hpd4KTCU7XELajBWg714g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVe4flu4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuTtatfS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVe4flu4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuTtatfS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg8px1842122
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uxPDkUpxmB2xhoPU9vcQgB
	B7Ufykac9XPgXJwwzJ9q8=; b=pVe4flu4FL7TBs3fQ/dyTXhx0L1CC2svLlACnN
	AOHVPHLEzrRZV/2cqYMqt3S3ZGEfb4j3ulIo+xgRBz7Madnp7wa8i2DsymgVUiXD
	mFUpRtpVp1oKJyVCYnrjhvbTY4LE0f9yPkg0QGbdyfpHsZIb7zv1++8p/Zxh7XlQ
	SQNPhtRF/Rgc8lcaYIrAQZEU+yAnW53nepZq2F+s9172KM11d3QR7pduLyOVX1/m
	tE4/CztsBvLcjkcjpc5WF6qw8DjkWqL75pdeS7Hpi9jSOlGi0VfHllJfn16FWzIQ
	MI1UfAzUKQBGDSWiDWCn9uSVI+13kxuUStOV+q5nzqEjcjZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se34x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so310463201cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784649083; x=1785253883; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uxPDkUpxmB2xhoPU9vcQgBB7Ufykac9XPgXJwwzJ9q8=;
        b=IuTtatfSizPOq8RnjLVXjh74LTxdzLdrTEJyRviav6L9czn1xssKIFTKbU4Lp5ni0C
         66zta4mLS7LDhCPKR8gxN1i7CD81AE4sOqOlHzuTRdKJMxBn4HOi8xtXHqq1Tu9YnU3e
         oQijZtEmpkJ5fG5Y2g2BmWuVCuZh3BdTGgBKj1mV+uSJSAiB/mDx47bTgbrtuKZA9ETs
         nS/KrBf1ouJeKPPBgKnnnYNtjEaTe/Y77dhO4WQi+NNweULWVgzkk2igXcn5w7HJ9aJL
         ALJwT1kxzgBufnCX+gtkT66q8REUnu5jutmTm4wkYENeL1tu+YN6cdXyOeLQE8oQrwTU
         Ea2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649083; x=1785253883;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uxPDkUpxmB2xhoPU9vcQgBB7Ufykac9XPgXJwwzJ9q8=;
        b=n3jedskYIyfeYFfN5/GfgcaqdPfdJ8Nh56bevmz2rvX210auBQEMuN3Ll3tkLzKsGk
         TbVtPm8CttDcRXFzUdz+K9szxkJroby/eY2G8F47PUf9KInbAYPlTHQdu267gpDcbvev
         cKy0WsuC9OCqNOhP73TlY1zWmrMjJwYRNXo16NwfKIzYcoxbGPq+ZAhArwAYy1Qz4ylg
         Sjd+5jaiQ1KXUfQ9iL41+fpx25CNiYvYL3iF4oOstRGs91GDkPtEETYP8fDc5unboJi2
         ajal1xRHMtn7V+7l33XJ416vEMiqyOl86G6MOD74tNQdXbn3QnDU2DsWoQoautLvWbj5
         sxSw==
X-Forwarded-Encrypted: i=1; AHgh+RpZ9wMcoVFRFO+iZoGeBuYgOT63aLmxrdwnOVF8mRer1NpTkPt8joBBTEeNwuB+BasmQX2XV49BDs9+@vger.kernel.org
X-Gm-Message-State: AOJu0YwNab9T4bR/uqJFPInSqJsjJ7mCTEtnpbDHRc/6kLu278jqns+8
	2/m0SzsszpwU77pk69DvMiRw9Shgkgl12iedAqlOI/M43Rc2XTsBNpq66gi/OXPKYmKLov1yF4J
	iIExIvI/CEBilcKnaKHcKWc8WBkgFYrEmqwOIvyiOzEQN1YM5mNcufSI1oD6Mh4Rp
X-Gm-Gg: AfdE7cn7cHj3dwH+wLB5QGoFsbRGhy8vq73QcJvCiEA3NRknSY1tLce82LOSQdxHnxV
	/deK8AB39HHUFpCB+Wlf/Gj6Xu7QVpTl36xiN867uccBmmmkt15h1NP+9aCi94VH3j0hnJ/Vh2V
	HoSNTzCp6BmL9yOlDTlJi+3t5oKAjXeGESPqTAiSZ9c7f4G4GVGSuqGggSAzokE+hWJUuV9n9xW
	oPtFiXjXz601QOlVOL9GXDDOVfF2LQcuSGYriySOPb95IxVq6/6tiN7khCPXVE00etIgaEKSdxY
	C2azWc9ba4lniQ/L8Jt3WfgbYfcNIf5c5StjFOmEaLcDT5AfjvjfVQN8XUJUoDTTrMNFU3Ymz9C
	2JlxhaB4/x2dIFYy/qdQWT9mn
X-Received: by 2002:a05:622a:87:b0:51c:7b11:41a7 with SMTP id d75a77b69052e-5213f959efcmr181424761cf.84.1784649082782;
        Tue, 21 Jul 2026 08:51:22 -0700 (PDT)
X-Received: by 2002:a05:622a:87:b0:51c:7b11:41a7 with SMTP id d75a77b69052e-5213f959efcmr181423271cf.84.1784649080829;
        Tue, 21 Jul 2026 08:51:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de8895dsm159554075e9.4.2026.07.21.08.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:51:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] dt-bindings: arm: qcom-soc: Improve validation of
 expected SoC naming
Date: Tue, 21 Jul 2026 17:51:02 +0200
Message-Id: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NTQ6CMBAF4KuQrh3Slr/UlfcwLqAdoEZaYYBoC
 He34MKNMW4meZOX7y2McLBI7BgtbMDZkvUuhOQQMd2WrkGwJmQmucx5JhSYESrrjHUNQa99B+Q
 1uLILD0hrVRjUWSoSxYJwH7C2j10/X96ZpuqKetzIrdFaGv3w3OdnsfX+W5oFcOA8M1IZmYsST
 54o7qfyFopdHA7bBmf5IQte/CZlIEVVmFxlFUoUX8h1XV85JJOXMgEAAA==
X-Change-ID: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2129;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4cF3TQ5wvUelJ7Qkr8/9ZJVA3PglAU+OktAZ5w7A6Eo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqX5VvTXKWusoGDSlAertUZwXKP3K16QUcdNcAY
 +cLTnKfClaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal+VbwAKCRDBN2bmhouD
 18rwD/0U35Wn0KKi+lBzfVNe0IUuCGUWCk2TJYVFhuR9dBnXoGYVyb6X4p3LEyD298Zl6x3+UjV
 JFPbpfmzbMd/wXJje29UTJAQPpVY6a4m7/bm9tkAWAoyVg9kASxQ+kaP5gddJZ3iRysf5giENLK
 djrrXzDbhLQ9jIjJ9Ob21pIIcraAgY3XbBwkE0U0oY+2ki/xm9udmyN7DQSphpKRoghFNHq0G1A
 X4z0qfPtPr9sXZsaW3qJalGYsk0ggnuZ8nkLNW4bmfeSvcqd//nH75vr5egouR6xZsr3ZhFZXnY
 2nBZjw3kttFLt/i5kUK9qH1ylY24TlFP5RFCFneUWlEMCHPv49rvgR0hIaWsZU0Uqa7nUtn0gLM
 FzxgMVxilwes1XyY7679BSOBfWwQfhNRJ9VM0flLWL2PAvDYejfW/yjnDoUR4Ho/V19aYac+tCl
 iDe7zGEp9uDZbgIA2/2Y8vnjEWcYpuIYbOU/HVteZ8wyISrMQC8OCTnwLJZzUxARug1owKFybZY
 xQfJGgLpvhsj62yjsrLmv4DGo8Og1665hsmohTs/vj5Kng15IB36jjdmLQ2Wy3UQEv8NJW6edGC
 I6G0SlnMOBbqBEl8+8TUO9XR+JWdHhnTpxmIyN+KT9R3k5xVjc0xiyKsToUW/WQjFfeumIN/yRo
 /KiPXSwmR2gGP/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 50G-psY8rSLMIhpyX4-hnKjcRqe5C6GY
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f957b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LvKCfHGxsC2wBnq9YmcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfX9ZOI2nCWKq8g
 QPtavXl/C8RWV3lf0ldt0UmsewfliPyQsrTgZqOS56G7Xc1h+IrEpoMo8h89zvwQ1F1jkl6SjoG
 0iE1QsrSe9EqOS5XZnY7hai7KvAbeyM=
X-Proofpoint-GUID: 50G-psY8rSLMIhpyX4-hnKjcRqe5C6GY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfX28IVKBPHAN4e
 cxw6ZcaYAZotVJjDS+QrDcodZAoffJtclR+a76bfXRX/XRoSMoxdAVIylGLz9pfV52SC5rWFZih
 xljQiQ/2e11G3Q5G1r+H7jVIEwwtaI9r7lhN7ccG1gXs4GlQUWBoG3hqaJ64owMYJG4nyEoVXO6
 fxvl6bKgCMLnnrT662iJicF09zTMVXFDv1Ch3dnKr7c18vHOxF+Jj64MWWfwQqmlHiRFZRHl5FZ
 Z2TdHdz9iN3KvIqcVy5A1oqKytNhbJDoEJ5UD652A0cSp42b6ccWIvkFRpC7jwcyMpFqrJFlpw6
 kPGkP1pJvk3lFYTu/BKNYS2ZOlHNAOkZP+W3cfkGsP8jFHsHc2+YEBDTic4QBsZpeShKmI/e4yg
 7sgTHyeWgB9pb87+n5wYlcvYKW08LdbJkO4ha9hCYiJIMQiGhNiMXOA8mr9lHh7bE/dNsQ8155e
 9X5kPP2pGfu+II07oAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210168

Changes in v3:
- Extend qcom,[ak]pss-wdt-xxx pattern to cover also qcom,apss-wdt-x1e80100
- Extend qcom,scm-xxx pattern to cover also qcom,scm-x1e80100
- Add patterns for qcom,rpm-codename, qcom,rpmcc-codename and
  qcom,scm-codename (all used with Shikra)
- Rework patch #3 incorporating Rob's suggestions, but not dropping
  legacy-model-name compatible checks. Now use "contains" in compatible
  property schema and drop all fallbacks from previous approach.
- Tags.
- Link to v2: https://patch.msgid.link/20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com

Changes in v2:
- New patch #4 for WSA speakers
- Add qcom,usb-hsic-phy-mdm9615, qcom,usb-hsic-phy-msm8974, qcom,hamoa-crd-ec
- Add SoC codenames used: maili and nord
- Link to v1: https://patch.msgid.link/20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Improve that because questions about expected compatibles
still appear, e.g. we have
Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml with:

- qcom,pcie-x1e80100 (expected old legacy style)
- qcom,glymur-pcie (change to new style, ok fine, let's switch to new
  style... but...)

I am afraid that a new SoC will revert that back to old style, e.g.:
qcom,pcie-whatever-new-soc

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names
      dt-bindings: arm: qcom-soc: Document more of existing legacy style compatibles
      dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
      dt-bindings: arm: qcom-soc: Allow WSA88xx speaker compatible

 .../devicetree/bindings/arm/qcom-soc.yaml          | 92 +++++++++++++---------
 1 file changed, 56 insertions(+), 36 deletions(-)
---
base-commit: a2b553a6242618367923d3be0b06c311bcad2e45
change-id: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

