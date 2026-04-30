Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078373ACF05
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542334; cv=none; b=SYak7INY+VmvGu6q/DTtQw9rkF0aPToF6JLxj/sYten9U6Ht78kHkOCeC3xYM5AwUJxrgi7eu/Xcf72z3lZgzUk8P0JEcVq0OfFWZXF++XSJgRHsTjVxo8yRmhKilhFmyTN8xBtGFQ5+pZ8MXgponTNf7r+ZE525FN+L03gnsH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542334; c=relaxed/simple;
	bh=giFS3KGnbIJ9nQav9BA4XHkA/to082fHVKY1grUTwlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SN0EGsiGTOoJU7lx6ZokswNKHF5YCMW9iPPEkO6AqREJ9/ID9RLyFNAKJzsMUI8Y2wp9bWXvltDU898wH0hDNAme9nov71Iy78ivWQfxxcv7+lMrEPn0YCT1xIg4O2OLjTWZzOZ8tQhsVtt8E5IO1eji40m+cXf+kKZQHGVuqcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKg9TL6b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZcTxwma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKg9TL6b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZcTxwma"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U5pFen3992962
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=; b=lKg9TL6bRFRKEG+3
	9PJhD9DyBCV2srr0WZq9zNm7ZEXtyZA4yATmyTVCwHT1pkOvbp5DzvR7/X0lQiFK
	a6oCSseUWZTvTgWZPD7qtNLqg++UmC8PzBZru+tHzyUMp6AvQZzirKuQ9GluGC+7
	+uYZuHUTabquu2x2L4dA7ObEBErCpP6yHMFhy9ERpYNQ30N5xaEbCwwOgs3dnuu6
	DAWh3eaLDS9MUbS/rECLHIj4FdrNxZGNHVURp199YSSUhcR4xL0pQTGPidu6JW2k
	ijM3Flgag8N1V541WO3Y6spYIu5S/lyePJew12jJ4uMLe+h7to8tl+q4feyqC5yl
	sfgxzg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx9499w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:45:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9429f49cso941748b3a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542323; x=1778147123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=RZcTxwmaDSyIduSFjrwXDKIDv2Koykamun0ch4B0Y+PUrmPNIGEudhjYxtu2sliS/H
         mW32z24gEU25BXKAc9SvztjkfWXT0C5zK/MzZiIbknGnYs7KQPjlW9s1xaP0lDP4dnAm
         lqh1eItQSdjB0QFhllQT4dtAMATuQitzc29SIIZ9uwjL24lUV8Txu6gSekBtBCOoEaQk
         KBeqPkQwpwKzVhzPmrjMg7ya6E70RAYI04TI6/E8p8uKEW3Id2O4Nr3xPCmevleFDfUU
         o/U9s2d4BkVIB/wS3wSBRoT2tk1cP5vOlerPOoomaUH7ow2cN1ZelqhF67GLS/J0djGm
         onJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542323; x=1778147123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=P0dwsKaVdNtY1xxNSdba+MujgXIerWu1npBVguJlNZdCSMJXcxc7LyxdDvJFEsJfvq
         6vitNGdndNS/SY/i/21IW5v9coyD9VSiGCEozkIQjyMYvow+CEecyhCMKLp6oQi2VRDU
         DgRa25uQ0HoncPTxwFlM7UZm+ol8KWu1meuDv+ViRX8V+irlSjJzwLck0LiM2V0dpBUl
         n9gxp1Pgt0qR5FKUIUXaZv2bPxgAxeZdsS3e3neqQQBjrkOOSkABUmwiARWviixbXDl4
         lL2dzi31sPnyZny7nQvIr3toeXLdNrRUR1d03eUazsbXJJMq36BI37jwalramDy0ubxs
         N42g==
X-Forwarded-Encrypted: i=1; AFNElJ9HlyMzXUgV3kq7VOrbB0umyH1JrISKNYgZm1SpOnAQ3GBasEaQiVHwSQC8m9DWIJ/p+ndRdMlSpEnq@vger.kernel.org
X-Gm-Message-State: AOJu0YzleWtIx3jSsXpZOGcepI7LGT0pyCNcAqZtgL3cKsdrps5tVAP3
	t1vh0Nrm8JBpZECOCPFe+a6JhP3QFfd3ZbEAOu5K6voKrM9B6h4Z9xUXl/ihQqFzbb7cNAwV4TA
	MsgAT/4f/v07zJ9/+d7pKAdvGL++F/0qa0aFarDM4Ma2ooAAA/7j2kITtRjj/3Mfy
