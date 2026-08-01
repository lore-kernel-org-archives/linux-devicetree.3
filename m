Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3752D5A19
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593663; cv=none; b=C2vG5woGsbOJGFXsshbmf3He+gmnhP1WV6A+f6OQcLZZuA+0fe8j5LZLCOBX/Ph+pBYhKlKqNLpsQtVihY5ljKDmWx+M8HiJwDTAP2CdrF8yxqTCgUhH6btdvSgrFrQ+T5w5NxiP0cPwTaGwmjcBvXn2QRZgpuQx/F+Xh1CjlUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593663; c=relaxed/simple;
	bh=H1XGUYtUyd3naQF5ZZuFdjgNtcnlLUBHlekLIAnHQ2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FiZiZc0HhSYaKEn53c/JsqJwk4GCxMai9iwIQSvSzFyRCgnnV60Nwt1Cwu9wr5cLWYpV9lsSMzd+7tMaJj+v7ccfYlKKZxCKxvejQjncuzCaiqp0AE4i6hzLBS+buDUCSjgaU+wtYtNPh+PiS96OnyALCKoEUCRrCZys30pAzIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cghffBhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kR9WUl8q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cghffBhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kR9WUl8q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CahD23239517
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 14:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OVcAQSwuRaoO78bIyFzYtvH/FlL9Q0jkjsAlJiCzQpc=; b=cghffBhUet5CHVq/
	Hp2BFj4MnMj+S7QhQwkL835aBl2OI6/PFUXpelCRUeDktQ4MLC8wYLom9nMmS1sC
	Q+mcVIdqhX/O/JkB3tZ0NOvk73Pe6f+7JXyKyDlXgHKCZGyK1RnPYbpweLOHKOmO
	dqXLCEn2tS1zFDQiQ7ZatRfXS+bHYLZyZTFXAe7ogYXB/SaM0csLzMyEKKGQ47jx
	RCaCQdDWhQmN31wnurafxMaA0HlYP/+15ypqppYr/ztaPn0noaMv7gqSwbFVsRhK
	5oCBar241h4pKT1og88e4CSeWImWq59IChGoTy+SzcV4humcPhUiX6q6SAKo9Kx8
	vg6uMQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q512pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:14:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so2806402a91.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593659; x=1786198459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVcAQSwuRaoO78bIyFzYtvH/FlL9Q0jkjsAlJiCzQpc=;
        b=kR9WUl8q7WRtdTXmuScat20Cz35ZV+E7Fo4mHM6Szka0ZWcPsXxy3V/WVwmjeZLMNX
         5BGLCJs4TW3R0RmgkATJgreKSVuuOsonmoIedYOFzqgVCsglzVbMvb47DqnGFn5/izPL
         7aCJ9pEYfUHk7RdNr7Luk2sHpDQIY7fHW6fG695gro0HCllM7sD9EDiZl5cH9G0Q0YB2
         z7SA2uUraehvuvB6k8oCnmk+h1VuVJAokT0fpgm9xjgUcDfdwc9NJ6YosqGxS0L7vKNB
         UoCWg9O/3ZMD7w++018BTsy0NeBEok+/mFlLIeD3NvgQSDCcGypByoq9FUbF5BS2FWi8
         LvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593659; x=1786198459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVcAQSwuRaoO78bIyFzYtvH/FlL9Q0jkjsAlJiCzQpc=;
        b=W/pVCaJQ70+hwpnXl/PWF313TTKeZo+vDppxT+DpJsXOF/pWb9t7r6OS44tCmhdXM2
         FRuz/7QojuGu/zIJqwQ/GN2QUJcvCoIi95cohja1pCxi3UpVO8xqoz3FNczOLXMohsTU
         /vKTCHRISgjsPrAqaKdWXeC4GfADkDWAkH6Of6Xot+Si2kcHPdKMdBmJYGlO3Nh6zayV
         iM2c6DzyU53s3A3HGkjG3H5pK9LtVxYBB7ZZ8vMIevpI/H8kNi+0x3XfKtK6Ohg6cWL7
         q7ixJztYwLilGHgq+Nz1u2EuoTLZL7LcukBRWJFsMCLojRKRcAAGfv65Qm6SYRtAXO8v
         mSEg==
