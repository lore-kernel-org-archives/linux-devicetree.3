Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBFC396573
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804181; cv=none; b=fUaucixjqq14nMX+PWvZUM1aEL+u7C9QM6uXcT4JkMt0TQRJgSXO1mztCGSlGy5GIt/xQu/R5Gk+IW9mldzrf48NMraWx2sYWTcaDHMjgE4dpKmD0v47R0ZPzEOiydAcplVcBaQvE8kKB3GI612f1i07iankbNGtot6w3CjsEyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804181; c=relaxed/simple;
	bh=kbRwuQ9nZ2E+SCI71TauiFrCt/9q8ASgqi1sojHFVAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAGK8gK/YCGr8tKC3d2WCMzaHGYR7Nl63eUZP1CpjLtVxTWDxH458RdiBDspip7tI0RS06vygoPd4OSA6x6GviVDTU5a6HinaqhZZ+hNLQ2Wjfdp8jD38k57B8ceDcs/j5DhG25lM4KecOtmSVaAgq4k9dEqHtjR8ApzcUbNkJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBVm7rer; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AeHC30xn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBVm7rer";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AeHC30xn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CUMQ1097910
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=; b=MBVm7rerEuLToM7e
	ga5/em54s/0gd1lSDlxQhDUh1Ssatkus5ndnU7X1jhExbUTp9TItMgFrQn8S84E/
	U+3cqZi8C1Ucx44P79ewrBdc7LlaVD9BwiLQs1E+BpkNBYZxarXBFVnHFVnBRJju
	WCxjbp18tE/EjWgopJxxpf1MKRMNHUpI9WnM9fMfrUII4XVaPEFPMZCOBtUfN/Pn
	imzPaZMBKeLZoonFy6SnwD2h8dhTnjFG0ZQPNbZRczPQRwO6449jHC1S9KS7xOGr
	EFOMr9uwJyr0OJKA49Lzh1xvkN09r0QEleaHYmOkaOv+6TTuVlsPQdoVMgr0O13N
	AC8iiQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ctepm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:22:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9b9f30d65so77922376d6.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804178; x=1783408978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=;
        b=AeHC30xnDpj+5fGe5zb9VHrhmhOTVyb1eDcKUZ8/KqeCD+KImaN3w9oGTYiHR1g1Xk
         MYbh4hGme+0LZ7MuwVXULEz2U24GdFqlE8H3a4MOKPdznZ69/yyxL2NYzTQevEneLuVO
         1ghMLk2FTuRQbALfWgtOKSGfFxDX4/c+oN9UN+8mz7G40BvfsPJPJIqZv0XW2JemExGQ
         jgkniby4AWBcIy4kaimvc1Rs1dulfFO/xr5pnL4ke3Q8JypI8CsOgKsYM3lFa83vi2lm
         tCnro7MDXMvv1bFbNyznIKl3zDme88K5ikyZMBXuVvYMZBxhPEFLUjEqUb1EJLuc7uZj
         XyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804178; x=1783408978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=;
        b=nSLSF7uDiLWPAzaGobDNYG3VAKHGg3h2uuTBQL3NCsZrjwewf69hQwYpGQsPc985+i
         VDQC9kKAmR9K5AJZSldMVp0X5B72dKkcqsoc+7C1pjKcRHzoXxN9xkSVjzw+KNzLYz+U
         7dywO5/iI5R5uD7wNrJUWNu1Kvy2PAKrkwNhGROhG/+dXG9/2D4KyxBRmtAzt4kpwizT
         zCyMFDU35KdFju4HVC9XWXZxM5ILXZ+AvO8oNtV2WCYDTGwb7gGb6MEzWbPHk3hTsN4W
         3OZIbRw/sTD8GGX/D9dkOwWh+7ZUzYhEYBvDjeJIV8pgArDJpnDgVp6ntPO8/TbsW/bE
         nPDw==
X-Forwarded-Encrypted: i=1; AFNElJ8z2qy1FDnYHzMTb8QN5jkNGfoQK9kgycL06SMuImQeHfyZUuW7z+jQl6b6jMuOv3halpd6M5n+gha/@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ4hs6VCR/ETwerPL3R2hy0IFJkwpM3Cj6NDsUT/WgUd40kCsz
	QxVsTFa9L6bsv+W8xO9+Q659MnxTkJ6XDTV55N9vEwqNM3W9A6DoL6l6wh97IstmvYAi4Cgxn0J
	bOR9EDPkxLE0xsMusRmReRCdhhcRcjkJL/JntB18TPxOKj6qRh2McJt1RAt5fhrxs
X-Gm-Gg: AfdE7clxC0s8fv2xlc/xZEiZRLK2EcZ/T4sB85iplK+c2DbtPEEZtQ00LT2P7tzYrlw
	qgUhJ4JpvgF7ISLrcSEE5/HzN6bxNSVjafRJibF7h9kNK8qp0/BsE4CSTCjbGHDFOdEa+zjtIrR
	wis1smv6qNTG4l520+UDufquwYA25Z77HBot/l+C4n8bEc0UcIcJsfsyZhGYHMHpfjn5Bk5YjNg
	V9J23dUsHcaUjouEEL2hQATEJWWT5Rv6PU9MbU5KHa8/Y8xsXcrlHRIQIgEyYRe5k8s1d4za6ag
	HBJ/e1pY6/dA4FZ7lsEuJ4Uu239FWQAFGMrO1aqZdAbmZ39IqHbEnsOjcd12TTw8e8lH7JQ98bk
	NL9sXqNX7aY8jwL4=
