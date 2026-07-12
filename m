Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3986A3403EF
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870133; cv=none; b=F93vIja6hKG0aRVjmGMsg/c7Y4uf83Mwpt1dnMtyYmY+OKJNZ6q1FtNNRq5oL7APx2sJ+AkKSvFdPzL7RRifltvVDCwxC4BNJ6J6W+uxM/9VTOOVLNwugsZ14zJqpdvw3A5/IUMF1xidt1AQuPI8xzDMBjx6kUX/MN9FO+tjvSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870133; c=relaxed/simple;
	bh=n32F+WQzySrIX5iVbHz5HeXrQoNod4+w3vtYMUcs8Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u6r4X9TmSxushIGYvjT0JefEfr0vNIDZfgSsPNCObbtugepwjRIt8DLd1NllCLe1UzldlzjovD7qy42A5cxRhMvAC2+6FkgcCXIt2DG47WKnDPoSFR96suFAOgqck1oJ/zOa2mvr6vSyIGJCirflVjDEXYMI5yel1ZAOBVDXFnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ut3y5NeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2lI6y3Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ut3y5NeA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2lI6y3Q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZZ9v2748476
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=; b=Ut3y5NeAF0rGYtcj
	hchYAZL7FKat53pHpzAmjyELB8/90R2RsyYUcO4GOhabKssk3yrNZfBxMrExpHPq
	yy9BtsuApFRBTijlp8qecrq78jxbQGnbIJGuMPsrCi7AzexQqYPu3+5fsTSGBip6
	IRwaUNbb9eiTxevoBBSzfRLEUFCXU47MGTrG9Uu65/1y3a03hyw6RTvx28UNI/w7
	Pqp0vBj88HXCaBW/NRFAs8asvBkvdC3/2gv5iSXdViYOp/VY9EAlgwLENg7B6tkt
	uEYVyg4v6rmETEDpVhtZeuNaSqj8jHUgA2lX4IOfqK7rnmPwVRRwiLGExE1vONkF
	A6S9KQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vb066-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso5314766a12.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870130; x=1784474930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=;
        b=P2lI6y3QE3WS9WHgp0nyNoEAyaGvvhayvkpZxQ3OZnrm1Knbv1BYudp79gQKxVfiiB
         Pv5ExXNnhTaSFYYew6JOeUCzVdHGFdpM8TEJfyMPOVh4jenvfYWRK2AUr/AsY40xAMeW
         l6Gr1FWyTQM9Kp675HpbfnDQeHojzbx9MEKvpEYoVuX8QaKFj8rR9TKs3x/DkHqE2cPe
         1uqQwe3rgWMIPOfFY4a8bO/GEuzPZsD6PpXGytPlu/wY0yuAKMFMsX0p4C4FLPsxelz+
         HdDANN0Xi8lYiqKo0Z91tF3+WtHGr1Re8nlbpu13Btz2MQEGT80o9pzb+aqeSf84AEuN
         xvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870130; x=1784474930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=;
        b=qb1qtW/rfM04MLu8QjSryMgOgZH7/DZndhJCDGUqEdtF1jyPpbbIP5tfNSNtPlBIye
         sYUFlGuA9CS7aGhp4qsERnzX9DStoyYn7fL9yhmtPSB80Ab1Ng3eQKaWQlEjO0QtLkXp
         NCEkT+ibhKobHWAqtJkd0PqXUdzQGAYjFf8DNXMGYQwf2H2KDL2XlHuWKSi0i9PTyIeA
         ILuEwBOVyBhQS20FffVWG3+kiyBwhWh5/Ohb0IfeSywxAxGmj26xuKTxROvd3gX7/noC
         7QRfVG+yK4iiFak8VnUPK9uigyGzS3lLx8L90+N0zp/pHYIPiRxYYm+wjFkWEH6uo0K+
         VItg==
X-Forwarded-Encrypted: i=1; AHgh+RoTYnyNJKeERUi2DAk5P/e1SWcxbBez9797sef6HTZvf8PERoPi839UFUXmYIXxVlMJNtH8aw8LaZGy@vger.kernel.org
X-Gm-Message-State: AOJu0YxGlxlzIU9KUIfiHiR0ZC42KUZIGZYAlTXXUamoCQ4TSdmwr8u0
	x1wALdptlqK9e82J+pweY++VrNDke/GJIITAT0N5AP9foHpq7Rwj+TLTXhWzhr2tL9CoTpE9GCs
	KTtEbTdI+qSr8cBsnR/nnQM6c4wi8Cdx3Jc9RrR/7nKsp5etimQTy+4kgb3t+vxAU
