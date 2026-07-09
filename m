Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084633C4572
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585252; cv=none; b=nqoSgYPDFthAEdzLHoCS6wlxwzGxfmo3vP0jVq7Lxeac8W9jF6whIBC+5RMQyLTjH9N9JDtNWc2wv8KkqwIfuxG+cRvNW8pvNgqrcsoQVMCq2OQGHF1m5eLjIA5eOGsyfF3zKb27CBnEQ/T/xAMvykX4DT8wyMWekjtuSBkXwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585252; c=relaxed/simple;
	bh=hy06WEp7lakBxT8oij2blpEsCOVJABmGTMRVXzweoy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Go06GEik4+rYf9MuLxjT7kPeN7IWfbq5puBvkLQtqvcEKQSHPOrDuNeIeh5U39aOMgBV0lgR8Ya+cjY+Hj7JOkFazSbVW6Gw6aCxfwmom4mXvLPsOu8dSWQIvxtbVxZSPHHDbJgV8NOAGmykSV+AkBxFxB0KDpUTMges325iuAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ld3gzjIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeaLJRWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ld3gzjIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GeaLJRWJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960HCg749792
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LVFbsmyElM/L+CCIqiuiSwvH0ilc0S1tpfB
	Fg/GiJt8=; b=ld3gzjIRPJ/0FJjIIR23GWKMMluSPa4y9e+oshZ+jyyN1Y1Ggyd
	0aqaUo4TOr5w1Iw+xAXDSVrosTR2EmhTfbyZULw9E+PoRmyy/dHIoFLmmygKhhEf
	qST3NFELIOKHWdQeyL9pT8NyxEEDvaJU3dR5/9+lk6raC9SSOfHJuhv6RXtPdwMk
	UcQdjSDhvF2OSb34I3G1/smSLI4deRFdxKuj4YQmEkPGM9wI4YEP1Ui9kddZpycx
	z15xEZQuBmED6Jh8CyxAHyF94z88rIto58AXro8DWKjlrMAsi7izyXS7aqQeMRwk
	YjZR8gO9kVlu0H8i52Ki2n9ihbHskHGD7rw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft3mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:20:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84865f326efso80139b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783585249; x=1784190049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LVFbsmyElM/L+CCIqiuiSwvH0ilc0S1tpfBFg/GiJt8=;
        b=GeaLJRWJ6A7KIV4gMNTGDLlsIfNz0jQCM+P+HDUWJXwXMlCaXUy+NxOw2v384c9Xyf
         akJmbVl4p4zgImKVohT0BmaM7mnVgZ10W+cUkC8AX372/ZPH/GyG0Fx0N94VrL5FYcHx
         McPsz4i7OgMiCdI73QcGk//ThajIISyOjDNzEKa2FuCZNqb/We/mqdxJyT9RkI6Xu/nN
         0c0hItUu8aRkCX7HgDg6mGRpHSyo/1k8eb+7WcmgDls+nSGDx73/O4G87PXXIiTtePxi
         bD43RQ4aUNst5GIdSeOmLTjopY287WZQPAvFKhXIu6+Nhupl0JDAdJlP/X8X1lZl2seH
         kEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585249; x=1784190049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVFbsmyElM/L+CCIqiuiSwvH0ilc0S1tpfBFg/GiJt8=;
        b=juz0YDVVk0B72A9ISZ8n02odkfMkE5IL4mbCaF8z+bweb6CJyIeeGvFFITTONg7Z2F
         w2Z2szMZKrkJrGwndLAmVbQ837AB6tdu+bcmHPR0V/iE+ISMgHND4aaNvHEBUBAClX9j
         JwuI9+Ra8/XG4tAXRvw56zBrwRzgEC6TjDIRy0rQ/2sisYUiTdkk62yB9Nqu+p488wXv
         DPKvDBmMp+XySEvgHGAIkm1B+KXJzBo9UyLqqH7PHvz+v486hQ2H3P3uhRobDiG2VDfT
         E8H8m0/wOm55Tfxv4Po9XMUkdpM8D/s1wrneq0vUMvN+1XOeOOeCxacFZ0BxM01gPEDR
         C96A==
