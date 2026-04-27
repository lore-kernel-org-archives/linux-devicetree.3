Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE3319E819
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 02:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257337; cv=none; b=o+S1gUNkYIGOtu9qzxaX+eh6AA/GBohLvDZMSmNcCsiDR9ilMnkH93eSnsxVEjGxHYn9mTxwj/+PlvNvypibXDGN3+W7T6eBwOOhCvZqRA61xl/ZM8LWcJFsBgcX4fWuNp7oJ37mMZ+1AMqByOQkFDDGA/Jcqrlybc3yBziVhAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257337; c=relaxed/simple;
	bh=LEwR6v9bxHgbCjB8GVmFUhAjmErcJ2hWGaRLxadUSYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dbw7gfwRqJJAz0TfRAZQPz2QJjukbtOvZWNui5zInL54j5usrLkdbJssAXJZZl20AkArN3fsR5/aNw/OF/UZTrcyIgd9bGWJXCHDE9lv+tsvZFRenVELe1jcoAsbmOIIBSN136JzPtvEMRHYVbBzR/TmRoAwcLknhi3fSpTnn2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRlHMEk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ilmzrhcx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRlHMEk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ilmzrhcx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R2JxLZ051745
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 02:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBL3PHuJifY3cYYzaLEvuQzpmM9khXGOiPkutzeifcQ=; b=nRlHMEk4/E8Oe361
	dzewPlBUGZXlaR1Itc/VdLmdDHMg7B9nEkRMjFIkZolz04JZp3SCfrCfbOGNIoCT
	aGQQd9bXmWHhEFRpfX0UdH+HfXix+wcG4lE/1/L73CIrL6tHUGZrssdqaBS+5sCG
	n9lPnGpVmW7eexSb6Qj5Y3mzgegq/6S24buyWMPthr0MwhyShiucQkpdL8Tq01xS
	t0Y7mQYAliJrdSkPtkJWVv+HikqAMAc1pRjLWLU3EZLTMcNIiilFA3eszxSlTJeJ
	r9HZm6cUXiS5INgL8uBbp6cUYgVqzifSb9bWC56ok1UEGpiNMisO21uSNTcmBwzg
	EbyXGQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgux28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 02:35:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so9542807eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 19:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777257334; x=1777862134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBL3PHuJifY3cYYzaLEvuQzpmM9khXGOiPkutzeifcQ=;
        b=Ilmzrhcxker0r3VKsGEbterUg1jMj3N+k+M6qrMdlpgn8lzBVpjn63dHrE3TfttMhr
         qIl/7l5bVrdY7TZGTz7o31mjjXlUWP0CxVG1MTcevUy3NHRlZQ9eVutbzfTim8M6q4LV
         lqAS2q3Uw+dJfnNF9Z7GMa81pm0cfKTUIRsljBtgdLYa4kUWYaEfxdJzisqzydTdeZMw
         14m6FG3AN6hUicDsmdjt9oDAsUdExrVjbD8Vdv9khiIBJVaZ2kCQZMdKIe6tU0+YG9IE
         MtjMh7P9ktE58famhn25ve+aBP+dbFE0d1CsVfQCQChQSImTCUl2nptfstoTJcBuxDW9
         HnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777257334; x=1777862134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBL3PHuJifY3cYYzaLEvuQzpmM9khXGOiPkutzeifcQ=;
        b=BpfR5WSgv7vnQXJLKNaQAIRykQ3TGZp8KuAK385fnPMYUFnuM4IKAfulL6U2k76Em5
         jOD0VbpUAg6rSZ/BtKBLcf5WCtbliTePJ8M5nmO9X8JSy8dQ2foirWeo3stmyfz1R0t8
         XMkdlPQn+S82/5vrlgDwyt3oTfxm+ydcxmMa/nQzjgpg2rkO8cwcbHW5tIVfpbSfUpJv
         RangEv2WJcpZh8t21TQBUEw9myXjnKPaH2473ta1EXplt6XUuFC8FSD1rsl/IMjB4XAU
         XFV2GAOejfkQ1c4rE0r52iYn5T3Q50UeFiT4UUMi87mHc7g1DwKa3RtQ0kpm/8vHdOh2
         H2jw==
