Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC86388E72
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774698106; cv=none; b=lijkKHd9osRB/Jz+l/VSZugUL49+MI2MPakke4fYGfPpVy4N2BBPS/HFUAfKIWx0jc7LIWSWW4ICyuxGm6CvAKoE8dIlq4zvxXYiJEaUBtaI7TEj3rfclUevhpod1GUbI5IQYuPWmPCHzMCGGGJT0k0aZoPuHMaQeaXTFJnid/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774698106; c=relaxed/simple;
	bh=0ymMkQUBPqgf1VrLwJhR84QMoBJgVAFwu0pWiha4Oa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5RVhH3yRAH5hpG+YRCVVlCY36Ftt8GR3tkqC79izCGIWNh6i3zE69+nJaMukHTSjI+zfnTt8N0u2cOkYX76/sjAnUck34lk7Cg4aCDsCFXeZ+cYBtYcNHR2i+QafcLylpZ9EdjhZWS+5BEtvJ1jFi54R946abPdmQQks8aBMYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGoUnxZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XV6qbf9M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGoUnxZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XV6qbf9M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S2XqS22835473
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 11:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhxOp/n71iqstxBPaCr0alC0/h9v/UTbNFUu3VzHFVo=; b=NGoUnxZ/7uCpA0Kq
	SlkP+Afh7IIViijSe6IjE7ldZzLSzmf68m+8AqB/ekyKavQIKib/YPpEzw4v9H2K
	Q9R0Jj3xU9HsYaMwJsKpwyvj2afNFU4b0opnlRONPRFFLy/Bh0UM3PQq2aBOykda
	yGkERMrqWiQbHgcm+VoD1E34OC9ceuZ5WnSBbrY2jmkmN8qR5N4EQNppO9Xehx4+
	EhHEbUukRd+5LVajXaK8SmIm/SrJvHhXY/wbhcLkvxc4x6byEmRqiZPgdZuArMqi
	QXXZHmA5pg8lyc45J01o58sPuKaqes7k6vJJiKhWJapBjX+SPcQRw/06FLdPTE+W
	xLeSng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afrta4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 11:41:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3547c799b27so1181433a91.2
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774698103; x=1775302903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhxOp/n71iqstxBPaCr0alC0/h9v/UTbNFUu3VzHFVo=;
        b=XV6qbf9M4+dmbwFCDL9F+abEyxfiBfExHwON0UiU9mcxzNfUsTT3PdM0VYswraQbmy
         geMWZvJT8O5PMUQKE3SwpZepzlhpRDhazamQE+4JgiiSmxQS2gwytlMW1iaPbvaiZ5e1
         kDo+jjlSRBLqiySZguJmaBaZfZtZ8NDEnDzkz8WWTVfdW6++BXakGxpDNZN3C0ivKKsi
         qnKfG2S5lENpVILg7Gy+XBgpDu+xJdsuLfnVZ4+WNvaB4me4amOLC6D2GAzj5X7UXP2+
         05mcaLZdl6tx6IpwkZnsHnQMHxsTrnYTKaMtKQLDPdg0X0vK1YGHE2qbILTpIp5fxbwu
         2Zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774698103; x=1775302903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MhxOp/n71iqstxBPaCr0alC0/h9v/UTbNFUu3VzHFVo=;
        b=OGDOTocDUzKpM4xeQBWkk/F79LiH5XWxNruccN9eA0N1Ds7b3JRdIqCVW/MQD28ot8
         WaP1uf/hGmEh8kJortHwY3npqdZ8n3ORBLZbVhZDaJkq64j2DAuvHOfFpkQcwXEPIBTq
         MdUbkn22WG7MXyJJn7tHJAcDyphg3SX3T2QJLD0yRy6EQMlWxD+l2YmacpS7gMWwhhMS
         AmaF+hlkYDzkr413MT3BZ4hY77FOuCpSmqVu7zRFdpBo85KWBGX3AxkuQcpoUquDj7MJ
         T/VTJH5JcyaMjjqgjNHmPuK6HcC3t18jVwhPG8Urxe9B6CQxbpJKQXVIqG8/YVitPS2O
         Nm5g==
