Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AFB4D797A
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553850; cv=none; b=joc5JmUljyurfIAmc3vLWv0hO2SwW+XnTKxO2qEGLJwK/zl7kceDdwYLlNlU0JTofKxxilLsjYdbYFatPjSU1jL9WljC1yn/7Z8tqKUZhxkp/rE0QV0VAvZln5fMWYKxyyseEwfKPSCj33iYN8Qozrt8rCaSjAXltp5eTMC9LlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553850; c=relaxed/simple;
	bh=jr8ZDL9Js04oomOhO0NZB0jV7LM0mrbtpIaO0j3ZEno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxWj+GHjz/LRi7ag5+xv07KycJu8ypDKLPucm+cJ8q3tpxLB5fyLyanv5aashvSSxvgyOxt8nhPptvzEQotiXsQADehx84oHdViQpRCE/igNsFzgoTPSAsYxrfs/q3j0NXE4tCsPOhX8antoOpbkhaOKHSL73/N5s/EZ6yKfrwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ek3WM/0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjNYIRBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ek3WM/0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjNYIRBt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKGKN3024038
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 13:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAM10LpmPnMFzHR+16VWEfcHy7X7Am5wp02E4jq/DiQ=; b=ek3WM/0smn6rhpRB
	jaTh5o1ZTkH+Ew8feJJMfm/t9q7zR2DieZyt0guYYIVADUXmCHi1bUorq7HLPOby
	kX487CWzFJnj/zeoQ7I7V/M06dL0qp78NkqOWx4FwnSnJAv0IH0auv/NbUeQFWZ9
	lVA3lELwfoKWc8WgEvg0YZL5n0TkwC+v9OErphtn3sGiginwRLeBGDl65+QLRX4d
	/6Vu1bkvh0pWZL7aPIeUV8vYvtazIAP15TCKWlDCjx3Zixb2DeJ37Y8oojaLrDIl
	DR0bMu7yMfPygO3pK3DXJFwBymjWpaYgGOaYF2Y5kCo3I2OXKAaDFEi/IT0eUlnr
	xdGGxQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwbtr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 13:50:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e61a48d5b7so12968525ad.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553848; x=1792158648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAM10LpmPnMFzHR+16VWEfcHy7X7Am5wp02E4jq/DiQ=;
        b=NjNYIRBtzxljYBLckGt6HUflkEOUXe+3kqE4oivZi2zG1Zoj+wqgzf+6W/J7z1feOw
         MAbSRGyCcf3sRZANO7dP2ltx/TYgNKLzyaiMMt9iDp8NNM9Zy5Dj5yir1+ORIkv/1MHK
         8HKdT6t9iyJ+doKP6ZLQUtzHxTLNpzRnt+nwrmDt6/XVFolr3YoRThDZL6LtE26VECFq
         hncARAqAP/DCtRcmRYVb+BcO+zfNUuQ9RDjR8RtTRz9huSO869Qf6M+Nmjdj3EUkcwzR
         vQ0hJ4M36chW7ASqZXkKj2Zf+IhksuQxemnynhMZ3f2o+wMZB9bVBrdDwR44vvEnnYNk
         AQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553848; x=1792158648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAM10LpmPnMFzHR+16VWEfcHy7X7Am5wp02E4jq/DiQ=;
        b=WgkpM6LkUIGi3wi0DYckpmboONrb50YpnM+QVw7+hvOUfCJq62EWCtyMmR7TnbGsgh
         6dEsucc9n8AcPEuIyPi90ZD1OgyL5ELMoGt6Bv76361+9xNBleZ7CCChcPKBcSRGbQkk
         7J7kh2NGmpocJ8SxjlpO3hb77kMtCBvy6TK4e50+OLf3kZtSuf0goEDYEPxe2+Ks8oBr
         sHZzoqo5bk4JbVRrjO04hDOMLgVRUMQJUyUqi6Xl0VPtlvop4uR9KgaAZtkJg6RveApr
         1pzCyTfW4oxsSvzv2kUGVDRaVQ2i4crjfa46IKS5xpJ4kUXTnAqqxi2uPIxVcoqIB5qH
         fttg==
X-Forwarded-Encrypted: i=1; AKwUvBxxH/tUTk9ZRYa2M00ojixEeSTmhbP+7vWoRPT8mj8foguEAOLMu9R75O/x1FMcCcypuW1+EXcucLUY@vger.kernel.org
X-Gm-Message-State: AFq9FYJPHEOoYIuuOCCQZB4K6bBijASnBj0ECKBSiwtD/zmvshLwBGRS
	WkIlG3IlujatVb57qd8A7B4Ldnr7fKcY8EaBSQEch+coHUWBhP6CRaVajfGLg8vSg0l9fN76XNG
	IOnWT98hDsMYDvp6h02JoDCi93Vjkkd/3khp8LDX2oCFtLoNuvIwQ6aUl9wI/8RpZ