X-Forwarded-Encrypted: i=1; AFNElJ9VrgmPe8Rryn1SwtHttBHXZCvhbeL5kh4L+WWrx4SmladDe0XMK080wIILbD18DKm+Xp8LHCi9yUPH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsfsent/rr0bevJLWd2+bxc6tQkVCA4rJqT4QNxqG8FNn34FPp
	UblvGUzdwpreel7k3AxsGAkM9tN2Ilq0iLvsBiHq1n7leh5y9qvUp1/9I3cN5PRKSDeWZxIKevR
	sUGI+i3OvVkTm3ubyc/7ugHNLI6e0AsS63kaXFVKd0SHpDUeh/01JJXRhFL55htOu
X-Gm-Gg: AeBDiesCscHgo6oxEclzARIbvLB1Cxd9+UyHi+JkcgsT0NIJXvzUj42OXxG7DZaHvBA
	qnX+pFkpKNC2K6s7NRfygnZ3rO52NsY8uvX8f2/ekGGfn2Io2rOzu1BPZ5cZUc1c/pPfyCmHdJ6
	YPnYSirz/shnXI+OatPnf9+ykceG9l7Wzn1gHUSe515Sa2WaPMdOqVHOBjC0eCoBMzL1x0v0Q8E
	9tqF6MBHKILOfzVxC1jmITZupdE9yOEKjIB/ZrBMCSDIzTH5w9n9RLH8kd6sL6oBSMCLCUULnt4
	Hq86lyzdptuujuLXT5C+ujZhNthobsFJnkoZbxlHMn8yvGx+21wXzPCaoJSFLRKTmFJC8aeMsSq
	Us+BvYGUUu7LUJ31ZrWCcAEebeBs/k7FMnWI6aulrLhpoD/DXRXlfn212gCI3HWfyXVJ7uxzFRw
	ZGqDCN/vdZbk2Ctwt8
X-Received: by 2002:a05:7300:2d15:b0:2c9:ee15:a0d6 with SMTP id 5a478bee46e88-2e47901662fmr24908311eec.29.1777257334260;
        Sun, 26 Apr 2026 19:35:34 -0700 (PDT)
X-Received: by 2002:a05:7300:2d15:b0:2c9:ee15:a0d6 with SMTP id 5a478bee46e88-2e47901662fmr24908297eec.29.1777257333668;
        Sun, 26 Apr 2026 19:35:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52916316eec.8.2026.04.26.19.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:35:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Mon, 27 Apr 2026 10:34:54 +0800
Message-ID: <20260427023455.236410-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bOINOskt0iVogqwhWtjcsgRYPgpGxnSU
X-Proofpoint-ORIG-GUID: bOINOskt0iVogqwhWtjcsgRYPgpGxnSU
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69eecb76 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QgBviVkkQy8jiF2zUbIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyNiBTYWx0ZWRfX1KhDdUJhtKEn
 v6DIJw9e7rdHbtHnCVSdFAyeQ9AdGrV2GE0OlXfex5Hi62UcOINbHn7w24bf5VSUmbGbWRTAq56
 b1Z8WZE27Hc2xd5Vj+NroqokSRoI51q6aXSzoazr+ffGftJj8nTmlx5aheDn+12ff6vu/56t9j0
 EkH2J1sdJRCS8W+GKKcu1QbEavTWSLAK79oX4nCrAbtYpn2f9wwiKnJ4oEe6B2HCV/ZtpRpajfd
 BemE+kkSsv4oc+vKB9cmi3t67esI4oQXxYvhMwKsSA6zdFw2D3KMyw/TZEiLRXS9rDk11+jKGrv
 79Sb5bC51lZirETszsFtRriFk26RUv2xLosdN5zS+2hpB2E9oCoT0i8Kyd9qDx2UuuuynzWaVKE
 8CzbF8Fy21k/Ua5QtsuXxsZX0c4aDR72/8EZCJmhB9gROqjQkUgWdZYQKP0cfIqtuI7kQJfBxda
 q49DdEIIJybWrg5YnaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270026

Add compatible for SA8797P Ride which is an automotive‑grade development
board from Qualcomm.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..eac77282f86d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -302,6 +302,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,sa8797p
+          - const: qcom,nord
+
       - items:
           - enum:
               - 8dev,jalapeno
-- 
2.43.0