X-Gm-Gg: AfdE7cltM2aR9dH979H/jOlWpdoGVLrIHvQGDHcEnCUgtQ3D2EEjjQgbZnQrtggf2cg
	y9SvuwMSFi+XfPQZZ0jl7giXX83GWDY8z4Q5EqqPzSFZrRm4kbX+vIH7xMsY8O0UDvpFn6qy0Y7
	FF0tsLt4bIZh46ETbnfm40a5gp6Uz9V6oltNU2WUSub6BrWekmGkm933xq/j5J6u13bWU7T6xZ/
	L8lVugEQJbXOHnnwZsj6y8vW7fabNs6p7cjTtQPp8wOJ0y1KS8epwimlVy2mhBPGveHyt6gZEx0
	x42efEPbbXZRp/D6yDCihmBRZTm4lEMxCK7jf636rzp8uKYUpJgMI+4e4UmCZnT5D4C6W1C7pt2
	MRmTINNmR6addDv1ryxjdC7yuGZQiDu6kUH8STEt+Lf276fgb9zltwi1rwIkpcbu+ZkNj9WNgnI
	EGv2+/
X-Received: by 2002:a05:6a21:b8c:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3c1109e29e7mr6280592637.3.1783870129863;
        Sun, 12 Jul 2026 08:28:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:b8c:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3c1109e29e7mr6280577637.3.1783870129458;
        Sun, 12 Jul 2026 08:28:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:28:48 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 20:58:34 +0530
Subject: [PATCH v6 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy
 for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-usb-shikra-phy-v6-v6-1-1b3e51bf1541@oss.qualcomm.com>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=953;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=n32F+WQzySrIX5iVbHz5HeXrQoNod4+w3vtYMUcs8Ls=;
 b=ryjiLCuO2VfGEfymQNq30j8UDQcwYsa9Y14VCb7mbDWBTsA3QglgrHbzkDluT8+b7c5oTYcUN
 QK78T+bZWRICYSYsb/V4KsCUc94iUiuVTDHjdwp4y6f9V0+KTJyC/lX
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: BlipXh_QEATS9SdJVzEuSi1YKLx4_NkL
X-Proofpoint-GUID: BlipXh_QEATS9SdJVzEuSi1YKLx4_NkL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX7ORBD+s9SAlU
 ZAR0rcmxNo8o+nCYzviv2gB10aYlCmcu60UsotPGpv+P4YcCs7p46oQ1WgJDAaNquIBMGgyUG7Y
 0rg1tqHbqaTe/jfeONiK+9BlnI1Wh6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfXxBKdWyGSA9dY
 WxBOCQzzVp1nP40/tJwKXPFr7KAzJz9OAaqmXpKpbHMZluFNq3QzV1hqiy5hzb6UUWT8FsanNEs
 P1D+uet4VEbxxOBtkRKsjYDYt17G4xiC+Y0vKPltmI4uNSxNTJU5hFyyq8BALHZZrsPbsxSOUy1
 zQx0HHDDSx2i4ojoHim+r4XJWXOG7LT4OdYsh6cWr2ofiXtYyCCxTj750ygVKM/ZgU+AdXzhCUS
 34otg+CAcFxJ2+FjSsvhCx5a27TnRizRNjU+6RIWnCdEcUWiOlzx5m9hhGDPkfWt0v8Gw8q0rTw
 SG5uSYm8FsEyEMTwLoGOO2bCpLAeTNJZemr+/AelxlVT782uBvMcjxEi2Apj6VHRT2icxwcDb3i
 lfTJaF88qU/s5FK0JHYR+wgF0MsHmA4Ph2oN2nJYZmt/tScCB49AOOOMgsRdsqw/mLaTHdCW9Uz
 14lDRUoEtVVpvV1PPLw==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a53b2b2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ybcDLLt5cEg1GZjoCqQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120165

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 449c2a7e5fec..001fd0ccc985 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:

-- 
2.34.1

