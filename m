Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC8841D11E
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692754; cv=none; b=Xh7IOVjQLLtnOL28MZ7w9WLmMNB04qa+PxsZbkIHlAABbHtN0UkvbDj8ogRcx5NWr5ATWSS1fPl+p4aIY8misvQ0RrCOJCM1HpIwT/jZHsxn29dv54iC6T5E6No4okc8nJMagO/9NOwBc7tUFparVLBfXl/rpZXx0Os19cCVj5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692754; c=relaxed/simple;
	bh=lLT782FdZyRPskpp4opbNA4IOV3INNb0OEUPXEsUiSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KyHhxgTqXUAXumCXq8QK3X41EdGh4PFygN2lB72CKSx7+a//tuUoOlA/hWVTjZoJE9wTOPPd4NbRKTEKwkc7qo6AZJilGPfvzKoTr5KzXmqH43KE9OqBnuOkuwhfaXn9SITHP+AjQO6qvm+yGs0cFaawT1wXFEeiNGOhmG9H6G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yk7TcyFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Isqemrlm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yk7TcyFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Isqemrlm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QXiE979725
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=; b=Yk7TcyFXpfXHEiYM
	OKZWAYRpq7iwBqV8Xw7er2cFPE6P/LnOQJb/1rWdgXG0punTGdfUKgL8O1Bjr90V
	JEiuciafApLfSAM/NitwRI4j1MIlcapFGQDxhnruY1q2dQ47kBROGW2jS34p6PKm
	2Ku8lRQ3Xp3xoGXR/Ki0lfbPwQmPeSPngRNk1dj4qStwtwefNDsMXKiy/M/qWUIC
	QEOblOOU1/Y9JDUUwN7bF3R1jHEk/2f52O9UtHQ67YwxjZLhHKJFZI9KdSmtBHDu
	b/AlgJR76mHiCTOxPcB+tjgoW9onz5COgRuoOI69kICnnAuEpdqy8UKo/3AF/BlN
	meNU0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea1qht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so11325865ad.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692740; x=1787297540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=;
        b=IsqemrlmQiWkybnmOflgTXVnYyZz66Pqrwx56dDWMtBtHRQRvenUH/AASRcPGnRNkc
         OWUs+REAVLmUa7bXn9Zcy2oB3L3mQ2ysXBbW/cX7iesdtDs6qC54NaRu5uP60dOifOBl
         Fma3Okd14KZA+4fgeg47PS/LSlICoSLIOAJ/ViTrqG2F3OJ6sqTUHGrOZdMKnHFH3f5S
         mDJjuHvfWaj2BCiRE3FDC0dx4si2jpVDVocBLPByvl4sIRgGAEWNE4uchAv/b7kiwkc3
         DF5N40xdT59GvylmqnBlJWCVWSqnDMb8zf0kJ5grVWWSlkE/pvD7W0La3JPD5LPa0DU/
         2esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692740; x=1787297540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=;
        b=SCV1GEWSSmXhvuDW38OIjkncLdTX3d5esXDCS9VTxqQILkBYGUE5b2NZyiOk6dAAgL
         NDnd9V58HOjyqZJLQdneeDklJhhG/IPeXGuyBYYD/PKJOHW5SisMl9rAqTpIzARR8p87
         qrI0vWDCf8XupyhvKTaHcW/QpuHnrUFfPWtfqZ9ECmycrFWTTc15DY0iLpofR37sjCJW
         Y2aOEdX6PMOV9AsAM4o/04sVIyR8d77dvnsNRthznVq6OK36H960Cp/zgtPN2kYkpby8
         OBwudRDBcpBvNjmBjOtB3TXq/8ioLnN0gm7GcsbrENg6grnyTRB4zUnhKIzR6Ys0MgK2
         M4DQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJJsz2enPrOUAjPx3SSTjpMY39ikyGKji5nsxvubcJZ8X2PNFYSZvehsA7CSyetWJAIW/3bGyRNr+g@vger.kernel.org
