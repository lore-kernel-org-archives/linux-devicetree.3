Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982113BB687
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004231; cv=none; b=asFr2+m9Yd78wOizJ/DmGVsq6VM1s8WroDU8a8VhO9TZ193g9eOew8/nyJ/0fw7HUIwEU2YdJwcy1w2vsuRBNU39V1bb0SlJm2MNHMfUPLpEe2L6a8cCAMmMpPc01dCa3EblmBYIrA4wFkQ6r1DlUm4bTE9sF+sSeGx36oSbgnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004231; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADXQXyNI2Pq6Radn/6lUI2JFQr7eu5yHmzYW/6cPhDd04hMaMdo9wCoFKgz0SMw6OCYoCn52WjsWunsqkfYVJEV7POdZ+iu5/w3sGJRrOrK/vMsVj6M4xszCabKW6Hx8dNmirLfdHmMsj2NRc/pH8qqzIvEP0o2tfCKGJQCpKNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Heqs84Zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vs4hAVwf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Heqs84Zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vs4hAVwf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767Tfb04063352
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=Heqs84ZxNTZOLVZ/7s1YL7I4ohU
	vrlJAoIb58bCdTdxKuHzgyBrC/wx43raXsori8DjVmBo0Aj8uB82Q4JOaI3NSRZM
	gD20XcebSEPyNqwJjaQnJ6D8xVJ3XUY9erV3C0LuzUg2O2tqEV/mGCs3m4lPuhQ3
	O7gb1azHJRryzajEfN+tovVrRJHcprolNfFnrEUJMG2gBCAIaqqdwkeyPN+jpLTX
	HhfhVIzGlKTZ654Azmi80HGrTL5u4B4TWPmB5eSuXmC4kHxDX8aLAGkLQENkSfy4
	btNpjiCJdXB8uImNY3aFJ7LMQzMHGT+jRlbG1QRHmIyTEq4FeJ+p0X5jnCA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5mcpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:17:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848d21bbb55so3417347b3a.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786004227; x=1786609027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=Vs4hAVwfVmu5c8qTspV4g+N7qL7aIOhoSGKTKcKtdjQecOdNQlAeg+uwdcAeZJXT5e
         cjc0cbY86Ns+PLgUksyF78w0z9/EscBftUMiUkEwTt+hmxugio/NdyuYUkPIfeYCudC2
         /4hcpncexq4PoUeliYrem8jnZHButuwcP4uFoTUgpEXoajeqf9d8cG1eJjcBugPwXHQc
         RvmyBK+E/9jE1OL0+WmSA8c9OFUdHPS8Wtd+00InZpMfR/Jm8Hv0teo20uwxcPVyWMDL
         dXGDBnkAr/j3VIcZKvToDEaNPkkLKNqPN05WZTylY+OZg6xtESpM8OCbCi8VD7Dr0v0u
         loZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004227; x=1786609027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=JTsVPWaM+kU8rfJzeAdwzHMQKBMx+nhS/o1+g7tgGTO2VCHxLaPerfH3j2GL6dA/ya
         QoGvkm6sivQfD3TEBNQr7rq/ruLvpRsDk+P39OSlU3ZtGCUgJs6h4g4fNbTp8xqY6EtR
         +U402yi704FB/BydzSRXR1vnAsHw5+VOwcZXnDKsX+wgwAAJ3gCiMwFWVCR+Ejt/mST8
         aMpHCiL6m8Q6+1ijsLwY4swGUqvg4hX5KBHFo0jmnN/ERC+f3Nef+ZGLVZxC6xrsQUZC
         2yxUiQUihyy0+NtMnLLA0QyjWoHCAjFo1f+0eEfj/uZOS/V7O7bIwVp4ypXwLzQZ5wy9
         oMnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUrzQZwek6zR5Qe3+MKsi9Nt+4NWx1AjVE9sJM26pSCC9ul2yrR4hMe5IHI5PQ7QsEEDIF2ckyOY66@vger.kernel.org
