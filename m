Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616A3CB8F1
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369494; cv=none; b=lxlKy/bbg8c+6g9ysqyHcx2pKQR6RT5Z5kwaM2krnNRrqSJM4zB13hTv6ln36bJv1FHV5Sdiwf/Zi+/MCJbfT+5O6CBkloQoqDcd8HMDmJxHD51FuweeOnb6r90+ivDerBGoUcUmWKZ4iNMOohHV4NEHmXyScPiihehSnn4th2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369494; c=relaxed/simple;
	bh=cmb+NBPdV34mI8XyHRuMaeHAtTIUx30FJhXF5CpewcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O0mfeNP6sqoBihfjt2TZDL6x2ou5ctOzFCP9kTsASeDwJJRQub0mv2G+n8qE+mSBDM7mDuEk6XCB33r2GOQJfQnGwbcLWCsq4nAuoTq/wpK3e7l7TInLQs14o9Svmltx7k7g5PImVYPQDdS+KZ3hfZhlfvV9IstPAjKLrYMqkXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHZOZukV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfXV3Dem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHZOZukV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfXV3Dem"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAY2Rm818987
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oh56qnIxN9olLqtfYhYt0e21nfWmA+zC+Yu/IM5YCDU=; b=RHZOZukVNQtCk+vp
	9x2qqBQ6uAoDc7kMTczNp4Rzyg5ZVAQ6jgGdY87zhdVYmQFCR6zv2ngcLd2UPWYg
	bDiAQr7KT1Ys/eNCylwCIfUwvOeD0FGVkHUZggH3Q8GLOFH8mv31coOwQi3kuOE8
	w0SHUtwPmnaci/VTcnuFN94k+V25nRhWSk1FkYyX+9BVBRFUFncpDROWqcmcci5Q
	OOlLxfktyr6mfiGTdN5P5qhAS6wBu+GPStEwM6xtLjelFnQHc0hALv4lcsIzumns
	rarjbsAPf88bVDkIbHPNEvWHff8Hhbbhr38dPDUbviBPnQunXXC4B2X5xwS6ORpW
	ABwBsg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkgjp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8292e18166so3139097a12.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369492; x=1779974292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh56qnIxN9olLqtfYhYt0e21nfWmA+zC+Yu/IM5YCDU=;
        b=MfXV3DemNr3+85U41blbRf9a3UKAfWXQ05gLI0b5Enlum/SlcBrAA/8JK7AVkZ5b4+
         R8kLNEC2OSugO6zex1l6tT0M5v7IUQTYPWb82zBXC4YNsMf1hQzA70/xm7MEst59HmfD
         +36+NKKdHRlnNda1WUbAA/dhmsJhIKTv0q8LTez8ur0IfqqgeOIBp6EUtzmbJuVy9Kmk
         2JsY+QwTjtz4Oc/sGnjhK/gSlF9VZ2oUVl4z+Td2Eesh/0KWqVDbAq9m9e9+S/LzjAO4
         6ZGM0QQlpIVAtYAv3KmmsNy4WuRUtXLbDWIqSvEREg1x5BiOSx1NNsPJrKp0yfYMCp1b
         u6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369492; x=1779974292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oh56qnIxN9olLqtfYhYt0e21nfWmA+zC+Yu/IM5YCDU=;
        b=B8d6A73/B38a1N1VD5yU3DNY9M7UHCWFJRBu0n3Yn0lJTiGWEYHQog9SgsLFdf9c2E
         43zyS2vOXn7VFngj4kXsrRsRmgsV6dcrE4Lodjt4HoOJol4YDFmrx7Nf0EyB3qSfjmpc
         i+xPH8eByyeq6+agyn5soMfLkRGuD4h7nZgjGRsCTYp2R+FbIPsAsMDxSyvUV+B6X8jB
         0rS/pRRlz92DwANM7VDPaMQ3PJN19C1hvq+jAtL6+vVpwshtTrE4przIJJLAPOcNQBPB
         O52ZBt2Tkvl/PfJEeT/hEhq0dNi3/O4ldcza3X0TDi7FenEW/de9SI9we9CybVgmn1dM
         ROMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9s1TOnIiGQJArovikfGBFpEqZgQ2LdImd7QIk0n5ToLbylMF6137V8tAXws35lVH2R3RpfGI5Ycw/V@vger.kernel.org