X-Forwarded-Encrypted: i=1; AHgh+RqDrrMPXuvD+negcc0TqZ2IcHMFlwJCUX1ggF6/RzpafaGgg+mkkmUopYfPKrCvMzxEKASLbWMnue/X@vger.kernel.org
X-Gm-Message-State: AOJu0YyYgdMTmRV2Pih+7c7LC+v1Kyn3TSGoG0KLz8isCCLHYShjA7xd
	5ug7hEqx5aNJUx9Csy9OlptTsrl8ZkKPfJCfPehDKUtfNnL1Fu1X96gQpgNn4aFfeJnLfhyhbct
	8JRGcdp1H33YZVwJHXdSYv8E2whnrb2VygCMUKlRmqZO2uFakcUKNpM+k+LlpdAms
X-Gm-Gg: AfdE7cmXZcDEi5wtNt/FIHEOs/cAq2V3sVJGepA1SsU9g/aWZ/xt6kDuA2jBYSnKJAu
	dOB/YLkNT4emw+Mt1f7JV+O4HoHUiWiAHCTMk5lpIrIB80ceIGWst4+cASzf9Jm+5GKD7m6WCvR
	W8VhyFtJvj2amL69rn5+iyupAwXk16jNVhZCdoBxrcLwFCFZlWaxTXREcxxNnPsO0rykqeGc0r/
	9eO3YDqET9yO+fFY++E5is1NJQg2x24c+XUAkpAucpVONenzPvpCu6jGzZwIeMoa/86CSUn0ZkN
	W/bC/gRrg8Ea/jhZ0Q5Ksv272ywobT6jZInT/kDH60Gc18w0hkFx0J1Y9YFRkPat+J+Zi7Ea9jL
	HlHQvKZIRMvrLkVoDBJIEGxkigxQjWEeqq3iwV0lsLTrDJOWEu4G9Vh3DxT51p09ta2js9HA=
X-Received: by 2002:a05:6a00:399d:b0:848:31fb:43d9 with SMTP id d2e1a72fcca58-84842f9fe29mr6182874b3a.45.1783585249008;
        Thu, 09 Jul 2026 01:20:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:399d:b0:848:31fb:43d9 with SMTP id d2e1a72fcca58-84842f9fe29mr6182846b3a.45.1783585248485;
        Thu, 09 Jul 2026 01:20:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbfd41sm8323523b3a.57.2026.07.09.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:20:48 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: misc: qcom,fastrpc: Document Nord FastRPC
Date: Thu,  9 Jul 2026 16:20:40 +0800
Message-ID: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3OCBTYWx0ZWRfX6hYSV9oP5pER
 yi5dvNoXAPY+OrPc48vRHVdHffuhwbRvSEf3AazHTbIZw4wsHmixMuGAV84VkcmuPB9HtwCfara
 ubHkH8vMTJRTFgrdyi1Pf4kDZ4UMye6KjiMSQPezZAX5FMsDgWnacSLCQVte3kMH4w5EPmJSBIT
 HszHkx1X49JwgyIKTiJUFJekKHXKz7J35vzvvRW+dVobE3u3yAcN/xzJcWPY+5CMfMZPZpAOCqr
 +tabsPkAbwCQ4zlx8BpN0BAJOQV/JHWaFWq/Ij7FT61potOk/zMW3PnszLMTUuIIgwpch9vg+oo
 sM6PoGQqDjigYo2Qaqg67BWmifma54Zp9askFkYWrDSqfZMbURHh7Ekcdz4oknHxch/4zzmlgvE
 uPAOMFPqnujxgSTkSHBC7PHVkA0GTBubj89J/lQcowLrY/AkO79YxBqtwBHC46IVBRDluc2rT0V
 /l9QgcibgbLMdTBrE/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3OCBTYWx0ZWRfX+rpkosz6QgIL
 oxg1jridYEvTP4k2VyM4iYeN9xTyJxRc6ptyTvtDg90ptuzcZWmPoh56XsRMy+E9d5FMRUkH8BM
 8NVX9RALxgf+OdCtUhOH52ShqYXm+wc=
X-Proofpoint-ORIG-GUID: rg_4B3aNpJPiulbuRGvuNf0IrP53wnM5
X-Proofpoint-GUID: rg_4B3aNpJPiulbuRGvuNf0IrP53wnM5
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f59e1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=v9Ym3Pauzs3pF5Qw1NMA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090078

Add compatible for Qualcomm Nord FastRPC which is compatible with
Kaanapali FastRPC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 2876fdd7c6e6..24fc0752c11a 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,glymur-fastrpc
               - qcom,hawi-fastrpc
+              - qcom,nord-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:
-- 
2.43.0

