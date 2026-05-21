Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FC33E5A15
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369499; cv=none; b=UoQ2ImGwfxJ58tyLJjz6g84y/wA6OCuN86GFto3sAwEGkj7IvpXUPBzMGlC5ZskMJD2PvYmF7WF7R3ICrnn+//mG0zCnlJBGKcFaTUvVxzmeSUTZmLbMP56/edFSiiEvVH92NSBqKoTX8J/WRBt/PZP0THrblGvyrT9Idogw0W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369499; c=relaxed/simple;
	bh=0YDjfixzRUzNZsXvICDQpY5Ug8aZ7Cv4WOB9kd2NRTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8jMSDVN2HwSA0BNjwmBFjhmm6wc/cAeEs3D4HPtCJb//l4uxIFaind6IGhZB09Eg1Y0Kh8127DE2XR4+BlPgKt9ODkOzPFIhCPibvfR/Qz2GKHizgwuu8m9W5L9hgwKVCzFLmu5iQ3T5yJBtePxlPy6HlvgJVa/8br9pO9Lzmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTioy4hU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnSiL2ql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTioy4hU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnSiL2ql"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AM563556032
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvGF2bXqo6ZRSC7J2AyuJceqO+H/uXluc3B9TCf2lc8=; b=OTioy4hU61nC3c2Y
	Jc1lRg25MruHGX8ACM7Z9ujNfmiiRV7sDVNLVf5XXI381R9k1JZF1UObosQXLHMY
	eBoMz8RnEf+xedIriOqpTk/ANRDEYb9HTC7zniX2aR04PSq0gtZFEfIllBk31eOz
	aeD0vR+U0kNUN/s5E4gBi90q/Ou+fQ1mYEJrgkTIKCkBQ/iJd8rPugDUw/x4l8aF
	K3O+DBf89WSD177ZB8T3CciPYJlek1jGwvNmRgQil3yUEhUTltdJw1s9Ffj+WYHc
	3tAH35bFVYYvAgD3TY/MxUufGMptJDxkiubvgZwII8SxCStvM/lbIYkTsVwZZLUD
	t1ghIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6mnmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso431224a12.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369497; x=1779974297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvGF2bXqo6ZRSC7J2AyuJceqO+H/uXluc3B9TCf2lc8=;
        b=jnSiL2ql1BrUVQDLnLUErK5ZlLPi9XhlH7Kydv4lbZsUHhb/G3jf0+K8iNjGhCAAM2
         dLwZsi5gjFRw/BlyxZCt3I9YXSfYaiCe6/neNU/oCsAJNhrfMEqr88tBvHDrELQ8/HUR
         tFPTD1N2NcWW1eMWdK7WEOlVrbqh9S5VpItRsTwx10GxriUtzfH/51VvBJ4T/8WPzv5w
         4uUw0K8xuVBLZP/+cKmj7jSqocURP0NHnYSz+Ql7Iz2UlIYvGBR2vCWVLA7glc2ZNYdp
         +q+mEQQY9m/kSUFZpnHQ5o3Xxlu319xEagbbDZwhek/AoaGh13WfjFgPZ18ILf/2tmgN
         kaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369497; x=1779974297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LvGF2bXqo6ZRSC7J2AyuJceqO+H/uXluc3B9TCf2lc8=;
        b=a9wz7Iw3UXuEJoi9rZaBbDyaF3u/mUHhX2fVw+gDWIebwoDsbFw2ZOWlurDu/iTHXu
         itPolF1XoOSpXb0rBFtZmcwaSLrL66+dsnfwPt31l1r6k2UrZ5QayIM621sIwiMY5/wL
         s5oZMgDbBPL7halseCOa9GdRR3zarH9u9S02n31pOhZ3eFyftaej77y4DkOZdKQrwBCK
         VFiAkrSwecVMTJTn58erudgV2qkusgPCoME0YEg/eFZKsDqUHCuk6ZT7xzjynm2CqiOf
         EB9YqKcxhRTQDFb3PnausBaFOS4BAnMbt5YA2LxR/gj4Gpyqa2jrffx3281vhvtCPjE4
         BbNg==
