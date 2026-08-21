Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B844428FFF6
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328592; cv=none; b=bdWVFDamsFhala8BdiFpPMOJ94jB60Zr2l1uKC/C+4SVg2tGFkx0ImMzd7ECs/Pcg98e9vTllH4hnJz/gKB3zatrK13MoyJS+HwGcvv5GrBznEp1Uu7LGycX1/+MHLINalFSRcF/APb0b4Ep3ERdMyZxQ9XB02i+/XNhQ2/cXQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328592; c=relaxed/simple;
	bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T3PmbhG+0pnnsS2lpYi7tN/oBvAlcsPVtHeBGPIHg6knH5pULyeZa0L/5JgbGJDPLqoxLIHus3oq/OHsoB4vBZdzeprtRA5bd2NdQJCyv8vsSUMzDgOUve9UrgI9evYPflb5UxZrGihRQ45q1fmK6kTxelhULfDS+/KSBVMRdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvNWmG3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuoDbA+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvNWmG3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuoDbA+k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm8mH2855920
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=HvNWmG3cGQB5SN1o
	4S3jxthaESGU+fyHigSOwfsTnZbKqpVnpCTbUecz1r5nSNMMinJgUXYolTR6o3ie
	8wT2ApfQ5/PSaP1GxDXac/14trJvUBgn9tAO7dg+OphPz6xc3jQIVWU9RdRzFIeJ
	ScK2Pz+RmxS2j1IK1IQfxdtwJTHNET+gP8z/o+9WwvZ/uyBRlg5yyMDl5RZGeNTn
	hiQjUdmKJb+cX8SYYCx3s1v+TjYuRbNCi5Fj736JNVVo6oqkrkthuws5OxUXtszV
	inVG5sRuw6mgdK9RC9i8TLgwY4HKQtOJXGnh/1YWyslE4VuCjkxDatf9JN/Dd55W
	10STMA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddjdmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2d1eb484aso1940084b6e.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328588; x=1787933388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=YuoDbA+kBGEX1SK3s2wqw5gVIWf2hmDIjuZwyQhXv89OYTxJLQrbisIWioOQCW9se6
         0SDNQerYTz+rXyuqOYjeDFxWUdVLm1mK8MyiGhytjViDjIcEb694Gl2B5EccGgUyAHMG
         jr56RcJX4njTroQW2XfKeE4ayXEYeWBjjPt55MSABCCmZJbaN6f2LD1sNYXspd/HdU0b
         k6+WXqP0zjeZrtz3eYhMPX2HVnp4zMcgPXJFV9sEGk0bgRaXgsMwkaKEVFN1REvZ6KWm
         0kQAdcxODnMMOl9D5SwNiToMIL5EmIXljFDJF6/DzyGBrGTt9809xjFsshzKNIzRbfpY
         KRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328588; x=1787933388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=ZZ48h1tuSjZcbaSK9B9CNTq2Q3LYxhlUKvWxBQ8d5Di1o4Qf0YFCTMn0UQbbKstStF
         bkGEk1RLupKzA+ofpPH1Cs/3csqxyV0iGC3sJ3lBBRn/dlML7W0L+Dv/RuQrTYuKZZYh
         m3B4VdDzo4C9VWUFvNLJLwyb3TTvJ/Znf7WoyVwn9HbAO+eF+hr9VJmmuNSLEAtUfeI2
         d3CgjXp+tu5XkXxY8d1QMiqxRTw5XFMaYgbl3pHlVPdU3f43q4Tl4u7GLs56st6T69tl
         pL/cz+hqGZtMkGILdhQupXd7LthKUdDmmOqvXwUdsiYuOAeI0BqJAowarwX5Ntf8qkUW
         alTA==
