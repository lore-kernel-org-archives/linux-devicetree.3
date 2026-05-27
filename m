Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5FB3F210A
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875114; cv=none; b=GpF3uzWRIWC3eciL0SYHPghHlVyS/KYdx+J+97sbRqbcepG2uMXFHATQSy3I8zP7rlkh9SvuYGqptwISR0zHeOBJWYwcynFd3CTYnW+c+9o2IN9TJGRsUlyDq8tIymJ+4PxRw/R8UxiZVd9Bt+XTLbIjLWvBNG9FPSfbTBhxehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875114; c=relaxed/simple;
	bh=Z5KLOcuo+O04wmv8KxzSxi6rZaz1FTu2qWuFBQvSiQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EChDAuGzzrly28gYW2CvCroeIq+TlWwkIfBGvU18FKyoxd4LwZO3BmmSxnkWQz7CpV/ZMq3a/Iy6cJO+WY2EP8zKkjX84jfa9H/mcwy/5DRVGyI7xUjziuMzW1QbY35QdunOF3uVDdt3adjzjSzHrY8mtLMs07AePwMFVlZBTko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=baETDlz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQ/0E3kr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="baETDlz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQ/0E3kr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mSLk2282540
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P0HxTS2O/NQ
	Q0vt6rMiUS7KU2iSEK8Prggkzl9xE1rk=; b=baETDlz69ltYeCf88Ue9Yu7+EoF
	/wJYxCjnuR/OGjp6wlaRNozb8fmYigztrzBsinmBFot0l3B6pzn3uk9ObsTESZ6g
	Escr1zCSAxKYXvUAh8LsEVxzdZHVAC/svMP2qSi/iJSnDIBb8f5cRhWsR0keXX9R
	GTAn2wMU3kzhE4ZlCKhTbIQig5P/xrDX3b2XEn1LpkNOd248MtdLD79ziqwtKUf0
	9uruI4sde6ta+xtgiYFVAZai0O7xH78CF43nVccIPpykB/EqcEWBfSfKJ40h43xT
	NFWRmLrNOfXkE11IOnl2Fs+JJY8Zx4aTa0vy5GzseK499kOe1sS4V6VTJzA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcrv2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so127521135ad.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875111; x=1780479911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0HxTS2O/NQQ0vt6rMiUS7KU2iSEK8Prggkzl9xE1rk=;
        b=HQ/0E3kr2j0WbIFqRWjkQlD8dkqM8BQVUVjtDOdTiG1eU5gfZqWigAMHBBgCewvn6v
         ya0QtCJtHrJEHD6cVMSEHXuYukOa2nPQoEMwon1yE/qKM5hXRjaMlpVrOV8Hjkh8Y72z
         OwtsYdAmx8Wjxe2X2f27SpOQHuORa1fP3mHowHQC8OrUGZLQr3wJ1OMN2nwxkS/EVUui
         W60d8trop5jybVJHK7BDTsCx/eZ5o3X/tSswkkDFpxHdGO1skFwpbghzd4X5yL+Ke5IQ
         AyqQ4ZhJAloOtSNKbLGHp/xOdG/vaiPq9OSCXx+pPo8+O1yVpxaFO7P7HHVrI5lclQFT
         1Kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875111; x=1780479911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0HxTS2O/NQQ0vt6rMiUS7KU2iSEK8Prggkzl9xE1rk=;
        b=l0v+5mAer+s2UpQXggzZsw0+4ON6E4YWDsS2u/yBZRJZhzmiQE+8yNoIC1X+0oU5n5
         jGf3VPR51kjhszDNOerXOzozFJWxD0bJGfX0JnygNAVj2E4e3PxqzlQCXNc4r5zxOVpP
         3OLBMgRXNH7WGWmz76bWSkLLOZbSdI9IRxaus9ba1tXMOv4MGnFBnBlxyg46LLkUz1fK
         KIJLG4TRobKxaQyFkCgODOKukaY7Mp1T9wABdbC/RIO7mpO7gbFupdSzag+dsGe6vGlC
         Yk0X1Xk7dKDAJ1StrUEeSY3o/6ySYRhnmOoKrH0LgP52u/oTuQ/Lqw6YlhcnzooSegxh
         K1nQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XUex09ZnXsDL7owczNYUh3SKNU8XTKICHFNRJBkgLMasHKi6/opnO1onQHqUMUoajcQrGwHTTc6c8@vger.kernel.org