X-Gm-Message-State: AOJu0Yws3qU/4PLyUFbY+FWMarG4eqO63bZ9+HFrvvjqkPZLg3TslLUT
	Pi2Tll9Sv/zQ3TKqZ0aQ0jSk7FoEsK+e+G3fLkudDHm1dABk66k/KFTrjBzuKMYFiuxArs0CBcE
	7gtGJJLTh1kPLXEjRaBAkWrHF8Mr9hilFaR5gU+3vbtFhDJq5ALW7hhk9Gz2/tvs9
X-Gm-Gg: AR+sD13GAHx8kr7sF57KynZ5A0NOEsJxepFQMc9oml3uXnmXh7xmsuT2JLTAgG6wbX5
	KgoaweJiXLnBAYoIrylTH2ipO7LKjomdGblON6ePfAzqNYbt+8chUONCVbz9bH9yQliNsAWPy4L
	+/zI2DJ9oAuQ88vRKQCCPfMnzKYt0vuq7MDN13ITaHibq6z6ZNSrI2m9gw5Jf4gyUZwxLwX67BZ
	CzqPibgWZF7UHmeEfrkPxDbesLA2HRsk65ekFDlPmrpAS8Py4DeIPgubSLQE4FsFUZnZ/38BpAU
	9cs8fLFED6ip/GpZplsqY3xDdGYnSKgIeGifmeqVggzJNLsrhZBoQw6gChk9G0XbBgH2MUhOvZV
	It4L3eqY4BN8Xd6alOB8jPiiQh7dBS/Ug16dwU1hA6LWsojWwBQDTyzZzLvwl
X-Received: by 2002:a05:6a00:32c4:b0:84e:2f2e:8c4f with SMTP id d2e1a72fcca58-84f2dfcf800mr15130820b3a.10.1786004227205;
        Thu, 06 Aug 2026 01:17:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c4:b0:84e:2f2e:8c4f with SMTP id d2e1a72fcca58-84f2dfcf800mr15130780b3a.10.1786004226829;
        Thu, 06 Aug 2026 01:17:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538bc9bsm921225b3a.11.2026.08.06.01.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:17:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Thu,  6 Aug 2026 16:15:52 +0800
Message-ID: <20260806081554.448531-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
References: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfXyqSsnNQDHP9F
 irfq2KZAJDMnOHbYgjMBBwuLofBNL8v5XCbZNKrI8GTuxySOEmYzbhLm0EMTXO2MyFbUc35+dnz
 qI6vQHxeo393RvV+H/y0AcHR1JvmFYEBDUBIChZVW9kT4BCuBelAtA6n5EiYgHTW4NGm7M2bdrl
 27WC6cPIBtPhdcNG8TrWIr10zla2q0De6WiaNAoYEwjX92qkpIBs7oHo32I28Hrrfqv/nQAUjH6
 en7NtbeWWRZ4RAkYApA3o4crJWR9xCKgezfSgdcdjsbmfIm7Bl+5xNmRRZIP+gB7Zvgqoqa0QmL
 cpmiq9/KzUWwj499LAWRfofYfBXEYpGvnp0GbO5ZYtQkQnQynXzbaTODz9HcvfqQoGyRJ5aB/ov
 Wr0+v4v5GsyTDNkmssGbSEfyLDM5aj/W9QUsyKnVXh/GqLOcxKywyyTkvLjHhyA1PZ8KNhkrGUt
 TlwchFIbaLpoclL7Bvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfX4JvE+5NAV6rx
 gcBHsQ2yy4CRQlZXcfi+NEzFQawkrSQ8BK5HephoTqveUefPiHV9n41sbCTLFXbJPRBBiXlWOsY
 zlEf5aNMXYD+uraxBrp7ONmWbzsZ2fc=
X-Proofpoint-GUID: mHkWK4R60F_ycL-3PIb02ZbGnrgXEIu7
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=6a744303 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: mHkWK4R60F_ycL-3PIb02ZbGnrgXEIu7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060063

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