X-Gm-Message-State: AOJu0YwiUh7tFkDWIRj+HIyOBfrSsof/OUaxhRadC9uq26opBWcw9T4d
	Ps3Sriv+D7PAJlB/stuBJtS1UZiWGM+O4qYrU7klKtr88u/t6rAjlD73i+faCpM4zpOX+mlfI8w
	pfM/oP6bW2EHdXnuEXxSUgZyHkmEiC+85VwoaT3Ny0RMdm+RMivArC7BNIOyzHTPN
X-Gm-Gg: Acq92OGyAQNhN6AYgKaREzsr6Oc2mTL9lKQfsRSYXrfgTB1Hr/mu7emF+oXpaxej3sO
	+t6oHObvOUm1KrO42V4+cbZ10WFZ9YEfMzG6HBS3SyGl7rtQkDF+bgLwtebvW0e65p32ry4Ujpt
	1YEIKM9kMKJaVQlg1QxepXo5ffK4eDRlCNpltL9B5Ru5ywhDBwACu0d77sazShh3GphTzbpCQYv
	9clAD1gL0CU2Mx9H0zLX619E81qX9Qf+wpPj0Ubz7HYGXT9OmYW10/3xdIWRjQd7+YlufgN67gD
	CPMKoSpVkkKUJfIWm37hjrnHnZKjTnYH59s3Iqob7qC+8QXH1EJlUeyFN2QEsizAo5CgGZPKLbh
	exmurKaY8qIi2MD8+U1lQUDChh9QeD8QuzGSiPz70eeptpiHewKWUqeU=
X-Received: by 2002:a05:6a00:391b:b0:835:4291:6975 with SMTP id d2e1a72fcca58-8414ae15668mr2866497b3a.39.1779369491581;
        Thu, 21 May 2026 06:18:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:391b:b0:835:4291:6975 with SMTP id d2e1a72fcca58-8414ae15668mr2866449b3a.39.1779369491072;
        Thu, 21 May 2026 06:18:11 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm1687731b3a.47.2026.05.21.06.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:18:10 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:47:08 +0530
Subject: [PATCH 1/5] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra_crypto_changse-v1-1-0154cc9cc0de@oss.qualcomm.com>
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
In-Reply-To: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMyBTYWx0ZWRfX8BJj5sjzA4dJ
 X23IsTndH0eV7B7KUNjBcvqNLM4zXNI4RYZ6LL3sE3n2tkZigvvWof4UarE1WoNNQ1Qqy8gY7nX
 Kx7KLyouS+ngEhkc021tr6gnSwTX/J7nplFmSpn/J3ZYde9noORK3wgkv7n4ZTJLJjdQbV8kn1S
 D6tiBaOQRKlf2+jlrtnNeyFya2cXbqw4LWd7L5iN9QgTZIxSwbnXLMbnDcsdUFvLlNbG3oNeFM0
 MXr6ZKJfYyjBiR4PdntMYDavfCxINJyovmseGV3I+b6dpe1GeCAwxXEjXKnSxhko64FEc6iIhp/
 F85d7tf9t6oWvqjz1hc5nxnEUVfbQfBbmDvBgqvEtGsbQ20S+yC9fBRvxG4gJw/ka4T8F9UG0+A
 M76cvusN4j7tkwopPNUxBGydZRXke+1P4fUh51vKN7bj8BAx508jrFLb/yDuXyvzaygRpI76HB0
 ref+IFHdZ8rb9EWl1YQ==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0f0614 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qMhC6LGQ_1aKn5J9HqIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: SHu2VucLtHI7BTh7Q8gwbxu_RGZaYivw
X-Proofpoint-ORIG-GUID: SHu2VucLtHI7BTh7Q8gwbxu_RGZaYivw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210133

Document the Inline Crypto Engine (ICE) on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c0b083da78bf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,shikra-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.34.1