X-Gm-Message-State: AOJu0YwYNJVVNazJyYbYBVlaG0nLcwVZVC9KBHDIQLHN/R3BPuxovjRp
	FnMDtYqQdAOpqzITuMMx8Dj/XqbTOEntH89iYj43oH1q9IlGOWsmGo0A5i5VqO/FCNSJRVY7wqo
	fjWvSc4b+cUGLDsusSoui/so2VliPeCJjvXgINpzDEXxAFQ6a9vRPBCFPum9J9rBV
X-Gm-Gg: Acq92OHbbIdCaY+wzgtwcBv/O9kWbjDVt7RNSYUhia9I5BxFaoAoIfalGFnxyqdSWAH
	pL1WPlCZc6JWSRauNWFNpKfHQtxanOYo2W1K8XfDQ/aShM2WT4YPkd8nUBut8hdRk+YwVTJq1Tm
	9RoTKzRDbEAuusoo94sRkM5oPZSe4plbatv8h0m9dVmjP7dYFtGVmAMvdBrTPis5Vt2NgvFhT1p
	8HT9Y3nYGnxZmBXqyYoa1Of9ElXwe5p+N47HpBJTHPyz0Pu79ABTxLdApeNUvdfKseQtVaPKxHp
	RuLpHs7NHZWXuxOAddapjf660sp2aLa7boR/dNeOesaZUAfEmkQVqAaq/QNNB/1jLr57kkSZSPT
	FGvImoMGLOVQDKOtxIMNHcy9GuNjeS5vCHFAdKrK+FeXkP2bNm70DvDYJPPI=
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr241630125ad.5.1779875110453;
        Wed, 27 May 2026 02:45:10 -0700 (PDT)
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr241629715ad.5.1779875109924;
        Wed, 27 May 2026 02:45:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 22/24] arm64: dts: qcom: milos: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:27 +0530
Message-ID: <20260527094333.2311731-23-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wqgYo0iramjROxkUK3wHYn8EfbaF41Hh
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16bd27 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=n_GZHfCU-2Mwq8LGfpIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX6ivjv+h6M4k9
 YBMlhIZ56O6aZOkQJxm9F0atARo8KYXrX/Ad+MZ5JLT32oKRDJ3kqN/w2uRcUmwHfhqbYtOzbut
 +IY2KSExwtpOZ+Pu1PRY3c8tlaTaBSqv94KZt1nNzLe0dO4tnBEYTz9R7Wt9rbnj/ttZQvALzEw
 f2MDGLQDRPFvwGK/sDpay4HJlqnJpwtj1/n2dJ4NOHpk2+pDFAQ7RzlC1qB/w632wLu386wcjSH
 Bl3BpIumcFs46Wb/czZtwQEL0pS/6VwWE9sMRPfrjrXmDxflpGaDpd4/cqqPkh9J3tpWtRoxhmO
 Yt9txlZ/lfUjLcpL/+/o2qWlIn72sUESTeXbbfTuqXnfwiqeA8VJfFuCBhOJxTTqTcx6x+yoGB1
 ELOkiH+tOcWCZq+SEtkyPUaaZTTpWDv6Jnp+rFdavTUwaKDoYpbzWafdO+GFEj3l2Bzb0F+THzL
 /8FSS/SI85TwZSKM6BQ==
X-Proofpoint-ORIG-GUID: wqgYo0iramjROxkUK3wHYn8EfbaF41Hh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on milos spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index f09b30ea96ee..4e5cd0f29ec9 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1980,7 +1980,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,milos-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 			interrupt-parent = <&intc>;
 
-- 
2.53.0

