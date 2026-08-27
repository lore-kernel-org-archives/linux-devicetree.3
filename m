Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC7248D86B
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848720; cv=none; b=E1h+ke21gD/OJ6PqfQ44nc1f+rKkUcn1goDI+iW2T3hNEhyHr1OFflQuLVeqKwBR4AAQQJ0ZobZd/F+be8KeuVuwD66jvVWMXu9eZA+j5QjCEzrXtpskFaHisgwz8yGPQMeH6YKxZHeID2xcOBaWz8Va9BGgqHwWO3jvnchbLv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848720; c=relaxed/simple;
	bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxM0sdYYig0E+wUWFslQrL5R4Ohyjyw5bpiteY3gZZFuGrxuJRwQjFPSzLdQESbrs3ZU91t52xLAAzR0NJnc5NBcsDWy/ksaPsJw7nZynfZgYIbgXyvSIqni0bH51mt2eOREB0+CcuOdioiAc8BRCck4mU8i2WixQtbg0/q3CIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaMxRdth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaR6zClE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaMxRdth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaR6zClE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbu9t1311113
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=SaMxRdthBszwPxye
	ahAPAjCu8wN15TieayAgyNv1rpccx0g2otWevM0wh1Vxiou7v5lCf6Eji6kot0Hq
	cJfWmknf3m0iXl2a4/J4e6NkYhw76YbfNr6mkgG/psRCZcJ2v94g3pQdDNuxaTmp
	z+AaWYdFQ5aUgbtfdZUSYIQJnD+PFTNogq6Oc3lrm3pazT8fCFSodLWRN0LvQLH/
	RkhbLete0IpvHZGYV58U5iaRYVJBYMf0Cd14esQA1pio3Hr5sTjbSmFu0LhCowOG
	p9cji3oDM2wF681yaqVAhsq9GjG3rhn1XCjpbvhOhDQ8Q+/0nA45A4Eyd3enyIBZ
	xbyLmg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5kstp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:38:38 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b325074c26so219657b6e.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848717; x=1788453517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=VaR6zClEaHCksA+uzy6NQNsRFUf6nPjN5Y8iGTo19saELLW6wOQqM1BpMgfNnCZTTg
         q47qjpSIg2YzbBIzSHIr6Fn5H/hPJPRfztUnny0EUDYaW3w3GWf+m3v1svl2d6L9TSTa
         Ihit/p/ey6TSvl3OZi5bE7ZrbgazSfESfAVN2RofDY63BZKyKtabIIsUkZr2PGT8SNcQ
         /V+UpDEtXWScAhcecM64Lk7MrWgXaAzF7AjM8oGm5u7Gu+GkxvlxEEtw30BcN+3oOxvV
         piFuVFjo7WBzJgkdZB7TbNWipzQpz49gL+qcjSfkbK8Ww8TKGq156MrHl2yqWJWMUvm2
         zKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848717; x=1788453517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=VO+ziyRJm1XhlZOF6bjdJwMeRZyh2Ad1lVXytZ0eIe80J8mDMXSp0ysBECXD8E4Oix
         JmyNl9xh7lkPgnA2mQmIfsRmhhvtY9P1LGPxmCHSI5DdJfE+kKebV44dEuA/P1BWzShK
         4jRac1xOoLKgD6GOi7yAx6gVcWxR13oinFEr15UVWp3NLCrkZCw9nqigASduNe+W5BHD
         0+GtvwkHyMyNbee6aYW9EoZdZqvYUmXvfPzcFgWJ3b0HE9YoUcq1cfMah7wNIA38t8vK
         ZIvD2rGunsk5G75B89ROrC4AFLOq+asB5hkXZOhYX8G+yZl0QtBomC5aWXo0bhZAtGCH
         opqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnQYcMjJnypMorI9tn816n2nwNi2/MMnC3d/T81gQja8aX9eyazvtTSEwL3EMxUmuwGNu0YzazrGBl@vger.kernel.org