X-Forwarded-Encrypted: i=1; AHgh+Royb0Qi3/Fx6yjEp0mJsdhF6bzKQPJrvvoMiQgiBX/H5s/lsnTsiRgYFs/hnAg501SUuZKVts160KkZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzN2m3OKUX3nH8gkI0sa+zbRZRHJnzepFdtrRs0yhE62sWLwbFA
	ZB1tPFTNOQetl8CdabJug5dOJ9XL9GArC1WQgQuIIBPmNj3yEBT/Bv2UyW3/I+TfLu7AqiXPcLG
	NpzoHPIrt05vxzfxDS/dNigyoUfwCILENfxxm8HAeUjDTzQPz3kWWUqKJdkJqe1bC
X-Gm-Gg: AR+sD123Oml4+Nh5KbGd0lIiTL59wkG24VGGCFEAaPQeIKPepMJJouhpukU5JZkJ+fZ
	Y/VZeayLRRpuIeUKkIKKW3l+ZK0JLtYNDk3ZGWwV1p2MDS7OECffytwNBh5JeZRPhq+0SpPoYHn
	gtN8ej6LCe71GB5I5nefy48DOVecSGBDHWjeySvVvkcwy3lhEKqxDGfjLOC0VKOpxD2xGSwatfM
	IzFidWMeU2SsfADDfS0/TN29ly9ymjXiXxATBZ9lZCAsDSTTcPfV2ItO4eb0YIZ8PjK5ic4sq0p
	9JNznRJvGkUwXLuIdIWSzqxYVtbenrbtub2kZFHMH2IzhlJv4iwk+Qe6TJLP9lA0Gi5dMkWPcfp
	oXUBkM6JAcK1KpfbRHNhQPCyqsNRK5xxRAtLCUr9phDw/LdMuoE0QEZvbHcAMr6LN45G50nZ4et
	NmBXJ+T7UVw7IVxVyqTgjdyjs=
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078448b6e.3.1787328588583;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078344b6e.3.1787328588130;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:47 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:57 +0530
Subject: [PATCH v3 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-4-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=9IPV7eFcmcQy3YV7XduUDzVOHCb0O8TQeRqyjO8MMMACqn9sPoWMnZYcaAMUrzKUCuPu/vqFO
 PVRyy4d1nvKCgSpIwfSYSyxpTfHjH7jkE0NF+jGaoQYV7MN4Ry/ukC4
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX7VKiUXQPXHfq
 Fa0MQ02NKxRJBNDrGe/OAn9FLpuGqPbDDUwJnz+90itLkurDn6vzP2CrOL/qarSPW7A5Nd/VacU
 tGwVJ9iKIA78xQW++dXstx9ludhx/nY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX5PuLee768p/+
 UPgoKl+2yKfMdUbSX5wqoLTXgfXng8e2UAUxzgkHSQig1lpa/Q4pBA92ws9ihTBs3Tsfm1sTspg
 sNWOPP4cIRR1Ai2MYuh0MMN+DViUVumDuxrl+KzeKG5BcZzCul2r6DAmBjsHJKIFbzhvFvQjwqM
 ++mCq9IFzsPvGCYIzOuREPqc9+oJ3UdcY1aHOskOLRyLp9ASwRL9KMhzAErmO+zQDBJar37tbs2
 igqYgmgfCvPwb1CdlClLF+m5gdXlcSJ7O6VoYsuME/adeucnPfmqwOu4T304HJYpO69xttWm/ot
 D9e8945j092F6lA28D1HIeC2vrAjr4bJEqml6jdcYDm5afZKLWETqXhvy+twF4yooMTcAACodx6
 VMrX5lLgrFQ1gHGPI6cY6+K8AbuFQPdhfBdrXKHlnFwpXcg4C5xufkrFb5em7nbJnhoUbjaZzUZ
 AXATAZbC6/Idp3hLlmg==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a88784d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: 3PVfE4eEeLECIvGbORniixt5tiOqBaKY
X-Proofpoint-ORIG-GUID: 3PVfE4eEeLECIvGbORniixt5tiOqBaKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