X-Forwarded-Encrypted: i=1; AFNElJ/NPzOmQgB+/jiEsuuEMZhP+trLVS1rxYkuGttzAky3qhN+Ea+WyJIhA533YCopjm0auxMM4mUiVYnF@vger.kernel.org
X-Gm-Message-State: AOJu0YxVk4jo9ubFNhTVpZSY42QSqWoN5fbq5w6x/1D+w0ovAaaeqVBZ
	CGXUfJBQt1SuzqTdLkZNL/e+5QJpTeKzm7kG4J2JZeptRkE4aB6MW2qw9DtM/XuCP4Ijle0vI9A
	URJ2kJq/4wbM33L6FjUyRZl2rolANTnUvCNoLEwreKgA97I4GkcC0mMnLPE2mitqU
X-Gm-Gg: Acq92OGDVVCKk4gxY0vI74aVwv9zZX0pczpZp4tuwnHAmEapID6x4L2tratUDons4iP
	4xJXlAfk/+uVfEtCkopLKq1ftm4qq/0aNiv6smgdw994QMT5f7lsdGx0oBamEwjTh9Od/dYB/wi
	muXwUxPLJire8T8T22TStaO0MBt874W+CkqQUjD9DXT1L5bQJAO+UmqzEH2wzjpg6jaA18zJIhq
	y1u25oJnZV5V5Ogb4Whd9YCmcHTysvooXbjM+0LFZEhTuDW64L3CD5NjxX9ytl7feo8ZcwwcKxw
	dd0T46oTRA+Uubouta9KMBGEWzGHLG+kfkGH6lbgIsCUZZhZk4rziyzi1FqXTL+1++mbveDfzKj
	lJJyJlG0vMuKelBcndCUsZybhYFrPl5b7Lwt2mV9C8I+8mNFBPK/99Y2nckRSJBKE8g==
X-Received: by 2002:a05:6a00:1306:b0:838:127d:a16e with SMTP id d2e1a72fcca58-8414acda8acmr3150905b3a.17.1779369497114;
        Thu, 21 May 2026 06:18:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1306:b0:838:127d:a16e with SMTP id d2e1a72fcca58-8414acda8acmr3150875b3a.17.1779369496635;
        Thu, 21 May 2026 06:18:16 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm1687731b3a.47.2026.05.21.06.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:18:16 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:47:09 +0530
Subject: [PATCH 2/5] dt-bindings: crypto: qcom,prng: Document Shikra TRNG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra_crypto_changse-v1-2-0154cc9cc0de@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0f0619 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mVMjwrqIa5QPTF8STQQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: n90Jn74cC6aLhVRhYh89h5gB5xfUfyH5
X-Proofpoint-GUID: n90Jn74cC6aLhVRhYh89h5gB5xfUfyH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfX4wbM00b4mARO
 YcpT34C9jVTmBArcNSzq7j7htYBVqFCEDmANXRKhoscmye9PSmoqx3/wLCMi4E3OlkQTBcp/p4m
 QRgET/J+WnjTB9EGEttmZ40HzXqtDL/1wQhAil6V31D54rt4hJLA9g72P7c5ovnZarfTraAtXLz
 d21p9SRN3/MhE3A0O5YRviTWeLS9XnkEbS6Dnr2XnxFp0BniixqCfgpCX0uU1vkEuO2SjqPf2It
 tpHQFqmKkjr70OkdGheUuKvRaF4eAt5GuIol4e+2aOYoFSdpscPbtWrI7V2VpwvN5WP7V7VKoCK
 Mwdq0DRS7wqhLyW/9UKATtFEvKp40mYfjA9vauN4YLriigv3ZYenqHXYE1VLAmxZrlP+qCLv+Wx
 5PyyW4UGop7ai7otawsnbSUKtLcQj8pu1EyxZ3wGOZcF5G3/UnPH3G50abVfCRWhVOmXQ4mMy9D
 zMvlLQu3RvxZETAc1mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210132

Document shikra compatible for the True Random Number Generator.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index d054cc114707..3698525d3857 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,shikra-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng

-- 
2.34.1