X-Gm-Gg: AYBFou2GXrsu8xVWnc3TOxhEsy1mZGmeXPKcabSw0cszxZ3oHVXl5Rf8DxGmJiUeP9p
	YpHwIS5HXy19FBCRifX6xqPjWIem0Wqkj5zKoAh7Cst/e+4yKt45xeXhwqKL7mnd1LPyf6ooXta
	jW/PJsUEqTRqvku7LnPQx8HN/bV2kEGyj0rLNS0/SZsUz3eQNvA/+2N0kgiLz5YfqPHJbcnHHSs
	IlG3bBetbSfL/mmN/ROFzk8OU/dk1C3ZzRD+OpcQ6fmjmuIuDIzbkx0Ex3kvGHbBLcbHHWJ8f96
	+nSsKDYJ5XyXhNNtcdTjgwYGfsSQ4mAptESUOSTzElLqN0ArcOpMpQ6Q/+N8dXKoJgTiipucmTT
	R89C7pKaOu/HQQD0nckNc0tvBaWEzb98QwyUC/cGX6DKKS78wDiHPpawhUSVmOLBDtWCDygcwcU
	C0Jh66OwKVKxvFjmAetU6uZAAdEbqhWyrsEZA=
X-Received: by 2002:a17:902:ea0a:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2e8403c47f5mr17143165ad.4.1791553848441;
        Fri, 09 Oct 2026 06:50:48 -0700 (PDT)
X-Received: by 2002:a17:902:ea0a:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2e8403c47f5mr17143025ad.4.1791553848012;
        Fri, 09 Oct 2026 06:50:48 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422c9944sm9574135ad.64.2026.10.09.06.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:50:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 19:20:31 +0530
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-ipq9650_llcc-v1-1-572e40b18522@oss.qualcomm.com>
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
In-Reply-To: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX2bRB6g2ww2Ur
 174T9mBzjdx4tTpZxlgJNel1mLdBLhs28dpl6IKOHHt9+bkNIoIUQAKu5TuJrc7qpMm4+CLgId0
 Goc7Vb+8otnL55Ognn/wDvH5LLtStbLVVGnwuhFiSTq/5LeGhSNovp/D0uP4xemYPbgHN3a/6E8
 rurL3OyWG9S9N7bNKsQVdqwB2e/igk/T5qF/gaEf5XkfeqCS4N+VgDfxHxhtdjEWWsojXLoEA1e
 yDdp7bQ6i4nKSNuwY2Bpfl6T1Vjui+Yx5QdU9PlDs0XQbUgJGSgqMBPOURH5GZG0/t5qinDpo40
 5KQOwMIv4VDhKzHE3Mhw8+wzAKstYQqyVnKf62gZGOcHZ4gvu3UdM5ObMHQ3T9T8X8AFkXXXX58
 gQ2cNvoqXvvD1VFhRx6CHcANnkqofc+PneCv1R6eo1OfaF9Xmd+kYKAwnAgHirNSxq3XI3OTZzz
 Xe7qvOffjELIFmDafoQ==
X-Proofpoint-GUID: lUPtVRYwhp5ksdQBM4iKvyq2zw_BgbGx
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8f139 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OsHVNsnzEVu89lbPO3AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX3NzBIuSfZ4ig
 yiCWUVrkpSxwk6diYQNOQMUIqc3iFIruf5buy1g3dKQWo0kCy2+4EKk5/zsunmK4MAxlgkf6WXw
 PJjA/lfIBRkZPeCD9eI25yY6S8OMpWE=
X-Proofpoint-ORIG-GUID: lUPtVRYwhp5ksdQBM4iKvyq2zw_BgbGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090055

Document the Last Level Cache Controller on IPQ9650. Similar to IPQ5424,
IPQ9650 does not have a broadcast region, since there is only one
instance of LLCC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2141e5d4de63..3efe68b08d58 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,glymur-llcc
           - qcom,hawi-llcc
           - qcom,ipq5424-llcc
+          - qcom,ipq9650-llcc
           - qcom,kaanapali-llcc
           - qcom,nord-llcc
           - qcom,qcs615-llcc
@@ -91,6 +92,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq5424-llcc
+              - qcom,ipq9650-llcc
     then:
       properties:
         reg:

-- 
2.34.1