X-Forwarded-Encrypted: i=1; AJvYcCXH3LaLWqEyl05xg1yConRajb0jttn/KcSconxWR/bdYiX3iBvHEGajZJLpuECtNThxZphG1FtXowfK@vger.kernel.org
X-Gm-Message-State: AOJu0YxTlyZHVPMKB8GSsEsnPgd2FAv2ssB0g1p3WwQ6Q83sUcjafYKY
	g5dBfbKT9kiwaC7NIZpWCoHxvvrEbM/IyN6pvf6lMuN03Te5f7yVLdjiYkzyJdQVn4x5B3/vfvm
	nTfebqvS4JSfTj3XTyxcwDr0qz6spdT0Wyb/Ne5IgrO5JMgIw6ImcYKWSt3kG8UwI
X-Gm-Gg: ATEYQzy6/Vm4V38IfhuzVet1pJPX7uXIJ49g7ZTJ33K37l/AK/8iOMiCssPFtP0pgy4
	7krMu+Ax/4wOHNro9I3wQrV/ZytQNpVlwuzqEb6N34sTRFUD4y2pzaN9SkS6fMbBJ2WMu2xkO1b
	Jt5qq9eW2O5z1xgD3tXg104zQrZ0dxl7YiXa9zBuO65vba2byV/H6yfWE+8GW5EnWNdDbkvGhND
	ZLcdDaKlFDKl+/3r4kUh8N1Q4HQhMwufo37AKmU8vsAHI/ytWDIn8vaR4yamj0OrU2+lOqG4yPE
	GE+UEHPPIIWsDr4We179A3uT54h6rpB3xwK3KRaebYRn+pqc3F3zywwHP5rw0Dirj5YTkPWn8G4
	KiPNw7PEZLasD3mIWgCiOkIGGfifrTSKB12B5sTDj+0dgXcvPBohq
X-Received: by 2002:a17:90a:ec87:b0:354:9dcb:1943 with SMTP id 98e67ed59e1d1-35c30143181mr3615084a91.8.1774698103152;
        Sat, 28 Mar 2026 04:41:43 -0700 (PDT)
X-Received: by 2002:a17:90a:ec87:b0:354:9dcb:1943 with SMTP id 98e67ed59e1d1-35c30143181mr3615064a91.8.1774698102725;
        Sat, 28 Mar 2026 04:41:42 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917db535sm1681238a12.30.2026.03.28.04.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 04:41:42 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 17:11:17 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
References: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
In-Reply-To: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774698095; l=772;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=0ymMkQUBPqgf1VrLwJhR84QMoBJgVAFwu0pWiha4Oa0=;
 b=Aby0fSSn5pn5k4XyffGMfBZZ1fP8hqllgghxjlndC3Eqc6n8+Y2rmmyV24Q/XynEzm+Ixrxhe
 TxEq61w1GR+CAatlISnuoY7eFv6BMil2oreJ9T8k7v0iRtjW9S5Adwe
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-ORIG-GUID: z54zl9fa_KDX2xXKiY5MXPCfzz3LAyG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA4NCBTYWx0ZWRfX3REVtd6BBEGB
 dND+HYMg1i3x1sjAcntpatSek4VJw0DmiHV02Hv60W8gUdqqf97j39VSM0BIAl29Ze0z4SKMr0g
 HZ0ki6zY3JuZLD2n/vF5iUdmEK/24I/2UugnmysheiHjscYYpYoo+O2FBrELZAhy64nHOYomgMA
 Jb0nswqGZZaEfkpmPVisAvqa0ctsCSbEohjwt107BEvmm/+byNks0rvffN14EPJ2MRUaUWj7yOz
 NHJjABj/Q0a8l39x9oSkkzlpxtbgF3iXeLiZeaqnUIwlMZ0S64gUFcSehv2FZSXdt8d2nHyiyFX
 FOPYIC5Cn+TEjAPk+EgvV4O17e/nKZrYCty909nQ7eyTg5T71sPgSvjn53v22kltH5KzeHqJE7e
 fV0dB8elQJ3Z9o4ss3Ple0cOcMMxcpSqpzkDCHt/Td0oG+t8r1d621xcDHRZQOrq+4MFAeJvf1t
 BMqPjXzRtLc1M0pu9vQ==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69c7be78 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=D8ohcI8uam9gCU2zACoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: z54zl9fa_KDX2xXKiY5MXPCfzz3LAyG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280084

Introduce new bindings for the monaco-evk-ac-sku,
an IoT board based on the QCS8300-AC variant SoC.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca880c105f3b..07053cc2ac1c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -918,6 +918,7 @@ properties:
           - enum:
               - arduino,monza
               - qcom,monaco-evk
+              - qcom,monaco-evk-ac-sku
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
 

-- 
2.34.1