X-Gm-Gg: AeBDiesFKUgiO/Z1f5ZmdZDp0Di6gnku6k5h2Ax433rph9gr2hyZV8qtgN2PkHs/tQ0
	SMxUvjj29nsyIOlursIInUBx65KECEsoP/3Mc6B6yOw3sHfFvZUKWB3+Ugv/qKWQGbOvvZykqhc
	uoeRstqVLYBACY9rvDTU5yz/CcVVyoG7zCtXXdxJHAY6siZvnNLcc2HolbIV91pTf79TU23hgn0
	Uf0AZMU2HiyV94PebyDkutIsHwSavgRV2ZrmLuq+2lZo4G+EZl5crmox3qdu64gFTic5h6HHpDi
	aBMl0V64aCqhoXfO1sVaLN3DOJv6uDd6ZpJUslVAH9jXX1nVRkYr8cl03n8svo1+poXwf374a4h
	cTLkWfkmj8gh15FRN4HPnnIT94oCp6PfQ979GYb4ANHtO0XcLomgz892AxjTICg==
X-Received: by 2002:a05:6a00:4c9a:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-834fdbff498mr2657147b3a.39.1777542322891;
        Thu, 30 Apr 2026 02:45:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c9a:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-834fdbff498mr2657098b3a.39.1777542322412;
        Thu, 30 Apr 2026 02:45:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:22 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:56 +0530
Subject: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-1-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=941;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=es5ERD8ECRizLcUcsRpPU+cL6+81oQXVvOctJZKt3TI=;
 b=e/hvXR8qA8fACPrF0gQrVbkL0akHmedcGq3djfT2QwJruwyoT7R+t2fQs1m5zvtqKEomV+Yxp
 roVpjQ5FD6XAs2UXsIAnCxyC5Tb5vSbleG4Swp4OD84EmUFQFoK/eaR
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfXxerw8yPEkQw6
 /7yPdap8jF6+ejfoG/X0fUZpU7LXYMUpvFgKj2F+URaIBpZnMR0d4zCmNZK3tbTJtfQrDcyTTqi
 RPxIDEHYALrbI0MkyfOl3wVRK+fSpgjMtb4TKdEnPzsMJAnATJNcjk3MMyh7Udh2XcsRHdtliUM
 6GunpsVKYfDxm2+oXzh50i71/bldiHjtUJ1HkXI9IaxZ1gq2xCgwdztjRSbppxxfNYXMxwlHaZK
 H+BA6SH4v3pABtF+5AOnZnZ4ncbOK/NK+/DxiEA7LJfWL0pwIRYaKB5SehS1ioXmxqr6nfH8k9g
 4STZxgTvjYpEwm7N73u/cITtEfZaqy0hzsl5rmcBkLMSienjt2YimshKMfBEZcoddBoWWpPK5we
 0OQouxqnMPWF2hMDxDMlAxLD0LGvWJwZ7HuF7KE0A/gE9u48iW4Mx/ExmNRSsG273PAwAOddNhd
 83nn+lDsJh80eKt9jow==
X-Proofpoint-ORIG-GUID: TAZMFebeQvqtzYpNo3nwCpzgkkcdUl9M
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f324bc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=69wgM2fLTQVZxHge9JEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: TAZMFebeQvqtzYpNo3nwCpzgkkcdUl9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300096

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra rpm-smd device.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 270bcd079f8861d6bf9f3058e188895af33370e1..bd1d32898461c48ebbdee8d6c48046a08e39cb0d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -57,6 +57,7 @@ properties:
               - qcom,rpm-qcm2290
               - qcom,rpm-qcs404
               - qcom,rpm-sdm660
+              - qcom,rpm-shikra
               - qcom,rpm-sm6115
               - qcom,rpm-sm6125
               - qcom,rpm-sm6375

-- 
2.34.1

