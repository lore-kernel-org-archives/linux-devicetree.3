Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400D42D060C
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 04:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778215941; cv=none; b=Ki+Hnw+/sj9uQxsFcjkBnGN8NzIMDUpT59qt57R4PCkMyH+MBKWsy8EAqaVE5/xODhUvLi01JZ/G8Y/+x2dHFb+bZsL6uHvuvlusaiXA8STH3oe4LHGvxsP0blYoRGmigBea0SimT9oC2ghhERNJqUS/zmnCGHjq+4ajZZazfFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778215941; c=relaxed/simple;
	bh=Qt2kstaKGrB1yY49mZjobtR/4AMzw9aIfR3UkFARmBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LwHrSrNxPZ1CTX44LFuzjRmlm9oMKjbkDGulb0rd8f58dvn0HkOfsFxqcVSh68vJfy0V38QXyntXVmErlzYTZVIpujN5z4O4YpLcodukv5HAqRdSyoU1dMRpQR8t5LnB1bVil+ti/lh//UBkYQDVpGdn9xLXedqO0g7k4v7zuqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFJWA3Up; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFnq/31o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFJWA3Up";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFnq/31o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484BZUJ2770996
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 04:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=; b=eFJWA3UpOLFMPxJ4
	Ir8qOLBkORFa/zuVlFVa3FbokTkmRKb5qv1IlGANc5z93pBG5snwJH/a7hr24Wlh
	6E1obx3RrPmkbSDhejKuGrga01HV80AtCtFhCAGv+Phu+L0hkjuOlOANNce8oWqR
	rWbRlb0YZ7c5AeRqRe9INLOyrKActikLz8xGVofebTjXrOJkWQFcCQ3Dj+LMH+0v
	kNK/pSF5bOWBygHVAF7uK3gD7H7Pl9eo9I2+WZESaZYrmf9fqisKdl2s6+lY46OG
	7DDItYB85CB8yeah9sW3+66wJ+vZs+kCbzZKlMA2X9hIRq3sQ83anYQv4E+h+oU7
	0ufEZA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5hwvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:52:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so916489a91.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 21:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778215938; x=1778820738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=hFnq/31ocPVInswoBBoHTBT1/6107Tdb5+9T9vcX1eUlM/nolJcNBBENRysg1jWXwG
         mZyi1bfz8LEEUZGDQxWLQumasR2MUR70Xp7soHZ90lXNCAjSgDVYBLDrPIlPMP0yjBsQ
         HiTXb0Z4qj+eUQmnPmjfybyZXS2FCuOtvk3gZ5MWf8JSoa/ZWgPNNdkiEOt/I5Fu0Kwv
         kVQQ2+PX2sIReylV7WPScRU2XVDWoTYOVOBalzIhg6hGR9y1kHPoldLhWD8TFpQNPbwJ
         L/5+cUyTKSjK4z8XlFOvXj77CTZC7gh6+w03NKitscnYj/QKhQunpzUYqvqJUtx1rhQk
         AW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778215938; x=1778820738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=YeCEg7ox5AtPcHUuQl3OO8b08RZoSLCE4RNV4ImGunVjvJkoRLL+qgCDFIIgYVZ9NT
         7mJFn1cJ12ZhuB7LV0Tk3IOk1VZ1rJu3A5aQ3Ia4mF2Z0sKnri1rNMwMFS8tlMuUOYIV
         PRL8qvnqTnYzdRz8kdMq1xTeXTPAGfuA/xuR8jrLQMQV1KSS0dDgX73jaixJ4xXuBl9Q
         FiL58IUzN0Jz39H5HhRdlic8NHjPFDfSwP3lGLX17bJuRbkH6GGSapi7xVkxS+nZ4EL/
         Htdu1RsPtNUk/rx676gO+HuuLwBqAoylet4eHcVwZMpZd9psojSWiBz6rJGdqWPmok+V
         fVlQ==