X-Gm-Message-State: AFuF++ngIAnAAW6R8qpSb2KUhYF+WG5wG/6C5zYLDfP6PjyiT6nW2xnl
	iHaazX5TWxbZa7lVLsyk7grgkjQGupf74SLL0KGoi9oU6KJXlMLjZfEZTOReh5BFHgVWcjiwnin
	IxaGINP313TEyBZSGg2O3pBkG/rwbyUGRHDSgYtRoZ6cStDxeXbMXXKXzLKPCkhY0
X-Gm-Gg: AR+sD11WhFOCn9g6EY8gLP8dWwSd4C6gr7GxjQLeHMh0A1jS5RZ/kkvx5HxaRM8pYh3
	8NmdbvILCki8fOPWmVuAUvWl8lsujHwhDRl9jno+ucTlrOgfv7dvoF9I33Ql5GXJza3zdOFyyhQ
	Zv4J9BPzZp71UzcQ9x+vIWRZTxnXjuP3PJ2evHxesubh9rHrAyyGzY97mAPDV931FA0hhD7EiEJ
	qonW2+Rk9OVhbsQY1uAIMgreCJ7SGiYcaL6asFzh2NxHvmHpByggPyIBl5Pz0DJ7+sFKwuo9GNb
	tQtztKUvUzOTjgBNFwR3vT8z0wxX5rUMNC/5gIJiBtJy75sNR3Zh7naPzy8ZeGujHCngg7w54y7
	TqSdg0PNPB4jNUsWYtBSTCc1Zex67jELBRsSO9dBJp9djWE+H64MZhhCC0LbUKDgPF/LxQoTKEx
	OvZo0MbgtiG6q8hEMCWI+amJ4=
X-Received: by 2002:a05:6820:83c2:10b0:6b1:4061:4193 with SMTP id 006d021491bc7-6b1a01f68a6mr13170119eaf.0.1787848717213;
        Thu, 27 Aug 2026 09:38:37 -0700 (PDT)
X-Received: by 2002:a05:6820:83c2:10b0:6b1:4061:4193 with SMTP id 006d021491bc7-6b1a01f68a6mr13170053eaf.0.1787848716826;
        Thu, 27 Aug 2026 09:38:36 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:36 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:03 +0530
Subject: [PATCH v4 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-2-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
 b=RdWF85ZMBnw5+LTfMUb/XNYcxEP72DT9HKX+qTDzgA+lEhyPfHN012Y7yPzPmglz+6fhKR4F0
 g2mkfFKmFy9Dy+hrx7vcKwg2/5OCovy3VzCQSV8WPXTRk3eBrdKwbof
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: ABBibUa3lfhmtsQ9kSF1pN70O8YwDU0u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXzntCowhGexwF
 JXiS9QwAS+DvnLBJjpdwW0rpL/Tdt4fugsk/f62tI0P0HvlppGFDKnmDVGuvro5MRYgGsQ7ScJE
 GpfkWsk8wwDI+iHlR1/oB1nEY+gn/KI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX8IjnTcK+lnlz
 hpEc6TqCJ+AtaFA9gScHBfC23AUeQOdOr7KYGzh0X9ZB/lqwGss1X68L8ZwSPH+k94WW/JJXLQg
 tDdOE4HaUJ3238g084jk/J+8hMR7kptabqmw9fema/IRrR1rVclUVl+45zHRSst2WKXir+6s7R0
 I37gA4bYZ4eMtsQFwUT5pOZ9hPU0Te6qeHn0fMGu0t2TQrhquCKqVnNHHH5AiI5XMBMbGQTs+7I
 MZNIwgkxGCOGJ/M9DEAAosSszJpAkmUCBtztDReLHeWlnrr/EY3Pl/qypDd/PP/TSEYsaw65K0d
 fOAOTossl+EpKJuQOBi/GcZpgzS2uF6Jmm6YQb2iKxf15C5zibir9HWSk5CCV0iRTKzjR1WVFCu
 dCyA2J5HC4GmLoAHpsN/gl4hskMp/+rpbSxa85+KOIwtXatH/+LDl64zcl5kCgfIU7vDd8WxMAX
 AIia/ROQHDvOWWfDCtw==
X-Proofpoint-GUID: ABBibUa3lfhmtsQ9kSF1pN70O8YwDU0u
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a90680e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the RPMh power domains for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0

