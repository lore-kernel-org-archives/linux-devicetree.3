Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548037;
	b=Qsc4HO7x8yyxVAP3dqUgdaQFZkteRyhiqoFCNWbO1YwvtjyYY9SoqRJLKQPex13Pfb4G
	 IHuNdXFJjlrvz3sNI2P7Uc7wKBhXL7xNTCWPKb3Uh2cZjOyP9nIGKi+Y7E2DaraEHPYX+
	 8+BeIjFSeTkQ8nsEVhUeKUYNX3X/ZEHLrCzJcv2Th4H8xW5huTjig9tO0u4LuJS4hWcnj
	 ogFFS0kp+fpVzVt7+ENhYXB9HWgfZ+wVksQ4c89fxsXqbOB133N6a1xXu8DpFdJwBFXsD
	 yWvpCX+wu3q/zU2G5KMvlls0rUKfZBb300YGw5rq4Ty2uXRDJmfQPEF8/Oc3Yh4ybZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
	b=KcwYNCBtLkLweLczw7suGbJW5nJL6k/Zj+v/unebbmvMSBYBoGDdKoHD3zM4mei9RJjM
	 d+0BgRiglugoazTIB7UzSNjGW68Sa2GCpTEZZo/R2oZOe6ZUPurRi2dKFRzVzy56Xo0bT
	 91wNZe7UkPTBSBuNuKcGzjgBvIGdiQO4dcQaFHFhalxAbObQiYMwVJKLmNY8vhtSeVs+2
	 3Yg+Tvx11gWIQQp1Cm1syLfiTNhxwKwrqEhoSMXWAPNDu7PYv0BrPdO2r+KbNHSxTU377
	 F9nvqI/NHVSFcidvTMbx9WkC/sdsDd2Bt/+QXERHcLTIhpjMwcy858uTZzna7r/jqvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZNmtI40X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb5+tIGQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859F606A33A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D859F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZNmtI40X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb5+tIGQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Dqf1973256
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=; b=ZNmtI40XUta6mwHm
	mh/qAmVhftZn/DZ7DEYWNJwDVyzXJj/AIxB8PBaOfRhN+Lj0JUDUig05+bkcCgib
	splyu9LROvBf8WJOCxWFDSElg7V/34r+QfFdwUh7hXcOyXqBh38JOYJRprbyp1kf
	dgY0ANkHPVx8FTwukEAcE0x76NajKU69gr1qrkv49oVXY0eA/Vie4Z0eEtd/ZXsj
	xsJzq3hD/GGGzN4aX7/fktwgM0R0lM7t+r4U/agZ0vUAIVRe5WrYTsrYK0TylbYK
	h0O3GOHIgeTydZveFR2WJLuvmdl6purKpUuRuxYrYQhszDkHl9XdAwd4eHmDKKMm
	a+CeRw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bamwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:33:55 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45e6091d8a1so385307fac.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548035; x=1795152835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=cb5+tIGQJz4623R/7xz/bpHAhS9P+r6EfKAEqx0AjL54rkmhXVz8/wBoJlZvTQGIxu
         sqJ9mt4y4xmcEyk/4cXpgKKLXCMeL+Epmq+Cdltyt4ADcTJdq5f/u/byLFxsssq7kbvj
         zF7Wr92KXZlpL7vy22Ez6UlMt35XDCYHX1qHmBthbCepKK5StOZaugbAgv1YoqmU4dVF
         nPnOuFUdnRCgqRXSqdo4/Gp8HGbY3qUyc69iYGXBOrlWjvsS7PPZFRkI3z+BqV6EHswp
         YYiKwC+m1F5B0YN5mSr2CLBaGi0QA+QiVj6h24plhDjhDCWKFICwD3JZpQJBJVT5MM/T
         GpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548035; x=1795152835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=Dvas81DSHL4MsW4Xj8ji1Xtf+MHw3Chp18CV4YNZZkje/VwGel1RPT8GlQmdl61rA1
         yVOGAAOn+fKLGgRY1JO0LLpuqewwmyEIUtQ8TwFOZRCWzPce2+B7U+kJyDW8U1ybgzBl
         YEnvW9t6pSXT+oPtzj05QB+0bO+zLATa94jkdtjli+dcE2K3RfGo65qvwQ+RUlQfeMZM
         NKE4zljF4cNtm5Gq92xbqgykH7AuKuWe40uY6oyppyb8xU2yqAJJ2zBJT+G0PX2zVkdi
         pjNQp0y99Cy2EwXivzB7+PX+Fo7RAVpNuaAdmKSZCkj+Th9DjVqK5/lkAmexQwQF/1f5
         5F7A==