X-Forwarded-Encrypted: i=1; AHgh+RpojRVd3H975A0L33eF81pSWJektHokCoy5dmxcAXHFrpCWaecrBjvO1S0mpkO4rBoyERukhz0/DNs0@vger.kernel.org
X-Gm-Message-State: AOJu0YxAbELxvUxOo8Fv5jX0WX2IXnBcqmpKNCFy3GjskhFACY+ceBwM
	htPLm1EpwjNDtddUtHp6OTPvULUJGMpj3jX4GWQeuqPDxF8+VWfZm3J4q17DvOP9uqi9GnSNoMn
	p6rbqmTn65vWYV8VC6lNoKQQXBY8d4xJmBnGLNTJ0rvp9W5Ea83hz9hZNU79q51F9S+sl25/8
X-Gm-Gg: AR+sD11qki3yXiHo4fFtu/9sZJap1Aoj7PxkgqfZl8vu7zvZ1NvGx3G/Wmyjfo2c1Xt
	lsIYT9lxkMiratjPDKWXK8+3oieY83+gMAOudCzPfWWZMGT52rOZ5BYSKQ5Xno0R7n0AFrD5aVs
	cWpPmm/G0EQkDtV2EF+FejtRQDT7btEMrXSsZUWeaoPbLZ6nwh/18nvs6w+vYqvm8y964JMYFL5
	fboN6M/sIWGg5B409ZVMnvQZB+Cwf9ZyNMAmNeww5G3vcEF9Au6p5Eki5sxtqvqbaI00c1/DHUC
	vXf9HTF2L+ipAJZDG401z9SqKefbrNU2azU2cy+5HJAaleg7Ko/hfF0e7Q2OFcDNk/yShuF0LOF
	GgonZ+ALb6IuZtnjBPusUlO4G
X-Received: by 2002:a17:90b:580f:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-38fb247446bmr5868639a91.8.1785593659533;
        Sat, 01 Aug 2026 07:14:19 -0700 (PDT)
X-Received: by 2002:a17:90b:580f:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-38fb247446bmr5868618a91.8.1785593659075;
        Sat, 01 Aug 2026 07:14:19 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:54 +0530
Subject: [PATCH v2 3/6] dt-bindings: clock: qcom: Add video clock
 controller on Nord SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-3-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX9fFxHD4FFHPu
 Q21fqHukvtWOhf5AJ26xpJ0s/p5VkOvbU8iVYhg6wm4JgDeT+VGc8grcfGPAvtSj79LEhDxo2hc
 lSdsnH6P2kFjbXW4dv7xYvKppVVGuGw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX/S9DiT1kW3H4
 mPWP2tKvW5vDxdbHOCJNJW/xFtBpua+LKns+9EykhnFK3dVPZ9s3/I4xeEiRlGRkz6Eel3QqcFw
 qR2peltxbPGR4MJPXFLzIZuOf1ijl1UQC6gLTM6kyBxYQC4O848Nz6Uydl6XC4+iGPbrhSwnvEv
 2c/N+5Uf0Z0SxR6EP6/MS4X9fOX8e4sVb5DB/l69bmXSnqrHLncO7WclIdfGo5ze7RMcDPWL+20
 yMvmBjEN41oK1YWllOXui5h6gGnkdCw7OPObFLrzVh4O/sMaEy50j2JPYE2bNB/6TLhPdshj5+o
 kq68Jnhz/8HuKOPurGxcTJnPnlXv4O8fevAOW6UXAZtveyyr1rchcgHpkblfHWJthO/+xfo/pGr
 xTruanOb2B7j0blnAje2GJjOTJTsfHa1wE7CzBR+lG7xMaV+XKNWlZUk4pYJ1U1dW2PmfLOnGva
 vqyiZamvUShXdwxeNyw==
X-Proofpoint-GUID: l1JStJ3zEGLlY-Z5_kskNZQ65PIsGEmT
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6dff3c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=b-Tosh5mKKyvZrgmVFQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: l1JStJ3zEGLlY-Z5_kskNZQ65PIsGEmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010114

Add compatible string for Nord video clock controller and the bindings
for Nord Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 1e1fec1cd7ce96f103348baf85341e775fac690a..65620a656600ff61afdfc22b6675f5a46651bd26 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,nord-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -29,6 +30,7 @@ properties:
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
+      - qcom,nord-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc

-- 
2.34.1

