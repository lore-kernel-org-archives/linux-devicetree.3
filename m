Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E8537E2FC
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776653263; cv=none; b=cwZbEqBb4P9FN/QTZq6RQ8EugGxNbzhgpDS0yaACdHNXFzGknfBp2td2bQZWYLeEZo9t/TCG3NpWWlY9Z8pM+j8Wu+bB9+uPvbHjY3cAwTVRdsIVmDFmvbC8FjgUXK0YXepRuatlqY4zrZonEm4Qi3X6k1vdfsLiXTbByJDGJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776653263; c=relaxed/simple;
	bh=Wp3CSi18xegvgEKWF9WH9BY5lqobEMM49cHQeJC+W1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncLIJ8AVo9trvhs4DsLnps5G2s2l8iUC4dAZE/ZQEcSwoF26J3vPVVb06ld7QpZ9W6fZi3YDaTnH8bgE7iNnEOONm3fFkqSOoRSEynMZXc1YtDgHBUV0PyPkQVKSJ7oF0TSRvaO3+Be/H/XyVhy4IgKZe2b8GL3FkyNL4dXRNqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwqbEApO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=diOumwSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwqbEApO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="diOumwSJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNKKFA2219663
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nXSJSkc7XgeF7PeZndZjSyhwT9/b3ztRPMA
	uBTEuxX0=; b=dwqbEApOdtcvUhdnQdM4E87BXYdiHtqmS+rcZAXOy2jvEWAQxGo
	vEfW5LQo0cSAZiE4VdITiiedCOE7QKNsv4aBF1BkX+Eptng+if/1R6E7bTaIFk+W
	Eya4s6qke1kUZz4+YISSTCbaII3KoQtT1IZOwgC6W0mKaWstl2vcbPsmWju8VowC
	bAT5ERMynjdBv5PTfh7YhkJ/wAm1mgFFD3NfcbleQ+FcXkaotQETPoCQxV4yv5f+
	Sa4yVZAHIJd3tCeiJEYYgstVDSBnYrEIVKn71OYba7HotVrG2/6Gn+6UOfEO9C+R
	wTd/kf/cobz/6gXcQzOOQCdCL94WxcOn0Zw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fuskk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:47:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1275c6fc58aso3376881c88.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776653260; x=1777258060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXSJSkc7XgeF7PeZndZjSyhwT9/b3ztRPMAuBTEuxX0=;
        b=diOumwSJhVlHTL7PqGeTKxuva0WJ2FvsdbopYq2raJHU5hCqfvFAMY86KVtLMOwM9Z
         tc0YO3fOV4gCoj5KJCWoIYLeJX6n2FY5u19YXnnRGN+Vr9suSB2PkYJq9DoymqH/yxMA
         Lfcye6DW7uu5L2bPZPHqDCV/fSb1Qbrch8fmPNojaaAFVW1dG91EJv68crbbdGQZeuuu
         Mc7pBCD8LRhQxqCPgd8H2/eyi+vBlDzyiLru7/Hur0IaUSxw3X6Wa0yPvqk/EBlcxnLf
         gyGdcV5DAZ3c71BhAcyMkLm5TZSKJYBKBxUJ3WXVfDWpRx1WSDve6dGJB7kf1Y0ORYIR
         hYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776653260; x=1777258060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXSJSkc7XgeF7PeZndZjSyhwT9/b3ztRPMAuBTEuxX0=;
        b=k9CKc4yCvvhDEOZEmwXQiKO2rbgCrx//dlg9rev5OcadTD1B0CdqRV0PirK/dErV0+
         YTCZwyGO2pkv7J5wUGl1u1kSS6LUyakUqR9yvQaCf8zT7sdQj8iNWKn1IPDrYbHT20lw
         2b2KeQI9zuyGJZYSbi9mfA9YU9KIx/Rip5j+S0CGGIa2o3gJkrzwls2vM/hzrTramDcE
         hWdKA98JxlSB+PpRQ3F7vou/U3pyquUYrcDULTwAwtPNdvUpBPeiORlbV07HKia0ozh0
         G+CXX9t8wODPmgS944jky9quaJPYKgJpSN90cUyJRcMA41e6taNz/D0rGkWevnCPkLy5
         9HEA==