X-Forwarded-Encrypted: i=1; AFNElJ94bQqnzVMxV4fGffSLCrjdxBdGSNDx7pB3WeCIdl5ZASNUegKKfOEjCkIxTuoaK6BmtmI9BdWl109M@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5wWK08D7BL6uRlQGnEeIZNyXnTweRnzr46Ng85vhW2RACUCx
	KqjUxIlXwJt5ltfQ4mdAKpm4JltfonBKF4D2imoz6rXdKG5/Q+PLgWzcBXqmdwq2KS06Ub4/7By
	Y4LW817JSdECvRKjul+spl0DvcCS1foyupCFvRD+4Qs2tg57tCQX5M2PrbONdf4TP
X-Gm-Gg: Acq92OHl0T9HGMPVjQzs/p51Xl0qC/dD9FhaqsObyd4/2zYqLaImyxQZUqJvu9y0B7G
	tpgg9/j4Tlqj16kWH91YnkTX9D+L/nV2Nz2fvk++70fsoyEnoT5qtwDsR+I0YXnJEFC3rYuD82y
	ixFSq0erO1AOWG8HG5nGs1De9ByNYhhpK+6OY+6xqiVIwgodSX8DwphD2NqS9++GZLE1JmiNl8F
	U8QvPIdww+6++QtUpvVS5X8SEJj2FNGghiGJ9+4A4Nfc2jH9An1oJREEg24jr4/J+D57DWx88QI
	aTTOQVYbKgKQBbNB8de/vqwAoj/JwtzlxOZ6kca5QJXTyUYT8M6ch3K/p5I6m18aIRHS/db8CTK
	zOdjn2vwSYje/jgB40XEI+Bo/PcN5KFI0q9XKnzfTUMx3rwZdoZcA
X-Received: by 2002:a17:90a:d004:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-365acb88347mr11126699a91.25.1778215938262;
        Thu, 07 May 2026 21:52:18 -0700 (PDT)
X-Received: by 2002:a17:90a:d004:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-365acb88347mr11126674a91.25.1778215937779;
        Thu, 07 May 2026 21:52:17 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bb9c02sm556076a91.1.2026.05.07.21.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:52:17 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 08 May 2026 10:21:50 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra-gcc-rpmcc-clks-v2-1-83238ba24060@oss.qualcomm.com>
References: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
In-Reply-To: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fd6c03 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 7-7EDHH08ymFLiNd4LiiMKklxoFlD54f
X-Proofpoint-ORIG-GUID: 7-7EDHH08ymFLiNd4LiiMKklxoFlD54f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA0NSBTYWx0ZWRfX0aki9oHUJJDk
 t20P5jKHjk48qdYy/JwxcfEnsUvoHN2XUMZv5W9bufbpf2O5aiDKkeK8KZxwosDOvJohURbD23t
 IdQVXM12agK/A+YXDF/Mq6NTP1VqodQ5zGAJzwhG8l3fkd6ctui7GcX6Nru160yNMJeZjLNSBou
 T25M1hzyrjVD6+9ixaH1SzB157k9ybz1g1Blo6S0KuFe1yDqH4t5tBEXss/kpzDFjkSUWcYP/Rg
 7zxajrhuN9PmkHLg+mF/MHh+EK1pY0H4u41g2l9eXavn6Q+tLmfyIQZcd8rOtGz7fOF0JvwPzst
 8swy8MXrxfkMKU0WdluPLZq43Z3dSM109+cIt7ocP+05pIEQRT8/UvcAtDPDXN7qa0gR8zRRivI
 br96LCviZg2sAMFK/dpLVbqjEcMMaXj4rPZcDL8xC645kaFF1V50PtL1DoC5JJyTtn7rizSUDih
 HbHSlAGljNXo3yUHRWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080045

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..b8aea98b00bc22c4ab6da1e6235ad676f200b44e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,rpmcc-qcs404
           - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
+          - qcom,rpmcc-shikra
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
           - qcom,rpmcc-sm6375
@@ -126,6 +127,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1

