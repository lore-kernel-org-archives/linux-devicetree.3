Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A29385527
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256071; cv=none; b=fRJLIgar96LH5tmUYyy5zMHuHj/dX1x4HRVOjRj48xd2OZwoGULFcFd/++XZGj7SFC8WdSkTkm1Y+gkX5NJD15YP4WWYDd56LJfDkyitAxCZvh+DRo56q5ZgAF6cDEWzLoqWgxpj7OQaw3C/KDIWD37QFf60O6hMWyB56h8yb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256071; c=relaxed/simple;
	bh=ypEi64pFV2glo89XxtZm2HdHHzV0uZjCSiCheKZTlHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoJAdgpjCyaQ74+Ik1/0vzO2CzNsS2CSQWgu9VRLdTHivJLJqotGF+DEZxSY6u8LMYseuqLgftnQSDQb1q2kdyeQY9GPZ29v+gv+QklXH37HE/LawEbLU/tJnEJyHV5brog/1M8sH0LlcBlak4wQ7GlgGSm5/pmP3zovCyAC2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Trg1ATVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrrcSQTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Trg1ATVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrrcSQTp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u2hG3468345
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nd8w5xBd6hNj+LCQVU2FB2kU+tfacWvd0IZ6Q3ToAHA=; b=Trg1ATViX1jTkeCe
	ORPTxOakuW3uQUr2IS5hqpGWLHkhwRvwPiZ/PAUSClerH7f3DE+lJVWKR95lNvpT
	NmRXqOTrzHqNSOfCFXLJb8Na+HmZ6M72Lc8hAISmZLnbqUYoKm77FZtDJ/Xbk1Ui
	/kisGCzupKrDyrcaOGkB8aSTBjms9lgbKKwPo3IGbyv66ZVPawaP9Ek9pDA7ZBrb
	UfMw4KV07C+dSsLPNz0HBuo4Y/idkv+2/I17IZbSGBV52poaX0DyGM1jqTEA9Pmb
	YrNjsjN2ACCVdleNzhYlxwvhoDDDOIWW9YyN1v8NENfzQFQn9Il3hzRKXq8fgt6B
	D2/2dg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgg6ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50925fed647so335530771cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256068; x=1774860868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nd8w5xBd6hNj+LCQVU2FB2kU+tfacWvd0IZ6Q3ToAHA=;
        b=SrrcSQTpDECC5npNShMpfXFdjR7XqyeRJt2N/AXS6IdWGPUDB8+wl01DPWombDTuDo
         ynBBbud9aeQXZK07fhgGF/hBsS5WhGAUlbgWBHkxxpEnVAucAiPnc1nCOjcLrhlTDowE
         8QVfIA5IVjKgDlQUqYhKILQGwUjRC0BMfKo2+oQBhZR6cYM7PveONQISb01Jl6mIkGt4
         /pFp1mb2mNQIGivn/tuoUk+dcZ4t21xiscY9UNR+LYpvorUEZH+3GXZgOWi92MM/KpZk
         c0wmOykWH+U4e7OmSYPQE/jGd63BGSJ21ilZNsE/gvdhIKdyWvBmeaL6lmi+pwDlasav
         GZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256068; x=1774860868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nd8w5xBd6hNj+LCQVU2FB2kU+tfacWvd0IZ6Q3ToAHA=;
        b=ji6MILWk1ktQUVZHCQo7hKc//UvZDKuxBaJVkQA0dS4rMy8f4E97M9n5j4Q+YyYHHZ
         K6tMlorLgsEn2/HXj4QvrKN7FlNFn1CBchoSWTV9nq9GZEhESkw4QRKw5eBZjpdsaRMm
         0WI3fcoCM+8341mpTRdsB5c3CAvlITdZPxOSQOYxY/M/2JiUERjeZCUFeiTtQNYJMBix
         n0hTmyRGTAbviVWfQdIawzNNufsJyTkvqeSTg6wJ/mCQJz+atxGqjsThi6GEyt+BfxZI
         Af6qzq9kOYn27ly1IH1onRGsmpNy49w7LTEV5QV/+ZENExjdfeXM310OI6CPxF9bpkwL
         keQg==
X-Forwarded-Encrypted: i=1; AJvYcCW/wIffcrUF8s51i12YelaCdXYkwE1mO9zQqFWNPaNvz9kGfl0rjHCl1k5SVjjECKs0Cj/Nd+/lvc57@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8IjTCByWnT/Xwt5x3EWOjp1D+vuIz1FJ2L19iBrQ8NVbSr/7
	/DtYH9KM6huvAA0Zrc0t3YF8B7zhKXmqdNCF2jm8X1eMi8zDDJJ9bxe9+6WwZLw1Zs402WxJNXK
	n3RN7vG1gQ/iwFtTTZGZh/sKVi8wh5LHDm5dTlQjzILsFrePKU6JEDNEpy2U519uA