X-Forwarded-Encrypted: i=1; AL+hErHsC/0eQJW+i/c2u60LKP1tVrhyuiQIVin8qeXGpTReRfpcDh/ffxpMkcQGs7PeQ1DtwjIfDXAhUFRL@vger.kernel.org
X-Gm-Message-State: APuU4Z/cmijU+iPZbT/CbUutz6raGzdpjx1SXrUa+ayat4a9psMJwT/s
	gByAS/UY34fxCCsxOT/BMZGs3BkTdbyjcV+u6HIklUzl/eC9N/62fJb5CYOoF2vdAdusmiA+Lbu
	1XsEx7vJfumtU/jzPWI+aUGMDOFzb5o8jxXealZ9BLj0nhC/VXryHoGR6j2MosWMa
X-Gm-Gg: AYBFou0h8IeB8/P1CPHUxGH4kofmETW0TxbeD+5k1IsHsMWphOoWJwCKO8BxZUP2xQb
	JqDKD/tOX8XWjI037io12cLPeGTvviBWNNX87FOnUGDzIm8Y6tVpCAWdrT3dNfU6lacU/IL6BrA
	TsUURm2sPI3DH8SjNDXH1Z8PaCT0IAOpgSXbIZ2YgvAGVgyk+cYOMAtBaOVsUAa94fDrHYh4lhL
	u5SSEEYTE8fTro6ejf7JAsDijGgWkx/KNBCMsaJvdd+9SPxQjH/vBS8yRMk0A3JoYfLfPgfCac5
	z8GQuOQBk/ymwuzCE7Q1nHh2k2yAz3xB/C/IBAOCuWGVaOSSMQVCHlpSGVsPeW9TYP1DRSv3MyI
	QwdbG8+8jxsqP9Gkk/wpxxZst65g93KrwA/rKcKihyXm4GMFZ/R0rNZntzOZGoVSqpRyqwb/6BG
	YFlo1isiVvGunXanLqJtmrvVweoJVoJ0e1SY3p0eqZwKTBesCnxuUs0b7vs6DV
X-Received: by 2002:a05:6870:1d0b:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4afdf49d5b7mr1423591fac.20.1794548035170;
        Thu, 12 Nov 2026 21:33:55 -0800 (PST)
X-Received: by 2002:a05:6870:1d0b:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4afdf49d5b7mr1423571fac.20.1794548034659;
        Thu, 12 Nov 2026 21:33:54 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:33:54 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:33 -0800
Subject: [PATCH v25 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-kaanapali-camss-v25-1-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6a144 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=quhYwmWePwexk_oO3l8A:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 96hvwMok7Q5kFcDektIR95Vh6m7gLhW8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXwPZNz1jqx1Vm
 CNatLp5TCXOyaFX6eWUBzZMVP0nOzfiwZVTBMIc8KKMbbYdl3DvHWCfejKaIjZJTAFwPE43qz+L
 BZNgpXAYEhYK8XNcaStzzs+Nf1grLgxDfhk5yLIUqtsK31jMsiGbO58ULVIYQcjtyrZuyZuiqt2
 SrYIi0qqZGikhKYzulfkVOcJy9d/cT+f/3DbVzk6rfxTvz/1SLQQUQSM6+45R6L4mForO6linPB
 F9dxizSCcq+sYi2ZwvEjrwB5cHr8hrt1U8uEg2SAA/KX8+nGpkVP59fYxdcZah6SXOT3u46+Y6F
 3GRp9c0lOF9YjaVqmt59BJhaUTIlTnP0J1O66GbFyB+4a+MYD5rjpq2l6oklkvmtUbcT0Wkqbqj
 e2KC6tfgurxlA3T8OU23k/AWfz/Ls5g66xsjuXRRKkSQhIl0jqe5LyDz2PyXk2Y2YhkQwMKhc9U
 G9uZ79BzqOBUqAIvh7A==
X-Proofpoint-ORIG-GUID: 96hvwMok7Q5kFcDektIR95Vh6m7gLhW8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXxUZxZRb2EMDH
 ylkL3/SFs9F6m84cHvJ5j2biBQl1b2jTJaBriIfg8zGIvc9T46kC2N8SGKvrjUobVB4TzWRT7i+
 nnqWXoZbUGI9mFqfpIG1vG/u56+5JZ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add "qcom,kaanapali-csi2-phy" as a standalone compatible. Its common
status register offset differs from x1e80100, so it cannot fall back
to that compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