X-Forwarded-Encrypted: i=1; AFNElJ8s721g5L7kGEsENa3Vxnv+gLaOUN7SRYcivBCYGJxVH2l5jlM4bS4RmfF0/2/Iz2Mm7RanAHPK6gcQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRf7BEV1JipOz2+GzAc0i3XIRfWvJfKWAWcgiyD4E5Gx0GZKgC
	dqDP22wPtA9ukv9VoiKsiVWPosUMb1LjIbeMz6RNnI0MC8CkQAwiJpn4rH0vqCW0OFzB9skbdm2
	SYOdrgiFGdvF5q2zahL1S1fBUTFkVmR7oierN7pVP0wwSZRTekRXFUZ0snLAI3bEj
X-Gm-Gg: AeBDievjAwc+klcKMz2BbF/WV/lKhOVa5GKVu9XLT+AY02QhJOASc6+cvekIa/icl1U
	L629LcV/crVPEXu7MaObxYABorJ6yBwBwTyX+Evk2Y03P5v6FHdxvnPsXelIlxv3rozKbCXz2EA
	P34fEcH+10mUVDmCfT1NcSFLOEe6AnjipeE8JoeB83hx1vHeCYfvuUJZHa1IfpjEgIQYirO8LTQ
	f/ACg8KHNx0qJ11rd0y/442RhGsrappUnn/w7GpvtwMKdmh5MapwyGP/zxuM5mqki6twlFVVBEC
	NWLBflj9nfBQcjPVbmuDZ2CEtKf3lSzhUTztsRrO2C9rxuiYDoul1cA27W8G+QnEPAMmRnFByrT
	/wpAmpW1DnRs++SJPuc9Yv9EAxWXECG/fXgVoHvrTDELmpp25ZxUmNgPe7c+p/OcHdw0NTRP0W4
	ixf4v0MtquwCv5U9Bi
X-Received: by 2002:a05:7022:6189:b0:12c:44a5:fb51 with SMTP id a92af1059eb24-12c73f74b2fmr5563132c88.9.1776653260388;
        Sun, 19 Apr 2026 19:47:40 -0700 (PDT)
X-Received: by 2002:a05:7022:6189:b0:12c:44a5:fb51 with SMTP id a92af1059eb24-12c73f74b2fmr5563110c88.9.1776653259844;
        Sun, 19 Apr 2026 19:47:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d9b056fsm16237815eec.29.2026.04.19.19.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:47:39 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: interrupt-controller: Document PDC for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 10:47:33 +0800
Message-ID: <20260420024733.1240249-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyNCBTYWx0ZWRfX46kpbwK/dGF0
 eTFHawMvZqvxdLo4c92lkBMi+AopjG0rDnwiO9z8yNqkMhbkoXfA83/NCGpWcnACabgHZBZlFMr
 kPzMpAQNhpLvHfxkEptbB3c4zXXru/bVkyvhP/KmJG+lpRu4sg7Wywaw9rINNlTqL9UyAMC33Ek
 ifsBvgjuFPfqXk+ad/9gVKaBdYCcCneTMZ0j5WhZ2bWIskrJvLNuSYNwyclrMB5WsoDc17ipz00
 EgXyRa2MW5Lk80EVdua1uE5veCLNbojKRO177yTIR//iWLLjcjdR/n3s2qqIFbvHDDGoCI8EYSB
 U+LLf5YtWV3O0cjCP9x+rZKAnI2sSlAtszNJ7MTW1wOK9hHC4OBe9iUMOa0oUC1IKT8wOJRd3L8
 wmOL/H8KAlnRiZWLLRQ5/GpUekwY1wF5AEla9NlqidwA576YpiXsbxKZBIkO9Ga3E8JRtHrMFRT
 jIiLUgNvG0y8z5drUeA==
X-Proofpoint-ORIG-GUID: 4ETpTPuKckPGqmNYwRXGK-wk-ATlmbLE
X-Proofpoint-GUID: 4ETpTPuKckPGqmNYwRXGK-wk-ATlmbLE
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e593cd cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=el2WdEhFk3zaF3xyUZEA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200024

Add compatible for Power Domain Controller of Qualcomm Nord SoC with
a fallback on qcom,pdc.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b4942881b9c9..07a46c5457a4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,milos-pdc
+          - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc
-- 
2.43.0