X-Gm-Gg: ATEYQzxVi344T48cjkkxWvZ6W/geuAr/FEkLIouhughZdS4rYHP8vGOi8xfH754x+dl
	M+2q7mpkDO7D2+LsknwimkJhqfmN8VyOc3M93iaLNQPcl/c7B3zAWoK6EeC66LxTc4/NGImFTZA
	uOXOmp6Qd/Rwx92/+QovgOsTFPeTchMcpnyFO52lIdbkHa7p/054p2areRLTc/5tu2kPCcmL9Tl
	roJG7IItpDQUVLWzzFcltry4WDX51jbcXNp07KOmekAYU5zmvmwMEKamHB34YTtfhuRywTtldxQ
	BZ5HqdaEwtLiyx+WmTiqC9XHK5LYg80+AZ14g9Gza5JbVFCle3R2AXdkNyddNLPtLm46vw+8GG1
	IaQYXCaXJyBfXsCnZUXCo0Q7d/EmP8qd81kyvywe4IgMX
X-Received: by 2002:ac8:5890:0:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50b3f6a2050mr152307151cf.19.1774256068468;
        Mon, 23 Mar 2026 01:54:28 -0700 (PDT)
X-Received: by 2002:ac8:5890:0:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50b3f6a2050mr152306961cf.19.1774256068073;
        Mon, 23 Mar 2026 01:54:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:12 +0100
Subject: [PATCH v2 1/5] dt-bindings: usb: qcom,snps-dwc3: Drop stale child
 node comment
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-1-3bcd37c0a5b5@oss.qualcomm.com>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=812;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ypEi64pFV2glo89XxtZm2HdHHzV0uZjCSiCheKZTlHM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+7x5qZ7osOWOXn4XF5PTSAGBR1RBPDvLMnW
 veTAZzql6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/uwAKCRDBN2bmhouD
 199JD/oCvnbi7NKCL3GwDul/ThBxgn4z+dXPvOmUpd2ICChxlXlzO4tl5AEWNGvpzY9G+glGkhy
 GZZdERFt/+s+fT0KALJGPiFV7qtF3o6wgxiRJD9wSUlr8EeBczLx6LQBBf6MhfE2zsRqNgCKDAa
 UVTQuNGXhMd8PB3B1/j3fLcbvxt5xm7b8r8RhDlYNZODrw/JA1yGQw2Y294bPk4cgDoKf3nRDIT
 M0IYrBSkjUki3wrBiD2vwNMywCaJ8RuBJ/Sc+sw4Ok3ctz7aw2Rs8gtqTLWjo2xz5MaOvt/FmQ3
 txeUcLI9fNy97pTwoBriO99unauB2iiftGngOmL+aiE+gB5Lj4GlKgOL0bjl7PLsxrAiBcp8Mme
 k1fEUEL97Y6/O8tdEV+ziE2AjGdhzooiEmqAsqiEHmdxexyKkHmVY/XKw4w+TyzdvAGGRBUqJOI
 ZCFmCZICYICFQhK/xYgChKP5Jgn4xjBBeWapvLOfwTuCX9FgM3zifvzMUntcpnA0cjFSAQU0I1k
 qd89KjosDo13s6NcmSNIycS5cHE5b03DrrBf1H9NVnEkNqmUl5ILIQesqYSp7G2OtJJIemXumSi
 HtMpyd9g9vGPINqtU2ikftQedihAQUPgdRoMNCWd3h/1KK8JiOQvBLmcu1biutRfppXIkN5FAnr
 PHlPZNXNfNL2UHw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: nDPciT7_G-qS-VClgjPWOu820bBAG44F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfXztu+g9h7Z2nD
 vUWOD1unOpavDLeTPczdTd4GgIz9Iatf0lss1R53jVcmeUpdBSMUL5oD/3uJgn7yL2PBebYyaGp
 SJVgfw6v/Gy8lqxUxPXTLOAq3qUjzB3rFzhgemCLdn2boDaWfs/IpNVdU1Q3OTj8YtzVxhPCOfq
 LCd2+oG0hP+rz6LSX1+rKzPeKxX5uqWJuUjQDZVnfCJLlmMuEv0aWzO0LmjMz7siwSuiPfA6YXI
 VFk+B7YH2ahEo7sok6dae7s6qry32nkRre4nN9GrVpbQxWNNyBYwJKoWFJ9Kw23M1i1KqAYKTDn
 o1IIuKFOoyNqm5YPhe96g2eLU0PDur4t8eT7DZPR9J5YLmsYy6mmJ2iB/7jgSIJ4YWoStuLc411
 bAKz8bCIJswZZzW0WBsYcvkAqjso6ov7vIsxQmKJXtNdSv3b51CRVKJtW1RUb1cEVZ3wwEvvb0h
 XHm33EM3FBdXBIIyJVg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c0ffc5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OWNo7BSMJsPq8WwrYUAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: nDPciT7_G-qS-VClgjPWOu820bBAG44F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068

After moving the binding to style with combined wrapper+device (so one
node) there is no child node required.  Drop the stale comment about it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index f879e2e104c4..2b6a0939d98d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -153,8 +153,6 @@ properties:
 
   wakeup-source: true
 
-# Required child node:
-
 required:
   - compatible
   - reg

-- 
2.51.0