X-Received: by 2002:a05:620a:4805:b0:915:9de3:2260 with SMTP id af79cd13be357-92e624eab71mr446574785a.24.1782804177733;
        Tue, 30 Jun 2026 00:22:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4805:b0:915:9de3:2260 with SMTP id af79cd13be357-92e624eab71mr446571385a.24.1782804177069;
        Tue, 30 Jun 2026 00:22:57 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm4718622f8f.32.2026.06.30.00.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:22:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 10:22:40 +0300
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM and
 its EVK board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-eliza-dts-qcs-evk-v4-1-18cbbdba6e7e@oss.qualcomm.com>
References: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
In-Reply-To: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kbRwuQ9nZ2E+SCI71TauiFrCt/9q8ASgqi1sojHFVAA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ27JirRbykaTHOYvPomlIZ78PyIfVodFf25pH
 x5YjnzBW5WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakNuyQAKCRAbX0TJAJUV
 Vs/4D/0ZlWCUfm+cPt4pPTDyRi6KgEiKIJpI8UEr8oHVclYirIvSLJILLHHEmPR8ESWFOMgVcKN
 3e6VDb7MJE6nH/uu7y5LkRJpL+zgtlIH7zqYdqLXPkHPMph5G/PgJ9L+QHD7Dk3WqnpNmZa3jLF
 tP0xKCbHAAMGLOX7dPNS3yAWgBm7H/NMpuHgsiR4om6iTFrU2AT07GNsW5WQWoOjyNMl0IRZSgG
 X4sdlAut61iNrXrjBCV3xPE69rNtSAXtBR3KpQBd46XDNVhiJ2s0+XJKdBCjGkNQFTqQ57F1ByJ
 JRJqW6G8yK+P1U7IVOr322SVuP+QF4RpUrptHwxDQ7JjGDsBTMCFPEsPq8sgghVK6FxXt/bw0FT
 5pVg816ycx1xbRZ5QM4TXDLhC06wAjNTSCjFkaNv5zHHGGTCVXd07H/tVXAaEcYTOG2UdKxdjxs
 emqZfX5nohwrWFJ5eyeKuGcA1z7UeYzcYmB2mTrythj/ueeilkeOAGkMryFJiTkGlw0OzxgpTuO
 1iXQWjfuHxG/2vm8qCzbvY6HNFOQ71/oapkeqMR2LWJpErA8zA/k83ymogwWZBtUkqsTOMZu3Jo
 w35Cv21390btDN/x1YnOkWwFBw6q6TlluVEpVvQ8XdUOHjQgFT0a303UpYpVM7FACkXAalqpRjn
 TcTOish4zOf70Mw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX0AlV+lqkNq9c
 LgunT492oc1nykdX4y37oaB/JaeWEWw5j7xmrALHho7V/STbLizc5Tjr2VanrCRig11Sa6XtBwK
 0AsaI0sBh25e1dXbqjrfKuK2cCMl4HUZzxrnWSiKvna8rxC8MrifCzYbwtgiMgNigiFRU9Yx5P6
 KZzj488lB/pc8y6VLVhM6oQkOCVdttFfYRRcafRPT7aw5SangZlJZDReUhXbt50F6U/0Jji0Tk4
 I8F6MpG43GnuLy1xqIYCVVZYcTvebbTgRlBUiwlkJjhdC7HlxvPJeftxCxib8SvOeLe+sqhz54p
 +gCWzMJrylC3Kw/s1gOD+MmVRvj6W73QCoeS/kEYYNSVcwz6k45U9i+ajcoR6vlcXgMdQBN80nZ
 mGSjVZkicI4HjIDWf7BiIeavxC65XVlBXs4kkCmHO5NtelZcP7VEz0XkTJYlVFqtoVmRSXAqbD+
 b5oxzjofnZv/yy6M3XA==
X-Proofpoint-ORIG-GUID: ap1KZ5HAW3ILhamSxbdlnNUOWg615vij
X-Proofpoint-GUID: ap1KZ5HAW3ILhamSxbdlnNUOWg615vij
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a436ed2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oLJjFz4unEmQByRrzroA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX2zWgSpS+mYT5
 svnIqY3bEur4DdWzAQeMVlE1teJ3mlPIYo6Lm2G3dNsFPrbPRTAPozVfxeViq11gCE4UG1IWueP
 rzUyQrBVZRJD0YBXiGF3R+W7+FsQwcg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300063

Document the compatible strings for the Qualcomm Eliza CQS
System-on-Module (SoM) and its EVK board.

The SoM is populated with a CQ7790S Eliza variant, PMICs, LPDDR and
eMMC. The SoM is then connected to the EVK base board, which provides
a multitude of connectors for peripherals.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..bf7df33c1da8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,eliza-mtp

-- 
2.54.0

