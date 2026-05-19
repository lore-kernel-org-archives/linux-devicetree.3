Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015E3D3CE2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175474; cv=none; b=Z0E+rch4FRVYgN6kOja356MjlpET64CJth04AUaN9JJ0AyUxsSd/x/y5BvMjri7ulxQa0CE5ZYet+Y9rvEoMBmXBDJ41qRw27u0gCYOi1TQtFC0eFG8BjSKzt4o7CmNVOj+RJw9n0i9G5a8rCU+ZWN9m1iZET87xwig9/Ixq0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175474; c=relaxed/simple;
	bh=zUZR7DaV9Z1gqckkghR4I+LB/NET6dfTlAYiLQbReIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hGpbp1TmAAgKcBm1VVD/2pQIIiyWOtV9rvSo1h3xsNOl3VFH/xmyb2MXcwcUUet8lGciKvgPv73+KhOFlnmvuElKfsTDPFuhAGV7PNt7NUaWpzmivRpqE1gTqLG0vf7H4JezUUsCcNTOXc+IT4ug8RJDjjfVx0/HkHJNp4T4Dww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIVqtZic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIm8oqoW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIVqtZic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIm8oqoW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5xFti2438199
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgZbprcQ0e6itNT2rwaK3othW4Yy4NP2EPKOBD18VBc=; b=PIVqtZicrFvCthW5
	l4kC8+sj00JQbPYOP5F0O7E09q5yr9gJ3id5qVUMv/Mf8RKB1UL2yDdSQnUAsPak
	Zy29MOJdNUiki+k5PrvfgMIOB/W2VMNGpmRd43TF39lPM76tU51bI6IeT9vF3aLt
	qvuNgDiNKICYAbAvDkc3LaFRkx/l3wABAY18daV/DofIqmRq+SBxj45D0SfKdjGV
	WWxGdQOQAT5PE00h4grycHSeJas1zFla04NmPTlqxwmxan06m39OAtcI6KwLdkXS
	mosv8U2CFwG1JCgXLmaqfJlzh2QoP+DJsGyAeurUSb/GQNt4yCobOiFij9bMeWrW
	16qCHg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3qet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:24:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1353bfdbf99so3566316c88.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175471; x=1779780271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgZbprcQ0e6itNT2rwaK3othW4Yy4NP2EPKOBD18VBc=;
        b=WIm8oqoWoVEZu3R1BSlOKsyinIgN24CBlAJKOnnbr+DB5/y+mOHFzT1+ye9HfiIXtV
         ceS5+2x7yAsn8qvQcpVuihGAwTqSA6VtrOsCa6Hh901UFUzuYM7owTUrUnyNPYuCvb8V
         gakhB+czWwfqW6g8FGsGyd2UWdNEOW3leqRKPBsRi8El5qvSn8RcI+BMQF8Cm1p9O4oN
         8Rx8tXLdbHeMbj9ZRdazF1Fv/UIk9VHbKoRdlC62IWP78EB2OvxpCl5GJtEroBuSHhav
         xjMWmpu4CFMEDOz3/cArZHMPG1hGfEcBAWjsM6kNH38uzMYxGZflJV9KLL3Z2UUB2ryU
         wnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175471; x=1779780271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KgZbprcQ0e6itNT2rwaK3othW4Yy4NP2EPKOBD18VBc=;
        b=ioKpmHllg2GotoVhKhM4d15+7ANpZ5SrJQAHapkSsMhubWiRywuyj29cJX+4LudG+F
         Z31Ze/vjdvdDICpsS3dEOkBlF56XkBwzERxLhsLHTarOnHdF/QcE7WxsS76uypvfDPkP
         GKy2lxLap0jSZQxnK6Yf3mNBClpwDtzBkR4Gw8DdPbzj941XZLbQAruOAdz0K9U5luny
         NQRVBDSz366dtHh7tvGKb7IXEnWVGiY1nB/tqsOXuVviTKNy3oNOnu3XCoq18PemFbbL
         xyFRFaTYphSXdNOMSWz5mMANJoCk+EYIbPWvzZUBhgeOGSNcdxSIaGzXf9QG+92j1c15
         0Fuw==