X-Gm-Message-State: AOJu0YzIWBRJTdVYSUrWw5JpcK+s1ACkp/EdqkU9y4EwPIXB9BlDJdnn
	3pR/6tv2hvcqOl/GTw8yQUsBK11zPPpv4DGZyQlsUl4zkA6Qxu0kT31EC7suL7x/f6A0II+nv5P
	t8uzvk0N7REdIoxm8IlcJ7yskdCbgjO7VdV4+Bfi8iDJfJ9FuZwL1pSpfUtpOuP0K
X-Gm-Gg: AR+sD13pUdpYNettgoRo9qHqmz4Esd4ZZd06auHyGT+75A8/S8+ytVVlLFIfDXl/SVY
	Ra/3l7VyznN6RCOIfz3QrmnVfXQl5yr4tvCaTaw8AlBskBmNbyzCiXfVVgFouipexxnW5xpf6Ud
	d53bTMDID/CW2uldwgMd0s1raoMEx0JT8s71gkCrSUPZKwTm0zmklcnGT4seKNExqETYAOy09gj
	IhxZkBGlkHnnIyM6V+/koxqH6dkWPFdngky0Kivya26o6xLweYN69S9AveILVHjlYo8GeXb5yR/
	ddamGEG89pWGLDTTXeHmh/XHShqdAxZ00fWaOy9hEpoKf0eNgDzWBc7qbA3+MlYjJHK2V4V+sY7
	mzLOzmsiPqUgQhclN55bowkEtjAmfW/GrJ9++/BuSVpR4v65U1c2gowjYKSmixLL1fedhiyYlIi
	0LmhECCj5FsMsYSwbWRqfTkAY=
X-Received: by 2002:a17:903:4b50:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d3b0eec2e4mr44891255ad.13.1786692740063;
        Fri, 14 Aug 2026 00:32:20 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d3b0eec2e4mr44890695ad.13.1786692739653;
        Fri, 14 Aug 2026 00:32:19 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:18 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:33 +0530
Subject: [PATCH v2 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-2-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=801;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=lLT782FdZyRPskpp4opbNA4IOV3INNb0OEUPXEsUiSs=;
 b=jDdmD78RpRBpRWF34hMwTuXF0ZnrvD+D2rjqsQjw/43sLItFVbt4tdFC24drYcgzLI/5fzvfY
 fwnnvkQ/oibBSN8xWcqibqoln9lMeEGWd+kpB6pUZSv6OpNSU6jyRXv
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7ec485 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: --TvtaJl8y-9wvkWBBRGG09mdKNqeB_N
X-Proofpoint-ORIG-GUID: --TvtaJl8y-9wvkWBBRGG09mdKNqeB_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX+ePj5FKNsIjA
 6IS13MMAJr2YtK9zE5tBXbN8dno5xRi7ccHZ1eexu/2lcvoMTjcymnXwm973kb34+7JhpGLxkbA
 kzeEP+UzDR/tN511eTsmytdONUIpXzeqQDLk2Mhgnw5/TuYJoFkd+KnVGFpnl5/YJ+JKzJOqRBm
 u8L5m0NNOR1S+8WApDV9axvgFi0J/cqf7udJgfzR57FoikjkgN8FcEwt7bTd+nRbS3svFPxuIW3
 Zzgv229p/C3E6SGkqhAryR9X9zuGjRMRGRSthYOqZFzgps1oGRAFsseqdqNkKcD38G73BOzMii9
 iwkxqW19r7v5807axIzBynddaPINtcMMHf9j0VdGk2Gm7HMD5XBKv9LRfCUHF6rVt1vwcp81YqI
 qHWzslg/XUUVZVuLSpGt4Zj42JcsvQvfMu8sNoNq9nlYw+IVCr+R19OkMzlAxZD66caOUC3btZn
 02bhSF965fX/B20X3aA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX8IC2vfs6PWtU
 guihw+j7zNR9JUsU3i6OPOOXPf/HsprmQp7Ab6q6iImBXqAFJ36MJxFMa9MrBojqwDFt3jPKNsV
 j6Htt+9/V9o0Y/wjR/vSCyS3h0Ii1Gg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the RPMh power domains for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0