X-Forwarded-Encrypted: i=1; AFNElJ97kJLNvxlrqKwssTkMEjxCGmKRQ94kexJc/bKsEFe2Tw/IXkJ0lpX9CVKvxDxhklukgrjFQ3O0W38a@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3snvpzxd+WzXdN6myBcYtHTc0FHBg3X+pUI2aMGLFXxrOZdZ
	0Hx1sSBhOf2NW48btxxE1tY6YBzXTuVjtf/gPuT1d5nfdtzdmao3NYCn+nj2eIQmAOJaQ3IfYM3
	F1tjtXbcPd26wEgZWbCVXQJx7OvLoJIVL1DOrR/pwSI3yf74pGqZoIOTbwaAFnxRj
X-Gm-Gg: Acq92OFqZspqdoFBy3HO20B6GgVPX9R4Gga/vGLd+Y+0RW3Np29eQnjksPq87zNJN01
	bJ6+mzOmkPsXUJBfjTTMztJRed3yf2skTxeDLjAXGerfAN0MNpTpQ7/i2UcOxBt52H5pDBksR/L
	aAFpg1nVhGGFT25JYzUUbYK05Xc/jiiwTq34la3Vy7krHunVLAEPeWb0eYLyvABIabpl+BYL1u6
	4WrFhO4U0aVAnrZgqFJR7bB0zjBbRsVAr6wfDbKpZhAYMB6eVrn1e0jKl1C2H1ojTZzEU6XuhlY
	7SAOHA/Q879olSoamRWjA6Boa+LanQS193Sf3I99ZjW01SFAiy+Pr7nW0u2ICI7AtDUCTM39y3d
	34nmthjPpIVasVq8WEnUrLZ9uvwuS/Px1DdSeRdO4cbPnkLMh49keTqd/ld+jrOsurpVe8dgR
X-Received: by 2002:a05:7022:40d:b0:12d:de3e:cc02 with SMTP id a92af1059eb24-13504a53ff1mr8182723c88.41.1779175470715;
        Tue, 19 May 2026 00:24:30 -0700 (PDT)
X-Received: by 2002:a05:7022:40d:b0:12d:de3e:cc02 with SMTP id a92af1059eb24-13504a53ff1mr8182706c88.41.1779175470216;
        Tue, 19 May 2026 00:24:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:22 -0700
Subject: [PATCH v6 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=967;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Z9lh+zI7bk0b+Sujah/Bvi+pWI96/tEBHS7dOgWjLWE=;
 b=q2LKoAAiPBX7FjVBywQROb2+56qKeN7S5lgvFQg41VeThz/67DPW9oOPB0J1UWkdIfNCjPk62
 AskkSQXXmi+DMaTkY5wp9b8LU+zNVkaI+p6bmyVlS/nkYNsIIhA5u3w
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c102f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hXvcgRDSK2Dw3lFIK20A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: A0cDI7ENwb0z6aqfs3CykjtlJ7Lua_74
X-Proofpoint-GUID: A0cDI7ENwb0z6aqfs3CykjtlJ7Lua_74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfXxLgRJ9AdZlHq
 oHnO+x2g06U8bAF6oMm4VCypBUo+lOSq07aY0ORfv4GPaCfxQvoRAY5Z4ppUToncbX5Y2lZwYYg
 EXC9DmDVfjAvWZjCystEG+prOMlLQWtfpyGYWba5iklEweyv/oVLYeWycd2q0H7u31wV981xfSR
 e6YWuJNoKyyYtpAxHtw8+HFl3JPyBP2sHqQLRM7fttNOlk5D/BbI2fWOq7+mBOUr3XuTK3Rg8iP
 sSJZQVqNuLF0FfLoeJdhOBNtFksbmUu8W41XYO8mhG0a0ePKOrI1Q1sNfldC91e4ncR1ORG7ong
 qzWKeTJ6LCC46uivbMqrsLZq3kXRuBNJ8bSHsL7fN5kQSGSkQMmwyqODMCedUHfsLMQ1X+YAONu
 ev3q8e/M/4kq4SdveDZ87Nl0Wn8PudWTQcJYxJFQIwNTu4sUY0n0gjoPVU0qgG4c7PmBk7WMLqS
 6kvTmAKU7GuW5V1lsVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190071

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Document SoCCP remote processor used on Hawi SoC which is fully
compatible with Kaanapali.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index ce18460a949f..d3b525ff2f5f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-soccp-pas
+              - qcom,hawi-soccp-pas
           - const: qcom,kaanapali-soccp-pas
       - enum:
           - qcom,kaanapali-soccp-pas

-- 
2.34.1

